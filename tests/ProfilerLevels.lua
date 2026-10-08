-- Run from the repository root with Lua 5.1: lua5.1 tests/ProfilerLevels.lua
-- Behavioral checks for Level 1-3 policy, bounded aggregates, and login migration.
local now, clockReads, stackCalls = 100, 0, 0
local timers = {}
GetTimePreciseSec = function() clockReads = clockReads + 1; return now end
C_Timer = { After = function(seconds, callback) timers[#timers + 1] = { seconds, callback } end }
C_AddOnProfiler, Enum = nil, nil
local app = { print = function() end }
assert(loadfile("lib/Profiler.lua"))("AllTheThings", app)
local p = app.Profiler

---Assert that report text contains a literal fragment.
---@param report string Current capture report.
---@param fragment string Expected literal text.
local function Contains(report, fragment)
  assert(report:find(fragment, 1, true), "missing " .. fragment .. "\n" .. report)
end

---Assert that report text omits a rejected measurement.
---@param report string Current capture report.
---@param fragment string Literal text that should be absent.
local function Absent(report, fragment)
  assert(not report:find(fragment, 1, true), "unexpected " .. fragment .. "\n" .. report)
end

local overview = p.RegisterScope("test.overview", "costs", 1, "time", "Overview", "items")
local component = p.RegisterScope("test.component", "costs", 2, "time")
local workload = p.RegisterScope("test.workload", "costs", 3, "counter")
local foreign = p.RegisterScope("test.foreign", "search", 2, "time")
assert(p.RegisterScope("test.overview", "costs", 1, "time", "Overview", "items") == overview)
assert(not pcall(p.RegisterScope, "test.overview", "costs", 2, "time", "Overview", "items"))
for _, level in ipairs({ 0, 4, 6, 7, 1.5 }) do
  assert(not pcall(p.RegisterScope, "bad", "costs", level, "time"))
end
assert(p.AddTimeline == nil and p.AddReportProvider == nil and p.GetCurrentContext == nil and app.ProfilerJobs == nil)
debugstack = function() stackCalls = stackCalls + 1; error("Level 1-3 must not capture stacks") end

-- Disabled and filtered calls must not read clocks, capture stacks, or allocate capture data.
local reads = clockReads
assert(not p.Begin(component) and not overview.enabled and p.GetLevel() == 0)
p.CountScope(workload)
p.Finish(component, 1, 0)
assert(clockReads == reads and #timers == 0)

-- Every supported level includes its lower capabilities and stores only its shallow policy.
for level = 1, 3 do
  local ok = p.Start(30, level)
  assert(ok and p.GetLevel() == level)
  for _, scope in ipairs({ overview, component, workload }) do
    assert(scope.enabled == (scope.minLevel <= level))
  end
  assert(p.Config.sampleEvery == nil and p.Config.jobBudget == nil and p.Config.timelineBudget == nil
    and p.Config.stackByteBudget == nil and p.Config.stacks == nil and p.Config.slowThresholdMs == nil)
end
assert(p.Start(30, "components"))
assert(p.Config.level == 2)
local before, session, timerCount = p.Report(), p.SessionID, #timers
for _, invalid in ipairs({ 0, 4, 5, 6, 7, 1.5, "jobs", "timeline", "diagnostics", "unknown", false, {}, math.huge, 0 / 0 }) do
  assert(not p.Start(30, invalid))
  assert(p.Report() == before and p.SessionID == session and #timers == timerCount)
end
-- Removed deep options are rejected even when their values would be valid at higher levels.
for _, options in ipairs({ { sampleEvery = 1 }, { slowThresholdMs = 10 }, { jobBudget = 128 },
  { timelineBudget = 256 }, { stackByteBudget = 8192 }, { stacks = false },
  { metricBudget = -1 }, { metricBudget = 1025 }, { metricBudget = 1.5 }, { metricBudget = math.huge },
  { include = "missing" }, { include = "" }, { include = "costs," }, { include = "all,costs" }, { typo = true } }) do
  local previousReads = clockReads
  assert(not p.Start(30, 2, options))
  assert(clockReads == previousReads, "invalid options read capture clocks")
  assert(p.Report() == before and p.SessionID == session and #timers == timerCount)
end
for level = 4, 6 do assert(not p.Start(30, level, { include = "all" })) end
assert(not p.Start(30, 2, "invalid"))
assert(p.Report() == before)

-- Filters constrain detail but always retain global overview. Configuration is copied at start.
local options = { include = "costs,runner", exclude = "runner", metricBudget = 1 }
assert(p.Start(30, 3, options))
options.include, options.exclude, options.metricBudget = "search", "costs", 0
assert(overview.enabled and component.enabled and workload.enabled and not foreign.enabled)
assert(p.Config.include == "costs,runner" and p.Config.metricBudget == 1)
assert(p.IsLevelEnabled(1, "search") and not p.IsLevelEnabled(2, "search"))
reads = clockReads
assert(not p.Begin(foreign))
assert(clockReads == reads)
local start, generation = p.Begin(component)
now = now + .002
p.Finish(component, start, generation, 4)
p.CountScope(workload, 9, generation)
for i = 1, 64 do p.Count("overview." .. i) end
Contains(p.Report(), "test.component\t1\t2.000\t2.000\t2.000\t<=2.00\t4")
Contains(p.Report(), "Dropped detail samples after 1 distinct detail metric IDs: 1")
Absent(p.Report(), "Dropped samples after 64 distinct")
p.Count("overflow")
Contains(p.Report(), "Dropped samples after 64 distinct metric IDs: 1")

-- A generation change or stop invalidates an outstanding timing sample.
start, generation = p.Begin(component)
assert(p.Start(30, 2))
reads = clockReads
p.Finish(component, start, generation)
p.CountScope(workload, 1, generation)
assert(clockReads == reads)
Absent(p.Report(), "test.component\t")
start, generation = p.Begin(component)
p.Stop()
reads = clockReads
p.Finish(component, start, generation)
assert(clockReads == reads and not component.enabled and p.GetLevel() == 0)
assert(p.Config.level == 2, "stopped reports must retain their policy")

-- Late scopes honor both current selection and exclude=all, including newly registered modules.
assert(p.Start(30, 3, { exclude = "all" }))
local late = p.RegisterScope("test.late", "newmodule", 2, "counter")
assert(not late.enabled)
local lateOverview = p.RegisterScope("test.late.overview", "newmodule", 1, "counter")
assert(lateOverview.enabled)
assert(p.Start(30, 3, { include = "newmodule" }))
assert(late.enabled and not component.enabled)

-- Ordinary component samples remain complete, and no timeline, diagnostic, or job report is produced.
assert(p.Start(30, 3, { include = "costs", metricBudget = 0 }))
start, generation = p.Begin(component)
now = now + .020
p.Finish(component, start, generation)
Contains(p.Report(), "Dropped detail samples after 0 distinct detail metric IDs: 1")
assert(p.Start(30, 3, { include = "costs" }))
for i = 1, 7 do
  reads = clockReads
  start, generation = p.Begin(component)
  assert(start and clockReads == reads + 1)
  now = now + .001
  p.Finish(component, start, generation)
end
local report = p.Report()
Contains(report, "test.component\t7\t7.000\t1.000\t1.000")
Contains(report, "Budgets: overview=64 IDs; detail=128 IDs")
Absent(report, "Timeline:")
Absent(report, "Diagnostics sampling:")
Absent(report, "Sampled diagnostic")
Absent(report, "Diagnostic caller stacks:")
assert(stackCalls == 0)

-- Lifecycle listeners see deterministic state; broken listeners cannot interrupt a capture.
local phases = {}
p.AddSessionListener(function(event, id, config)
  phases[#phases + 1] = event
  if event == "start" or event == "stopping" then assert(p.Enabled and config.level == 2 and id == p.SessionID) end
  if event == "stop" or event == "reset" then assert(not p.Enabled) end
end)
assert(p.Start(30, 2))
p.Stop()
assert(table.concat(phases, ",") == "reset,start,stopping,stop")
p.AddSessionListener(function() error("broken extension") end)
assert(p.Start(30, 2))
Contains(p.Report(), "Extension callback failures: 2")

-- Versioned one-shot schedules copy options, consume once, and migrate legacy durations at overview.
AllTheThingsSavedVariables = { Keep = true, ProfilerNextLoginSeconds = 25 }
assert(p.StartNextLogin() and p.Config.level == 1)
assert(AllTheThingsSavedVariables.ProfilerNextLoginSeconds == nil)
options = { include = "costs", metricBudget = 2 }
assert(p.ScheduleNextLogin(60, 3, options))
options.include, options.metricBudget = "search", 8
local request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.version == 1 and request.seconds == 60 and request.level == 3)
assert(request.options.include == "costs" and request.options.metricBudget == 2)
assert(not p.ScheduleNextLogin(60, 4, { include = "all" }) and AllTheThingsSavedVariables.ProfilerNextLogin == request)
assert(not p.ScheduleNextLogin(60, 3, { jobBudget = 0 }) and AllTheThingsSavedVariables.ProfilerNextLogin == request)
assert(request.options.jobBudget == nil and request.options.sampleEvery == nil and request.options.stacks == nil)
assert(p.StartNextLogin() and p.Config.level == 3 and p.Config.metricBudget == 2)
assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil and not p.StartNextLogin())
assert(AllTheThingsSavedVariables.Keep)
assert(p.ScheduleNextLogin(30) and p.CancelNextLogin() and not p.CancelNextLogin())
for _, requestValue in ipairs({ false, "bad", {}, { version = 2, seconds = 60, level = 1 },
  { version = 1, seconds = 60, level = 4, options = { include = "all" } },
  { version = 1, seconds = 60, level = 6, options = { include = "all" } },
  { version = 1, seconds = 60, level = 3, options = { stacks = false } },
  { version = 1, seconds = 0, level = 1 } }) do
  AllTheThingsSavedVariables.ProfilerNextLogin = requestValue
  session, timerCount, before, reads = p.SessionID, #timers, p.Report(), clockReads
  assert(not p.StartNextLogin() and p.SessionID == session)
  assert(clockReads == reads and #timers == timerCount and p.Report() == before)
  assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil)
end

-- Scope registry capacity is bounded separately from per-session metric capacities.
local registered = 6
for i = registered + 1, 512 do p.RegisterScope("bound." .. i, "costs", 2, "counter") end
local overflow = p.RegisterScope("bound.overflow", "costs", 2, "counter")
assert(not overflow.enabled)
assert(p.RegisterScope("bound.overflow2", "costs", 2, "counter") == overflow)
reads = clockReads
assert(not p.Begin(overflow))
p.CountScope(overflow)
assert(clockReads == reads)
Contains(p.Report(), "Scope registry: 512 / 512 handles; rejected registration attempts: 2")

print("PASS: three levels, copied policy, module gates, capacity isolation, session safety, deep-feature rejection, and versioned login requests")
