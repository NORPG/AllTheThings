---@diagnostic disable: deprecated
local appName, _ = ...
_.AddEventHandler("OnBuildDataCache", function(categories)
local h,i,q=_.CreateCustomHeader,_.CreateItem,_.CreateQuest;
categories.ExpansionFeatures=
h(-735,{SortPriority=35,g={
h(-799,_.ResolveQuestData({aqd=
{coords={
[1453]={{37.8,80.2}}},qgs={211033}},awp=16001,hqd=
{coords={
[1458]={{73.6,33}}},qgs={211022}},g={
q(78145,{maps={1413},qss={209847}}),
q(79091,{maps={1455},qss={203754},r=2}),
q(79092,{maps={1429},qss={203755},r=2}),
q(79096,{maps={1421},qss={210177},r=1}),
q(79097,{maps={1413},qss={208800}}),
q(78142,{maps={1436},qss={209845}}),
q(78147,{maps={1431},qss={209849}}),
q(78150,{sourceQuests={78124,78127,78142,78143,78145,78146,78147,78148,78149,79091,79092,79093,79094,79095,79096,79097},sqreq=10,g={
i(277203,{b=1,f=51}),
i(277204,{b=1,f=51})}}),
q(78149,{maps={1442},qss={209851}}),
q(78146,{maps={1437},qss={209848}}),
q(79536,{sourceQuests={78124,78127,78142,78143,78145,78146,78147,78148,78149,79091,79092,79093,79094,79095,79096,79097},sqreq=20,g={
i(281634,{b=1,c={4},f=52}),
i(281635,{b=1,f=52})}}),
q(78124,{maps={1439},qss={209843}}),
q(79093,{maps={1432,1436},qss={208860},r=2}),
q(78148,{maps={1432},qss={209850}}),
q(78143,{maps={279},qss={209846}}),
q(79095,{maps={1420},qss={208185},r=1}),
q(78127,{maps={1421},qss={209844}}),
q(79094,{maps={1454},qss={207972},r=1})}}))}})
end)
