-- Run from the repository root: lua tests/ProfilerModules.lua
-- Execute modified ATT boundaries from their source with deterministic dependency stubs.
local Compile = loadstring or load
local now, clockReads = 100, 0
GetTimePreciseSec = function() clockReads = clockReads + 1; now = now + 0.001; return now end
C_Timer = { After = function() end }
C_AddOnProfiler = nil
Enum = nil
time = function() return 1000 end
wipe = function(t) for key in pairs(t) do t[key] = nil end return t end

---Create an isolated profiler service and minimal ATT dependency container.
---@return table app Test ATT instance owning a fresh registry, session, and report.
local function NewApp()
  local app = { print = function() end }
  assert(loadfile("lib/Profiler.lua"))("AllTheThings", app)
  return app
end

---Read a literal source span; the tested function body comes from the production file.
---@param path string Repository-relative Lua source path.
---@param first string Unique literal marker at the start of the requested source span.
---@param after string Unique literal marker immediately after the requested source span.
---@return string source Production source between the markers, including the first marker.
local function SourceSpan(path, first, after)
  local file = assert(io.open(path, "rb"))
  local source = file:read("*a"):gsub("\r\n", "\n")
  file:close()
  local at = assert(source:find(first, 1, true), first)
  local finish = assert(source:find(after, at + #first, true), after)
  return source:sub(at, finish - 1)
end

---Check for a literal metric or message in a report.
---@param report string Profiler report to inspect.
---@param text string Required literal fragment.
local function Contains(report, text)
  assert(report:find(text, 1, true), "missing " .. text .. "\n" .. report)
end

---Ensure a gated metric is absent from a report.
---@param report string Profiler report to inspect.
---@param text string Forbidden literal fragment.
local function Absent(report, text)
  assert(not report:find(text, 1, true), "unexpected " .. text .. "\n" .. report)
end

-- Actual collection module load and its saved-variable initialization handler.
local collection = NewApp()
local handlers = {}
collection.L = {}
collection.Modules = { RetrievingData = { IsRetrieving = function() return false end } }
collection.Audio = { PlayMountFanfare = function() end, PlayFanfare = function() end }
collection.CallbackHandlers = { Callback = function() end }
collection.CreateRunner = function() return { Run = function() end } end
collection.AddEventHandler = function(event, callback) handlers[event] = callback end
collection.Settings = { AccountWide = {} }
assert(loadfile("src/Modules/Collection.lua"))("AllTheThings", collection)
local character, account = { Sources = {}, TimeStamps = {} }, { Sources = {} }
handlers.OnSavedVariablesAvailable(character, account)
local before = clockReads
assert(collection.SetBatchCached("Sources", { [1] = true, [2] = true }, 1) == nil)
assert(character.Sources[1] == 1 and character.Sources[2] == 1 and clockReads == before)
---Run a fixed collection fixture at one cumulative level.
---@param level integer Profiler level selected for the fixture.
---@param options table? Optional module filter policy for the capture.
---@return string report Capture report after the collection-state operations.
local function RunCollectionBatch(level, options)
  assert(collection.Profiler.Start(30, level, options))
  character.Sources = { [1] = 1 }
  local changes = {}
  assert(collection.SetBatchCachedAndTrackChanges("Sources", { [1] = true, [2] = true }, changes, 1))
  assert(#changes == 1 and changes[1] == 2)
  assert(collection.SetBatchCachedAndTrackChanges("Sources", { [1] = true }, changes, 1) == nil)
  collection.SetBatchAccountCached("Sources", { [3] = true }, 1)
  assert(account.Sources[3] == 1)
  return collection.Profiler.Report()
end
local report = RunCollectionBatch(1)
Contains(report, "collection.batch\t3")
Absent(report, "collection.batch.changed\t")
Absent(report, "collection.batch.ids\t")
report = RunCollectionBatch(3)
Contains(report, "collection.batch.changed\t2")
Contains(report, "collection.batch.ids\t4")
Contains(report, "collection.batch.changes\t1")
report = RunCollectionBatch(6, { include = "search" })
Contains(report, "collection.batch\t3")
Absent(report, "collection.batch.ids\t")
Absent(report, "collection.batch.changes\t")
assert(collection.Profiler.Stop())
local collectionReport = collection.Profiler.Report()
local collectionTime = 2000
time = function() return collectionTime end
character.Sources = { [1] = 1 }
local stoppedChanges = {}
before = clockReads
assert(collection.SetBatchCachedAndTrackChanges("Sources", { [1] = true, [2] = true }, stoppedChanges, 1))
assert(#stoppedChanges == 1 and stoppedChanges[1] == 2 and character.TimeStamps.Sources == 2000)
assert(character.lastPlayed == 2000 and clockReads == before)
collectionTime = 3000
assert(collection.SetBatchCachedAndTrackChanges("Sources", { [1] = true, [2] = true }, stoppedChanges, 1) == nil)
assert(#stoppedChanges == 1 and character.TimeStamps.Sources == 2000 and character.lastPlayed == 2000)
assert(collection.Profiler.Report() == collectionReport)
report = RunCollectionBatch(3)
Contains(report, "collection.batch.ids\t4")
Contains(report, "collection.batch.changes\t1")
assert(character.TimeStamps.Sources == 3000 and character.lastPlayed == 3000)

-- Actual cache search functions retain source object identity and return all cache matches.
local cache = NewApp()
local one, two = { id = 1 }, { id = 2 }
cache.ArrayAppend = function(dest, values) for _, value in ipairs(values) do dest[#dest + 1] = value end end
cache.testCaches = { a = { itemID = { [1] = { one }, [2] = {} } }, b = { itemID = { [1] = {}, [2] = { two } } } }
local cacheCode = "local app = ...\n" .. SourceSpan("src/Cache.lua", "---@type ATTProfiler", "-- Global locals")
  .. "local AllCaches, ArrayAppend = app.testCaches, app.ArrayAppend\n"
  .. SourceSpan("src/Cache.lua", "app.SearchForFieldInAllCaches =", "app.CreateDataCache =")
assert(Compile(cacheCode, "@src/Cache.lua instrumented search"))(cache)
before = clockReads
local results = cache.SearchForFieldInAllCaches("itemID", 1)
assert(#results == 1 and results[1] == one and clockReads == before)
assert(cache.Profiler.Start(30, 3))
results = cache.SearchForManyInAllCaches("itemID", { 1, 2 })
assert(#results == 2 and ((results[1] == one and results[2] == two) or (results[1] == two and results[2] == one)))
report = cache.Profiler.Report()
Contains(report, "cache.search\t1")
Contains(report, "cache.lookups\t4")
Contains(report, "cache.hits\t2")
Contains(report, "cache.misses\t2")
assert(cache.Profiler.Start(30, 6, { include = "search" }))
results = cache.SearchForManyInAllCaches("itemID", { 1, 2 })
assert(#results == 2 and ((results[1] == one and results[2] == two) or (results[1] == two and results[2] == one)))
report = cache.Profiler.Report()
Contains(report, "cache.search\t1")
Absent(report, "cache.lookups\t")
assert(cache.Profiler.Stop())
local cacheReport = cache.Profiler.Report()
before = clockReads
results = cache.SearchForFieldInAllCaches("itemID", 1)
assert(#results == 1 and results[1] == one and clockReads == before)
assert(cache.Profiler.Report() == cacheReport)
assert(cache.Profiler.Start(30, 3))
cache.SearchForManyInAllCaches("itemID", { 1, 2 })
Contains(cache.Profiler.Report(), "cache.lookups\t4")

-- Actual transmog ownership/Unique sweeps: diagnostic gating must not change API counts.
local transmog = NewApp()
local ownershipCalls, infoCalls, expanded = 0, 0, 0
transmog.MaxSourceID, transmog.Class, transmog.Presets = 6, "Hunter", { Hunter = {} }
transmog.Settings = { Get = function() return false end }
transmog.ItemSourceFilter = function(info) return info and info.allowed end
transmog.testSources, transmog.testUnique = {}, {}
transmog.Ownership = function(id) ownershipCalls = ownershipCalls + 1; return id % 2 == 1 end
transmog.Info = function(id) infoCalls = infoCalls + 1; return { sourceID = id, allowed = true } end
transmog.Mark = function() expanded = expanded + 1 end
ATTAccountWideData = { BrokenUniqueSources = { [2] = true, [3] = true } }
local transmogCode = "local app = ...\nlocal Profiler = app.Profiler\n"
  .. SourceSpan("src/Classes/Transmog.lua", "local ScopeUniqueCollect", "local RETRIEVING_DATA")
  .. [[
local AccountSources, AccountUniqueSources = app.testSources, app.testUnique
local C_TransmogCollection_PlayerHasTransmogItemModifiedAppearance, C_TransmogCollection_GetSourceInfo = app.Ownership, app.Info
local MarkUniqueCollectedSourcesBySource = app.Mark
local function AccountUniqueSources_ADD(id) AccountUniqueSources[id] = true end
]]
  .. SourceSpan("src/Classes/Transmog.lua", "local function GetProfiledSourceOwnership", "-- These events are technically")
  .. "return RefreshAppearanceSources, CollectUniqueAppearances\n"
local refresh, unique = assert(Compile(transmogCode, "@src/Classes/Transmog.lua instrumented sweeps"))(transmog)
before = clockReads
refresh(); unique()
assert(ownershipCalls == 6 and expanded == 3 and infoCalls == 1 and clockReads == before)
assert(transmog.testSources[1] == 1 and transmog.testSources[2] == nil and transmog.testUnique[2])
assert(transmog.Profiler.Start(30, 1))
refresh(); unique()
report = transmog.Profiler.Report()
Contains(report, "transmog.sources.scan\t1")
Contains(report, "transmog.unique.collect\t1")
Absent(report, "transmog.unique.known\t")
Absent(report, "transmog.api.known\t")
assert(transmog.Profiler.Start(30, 3))
refresh(); unique()
report = transmog.Profiler.Report()
Contains(report, "transmog.sources.known\t3")
Contains(report, "transmog.unique.expanded\t3")
Contains(report, "transmog.unique.broken\t1")
Absent(report, "transmog.api.known\t")
assert(transmog.Profiler.Start(30, 6, { include = "transmog", sampleEvery = 2 }))
local oldCalls = ownershipCalls
refresh()
assert(ownershipCalls - oldCalls == 6)
report = transmog.Profiler.Report()
Contains(report, "transmog.api.known\t3")
assert(transmog.Profiler.Start(30, 6, { include = "search", sampleEvery = 1 }))
refresh(); unique()
report = transmog.Profiler.Report()
Contains(report, "transmog.sources.scan\t1")
Absent(report, "transmog.api.known\t")
Absent(report, "transmog.sources.known\t")
assert(transmog.Profiler.Stop())
local transmogReport = transmog.Profiler.Report()
local oldOwnership, oldInfo, oldExpanded = ownershipCalls, infoCalls, expanded
before = clockReads
refresh(); unique()
assert(ownershipCalls - oldOwnership == 6 and infoCalls - oldInfo == 1 and expanded - oldExpanded == 3)
assert(clockReads == before and transmog.Profiler.Report() == transmogReport)
assert(transmog.Profiler.Start(30, 3))
refresh(); unique()
report = transmog.Profiler.Report()
Contains(report, "transmog.sources.known\t3")
Contains(report, "transmog.unique.expanded\t3")
local brokenRow = assert(report:match("transmog%.unique%.broken[^\n]+"))
assert(brokenRow:match("\t2$") ~= nil, "broken Units must include both visited entries")

-- Actual cost API alias preserves arguments and changes only at capture boundaries.
local costs = NewApp()
local itemQueries, queryError = 0, nil
costs.GetItemCount = function(id, bank, uses, reagent, warband)
  assert(id == 123 and bank == true and uses == nil and reagent == true and warband == true)
  itemQueries = itemQueries + 1
  if queryError then error(queryError) end
  return 7
end
local costsCode = "local app = ...\n"
  .. SourceSpan("src/Modules/Costs.lua", "---@type ATTProfiler", "-- Concepts:")
  .. "local GetItemCount = app.GetItemCount\n"
  .. SourceSpan("src/Modules/Costs.lua", "local OriginalGetItemCount = GetItemCount;", "-- Module locals")
  .. "return function(id) return GetItemCount(id, true, nil, true, true) end, function() return GetItemCount end\n"
local ownedCount, itemCountAlias = assert(Compile(costsCode, "@src/Modules/Costs.lua ownership callsite"))(costs)
assert(itemCountAlias() == costs.GetItemCount)
before = clockReads
assert(ownedCount(123) == 7 and clockReads == before)
assert(costs.Profiler.Start(30, 6, { include = "costs", sampleEvery = 1 }))
assert(ownedCount(123) == 7 and itemQueries == 2)
Contains(costs.Profiler.Report(), "costs.api.itemcount\t1")
assert(itemCountAlias() ~= costs.GetItemCount)
assert(costs.Profiler.Stop())
assert(itemCountAlias() == costs.GetItemCount)
local costsReport = costs.Profiler.Report()
before = clockReads
assert(ownedCount(123) == 7 and clockReads == before and costs.Profiler.Report() == costsReport)
assert(costs.Profiler.Start(30, 6, { include = "search" }))
assert(itemCountAlias() == costs.GetItemCount)
before = clockReads
assert(ownedCount(123) == 7 and clockReads == before)
Absent(costs.Profiler.Report(), "costs.api.itemcount\t")
assert(costs.Profiler.Start(30, 3))
assert(itemCountAlias() == costs.GetItemCount)
assert(ownedCount(123) == 7)
assert(costs.Profiler.Start(30, 6, { include = "costs", sampleEvery = 2 }))
assert(itemCountAlias() ~= costs.GetItemCount)
local queriesBefore = itemQueries
assert(ownedCount(123) == 7 and ownedCount(123) == 7)
assert(itemQueries - queriesBefore == 2)
Contains(costs.Profiler.Report(), "costs.api.itemcount\t1")
costs.Profiler.Reset()
assert(itemCountAlias() == costs.GetItemCount)
local queryFailure = {}
queryError = queryFailure
local ok, failure = pcall(ownedCount, 123)
assert(not ok and failure == queryFailure)
assert(costs.Profiler.Start(30, 6, { include = "costs", sampleEvery = 1 }))
ok, failure = pcall(ownedCount, 123)
assert(not ok and failure == queryFailure)
queryError = nil
assert(ownedCount(123) == 7)
Contains(costs.Profiler.Report(), "costs.api.itemcount\t1")

-- A module loaded after capture starts must adopt its already-selected diagnostic policy.
local lateCosts = NewApp()
lateCosts.GetItemCount = costs.GetItemCount
assert(lateCosts.Profiler.Start(30, 6, { include = "costs", sampleEvery = 1 }))
local lateOwnedCount, lateItemCountAlias = assert(Compile(costsCode, "@src/Modules/Costs.lua late capture load"))(lateCosts)
assert(lateItemCountAlias() ~= lateCosts.GetItemCount)
assert(lateOwnedCount(123) == 7)
Contains(lateCosts.Profiler.Report(), "costs.api.itemcount\t1")
assert(lateCosts.Profiler.Stop() and lateItemCountAlias() == lateCosts.GetItemCount)

-- Actual cost refresh orchestration queues identical work without executing it inline.
local costWork = NewApp()
local queued, onEnd, resets, filters = {}, nil, 0, 0
local costFields = { itemIDAsCost = { [123] = { one, two }, [124] = { one } },
  currencyIDAsCost = { [42] = { two } }, spellIDAsCost = { [99] = { one } } }
costWork.Settings = { GetTooltipSetting = function() return false end }
costWork._SettingsRefresh = true
costWork.GetFieldContainer = function(field) return costFields[field] end
costWork.runner = {
  Reset = function() queued = {}; resets = resets + 1 end,
  OnEnd = function(callback) onEnd = callback end,
  Run = function(callback, id, refresh, includeUpdate, refs)
    queued[#queued + 1] = { callback = callback, id = id, refresh = refresh, includeUpdate = includeUpdate, refs = refs }
  end,
}
costWork.item, costWork.currency, costWork.spell = function() end, function() end, function() end
costWork.start, costWork.complete = function() end, function() end
costWork.filters = function() filters = filters + 1 end
costWork.GetItemCount = costs.GetItemCount
costWork.totals = { i = { [123] = 5 }, ip = {}, c = { [42] = 5 }, sp = { [99] = true } }
costWork.currencyAmounts = { [42] = 3 }
local assigned = {}
costWork.assign = function(groups, isCost, refresh, id, owned)
  assigned[#assigned + 1] = { groups = groups, isCost = isCost, refresh = refresh, id = id, owned = owned }
end
local costWorkCode = "local app = ...\n"
  .. SourceSpan("src/Modules/Costs.lua", "---@type ATTProfiler", "-- Concepts:")
  .. [[
local GetItemCount = app.GetItemCount
local CostTotals, CurrencyAmounts, SetCostTotals = app.totals, app.currencyAmounts, app.assign
local UpdateRunner = app.runner
local UpdateCostsByItemID, UpdateCostsByCurrencyID, UpdateCostsBySpellID = app.item, app.currency, app.spell
local CostCalcStart, CostCalcComplete, CacheFilters = app.start, app.complete, app.filters
local function PlayerIsMissingProviderSpell() return true end
]]
  .. SourceSpan("src/Modules/Costs.lua", "local OriginalGetItemCount = GetItemCount;", "-- Module locals")
  .. SourceSpan("src/Modules/Costs.lua", "local function FinishCostAssignmentsForItem", "local UpdateCostGroup")
  .. SourceSpan("src/Modules/Costs.lua", "local function UpdateCosts()", "local UpdateCostTypeFunc")
  .. "return UpdateCosts, FinishCostAssignmentsForItem, FinishCostAssignmentsForCurr, FinishCostAssignmentsForSpell\n"
local queueCosts, assignItem, assignCurrency, assignSpell = assert(Compile(costWorkCode, "@src/Modules/Costs.lua queue and assignments"))(costWork)
before = clockReads
queueCosts()
assert(clockReads == before and #queued == 5 and queued[1].callback == costWork.start and onEnd == costWork.complete)
local originalCostOrder = {}
for index, job in ipairs(queued) do originalCostOrder[index] = job.callback; originalCostOrder[-index] = job.id end
assert(costWork.Profiler.Start(30, 3))
queueCosts()
assert(resets == 2 and filters == 2 and #queued == 5)
for index, job in ipairs(queued) do assert(job.callback == originalCostOrder[index] and job.id == originalCostOrder[-index]) end
local found = {}
for index = 2, #queued do
  local job = queued[index]
  assert(job.refresh == true and job.includeUpdate == false)
  if job.id == 123 or job.id == 124 then
    assert(job.callback == costWork.item and job.refs == costFields.itemIDAsCost[job.id])
  elseif job.id == 42 then
    assert(job.callback == costWork.currency and job.refs == costFields.currencyIDAsCost[job.id])
  elseif job.id == 99 then
    assert(job.callback == costWork.spell and job.refs == costFields.spellIDAsCost[job.id])
  else error("unexpected cost job") end
  found[job.id] = true
end
assert(found[123] and found[124] and found[42] and found[99])
assert(assignItem(123, { one, two }, true) == nil)
assert(assignCurrency(42, { two }, true) == nil)
assert(assignSpell(99, { one }, true) == nil)
assert(#assigned == 3 and assigned[1].id == 123 and assigned[1].isCost == true and assigned[1].owned == true)
assert(assigned[2].id == 42 and assigned[2].isCost == true and assigned[2].owned == nil)
assert(assigned[3].id == 99 and assigned[3].isCost == true and assigned[3].owned == nil)
for _, result in ipairs(assigned) do assert(result.refresh == true) end
report = costWork.Profiler.Report()
Contains(report, "costs.queue\t1")
Contains(report, "costs.queue.jobs\t4")
Contains(report, "costs.assign.item\t1")
Contains(report, "costs.assign.currency\t1")
Contains(report, "costs.assign.spell\t1")
Contains(report, "costs.groups\t4")
Absent(report, "costs.api.itemcount\t")
assert(costWork.Profiler.Stop())
local costWorkReport = costWork.Profiler.Report()
before = clockReads
queueCosts()
assert(clockReads == before and #queued == 5 and onEnd == costWork.complete)
for index, job in ipairs(queued) do assert(job.callback == originalCostOrder[index] and job.id == originalCostOrder[-index]) end
assert(costWork.Profiler.Report() == costWorkReport)
assert(costWork.Profiler.Start(30, 6, { include = "search" }))
queueCosts()
for index, job in ipairs(queued) do assert(job.callback == originalCostOrder[index] and job.id == originalCostOrder[-index]) end
report = costWork.Profiler.Report()
Contains(report, "costs.queue\t1")
Absent(report, "costs.queue.jobs\t")
assert(costWork.Profiler.Start(30, 3))
queueCosts()
Contains(costWork.Profiler.Report(), "costs.queue.jobs\t4")

-- Actual search builder orchestration retains route selection, results, and post-filtering.
local search = NewApp()
local mainRoot = { g = { one, two } }
local recursiveCalls, cachedCalls = 0, 0
search.GetDatabaseRoot = function() return mainRoot end
search.GetRawFieldContainer = function() return { [42] = { one, two } } end
search.PrintDebug = function() end
search.ReturnTrue = function() return true end
search.recursive = function() recursiveCalls = recursiveCalls + 1 end
search.cached = function() cachedCalls = cachedCalls + 1 end
local searchCode = "local app = ...\n"
  .. SourceSpan("src/Modules/Search.lua", "---@type ATTProfiler", "-- Concepts:")
  .. [[
local MainRoot, ClonedHierarchyGroups
local ClonedHierarachyMapping, SearchGroups, DropFields = {}, {}, {}
local api = { SearchNil = {} }
local function SetRescursiveFilters() end
local function ResetCriterias() end
local Eval_RecursiveFilterCriteria = app.ReturnTrue
local function BuildClonedHierarchy(groups)
  for _, group in ipairs(groups) do ClonedHierarchyGroups[#ClonedHierarchyGroups + 1] = group end
end
local function BuildSearchResponseViaCacheContainer(container, value)
  app.cached()
  BuildClonedHierarchy(container[value])
end
local function AddSearchGroupsByFieldValue(groups)
  app.recursive()
  for _, group in ipairs(groups) do SearchGroups[#SearchGroups + 1] = group end
end
local AddSearchGroupsByField = AddSearchGroupsByFieldValue
local function RunRecursiveFilterCriteria(groups) table.remove(groups) end
]]
  .. SourceSpan("src/Modules/Search.lua", "function app:BuildTargettedSearchResponse", "-- Performs the internal logic of searching ATT")
assert(Compile(searchCode, "@src/Modules/Search.lua search orchestration"))(search)
assert(search.Profiler.Start(30, 3))
results = search:BuildTargettedSearchResponse(mainRoot, "itemID", 42)
assert(#results == 2 and results[1] == one and results[2] == two and cachedCalls == 1 and recursiveCalls == 0)
results = search:BuildTargettedSearchResponse({ one }, "itemID", 42)
assert(#results == 1 and results[1] == one and recursiveCalls == 1)
assert(search:BuildTargettedSearchResponse(nil, "itemID", 42) == nil)
report = search.Profiler.Report()
Contains(report, "search.build\t2")
Contains(report, "search.candidates\t2")
Contains(report, "search.route.cache\t1")
Contains(report, "search.route.recursive\t1")
Contains(report, "search.results\t3")

-- Actual tooltip attachment retains pcall handling and caches generated tooltip data.
local tooltipApp = NewApp()
local rendered, skipChanges, generated = 0, {}, 0
local tooltipGroup = { text = "ATT group" }
tooltipApp.GetCachedSearchResults = function() return tooltipGroup, false end
tooltipApp.SetSkipLevel = function(level) skipChanges[#skipChanges + 1] = level end
tooltipApp.PrintDebug = function() end
tooltipApp.testCache = setmetatable({}, { __index = function(cache, group)
  generated = generated + 1
  local info = { text = group.text }
  cache[group] = info
  return info
end })
tooltipApp.AttachInfo = function(_, info) assert(info.text == tooltipGroup.text); rendered = rendered + 1 end
local tooltipCode = "local app = ...\n"
  .. SourceSpan("src/Modules/Tooltip.lua", "---@type ATTProfiler", "-- WoW API Cache")
  .. "local TooltipInfoCache, AttachTooltipInformation = app.testCache, app.AttachInfo\n"
  .. SourceSpan("src/Modules/Tooltip.lua", "local function AttachTooltipSearchResults", "local AttachTypicalSearchResults")
  .. "return AttachTooltipSearchResults\n"
local attach = assert(Compile(tooltipCode, "@src/Modules/Tooltip.lua search attachment"))(tooltipApp)
local tooltip = { NumLines = function() return 0 end, AddDoubleLine = function(_, text) assert(text == tooltipGroup.text) end }
assert(tooltipApp.Profiler.Start(30, 3))
attach(tooltip, function() end, "itemID", 42)
attach(tooltip, function() end, "itemID", 42)
assert(rendered == 2 and generated == 1 and tooltip.ATT_AttachComplete)
assert(#skipChanges == 4 and skipChanges[1] == 1 and skipChanges[2] == 0)
report = tooltipApp.Profiler.Report()
Contains(report, "tooltip.attach\t2")
Contains(report, "tooltip.search\t2")
Contains(report, "tooltip.info\t2")
Contains(report, "tooltip.cache.hits\t1")
Contains(report, "tooltip.cache.misses\t1")
tooltipApp.GetCachedSearchResults = function() error("original search failure") end
assert(pcall(attach, tooltip, function() end, "itemID", 42))
assert(skipChanges[#skipChanges] == 0)

-- Actual window update/redraw bodies retain early exits and their original return values.
local windows = NewApp()
local groupUpdates, rowRenders = 0, 0
windows.TopLevelUpdateGroup = function() groupUpdates = groupUpdates + 1 end
windows.HandleEvent = function(event) assert(event == "OnWindowUpdated") end
windows.PrintDebug = function() end
windows.wipearray = wipe
local windowCode = "local app = ...\nlocal L = {}\n"
  .. SourceSpan("src/UI/Window Definitions.lua", "---@type ATTProfiler", "-- Global locals")
  .. [[
local wipearray = app.wipearray
local function ExpandGroupsRecursively() end
local function ProcessGroup(rows, data) rows[#rows + 1] = data; rows[#rows + 1] = data.g[1] end
local function SetRowData(_, row, data) row.data = data; app.render() end
local fields = {
]]
  .. SourceSpan("src/UI/Window Definitions.lua", "\tDefaultUpdate = function(self, force)", "\tDefaultRefresh = function(self)")
  .. SourceSpan("src/UI/Window Definitions.lua", "\tDefaultRedraw = function(self)", "\tOnInactiveAlphaChanged = function(self, value)")
  .. "}\nreturn fields.DefaultUpdate, fields.DefaultRedraw\n"
windows.render = function() rowRenders = rowRenders + 1 end
local update, redraw = assert(Compile(windowCode, "@src/UI/Window Definitions.lua update/redraw"))(windows)
local window = { data = { total = 2, progress = 0, g = { one } }, rowData = {}, Container = { rows = { {}, {} } },
  ScrollBar = { CurrentIndex = 1 }, rowCount = 2, IsShown = function(self) return self.shown end,
  ToggleExtraFilters = function() end }
before = clockReads
assert(update(window) == nil and redraw(window) == nil and clockReads == before)
assert(windows.Profiler.Start(30, 3))
window.shown = true
assert(update(window, true) == true and #window.rowData == 2 and groupUpdates == 1)
assert(redraw(window) == nil and rowRenders == 2 and window.Container.rows[2].data == one)
report = windows.Profiler.Report()
Contains(report, "window.update\t1")
Contains(report, "window.update.groups\t1")
Contains(report, "window.redraw\t1")
Contains(report, "window.rows\t2")

print("PASS: actual ATT module boundaries, batch counters, filtered diagnostics, API arguments, return values, and disabled clock gates")
