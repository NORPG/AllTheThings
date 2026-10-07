-- Run from the repository root: lua tests/ProfilerLevels.lua
-- Behavioral checks for capture policy, level gates, sampling, storage bounds, and login migration.
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
local jobs = p.RegisterScope("test.jobs", "runner", 4, "counter")
local timeline = p.RegisterScope("test.timeline", "costs", 5, "time")
local diagnostic = p.RegisterScope("test.diagnostic", "costs", 6, "time")
local foreign = p.RegisterScope("test.foreign", "search", 2, "time")
assert(p.RegisterScope("test.overview", "costs", 1, "time", "Overview", "items") == overview)
assert(not pcall(p.RegisterScope, "test.overview", "costs", 2, "time", "Overview", "items"))
assert(not pcall(p.RegisterScope, "bad", "costs", 7, "time"))

-- Disabled and filtered calls must not read clocks, capture stacks, or allocate capture data.
local reads = clockReads
assert(not p.Begin(component) and not overview.enabled and p.GetLevel() == 0)
p.CountScope(workload)
p.Finish(component, 1, 0)
assert(clockReads == reads and #timers == 0)

-- Every level includes its lower capabilities. Deep levels require a deliberate module selection.
for level = 1, 6 do
  local ok = p.Start(30, level, level >= 4 and { include = "all" } or nil)
  assert(ok and p.GetLevel() == level)
  for _, scope in ipairs({ overview, component, workload, jobs, timeline, diagnostic }) do
    assert(scope.enabled == (scope.minLevel <= level))
  end
end
assert(p.Start(30, "components"))
assert(p.Config.level == 2)
local before, session, timerCount = p.Report(), p.SessionID, #timers
for _, invalid in ipairs({ 0, 7, 1.5, "unknown", false, {}, math.huge, 0 / 0 }) do
  assert(not p.Start(30, invalid))
  assert(p.Report() == before and p.SessionID == session and #timers == timerCount)
end
for _, options in ipairs({ { sampleEvery = 0 }, { sampleEvery = 1.5 }, { timelineBudget = 4097 },
  { metricBudget = -1 }, { jobBudget = math.huge }, { stackByteBudget = 65537 },
  { slowThresholdMs = 0 / 0 }, { slowThresholdMs = -1 }, { stacks = "true" },
  { include = "missing" }, { include = "" }, { include = "costs," }, { include = "all,costs" }, { typo = true } }) do
  assert(not p.Start(30, 2, options))
  assert(p.Report() == before and p.SessionID == session and #timers == timerCount)
end
for level = 4, 6 do assert(not p.Start(30, level)) end
assert(not p.Start(30, 2, "invalid"))
assert(p.Report() == before)

-- Filters constrain detail but always retain global overview. Configuration is copied at start.
local options = { include = "costs,runner", exclude = "runner", metricBudget = 1 }
assert(p.Start(30, 4, options))
options.include, options.exclude, options.metricBudget = "search", "costs", 0
assert(overview.enabled and component.enabled and workload.enabled and not foreign.enabled and not jobs.enabled)
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

-- Periodic diagnostics skip before clock reads; ordinary component metrics remain complete.
assert(p.Start(30, 6, { include = "costs", sampleEvery = 3, timelineBudget = 2, slowThresholdMs = 5 }))
p.GetCurrentContext = function() return "job=7\torigin=test" end
for i = 1, 7 do
  reads = clockReads
  start, generation = p.Begin(diagnostic)
  if i == 1 or i == 4 or i == 7 then
    assert(start and clockReads == reads + 1)
    now = now + .006
    p.Finish(diagnostic, start, generation)
  else assert(not start and clockReads == reads) end
end
start, generation = p.Begin(component)
now = now + .001
p.Finish(component, start, generation)
local report = p.Report()
Contains(report, "eligible=7; accepted=3; skipped=4")
Contains(report, "Sampled diagnostic timing ID\tSamples\tObserved total ms")
Contains(report, "test.diagnostic\t3\t18.000")
Contains(report, "test.component\t1\t1.000")
Contains(report, "Timeline: 2 retained; 1 overwritten")
Contains(report, "job=7 origin=test")
p.AddTimeline("job.lifecycle", "complete", 2, "explicit")
Contains(p.Report(), "Timeline: 2 retained; 2 overwritten")
Contains(p.Report(), "complete\tjob.lifecycle\t2.000\texplicit")

-- Stack capture is bounded and excluded from the measured API/scope duration.
debugstack = function()
  stackCalls = stackCalls + 1
  now = now + .100
  return "caller frame repeated to demonstrate truncation"
end
assert(p.Start(30, 6, { include = "costs", sampleEvery = 1, stacks = true, stackByteBudget = 12 }))
for i = 1, 2 do
  start, generation = p.Begin(diagnostic)
  now = now + .001
  p.Finish(diagnostic, start, generation)
end
assert(stackCalls == 1)
report = p.Report()
Contains(report, "test.diagnostic\t2\t2.000\t1.000\t1.000")
Contains(report, "Diagnostic caller stacks: 1 retained; 12 bytes; 1 unavailable or budget-rejected")
Contains(report, "caller frame")
Absent(report, "caller frame repeated")
assert(p.Start(30, 6, { include = "costs", timelineBudget = 0, stackByteBudget = 0, stacks = true, metricBudget = 0 }))
start, generation = p.Begin(diagnostic)
now = now + .020
p.Finish(diagnostic, start, generation)
Contains(p.Report(), "Timeline: 0 retained; 0 overwritten")
Contains(p.Report(), "Dropped detail samples after 0 distinct detail metric IDs: 1")
assert(stackCalls == 1)

-- Lifecycle extensions see deterministic state, and retained reports can append a bounded section.
local phases = {}
p.AddSessionListener(function(event, id, config)
  phases[#phases + 1] = event
  if event == "start" or event == "stopping" then assert(p.Enabled and config.level == 2 and id == p.SessionID) end
  if event == "stop" or event == "reset" then assert(not p.Enabled) end
end)
p.AddReportProvider(function(lines) lines[#lines + 1] = "jobs provider section" end)
assert(p.Start(30, 2))
p.Stop()
assert(table.concat(phases, ",") == "reset,start,stopping,stop")
Contains(p.Report(), "jobs provider section")
p.AddSessionListener(function() error("broken extension") end)
assert(p.Start(30, 2))
Contains(p.Report(), "Extension callback failures: 2")

-- Versioned one-shot schedules copy options, consume once, and migrate legacy durations at overview.
AllTheThingsSavedVariables = { Keep = true, ProfilerNextLoginSeconds = 25 }
assert(p.StartNextLogin() and p.Config.level == 1)
assert(AllTheThingsSavedVariables.ProfilerNextLoginSeconds == nil)
options = { include = "costs", sampleEvery = 2 }
assert(p.ScheduleNextLogin(60, 6, options))
options.include, options.sampleEvery = "search", 8
local request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.version == 1 and request.seconds == 60 and request.level == 6)
assert(request.options.include == "costs" and request.options.sampleEvery == 2)
assert(not p.ScheduleNextLogin(60, 6) and AllTheThingsSavedVariables.ProfilerNextLogin == request)
assert(p.StartNextLogin() and p.Config.level == 6 and p.Config.sampleEvery == 2)
assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil and not p.StartNextLogin())
assert(AllTheThingsSavedVariables.Keep)
assert(p.ScheduleNextLogin(30) and p.CancelNextLogin() and not p.CancelNextLogin())
for _, requestValue in ipairs({ false, "bad", {}, { version = 2, seconds = 60, level = 1 },
  { version = 1, seconds = 60, level = 6 }, { version = 1, seconds = 0, level = 1 } }) do
  AllTheThingsSavedVariables.ProfilerNextLogin = requestValue
  session = p.SessionID
  assert(not p.StartNextLogin() and p.SessionID == session)
  assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil)
end

-- Scope registry capacity is bounded separately from per-session metric capacities.
local registered = 9
for i = registered + 1, 512 do p.RegisterScope("bound." .. i, "costs", 2, "counter") end
local overflow = p.RegisterScope("bound.overflow", "costs", 2, "counter")
assert(not overflow.enabled)
assert(p.RegisterScope("bound.overflow2", "costs", 2, "counter") == overflow)
reads = clockReads
assert(not p.Begin(overflow))
p.CountScope(overflow)
assert(clockReads == reads)
Contains(p.Report(), "Scope registry: 512 / 512 handles; rejected registration attempts: 2")

print("PASS: six levels, copied policy, module gates, capacity isolation, session safety, bounded timeline/stacks, sampling, and versioned login requests")
