-- Run from the repository root with Lua 5.1: lua tests/ProfilerCommands.lua
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
local help = table.concat(app.ChatCommands.Help.profile, "\n")
assert(help:find("3 workload", 1, true) and help:find("Options: include, exclude, metrics.", 1, true))
assert(not help:find("4 jobs", 1, true) and not help:find("sample", 1, true))

assert(command({"start"}) and p.GetLevel() == 1 and p.Config.level == 1)
assert(timers[#timers][1] == 30)
assert(command({"start", "10", "workload", "include=costs", "exclude=tooltip", "metrics=16"}))
assert(p.GetLevel() == 3 and p.Config.metricBudget == 16)
assert(p.Config.include == "costs" and p.Config.exclude == "tooltip")
p.Record("existing", 1)
local report, session, timerCount = p.Report(), p.SessionID, #timers

-- Every rejection preserves the current session, recorded data, and pending request.
assert(command({"nextlogin", "60", "3", "include=costs,search"}))
local request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.seconds == 60 and request.level == 3 and request.options.include == "costs,search")
local invalid = {
  {"start", "10", "7"}, {"start", "10", "4", "include=all"},
  {"start", "10", "5", "include=all"}, {"start", "10", "6", "include=all"},
  {"start", "10", "jobs", "include=all"},
  {"start", "10", "timeline", "include=all"},
  {"start", "10", "diagnostics", "include=all"},
  {"start", "10", "3", "include=unknown-module"},
  {"start", "10", "3", "metrics=-1"},
  {"start", "10", "3", "metrics=1025"},
  {"start", "10", "3", "metrics=maybe"},
  {"start", "10", "3", "metrics=2", "metrics=3"},
  {"start", "10", "include=costs", "2"},
  {"start", "10", "2", "unknown=1"},
  {"start", "10", "2", "include="},
  {"nextlogin", "60", "4", "include=all"},
  {"nextlogin", "60", "5", "include=all"},
  {"nextlogin", "60", "6", "include=all"},
  {"nextlogin", "60", "jobs", "include=all"},
  {"nextlogin", "60", "timeline", "include=all"},
  {"nextlogin", "60", "diagnostics", "include=all"},
  {"nextlogin", "cancel", "extra"},
}
-- Removed deep-capture options are rejected even at an otherwise valid level.
for _, option in ipairs({"sample=2", "slow=10", "jobs=0", "records=2", "stacks=false", "stackbytes=0"}) do
  invalid[#invalid + 1] = {"start", "10", "3", option}
  invalid[#invalid + 1] = {"nextlogin", "60", "3", option}
end
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
assert(command({"nextlogin", "10", "WORKLOAD", "include=all", "exclude=tooltip", "metrics=0"}))
request = AllTheThingsSavedVariables.ProfilerNextLogin
assert(request.level == 3 and request.options.include == "all" and request.options.exclude == "tooltip")
assert(p.StartNextLogin() and p.GetLevel() == 3)
assert(p.Config.metricBudget == 0)
assert(AllTheThingsSavedVariables.ProfilerNextLogin == nil)

-- Every supported named level reaches the matching fixed capture policy.
for level, name in ipairs({"overview", "components", "workload"}) do
  assert(command({"start", "5", name}) and p.GetLevel() == level)
end

print("PASS: three-level commands, removed-option rejection, report snapshots, and login option persistence")
