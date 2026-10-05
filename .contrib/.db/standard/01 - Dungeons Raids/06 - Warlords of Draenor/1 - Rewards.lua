-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.WOD, bubbleDown({ ["timeline"] = { ADDED_6_0_3_LAUNCH } }, {
	n(REWARDS, {
		currency(994, {		-- Seal of Tempered Fate
			["description"] = createLocalizationString({
				readable = "Purchased for 300g from an NPC at your Ashran hub in Draenor.\n\n|cff3f48ccAlliance:|r Purchased from Fate-Twister Seress in Stormshield |cffffffff(51.6,  61.8)|r.\n\n|cff880015Horde:|r Purchased from Fate-Twister Tiklal in Warspear |cffffffff(64.6, 62.0)|r.\n",
				constant = "PURCHASED_FOR_300G_FROM_AN_NPC_AT_YOUR_ASHRAN",
				export = true,
				text = {
					en = "Purchased for 300g from an NPC at your Ashran hub in Draenor.\n\n|cff3f48ccAlliance:|r Purchased from Fate-Twister Seress in Stormshield |cffffffff(51.6,  61.8)|r.\n\n|cff880015Horde:|r Purchased from Fate-Twister Tiklal in Warspear |cffffffff(64.6, 62.0)|r.\n",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在德拉诺的阿什兰枢纽以 300 金币从一名 NPC 处购买。\n\n|cff3f48cc联盟：|r 在暴风之盾从命运扭曲者塞雷斯处购买|cffffffff(51.6,  61.8)|r。\n\n|cff880015部落：|r 在战争之矛从命运扭曲者提克拉尔处购买|cffffffff(64.6, 62.0)|r。\n",
					-- TODO: tw = "",
				},
			}),
			["coords"] = {
				{ 51.6, 61.8, STORMSHIELD },	-- Alliance
				{ 64.6, 62.0, 624 },	-- Horde, Warspear
			},
			["cost"] = { { "g", 3000000 } },	-- 300g
		}),
		currency(1129, {	-- Seal of Inevitable Fate
			["description"] = createLocalizationString({
				readable = "Up to 3 per week obtained via quests in your faction's Ashran hub. Costs for the week increase each time you purchase a seal with the same currency.\n\n|cff3f48ccAlliance:|r Obtained from Fate-Twister Seress in Stormshield |cffffffff(51.6, 61.8)|r.\n\n|cff880015Horde:|r Obtained from Fate-Twister Tiklal in Warspear|cffffffff(64.6, 62.0)|r.\n\nApexis Crystals: 500 > 1,000 > 2,000\n\nGarrison Resources: 1,000 > 2,000 > 4,000\n\nGold: 500 > 1,000 > 2,000\n",
				constant = "UP_TO_3_PER_WEEK_OBTAINED_VIA_QUESTS_IN_YOUR",
				export = true,
				text = {
					en = "Up to 3 per week obtained via quests in your faction's Ashran hub. Costs for the week increase each time you purchase a seal with the same currency.\n\n|cff3f48ccAlliance:|r Obtained from Fate-Twister Seress in Stormshield |cffffffff(51.6, 61.8)|r.\n\n|cff880015Horde:|r Obtained from Fate-Twister Tiklal in Warspear|cffffffff(64.6, 62.0)|r.\n\nApexis Crystals: 500 > 1,000 > 2,000\n\nGarrison Resources: 1,000 > 2,000 > 4,000\n\nGold: 500 > 1,000 > 2,000\n",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每周最多可通过你阵营在阿什兰据点的任务获得 3 个。每周用同一种货币购买印记时，价格都会上涨。\n\n|cff3f48cc联盟：|r 由暴风之盾的命运扭曲者塞瑞斯提供 |cffffffff(51.6, 61.8)|r。\n\n|cff880015部落：|r 由战争之矛的命运扭曲者提克拉尔提供|cffffffff(64.6, 62.0)|r。\n\n埃匹希斯水晶：500 > 1,000 > 2,000\n\n要塞物资：1,000 > 2,000 > 4,000\n\n金币：500 > 1,000 > 2,000\n",
					-- TODO: tw = "",
				},
			}),
			["coords"] = {
				{ 51.6, 61.8, STORMSHIELD },	-- Alliance
				{ 64.6, 62.0, 624 },	-- Horde, Warspear
			},
		}),
		i(122618, {	-- Misprinted Draenic Coin
			["description"] = createLocalizationString({
				readable = "From the first Heroic Dungeon completed per day while on certain quests",
				constant = "FROM_THE_FIRST_HEROIC_DUNGEON_COMPLETED_PER_DAY",
				export = true,
				text = {
					en = "From the first Heroic Dungeon completed per day while on certain quests",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在特定任务期间，每天首次完成英雄难度地下城时获得",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_6_1_0, REMOVED_9_0_1 },
		}),
	}),
})));
