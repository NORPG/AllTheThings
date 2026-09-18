---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildHiddenDataCache", function(categories)
local h,q=_.CreateCustomHeader,_.CreateQuest;
categories.Unsorted={
h(-45,{
q(10964,{nextQuests={10965}})})}
end)
