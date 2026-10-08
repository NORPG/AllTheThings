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
local LEVEL_NAMES = { "overview", "components", "workload" };
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

---Accumulated nonnegative increments for a single stable metric ID.
---@class ATTProfilerCounterMetric
---@field id string Stable metric ID, at most 96 bytes.
---@field kind 'counter'
---@field count number Sum of accepted increments; fractional increments are allowed.

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
local disabledScope = { id = "profiler.registry.full", module = "profiler", minLevel = 3,
	kind = "time", enabled = false };
local sessionListeners = {};
local extensionErrors = 0;
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
---@return ATTProfilerMetric? metric Existing or newly allocated metric; nil on a kind mismatch or when a new ID would exceed the limit.
---Timing overload: returns a timing metric containing duration, work-unit, and histogram aggregates, or nil when registration is rejected.
---@overload fun(id: string, kind: 'time', detail?: boolean): ATTProfilerTimingMetric?
---Counter overload: returns a counter metric containing accumulated increments, or nil when registration is rejected.
---@overload fun(id: string, kind: 'counter', detail?: boolean): ATTProfilerCounterMetric?
local function NewMetric(id, kind, detail)
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
	metric = { id = id, kind = kind, count = 0 };
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
---@field level integer Selected cumulative level from one through three.
---@field include string Canonical comma-separated detail modules, or "all".
---@field exclude string? Canonical comma-separated excluded detail modules.
---@field includeModules table<string, boolean>? Parsed detail inclusion set; nil includes every module.
---@field excludeModules table<string, boolean> Parsed detail exclusion set.
---@field metricBudget integer Maximum distinct detail metric IDs; overview retains its separate 64-ID allowance.

---@class ATTProfilerOptions
---@field include string? Comma-separated detail module IDs; nil includes every module, as does "all".
---@field exclude string? Comma-separated module IDs whose details should be omitted.
---@field metricBudget integer? Detail metric capacity from zero to 1024; defaults to 128.

---@class ATTProfilerScope
---@field id string Stable metric ID shared with the report.
---@field module string Stable owning subsystem used by include and exclude filters.
---@field minLevel integer First cumulative capture level that enables this scope.
---@field kind ATTProfilerMetricKind Timing or counter aggregation.
---@field description string? Human-readable meaning of this scope.
---@field units string? Meaning of work-unit totals for timing scopes.
---@field enabled boolean Precomputed capture gate; false while recording is disabled or the scope is filtered out.

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
---@param level number|string? Level one through three or a documented level name; nil selects overview.
---@param options ATTProfilerOptions? Optional detail filters and detail metric capacity.
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
	if type(level) ~= "number" or level ~= math.floor(level) or level < 1 or level > 3 then
		return nil, "Level must be 1 to 3 or overview/components/workload.";
	end
	if options ~= nil and type(options) ~= "table" then return nil, "Profile options must be a table."; end
	options = options or {};
	local accepted = { include = true, exclude = true, metricBudget = true };
	for name in pairs(options) do if not accepted[name] then return nil, "Unknown profile option: " .. tostring(name); end end
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
		includeModules = includeModules, excludeModules = excludeModules or {}, metricBudget = options.metricBudget };
	if config.metricBudget == nil then config.metricBudget = 128; end
	if type(config.metricBudget) ~= "number" or config.metricBudget ~= config.metricBudget
		or config.metricBudget < 0 or config.metricBudget > 1024 or config.metricBudget ~= math.floor(config.metricBudget) then
		return nil, "metricBudget must be an integer from 0 to 1024.";
	end
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
---@param minLevel integer First cumulative level from one to three that accepts this scope.
---@param kind ATTProfilerMetricKind Aggregation type: time or counter.
---@param description string? Meaning of the measurement for documentation and registry inspection.
---@param units string? Meaning of work units supplied to timing samples.
---@return ATTProfilerScope scope Registered handle updated at capture boundaries, or a shared disabled handle when registry capacity is exhausted.
function Profiler.RegisterScope(id, module, minLevel, kind, description, units)
	assert(type(id) == "string" and #id > 0 and #id <= MAX_ID_BYTES, "Invalid profile scope ID");
	assert(type(module) == "string" and module:match("^[a-z0-9_.%-]+$"), "Invalid profile module");
	assert(type(minLevel) == "number" and minLevel >= 1 and minLevel <= 3 and minLevel == math.floor(minLevel), "Invalid profile scope level");
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
		description = description, units = units, enabled = false };
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

---Return the selected level while recording is active.
---@return integer level Active level from one to three, or zero when capture is stopped or reset.
function Profiler.GetLevel()
	return Profiler.Enabled and Profiler.Config.level or 0;
end

