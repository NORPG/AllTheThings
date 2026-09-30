---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildDataCache", function(categories)
local flt,h,i,p,s=_.CreateFilter,_.CreateCustomHeader,_.CreateItem,_.CreateSpecies,_.CreateItemSource;
categories.BlackMarket=
h(-554,{SortPriority=80,symselector=3,u=3,g={
h(-88,{
s(162989,16674,{b=1,f=6,loc=42,lvl=58}),
s(163001,16686,{b=1,f=4,loc=40,lvl=57}),
s(163003,16688,{b=1,f=4,loc=42,lvl=58}),
s(163024,16709,{b=1,f=5,loc=46,lvl=56}),
s(162985,16670,{b=1,f=6,loc=47,lvl=54}),
s(163048,16733,{b=1,f=7,loc=41,lvl=55}),
s(163016,16701,{b=1,f=4,loc=41,lvl=55})}),
flt(101,{
i(249897,{spellID=1250015}),
p(130,{itemID=23713,npcID=17255,spellID=30156}),
i(13342,{f=101,spellID=17468}),
p(87,{itemID=11474,npcID=9662,spellID=15067}),
i(249898,{spellID=1250016})}),
flt(9,{
s(165302,23705,{b=1,f=9})}),
flt(102,{
i(23716,{b=1,f=53,spellID=30167})})}})
end)
