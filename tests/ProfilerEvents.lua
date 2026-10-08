-- Run from the repository root: lua tests/ProfilerEvents.lua
-- Real event dispatch, queue coalescing, handler ordering, and labeled timings.
local now, timers, errors, clockReads = 100, {}, {}, 0;
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
GetTimePreciseSec = function() clockReads = clockReads + 1; return now; end;
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
assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app);
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
assert(p.Start(30, 4, { include = "events" }));
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
Contains(report, canYieldProtected and "\tcompleted\tno\t20.000\t12.000\t112.000\t2\t1"
	or "\tcompleted\tno\t20.000\t12.000\t12.000\t1\t1");

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
assert(p.Start(30, 4, { include = "events" }));
app.HandleEvent("QueuedFailure"); Drain();
assert(#errors == 1 and errors[1]:find("queued event failure", 1, true));
Contains(p.Report(), "\tfailed\tno\t");

-- Stopped immediate dispatch and cached callbacks never invoke observer methods.
assert(p.Stop());
local cachedHandleEvent = app.HandleEvent;
local inactiveOrder = {};
app.DesignateImmediateEvent("InactiveObservers");
app.DesignateImmediateEvent("OnSourcesCollected");
app.AddEventHandler("InactiveObservers", function(...)
	assert(select("#", ...) == 3);
	local first, middle, last = ...;
	assert(first == "first" and middle == nil and last == "last");
	inactiveOrder[#inactiveOrder + 1] = "arguments";
end, false, "arguments");
app.AddEventHandler("OnSourcesCollected", function() inactiveOrder[#inactiveOrder + 1] = "callback"; end, false, "callback");
local observerNames = { "Begin", "Finish", "Count", "CountScope" };
local jobNames = { "Enqueue", "Begin", "Pause", "Cancel" };
local savedObservers, savedJobs = {}, {};
for _, name in ipairs(observerNames) do
	savedObservers[name] = p[name];
	p[name] = function() error("inactive event invoked Profiler." .. name); end;
end
for _, name in ipairs(jobNames) do
	savedJobs[name] = app.ProfilerJobs[name];
	app.ProfilerJobs[name] = function() error("inactive event invoked Jobs." .. name); end;
end
local readsBefore = clockReads;
local inactiveOK, inactiveError = pcall(function()
	cachedHandleEvent("InactiveObservers", "first", nil, "last");
	cachedHandleEvent("OnSourcesCollected");
	app.CallbackEvent("OnSourcesCollected"); Frame();
end);
for name, method in pairs(savedObservers) do p[name] = method; end
for name, method in pairs(savedJobs) do app.ProfilerJobs[name] = method; end
assert(inactiveOK, inactiveError);
assert(clockReads == readsBefore, "inactive immediate event read the profile clock");
assert(table.concat(inactiveOrder, ",") == "arguments,callback,callback");
assert(app.HandleEvent == cachedHandleEvent, "capture transitions replaced the public event function");

-- Deferred labels survive an inactive enqueue and become partial jobs at execution.
p.Reset();
app.DesignateRunnerEvent("QueuedBeforeCapture");
app.AddEventHandler("QueuedBeforeCapture", function(value)
	assert(value == "retained argument"); now = now + 0.004;
end, false, "retained");
cachedHandleEvent("QueuedBeforeCapture", "retained argument");
assert(p.Start(30, 4, { include = "events" }));
Drain(); report = p.Report();
Contains(report, "event.handler.QueuedBeforeCapture.retained\t1\t4.000");
Contains(report, "event.handler.QueuedBeforeCapture.retained.calls\t1");
Contains(report, "\tcompleted\tyes\tunknown\t4.000");
assert(not report:find("event.accepted.QueuedBeforeCapture", 1, true));

-- A plain dispatch keeps its entry policy; nested dispatches see a newly started capture.
p.Reset();
app.DesignateImmediateEvent("StartDuringDispatch");
app.DesignateImmediateEvent("NestedAfterStart");
local startOnce = true;
app.AddEventHandler("NestedAfterStart", function() now = now + 0.003; end, false, "nested");
app.AddEventHandler("StartDuringDispatch", function()
	if startOnce then
		startOnce = false;
		assert(p.Start(30, 3));
		cachedHandleEvent("NestedAfterStart");
	end
end, false, "start");
app.AddEventHandler("StartDuringDispatch", function() now = now + 0.002; end, false, "after");
cachedHandleEvent("StartDuringDispatch"); report = p.Report();
Contains(report, "event.handler.NestedAfterStart.nested\t1\t3.000");
assert(not report:find("event.handler.StartDuringDispatch", 1, true), "plain dispatch adopted a mid-handler capture");
cachedHandleEvent("StartDuringDispatch");
Contains(p.Report(), "event.handler.StartDuringDispatch.after\t1\t2.000");

-- Stop inside a measured handler freezes the report; remaining handlers run plainly.
app.DesignateImmediateEvent("StopDuringDispatch");
local stoppedInside;
app.AddEventHandler("StopDuringDispatch", function()
	now = now + 0.001; assert(p.Stop()); stoppedInside = p.Report();
end, false, "stop");
app.AddEventHandler("StopDuringDispatch", function() now = now + 0.004; end, false, "after");
assert(p.Start(30, 3));
cachedHandleEvent("StopDuringDispatch");
assert(p.Report() == stoppedInside, "remaining handlers changed the stopped capture");
assert(not stoppedInside:find("event.handler.StopDuringDispatch.after", 1, true));

-- Reset and replacement Start invalidate the dispatch generation without swallowing work.
app.DesignateImmediateEvent("ResetDuringDispatch");
local resetAfter = 0;
app.AddEventHandler("ResetDuringDispatch", function() p.Reset(); end, false, "reset");
app.AddEventHandler("ResetDuringDispatch", function() resetAfter = resetAfter + 1; end, false, "after");
assert(p.Start(30, 3)); cachedHandleEvent("ResetDuringDispatch");
assert(resetAfter == 1); Contains(p.Report(), "No capture yet");
app.DesignateImmediateEvent("ReplaceDuringDispatch");
local replaceAfter = 0;
app.AddEventHandler("ReplaceDuringDispatch", function() assert(p.Start(30, 3)); end, false, "replace");
app.AddEventHandler("ReplaceDuringDispatch", function() replaceAfter = replaceAfter + 1; now = now + 0.004; end, false, "after");
assert(p.Start(30, 3)); cachedHandleEvent("ReplaceDuringDispatch");
assert(replaceAfter == 1); Contains(p.Report(), "No measurements captured.");
assert(not p.Report():find("event.handler.ReplaceDuringDispatch", 1, true), "old dispatch wrote into the replacement capture");
assert(app.HandleEvent == cachedHandleEvent);

-- Once handlers preserve deferred removal and argument forwarding on the plain path.
p.Reset();
app.DesignateImmediateEvent("PlainOnce");
local onceCalls = 0;
app.AddEventHandlerOnce("PlainOnce", function(value) assert(value == "once argument"); onceCalls = onceCalls + 1; end, false, "once");
cachedHandleEvent("PlainOnce", "once argument"); Drain();
cachedHandleEvent("PlainOnce", "once argument");
assert(onceCalls == 1, "plain dispatch changed one-shot handler removal");

if not canYieldProtected then print("SKIP: stock Lua 5.1 cannot yield across xpcall; deferred-handler yield/resume is exercised on yieldable runtimes."); end
print("PASS: event labels, inactive observer bypass, capture transitions, queued-before-capture work, ordering/removal, coalescing, and original errors");
