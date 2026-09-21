---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildHiddenDataCache", function(categories)
local h,q=_.CreateCustomHeader,_.CreateQuest;
categories.Unsorted={
h(-45,{
q(11141,{nextQuests={11142}}),
q(11222,{nextQuests={11223}})})}
end)
