-- Bounded scheduling metadata for explicitly instrumented ATT work.
local _, app = ...;
---@type ATTProfiler
local Profiler = app.Profiler;
local GetTimePreciseSec, running, string_format, table_sort, type
	= GetTimePreciseSec, coroutine.running, string.format, table.sort, type;

---@alias ATTProfilerJobStatus 'queued'|'running'|'suspended'|'completed'|'canceled'|'failed'|'incomplete'
---A retained job contains only observations from its capture session.
---@class ATTProfilerJob
---@field id integer Bounded session-local job identifier.
---@field sessionID integer Capture generation that owns this record.
---@field scope ATTProfilerScope Stable work scope and module filter.
---@field origin string Explicit label or the observed parent scope; never a function address.
---@field parentID integer? Parent job observed when this work was queued.
---@field queuedAt number? Observed enqueue time; absent for work queued outside capture.
---@field startedAt number? First observed execution time.
---@field endedAt number? Observed terminal or capture-stop time.
---@field queueWait number? Milliseconds from observed enqueue to first execution.
---@field execution number Sum of observed resume durations in milliseconds, excluding waits.
---@field resumes integer Number of observed execution segments.
---@field queueDepth integer? Number of functions queued on this Runner at enqueue time.
---@field partial boolean Whether enqueue, start, or completion was outside the capture.
---@field status ATTProfilerJobStatus Last observed lifecycle state.
---@field sliceStart number? Clock boundary for an active execution segment.
---@field contextKey thread|table? Coroutine key whose current context refers to this job.
---@field previousContext ATTProfilerJob? Context restored after this execution segment.
---@field contextText string? Lazily cached current-job label, including its immutable parent ID.
---@field timelineContext string? Lazily cached lifecycle label containing the immutable job ID and origin.

---Optional Level 4 job observations; disabled calls never read the clock or allocate records.
---@class ATTProfilerJobs
local Jobs = {};
app.ProfilerJobs = Jobs;
---@type ATTProfilerJob[]
local records = {};
---@type table<thread|table, ATTProfilerJob>
local contexts = {};
local MAIN_CONTEXT = {};
local dropped = 0;

---Return the current coroutine key, using a stable key for the main Lua thread.
---@param thread thread? Explicit resumed coroutine; nil uses the calling coroutine.
---@return thread|table key Context-map key that does not allocate on invocation.
local function ContextKey(thread)
	return thread or running() or MAIN_CONTEXT;
end

---Select a current-session context without exposing stale jobs from earlier captures.
---@param thread thread? Coroutine to inspect; nil selects the caller.
---@return ATTProfilerJob? job Current observed job, or nil when its session is no longer active.
local function Current(thread)
	local job = contexts[ContextKey(thread)];
	if job and job.sessionID == Profiler.SessionID and Profiler.Enabled then return job; end
end

---Expose bounded contextual text for timeline samples captured by the core profiler.
---@return string? context Current job ID, origin, and optional parent ID; nil outside observed work.
function Profiler.GetCurrentContext()
	local job = Current();
	if not job then return; end
	if not job.contextText then
		job.contextText = string_format("job=%d origin=%s%s", job.id, job.origin,
			job.parentID and (" parent=" .. job.parentID) or "");
	end
	return job.contextText;
end

---Check Level 4 and the selected module before any job allocation or clock read.
---@param scope ATTProfilerScope? Registered work scope.
---@return boolean enabled Whether scheduling observations for this scope are active.
local function Enabled(scope)
	return scope ~= nil and scope.jobsEnabled == true;
end

---Save a bounded lifecycle event when Level 5 timeline collection is available.
---@param job ATTProfilerJob Job whose scope already passed the module filter.
---@param kind string Stable lifecycle event name.
---@param durationMs number? Optional observed execution duration in milliseconds.
local function Timeline(job, kind, durationMs)
	if job.scope.timelineEnabled then
		if not job.timelineContext then
			job.timelineContext = string_format("job=%d origin=%s", job.id, job.origin);
		end
		Profiler.AddTimeline(job.scope.id, kind, durationMs, job.timelineContext);
	end
end

