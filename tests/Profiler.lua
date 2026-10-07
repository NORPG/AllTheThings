-- Run from the repository root: lua tests/Profiler.lua
-- Standalone behavioral checks for ATT's opt-in profiler.
local now = 100
local timers = {}
local messages = {}
local metricCalls = {}
local metricValue = 2.5

GetTimePreciseSec = function() return now end
C_Timer = {
  After = function(seconds, callback)
    timers[#timers + 1] = { seconds = seconds, callback = callback }
  end,
}
Enum = { AddOnProfilerMetric = { RecentAverageTime = 7 } }
C_AddOnProfiler = {
  IsEnabled = function() return true end,
  GetAddOnMetric = function(name, metric)
    assert(name == "AllTheThings" and metric == 7)
    metricCalls[#metricCalls + 1] = { name, metric }
    return metricValue
  end,
}

local app = {
  print = function(...) messages[#messages + 1] = table.concat({...}, " ") end,
  PrintError = function(err) error(err) end,
}
assert(loadfile("lib/Profiler.lua"))("AllTheThings", app)
local p = app.Profiler
---Verifies that a report contains the expected text.
---@param s string Report under test.
---@param fragment string Expected literal text.
local function contains(s, fragment)
  assert(s:find(fragment, 1, true), "missing report text: " .. fragment .. "\n" .. s)
end
---Verifies that rejected or invalidated samples are absent from the report.
---@param s string Report under test.
---@param fragment string Literal text that must not appear.
local function absent(s, fragment)
  assert(not s:find(fragment, 1, true), "unexpected report text: " .. fragment .. "\n" .. s)
end

-- Disabled calls must not collect data or sample the Blizzard API.
p.Record("disabled.time", 1)
p.Count("disabled.count")
assert(#metricCalls == 0 and #timers == 0)
contains(p.Report(), "No capture yet")

local ok, duration = p.Start()
assert(ok and duration == 30 and p.Enabled and p.SessionID == 1)
assert(#timers == 1 and timers[1].seconds == 30 and #metricCalls == 1)
contains(p.Report(), "No measurements captured.")
p.Record("phase", 0.3, 2)
p.Record("phase", 1.2, 3)
p.Record("phase", 10, 4)
p.Count("jobs")
p.Count("jobs", 2)
p.Record("bad", -1)
p.Record("bad", 0 / 0)
p.Count("bad", -3)
local report = p.Report()
contains(report, "phase\t3\t11.500\t3.833\t10.000\t<=16.00\t9")
contains(report, "jobs\t3")
absent(report, "disabled.")
absent(report, "bad")
contains(report, "Recent average at start: 2.500 ms")
for _, value in ipairs({ 0, 301, "bad", math.huge, 0 / 0 }) do
  local valid = p.Start(value)
  assert(not valid and p.Enabled and p.SessionID == 1, "invalid duration altered current session")
end
now = 101
metricValue = 3.5
assert(p.Stop() and not p.Enabled and not p.Stop())
report = p.Report()
contains(report, "Elapsed: 1.00 s")
contains(report, "Recent average at stop: 3.500 ms")
assert(#metricCalls == 2)
timers[1].callback()
assert(#messages == 0, "manual stop should invalidate pending timeout")

-- Starting a new session invalidates old auto-stop callbacks and old samples.
ok, duration = p.Start("2")
assert(ok and duration == 2 and p.SessionID == 2 and #timers == 2)
timers[1].callback()
assert(p.Enabled)
absent(p.Report(), "phase\t3")
now = 103
timers[2].callback()
assert(not p.Enabled)
contains(p.Report(), "stopped: time limit")
assert(#messages == 1)

-- Reset invalidates current session and any outstanding callbacks.
local previousSession = p.SessionID
p.Reset()
assert(not p.Enabled and p.SessionID == previousSession + 1)
contains(p.Report(), "No capture yet")
timers[2].callback()
assert(#messages == 1)

-- Bound metric allocations and show dropped count.
p.Start(5)
for i = 1, 65 do p.Count("count." .. i) end
contains(p.Report(), "Dropped samples after 64 distinct metric IDs: 1")
p.Stop()

-- Every histogram boundary stays inclusive; values just above it enter the next bucket.
p.Start(5)
local bounds = { .25, .5, 1, 2, 4, 8, 16, 33, 66, 100, 250, 500, 1000 }
for i, bound in ipairs(bounds) do
  p.Record("bucket.exact." .. i, bound)
  p.Record("bucket.below." .. i, bound - .000001)
  p.Record("bucket.above." .. i, bound + .000001)
end
p.Record("bucket.zero", 0)
p.Record("bucket.overflow", 1001)
report = p.Report()
---Verify one timing row's aggregate values and expected percentile bucket.
---@param id string Stable ID of the single-sample metric.
---@param value number Submitted duration in milliseconds.
---@param bucket string Expected inclusive histogram bucket label.
local function checkBucket(id, value, bucket)
  contains(report, string.format("%s\t1\t%.3f\t%.3f\t%.3f\t%s\t-", id, value, value, value, bucket))
end
for i, bound in ipairs(bounds) do
  local bucket = string.format("<=%.2f", bound)
  checkBucket("bucket.exact." .. i, bound, bucket)
  checkBucket("bucket.below." .. i, bound - .000001, bucket)
  checkBucket("bucket.above." .. i, bound + .000001, bounds[i + 1] and string.format("<=%.2f", bounds[i + 1]) or ">1000")
end
checkBucket("bucket.zero", 0, "<=0.25")
checkBucket("bucket.overflow", 1001, ">1000")

-- Blizzard API is optional and must not break the capture.
C_AddOnProfiler = nil
p.Start(5)
p.Record("without.blizzard", 1)
p.Stop()
contains(p.Report(), "without.blizzard\t1")
absent(p.Report(), "Blizzard C_AddOnProfiler")

C_AddOnProfiler = {
  IsEnabled = function() error("unavailable") end,
  GetAddOnMetric = function() error("must not be called") end,
}
p.Start(5)
p.Stop()
absent(p.Report(), "Blizzard C_AddOnProfiler")
C_AddOnProfiler = {
  IsEnabled = function() return true end,
  GetAddOnMetric = function() error("unavailable") end,
}
p.Start(5)
p.Stop()
absent(p.Report(), "Blizzard C_AddOnProfiler")

-- Threshold deltas describe whole-addon spikes during the capture window.
Enum.AddOnProfilerMetric.CountTimeOver5Ms = 8
Enum.AddOnProfilerMetric.CountTimeOver10Ms = 9
local ticks5, ticks10 = 20, 4
C_AddOnProfiler = {
  IsEnabled = function() return true end,
  GetAddOnMetric = function(_, metric)
    if metric == 7 then return 1.5 end
    if metric == 8 then return ticks5 end
    if metric == 9 then return ticks10 end
  end,
}
p.Start(5)
ticks5, ticks10 = 23, 5
p.Stop()
report = p.Report()
contains(report, "Ticks over 5 ms during capture: 3")
contains(report, "Ticks over 10 ms during capture: 1")

-- Runner must attribute work only to the session active before its slice.
unpack = table.unpack or unpack
tremove = table.remove
assert(loadfile("lib/ProfilerJobs.lua"))("AllTheThings", app)
assert(loadfile("lib/Runner.lua"))("AllTheThings", app)
p.Start(30)
app.FunctionRunner.Run(function()
  now = now + 0.010
  p.Start(30)
end)
local callback
for i = #timers, 1, -1 do
  if timers[i].seconds == 0 then callback = timers[i].callback; break end
end
assert(callback, "runner stack callback missing")
callback()
report = p.Report()
assert(p.SessionID >= 6)
absent(report, "runner.default.slice\t1")

print("PASS: profiler disabled path, timing/counter aggregation, validation, stop/reset/timeout, bounded metrics, optional Blizzard API, Runner session attribution")
