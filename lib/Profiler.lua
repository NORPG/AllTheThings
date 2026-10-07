-- Short-lived, opt-in performance captures for ATT's explicit instrumentation.
-- Keep the disabled path free of timers, table allocations, and API calls.
---@type string, table
local appName, app = ...;

local math_ceil, math_huge, string_format, table_concat, table_sort, type, tonumber
	= math.ceil, math.huge, string.format, table.concat, table.sort, type, tonumber;
local GetTimePreciseSec, C_Timer_After = GetTimePreciseSec, C_Timer.After;

local DEFAULT_DURATION = 30;
local MAX_DURATION = 300;
local MAX_METRICS = 64;
local MAX_SCOPES = 512;
local MAX_STACK_RECORDS = 128;
local LEVEL_NAMES = { "overview", "components", "workload", "jobs", "timeline", "diagnostics" };
local KNOWN_MODULES = { runner = true, events = true, startup = true, collection = true, transmog = true,
	costs = true, search = true, tooltip = true, windows = true, cache = true, inventory = true, upgrade = true };
local MAX_ID_BYTES = 96;
local BUCKET_LIMITS = { 0.25, 0.5, 1, 2, 4, 8, 16, 33, 66, 100, 250, 500, 1000 };

---Validate a capture duration without changing active or scheduled capture state.
---@param durationSeconds number|string? Seconds from 1 to 300, including numeric strings; nil selects the 30-second default.
---@return number? seconds Accepted duration; nil for an invalid type, non-finite value, or out-of-range duration.
---@return string? errorMessage Validation message on failure; nil when the duration is accepted.
local function ValidateDuration(durationSeconds)
	if durationSeconds ~= nil and type(durationSeconds) ~= "number" and type(durationSeconds) ~= "string" then
		return nil, "Duration must be between 1 and 300 seconds.";
	end
	local seconds = tonumber(durationSeconds) or (durationSeconds == nil and DEFAULT_DURATION);
	if not seconds or seconds ~= seconds or seconds < 1 or seconds > MAX_DURATION then
		return nil, "Duration must be between 1 and 300 seconds.";
	end
	return seconds;
end

---@alias ATTProfilerMetricKind 'time'|'counter'

---Aggregated execution or wall-clock durations for a single stable metric ID.
---@class ATTProfilerTimingMetric
---@field id string Stable metric ID, at most 96 bytes.
---@field kind 'time'
---@field count integer Number of accepted duration samples.
---@field total number Sum of sample durations in milliseconds.
---@field max number Largest sample duration in milliseconds.
---@field units number Sum of valid, nonnegative work-unit counts supplied with samples.
---@field hasUnits boolean? Whether at least one sample supplied a valid work-unit count.
---@field buckets table<integer, integer> Sparse histogram indexed by duration bucket.
---@field sampled boolean? True for sampled diagnostics; totals and percentiles describe accepted samples only.

---Accumulated nonnegative increments for a single stable metric ID.
---@class ATTProfilerCounterMetric
---@field id string Stable metric ID, at most 96 bytes.
---@field kind 'counter'
---@field count number Sum of accepted increments; fractional increments are allowed.
---@field sampled boolean? True when increments were periodically sampled instead of fully counted.

---@alias ATTProfilerMetric ATTProfilerTimingMetric|ATTProfilerCounterMetric
---@alias ATTProfilerAddonMetricName 'RecentAverageTime'|'CountTimeOver5Ms'|'CountTimeOver10Ms'

---Optional Blizzard metrics sampled at a capture boundary, when its profiler is available.
---@class ATTProfilerAddonSnapshot
---@field RecentAverageTime number? Rolling whole-addon average duration in milliseconds.
---@field CountTimeOver5Ms number? Cumulative whole-addon ticks exceeding five milliseconds.
---@field CountTimeOver10Ms number? Cumulative whole-addon ticks exceeding ten milliseconds.

---Bounded, in-memory capture service for explicitly instrumented ATT work.
---Callers must retain SessionID when timing work that can span a capture change.
---@class ATTProfiler
---@field Enabled boolean Whether Record and Count currently accept samples.
---@field Config ATTProfilerConfig? Copied session configuration; callers must treat this table and its filters as read-only.
---@field GetCurrentContext fun(): string? Optional coroutine-local job context provider installed by Runner instrumentation.
---@field SessionID integer Generation incremented by Reset and every successful Start.
local Profiler = { Enabled = false, SessionID = 0 };
app.Profiler = Profiler;

---@type table<string, ATTProfilerMetric>, integer, integer
local metrics, metricCount, droppedSamples = {}, 0, 0;
local detailMetricCount, detailDroppedSamples = 0, 0;
---@type table<string, ATTProfilerScope>
local registry = {};
local scopeCount, rejectedScopes = 0, 0;
---@type ATTProfilerScope
local disabledScope = { id = "profiler.registry.full", module = "profiler", minLevel = 6,
	kind = "time", enabled = false, sampleSeen = 0 };
local sessionListeners, reportProviders = {}, {};
local timeline, timelineNext, timelineCount, timelineOverwritten = {}, 1, 0, 0;
local stackRecords, stackBytes, stackDropped, sampledCalls, skippedCalls, extensionErrors = {}, 0, 0, 0, 0, 0;
---@type number?, number?, number?, string?
local startedAt, endedAt, durationLimit, stoppedReason;
---@type ATTProfilerAddonSnapshot?, ATTProfilerAddonSnapshot?
local addonMetricAtStart, addonMetricAtStop;

