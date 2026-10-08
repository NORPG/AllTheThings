-- Run with Lua 5.1 from the repository root.
-- Exercise capture-boundary path selection with the real scheduler and profiler.
local now, timers, errors, reads;
unpack = unpack or table.unpack;
tremove = table.remove;
local nativeXpcall = xpcall;
-- Stock Lua 5.1 lacks WoW's xpcall vararg forwarding. This shim forwards
-- ordinary calls only; it does not pretend protected calls can yield.
xpcall = function(func, handler, ...)
	local args = { n = select("#", ...), ... };
	return nativeXpcall(function() return func(unpack(args, 1, args.n)); end, handler);
end;
GetTimePreciseSec = function() reads = reads + 1; return now; end;
C_Timer = { After = function(seconds, callback) timers[#timers + 1] = { seconds, callback }; end };
C_AddOnProfiler, Enum = nil, nil;

---Create real services, then count their public observation methods after module loading.
---@return table app Fresh ATT services.
---@return table<string, integer> calls Observation counts visible to capture-boundary aliases.
local function NewApp()
	now, timers, errors, reads = 100, {}, {}, 0;
	local app = { print = function() end, report = function() end,
		PrintError = function(message) errors[#errors + 1] = message; end };
	assert(loadfile("lib/Profiler.lua"))("AllTheThings", app);
	assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app);
	assert(loadfile("lib/Runner.lua"))("AllTheThings", app);
	local calls = {};
	for _, owner in ipairs({ app.Profiler, app.ProfilerJobs }) do
		local names = owner == app.Profiler and { "Begin", "Finish", "CountScope" }
			or { "Enqueue", "Begin", "Pause", "Cancel" };
		for _, name in ipairs(names) do
			local key = (owner == app.Profiler and "scope." or "jobs.") .. name;
			local original = owner[name];
			calls[key] = 0;
			owner[name] = function(...)
				calls[key] = calls[key] + 1;
				return original(...);
			end;
		end
	end
	return app, calls;
end

---Execute only the callbacks due now, keeping newly queued frames separate.
---@param advance number? Seconds added to the deterministic clock before this frame.
local function Frame(advance)
	now = now + (advance or 0);
	local due, retained = {}, {};
	for _, timer in ipairs(timers) do
		if timer[1] == 0 then due[#due + 1] = timer[2]; else retained[#retained + 1] = timer; end
	end
	timers = retained;
	for _, callback in ipairs(due) do callback(); end
end

---Check a literal report fragment and include its context on failure.
---@param report string Retained report under test.
---@param fragment string Required literal fragment.
local function Contains(report, fragment)
	assert(report:find(fragment, 1, true), "missing: " .. fragment .. "\n" .. report);
end

---Sum observation calls, optionally selecting only job methods.
---@param calls table<string, integer> Public observation counters.
---@param prefix string? Optional key prefix limiting the sum.
---@return integer total Number of selected observations.
local function Total(calls, prefix)
	local total = 0;
	for name, count in pairs(calls) do
		if not prefix or name:sub(1, #prefix) == prefix then total = total + count; end
	end
	return total;
end

-- Ordinary queuing, reset, completion, errors, and pooled yields have no observer calls.
local app, calls = NewApp();
local p, runner = app.Profiler, app.FunctionRunner;
local completed = 0;
runner.Queue(function() error("pending entry must not execute"); end);
runner.Reset();
runner.SetPerFrameDefault(20);
runner.Queue(function(first, last) assert(first == "first" and last == "last"); completed = completed + 1; end, "first", "last");
runner.Queue(function(...) assert(select("#", ...) == 1 and (...) == nil); completed = completed + 1; end, nil);
runner.Run(function() error("expected plain failure"); end);
Frame(); Frame();
app.StartCoroutine("plain", function() completed = completed + 1; coroutine.yield(); completed = completed + 1; end);
Frame(); Frame();
assert(completed == 4 and #errors == 1 and errors[1]:find("expected plain failure", 1, true));
assert(Total(calls) == 0 and reads == 0, "inactive paths invoked observers or read a clock");

-- Levels 1 through 3 use timing/counters without calling the Jobs API at all.
for level = 1, 3 do
	app, calls = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
	assert(p.Start(30, level));
	runner.Run(function() now = now + 0.002; end); Frame(); Frame();
	app.StartCoroutine("components", function() now = now + 0.003; end); Frame();
	assert(Total(calls, "jobs.") == 0, "Level " .. level .. " called Jobs API");
	assert(p.Stop());
	local count, clock = Total(calls), reads;
	runner.Run(function() end); Frame(); Frame();
	app.StartCoroutine("stopped", function() end); Frame();
	assert(Total(calls) == count and reads == clock, "stopped paths invoked observers");
end

-- Explicit pre-capture pooled labels survive delayed scheduling; enqueue time stays unknown.
app, calls = NewApp(); p = app.Profiler;
local scope = p.RegisterScope("test.delayed.label", "runner", 2, "time", "Explicit pooled label.");
app.StartCoroutine("delayed", function() now = now + 0.005; end, 60, scope);
local delayed;
for _, timer in ipairs(timers) do if timer[1] == 60 then delayed = timer[2]; end end
assert(delayed and Total(calls) == 0);
assert(p.Start(30, 4, { include = "runner" })); delayed(); Frame();
Contains(p.Report(), "test.delayed.label\t1\t5.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t5.000\t5.000\t1\tunknown");

-- Explicit Runner queue labels also survive captures started after enqueue.
app, calls = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
scope = p.RegisterScope("test.queued.label", "runner", 2, "time", "Explicit Runner queue label.");
runner.QueueProfiled(scope, function() now = now + 0.009; end);
assert(Total(calls) == 0);
assert(p.Start(30, 4, { include = "runner" })); runner.Run(); Frame(); Frame();
Contains(p.Report(), "test.queued.label\t1\t9.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t9.000\t9.000\t1\tunknown");

-- Real Lua 5.1 pooled yields cover off -> capture -> stopped -> restarted capture.
app, calls = NewApp(); p = app.Profiler;
scope = p.RegisterScope("test.restart.label", "runner", 2, "time", "Retained pooled label.");
local phase = 0;
app.StartCoroutine("restart", function()
	phase = 1; coroutine.yield();
	phase = 2; now = now + 0.002; coroutine.yield();
	phase = 3; now = now + 0.003; coroutine.yield();
	phase = 4; now = now + 0.004;
end, nil, scope);
Frame(); assert(phase == 1 and Total(calls) == 0);
assert(p.Start(30, 4, { include = "runner" })); Frame(); assert(phase == 2);
Contains(p.Report(), "test.restart.label\t1\t2.000");
assert(p.Stop());
local stopped, count, clock = p.Report(), Total(calls), reads;
Frame(0.100); assert(phase == 3 and Total(calls) == count and reads == clock);
assert(p.Report() == stopped, "stopped pooled work changed its retained capture");
assert(p.Start(30, 4, { include = "runner" })); Frame(0.200); assert(phase == 4);
Contains(p.Report(), "test.restart.label\t1\t4.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t4.000\t4.000\t1\tunknown");

-- Starting inside an unobserved Runner function captures only later function entry.
app, calls = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
runner.SetPerFrameDefault(20);
runner.Queue(function() assert(p.Start(30, 4, { include = "runner" })); now = now + 0.010; end);
runner.Queue(function() now = now + 0.006; end);
runner.Run(); Frame(); Frame();
Contains(p.Report(), "runner.default.work\t1\t6.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t6.000\t6.000\t1\tunknown");
assert(calls["jobs.Begin"] == 1, "capture adopted an already-running function without a resume boundary");

-- Stopping inside measured execution switches following functions on that same frame.
app, calls = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
runner.SetPerFrameDefault(20); assert(p.Start(30, 4, { include = "runner" }));
local afterStop, stoppedReads;
runner.Queue(function() now = now + 0.001; assert(p.Stop()); afterStop, stoppedReads = Total(calls), reads; end);
runner.Queue(function() now = now + 0.002; end);
runner.Run(); Frame(); Frame();
assert(Total(calls) == afterStop and reads == stoppedReads, "old measured continuation invoked stopped observers");

-- Restart inside a function discards old tokens and measures subsequent work once.
app, calls = NewApp(); p, runner = app.Profiler, app.FunctionRunner;
runner.SetPerFrameDefault(20); assert(p.Start(30, 4, { include = "runner" }));
runner.Queue(function() now = now + 0.001; assert(p.Start(30, 4, { include = "runner" })); now = now + 0.010; end);
runner.Queue(function() now = now + 0.007; end);
runner.Run(); Frame(); Frame();
Contains(p.Report(), "runner.default.work\t1\t7.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t7.000\t7.000\t1\tunknown");

-- Capture started inside a pooled function begins its partial observation on its next resume.
app, calls = NewApp(); p = app.Profiler;
app.StartCoroutine("inside-start", function()
	assert(p.Start(30, 4, { include = "runner" })); now = now + 0.020; coroutine.yield();
	now = now + 0.005;
end);
Frame(); Contains(p.Report(), "No measurements captured.");
Frame(0.100);
Contains(p.Report(), "coroutine.work\t1\t5.000");
Contains(p.Report(), "\tcompleted\tyes\tunknown\t5.000\t5.000\t1\tunknown");
-- The corresponding current object's public identities must survive all session transitions.
local identities = { runner.Run, runner.Queue, runner.Reset, app.StartCoroutine };
p.Reset(); assert(p.Start(30, 4, { include = "runner" })); assert(p.Stop());
assert(runner.Run == identities[1] and runner.Queue == identities[2] and runner.Reset == identities[3]
	and app.StartCoroutine == identities[4], "capture selection replaced public function identities");

print("PASS: capture-boundary Runner/coroutine paths, zero stopped observers, no low-level Jobs calls, retained labels, and in-function session transitions");
print("SKIP: stock Lua 5.1 cannot yield across xpcall; protected Runner invocation adoption requires WoW's yieldable runtime.");
