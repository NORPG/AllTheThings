---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(INVASION_NAGA, {
			["description"] = createLocalizationString({
				readable = "Every week a faction invades the island.\n\nThe rotation is Vrykul>Naga>Pirates repeat.\n\nZone Drops listed here are only available when the invasion is active.",
				constant = "EVERY_WEEK_A_FACTION_INVADES_THE_ISLAND_THE",
				export = true,
				text = {
					en = "Every week a faction invades the island.\n\nThe rotation is Vrykul>Naga>Pirates repeat.\n\nZone Drops listed here are only available when the invasion is active.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每周都会有一个势力入侵该岛屿。\n\n轮换顺序为维库人>纳迦>海盗，如此重复。\n\n此处列出的区域掉落仅在入侵激活期间可用。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				petbattle(filter(BATTLE_PETS, {
					pet(4711, {	-- Snapdragon Pup
						["description"] = createLocalizationString({
							readable = "Only spawns during Naga invasion week.",
							constant = "ONLY_SPAWNS_DURING_NAGA_INVASION_WEEK",
							export = true,
							text = {
								en = "Only spawns during Naga invasion week.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "仅在纳迦入侵周刷新。",
								-- TODO: tw = "",
							},
						}),
					}),
				})),
				n(QUESTS, {
					q(85051, {	-- Beach Comber
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 231783 },	-- Machinist Kromleg
						["coord"] = { 41.9, 68.0, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o_repeated({
								i(229967),	-- Salvageable Scrap (QI!)
								o(473943),	-- Salvageable Scrap
								o(474030),	-- Salvageable Scrap
								o(474033),	-- Salvageable Scrap
								o(474084),	-- Salvageable Scrap
								o(474086),	-- Salvageable Scrap
							}),
						},
					}),
					q(84430, {	-- Crystal Crusade
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 227796 },	-- Sky-Captain Elaena Lancekat
						["coord"] = { 69.4, 42.8, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o(465208, {	-- Crystal Chunk
								i(228780),	-- Crystal Chunk (QI!)
							}),
							i(228787),	-- Crystal Fragment (QI!)
						},
					}),
					q(85589, {	-- Ruffled Pages
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 229716 },	-- Stellin Verasa
						["coord"] = { 71.0, 39.6, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o(487825, {	-- Ruffled Pages
								i(232361),	-- Ruffled Pages (QI!)
							}),
						},
					}),
					q(84627, {	-- Three Heads of the Deep
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 227796 },	-- Sky-Captain Elaena Lancekat
						["coord"] = { 69.4, 42.8, SIREN_ISLE },
						["isWeekly"] = true,
					}),
				}),
				n(RARES, sharedData({
					["isDaily"] = true,
				},{
					n(229852, {	-- Coralweaver Calliso
						-- naga
						["coord"] = { 61.5, 89.4, SIREN_ISLE },
						["questID"] = 84802,
						["groups"] = {
							i(234973),	-- Pearlshell Scroll Case [book]
						},
					}),
					n(229853, {	-- Siris the Sea Scorpion
						-- naga
						["coord"] = { 56.0, 83.6, SIREN_ISLE },
						["questID"] = 84803,
						["groups"] = {
							i(234973),	-- Pearlshell Scroll Case [book]
						},
					}),
				})),
				n(TREASURES, {
					o(463539, {	-- Pilfered Earthen Chest
						["coord"] = { 68.4, 94.4, SIREN_ISLE },
						["questID"] = 84527,
						["isWeekly"] = true,
						["groups"] = { i(229181) },	-- Ordained Forge Maul
					}),
				}),
				n(WORLD_QUESTS, {
					["sourceQuests"] = {
						TWW_ACCOUNT_CAMPAIGN_QUEST,
						84725,	-- The Circlet Calls
					},
					["groups"] = bubbleDownFiltered({ ["isWorldQuest"] = true, },FILTERFUNC_questID,{
						q(84850, {	-- Serpent's Wrath
							["groups"] = {
								i(228647, {	-- Seabed Leviathan's Citrine
									["description"] = createLocalizationString({
										readable = "Only counts for the achievement when looted from the respective World Quest.",
										constant = "ONLY_COUNTS_FOR_THE_ACHIEVEMENT_WHEN_LOOTED",
										export = true,
										text = {
											en = "Only counts for the achievement when looted from the respective World Quest.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "只有从对应的世界任务中拾取时才计入成就。",
											-- TODO: tw = "",
										},
									}),
								}),
							},
						}),
					}),
				}),
				n(ZONE_DROPS, {
					i(233499, {	-- Royal Snapdragon Treat (CI!)
						["description"] = createLocalizationString({
							readable = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Naga.",
							constant = "YOU_MUST_HAVE_THE_PRISMATIC_SNAPDRAGON_MOUNT",
							export = true,
							text = {
								en = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Naga.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你必须先拥有棱彩龙蜥坐骑，此物品才会掉落。\n\n可以从娜迦身上拾取。",
								-- TODO: tw = "",
							},
						}),
						-- n: 229851 (debugger)
					}),
				}),
			},
		}),
	}),
}));
