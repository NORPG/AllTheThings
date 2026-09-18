---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildHiddenDataCache", function(categories)
local h,hqt,inst,m,prof,x=_.CreateCustomHeader,_.CreateHQT,_.CreateInstance,_.CreateMap,_.CreateProfession,_.CreateExpansion;
categories.HiddenQuestTriggers={
x(1,{awp=10100,g={
h(-61,{
hqt(78650)}),
inst(760,{isRaid=1,g={
hqt(76175)}}),
m(1414,{
m(1413,{
hqt(55296)})})}}),
prof(171)}
end)
