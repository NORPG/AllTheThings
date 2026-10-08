-- Run from the repository root with Lua 5.1: lua tests/ProfilerBoundaries.lua
-- Shared timing/job/timeline boundaries without replacing public API functions.
assert(_VERSION == "Lua 5.1", "Profiler boundary tests require Lua 5.1");
local now, clockReads, stackCalls = 100, 0, 0;
GetTimePreciseSec = function() clockReads = clockReads + 1; return now; end;
C_Timer = { After = function() end };
C_AddOnProfiler, Enum = nil, nil;
local app = {};
assert(loadfile("lib/Profiler.lua"))("AllTheThings", app);
assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app);
local p, jobs = app.Profiler, app.ProfilerJobs;
local work = p.RegisterScope("boundary.work", "runner", 2, "time", "Shared work boundaries.");
local diagnostic = p.RegisterScope("boundary.diagnostic", "runner", 6, "time", "Sampled diagnostic boundaries.");
local beginAPI, finishAPI, timelineAPI = p.Begin, p.Finish, p.AddTimeline;
local enqueueAPI, jobBeginAPI, pauseAPI = jobs.Enqueue, jobs.Begin, jobs.Pause;

---Check literal report output while retaining the complete report on failure.
---@param report string Current capture text.
---@param fragment string Literal output expected from the supplied boundaries.
local function Contains(report, fragment)
	assert(report:find(fragment, 1, true), "missing: " .. fragment .. "\n" .. report);
end

---Start a fresh capture at a known absolute clock boundary.
---@param level integer Cumulative capture level.
---@param options ATTProfilerOptions? Optional capacities or diagnostic settings.
local function Start(level, options)
	now = 100;
	assert(p.Start(30, level, options or (level >= 4 and { include = "runner", slowThresholdMs = 1 } or nil)));
end

-- Gates and capacity checks reject observations before reading any clock.
local reads = clockReads;
assert(not p.Begin(work, 100));
p.Finish(work, 100, 0, nil, 101);
assert(not jobs.Enqueue(work, nil, nil, 100));
assert(not jobs.Begin(nil, work, nil, 100));
jobs.Pause(nil, nil, 100);
p.AddTimeline("disabled", "queued", nil, nil, 100);
assert(clockReads == reads);
Start(1); reads = clockReads;
assert(not jobs.Enqueue(work) and not jobs.Begin(nil, work));
assert(clockReads == reads, "overview job gates read a clock");
Start(5, { include = "runner", jobBudget = 0, timelineBudget = 0 }); reads = clockReads;
assert(select("#", jobs.Enqueue(work)) == 0 and select("#", jobs.Begin(nil, work)) == 0);
p.AddTimeline("zero.capacity", "queued");
assert(clockReads == reads, "zero-capacity observers read a clock");

-- Explicit boundaries are inclusive shared points, not extra clocks per consumer.
Start(5); reads = clockReads;
local queuedAt = GetTimePreciseSec();
local job = assert(jobs.Enqueue(work, "shared", 2, queuedAt));
assert(job.queuedAt == queuedAt and clockReads == reads + 1);
now = 100.025;
local resumedAt = GetTimePreciseSec();
local start, sessionID = p.Begin(work, resumedAt);
assert(start == resumedAt and sessionID == p.SessionID);
assert(jobs.Begin(job, work, nil, resumedAt) == job);
assert(job.startedAt == resumedAt and job.sliceStart == resumedAt);
now = 100.030;
local finishedAt = GetTimePreciseSec();
p.Finish(work, start, sessionID, 7, finishedAt);
jobs.Pause(job, "completed", finishedAt);
assert(clockReads == reads + 3, "shared boundaries caused consumer clock reads");
assert(job.endedAt == finishedAt and math.abs(job.execution - 5) < 0.000001);
local report = p.Report();
Contains(report, "boundary.work\t1\t5.000\t5.000\t5.000\t<=8.00\t7");
Contains(report, "\tcompleted\tno\t25.000\t5.000\t5.000\t1\t2");
Contains(report, "0.000\tqueued\tboundary.work");
Contains(report, "25.000\tresume\tboundary.work");
Contains(report, "30.000\tslow\tboundary.work\t5.000");
Contains(report, "30.000\tcompleted\tboundary.work\t5.000");
local slowPosition = assert(report:find("30.000\tslow", 1, true));
local completedPosition = assert(report:find("30.000\tcompleted", 1, true));
assert(slowPosition < completedPosition, "equal-time events lost insertion order");

-- A newly adopted partial job shares one boundary for partial and resume events.
reads = clockReads;
local partial = assert(jobs.Begin(nil, work, nil, 100.040));
assert(partial.partial and partial.queuedAt == nil and partial.startedAt == 100.040);
jobs.Pause(partial, "completed", 100.050);
assert(clockReads == reads, "supplied partial-job boundaries read the clock");
report = p.Report();
Contains(report, "40.000\tpartial\tboundary.work");
Contains(report, "40.000\tresume\tboundary.work");
Contains(report, "50.000\tcompleted\tboundary.work\t10.000");
Contains(report, "\tcompleted\tyes\tunknown\t10.000\t10.000\t1\tunknown");