---Reuse an aggregate or allocate within the independent overview and detail ID limits.
---An ID cannot be shared by timing and counter samples. New IDs beyond their applicable
---capacity increment the overview or detail dropped-sample count and return nil.
---@param id string Stable capture metric ID already validated by the caller.
---@param kind ATTProfilerMetricKind Aggregation kind; an existing ID must use the same kind.
---@param detail boolean? Whether this ID consumes the independent detail metric budget rather than the 64 overview IDs.
---@param sampled boolean? Whether this metric contains periodic diagnostic samples rather than complete call totals.
---@return ATTProfilerMetric? metric Existing or newly allocated metric; nil on a kind mismatch or when a new ID would exceed the limit.
---Timing overload: returns a timing metric containing duration, work-unit, and histogram aggregates, or nil when registration is rejected.
---@overload fun(id: string, kind: 'time', detail?: boolean, sampled?: boolean): ATTProfilerTimingMetric?
---Counter overload: returns a counter metric containing accumulated increments, or nil when registration is rejected.
---@overload fun(id: string, kind: 'counter', detail?: boolean, sampled?: boolean): ATTProfilerCounterMetric?
local function NewMetric(id, kind, detail, sampled)
	local metric = metrics[id];
	if metric then return metric.kind == kind and metric or nil; end
	if detail then
		if detailMetricCount >= Profiler.Config.metricBudget then
			detailDroppedSamples = detailDroppedSamples + 1;
			return nil;
		end
		detailMetricCount = detailMetricCount + 1;
	else
		if metricCount >= MAX_METRICS then
			droppedSamples = droppedSamples + 1;
			return nil;
		end
		metricCount = metricCount + 1;
	end
	metric = { id = id, kind = kind, count = 0, sampled = sampled };
	-- The timing fields are initialized below before the metric can escape.
	---@cast metric ATTProfilerMetric
	if kind == "time" then
		metric.total = 0;
		metric.max = 0;
		metric.units = 0;
		metric.buckets = {};
	end
	metrics[id] = metric;
	return metric;
end

-- Blizzard's whole-addon metrics provide context beside ATT's own scopes.
-- RecentAverageTime is rolling; threshold counts can be compared at session boundaries.
---@type ATTProfilerAddonMetricName[]
local AddonMetricNames = { "RecentAverageTime", "CountTimeOver5Ms", "CountTimeOver10Ms" };
---Read available whole-addon Blizzard metrics without requiring or enabling its profiler.
---Unavailable APIs, disabled profiling, API errors, and invalid values are skipped.
---@return ATTProfilerAddonSnapshot? snapshot Available whole-addon boundary values; nil when profiling is unavailable, disabled, or supplies no valid metrics.
local function GetAddonSnapshot()
	local api = C_AddOnProfiler;
	local metricEnum = Enum and Enum.AddOnProfilerMetric;
	if not api or type(api.GetAddOnMetric) ~= "function" or not metricEnum then return; end
	if type(api.IsEnabled) == "function" then
		local ok, enabled = pcall(api.IsEnabled);
		if not ok or not enabled then return; end
	end
	---@type ATTProfilerAddonSnapshot
	local snapshot = {};
	for _, name in ipairs(AddonMetricNames) do
		local metric = metricEnum[name];
		if type(metric) == "number" then
			local ok, value = pcall(api.GetAddOnMetric, appName, metric);
			if ok and type(value) == "number" and value >= 0 and value < math_huge then
				snapshot[name] = value;
			end
		end
	end
	if next(snapshot) then return snapshot; end
end

---@class ATTProfilerConfig
---@field seconds number Duration limit in seconds.
---@field level integer Selected cumulative level from one through six.
---@field include string Canonical comma-separated detail modules, or "all".
---@field exclude string? Canonical comma-separated excluded detail modules.
---@field includeModules table<string, boolean>? Parsed detail inclusion set; nil includes every module.
---@field excludeModules table<string, boolean> Parsed detail exclusion set.
---@field sampleEvery integer Periodic sampling interval for Level 6 scopes; lower levels always collect every call.
---@field slowThresholdMs number Minimum execution duration retained in the Level 5 timeline.
---@field metricBudget integer Maximum distinct detail metric IDs; overview retains its separate 64-ID allowance.
---@field jobBudget integer Maximum tracked jobs per capture.
---@field timelineBudget integer Maximum retained timeline entries in the circular buffer.
---@field stackByteBudget integer Maximum retained diagnostic caller-stack bytes per capture.
---@field stacks boolean Whether sampled Level 6 begins may retain bounded caller stacks.

---@class ATTProfilerOptions
---@field include string? Comma-separated module IDs; Levels 4 through 6 require an explicit value, including "all".
---@field exclude string? Comma-separated module IDs whose details should be omitted.
---@field sampleEvery integer? Level 6 sampling interval from one to 10000; defaults to ten.
---@field slowThresholdMs number? Finite nonnegative timeline duration threshold; defaults to ten milliseconds.
---@field metricBudget integer? Detail metric capacity from zero to 1024; defaults to 128.
---@field jobBudget integer? Tracked job capacity from zero to 1024; defaults to 128.
---@field timelineBudget integer? Timeline capacity from zero to 4096; defaults to 256.
---@field stackByteBudget integer? Retained caller-stack bytes from zero to 65536; defaults to 8192.
---@field stacks boolean? Enable sampled diagnostic caller-stack capture; defaults to false.

---@class ATTProfilerScope
---@field id string Stable metric ID shared with the report.
---@field module string Stable owning subsystem used by include and exclude filters.
---@field minLevel integer First cumulative capture level that enables this scope.
---@field kind ATTProfilerMetricKind Timing or counter aggregation.
---@field description string? Human-readable meaning of this scope.
---@field units string? Meaning of work-unit totals for timing scopes.
---@field enabled boolean Precomputed capture gate; false while recording is disabled or the scope is filtered out.
---@field sampleSeen integer Number of eligible diagnostic calls in the current capture.

