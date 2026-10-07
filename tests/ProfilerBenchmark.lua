-- Run: lua tests/ProfilerBenchmark.lua [source-root] [label] [case-filter]
-- Example: lua tests/ProfilerBenchmark.lua /private/tmp/att-baseline baseline cache.L1
-- Matched actual-source fixtures with a fixed clock, not a WoW or FPS benchmark.
-- Source spans follow ProfilerModules.lua; dependency stubs intentionally omit
-- Blizzard API, rendering, and real Runner costs. Reports are built after timing.
local root, label = arg[1] or ".", arg[2] or "working-tree"
local selected = arg[3]
local Compile = loadstring or load
local TRIALS, SCALAR_CALLS, SEGMENTS = 7, 100000, 10000
local cases = {}
unpack = unpack or table.unpack
tinsert = table.insert
C_AddOnProfiler, Enum = nil, nil
time = function() return 1000 end
wipe = function(t) for key in pairs(t) do t[key] = nil end return t end

---Read an actual production file using a normalized fixture line ending.
---@param path string Source path relative to the selected source root.
---@return string source Production bytes normalized to LF for literal boundaries.
local function Read(path)
  local file = assert(io.open(root .. "/" .. path, "rb"))
  local source = file:read("*a"):gsub("\r\n", "\n")
  file:close()
  return source
end