---Gate non-scope instrumentation using the active level and optional subsystem selection.
---@param level integer Minimum cumulative level required by the caller.
---@param module string? Optional detail module; ignored for overview instrumentation.
---@return boolean enabled True when recording meets the level and detail filter requirements.
function Profiler.IsLevelEnabled(level, module)
	return Profiler.Enabled and Profiler.Config.level >= level and (level == 1 or module == nil or IncludesModule(module));
end

---Begin an eligible timing scope, preserving its session generation across asynchronous work.
---A successful begin returns two scalar tokens without allocating a token table.
---@param scope ATTProfilerScope Registered timing handle; disabled or filtered handles return immediately.
---@return number? startedAt Absolute clock time in seconds for an accepted sample; nil when disabled or filtered.
---@return integer? sessionID Capture generation required by Finish; nil when no sample was started.
function Profiler.Begin(scope)
	if not Profiler.Enabled or not scope.enabled or scope.kind ~= "time" then return; end
	local start = GetTimePreciseSec();
	return start, Profiler.SessionID;
end

---Aggregate a registered scope sample without consuming overview capacity for detail scopes.
---@param scope ATTProfilerScope Registered timing handle validated by Finish.
---@param durationMs number Finite nonnegative observed duration in milliseconds.
---@param units number? Optional finite nonnegative work count for this execution.
local function RecordScope(scope, durationMs, units)
	local metric = NewMetric(scope.id, "time", scope.minLevel > 1);
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
end

---Accumulate work counts behind a precomputed level and module gate.
---@param scope ATTProfilerScope Registered counter handle; filtered scopes perform no allocation.
---@param delta number? Finite nonnegative increment; nil defaults to one.
---@param sessionID integer? Optional originating capture generation; stale generations are rejected.
function Profiler.CountScope(scope, delta, sessionID)
	if not Profiler.Enabled or not scope.enabled or scope.kind ~= "counter" or (sessionID and sessionID ~= Profiler.SessionID) then return; end
	delta = delta or 1;
	if type(delta) ~= "number" or delta < 0 or delta ~= delta or delta == math_huge then return; end
	local metric = NewMetric(scope.id, "counter", scope.minLevel > 1);
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
	-- Invalidate outstanding auto-stop callbacks and asynchronous timing tokens.
	Profiler.SessionID = Profiler.SessionID + 1;
	metrics, metricCount, droppedSamples = {}, 0, 0;
	startedAt, endedAt, durationLimit, stoppedReason = nil, nil, nil, nil;
	addonMetricAtStart, addonMetricAtStop = nil, nil;
	Profiler.Config = nil;
	detailMetricCount, detailDroppedSamples = 0, 0;
	extensionErrors = 0;
	for _, scope in pairs(registry) do scope.enabled = false; end
	NotifySession("reset");
end

---Start a fresh, fixed-policy capture after validating every duration, level, and option.
---Invalid input preserves the current report and scheduled request without timers or API reads.
---@param durationSeconds number|string? Duration from one to 300 seconds; nil defaults to thirty.
---@param level number|string? Cumulative level one through three or its name; nil selects overview.
---@param options ATTProfilerOptions? Copied detail module filters and metric capacity.
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
---@return ATTProfilerOptions options Copied filters and metric capacity without derived module sets.
local function SavedOptions(config)
	return { include = config.include, exclude = config.exclude, metricBudget = config.metricBudget };
end

---Persist a versioned one-shot request without changing the active capture or retained report.
---Read SavedVariables at call time because they are restored after this library loads.
---@param durationSeconds number|string? Duration from one to 300 seconds; nil defaults to thirty.
---@param level number|string? Cumulative level one through three or its name; nil selects overview.
---@param options ATTProfilerOptions? Detail filters and metric capacity copied into the pending request.
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
	lines[#lines + 1] = string_format("Budgets: overview=%d IDs; detail=%d IDs", MAX_METRICS, config.metricBudget);
	---@type ATTProfilerTimingMetric[], ATTProfilerCounterMetric[]
	local timings, counters = {}, {};
	for _, metric in pairs(metrics) do
		---@type ATTProfilerMetric[]
		local list = metric.kind == "time" and timings or counters;
		list[#list + 1] = metric;
	end
	table_sort(timings, function(a, b)
		if a.total == b.total then return a.id < b.id; end
		return a.total > b.total;
	end);
	table_sort(counters, function(a, b) return a.id < b.id; end);
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
	if #timings == 0 and #counters == 0 then
		lines[#lines + 1] = "No measurements captured.";
	end
	if droppedSamples > 0 then
		lines[#lines + 1] = string_format("Dropped samples after %d distinct metric IDs: %d", MAX_METRICS, droppedSamples);
	end
	if detailDroppedSamples > 0 then
		lines[#lines + 1] = string_format("Dropped detail samples after %d distinct detail metric IDs: %d", config.metricBudget, detailDroppedSamples);
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
