---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(BROKEN_ISLES, {
	m(AZSUNA, {
		petbattles({
			q(40310, {	-- Shipwrecked Captive
				["description"] = createLocalizationString({
					readable = "Weekly Account-Wide Pet Battle Quest. You need the toy Sternfathom's Pet Journal to summon this npc.",
					constant = "WEEKLY_ACCOUNT_WIDE_PET_BATTLE_QUEST_YOU_NEED",
					export = true,
					text = {
						en = "Weekly Account-Wide Pet Battle Quest. You need the toy Sternfathom's Pet Journal to summon this npc.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "每周账号通用的宠物对战任务。你需要玩具斯特恩法瑟的宠物手册才能召唤此 NPC。",
						-- TODO: tw = "",
					},
				}),
				["providers"] = {
					{ "i", 122681 },	-- Sternfathom's Pet Journal
					{ "n",  98489 },	-- Shipwrecked Captive
				},
				["coord"] = { 49.3, 45.4, AZSUNA },
				["timeline"] = { ADDED_7_0_3_LAUNCH },
				["isWeekly"] = true,
				["_drop"] = { "g" },	-- Drop Shiny Pet Charm
			}),
		}),
	}),
}));
