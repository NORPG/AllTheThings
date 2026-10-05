-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

	-- putting description + coords/cost on these because not all the information shows up in all places. you can't see the coords or cost from the currency window, just the description, but you can plot coords if you pop the currencies out.
-- i didn't put cost on the ones that have choices because i didn't want it to seem like you needed all the different currencies/items to purchase seals, and i didn't put cost on warforged seals because you exchange 50 for 3, which we can't communicate clearly in anything other than a description
root(ROOTS.Instances, expansion(EXPANSION.LEGION, {
	n(REWARDS, {
		currency(1273, {	-- Seal of Broken Fate
			["description"] = createLocalizationString({
				readable = "Up to 3 per week obtained via quests offered by Archmage Lan'dalock in Broken Isles Dalaran |cffffffff(57.2, 67.5)|r. Costs for the week increase each time you purchase a seal with the same currency.\n\nGold: 1,000 > 2,000 > 4,000\n\nMarks of Honor: 5 > 10 > 20\n\nOrder Resources: 1,000 > 2,000 > 4,000\n",
				constant = "UP_TO_3_PER_WEEK_OBTAINED_VIA_QUESTS_OFFERED_BY",
				export = true,
				text = {
					en = "Up to 3 per week obtained via quests offered by Archmage Lan'dalock in Broken Isles Dalaran |cffffffff(57.2, 67.5)|r. Costs for the week increase each time you purchase a seal with the same currency.\n\nGold: 1,000 > 2,000 > 4,000\n\nMarks of Honor: 5 > 10 > 20\n\nOrder Resources: 1,000 > 2,000 > 4,000\n",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每周最多可通过在破碎群岛达拉然 |cffffffff(57.2, 67.5)|r 处的大法师兰达洛克提供的任务获得 3 个。每周用同一种货币购买印记时，价格都会上涨。\n\n金币：1,000 > 2,000 > 4,000\n\n荣誉印记：5 > 10 > 20\n\n订单资源：1,000 > 2,000 > 4,000\n",
					-- TODO: tw = "",
				},
			}),
			["coord"] = { 57.2, 67.5, LEGION_DALARAN },	-- Archmage Lan'dalock
		}),
	}),
}));