---Select a production span without reproducing its implementation in the fixture.
---@param path string Source path relative to the selected source root.
---@param first string Literal first marker included in the returned span.
---@param after string Literal next marker excluded from the returned span.
---@return string source Unmodified production span between the two markers.
local function Span(path, first, after)
  local source = Read(path)
  local begin = assert(source:find(first, 1, true), path .. ": missing " .. first)
  local finish = assert(source:find(after, begin + #first, true), path .. ": missing " .. after)
  return source:sub(begin, finish - 1)
end

---Construct an independent profiler and explicit clock counter for one benchmark.
---@return table app Minimal ATT instance owning the production profiler.
---@return table clock Fixed time and number of precise-clock reads.
local function NewApp()
  local clock = { now = 100, reads = 0 }
  GetTimePreciseSec = function() clock.reads = clock.reads + 1; return clock.now end
  C_Timer = { After = function() end }
  local app = { print = function() end }
  assert(loadfile(root .. "/lib/Profiler.lua"))("AllTheThings", app)
  return app, clock
end

---Start a cumulative level or retain the disabled session.
---@param app table Fixture ATT instance.
---@param level integer Selected level, with zero meaning recording disabled.
---@param module string? Detailed subsystem used by the optional Level 6 fixture.
local function Start(app, level, module)
  if level > 0 then
    assert(app.Profiler.Start(300, level, level >= 4 and { include = module or "all", sampleEvery = 10 } or nil))
  end
end

---Verify one final metric row without including report construction in timed work.
---@param report string Serialized completed benchmark observations.
---@param id string Exact stable metric identifier expected in the report.
---@param count number Expected accepted timing samples or counter increments.
---@param units number? Expected timing work units; nil leaves counters without units.
local function CheckMetric(report, id, count, units)
  for line in report:gmatch("[^\n]+") do
    if line:sub(1, #id + 1) == id .. "\t" then
      local fields = {}
      for field in line:gmatch("[^\t]+") do fields[#fields + 1] = field end
      assert(tonumber(fields[2]) == count, "incorrect count for " .. id)
      if units then assert(tonumber(fields[7]) == units, "incorrect units for " .. id) end
      return
    end
  end
  error("missing metric " .. id .. "\n" .. report)
end

---Append a timed workload with its independent semantic validator.
---@param name string Stable output row label.
---@param units string Work performed per invocation, independent of retained metrics.
---@param app table Fixture ATT instance whose report is serialized outside timing.
---@param clock table Explicit clock fixture for exact clock-call counts.
---@param run fun(): number Workload returning a numeric semantic checksum.
---@param check fun(value: number) Validator called after each untimed or timed workload batch.
---@param repeats integer Number of whole workloads per timing trial.
---@param finish fun(invocations: integer)? Final untimed report validator, including warmup and all trials.
local function Add(name, units, app, clock, run, check, repeats, finish)
  if selected and not name:find(selected, 1, true) then return end
  cases[#cases + 1] = { name = name, units = units, app = app, clock = clock,
    run = run, check = check, repeats = repeats, finish = finish }
end

-- One registered production timing scope, including a sweep across histogram buckets.
for _, duration in ipairs({ false, 0, .125, .75, 12, 400, 1200 }) do
  local app, clock = NewApp()
  local scope = app.Profiler.RegisterScope("benchmark.scalar", "costs", 1, "time")
  local level = duration == false and 0 or 1
  Start(app, level)
  local checksumExpected = SCALAR_CALLS * (SCALAR_CALLS + 3) / 2
  local calls = 0
  ---Execute fixed scalar work between real production Begin and Finish boundaries.
  ---@return number checksum Sum of scalar return values across the complete workload.
  local function Run()
    local checksum = 0
    for i = 1, SCALAR_CALLS do
      clock.now = 100
      local started, session = app.Profiler.Begin(scope)
      local result = i + 1
      clock.now = 100 + (duration or 0) / 1000
      app.Profiler.Finish(scope, started, session, 1)
      checksum = checksum + result
    end
    calls = calls + SCALAR_CALLS
    return checksum
  end
  Add("scope." .. (level == 0 and "inactive" or "L1." .. duration .. "ms"), "100000 scope calls",
    app, clock, Run, function(value)
      assert(value == checksumExpected)
      if level > 0 then
        local report = app.Profiler.Report()
        local bucket = duration <= .25 and "<=0.25" or duration <= 1 and "<=1.00"
          or duration <= 16 and "<=16.00" or duration <= 500 and "<=500.00" or ">1000"
        assert(report:find("benchmark.scalar\t" .. calls .. "\t", 1, true))
        assert(report:find("\t" .. bucket .. "\t" .. calls, 1, true))
      end
    end, 1)
end

-- Real module bodies with large, deterministic inputs. Each level is a new instance.
for _, level in ipairs({ 0, 1, 3 }) do
  local app, clock = NewApp()
  app.ArrayAppend = function(dest, values)
    for _, value in ipairs(values) do dest[#dest + 1] = value end
  end
  local caches, ids, expectedCount, expectedSum = {}, {}, 0, 0
  for id = 1, 4096 do ids[id] = id end
  for index = 1, 16 do
    local field = {}
    caches[index] = { itemID = field }
    for id = 1, #ids do
      local value = index * 10000 + id
      local list = id % 4 == 0 and { { value = value } } or {}
      field[id] = list
      if #list > 0 then expectedCount = expectedCount + 1; expectedSum = expectedSum + value end
    end
  end
  app.testCaches = caches
  local code = "local app = ...\n" .. Span("src/Cache.lua", "---@type ATTProfiler", "-- Global locals")
    .. "local AllCaches, ArrayAppend = app.testCaches, app.ArrayAppend\n"
    .. Span("src/Cache.lua", "app.SearchForFieldInAllCaches =", "app.CreateDataCache =")
  assert(Compile(code, "@src/Cache.lua benchmark span"))(app)
  Start(app, level)
  local last, cacheApp = nil, app
  Add("cache.L" .. level, "16 caches x 4096 IDs", app, clock, function()
    last = cacheApp.SearchForManyInAllCaches("itemID", ids)
    return #last
  end, function(value)
    assert(value == expectedCount)
    local sum = 0
    for _, group in ipairs(last) do sum = sum + group.value end
    assert(sum == expectedSum)
  end, 3, function(invocations)
    if level == 3 then
      local report = cacheApp.Profiler.Report()
      CheckMetric(report, "cache.lookups", invocations * 16 * 4096)
      CheckMetric(report, "cache.hits", invocations * expectedCount)
      CheckMetric(report, "cache.misses", invocations * (16 * 4096 - expectedCount))
      CheckMetric(report, "cache.search", invocations, invocations * 16 * 4096)
    end
  end)

  app, clock = NewApp()
  local handlers, ids = {}, {}
  app.L = {}
  app.Modules = { RetrievingData = { IsRetrieving = function() return false end } }
  app.Audio = { PlayMountFanfare = function() end, PlayFanfare = function() end }
  app.CallbackHandlers = { Callback = function() end }
  app.CreateRunner = function() return { Run = function() end } end
  app.AddEventHandler = function(event, callback) handlers[event] = callback end
  app.Settings = { AccountWide = {} }
  assert(loadfile(root .. "/src/Modules/Collection.lua"))("AllTheThings", app)
  local character, account = { Sources = {}, TimeStamps = {} }, { Sources = {} }
  handlers.OnSavedVariablesAvailable(character, account)
  for id = 1, 65536 do ids[id] = true end
  Start(app, level)
  local state, changed, collectionApp = 1, nil, app
  Add("collection.L" .. level, "65536 changed IDs", app, clock, function()
    state = 3 - state
    changed = {}
    assert(collectionApp.SetBatchCachedAndTrackChanges("Sources", ids, changed, state))
    return #changed
  end, function(value)
    assert(value == 65536)
    local sum = 0
    for _, id in ipairs(changed) do assert(character.Sources[id] == state); sum = sum + id end
    assert(sum == 65536 * 65537 / 2)
  end, 3, function(invocations)
    if level == 3 then
      local report = collectionApp.Profiler.Report()
      CheckMetric(report, "collection.batch.ids", invocations * 65536)
      CheckMetric(report, "collection.batch.changes", invocations * 65536)
      CheckMetric(report, "collection.batch", invocations, invocations * 65536)
      CheckMetric(report, "collection.batch.changed", invocations, invocations * 65536)
    end
  end)

  app, clock = NewApp()
  local fields, expectedJobs, expectedIDs = {}, 0, 0
  for index, field in ipairs({ "itemIDAsCost", "currencyIDAsCost", "spellIDAsCost" }) do
    fields[field] = {}
    for id = 1, 8192 do
      local key = index * 100000 + id
      fields[field][key] = { true }
      expectedJobs, expectedIDs = expectedJobs + 1, expectedIDs + key
    end
  end
  local jobs, sum, filters, resets, endCalls, startCalls = 0, 0, 0, 0, 0, 0
  app.Settings = { GetTooltipSetting = function() return false end }
  app._SettingsRefresh = true
  app.GetFieldContainer = function(field) return fields[field] end
  local costApp = app
  app.runner = {
    Reset = function() jobs, sum = 0, 0; resets = resets + 1 end,
    OnEnd = function(callback) assert(callback == costApp.complete); endCalls = endCalls + 1 end,
    Run = function(callback, id, refresh, includeUpdate, refs)
      if id then
        assert(refresh == true and includeUpdate == false and #refs == 1)
        jobs, sum = jobs + 1, sum + id
      else assert(callback == costApp.start); startCalls = startCalls + 1 end
    end,
  }
  app.item, app.currency, app.spell = function() end, function() end, function() end
  app.start, app.complete = function() end, function() end
  app.filters = function() filters = filters + 1 end
  local queueCode = "local app = ...\n" .. Span("src/Modules/Costs.lua", "---@type ATTProfiler", "-- Concepts:")
    .. [[
local UpdateRunner = app.runner
local UpdateCostsByItemID, UpdateCostsByCurrencyID, UpdateCostsBySpellID = app.item, app.currency, app.spell
local CostCalcStart, CostCalcComplete, CacheFilters = app.start, app.complete, app.filters
]] .. Span("src/Modules/Costs.lua", "local function UpdateCosts()", "local UpdateCostTypeFunc")
    .. "return UpdateCosts\n"
  local queue = assert(Compile(queueCode, "@src/Modules/Costs.lua benchmark queue"))(app)
  Start(app, level)
  Add("costs.queue.L" .. level, "24576 queued jobs", app, clock, function()
    queue()
    return sum
  end, function(value)
    assert(value == expectedIDs and jobs == expectedJobs)
    assert(filters == resets and filters == endCalls and filters == startCalls)
  end, 3, function(invocations)
    if level == 3 then
      local report = costApp.Profiler.Report()
      CheckMetric(report, "costs.queue.jobs", invocations * expectedJobs)
      CheckMetric(report, "costs.queue", invocations, invocations * expectedJobs)
    end
  end)

  app, clock = NewApp()
  local ownership, info, expanded = 0, 0, 0
  app.MaxSourceID, app.Class, app.Presets = 100000, "Hunter", { Hunter = {} }
  app.Settings = { Get = function() return false end }
  app.ItemSourceFilter = function(value) return value and value.allowed end
  app.testSources, app.testUnique = {}, {}
  app.Ownership = function(id) ownership = ownership + 1; return id % 2 == 1 end
  app.Info = function(id) info = info + 1; return { sourceID = id, allowed = true } end
  app.Mark = function(id) expanded = expanded + 1; app.testUnique[id] = true end
  local transmogCode = "local app = ...\nlocal Profiler = app.Profiler\n"
    .. Span("src/Classes/Transmog.lua", "local ScopeUniqueCollect", "local RETRIEVING_DATA")
    .. [[
local AccountSources, AccountUniqueSources = app.testSources, app.testUnique
local C_TransmogCollection_PlayerHasTransmogItemModifiedAppearance, C_TransmogCollection_GetSourceInfo = app.Ownership, app.Info
local MarkUniqueCollectedSourcesBySource = app.Mark
local function AccountUniqueSources_ADD(id) AccountUniqueSources[id] = true end
]] .. Span("src/Classes/Transmog.lua", "local function GetProfiledSourceOwnership", "-- These events are technically")
    .. "return RefreshAppearanceSources, CollectUniqueAppearances\n"
  local refresh, unique = assert(Compile(transmogCode, "@src/Classes/Transmog.lua benchmark sweeps"))(app)
  Start(app, level)
  Add("transmog.L" .. level, "100000 ownership + Unique sweep", app, clock, function()
    ATTAccountWideData = { BrokenUniqueSources = { [2] = true, [3] = true } }
    ownership, info, expanded = 0, 0, 0
    refresh(); unique()
    return ownership + info + expanded
  end, function(value)
    assert(value == 150001 and ownership == 100000 and info == 1 and expanded == 50000)
    local count, sum = 0, 0
    for id in pairs(app.testUnique) do count, sum = count + 1, sum + id end
    assert(count == 50001 and sum == 50000 * 50000 + 2)
  end, 3, function(invocations)
    if level == 3 then
      local report = app.Profiler.Report()
      CheckMetric(report, "transmog.sources.known", invocations * 50000)
      CheckMetric(report, "transmog.unique.expanded", invocations * 50000)
      CheckMetric(report, "transmog.sources.scan", invocations, invocations * 100000)
      CheckMetric(report, "transmog.unique.collect", invocations, invocations * 100000)
      CheckMetric(report, "transmog.unique.broken", invocations, invocations * 2)
    end
  end)
end

-- Actual cost API binding selection; sample-heavy level is included separately.
-- Execute each production callsite directly inside the same synthetic query loop.
-- A per-query getter wrapper would add an extra layer only to the new active alias.
for _, level in ipairs({ 0, 1, 6 }) do
  local app, clock = NewApp()
  local queries = 0
  app.GetItemCount = function(id, bank, uses, reagent, account)
    assert(bank == true and uses == nil and reagent == true and account == true)
    queries = queries + 1
    return id % 11
  end
  local helperStart = Read("src/Modules/Costs.lua"):find("local OriginalGetItemCount = GetItemCount;", 1, true)
    and "local OriginalGetItemCount = GetItemCount;" or "local function GetOwnedItemCount"
  local queryCode = "local app = ...\n" .. Span("src/Modules/Costs.lua", "---@type ATTProfiler", "-- Concepts:")
    .. "local GetItemCount = app.GetItemCount\n"
    .. Span("src/Modules/Costs.lua", helperStart, "-- Module locals")
    .. "return function(count) local sum = 0; for id = 1,count do sum = sum + "
    .. (helperStart == "local function GetOwnedItemCount" and "GetOwnedItemCount(id)"
      or "GetItemCount(id,true,nil,true,true)")
    .. "; end; return sum end\n"
  local owned = assert(Compile(queryCode, "@src/Modules/Costs.lua benchmark API binding"))(app)
  Start(app, level, "costs")
  local expectedSum = 0
  for id = 1, SCALAR_CALLS do expectedSum = expectedSum + id % 11 end
  Add("costs.api.L" .. level, "100000 normalized item queries", app, clock, function()
    queries = 0
    return owned(SCALAR_CALLS)
  end, function(value) assert(value == expectedSum and queries == SCALAR_CALLS) end, 1, function(invocations)
    if level == 6 then
      CheckMetric(app.Profiler.Report(), "costs.api.itemcount", invocations * SCALAR_CALLS / 10,
        invocations * SCALAR_CALLS / 10)
    end
  end)
end

-- One retained job repeatedly begins/pauses. No production Runner is simulated.
for _, level in ipairs({ 4, 5 }) do
  local app, clock = NewApp()
  assert(loadfile(root .. "/lib/ProfilerJobs.lua"))("AllTheThings", app)
  local scope = app.Profiler.RegisterScope("benchmark.job", "runner", 2, "time")
  assert(app.Profiler.Start(300, level, { include = "runner", timelineBudget = 16 }))
  local job = assert(app.ProfilerJobs.Enqueue(scope, "benchmark", 1))
  local expectedResumes = 0
  Add("jobs.L" .. level, "10000 segments + context queries", app, clock, function()
    local sum = 0
    for _ = 1, SEGMENTS do
      assert(app.ProfilerJobs.Begin(job, scope) == job)
      sum = sum + #assert(app.Profiler.GetCurrentContext())
      clock.now = clock.now + .001
      app.ProfilerJobs.Pause(job)
    end
    expectedResumes = expectedResumes + SEGMENTS
    return sum
  end, function(value)
    assert(value == SEGMENTS * #"job=1 origin=benchmark")
    assert(job.resumes == expectedResumes and math.abs(job.execution - expectedResumes) < .01)
    assert(job.status == "suspended" and app.Profiler.GetCurrentContext() == nil)
  end, 1)
end

-- Each trial measures only the workload batch. Semantic checks and Report run after it.
print("runtime\tlabel\tcase\tunits\tmedian_us_per_workload\tclock_reads_per_workload\tchecksum")
for _, case in ipairs(cases) do
  local value = case.run()
  case.check(value)
  local times, reads = {}, nil
  for trial = 1, TRIALS do
    collectgarbage("collect")
    local before = case.clock.reads
    local start = os.clock()
    for _ = 1, case.repeats do value = case.run() end
    times[trial] = (os.clock() - start) * 1000000 / case.repeats
    local trialReads = (case.clock.reads - before) / case.repeats
    assert(reads == nil or reads == trialReads, "inconsistent clock reads")
    reads = trialReads
    case.check(value)
  end
  if case.finish then case.finish(1 + TRIALS * case.repeats) end
  table.sort(times)
  print(string.format("%s\t%s\t%s\t%s\t%.3f\t%.0f\t%.0f",
    _VERSION, label, case.name, case.units, times[(TRIALS + 1) / 2], reads, value))
end