---Allocate one retained record within the session job budget.
---@param scope ATTProfilerScope Registered work scope selected by the capture filter.
---@param origin string? Explicit stable source label; nil inherits an observed parent scope.
---@param queueDepth integer? Runner queue length observed at enqueue time.
---@param partial boolean Whether enqueue was not observed in this capture.
---@return ATTProfilerJob? job Retained record; nil after the fixed job budget is exhausted.
local function New(scope, origin, queueDepth, partial)
	if #records >= Profiler.Config.jobBudget then dropped = dropped + 1; return; end
	local parent = not partial and Current() or nil;
	local label = not partial and ((type(origin) == "string" and origin) or (parent and parent.scope.id)) or "unknown";
	label = label or "unknown";
	local job = {
		id = #records + 1, sessionID = Profiler.SessionID, scope = scope,
		origin = label:gsub("[%c]", " "):sub(1, 96), parentID = parent and parent.id,
		queuedAt = not partial and GetTimePreciseSec() or nil,
		execution = 0, resumes = 0, queueDepth = queueDepth, partial = partial, status = "queued",
	};
	---@cast job ATTProfilerJob
	records[#records + 1] = job;
	Timeline(job, partial and "partial" or "queued");
	return job;
end

---Observe enqueue without affecting Runner arguments, return values, or execution.
---@param scope ATTProfilerScope Registered stable work scope.
---@param origin string? Stable caller label; nil inherits the current observed parent.
---@param queueDepth integer? Number of queued functions at this boundary.
---@return ATTProfilerJob? job New record; nil while disabled, filtered, or out of capacity.
function Jobs.Enqueue(scope, origin, queueDepth)
	if not Enabled(scope) then return; end
	return New(scope, origin, queueDepth, false);
end

---Open one execution segment, adopting pre-capture work as a partial job when needed.
---@param job ATTProfilerJob? Prior enqueue or suspended record; stale-session records are replaced.
---@param scope ATTProfilerScope Stable fallback scope when enqueue was not observed.
---@param thread thread? Resumed coroutine whose nested scheduling should inherit this context.
---@return ATTProfilerJob? active Current-session record; nil without enabled scope or capacity.
function Jobs.Begin(job, scope, thread)
	if not Enabled(scope) then return; end
	if not job or job.sessionID ~= Profiler.SessionID then job = New(scope, nil, nil, true); end
	if not job or job.status == "completed" or job.status == "failed" or job.status == "canceled" then return; end
	local now = GetTimePreciseSec();
	if not job.startedAt then
		job.startedAt = now;
		if job.queuedAt then job.queueWait = (now - job.queuedAt) * 1000; end
	end
	job.sliceStart = now;
	job.resumes = job.resumes + 1;
	job.status = "running";
	local key = ContextKey(thread);
	job.contextKey, job.previousContext = key, contexts[key];
	contexts[key] = job;
	Timeline(job, "resume");
	return job;
end

---Close a segment at yield or function completion; cross-frame waits are excluded.
---@param job ATTProfilerJob? Active record; nil or invalidated records are ignored.
---@param status ATTProfilerJobStatus? Terminal status; nil records a suspension for another resume.
function Jobs.Pause(job, status)
	if not job or job.sessionID ~= Profiler.SessionID or not Profiler.Enabled then return; end
	if job.status == "completed" or job.status == "failed" or job.status == "canceled" or job.status == "incomplete" then return; end
	local duration;
	if job.sliceStart then
		local now = GetTimePreciseSec();
		duration = (now - job.sliceStart) * 1000;
		job.execution = job.execution + duration;
		job.sliceStart = nil;
		if status then job.endedAt = now; end
	end
	if job.contextKey then
		if contexts[job.contextKey] == job then contexts[job.contextKey] = job.previousContext; end
		job.contextKey, job.previousContext = nil, nil;
	end
	if status then
		job.status = status;
		if not job.endedAt and Profiler.Enabled then job.endedAt = GetTimePreciseSec(); end
	elseif job.status == "running" then job.status = "suspended"; end
	if Profiler.Enabled then Timeline(job, status or "yield", duration); end
end

---Mark a queued or suspended job canceled without changing its underlying work.
---@param job ATTProfilerJob? Record whose actual Runner queue is being reset or canceled.
function Jobs.Cancel(job)
	if not job or job.sessionID ~= Profiler.SessionID or not Profiler.Enabled then return; end
	if job.status == "completed" or job.status == "failed" or job.status == "canceled" then return; end
	Jobs.Pause(job, "canceled");
end

Profiler.AddSessionListener(function(event)
	if event == "reset" then
		records, contexts, dropped = {}, {}, 0;
	elseif event == "stopping" then
		for _, job in ipairs(records) do
			if job.status == "queued" or job.status == "running" or job.status == "suspended" then
				job.partial = true;
				Jobs.Pause(job, "incomplete");
			end
		end
	end
end);

Profiler.AddReportProvider(function(lines)
	if #records == 0 and dropped == 0 then return; end
	lines[#lines + 1] = "";
	lines[#lines + 1] = "Jobs (observed execution excludes waits; partial jobs have incomplete lifecycle):";
	lines[#lines + 1] = "Job\tScope\tOrigin\tParent\tStatus\tPartial\tQueue wait ms\tExecution ms\tWall ms\tResumes\tQueue depth";
	local ordered = {};
	for i, job in ipairs(records) do ordered[i] = job; end
	table_sort(ordered, function(a, b) return a.execution > b.execution; end);
	for _, job in ipairs(ordered) do
		local wall = job.startedAt and job.endedAt and (job.endedAt - job.startedAt) * 1000;
		lines[#lines + 1] = string_format("%d\t%s\t%s\t%s\t%s\t%s\t%s\t%.3f\t%s\t%d\t%s",
			job.id, job.scope.id, job.origin, job.parentID or "-", job.status, job.partial and "yes" or "no",
			job.queueWait and string_format("%.3f", job.queueWait) or "unknown", job.execution,
			wall and string_format("%.3f", wall) or "unknown", job.resumes, job.queueDepth or "unknown");
	end
	if dropped > 0 then lines[#lines + 1] = "Job observations omitted after capacity was reached: " .. dropped; end
end);
