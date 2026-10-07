-- Run from the repository root: lua tests/ProfilerJobs.lua
-- Exercise real Runner and coroutine scheduling with a deterministic frame clock.
local now, clockReads, timers, errors;
unpack = table.unpack or unpack;
tremove = table.remove;
local canYieldProtected = _VERSION ~= "Lua 5.1";
-- WoW accepts varargs in xpcall. Stock Lua 5.1 does not; emulate forwarding
-- for ordinary error/argument tests while keeping production Runner code intact.
if not canYieldProtected then
	local nativeXpcall = xpcall;
	xpcall = function(func, handler, ...)
		local args = { n = select("#", ...), ... };
		return nativeXpcall(function() return func(unpack(args, 1, args.n)); end, handler);
	end;
end
GetTimePreciseSec = function() clockReads = clockReads + 1; return now; end;
C_Timer = { After = function(seconds, callback) timers[#timers + 1] = { seconds, callback }; end };
C_AddOnProfiler, Enum = nil, nil;

---Construct fresh capture and Runner services with no client dependency.
---@return table app Isolated ATT services under test.
local function NewApp()
	now, clockReads, timers, errors = 100, 0, {}, {};
	local app = { print = function() end, report = function() end,
		PrintError = function(message) errors[#errors + 1] = message; end };
	assert(loadfile("lib/Profiler.lua"))("AllTheThings", app);
	assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app);
	assert(loadfile("lib/Runner.lua"))("AllTheThings", app);
	return app;
end

---Execute the callbacks already due on this frame, leaving later resumes queued.
---@param advance number? Seconds since the previous frame; nil leaves the fake clock unchanged.
local function Frame(advance)
	now = now + (advance or 0);
	local due, retained = {}, {};
	for _, timer in ipairs(timers) do
		if timer[1] == 0 then due[#due + 1] = timer[2]; else retained[#retained + 1] = timer; end
	end
	timers = retained;
	for _, callback in ipairs(due) do callback(); end
end

---Check a literal report fragment and include the full report on failure.
---@param report string Capture report under test.
---@param fragment string Expected literal report content.
local function Contains(report, fragment)
	assert(report:find(fragment, 1, true), "missing: " .. fragment .. "\n" .. report);
end

local app = NewApp();
local p, runner = app.Profiler, app.FunctionRunner;
local scope = p.RegisterScope("test.work", "runner", 2, "time", "Test work.");
local called = 0;
runner.Run(function() called = called + 1; end);
Frame(); Frame();
assert(called == 1 and clockReads == 0, "disabled Runner instrumentation reads the clock");
app.StartCoroutine("no-capture", function() called = called + 1; end);
Frame();
assert(called == 2 and clockReads == 0, "disabled coroutine instrumentation reads the clock");
assert(app.ProfilerJobs.Enqueue(scope) == nil);

-- Overview retains slices, and component captures remain free of job metadata.
assert(p.Start(30));
runner.Run(function() now = now + 0.004; end);
Frame(); Frame();
local report = p.Report();
Contains(report, "runner.default.slice");
assert(not report:find("Jobs (", 1, true));
assert(p.Start(30, 2));
local before = clockReads;
assert(app.ProfilerJobs.Enqueue(scope) == nil and clockReads == before, "Level 2 allocates job metadata");
runner.RunProfiled(scope, function(first, middle, last)
	assert(first == "a" and middle == "b" and last == "c");
	now = now + 0.005;
end, "a", "b", "c");
Frame(); Frame();
report = p.Report();
assert(#errors == 0, table.concat(errors, "\n"));
Contains(report, "test.work\t1\t5.000");
assert(not report:find("Jobs (", 1, true));
runner.RunProfiled(scope, function(...) assert(select("#", ...) == 1 and (...) == nil); end, nil);
Frame(); Frame();
assert(#errors == 0, table.concat(errors, "\n"));

-- A yield separates observed execution from elapsed wall time and queue wait.
if canYieldProtected then
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(function()
	Contains(p.GetCurrentContext(), "job=1");
	now = now + 0.005;
	coroutine.yield();
	now = now + 0.007;
end);
Frame(0.025);
assert(p.GetCurrentContext() == nil, "suspended job leaked into main-thread context");
Frame(0.100); Frame();
report = p.Report();
Contains(report, "runner.default.work\t2\t12.000");
Contains(report, "\tcompleted\tno\t25.000\t12.000\t112.000\t2\t1");
assert(not report:find("canceled", 1, true), "normal queue cleanup canceled a completed job");
end

-- Queue entries that predate capture have unknown enqueue boundaries and are partial.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
runner.Queue(function() now = now + 0.006; end);
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(); Frame(); Frame();
Contains(p.Report(), "\tcompleted\tyes\tunknown\t6.000\t6.000\t1\tunknown");

-- Parent origins are observed in the coroutine running the scheduling code.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(function()
	runner.Run(function() now = now + 0.003; end);
	now = now + 0.002;
end);
Frame(); Frame(0.020); Frame();
report = p.Report();
Contains(report, "2\trunner.default.work\trunner.default.work\t1\tcompleted");

-- Reset cancels only pending work; failed functions keep the original error path.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Queue(function() error("should be canceled"); end);
runner.Reset();
Contains(p.Report(), "\tcanceled\tno\tunknown\t0.000\tunknown\t0\t1");
runner.Run(function() error("expected runner failure"); end);
Frame(); Frame();
assert(#errors == 1 and errors[1]:find("expected runner failure", 1, true));
Contains(p.Report(), "\tfailed\tno\t");

-- Reset during a function clears pending entries without pretending to interrupt that function.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(function() now = now + 0.001; runner.Reset(); now = now + 0.002; end);
runner.Run(function() error("pending function must be canceled"); end);
Frame(); Frame();
report = p.Report();
Contains(report, "\tcompleted\tno\t0.000\t3.000\t3.000\t1\t1");
Contains(report, "\tcanceled\tno\tunknown\t0.000\tunknown\t0\t2");
assert(#errors == 0, "Reset did not cancel the pending function");

-- Session changes invalidate old queue metadata while retaining current execution.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Queue(function() now = now + 0.008; end);
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(); Frame(); Frame();
Contains(p.Report(), "\tcompleted\tyes\tunknown\t8.000");
runner.Run(function() now = now + 0.002; p.Reset(); end);
Frame(); Frame();
Contains(p.Report(), "No capture yet");

-- Capture stop freezes an incomplete job; later resumes cannot overwrite it.
if canYieldProtected then
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner" }));
runner.Run(function() now = now + 0.005; coroutine.yield(); now = now + 0.006; end);
Frame(); now = now + 0.020; assert(p.Stop());
local stopped = p.Report();
Contains(stopped, "\tincomplete\tyes\t0.000\t5.000\t25.000\t1\t1");
Frame(0.100); Frame();
assert(p.Report() == stopped, "post-capture work changed the retained job report");
end

-- Standalone pooled coroutines use the same pause/resume accounting and privacy boundary.
app = NewApp(); p = app.Profiler;
assert(p.Start(30, 4, { include = "runner" }));
app.StartCoroutine("a-private-dynamic-name", function()
	now = now + 0.004; coroutine.yield(); now = now + 0.006;
end);
Frame(0.010); Frame(0.200);
report = p.Report();
Contains(report, "coroutine.work\t2\t10.000");
Contains(report, "\tcompleted\tno\t10.000\t10.000\t210.000\t2\tunknown");
assert(not report:find("a-private-dynamic-name", 1, true));
app.StartCoroutine("failing", function() error("expected coroutine failure"); end);
Frame();
assert(#errors == 1 and errors[1]:find("expected coroutine failure", 1, true));
Contains(p.Report(), "\tfailed\tno\t");

-- Capacity and module exclusion bound metadata without suppressing actual work.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
assert(p.Start(30, 4, { include = "runner", jobBudget = 1 }));
runner.Run(function() end); runner.Run(function() called = called + 1; end);
Frame(); Frame(); Frame();
Contains(p.Report(), "Job observations omitted after capacity was reached:");
assert(called == 3, "job capacity dropped real queued work");
assert(p.Start(30, 4, { include = "events" }));
before = clockReads;
assert(app.ProfilerJobs.Enqueue(p.RegisterScope("filtered.work", "runner", 2, "time")) == nil);
assert(clockReads == before, "filtered job performs clock reads");

-- Discarding captures releases job records even while actual Runner queues survive.
app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
local weak = setmetatable({}, { __mode = "v" });
local weakIndex, seen = 0, {};
local enqueue = app.ProfilerJobs.Enqueue;
app.ProfilerJobs.Enqueue = function(...)
	local job = enqueue(...);
	if job then weakIndex = weakIndex + 1; weak[weakIndex] = job; end
	return job;
end;
for capture = 1, 6 do
	assert(p.Start(30, 4, { include = "runner" }));
	for offset = 1, 2 do
		runner.Queue(function(index) seen[index] = true; end, (capture - 1) * 2 + offset);
	end
end
assert(weakIndex == 12);
p.Reset(); collectgarbage("collect"); collectgarbage("collect");
for i = 1, weakIndex do assert(weak[i] == nil, "queued work retains discarded job " .. i); end
assert(next(seen) == nil, "observational reset executed real queued work");
app.ProfilerJobs.Enqueue = enqueue;
assert(p.Start(30, 4, { include = "runner" }));
runner.SetPerFrameDefault(20); runner.Run(); Frame(); Frame();
for i = 1, 12 do assert(seen[i], "observational reset discarded real queued arguments"); end
Contains(p.Report(), "\tcompleted\tyes\tunknown\t");

-- The active suspended function also releases its old session record on reset.
if canYieldProtected then
	app = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
	weak = setmetatable({}, { __mode = "v" });
	enqueue = app.ProfilerJobs.Enqueue;
	app.ProfilerJobs.Enqueue = function(...) local job = enqueue(...); weak[1] = job; return job; end;
	assert(p.Start(30, 4, { include = "runner" }));
	local resumed = false;
	runner.Run(function() coroutine.yield(); resumed = true; now = now + 0.005; end);
	Frame(); assert(weak[1] ~= nil);
	p.Reset(); collectgarbage("collect"); collectgarbage("collect");
	assert(weak[1] == nil, "ActiveJob retains discarded session metadata");
	assert(p.Start(30, 4, { include = "runner" }));
	Frame(); Frame();
	assert(resumed, "observational reset lost the suspended function");
	Contains(p.Report(), "\tcompleted\tyes\tunknown\t5.000");
end

-- Delayed pooled coroutines retain their callbacks while old metadata is released.
app = NewApp(); p = app.Profiler;
weak = setmetatable({}, { __mode = "v" });
enqueue = app.ProfilerJobs.Enqueue;
app.ProfilerJobs.Enqueue = function(...) local job = enqueue(...); weak[1] = job; return job; end;
assert(p.Start(30, 4, { include = "runner" }));
local delayedRan = false;
app.StartCoroutine("delayed", function() delayedRan = true; now = now + 0.003; end, 60);
local delayed;
for _, timer in ipairs(timers) do if timer[1] == 60 then delayed = timer[2]; end end
assert(delayed and weak[1]);
p.Reset(); collectgarbage("collect"); collectgarbage("collect");
assert(weak[1] == nil, "CoroutineJobs retains discarded session metadata");
assert(p.Start(30, 4, { include = "runner" }));
delayed(); Frame();
assert(delayedRan, "observational reset discarded the delayed callback");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t3.000");

-- Profiler listeners must not own a discarded dynamic Runner or its queued payload.
-- The existing app.Runners registry normally owns it; remove that owner explicitly
-- to verify profiling introduces no additional independent lifetime anchor.
app = NewApp(); p = app.Profiler;
assert(p.Start(30, 4, { include = "windows" }));
weak = setmetatable({}, { __mode = "v" });
do
	local temporary = app.CreateRunner("temporary-window-instance", "windows");
	local payload = { marker = "discarded queued payload" };
	weak[1], weak[2] = payload, temporary;
	temporary.Queue(function(value) assert(value.marker == "discarded queued payload"); end, payload);
	app.Runners["temporary-window-instance"] = nil;
end
collectgarbage("collect"); collectgarbage("collect");
assert(weak[1] == nil, "session listener retains discarded Runner queues and arguments");
assert(weak[2] == nil, "session listener retains discarded dynamic Runner");
p.Reset();
assert(p.Start(30, 4, { include = "windows" }));
Contains(p.Report(), "No measurements captured.");

-- Fixed capture policy avoids per-job filter calls; labels are formatted only on demand.
local nativeFormat, formatCalls = string.format, 0;
string.format = function(...) formatCalls = formatCalls + 1; return nativeFormat(...); end;
app = NewApp(); p = app.Profiler;
string.format = nativeFormat;
assert(p.Start(30, 4, { include = "events" }));
local excludedOverview = p.RegisterScope("overview.filtered", "runner", 1, "time");
local eventScope = p.RegisterScope("event.work", "events", 2, "time");
local jobs = app.ProfilerJobs;
before = clockReads;
assert(excludedOverview.enabled and jobs.Enqueue(excludedOverview) == nil and clockReads == before,
	"global overview bypassed the detail job filter");
p.IsLevelEnabled = function() error("job operations repeated the fixed-policy filter"); end;
local formatsBefore = formatCalls;
local parent = assert(jobs.Enqueue(eventScope, "test-origin", 1));
assert(jobs.Begin(parent, eventScope) == parent);
assert(formatCalls == formatsBefore, "Level 4 eagerly formatted unused context text");
local parentText = p.GetCurrentContext();
assert(parentText == "job=1 origin=test-origin" and formatCalls == formatsBefore + 1);
assert(p.GetCurrentContext() == parentText and formatCalls == formatsBefore + 1,
	"unchanged current context was reformatted");
local child = assert(jobs.Enqueue(eventScope));
assert(jobs.Begin(child, eventScope) == child);
local childText = p.GetCurrentContext();
assert(childText == "job=2 origin=event.work parent=1");
formatsBefore = formatCalls;
assert(p.GetCurrentContext() == childText and formatCalls == formatsBefore);
jobs.Pause(child, "completed");
assert(p.GetCurrentContext() == parentText and formatCalls == formatsBefore,
	"restoring parent context changed or reformatted its label");
jobs.Pause(parent);
assert(p.GetCurrentContext() == nil and p.Stop());
assert(jobs.Enqueue(eventScope) == nil and p.GetCurrentContext() == nil);

-- Timeline resume/yield entries reuse the immutable lifecycle label within one job.
formatCalls = 0;
string.format = function(...) formatCalls = formatCalls + 1; return nativeFormat(...); end;
app = NewApp(); p = app.Profiler;
string.format = nativeFormat;
assert(p.Start(30, 5, { include = "events" }));
eventScope = p.RegisterScope("event.timeline", "events", 2, "time");
jobs = app.ProfilerJobs;
formatsBefore = formatCalls;
parent = assert(jobs.Enqueue(eventScope, "alpha"));
assert(formatCalls == formatsBefore + 1, "first timeline label was not created lazily");
for resume = 1, 20 do
	assert(jobs.Begin(parent, eventScope) == parent);
	now = now + 0.001;
	jobs.Pause(parent);
end
assert(parent.resumes == 20 and math.abs(parent.execution - 20) < 0.000001);
assert(formatCalls == formatsBefore + 1, "resume/yield reformatted an immutable timeline label");
assert(p.Stop());
assert(formatCalls == formatsBefore + 1, "stop reformatted an immutable timeline label");
report = p.Report();
Contains(report, "job=1 origin=alpha");
assert(p.Start(30, 5, { include = "events" }));
child = assert(jobs.Enqueue(eventScope, "beta"));
assert(jobs.Begin(child, eventScope) == child);
assert(p.GetCurrentContext() == "job=1 origin=beta", "new session inherited an old job label");
jobs.Pause(child, "completed");
assert(p.Stop());

if not canYieldProtected then
	print("SKIP: stock Lua 5.1 cannot yield across xpcall; Runner protected-call yield/resume cases require a yieldable runtime.");
end
print("PASS: Runner/coroutine scheduling, parent origins, partial jobs, errors/cancellation, stop/reset, disabled gates, bounded metadata, and old-session record reclamation");
