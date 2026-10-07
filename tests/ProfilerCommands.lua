-- Run from the repository root: lua tests/ProfilerCommands.lua
-- Exercise the real slash handler against the capture service and saved requests.
local now, clocks = 100, 0
local messages, timers = {}, {}
GetTimePreciseSec = function() clocks = clocks + 1; return now end
C_Timer = { After = function(seconds, callback) timers[#timers + 1] = {seconds, callback} end }
C_AddOnProfiler = nil
Enum = nil
hooksecurefunc = function() end
CreateAtlasMarkup = function() return "" end
SlashCmdList = {}
AllTheThingsSavedVariables = { Keep = 123 }
local app = {
  print = function(...) messages[#messages + 1] = table.concat({...}, " ") end,
  AddEventHandler = function() end,
  ShowPopupDialogWithMultiLineEditBox = function(self, text) self.CopiedReport = text end,
}
assert(loadfile("lib/Profiler.lua"))("AllTheThings", app)
assert(loadfile("src/Commands.lua"))("AllTheThings", app)
local p, command = app.Profiler, app.ChatCommands.profile

assert(command({"start"}) and p.GetLevel() == 1 and p.Config.level == 1)
assert(timers[#timers][1] == 30)
assert(command({"start", "10", "diagnostics", "include=costs", "sample=2", "jobs=0", "records=2", "stacks=false"}))
assert(p.GetLevel() == 6 and p.Config.sampleEvery == 2 and p.Config.jobBudget == 0 and p.Config.timelineBudget == 2)
assert(p.Config.stacks == false and p.Config.include == "costs")
p.Record("existing", 1)
local report, session, timerCount = p.Report(), p.SessionID, #timers

-- Every rejection preserves the current session, recorded data, and pending request.
assert(command({"nextlogin", "60", "3", "include=costs,search"}))
local request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.seconds == 60 and request.level == 3 and request.options.include == "costs,search")
local invalid = {
  {"start", "10", "7"}, {"start", "10", "4"},
  {"start", "10", "6", "include=unknown-module"},
  {"start", "10", "6", "include=costs", "sample=0"},
  {"start", "10", "6", "include=costs", "jobs=-1"},
  {"start", "10", "6", "include=costs", "stacks=maybe"},
  {"start", "10", "6", "include=costs", "sample=2", "sample=3"},
  {"start", "10", "include=costs", "2"},
  {"start", "10", "2", "unknown=1"},
  {"start", "10", "2", "include="},
  {"nextlogin", "60", "timeline"},
  {"nextlogin", "60", "6", "include=costs", "records=5000"},
  {"nextlogin", "cancel", "extra"},
}
for _, args in ipairs(invalid) do
  assert(command(args))
  assert(p.Enabled and p.SessionID == session and #timers == timerCount)
  assert(p.Report() == report and AllTheThingsSavedVariables.ProfilerNextLogin == request)
end

-- Report snapshots preserve recording; manual stop/reset leave the schedule intact.
assert(command({"report"}) and app.CopiedReport == p.Report() and p.Enabled)
assert(command({"stop"}) and not p.Enabled and AllTheThingsSavedVariables.ProfilerNextLogin == request)
assert(command({"reset"}) and AllTheThingsSavedVariables.ProfilerNextLogin == request)
assert(command({"nextlogin", "cancel"}) and AllTheThingsSavedVariables.ProfilerNextLogin == nil)
assert(AllTheThingsSavedVariables.Keep == 123)

-- Named levels, options without an explicit level, and include=all are accepted.
assert(command({"start", "5", "include=costs"}) and p.GetLevel() == 1)
assert(command({"nextlogin", "10", "JOBS", "include=all", "exclude=tooltip", "slow=20", "metrics=0", "jobs=4", "records=0"}))
request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.level == 4 and request.options.include == "all" and request.options.exclude == "tooltip")
assert(p.StartNextLogin() and p.GetLevel() == 4)
assert(p.Config.jobBudget == 4 and p.Config.metricBudget == 0 and p.Config.slowThresholdMs == 20)
assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil)

print("PASS: profile level commands, named options, atomic rejection, report snapshots, and login option persistence")
