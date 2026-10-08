-- Run from the repository root with Lua 5.1: lua tests/ProfilerEvents.lua
-- Real event dispatch, queue coalescing, handler ordering, and labeled timings.
local now, timers, errors = 100, {}, {};
unpack = table.unpack or unpack;
tremove = table.remove;
tinsert = table.insert;
local canYieldProtected = _VERSION ~= "Lua 5.1";
-- Match WoW's vararg xpcall forwarding for stock Lua 5.1; production remains unchanged.
if not canYieldProtected then
	local nativeXpcall = xpcall;
	xpcall = function(func, handler, ...)
		local args = { n = select("#", ...), ... };
		return nativeXpcall(function() return func(unpack(args, 1, args.n)); end, handler);
	end;
end
GetTimePreciseSec = function() return now; end;
C_Timer = { After = function(seconds, callback) timers[#timers + 1] = { seconds, callback }; end };
C_AddOnProfiler, Enum = nil, nil;
local app = {
	print = function() end, PrintDebug = function() end, report = function() end,
	PrintError = function(err) errors[#errors + 1] = err; end,
	events = {},
	MetaTable = { AutoTable = { __index = function(t, key) local value = {}; rawset(t, key, value); return value; end } },
	wipearray = function(array) for i = #array, 1, -1 do array[i] = nil; end end,
	RegisterFuncEvent = function(self, event, func) self.events[event] = func; end,
	CallbackHandlers = { Callback = function(func, argument) C_Timer.After(0, function() func(argument); end); end },
};
assert(loadfile("lib/Profiler.lua"))("AllTheThings", app);
assert(loadfile("lib/Runner.lua"))("AllTheThings", app);
assert(loadfile("src/Events.lua"))("AllTheThings", app);
local p = app.Profiler;

---Run only the callbacks already queued for this frame.
---@param advance number? Seconds of scheduling delay before this frame.
local function Frame(advance)
	now = now + (advance or 0);
	local due, later = {}, {};
	for _, timer in ipairs(timers) do
		if timer[1] == 0 then due[#due + 1] = timer[2]; else later[#later + 1] = timer; end
	end
	timers = later;
	for _, callback in ipairs(due) do callback(); end
end

---Drain pending frame callbacks without invoking automatic capture-stop timers.
local function Drain()
	for _ = 1, 100 do
		local pending = false;
		for _, timer in ipairs(timers) do if timer[1] == 0 then pending = true; break; end end
		if not pending then return; end
		Frame(0.010);
	end
	error("event sequence did not settle");
end

---Verify a literal fragment while retaining the report for debugging.
---@param report string Capture output under test.
---@param fragment string Expected exact text.
local function Contains(report, fragment)
	assert(report:find(fragment, 1, true), "missing: " .. fragment .. "\n" .. report);
end

local order = {};
local function Last() order[#order + 1] = "last"; now = now + 0.003; end
local function First(value) assert(value == "argument"); order[#order + 1] = "first"; now = now + 0.004; end
app.AddEventHandler("OnWindowUpdated", Last, false, "last");
app.AddEventHandler("OnWindowUpdated", First, true, "first");
assert(p.Start(30, 3));
app.HandleEvent("OnWindowUpdated", "argument");
assert(table.concat(order, ",") == "first,last");
local report = p.Report();
Contains(report, "event.handler.OnWindowUpdated.first\t1\t4.000");
Contains(report, "event.handler.OnWindowUpdated.last\t1\t3.000");
Contains(report, "event.handler.OnWindowUpdated.first.calls\t1");

-- Removing and prepending handlers must move profiler labels with their functions.
app.RemoveEventHandler(First); Drain();
order = {};
assert(p.Start(30, 3));
app.HandleEvent("OnWindowUpdated", "argument");
assert(table.concat(order, ",") == "last");
report = p.Report();
Contains(report, "event.handler.OnWindowUpdated.last\t1\t3.000");
assert(not report:find("event.handler.OnWindowUpdated.first", 1, true));
app.RemoveAllEventHandlers("OnWindowUpdated");
app.AddEventHandler("OnWindowUpdated", First, false, "new");
assert(p.Start(30, 3));
app.HandleEvent("OnWindowUpdated", "argument");
Contains(p.Report(), "event.handler.OnWindowUpdated.new\t1\t4.000");

-- Queued calls count trigger/accepted/coalesced at dispatch and invocation at execution.
local calls = 0;
app.AddEventHandler("OnRecalculate", function(argument)
	assert(argument == "first request"); calls = calls + 1;
	now = now + 0.005; if canYieldProtected then coroutine.yield(); end; now = now + 0.007;
end, false, "collection");
assert(p.Start(30, 3, { include = "events" }));
app.HandleEvent("OnRecalculate", "first request");
app.HandleEvent("OnRecalculate", "coalesced request");
report = p.Report();
Contains(report, "event.trigger.OnRecalculate\t2");
Contains(report, "event.accepted.OnRecalculate\t1");
Contains(report, "event.coalesced.OnRecalculate\t1");
assert(not report:find("event.handler.OnRecalculate.collection.calls", 1, true), "queued work counted as executed");
Frame(0.020); Frame(0.100); Drain();
assert(calls == 1);
report = p.Report();
Contains(report, "event.handler.OnRecalculate.collection\t" .. (canYieldProtected and "2" or "1") .. "\t12.000");
Contains(report, "event.handler.OnRecalculate.collection.calls\t1");

-- Existing overview captures do not collect handler-stage measurements.
assert(p.Start(30));
app.HandleEvent("OnWindowUpdated", "argument");
report = p.Report();
assert(not report:find("event.handler.", 1, true));

-- Synchronous errors still escape directly; queued errors retain Runner handling.
app.AddEventHandler("OnWindowRefreshed", function() error("immediate event failure"); end, false, "failure");
assert(p.Start(30, 3));
local ok, err = pcall(app.HandleEvent, "OnWindowRefreshed");
assert(not ok and err:find("immediate event failure", 1, true) and #errors == 0);
app.DesignateRunnerEvent("QueuedFailure");
app.AddEventHandler("QueuedFailure", function() error("queued event failure"); end, false, "failure");
assert(p.Start(30, 3, { include = "events" }));
app.HandleEvent("QueuedFailure"); Drain();
assert(#errors == 1 and errors[1]:find("queued event failure", 1, true));
Contains(p.Report(), "event.handler.QueuedFailure.failure.calls\t1");

-- Labels queued before capture survive Start/Reset; observations do not retain jobs.
local labeled = p.RegisterScope("test.runner.work", "events", 2, "time", "Labeled Runner work under test.");
local invoked = p.RegisterScope("test.runner.calls", "events", 3, "counter", "Actual labeled invocations under test.");
local runner = app.CreateRunner("level3-fixture");
runner.RegisterProfiledScope(labeled, invoked);
p.Reset();
local arguments;
runner.QueueProfiled(labeled, function(...)
	arguments = { n = select("#", ...), ... };
	now = now + 0.002;
end, "first", nil, "third");
assert(p.Start(30, 3, { include = "events" }));
runner.Run(); Drain();
assert(arguments.n == 3 and arguments[1] == "first" and arguments[2] == nil and arguments[3] == "third");
report = p.Report();
Contains(report, "test.runner.work\t1\t2.000");
Contains(report, "test.runner.calls\t1");
assert(not report:find("runner.other.calls", 1, true), "labeled invocation also counted as generic work");
assert(app.ProfilerJobs == nil);

-- Runner Reset discards pending labels together with their real queued functions.
local discarded, kept = 0, 0;
runner.QueueProfiled(labeled, function() discarded = discarded + 1; end);
runner.Reset();
assert(p.Start(30, 3));
runner.Run(function(value) assert(value == "kept"); kept = kept + 1; now = now + 0.001; end, "kept");
Drain();
assert(discarded == 0 and kept == 1);
report = p.Report();
Contains(report, "runner.other.work\t1\t1.000");
Contains(report, "runner.other.calls\t1");
assert(not report:find("test.runner.work", 1, true));
assert(not pcall(runner.Queue, "not a function"));

-- Pooled coroutines yield through resume in stock Lua 5.1; frame waits stay excluded.
local pooledScope = p.RegisterScope("test.coroutine.work", "runner", 2, "time", "Pooled coroutine execution segments.");
local pooledCalls = 0;
local function PooledWork()
	pooledCalls = pooledCalls + 1;
	now = now + 0.004;
	coroutine.yield();
	now = now + 0.006;
end
assert(p.Start(30, 3));
app.StartCoroutine("level3-pooled", PooledWork, nil, pooledScope);
Frame(0.030);
assert(pooledCalls == 1);
p.Stop();
Frame(0.200); Drain();
report = p.Report();
Contains(report, "test.coroutine.work\t1\t4.000");
Contains(report, "coroutine.slice\t1\t4.000");
assert(p.Start(30, 3));
app.StartCoroutine("level3-pooled", PooledWork, nil, pooledScope);
Frame(0.030); Frame(0.200); Drain();
assert(pooledCalls == 2);
report = p.Report();
Contains(report, "test.coroutine.work\t2\t10.000");
Contains(report, "coroutine.slice\t2\t10.000");

if not canYieldProtected then print("SKIP: stock Lua 5.1 cannot yield across xpcall; deferred-handler yield/resume requires in-game validation."); end
print("PASS: event labels/order/coalescing/errors, Runner labels/reset/arguments, pooled coroutine slices, and capture boundaries");
