-- Lua 5.1 only: lua5.1 tests/ProfilerCaptureBenchmark.lua [source-root] [label] [case-filter]
-- Example: lua5.1 tests/ProfilerCaptureBenchmark.lua /private/tmp/att-baseline baseline runner.L1
-- The same script loads full production files from either source root. CPU medians
-- include queueing/scheduling/execution, with initialization, capture transitions,
-- reports, and semantic validation outside timed batches. This is not an FPS test.
assert(_VERSION == "Lua 5.1", "ProfilerCaptureBenchmark requires Lua 5.1")
local root, label, selected = arg[1] or ".", arg[2] or "working-tree", arg[3]
local TRIALS, RUNNER_CALLS, COROUTINE_CALLS, EVENT_DISPATCHES = 7, 8192, 4096, 16384
local JOB_BUDGET, TIMELINE_BUDGET, HANDLERS = 128, 128, 3
local cases = {}
tinsert, tremove = table.insert, table.remove
C_AddOnProfiler, Enum = nil, nil

-- Stock Lua 5.1 does not forward xpcall arguments like WoW. This shim is identical
-- for both source roots. Protected-call yields still require WoW runtime validation.
local nativeXpcall = xpcall
xpcall = function(func, handler, ...)
  local args = { n = select("#", ...), ... }
  return nativeXpcall(function() return func(unpack(args, 1, args.n)) end, handler)
end

