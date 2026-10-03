-- Short-lived, opt-in performance captures for ATT's explicit instrumentation.
-- Keep the disabled path free of timers, table allocations, and API calls.
local appName, app = ...;

local math_ceil, math_huge, string_format, table_concat, table_sort, type, tonumber
	= math.ceil, math.huge, string.format, table.concat, table.sort, type, tonumber;
local GetTimePreciseSec, C_Timer_After = GetTimePreciseSec, C_Timer.After;

local DEFAULT_DURATION = 30;
local MAX_DURATION = 300;
local MAX_METRICS = 64;
local MAX_ID_BYTES = 96;
local BUCKET_LIMITS = { 0.25, 0.5, 1, 2, 4, 8, 16, 33, 66, 100, 250, 500, 1000 };

local Profiler = { Enabled = false, SessionID = 0 };
app.Profiler = Profiler;

local metrics, metricCount, droppedSamples = {}, 0, 0;
local startedAt, endedAt, durationLimit, stoppedReason;
local addonMetricAtStart, addonMetricAtStop;

local function NewMetric(id, kind)
	local metric = metrics[id];
	if metric then return metric.kind == kind and metric or nil; end
	if metricCount >= MAX_METRICS then
		droppedSamples = droppedSamples + 1;
		return nil;
	end
	metricCount = metricCount + 1;
	metric = { id = id, kind = kind, count = 0 };
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
local AddonMetricNames = { "RecentAverageTime", "CountTimeOver5Ms", "CountTimeOver10Ms" };
local function GetAddonSnapshot()
	local api = C_AddOnProfiler;
	local metricEnum = Enum and Enum.AddOnProfilerMetric;
	if not api or type(api.GetAddOnMetric) ~= "function" or not metricEnum then return; end
	if type(api.IsEnabled) == "function" then
		local ok, enabled = pcall(api.IsEnabled);
		if not ok or not enabled then return; end
	end
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

function Profiler.Count(id, delta)
	if not Profiler.Enabled then return; end
	if type(id) ~= "string" or #id == 0 or #id > MAX_ID_BYTES then return; end
	delta = delta or 1;
	if type(delta) ~= "number" or delta < 0 or delta ~= delta or delta == math_huge then return; end
	local metric = NewMetric(id, "counter");
	if metric then metric.count = metric.count + delta; end
end

function Profiler.Stop(reason)
	if not Profiler.Enabled then return false; end
	Profiler.Enabled = false;
	endedAt = GetTimePreciseSec();
	stoppedReason = reason or "manual";
	addonMetricAtStop = GetAddonSnapshot();
	return true;
end

function Profiler.Reset()
	Profiler.Enabled = false;
	-- Invalidate outstanding auto-stop callbacks and any instrumented job state.
	Profiler.SessionID = Profiler.SessionID + 1;
	metrics, metricCount, droppedSamples = {}, 0, 0;
	startedAt, endedAt, durationLimit, stoppedReason = nil, nil, nil, nil;
	addonMetricAtStart, addonMetricAtStop = nil, nil;
end

function Profiler.Start(durationSeconds)
	local seconds = tonumber(durationSeconds) or (durationSeconds == nil and DEFAULT_DURATION);
	if not seconds or seconds ~= seconds or seconds < 1 or seconds > MAX_DURATION then
		return false, "Duration must be between 1 and 300 seconds.";
	end
	Profiler.Reset();
	Profiler.Enabled = true;
	durationLimit = seconds;
	startedAt = GetTimePreciseSec();
	addonMetricAtStart = GetAddonSnapshot();
	local sessionID = Profiler.SessionID;
	C_Timer_After(seconds, function()
		if Profiler.Enabled and Profiler.SessionID == sessionID then
			Profiler.Stop("time limit");
			app.print("ATT profile stopped after", seconds, "seconds. Use /att profile report.");
		end
	end);
	return true, seconds;
end

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

function Profiler.Report()
	local lines = {};
	if not startedAt then
		return "ATT performance profile\nNo capture yet. Use /att profile start [seconds].";
	end
	local elapsed = (endedAt or GetTimePreciseSec()) - startedAt;
	lines[#lines + 1] = string_format("ATT performance profile (session %d; %s)",
		Profiler.SessionID, Profiler.Enabled and "running" or "stopped");
	lines[#lines + 1] = string_format("Elapsed: %.2f s / %.2f s limit%s", elapsed, durationLimit,
		stoppedReason and ("; stopped: " .. stoppedReason) or "");
	lines[#lines + 1] = "Times are in ms. *.wall includes between-frame waits; other scopes measure execution. Overlapping scopes are not additive.";

	local timings, counters = {}, {};
	for _, metric in pairs(metrics) do
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
	if addonMetricAtStart or addonMetricAtStop then
		lines[#lines + 1] = "";
		lines[#lines + 1] = "Blizzard C_AddOnProfiler (whole addon):";
		local before = addonMetricAtStart and addonMetricAtStart.RecentAverageTime;
		local after = addonMetricAtStop and addonMetricAtStop.RecentAverageTime;
		if before then lines[#lines + 1] = string_format("Recent average at start: %.3f ms", before); end
		if after then lines[#lines + 1] = string_format("Recent average at stop: %.3f ms", after); end
		for _, threshold in ipairs({ 5, 10 }) do
			local key = "CountTimeOver" .. threshold .. "Ms";
			before = addonMetricAtStart and addonMetricAtStart[key];
			after = addonMetricAtStop and addonMetricAtStop[key];
			if before and after and after >= before then
				lines[#lines + 1] = string_format("Ticks over %d ms during capture: %.0f", threshold, after - before);
			end
		end
	end
	return table_concat(lines, "\n");
end