---Parse a module selection without retaining caller-owned data or accepting unknown IDs.
---@param value string? Comma-separated module selection; nil uses the supplied default.
---@param defaultAll boolean Whether an omitted selection includes every module.
---@return table<string, boolean>? modules Parsed module set; nil denotes all modules.
---@return string? canonical Canonical selection text on success.
---@return string? errorMessage Validation explanation on failure.
local function ParseModules(value, defaultAll)
	if value == nil then if defaultAll then return nil, "all"; end return {}, nil; end
	if type(value) ~= "string" or value == "" then return nil, nil, "Module filters must be nonempty comma-separated names."; end
	local modules, names = {}, {};
	for part in (value .. ","):gmatch("(.-),") do
		local name = part:match("^%s*(.-)%s*$"):lower();
		if name == "all" then
			if value:match("^%s*[Aa][Ll][Ll]%s*$") then return nil, "all"; end
			return nil, nil, "Use all alone in a module filter.";
		end
		if not KNOWN_MODULES[name] then return nil, nil, "Unknown profile module: " .. name; end
		if not modules[name] then modules[name] = true; names[#names + 1] = name; end
	end
	table_sort(names);
	return modules, table_concat(names, ",");
end

---Validate and copy all capture policy before changing current or saved state.
---@param durationSeconds number|string? Capture duration, defaulting to thirty seconds.
---@param level number|string? Level one through six or a documented level name; nil selects overview.
---@param options ATTProfilerOptions? Optional detail filters, sampling policy, and bounded capacities.
---@return ATTProfilerConfig? config Independent validated session policy; nil on any invalid input.
---@return string? errorMessage Explanation of invalid duration, level, filter, or option.
local function ValidateConfig(durationSeconds, level, options)
	local seconds, errorMessage = ValidateDuration(durationSeconds);
	if not seconds then return nil, errorMessage; end
	if level == nil then level = 1;
	elseif type(level) == "string" then
		local named = level:lower();
		level = tonumber(level);
		if not level then
			for i, name in ipairs(LEVEL_NAMES) do if name == named then level = i; break; end end
		end
	end
	if type(level) ~= "number" or level ~= math.floor(level) or level < 1 or level > 6 then
		return nil, "Level must be 1 to 6 or overview/components/workload/jobs/timeline/diagnostics.";
	end
	if options ~= nil and type(options) ~= "table" then return nil, "Profile options must be a table."; end
	options = options or {};
	local accepted = { include = true, exclude = true, sampleEvery = true, slowThresholdMs = true,
		metricBudget = true, jobBudget = true, timelineBudget = true, stackByteBudget = true, stacks = true };
	for name in pairs(options) do if not accepted[name] then return nil, "Unknown profile option: " .. tostring(name); end end
	if level >= 4 and options.include == nil then return nil, "Levels 4 to 6 require include=<modules> (or include=all)."; end
	local includeModules, include, filterError = ParseModules(options.include, true);
	if filterError then return nil, filterError; end
	local excludeModules, exclude;
	excludeModules, exclude, filterError = ParseModules(options.exclude, false);
	if filterError then return nil, filterError; end
	-- Excluding all is represented by a set of every registered module.
	if options.exclude ~= nil and excludeModules == nil then
		excludeModules = {};
		for module in pairs(KNOWN_MODULES) do excludeModules[module] = true; end
	end
	---@type ATTProfilerConfig
	local config = { seconds = seconds, level = level, include = include or "all", exclude = exclude,
		includeModules = includeModules, excludeModules = excludeModules or {}, sampleEvery = 10,
		slowThresholdMs = 10, metricBudget = 128, jobBudget = 128, timelineBudget = 256,
		stackByteBudget = 8192, stacks = false };
	local budgets = { sampleEvery = { 10, 1, 10000 }, metricBudget = { 128, 0, 1024 },
		jobBudget = { 128, 0, 1024 }, timelineBudget = { 256, 0, 4096 }, stackByteBudget = { 8192, 0, 65536 } };
	for name, bounds in pairs(budgets) do
		local value = options[name];
		if value == nil then value = bounds[1]; end
		if type(value) ~= "number" or value ~= value or value < bounds[2] or value > bounds[3] or value ~= math.floor(value) then
			return nil, name .. " must be an integer from " .. bounds[2] .. " to " .. bounds[3] .. ".";
		end
		config[name] = value;
	end
	config.slowThresholdMs = options.slowThresholdMs;
	if config.slowThresholdMs == nil then config.slowThresholdMs = 10; end
	if type(config.slowThresholdMs) ~= "number" or config.slowThresholdMs ~= config.slowThresholdMs
		or config.slowThresholdMs < 0 or config.slowThresholdMs == math_huge then
		return nil, "slowThresholdMs must be finite and nonnegative.";
	end
	if options.stacks ~= nil and type(options.stacks) ~= "boolean" then return nil, "stacks must be true or false."; end
	config.stacks = options.stacks == true;
	return config;
end

---Test a module against the copied detail filters; overview ignores these filters.
---@param module string Owning subsystem being considered for detailed instrumentation.
---@return boolean included True when the selected detail range includes the module.
local function IncludesModule(module)
	local config = Profiler.Config;
	return config ~= nil and config.exclude ~= "all" and not config.excludeModules[module]
		and (config.includeModules == nil or config.includeModules[module] == true);
end

---Notify extensions without allowing a broken extension to interrupt ATT or capture state changes.
---@param event string Lifecycle phase: reset, start, stopping, or stop.
local function NotifySession(event)
	for _, listener in ipairs(sessionListeners) do
		if not pcall(listener, event, Profiler.SessionID, Profiler.Config) then extensionErrors = extensionErrors + 1; end
	end
end

---Register a fixed metric once, before hot paths begin calling its precomputed gate.
---Conflicting metadata raises a developer error. Capacity exhaustion returns a shared disabled
---handle so instrumentation limits cannot prevent ATT's actual work from executing.
---@param id string Stable metric ID from one to 96 bytes.
---@param module string Stable module ID, using lowercase letters, digits, periods, underscores, or hyphens.
---@param minLevel integer First cumulative level from one to six that accepts this scope.
---@param kind ATTProfilerMetricKind Aggregation type: time or counter.
---@param description string? Meaning of the measurement for documentation and registry inspection.
---@param units string? Meaning of work units supplied to timing samples.
---@return ATTProfilerScope scope Registered handle updated at capture boundaries, or a shared disabled handle when registry capacity is exhausted.
function Profiler.RegisterScope(id, module, minLevel, kind, description, units)
	assert(type(id) == "string" and #id > 0 and #id <= MAX_ID_BYTES, "Invalid profile scope ID");
	assert(type(module) == "string" and module:match("^[a-z0-9_.%-]+$"), "Invalid profile module");
	assert(type(minLevel) == "number" and minLevel >= 1 and minLevel <= 6 and minLevel == math.floor(minLevel), "Invalid profile scope level");
	assert(kind == "time" or kind == "counter", "Invalid profile scope kind");
	local existing = registry[id];
	if existing then
		assert(existing.module == module and existing.minLevel == minLevel and existing.kind == kind
			and existing.description == description and existing.units == units, "Conflicting profile scope metadata: " .. id);
		return existing;
	end
	if scopeCount >= MAX_SCOPES then rejectedScopes = rejectedScopes + 1; return disabledScope; end
	scopeCount = scopeCount + 1;
	KNOWN_MODULES[module] = true;
	local scope = { id = id, module = module, minLevel = minLevel, kind = kind,
		description = description, units = units, enabled = false, sampleSeen = 0 };
	scope.enabled = Profiler.Enabled and Profiler.Config.level >= minLevel and (minLevel == 1 or IncludesModule(module));
	registry[id] = scope;
	return scope;
end

---Register an internal lifecycle observer, normally at addon load time.
---@param listener fun(event:string,sessionID:integer,config:ATTProfilerConfig?) Callback receiving reset/start/stopping/stop; config is read-only by contract.
function Profiler.AddSessionListener(listener)
	assert(type(listener) == "function", "Profile session listener must be a function");
	sessionListeners[#sessionListeners + 1] = listener;
end

---Register an internal report section writer without exposing mutable metric aggregates.
---@param provider fun(lines:string[]) Callback appending a bounded section to the report's string array.
function Profiler.AddReportProvider(provider)
	assert(type(provider) == "function", "Profile report provider must be a function");
	reportProviders[#reportProviders + 1] = provider;
end

---Return the selected level while recording is active.
---@return integer level Active level from one to six, or zero when capture is stopped or reset.
function Profiler.GetLevel()
	return Profiler.Enabled and Profiler.Config.level or 0;
end

---Gate non-scope diagnostics using the active level and optional subsystem selection.
---@param level integer Minimum cumulative level required by the caller.
---@param module string? Optional detail module; ignored for overview instrumentation.
---@return boolean enabled True when recording meets the level and detail filter requirements.
function Profiler.IsLevelEnabled(level, module)
	return Profiler.Enabled and Profiler.Config.level >= level and (level == 1 or module == nil or IncludesModule(module));
end

---Decide periodic Level 6 sampling before any clock read, stack capture, or allocation.
---@param scope ATTProfilerScope Eligible registered diagnostic scope.
---@return boolean accepted True for every first and subsequent sampleEvery-th call.
local function AcceptDiagnostic(scope)
	if scope.minLevel < 6 then return true; end
	scope.sampleSeen = scope.sampleSeen + 1;
	if (scope.sampleSeen - 1) % Profiler.Config.sampleEvery == 0 then sampledCalls = sampledCalls + 1; return true; end
	skippedCalls = skippedCalls + 1;
	return false;
end

---Read a short job-origin label only when diagnostics need it.
---@return string? context Bounded origin text, or nil when no job context is available.
local function CurrentContext()
	if Profiler.GetCurrentContext then
		local context = Profiler.GetCurrentContext();
		if type(context) == "string" then return context:gsub("[\r\n\t]", " "):sub(1, 192); end
	end
end

---Append an ordered Level 5 diagnostic event to the bounded circular timeline.
---@param id string Stable operation ID or registered scope ID, at most 96 bytes.
---@param kind string Short event type such as slow, queued, complete, failed, or canceled.
---@param durationMs number? Finite nonnegative execution or lifecycle duration in milliseconds.
---@param context string? Optional job-origin text, truncated to 192 bytes; nil uses the active job context.
function Profiler.AddTimeline(id, kind, durationMs, context)
	if not Profiler.IsLevelEnabled(5) or Profiler.Config.timelineBudget == 0 then return; end
	if type(id) ~= "string" or #id == 0 or #id > MAX_ID_BYTES or type(kind) ~= "string" then return; end
	if durationMs ~= nil and (type(durationMs) ~= "number" or durationMs < 0 or durationMs ~= durationMs or durationMs == math_huge) then return; end
	local entry = { at = (GetTimePreciseSec() - startedAt) * 1000, id = id, kind = kind:sub(1, 32),
		duration = durationMs, context = type(context) == "string" and context:gsub("[\r\n\t]", " "):sub(1, 192) or CurrentContext() };
	if timelineCount < Profiler.Config.timelineBudget then timelineCount = timelineCount + 1;
	else timelineOverwritten = timelineOverwritten + 1; end
	timeline[timelineNext] = entry;
	timelineNext = timelineNext % Profiler.Config.timelineBudget + 1;
end

---Begin an eligible timing scope, preserving its session generation across asynchronous work.
---Levels 1 through 5 allocate no timing token. Level 6 optionally stores a sampled caller stack.
---@param scope ATTProfilerScope Registered timing handle; disabled or filtered handles return immediately.
---@return number? startedAt Absolute clock time in seconds for an accepted sample; nil when disabled or skipped.
---@return integer? sessionID Capture generation required by Finish; nil when no sample was started.
function Profiler.Begin(scope)
	if not Profiler.Enabled or not scope.enabled or scope.kind ~= "time" or not AcceptDiagnostic(scope) then return; end
	local start = GetTimePreciseSec();
	if scope.minLevel == 6 and Profiler.Config.stacks then
		local available = Profiler.Config.stackByteBudget - stackBytes;
		if available <= 0 or #stackRecords >= MAX_STACK_RECORDS or type(debugstack) ~= "function" then
			stackDropped = stackDropped + 1;
		else
			local ok, stack = pcall(debugstack, 2, 8, 0);
			if ok and type(stack) == "string" then
				stack = stack:sub(1, available);
				stackRecords[#stackRecords + 1] = { at = (start - startedAt) * 1000, id = scope.id, text = stack, context = CurrentContext() };
				stackBytes = stackBytes + #stack;
			else stackDropped = stackDropped + 1; end
		end
		-- Diagnostic setup is observer work; exclude stack acquisition and storage from this scope's execution timing.
		start = GetTimePreciseSec();
	end
	return start, Profiler.SessionID;
end

---Aggregate a registered scope sample without consuming overview capacity for detail scopes.
---@param scope ATTProfilerScope Registered timing handle validated by Finish.
---@param durationMs number Finite nonnegative observed duration in milliseconds.
---@param units number? Optional finite nonnegative work count for this execution.
local function RecordScope(scope, durationMs, units)
	local metric = NewMetric(scope.id, "time", scope.minLevel > 1, scope.minLevel == 6);
	if not metric then return; end
	metric.count = metric.count + 1;
	metric.total = metric.total + durationMs;
	if durationMs > metric.max then metric.max = durationMs; end
	if type(units) == "number" and units >= 0 and units < math_huge then metric.units = metric.units + units; metric.hasUnits = true; end
	local bucket = #BUCKET_LIMITS + 1;
	for i = 1, #BUCKET_LIMITS do if durationMs <= BUCKET_LIMITS[i] then bucket = i; break; end end
	metric.buckets[bucket] = (metric.buckets[bucket] or 0) + 1;
end

---Finish a timing scope only in the capture that accepted its begin.
---Record execution slices around individual resumes; callers must not include frame waits accidentally.
---@param scope ATTProfilerScope Registered timing scope originally passed to Begin.
---@param start number? Accepted absolute start time; nil is a cheap no-op.
---@param sessionID integer? Generation returned by Begin; stale or missing generations are rejected.
---@param units number? Optional finite nonnegative work units completed by this sample.
function Profiler.Finish(scope, start, sessionID, units)
	if not start or not Profiler.Enabled or not scope.enabled or scope.kind ~= "time" or sessionID ~= Profiler.SessionID then return; end
	local durationMs = (GetTimePreciseSec() - start) * 1000;
	if durationMs < 0 or durationMs ~= durationMs or durationMs == math_huge then return; end
	RecordScope(scope, durationMs, units);
	if Profiler.IsLevelEnabled(5, scope.module) and durationMs >= Profiler.Config.slowThresholdMs then
		Profiler.AddTimeline(scope.id, "slow", durationMs);
	end
end

---Accumulate work counts behind a precomputed level and module gate.
---@param scope ATTProfilerScope Registered counter handle; filtered scopes perform no allocation.
---@param delta number? Finite nonnegative increment; nil defaults to one.
---@param sessionID integer? Optional originating capture generation; stale generations are rejected.
function Profiler.CountScope(scope, delta, sessionID)
	if not Profiler.Enabled or not scope.enabled or scope.kind ~= "counter" or (sessionID and sessionID ~= Profiler.SessionID) then return; end
	delta = delta or 1;
	if type(delta) ~= "number" or delta < 0 or delta ~= delta or delta == math_huge or not AcceptDiagnostic(scope) then return; end
	local metric = NewMetric(scope.id, "counter", scope.minLevel > 1, scope.minLevel == 6);
	if metric then metric.count = metric.count + delta; end
end

---Add one finite, nonnegative duration sample in milliseconds to the active capture.
---Disabled captures and invalid IDs or durations are ignored. Optional units describe
---work completed by this sample; only valid, finite, nonnegative units are accumulated.
---@param id string Stable scope ID, 1 to 96 bytes.
---@param durationMs number Finite, nonnegative sample duration in milliseconds.
---@param units number? Optional finite, nonnegative work-unit count; invalid values are ignored.
function Profiler.Record(id, durationMs, units)
	if not Profiler.Enabled then return; end
	if type(id) ~= "string" or #id == 0 or #id > MAX_ID_BYTES or type(durationMs) ~= "number"
		or durationMs < 0 or durationMs ~= durationMs or durationMs == math_huge then return; end
	local metric = NewMetric(id, "time");
	if not metric then return; end
	metric.count = metric.count + 1;
	metric.total = metric.total + durationMs;
	if durationMs > metric.max then metric.max = durationMs; end
	if type(units) == "number" and units >= 0 and units < math_huge then
		metric.units = metric.units + units;
		metric.hasUnits = true;
	end
	local bucket = #BUCKET_LIMITS + 1;
	for i = 1, #BUCKET_LIMITS do
		if durationMs <= BUCKET_LIMITS[i] then
			bucket = i;
			break;
		end
	end
	metric.buckets[bucket] = (metric.buckets[bucket] or 0) + 1;
end

---Accumulate a finite, nonnegative counter increment in the active capture.
---Disabled captures and invalid IDs or increments are ignored; delta defaults to one.
---@param id string Stable counter ID, 1 to 96 bytes.
---@param delta number? Finite, nonnegative increment, including fractions; nil defaults to one.
function Profiler.Count(id, delta)
	if not Profiler.Enabled then return; end
	if type(id) ~= "string" or #id == 0 or #id > MAX_ID_BYTES then return; end
	delta = delta or 1;
	if type(delta) ~= "number" or delta < 0 or delta ~= delta or delta == math_huge then return; end
	local metric = NewMetric(id, "counter");
	if metric then metric.count = metric.count + delta; end
end

---Stop the active capture, retain its data, and sample the final Blizzard metrics.
---The session generation stays unchanged so reports can still identify this capture.
---@param reason string? Stop reason shown in the report; nil defaults to "manual".
---@return boolean stopped True when an active capture was stopped; false if recording was already disabled.
function Profiler.Stop(reason)
	if not Profiler.Enabled then return false; end
	NotifySession("stopping");
	Profiler.Enabled = false;
	for _, scope in pairs(registry) do scope.enabled = false; end
	endedAt = GetTimePreciseSec();
	stoppedReason = reason or "manual";
	addonMetricAtStop = GetAddonSnapshot();
	NotifySession("stop");
	return true;
end

---Disable capture and discard all samples and boundary snapshots.
---Incrementing SessionID invalidates pending timeout callbacks and callers' timing tokens.
function Profiler.Reset()
	Profiler.Enabled = false;
	-- Invalidate outstanding auto-stop callbacks and any instrumented job state.
	Profiler.SessionID = Profiler.SessionID + 1;
	metrics, metricCount, droppedSamples = {}, 0, 0;
	startedAt, endedAt, durationLimit, stoppedReason = nil, nil, nil, nil;
	addonMetricAtStart, addonMetricAtStop = nil, nil;
	Profiler.Config = nil;
	detailMetricCount, detailDroppedSamples = 0, 0;
	timeline, timelineNext, timelineCount, timelineOverwritten = {}, 1, 0, 0;
	stackRecords, stackBytes, stackDropped, sampledCalls, skippedCalls, extensionErrors = {}, 0, 0, 0, 0, 0;
	for _, scope in pairs(registry) do scope.enabled = false; scope.sampleSeen = 0; end
	NotifySession("reset");
end

---Start a fresh, fixed-policy capture after validating every duration, level, and option.
---Invalid input preserves the current report and scheduled request without timers or API reads.
---@param durationSeconds number|string? Duration from one to 300 seconds; nil defaults to thirty.
---@param level number|string? Cumulative level one through six or its name; nil selects overview.
---@param options ATTProfilerOptions? Copied module filters, diagnostic sampling, and independent capacities.
---@return boolean started True if a new capture replaced prior data; false leaves current capture unchanged.
---@return number|string result Accepted seconds on success; otherwise a validation message.
function Profiler.Start(durationSeconds, level, options)
	local config, errorMessage = ValidateConfig(durationSeconds, level, options);
	if not config then
		---@cast errorMessage string
		return false, errorMessage;
	end
	Profiler.Reset();
	Profiler.Config = config;
	Profiler.Enabled = true;
	durationLimit = config.seconds;
	startedAt = GetTimePreciseSec();
	for _, scope in pairs(registry) do
		scope.enabled = config.level >= scope.minLevel and (scope.minLevel == 1 or IncludesModule(scope.module));
	end
	NotifySession("start");
	addonMetricAtStart = GetAddonSnapshot();
	local sessionID = Profiler.SessionID;
	C_Timer_After(config.seconds, function()
		if Profiler.Enabled and Profiler.SessionID == sessionID then
			Profiler.Stop("time limit");
			app.print("ATT profile stopped after", config.seconds, "seconds. Use /att profile report.");
		end
	end);
	return true, config.seconds;
end

---Serialize only validated public options into an independent SavedVariables-safe table.
---@param config ATTProfilerConfig Validated fixed capture policy.
---@return ATTProfilerOptions options Copied filters, sampling policy, and capacities without derived module sets.
local function SavedOptions(config)
	return { include = config.include, exclude = config.exclude, sampleEvery = config.sampleEvery,
		slowThresholdMs = config.slowThresholdMs, metricBudget = config.metricBudget, jobBudget = config.jobBudget,
		timelineBudget = config.timelineBudget, stackByteBudget = config.stackByteBudget, stacks = config.stacks };
end

---Persist a versioned one-shot request without changing the active capture or retained report.
---Read SavedVariables at call time because they are restored after this library loads.
---@param durationSeconds number|string? Duration from one to 300 seconds; nil defaults to thirty.
---@param level number|string? Cumulative level one through six or its name; nil selects overview.
---@param options ATTProfilerOptions? Detail filters, sampling policy, and capacities copied into the pending request.
---@return boolean scheduled True when the request was saved; false preserves all existing state.
---@return number|string result Saved seconds on success; a validation or storage-availability message on failure.
function Profiler.ScheduleNextLogin(durationSeconds, level, options)
	local config, errorMessage = ValidateConfig(durationSeconds, level, options);
	if not config then
		---@cast errorMessage string
		return false, errorMessage;
	end
	local savedVariables = AllTheThingsSavedVariables;
	if type(savedVariables) ~= "table" then return false, "ATT has not finished loading yet."; end
	savedVariables.ProfilerNextLogin = { version = 1, seconds = config.seconds, level = config.level, options = SavedOptions(config) };
	savedVariables.ProfilerNextLoginSeconds = nil;
	return true, config.seconds;
end

---Remove either version of a pending login request without stopping the current capture.
---@return boolean canceled True when a pending request was removed; false when none exists or storage is unavailable.
function Profiler.CancelNextLogin()
	local savedVariables = AllTheThingsSavedVariables;
	if type(savedVariables) ~= "table" or (savedVariables.ProfilerNextLogin == nil and savedVariables.ProfilerNextLoginSeconds == nil) then return false; end
	savedVariables.ProfilerNextLogin, savedVariables.ProfilerNextLoginSeconds = nil, nil;
	return true;
end

---Consume and clear a pending login request before starting, including corrupt or unknown versions.
---Legacy duration-only requests start at overview; absence performs no clock, timer, or Blizzard API calls.
---@return boolean started True when a scheduled capture began; false when no valid request was queued.
---@return number|string? result Accepted seconds, a validation explanation, or nil when no request existed.
function Profiler.StartNextLogin()
	local savedVariables = AllTheThingsSavedVariables;
	if type(savedVariables) ~= "table" then return false; end
	local request, seconds = savedVariables.ProfilerNextLogin, savedVariables.ProfilerNextLoginSeconds;
	if request == nil and seconds == nil then return false; end
	savedVariables.ProfilerNextLogin, savedVariables.ProfilerNextLoginSeconds = nil, nil;
	if request == nil then return Profiler.Start(seconds); end
	if type(request) ~= "table" or request.version ~= 1 or request.seconds == nil or request.level == nil then
		return false, "Invalid or unsupported next-login profile request.";
	end
	return Profiler.Start(request.seconds, request.level, request.options);
end

---Format the histogram bucket containing the approximate 95th percentile duration.
---Buckets report upper bounds in milliseconds; the overflow bucket reports >1000.
---@param metric ATTProfilerTimingMetric Timing sample count and histogram used to locate the approximate p95 bucket.
---@return string bucket p95 upper-bound bucket in milliseconds, ">1000" for overflow, or "n/a" when the histogram cannot reach the percentile.
local function Percentile95(metric)
	local target, seen = math_ceil(metric.count * 0.95), 0;
	for i = 1, #BUCKET_LIMITS + 1 do
		seen = seen + (metric.buckets[i] or 0);
		if seen >= target then
			if i > #BUCKET_LIMITS then return ">1000"; end
			return string_format("<=%.2f", BUCKET_LIMITS[i]);
		end
	end
	return "n/a";
end

---Build a copyable text report from the current or most recently stopped capture.
---This does not stop or reset capture. Timings are sorted by total duration, p95 is a
---histogram estimate, and overlapping scopes must not be summed as exclusive CPU time.
---@return string report Capture state, tab-separated metrics, and optional Blizzard context; usage text when no capture exists.
function Profiler.Report()
	---@type string[]
	local lines = {};
	if not startedAt then
		return "ATT performance profile\nNo capture yet. Use /att profile start [seconds].";
	end
	local elapsed = (endedAt or GetTimePreciseSec()) - startedAt;
	lines[#lines + 1] = string_format("ATT performance profile (session %d; %s)",
		Profiler.SessionID, Profiler.Enabled and "running" or "stopped");
	lines[#lines + 1] = string_format("Elapsed: %.2f s / %.2f s limit%s", elapsed, durationLimit,
		stoppedReason and ("; stopped: " .. stoppedReason) or "");
	lines[#lines + 1] = "Times are in ms. Runner slices exclude between-frame waits. Overlapping scopes are not additive.";
	local config = Profiler.Config;
	-- A retained capture always has its fixed policy, even after Stop.
	---@cast config ATTProfilerConfig
	lines[#lines + 1] = string_format("Level: %d (%s); detail modules: %s; exclude: %s", config.level,
		LEVEL_NAMES[config.level], config.include, config.exclude or "none");
	lines[#lines + 1] = string_format("Scope registry: %d / %d handles; rejected registration attempts: %d", scopeCount, MAX_SCOPES, rejectedScopes);
	lines[#lines + 1] = "Overview scopes remain global. Each higher level includes lower-level capabilities within the selected detail modules.";
	lines[#lines + 1] = string_format("Budgets: overview=%d IDs; detail=%d IDs; jobs=%d; timeline=%d entries; caller stacks=%d bytes (max %d records)",
		MAX_METRICS, config.metricBudget, config.jobBudget, config.timelineBudget, config.stackByteBudget, MAX_STACK_RECORDS);
	if config.level >= 6 then
		lines[#lines + 1] = string_format("Diagnostics sampling: first call, then every %d calls per scope; eligible=%d; accepted=%d; skipped=%d; caller stacks=%s",
			config.sampleEvery, sampledCalls + skippedCalls, sampledCalls, skippedCalls, config.stacks and "enabled" or "disabled");
		lines[#lines + 1] = "Sampled totals, Calls, and p95 describe accepted samples only; they are not full workload estimates.";
	end

	---@type ATTProfilerTimingMetric[], ATTProfilerCounterMetric[], ATTProfilerTimingMetric[], ATTProfilerCounterMetric[]
	local timings, counters, diagnosticTimings, diagnosticCounters = {}, {}, {}, {};
	for _, metric in pairs(metrics) do
		---@type ATTProfilerMetric[]
		local list = metric.sampled and (metric.kind == "time" and diagnosticTimings or diagnosticCounters)
			or (metric.kind == "time" and timings or counters);
		list[#list + 1] = metric;
	end
	table_sort(timings, function(a, b)
		if a.total == b.total then return a.id < b.id; end
		return a.total > b.total;
	end);
	table_sort(counters, function(a, b) return a.id < b.id; end);
	table_sort(diagnosticTimings, function(a, b) if a.total == b.total then return a.id < b.id; end return a.total > b.total; end);
	table_sort(diagnosticCounters, function(a, b) return a.id < b.id; end);
	if #timings > 0 then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Timing ID\tCalls\tTotal ms\tAvg ms\tMax ms\tp95 bucket ms\tUnits";
		for _, metric in ipairs(timings) do
			lines[#lines + 1] = string_format("%s\t%d\t%.3f\t%.3f\t%.3f\t%s\t%s",
				metric.id, metric.count, metric.total, metric.total / metric.count,
				metric.max, Percentile95(metric), metric.hasUnits and string_format("%.0f", metric.units) or "-");
		end
	end
	if #counters > 0 then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Counter ID\tCount";
		for _, metric in ipairs(counters) do
			lines[#lines + 1] = string_format("%s\t%s", metric.id, metric.count);
		end
	end
	if #diagnosticTimings > 0 then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Sampled diagnostic timing ID\tSamples\tObserved total ms\tAvg ms\tMax ms\tp95 sample bucket ms\tObserved units";
		for _, metric in ipairs(diagnosticTimings) do
			lines[#lines + 1] = string_format("%s\t%d\t%.3f\t%.3f\t%.3f\t%s\t%s",
				metric.id, metric.count, metric.total, metric.total / metric.count, metric.max, Percentile95(metric),
				metric.hasUnits and string_format("%.0f", metric.units) or "-");
		end
	end
	if #diagnosticCounters > 0 then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Sampled diagnostic counter ID\tObserved count";
		for _, metric in ipairs(diagnosticCounters) do lines[#lines + 1] = string_format("%s\t%s", metric.id, metric.count); end
	end
	if #timings == 0 and #counters == 0 and #diagnosticTimings == 0 and #diagnosticCounters == 0 then
		lines[#lines + 1] = "No measurements captured.";
	end
	if droppedSamples > 0 then
		lines[#lines + 1] = string_format("Dropped samples after %d distinct metric IDs: %d", MAX_METRICS, droppedSamples);
	end
	if detailDroppedSamples > 0 then
		lines[#lines + 1] = string_format("Dropped detail samples after %d distinct detail metric IDs: %d", config.metricBudget, detailDroppedSamples);
	end
	if config.level >= 5 then
		lines[#lines + 1] = "";
		lines[#lines + 1] = string_format("Timeline: %d retained; %d overwritten; slow threshold %.3f ms", timelineCount, timelineOverwritten, config.slowThresholdMs);
		lines[#lines + 1] = "Slow-operation thresholds reduce retained data; eligible calls must still be timed before the threshold can be checked.";
		if timelineCount > 0 then
			lines[#lines + 1] = "At ms\tEvent\tID\tDuration ms\tContext";
			local first = timelineCount == config.timelineBudget and timelineNext or 1;
			for offset = 0, timelineCount - 1 do
				local entry = timeline[(first + offset - 1) % config.timelineBudget + 1];
				lines[#lines + 1] = string_format("%.3f\t%s\t%s\t%s\t%s", entry.at, entry.kind, entry.id,
					entry.duration and string_format("%.3f", entry.duration) or "-", entry.context or "-");
			end
		end
	end
	if config.level >= 6 and config.stacks then
		lines[#lines + 1] = "";
		lines[#lines + 1] = string_format("Diagnostic caller stacks: %d retained; %d bytes; %d unavailable or budget-rejected", #stackRecords, stackBytes, stackDropped);
		lines[#lines + 1] = "Stacks are sampled caller context at Begin, not a complete execution trace or Lua CPU sampling.";
		for _, entry in ipairs(stackRecords) do
			lines[#lines + 1] = string_format("%.3f ms: %s (%s)\n%s", entry.at, entry.id, entry.context or "no job context", entry.text);
		end
	end
	for _, provider in ipairs(reportProviders) do
		if not pcall(provider, lines) then extensionErrors = extensionErrors + 1; end
	end
	if extensionErrors > 0 then lines[#lines + 1] = string_format("Extension callback failures: %d", extensionErrors); end
	if addonMetricAtStart or addonMetricAtStop then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Blizzard C_AddOnProfiler (whole addon):";
		local before = addonMetricAtStart and addonMetricAtStart.RecentAverageTime;
		local after = addonMetricAtStop and addonMetricAtStop.RecentAverageTime;
		if before then lines[#lines + 1] = string_format("Recent average at start: %.3f ms", before); end
		if after then lines[#lines + 1] = string_format("Recent average at stop: %.3f ms", after); end
		for _, threshold in ipairs({ 5, 10 }) do
			local key = "CountTimeOver" .. threshold .. "Ms";
			---@cast key ATTProfilerAddonMetricName
			before = addonMetricAtStart and addonMetricAtStart[key];
			after = addonMetricAtStop and addonMetricAtStop[key];
			if before and after and after >= before then
				lines[#lines + 1] = string_format("Ticks over %d ms during capture: %.0f", threshold, after - before);
			end
		end
	end
	return table_concat(lines, "\n");
end
