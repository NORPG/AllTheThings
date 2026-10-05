---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

-- #if AFTER 7.3.5
root(ROOTS.Zones, {
	header(HEADERS.Object, 206109, sharedDataSelf({	-- Warchief's Command Board
		["races"] = HORDE_ONLY,
		["providers"] = {
			{ "o", 206109 },	-- [Org]
			{ "o", 206116 },	-- [Org]
			{ "o", 207323 },	-- [TB]
			{ "o", 207324 },	-- [UC]
		},
		["timeline"] = { ADDED_4_0_1 },
	},{
		["description"] = createLocalizationString({
			readable = "These quests can be obtained from any city or town to lead the Character to a specific Zone.",
			constant = "THESE_QUESTS_CAN_BE_OBTAINED_FROM_ANY_CITY_OR",
			export = true,
			text = {
				en = "These quests can be obtained from any city or town to lead the Character to a specific Zone.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "这些任务可以在任何城市或城镇接取，用来引导角色前往特定区域。",
				-- TODO: tw = "",
			},
		}),
		["groups"] = {
			q(49851, {	-- Cataclysm First Responder (Horde)
				["sourceQuests"] = { 49846 },	-- War on Two Fronts (Cataclysm)
				["timeline"] = { ADDED_7_3_5 },
				["races"] = HORDE_ONLY,
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
			}),
			warchiefscommand(q(49817, {	-- To Northrend! (Horde)
				["timeline"] = { ADDED_7_3_5 },
				["races"] = HORDE_ONLY,
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
				["lvl"] = 60,
			})),
			warchiefscommand(q(49852, {	-- To Pandaria! (Horde)
				["sourceQuests"] = { 49864 },	-- Wars on Two Fronts (Pandaria)
				["timeline"] = { ADDED_7_3_5 },
				["races"] = HORDE_ONLY,
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
			})),
		},
	})),
	header(HEADERS.Object, 206111, sharedDataSelf({	-- Hero's Call Board
		["races"] = ALLIANCE_ONLY,
		["providers"] = {
			{ "o", 206111 },	-- [SW]
			{ "o", 207321 },	-- [DA]
			{ "o", 207320 },	-- [IF]
		},
		["timeline"] = { ADDED_4_0_1 },
	},{
		["description"] = "~L.THESE_QUESTS_CAN_BE_OBTAINED_FROM_ANY_CITY_OR",
		["groups"] = {
			q(49865, {	-- Cataclysm First Responder (Alliance)
				["sourceQuest"] = 49846,	-- War on Two Fronts (Cataclysm)
				["timeline"] = { ADDED_7_3_5 },
				["races"] = ALLIANCE_ONLY,
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(49863, {	-- To Northrend! (Alliance)
				["timeline"] = { ADDED_7_3_5 },
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
				["lvl"] = 60,
			}),
			q(49866, {	-- To Pandaria! (Alliance)
				["sourceQuests"] = { 49864 },	-- Wars on Two Fronts (Cataclysm or Pandaria)
				["timeline"] = { ADDED_7_3_5 },
				["races"] = ALLIANCE_ONLY,
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
			}),
			q(49846, {	-- Wars on Two Fronts [Cataclysm]
				["description"] = createLocalizationString({
					readable = "The Special Duty Assignments will automatically pop up when you reach level 80. You can use them to progress either to Cataclysm or Pandaria.",
					constant = "THE_SPECIAL_DUTY_ASSIGNMENTS_WILL_AUTOMATICALLY",
					export = true,
					text = {
						en = "The Special Duty Assignments will automatically pop up when you reach level 80. You can use them to progress either to Cataclysm or Pandaria.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "达到 80 级时，特殊任务指派会自动弹出。你可以用它们来选择前往大地的裂变或潘达利亚。",
						-- TODO: tw = "",
					},
				}),
				["providers"] = {
					{ "o", 206111 },	-- [SW]
					{ "o", 207321 },	-- [DA]
					{ "o", 207320 },	-- [IF]
					{ "i", 156477 },	-- Special Duty Assignments
				},
				["timeline"] = { ADDED_7_3_5 },
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
				-- The same item is used to start Cataclysm or Pandaria content (your choice).
				-- Received 49846 on Alliance Warlock when I hit 80, so it isn't the Horde version item as a previous comment speculated. - slumber
			}),
			q(49864, {	-- Wars on Two Fronts (Cataclysm or Pandaria)
				["description"] = "~L.THE_SPECIAL_DUTY_ASSIGNMENTS_WILL_AUTOMATICALLY",
				["providers"] = {
					{ "o", 206111 },	-- [SW]
					{ "o", 207321 },	-- [DA]
					{ "o", 207320 },	-- [IF]
					{ "i", 156477 },	-- Special Duty Assignments
				},
				["timeline"] = { ADDED_7_3_5 },
				["isBreadcrumb"] = true,
				["u"] = REMOVED_FROM_GAME,
				["lvl"] = 80,
			}),
		},
	})),
	n(DUNGEON_JOURNAL, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
		q(72743, {	-- A Piece of Copper
			["description"] = createLocalizationString({
				readable = "If you are lucky. You will get this quest from your adventure guide.",
				constant = "IF_YOU_ARE_LUCKY_YOU_WILL_GET_THIS_QUEST_FROM",
				export = true,
				text = {
					en = "If you are lucky. You will get this quest from your adventure guide.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "如果你运气好，你会从冒险指南中获得这个任务。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				ach(16789),	-- Lucky Penny
			},
		}),
		q(72746, {	-- A Piece of Silver
			["description"] = createLocalizationString({
				readable = "Available on the next reset after \"A Piece of Copper\", from the adventure guide.",
				constant = "AVAILABLE_ON_THE_NEXT_RESET_AFTER_A_PIECE_OF",
				export = true,
				text = {
					en = "Available on the next reset after \"A Piece of Copper\", from the adventure guide.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在冒险指南中的“一块铜币”之后的下一重置周期可用。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 72743 },	-- A Piece of Copper
		}),
		q(72747, {	-- A Piece of Gold
			["description"] = createLocalizationString({
				readable = "Available on the next reset after \"A Piece of Silver\", from the adventure guide.",
				constant = "AVAILABLE_ON_THE_NEXT_RESET_AFTER_A_PIECE_OF_2",
				export = true,
				text = {
					en = "Available on the next reset after \"A Piece of Silver\", from the adventure guide.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在冒险指南中的“一块银币”之后的下一重置周期可用。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 72746 },	-- A Piece of Silver
		}),
		q(72748, {	-- A Bag of Gold
			["description"] = createLocalizationString({
				readable = "Available on the next reset after \"A Piece of Gold\", from the adventure guide.",
				constant = "AVAILABLE_ON_THE_NEXT_RESET_AFTER_A_PIECE_OF_3",
				export = true,
				text = {
					en = "Available on the next reset after \"A Piece of Gold\", from the adventure guide.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在冒险指南中的“一块金币”之后的下一重置周期可用。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 72747 },	-- A Piece of Gold
		}),
		q(72749, {	-- A Curious Coin
			["description"] = createLocalizationString({
				readable = "Available on the next reset after \"A Bag of Gold\", from the adventure guide.",
				constant = "AVAILABLE_ON_THE_NEXT_RESET_AFTER_A_BAG_OF_GOLD",
				export = true,
				text = {
					en = "Available on the next reset after \"A Bag of Gold\", from the adventure guide.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在冒险指南中的“一袋金币”之后的下一重置周期可用。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 72748 },	-- A Bag of Gold
			["groups"] = {
				ach(16790),	-- Curious Coin
			},
		}),
	})),
});

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.DF, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	n(DUNGEON_JOURNAL, {
		q(72751),	-- Triggers whenever you collect one of the Coin quests from your Adventurer's Journal.
	}),
})));
-- #endif