---Construct actual profiler, job, Runner, and event services with explicit client stubs.
---@return table app Isolated ATT service container loaded from the selected source root.
---@return table clock Mutable simulated time, exact clock reads, pending frames, and original errors.
local function NewApp()
  local clock = { now = 100, reads = 0, pending = {}, errors = {} }
  GetTimePreciseSec = function() clock.reads = clock.reads + 1; return clock.now end
  C_Timer = { After = function(seconds, callback)
    if seconds == 0 then clock.pending[#clock.pending + 1] = callback end
  end }
  local app = {
    print = function() end, PrintDebug = function() end, report = function() end,
    PrintError = function(message) clock.errors[#clock.errors + 1] = message end,
    events = {},
    MetaTable = { AutoTable = { __index = function(t, key)
      local value = {}; rawset(t, key, value); return value
    end } },
    wipearray = function(array) for i = #array, 1, -1 do array[i] = nil end end,
    RegisterFuncEvent = function(self, event, func) self.events[event] = func end,
    CallbackHandlers = { Callback = function(func, argument)
      C_Timer.After(0, function() func(argument) end)
    end },
  }
  for _, path in ipairs({ "lib/Profiler.lua", "lib/ProfilerJobs.lua", "lib/Runner.lua", "src/Events.lua" }) do
    assert(loadfile(root .. "/" .. path))("AllTheThings", app)
  end
  return app, clock
end

---Run one real scheduler frame, excluding later queued frames from this callback snapshot.
---@param clock table Explicit timer and time fixture associated with the app.
local function Frame(clock)
  local due = clock.pending
  clock.pending = {}
  clock.now = clock.now + 0.010
  for i = 1, #due do due[i]() end
end

---Drain the real Runner scheduling chain while ignoring positive automatic-stop timers.
---@param clock table Timer fixture whose zero-delay callbacks must settle.
local function Drain(clock)
  local frames = 0
  while #clock.pending > 0 do
    frames = frames + 1
    assert(frames < 100000, "scheduler did not settle")
    Frame(clock)
  end
end

---Select one fixed capture policy before the measured workload begins.
---@param app table ATT instance owning the production engine and its listeners.
---@param level integer Cumulative capture level; zero retains ordinary disabled execution.
local function Start(app, level)
  if level > 0 then
    assert(app.Profiler.Start(300, level, {
      include = "all", jobBudget = JOB_BUDGET, timelineBudget = TIMELINE_BUDGET,
      slowThresholdMs = 0,
    }))
  end
end

---Split one tab-separated report line, preserving fields that have no content.
---@param line string Single report row without the terminating newline.
---@return string[] fields Fields in their original report order.
local function Fields(line)
  local fields = {}
  for field in (line .. "\t"):gmatch("(.-)\t") do fields[#fields + 1] = field end
  return fields
end

---Require an actual aggregate with the expected invocation count and simulated duration.
---@param report string Completed capture report built outside the measured batch.
---@param id string Exact stable timing or counter identifier.
---@param count integer Expected accepted samples or counter increments.
---@param totalMs number? Expected simulated aggregate milliseconds; nil selects a counter.
local function CheckMetric(report, id, count, totalMs)
  for line in report:gmatch("[^\n]+") do
    if line:sub(1, #id + 1) == id .. "\t" then
      local fields = Fields(line)
      assert(tonumber(fields[2]) == count, id .. ": incorrect count")
      if totalMs then
        assert(math.abs(tonumber(fields[3]) - totalMs) < 0.002, id .. ": incorrect total")
      end
      return
    end
  end
  error("missing metric " .. id .. "\n" .. report)
end

---Verify that no observation from a disabled detail level reached the report.
---@param report string Retained report under inspection.
---@param fragment string Literal metric or section prefix required to be absent.
local function Absent(report, fragment)
  assert(not report:find(fragment, 1, true), "unexpected observation " .. fragment)
end

---Validate finite job retention and timeline overwrite without timing report formatting.
---@param report string Retained capture after work and stop.
---@param level integer Cumulative level whose independent data budgets are checked.
---@param jobs boolean Whether the workload creates observed Runner or coroutine jobs.
local function CheckBudgets(report, level, jobs)
  if jobs and level >= 4 then
    local retained = 0
    for line in report:gmatch("[^\n]+") do
      local fields = Fields(line)
      if tonumber(fields[1]) and fields[2] and
        (fields[2] == "runner.default.work" or fields[2] == "coroutine.work") then
        retained = retained + 1
        assert(fields[5] == "completed" and fields[6] == "no", "job lifecycle changed")
        assert(math.abs(tonumber(fields[8]) - 0.001) < 0.0001, "job execution changed")
        assert(tonumber(fields[10]) == 1, "job resume count changed")
      end
    end
    assert(retained == JOB_BUDGET, "job capacity was not reached exactly")
    assert(report:find("Job observations omitted after capacity was reached:", 1, true))
  else
    Absent(report, "Jobs (")
  end
  if level >= 5 then
    local retained, overwritten = report:match("Timeline: (%d+) retained; (%d+) overwritten;")
    assert(tonumber(retained) == TIMELINE_BUDGET and tonumber(overwritten) > 0, "timeline ring did not overwrite")
  else
    Absent(report, "Timeline:")
  end
end

---Check nil argument conventions and original error handling outside CPU measurements.
---@param app table Actual service instance whose public APIs are being checked.
---@param clock table Collected timers and errors used to inspect completion and failures.
local function CheckPublicSemantics(app, clock)
  local called = 0
  app.FunctionRunner.Run(function(...)
    assert(select("#", ...) == 1 and (...) == nil)
    called = called + 1
    return nil, "ignored return"
  end)
  Drain(clock)
  assert(called == 1)
  local failure = {}
  app.FunctionRunner.Run(function() error(failure) end)
  Drain(clock)
  assert(clock.errors[#clock.errors] == failure, "Runner changed the original error")
  local coroutineCalled = 0
  app.StartCoroutine("semantic-coroutine", function(...)
    assert(select("#", ...) == 0)
    coroutineCalled = coroutineCalled + 1
    return nil, "ignored return"
  end)
  Drain(clock)
  assert(coroutineCalled == 1)
  app.AddEventHandler("OnWindowRefreshed", function() error(failure) end, false, "semantic-error")
  local ok, err = pcall(app.HandleEvent, "OnWindowRefreshed")
  assert(not ok and err == failure, "immediate dispatch changed the original error")
end

---Register a fixture factory; all initialization and validation remain outside timing.
---@param name string Stable TSV case name identifying path and capture level.
---@param operations integer Logical work count per complete timed batch.
---@param setup fun(): table Factory returning app, clock, workload, and semantic checker.
local function Add(name, operations, setup)
  if not selected or name:find(selected, 1, true) then
    cases[#cases + 1] = { name = name, operations = operations, setup = setup }
  end
end

for _, selectedLevel in ipairs({ 0, 1, 3, 4, 5 }) do
  local level = selectedLevel
  Add("runner.L" .. level, RUNNER_CALLS, function()
    local app, clock = NewApp()
    app.FunctionRunner.SetPerFrameDefault(256)
    local calls, checksum, badArguments = 0, 0, 0
    local function Worker(...)
      local first, middle, last = ...
      if select("#", ...) ~= 3 or middle ~= nil or last ~= first * 2 then badArguments = badArguments + 1 end
      calls, checksum = calls + 1, checksum + first + last
      clock.now = clock.now + 0.000001
      return nil, "ignored return"
    end
    Start(app, level)
    return { app = app, clock = clock, level = level, run = function()
      for i = 1, RUNNER_CALLS do app.FunctionRunner.Queue(Worker, i, nil, i * 2) end
      app.FunctionRunner.Run()
      Drain(clock)
    end, check = function(report)
      assert(calls == RUNNER_CALLS and checksum == 3 * RUNNER_CALLS * (RUNNER_CALLS + 1) / 2 and badArguments == 0)
      assert(#clock.errors == 0 and not app.FunctionRunner.IsRunning())
      if level > 0 then
        CheckMetric(report, "runner.default.slice", RUNNER_CALLS / 256 + 1, RUNNER_CALLS / 1000)
        if level >= 2 then CheckMetric(report, "runner.default.work", RUNNER_CALLS, RUNNER_CALLS / 1000)
        else Absent(report, "runner.default.work\t") end
        if level >= 3 then CheckMetric(report, "runner.default.calls", RUNNER_CALLS)
        else Absent(report, "runner.default.calls\t") end
      else Absent(report, "runner.default.slice\t") end
      CheckBudgets(report, level, true)
    end }
  end)

  Add("coroutine.L" .. level, COROUTINE_CALLS, function()
    local app, clock = NewApp()
    local calls, checksum, badArguments = 0, 0, 0
    local function Worker(...)
      if select("#", ...) ~= 0 then badArguments = badArguments + 1 end
      calls = calls + 1
      checksum = checksum + calls
      clock.now = clock.now + 0.000001
      return nil, "ignored return"
    end
    Start(app, level)
    return { app = app, clock = clock, level = level, run = function()
      for i = 1, COROUTINE_CALLS do
        app.StartCoroutine("benchmark-pooled", Worker)
        Drain(clock)
      end
    end, check = function(report)
      assert(calls == COROUTINE_CALLS and checksum == COROUTINE_CALLS * (COROUTINE_CALLS + 1) / 2 and badArguments == 0)
      assert(#clock.errors == 0)
      if level > 0 then
        CheckMetric(report, "coroutine.slice", COROUTINE_CALLS, COROUTINE_CALLS / 1000)
        if level >= 2 then CheckMetric(report, "coroutine.work", COROUTINE_CALLS, COROUTINE_CALLS / 1000)
        else Absent(report, "coroutine.work\t") end
      else Absent(report, "coroutine.slice\t") end
      CheckBudgets(report, level, true)
    end }
  end)
end

for _, selectedLevel in ipairs({ 0, 2, 3, 5 }) do
  local level = selectedLevel
  Add("events.L" .. level, EVENT_DISPATCHES * HANDLERS, function()
    local app, clock = NewApp()
    local calls, checksum, badArguments = 0, 0, 0
    for selectedIndex = 1, HANDLERS do
      local index = selectedIndex
      app.AddEventHandler("OnWindowUpdated", function(...)
        local first, middle, last = ...
        if select("#", ...) ~= 3 or middle ~= nil or last ~= first * 2 then badArguments = badArguments + 1 end
        calls, checksum = calls + 1, checksum + first + last + index
        clock.now = clock.now + 0.000001
        return nil, "ignored return"
      end, false, "benchmark" .. index)
    end
    Start(app, level)
    return { app = app, clock = clock, level = level, run = function()
      for i = 1, EVENT_DISPATCHES do app.HandleEvent("OnWindowUpdated", i, nil, i * 2) end
    end, check = function(report)
      local expected = HANDLERS * 3 * EVENT_DISPATCHES * (EVENT_DISPATCHES + 1) / 2
        + EVENT_DISPATCHES * HANDLERS * (HANDLERS + 1) / 2
      assert(calls == EVENT_DISPATCHES * HANDLERS and checksum == expected and badArguments == 0)
      assert(#clock.errors == 0 and #clock.pending == 0)
      for i = 1, HANDLERS do
        local id = "event.handler.OnWindowUpdated.benchmark" .. i
        if level >= 2 then CheckMetric(report, id, EVENT_DISPATCHES, EVENT_DISPATCHES / 1000)
        else Absent(report, id .. "\t") end
        if level >= 3 then CheckMetric(report, id .. ".calls", EVENT_DISPATCHES)
        else Absent(report, id .. ".calls\t") end
      end
      CheckBudgets(report, level, false)
    end }
  end)
end

assert(#cases > 0, "case filter selected no benchmarks")
print("label\tcase\toperations\ttrials\tmedian_cpu_ms\tmin_cpu_ms\tmax_cpu_ms\tclock_reads\tchecksum_verified")
for _, case in ipairs(cases) do
  -- Warm up identical code in an independent instance, then measure seven fresh captures.
  local times, reads = {}, nil
  for trial = 0, TRIALS do
    local fixture = case.setup()
    collectgarbage("collect")
    local beforeReads = fixture.clock.reads
    local started = os.clock()
    fixture.run()
    local elapsed = (os.clock() - started) * 1000
    local measuredReads = fixture.clock.reads - beforeReads
    if reads then assert(reads == measuredReads, "clock count changed between trials for " .. case.name)
    else reads = measuredReads end
    if case.name:sub(-2) == "L0" then assert(reads == 0, "disabled workload reads a profile clock") end
    if fixture.app.Profiler.Enabled then assert(fixture.app.Profiler.Stop()) end
    local report = fixture.app.Profiler.Report()
    fixture.check(report)
    Start(fixture.app, fixture.level)
    CheckPublicSemantics(fixture.app, fixture.clock)
    if trial > 0 then times[#times + 1] = elapsed end
  end
  table.sort(times)
  print(string.format("%s\t%s\t%d\t%d\t%.3f\t%.3f\t%.3f\t%d\tyes",
    label, case.name, case.operations, TRIALS, times[(TRIALS + 1) / 2], times[1], times[#times], reads))
end
