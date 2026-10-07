
-- Runner Lib
local _, app = ...;

-- Concepts:
-- Capability to add to and run an entire set of Functions each frame, removing those which do not return a status
-- Capability to add and run coroutine Functions, with one loop of iteration per frame
-- Capability to add to and run a sequence of Functions with a specific allotment being processed individually each frame

-- Global locals
--- @type function,function,function,function,function,function,function,function,function,function,function,
local math_max, tonumber, unpack, coroutine, type, select, tremove, pcall,xpcall, C_Timer_After,GetTimePreciseSec =
	  math.max, tonumber, unpack, coroutine, type, select, tremove, pcall,xpcall, C_Timer.After,GetTimePreciseSec
--- @type function,function,function,function,
local c_create, c_yield, c_resume, c_status
	= coroutine.create, coroutine.yield, coroutine.resume, coroutine.status;
---@type ATTProfiler
local Profiler = app.Profiler;
---@type ATTProfilerJobs
local ProfileJobs = app.ProfilerJobs;
local CoroutineScope = Profiler.RegisterScope("coroutine.work", "runner", 2, "time", "Coroutine execution segments; waits excluded.");
local CoroutineSliceScope = Profiler.RegisterScope("coroutine.slice", "runner", 1, "time", "StartCoroutine resume durations; waits excluded.");
-- Stable built-in names retain their existing overview IDs. Dynamic window
-- suffixes and external Runner names share a fixed fallback instead of expanding the registry.
local ProfileRunnerModules = {
	default = "runner", events = "events", update = "collection", collection = "collection",
	costs = "costs", cost_collector = "costs", upgrade = "upgrade", inventory = "inventory",
	reagent_collector = "costs", search = "search", vignette = "runner", contributor = "runner",
	waypoint = "runner", dynamic = "collection", quests = "collection",
};
---@type table<thread, ATTProfilerScope>, table<thread, ATTProfilerJob>
local CoroutineScopes, CoroutineJobs = {}, {};
---@class ATTRunnerProfileState
---@field jobs table<integer, ATTProfilerJob> Optional records parallel to real queued functions.
---@field activeJob ATTProfilerJob? Job associated with the currently executing or suspended function.
---@field reset fun() Release observations without changing real Runner work.
---@type table<ATTRunnerProfileState, boolean>
local RunnerProfileStates = setmetatable({}, { __mode = "k" });

