-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.BFA, {
	n(REWARDS, {
		currency(1580, {	-- Seal of Wartorn Fate
			["description"] = createLocalizationString({
				readable = "Up to 2 per week obtained via quests offered in your faction's main city in Battle for Azeroth. Costs for the week increase each time you purchase a seal with the same currency.\n\n|cff3f48ccAlliance:|r Obtained from Tezran in Boralus |cffffffff(71.6, 13.6)|r.\n\n|cff880015Horde:|r Obtained from Zurvan in Dazar'alor |cffffffff(54.0, 88.4)|r.\n\nGold: 2,000 > 5,000\n\nMarks of Honor: 10 > 25\n\nWar Resources: 250 > 500\n",
				constant = "UP_TO_2_PER_WEEK_OBTAINED_VIA_QUESTS_OFFERED_IN",
				export = true,
				text = {
					en = "Up to 2 per week obtained via quests offered in your faction's main city in Battle for Azeroth. Costs for the week increase each time you purchase a seal with the same currency.\n\n|cff3f48ccAlliance:|r Obtained from Tezran in Boralus |cffffffff(71.6, 13.6)|r.\n\n|cff880015Horde:|r Obtained from Zurvan in Dazar'alor |cffffffff(54.0, 88.4)|r.\n\nGold: 2,000 > 5,000\n\nMarks of Honor: 10 > 25\n\nWar Resources: 250 > 500\n",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每周最多可通过在争霸艾泽拉斯中你阵营主城提供的任务获得 2 个。每周用同一种货币购买印记时，价格都会上涨。\n\n|cff3f48cc联盟：|r 由伯拉勒斯的泰兹兰提供 |cffffffff(71.6, 13.6)|r。\n\n|cff880015部落：|r 由达萨罗的祖尔万提供 |cffffffff(54.0, 88.4)|r。\n\n金币：2,000 > 5,000\n\n荣誉印记：10 > 25\n\n战争物资：250 > 500\n",
					-- TODO: tw = "",
				},
			}),
			["coords"] = {
				{ 71.6, 13.6, BORALUS },	-- Alliance
				{ 54.0, 88.4, DAZARALOR },	-- Horde
			},
		}),
	}),
}));