-- Existing callers still read one clock at each lifecycle boundary.
Start(5); reads = clockReads;
job = assert(jobs.Enqueue(work));
assert(clockReads == reads + 1);
now = 100.010; assert(jobs.Begin(job, work) == job);
assert(clockReads == reads + 2);
now = 100.015; jobs.Pause(job);
assert(clockReads == reads + 3 and job.status == "suspended");
now = 100.100; assert(jobs.Begin(job, work) == job);
assert(clockReads == reads + 4);
now = 100.107; jobs.Pause(job, "completed");
assert(clockReads == reads + 5 and math.abs(job.execution - 12) < 0.000001);
reads = clockReads; start, sessionID = p.Begin(work);
assert(clockReads == reads + 1);
now = now + 0.004; p.Finish(work, start, sessionID);
assert(clockReads == reads + 2, "slow timeline reread the Finish boundary");
reads = clockReads; partial = assert(jobs.Begin(nil, work));
assert(clockReads == reads + 1, "partial and resume events read different boundaries");
now = now + 0.006; jobs.Pause(partial, "completed");
assert(clockReads == reads + 2);
reads = clockReads; p.AddTimeline("legacy.timeline", "explicit");
assert(clockReads == reads + 1);
report = p.Report();
Contains(report, "\tcompleted\tno\t10.000\t12.000\t97.000\t2\tunknown");
Contains(report, "111.000\tslow\tboundary.work\t4.000");
Contains(report, "111.000\tpartial\tboundary.work");
Contains(report, "111.000\tresume\tboundary.work");

-- Invalid boundaries do not allocate jobs, consume diagnostic samples, or mutate work.
Start(6, { include = "runner", sampleEvery = 2 });
local invalidTimes = { "100", {}, true, math.huge, -math.huge, 0 / 0 };
job = assert(jobs.Enqueue(work, "valid", nil, 100));
start, sessionID = p.Begin(work, 100);
assert(jobs.Begin(job, work, nil, 100.010) == job);
reads = clockReads;
for _, invalid in ipairs(invalidTimes) do
	assert(not p.Begin(work, invalid));
	assert(not p.Begin(diagnostic, invalid));
	p.Finish(work, start, sessionID, nil, invalid);
	assert(not jobs.Enqueue(work, "invalid", nil, invalid));
	assert(not jobs.Begin(job, work, nil, invalid));
	jobs.Pause(job, "completed", invalid);
	p.AddTimeline("invalid.boundary", "explicit", nil, nil, invalid);
end
assert(clockReads == reads and diagnostic.sampleSeen == 0);
assert(job.resumes == 1 and job.status == "running" and job.sliceStart == 100.010);
assert(job.execution == 0 and job.endedAt == nil and p.GetCurrentContext() ~= nil);
assert(not p.Report():find("invalid.boundary", 1, true));
assert(not work.metric, "invalid Finish recorded a sample");
reads = clockReads;
assert(not jobs.Begin(job, work, nil, 99));
jobs.Pause(job, "completed", 100.005);
p.Finish(work, start, sessionID, nil, 99);
assert(clockReads == reads and job.status == "running" and job.execution == 0 and not work.metric);
jobs.Pause(job, "completed", 100.020);
assert(job.status == "completed" and math.abs(job.execution - 10) < 0.000001);

-- Generation rejection remains effective even when no API needs to read the clock.
start, sessionID = p.Begin(work, 100.030);
local stale = assert(jobs.Enqueue(work, nil, nil, 100.030));
assert(jobs.Begin(stale, work, nil, 100.030) == stale);
p.Reset(); Start(5); reads = clockReads;
p.Finish(work, start, sessionID, nil, 100.050);
jobs.Pause(stale, "completed", 100.050);
assert(clockReads == reads and not work.metric and stale.status == "running");
partial = assert(jobs.Begin(stale, work, nil, 100.050));
assert(partial ~= stale and partial.partial and partial.sessionID == p.SessionID);
jobs.Pause(partial, "completed", 100.055);
assert(clockReads == reads);
assert(p.Begin == beginAPI and p.Finish == finishAPI and p.AddTimeline == timelineAPI);
assert(jobs.Enqueue == enqueueAPI and jobs.Begin == jobBeginAPI and jobs.Pause == pauseAPI);

-- Stack acquisition keeps its own post-stack start, while malformed/skipped samples stay cheap.
Start(6, { include = "runner", sampleEvery = 2, stacks = true });
debugstack = function()
	stackCalls = stackCalls + 1; now = now + 0.005; return "bounded stack";
end;
reads = clockReads;
assert(not p.Begin(diagnostic, math.huge) and diagnostic.sampleSeen == 0);
start, sessionID = p.Begin(diagnostic, 100);
assert(stackCalls == 1 and clockReads == reads + 1 and start == now and math.abs(start - 100.005) < 0.000001);
p.Finish(diagnostic, start, sessionID, nil, 100.007);
assert(clockReads == reads + 1, "supplied diagnostic finish reread its boundary");
assert(not p.Begin(diagnostic, 100.008) and clockReads == reads + 1 and stackCalls == 1);
Contains(p.Report(), "boundary.diagnostic\t1\t2.000");
assert(p.Stop()); reads = clockReads;
p.Finish(diagnostic, start, sessionID, nil, 100.009);
assert(not jobs.Begin(nil, work, nil, 100.009));
assert(clockReads == reads);
print("PASS: shared boundaries, exact clock counts, legacy callers, invalid/order rejection, partial jobs, generations, and post-stack timing");
