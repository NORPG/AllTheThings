-- Run from the repository root with Lua 5.1: lua tests/ProfilerTimeline.lua
-- Reusable timeline slots and copied job labels, with public string behavior intact.
assert(_VERSION == "Lua 5.1", "Profiler timeline tests require Lua 5.1");
local now, clockReads = 100, 0;
GetTimePreciseSec = function() clockReads = clockReads + 1; return now; end;
C_Timer = { After = function() end };
C_AddOnProfiler, Enum = nil, nil;
local nativeFormat = string.format;

---Load real capture services while counting format calls made by their cached aliases.
---@param withJobs boolean Whether to install the optional current-job provider.
---@return table app Actual services isolated from other test captures.
---@return table formats Mutable counter for string.format calls inside these services.
local function NewApp(withJobs)
	local formats = { calls = 0 };
	string.format = function(...) formats.calls = formats.calls + 1; return nativeFormat(...); end;
	local app = {};
	assert(loadfile("lib/Profiler.lua"))("AllTheThings", app);
	if withJobs then assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app); end
	string.format = nativeFormat;
	return app, formats;
end

---Inspect only the private storage identity to verify that overwrite does not allocate new slots.
---@param profiler ATTProfiler Real capture service under test.
---@return ATTProfilerTimelineEntry[] slots Read-only timeline table found through Lua 5.1 debug metadata.
local function TimelineSlots(profiler)
	local index = 1;
	while true do
		local name, value = debug.getupvalue(profiler.AddTimeline, index);
		assert(name, "timeline storage was not found");
		if name == "timeline" then return value; end
		index = index + 1;
	end
end

---Require literal report text and include the complete report on failure.
---@param report string Current formatted capture.
---@param fragment string Expected literal output.
local function Contains(report, fragment)
	assert(report:find(fragment, 1, true), "missing: " .. fragment .. "\n" .. report);
end

local app, formats = NewApp(true);
local p, jobs = app.Profiler, app.ProfilerJobs;
local scope = p.RegisterScope("timeline.work", "runner", 2, "time", "Timeline label snapshots.");
local textAPI, jobAPI, timelineAPI = p.GetCurrentContext, p.GetCurrentContextJob, p.AddTimeline;
assert(p.Start(30, 5, { include = "runner", timelineBudget = 32, slowThresholdMs = 0 }));
local formatsBefore = formats.calls;
local parent = assert(jobs.Enqueue(scope, "root", nil, 100));
assert(jobs.Begin(parent, scope, nil, 100) == parent);
local child = assert(jobs.Enqueue(scope, nil, nil, 100.001));
assert(child.parentID == parent.id and child.origin == scope.id);
assert(jobs.Begin(child, scope, nil, 100.001) == child);
assert(p.GetCurrentContextJob() == child);
local start, sessionID = p.Begin(scope, 100.001);
p.Finish(scope, start, sessionID, nil, 100.006);
jobs.Pause(child, "completed", 100.006);
assert(formats.calls == formatsBefore, "capture formatted job/timeline labels before Report");
local slots = TimelineSlots(p);
for _, entry in ipairs(slots) do
	for _, value in pairs(entry) do
		assert(type(value) == "number" or type(value) == "string", "timeline slot retained a job, coroutine, or payload reference");
	end
end
-- Snapshot labels remain tied to insertion even if the source record is later changed.
child.origin, child.parentID = "changed after capture", 99;
local parentText = p.GetCurrentContext();
assert(parentText == "job=1 origin=root" and formats.calls == formatsBefore + 1);
assert(p.GetCurrentContext() == parentText and formats.calls == formatsBefore + 1);
jobs.Pause(parent, "completed", 100.007);
assert(p.Stop());
assert(formats.calls == formatsBefore + 1, "capture stop formatted unused lifecycle context");
local report = p.Report();
Contains(report, "6.000\tslow\ttimeline.work\t5.000\tjob=2 origin=timeline.work parent=1");
Contains(report, "6.000\tcompleted\ttimeline.work\t5.000\tjob=2 origin=timeline.work\n");
assert(not report:find("origin=changed after capture", 1, true), "report read mutable job labels instead of copied timeline scalars");
assert(formats.calls > formatsBefore + 1, "Report did not format retained labels");
assert(p.GetCurrentContext == textAPI and p.GetCurrentContextJob == jobAPI and p.AddTimeline == timelineAPI);

