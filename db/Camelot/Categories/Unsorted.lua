---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildHiddenDataCache", function(categories)
local h,q=_.CreateCustomHeader,_.CreateQuest;
categories.Unsorted={
h(-45,{
q(7633,{nextQuests={7636,7634,7635}})})}
end)