local function wipearray(t, max)
	local c = math_max(#t, max or 0)
	for i=1,c do t[i] = nil end
end
Profiler.AddSessionListener(function(event)
	if event ~= "reset" then return; end
	-- This single listener weakly observes Runner state. It never owns dynamic
	-- Runner lifetimes or keeps their queued functions and parameters alive.
	CoroutineJobs = {};
	for state in pairs(RunnerProfileStates) do state.reset(); end
end);

local Stack = {};
local StackParams = {};
-- Tracks whether the Stack has already been requested to begin running
local RunningStack;
-- Function that queues RunStack only once regardless of call-count within one frame
local QueueStack;
-- A static coroutine which can be invoked to reverse-sequentially process all Functions within the Stack,
-- passing the corresponding Stack param to each called Function.
-- Any Functions which do not return a status will be removed
local StackCo
local StackIndex = 1
local function SetStackCo()
	-- app.PrintDebug("SetStackCo")
	StackCo = c_create(function()
		while true do
			-- app.PrintDebug("StackCo:Call",#Stack)
			local f, p, status, err;
			for i=#Stack,1,-1 do
				f, p = Stack[i], StackParams[i];
				-- app.PrintDebug("StackCo:Run",i,f,p)
				status, err = pcall(f, p);
				-- Function call has an error or it is not continuing, remove it from the Stack
				if not status or not err then
					if not status then app.PrintError(err, "StackCo", StackCo) end
					-- app.PrintDebug("StackCo:Remove",i)
					tremove(Stack, i);
					tremove(StackParams, i);
					StackIndex = StackIndex - 1
				end
			end
			-- app.PrintDebug("StackCo:Done",f,p)
			-- Re-call StackCo if anything remains in the Stack
			if #Stack > 0 then
				-- app.PrintDebug("StackCo:QueueStack",#Stack)
				QueueStack();
			end
			-- after processing the Stack, yield this coroutine
			-- app.PrintDebug("StackCo:Yield")
			c_yield();
		end
	end)
end
SetStackCo()
-- Function that begins a once-per-frame pass of the StackCo to run all Functions in the Stack
local function RunStack()
	-- app.PrintDebug("StackCoStatus:",c_status(StackCo))
	if c_status(StackCo) == "dead" then SetStackCo() end
	RunningStack = nil;
	local ok, err = pcall(c_resume, StackCo);
	if not ok then app.PrintError(err, "RunStack", StackCo) end
end
QueueStack = function()
	-- app.PrintDebug("QueueStackStatus:",RunningStack and "REPEAT" or "FIRST",c_status(StackCo))
	if RunningStack then return; end
	RunningStack = true;
	C_Timer_After(0, RunStack);
end
-- Accepts a param and Function which will execute on the following frame using the provided param
local function Push(param, name, func)
	Stack[StackIndex] = func;
	StackParams[StackIndex] = param or 1;
	StackIndex = StackIndex + 1
	-- app.PrintDebug("Push @",#StackParams,name,func,param)
	QueueStack();
end
app.Push = Push;

-- Represents a key-weak table containing a cache of functions which are desired to be run within a coroutine.
-- If the function is temporary and all references are removed externally, then the respective cache entry can be removed as well when garbagecollection
-- happens to run. This makes sure that we don't permanently hold references to every coroutined-function during the lifetime of the client
local CoroutineCache = setmetatable({}, {
	__mode = "k",
	__index = function(t, func)
		if type(func) ~= "function" then return end
		-- Coroutines are typically not designed to be re-run, so wrap the func in a permanent loop so it can simply be restarted
		-- when retrieved from the cache instead of needing to be re-created each time it is used
		local co = c_create(function() while true do func(); c_yield(false); end end);
		-- app.PrintDebug("CO:New",co,"<==",func)
		t[func] = co;
		return co;
	end
});
local InUse = {} -- co -> name, while checked out
local function GetCoroutine(func, name)
	local co = CoroutineCache[func]
	if InUse[co] then
		-- pooled co already checked out elsewhere; make a one-off instead of colliding
		co = c_create(function() while true do func() c_yield(false) end end)
		app.report("Pooled coroutine re-use warning!",func,name)
	end
	-- Mark this name/coroutine until the coroutine is returned
	CoroutineCache[name] = true
	InUse[co] = name
	return co
end
-- Allows freeing a coroutine and the respective name used to create it initially
local function ReturnCoroutine(co)
	local name = InUse[co]
	-- app.PrintDebug("CO:Return",name,co)
	CoroutineCache[name] = nil
	InUse[co] = nil
end
-- We will make this a weak-value cache, such that the Push methods can be cleaned up/recreated if needed
local _PushQueue = setmetatable({}, {__mode = "v",})
-- Represents a small set of Push functions which are used to allow the Stack to handle coroutine processing. As these functions have no bearing
-- on the coroutine they run, they can be reused and only created when the current amount is not enough to handle all concurrent coroutines.
local PushQueue = setmetatable({}, {
	-- any index reference will return the next available pusher
	__index = function()
		local pusher = _PushQueue[#_PushQueue];
		if pusher then
			-- app.PrintDebug("PUSH:Cache",#_PushQueue)
			_PushQueue[#_PushQueue] = nil;
			return pusher;
		end
		-- app.PrintDebug("PUSH:New",#_PushQueue + 1)
		local function pushfunc(co)
			-- Check the status of the coroutine
			-- app.PrintDebug("PUSH:Run",pushfunc,"=>",co)
			if co and c_status(co) ~= "dead" then
				local scope = CoroutineScopes[co] or CoroutineScope;
				local job = ProfileJobs.Begin(CoroutineJobs[co], scope, co);
				CoroutineJobs[co] = job;
				local profileStart, profileSession = Profiler.Begin(scope);
				local sliceStart, sliceSession = Profiler.Begin(CoroutineSliceScope);
				local ok, err = c_resume(co);
				Profiler.Finish(scope, profileStart, profileSession);
				Profiler.Finish(CoroutineSliceScope, sliceStart, sliceSession);
				ProfileJobs.Pause(job, not ok and "failed" or (err == false and "completed" or nil));
				if ok then
					if err == false then
						-- This means the coroutine signals completion by returning false
						-- app.PrintDebug("PUSH.Run.Complete",co)
					else
						-- This means more work is required.
						-- app.PrintDebug("PUSH.Run.Yielded",co)
						return true;
					end
				else app.PrintError(err, "CO:resume", co) end
			end
			if co then
				ProfileJobs.Cancel(CoroutineJobs[co]);
				CoroutineScopes[co], CoroutineJobs[co] = nil, nil;
			end
			-- After the pusher is done running the coroutine, it can return itself to the cache
			_PushQueue[#_PushQueue + 1] = pushfunc;
			-- app.PrintDebug("PUSH:Return",pushfunc,"=>",#_PushQueue)
			-- Then grab the corresponding Name of this coroutine based on the coroutine cache
			-- and swap in the coroutine for the Name, and un-flag the Name from the NameCache
			ReturnCoroutine(co);
		end;
		return pushfunc;
	end
});
-- Allows running a function on a coroutine until it completes
---Queue a pooled coroutine, optionally assigning a registered scope to its resume slices.
---@param name string|any Existing coroutine deduplication key; kept out of metric IDs.
---@param func function Coroutine function; its return and yield behavior are unchanged.
---@param delay number? Delay in seconds before the first push; nil starts on the next frame.
---@param profileScope ATTProfilerScope? Stable work label; nil uses the generic coroutine scope.
local function StartCoroutine(name, func, delay, profileScope)
	if not func or CoroutineCache[name] then return; end
	-- app.PrintDebug("CO:Prep",name);

	local co = GetCoroutine(func, name);
	local pusher = PushQueue.Next;
	local scope = profileScope or CoroutineScope;
	if profileScope then CoroutineScopes[co] = scope; end
	CoroutineJobs[co] = ProfileJobs.Enqueue(scope);

	if delay and delay > 0 then
		-- app.PrintDebug("CO:Delay",delay,name,pusher,co);
		C_Timer_After(delay, function() Push(co, name, pusher) end);
	else
		-- app.PrintDebug("CO:Start",name,pusher,co);
		Push(co, name, pusher);
	end
end
app.StartCoroutine = StartCoroutine;

-- Iterative Function Runner
-- Creates a Function Runner which can execute a sequence of Functions on a set iteration per frame update
local function CreateRunner(name, profileModule)
	local FunctionQueue, ParameterBucketQueue, ParameterSingleQueue, Config = {}, {}, {}, { PerFrame = 1 };
	---@type table<integer, ATTProfilerScope>, table<integer, ATTProfilerJob>
	local ProfileScopeQueue, ProfileJobQueue = {}, {};
	local ProfileState = { jobs = ProfileJobQueue };
	---@cast ProfileState ATTRunnerProfileState
	local OnStart, OnReset
	local Name = "Runner:"..name;
	local knownModule = ProfileRunnerModules[name];
	local module = knownModule or (profileModule == "windows" and "windows" or "runner");
	local scopeName = knownModule and name or (module == "windows" and "windows" or "other");
	local ProfileSliceScope = Profiler.RegisterScope("runner."..scopeName..".slice", "runner", 1, "time", "Runner resume durations; waits excluded.");
	local ProfileWorkScope = Profiler.RegisterScope("runner."..scopeName..".work", module, 2, "time", "Runner function execution segments; waits excluded.");
	local ProfileCallsScope = Profiler.RegisterScope("runner."..scopeName..".calls", module, 3, "counter", "Functions actually invoked by this Runner.");
	---@type table<ATTProfilerScope, ATTProfilerScope>
	local ProfileCallScopes = {};
	---@type ATTProfilerScope?, number?, integer?
	local ActiveScope, ActiveStart, ActiveSession;
	local RunnerCoroutine;
	local QueueIndex, RunIndex = 1, 1;
	---Resume timing for the active function after a between-frame wait.
	local function BeginActive()
		---@cast ActiveScope ATTProfilerScope
		ProfileState.activeJob = ProfileJobs.Begin(ProfileState.activeJob, ActiveScope, RunnerCoroutine);
		ActiveStart, ActiveSession = Profiler.Begin(ActiveScope);
	end
	---Close the current execution segment without including later scheduling waits.
	---@param status ATTProfilerJobStatus? Completion/error state; nil indicates a yielded segment.
	local function PauseActive(status)
		---@cast ActiveScope ATTProfilerScope
		Profiler.Finish(ActiveScope, ActiveStart, ActiveSession);
		ProfileJobs.Pause(ProfileState.activeJob, status);
		ActiveStart, ActiveSession = nil, nil;
	end
	ProfileState.reset = function()
		-- Observation references must not keep successive session budgets alive
		-- in long-lived queues. The real functions, arguments, and labels survive.
		wipearray(ProfileJobQueue, QueueIndex - 1);
		ProfileState.activeJob, ActiveStart, ActiveSession = nil, nil, nil;
	end;
	RunnerProfileStates[ProfileState] = true;
	local Pushed, perFrame
	local function SetPerFrame(count)
		Config.PerFrame = math_max(1, tonumber(count) or 1);
		-- app.PrintDebug("FR.PerFrame."..name,Config.PerFrame)
		-- always yield immediately so that it takes effect when encountered
		perFrame = 0
	end
	local function Reset()
		-- app.PrintDebug("FR:Reset."..name,Pushed and "RUNNING" or "STOPPED","Qi",QueueIndex,"Ri",RunIndex,"@",Config.PerFrame)
		if OnReset then OnReset() end
		-- Reset clears pending entries; it cannot interrupt the Lua function already running.
		for _, job in pairs(ProfileJobQueue) do if job ~= ProfileState.activeJob then ProfileJobs.Cancel(job); end end
		SetPerFrame(Config.PerFrameDefault or 1)
		-- when done with all functions in the queue, reset the indexes and clear the queues of data
		RunIndex = Pushed and 0 or 1	-- reset while running will resume and continue at index 1
		wipearray(FunctionQueue, QueueIndex - 1)
		wipearray(ParameterBucketQueue, QueueIndex - 1)
		wipearray(ParameterSingleQueue, QueueIndex - 1)
		wipearray(ProfileScopeQueue, QueueIndex - 1)
		wipearray(ProfileJobQueue, QueueIndex - 1)
		FunctionQueue[0] = nil
		QueueIndex = 1
	end
	local function Stats()
		app.print(name,Pushed and "RUNNING" or "STOPPED","Qi",QueueIndex,"Ri",RunIndex,"@",Config.PerFrame)
	end

	-- Static coroutine for the Runner which runs one loop each time the Runner is called, and yields on the Stack
	local function err(msg)
		app.PrintError(msg, "Runner."..name, RunnerCoroutine)
	end
	local SetRunnerCoroutine = function()
		RunnerCoroutine = c_create(function()
			local FunctionQueue = FunctionQueue
			local ParameterBucketQueue = ParameterBucketQueue
			local ParameterSingleQueue = ParameterSingleQueue
			local Config = Config
			while true do
				local frameStartTime = Config.DebugFrameTime and GetTimePreciseSec() or nil
				perFrame = Config.PerFrame
				local params;
				local func = FunctionQueue[RunIndex];
				-- app.PrintDebug("FRC.Running."..name,"@",perFrame)
				if OnStart then OnStart() end
				while func do
					perFrame = perFrame - 1;
					ActiveScope = ProfileScopeQueue[RunIndex] or ProfileWorkScope;
					ProfileState.activeJob = ProfileJobQueue[RunIndex];
					Profiler.CountScope(ProfileCallScopes[ActiveScope] or ProfileCallsScope);
					BeginActive();
					params = ParameterBucketQueue[RunIndex];
					local succeeded;
					if params then
						-- app.PrintDebug("FRC.Run.N."..name,RunIndex,unpack(params))
						succeeded = xpcall(func, err, unpack(params));
					else
						-- app.PrintDebug("FRC.Run.1."..name,RunIndex,ParameterSingleQueue[RunIndex])
						succeeded = xpcall(func, err, ParameterSingleQueue[RunIndex]);
					end
					PauseActive(succeeded and "completed" or "failed");
					ProfileJobQueue[RunIndex], ProfileScopeQueue[RunIndex] = nil, nil;
					ActiveScope, ProfileState.activeJob = nil, nil;
					-- app.PrintDebug("FRC.Done."..name,RunIndex)
					if perFrame <= 0 then
						-- app.PrintDebug("FRC.Yield."..name,"Qi",QueueIndex,"Ri",RunIndex,"@",Config.PerFrame)
						if frameStartTime then
							local diff = math.floor(100000 * (GetTimePreciseSec() - frameStartTime)) / 100
							app.PrintDebug("FRC",name,"FrameTime","#",Config.PerFrame,diff,"ms Stutter @", math.ceil(1000 / diff))
						end
						c_yield();
						frameStartTime = Config.DebugFrameTime and GetTimePreciseSec() or nil
						perFrame = Config.PerFrame;
					end
					RunIndex = RunIndex + 1;
					func = FunctionQueue[RunIndex];
				end
				-- Run the OnEnd function if it exists
				local OnEnd = FunctionQueue[0];
				if OnEnd then
					-- app.PrintDebug("FRC.End."..name,#FunctionQueue)
					OnEnd();
				end
				Pushed = nil;
				if frameStartTime then
					local diff = math.floor(100000 * (GetTimePreciseSec() - frameStartTime)) / 100
					app.PrintDebug("FRC",name,"FrameTime","#",Config.PerFrame - perFrame,diff,"ms Stutter @", math.ceil(1000 / diff))
				end
				Reset();
				-- Yield false to kick the StackRun off the Stack to stop calling this coroutine since it is complete until Run is called again
				c_yield(false);
			end
		end);
		-- app.PrintDebug("SetRunnerCoroutine",Name)
	end
	SetRunnerCoroutine()

	---Resumes one Runner execution slice and signals whether it needs another frame.
	---Profiling measures this resume only, excluding waits between frames, and
	---discards the slice if its capture session changes during execution.
	---@return boolean? continuing True while more work remains; nil on completion or error.
	local function StackRun()
		-- app.PrintDebug("Stack.Run",Name)
		if c_status(RunnerCoroutine) == "dead" then SetRunnerCoroutine() end
		local profileStart, profileSession = Profiler.Begin(ProfileSliceScope);
		if ActiveScope then BeginActive(); end
		local ok, err = c_resume(RunnerCoroutine);
		if ActiveScope then PauseActive(not ok and "failed" or nil); end
		Profiler.Finish(ProfileSliceScope, profileStart, profileSession);
		if ok then
			if err == false then
				-- app.PrintDebug("Stack.Run.Complete",Name)
				return;			-- This means the coroutine signals completion by returning false
			else
				-- app.PrintDebug("Stack.Run.Yielded",Name)
				return true;	-- This means more work is required.
			end
		else app.PrintError(err, Name, RunnerCoroutine) end
	end

	---Append original function arguments and optional observation metadata to parallel queues.
	---@param func function Function to enqueue; invalid types preserve existing validation errors.
	---@param scope ATTProfilerScope? Explicit work scope; nil selects this Runner's stable fallback.
	---@param ... any Original arguments, stored using the existing single/bucket convention.
	local function QueueFunction(func, scope, ...)
		if type(func) ~= "function" then error("Must be a 'function' type!"); end
		FunctionQueue[QueueIndex] = func;
		ProfileScopeQueue[QueueIndex] = scope;
		ProfileState.jobs[QueueIndex] = ProfileJobs.Enqueue(scope or ProfileWorkScope, nil, QueueIndex - RunIndex + 1);
		local arrs = select("#", ...);
		if arrs == 1 then ParameterSingleQueue[QueueIndex] = ...;
		elseif arrs > 1 then ParameterBucketQueue[QueueIndex] = { ... }; end
		QueueIndex = QueueIndex + 1;
	end

	-- Provides a utility which will process a given number of functions each frame in a Queue
	local Runner = {
		-- Adds a function to be run with any necessary parameters
		-- Can be called with no parameters to simply begin the Runner's queue
		Run = function(func, ...)
			if func then
				QueueFunction(func, nil, ...);
			end
			-- Only push the coroutine onto the Stack once until it is completed
			if Pushed then return; end
			Pushed = true;
			Push(nil, Name, StackRun);
		end,
		-- Adds a function with any necessary parameters but does not Run it yet
		Queue = function(func, ...)
			QueueFunction(func, nil, ...);
		end,
		-- Set a function to be run once the queue is empty. This function takes no parameters.
		OnEnd = function(func)
			FunctionQueue[0] = func;
		end,
		-- Set a function to be run when the Runner attempts to start.
		-- This function takes no parameters and persists for the duration of the Runner
		DefaultOnStart = function(func)
			OnStart = func
		end,
		-- Set a function to be run when the Runner is Reset.
		-- This function takes no parameters and persists for the duration of the Runner
		DefaultOnReset = function(func)
			OnReset = func
		end,
		-- Return the current PerFrame of the Runner
		GetPerFrame = function() return Config.PerFrame end,
		-- Return if the Runner is currently Running
		IsRunning = function() return Pushed end,
		-- Allows defining the default PerFrame for this Runner (i.e. when Reset)
		SetPerFrameDefault = function(count) Config.PerFrameDefault = count; Config.PerFrame = count end,
		-- Allows adding/removing timing tracking into PrintDebug messages for this Runner
		ToggleDebugFrameTime = function() Config.DebugFrameTime = not Config.DebugFrameTime; return Config.DebugFrameTime end,
	};
	---Queue labeled work without wrapping its function or changing forwarded arguments.
	---@param scope ATTProfilerScope Stable work scope used for stage timing and optional job tracking.
	---@param func function Function to add; must satisfy the existing Queue function validation.
	---@param ... any Arguments forwarded using the Runner's existing single/bucket storage convention.
	function Runner.QueueProfiled(scope, func, ...)
		QueueFunction(func, scope, ...);
	end
	---Queue labeled work and start the Runner using its existing Run behavior.
	---@param scope ATTProfilerScope Stable work scope used for stage timing and optional job tracking.
	---@param func function Function to execute through the Runner.
	---@param ... any Arguments forwarded using the Runner's existing single/bucket storage convention.
	function Runner.RunProfiled(scope, func, ...)
		Runner.QueueProfiled(scope, func, ...);
		Runner.Run();
	end
	---Attach an optional invocation counter to a stable work label before queueing it.
	---@param scope ATTProfilerScope Registered timing scope used by RunProfiled or QueueProfiled.
	---@param invocationCounter ATTProfilerScope Registered counter incremented once at function entry, excluding later resumes.
	function Runner.RegisterProfiledScope(scope, invocationCounter)
		ProfileCallScopes[scope] = invocationCounter;
	end
	-- Defines how many functions will be executed per frame. Executes via the Runner when encountered in the Queue, unless specified as 'instant'
	Runner.SetPerFrame = function(count, instant)
		if instant then
			SetPerFrame(count);
		else
			Runner.Run(SetPerFrame, count);
		end
	end

	Runner.Reset = Reset -- for testing
	Runner.Stats = Stats -- for testing
	app.Runners[name] = Runner
	if app.__perf then
		app.__perf.AutoCaptureTable(FunctionQueue,"FunctionQueue",Runner)
	end

	return Runner;
end
-- Retrieves an existing or creates a new Runner with the provided name
---Retrieve or create a Runner, with a fixed profiler fallback for dynamic window names.
---@param name string Existing Runner lookup key; never used as a new metric ID unless it is a built-in name.
---@param profileModule 'windows'? Assign unknown Runner names to the windows module; nil uses the generic runner module.
---@return table runner Existing or newly constructed Runner with unchanged Run/Queue behavior.
app.CreateRunner = function(name, profileModule)
	return app.Runners[name] or CreateRunner(name, profileModule)
end
app.Runners = {}
app.FunctionRunner = CreateRunner("default");