-- Ring capacity bounds table allocation; each overwrite clears every optional field.
assert(p.Start(30, 5, { include = "runner", timelineBudget = 2 }));
p.AddTimeline("slot.text", "explicit", 7, "old\ntext", 100.001);
p.AddTimeline("slot.empty", "explicit", nil, nil, 100.002);
slots = TimelineSlots(p);
local first, second = slots[1], slots[2];
assert(first.context == "old text" and first.duration == 7);
local job = assert(jobs.Enqueue(scope, "ring origin", nil, 100.003));
assert(slots[1] == first and slots[2] == second);
assert(first.id == scope.id and first.context == nil and first.duration == nil);
assert(first.jobID == job.id and first.origin == "ring origin" and first.parentID == nil);
p.AddTimeline("slot.none", "explicit", nil, nil, 100.004);
assert(second.context == nil and second.duration == nil and second.jobID == nil and second.origin == nil and second.parentID == nil);
p.AddTimeline("slot.explicit", "explicit", 0, "", 100.005, job);
assert(first.context == "" and first.duration == 0 and first.jobID == nil and first.origin == nil and first.parentID == nil);
Contains(p.Report(), "5.000\texplicit\tslot.explicit\t0.000\t");
for index = 1, 10000 do p.AddTimeline("slot.repeated", "explicit", nil, nil, 100.006); end
assert(#slots == 2 and slots[1] == first and slots[2] == second, "full ring replaced or expanded its slot tables");
for _, entry in ipairs(slots) do
	assert(entry.context == nil and entry.duration == nil and entry.jobID == nil and entry.origin == nil and entry.parentID == nil);
end
Contains(p.Report(), "Timeline: 2 retained; 10003 overwritten");
local weak = setmetatable({ first, second, job }, { __mode = "v" });
first, second, slots, job = nil, nil, nil, nil;
p.Reset(); collectgarbage("collect"); collectgarbage("collect");
assert(weak[1] == nil and weak[2] == nil and weak[3] == nil, "reset retained old ring slots or source jobs");
assert(p.GetCurrentContextJob() == nil and p.GetCurrentContext() == nil);

-- Completed observations retain labels while releasing their coroutine and its payload.
assert(p.Start(30, 5, { include = "runner", timelineBudget = 4 }));
local weakExecution = setmetatable({}, { __mode = "v" });
do
	local payload = { marker = "private coroutine payload" };
	local thread = coroutine.create(function() return payload.marker; end);
	local observed = assert(jobs.Enqueue(scope, "completed thread", nil, 100));
	weakExecution[1], weakExecution[2], weakExecution[3] = thread, payload, observed;
	assert(jobs.Begin(observed, scope, thread, 100.010) == observed);
	jobs.Pause(observed, "completed", 100.015);
end
collectgarbage("collect"); collectgarbage("collect");
assert(weakExecution[1] == nil and weakExecution[2] == nil, "retained timeline/job labels kept a completed coroutine or payload alive");
assert(weakExecution[3] ~= nil, "capture prematurely discarded its retained job record");
Contains(p.Report(), "job=1 origin=completed thread");
p.Reset(); collectgarbage("collect"); collectgarbage("collect");
assert(weakExecution[3] == nil, "reset retained the job behind copied timeline metadata");

-- Budgets and disabled captures reject before consulting even an installed provider.
assert(p.Start(30, 5, { include = "runner", timelineBudget = 0 }));
p.GetCurrentContextJob = function() error("zero/disabled timeline queried context"); end;
local readsBefore = clockReads;
p.AddTimeline("zero", "explicit");
assert(clockReads == readsBefore);
assert(p.Stop()); readsBefore = clockReads;
p.AddTimeline("disabled", "explicit");
assert(clockReads == readsBefore);

-- AddTimeline retains legacy string-provider sanitation, explicit precedence, and errors.
app = NewApp(false); p = app.Profiler;
assert(p.GetCurrentContextJob == nil);
assert(p.Start(30, 5, { include = "all", timelineBudget = 1 }));
local providerCalls = 0;
p.GetCurrentContext = function() providerCalls = providerCalls + 1; return "legacy\r\n\t" .. string.rep("x", 300); end;
p.AddTimeline("legacy.context", "explicit", nil, nil, 100.010);
slots = TimelineSlots(p); first = slots[1];
assert(providerCalls == 1 and #first.context == 192);
assert(first.context:sub(1, 9) == "legacy   ");
local explicit = "explicit\t" .. string.rep("y", 300);
p.AddTimeline("explicit.context", "explicit", nil, explicit, 100.020);
assert(slots[1] == first and providerCalls == 1 and #first.context == 192);
assert(first.context:sub(1, 9) == "explicit ");
local retainedID, retainedContext, retainedAt = first.id, first.context, first.at;
local failure = {};
p.GetCurrentContext = function() error(failure); end;
local ok, errorValue = pcall(p.AddTimeline, "provider.failure", "explicit", nil, nil, 100.030);
assert(not ok and errorValue == failure, "legacy provider error was swallowed or replaced");
assert(first.id == retainedID and first.context == retainedContext and first.at == retainedAt,
	"failed provider partially overwrote a retained slot");
Contains(p.Report(), "Timeline: 1 retained; 1 overwritten");
print("PASS: bounded reusable slots, optional-field clearing, copied scalar context, report-time labels, public strings, legacy providers, and reset cleanup");
