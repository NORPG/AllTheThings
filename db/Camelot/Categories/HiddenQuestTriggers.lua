---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildHiddenDataCache", function(categories)
local h,hqt,inst,m,x=_.CreateCustomHeader,_.CreateHQT,_.CreateInstance,_.CreateMap,_.CreateExpansion;
categories.HiddenQuestTriggers={
h(-61,{
hqt(78650)}),
x(1,{awp=10100,g={
m(1415,{
m(1434,{
hqt(7908,{awp=11201}),
hqt(618),
hqt(614),
hqt(615,{awp=11201}),
hqt(620,{awp=11201})})}),
inst(760,{isRaid=1,g={
hqt(76175)}})}})}
end)
