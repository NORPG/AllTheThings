---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(ISLE_OF_DORN, {
		n(TREASURES, {
			-- Repeatable
			o(444065, {	-- Elemental Geode
				["coords"] = {
					{ 45.6, 60.2, ISLE_OF_DORN },
					{ 60.2, 62.6, ISLE_OF_DORN },
					{ 77.1, 35.7, ISLE_OF_DORN },
					{ 70.0, 53.8, ISLE_OF_DORN },
				},
			}),
			o(444066, {	-- Keeper's Stash
				["coords"] = {
					{ 20.2, 58.4, ISLE_OF_DORN },
					{ 38.5, 82.8, ISLE_OF_DORN },
					{ 38.8, 25.0, ISLE_OF_DORN },
					{ 42.1, 56.5, ISLE_OF_DORN },
					{ 44.3, 55.0, ISLE_OF_DORN },
					{ 44.8, 31.9, ISLE_OF_DORN },
					{ 53.6, 19.2, ISLE_OF_DORN },
					{ 62.4, 38.4, ISLE_OF_DORN },
					{ 63.4, 73.2, ISLE_OF_DORN },
					{ 64.6, 42.0, ISLE_OF_DORN },
					{ 74.4, 58.2, ISLE_OF_DORN },
					{ 77.9, 45.4, ISLE_OF_DORN },
				},
			}),
			--
			o(442814, {	-- Boskroot Cap
				["coords"] = {
					{ 52.4, 67.3, ISLE_OF_DORN },
					{ 52.3, 66.4, ISLE_OF_DORN },
					{ 52.2, 66.5, ISLE_OF_DORN },
					{ 52.3, 66.5, ISLE_OF_DORN },
					{ 52.9, 66.0, ISLE_OF_DORN },
					{ 52.5, 65.7, ISLE_OF_DORN },
					{ 52.8, 65.4, ISLE_OF_DORN },
					{ 53.7, 66.9, ISLE_OF_DORN },
					{ 52.6, 67.1, ISLE_OF_DORN },
				},
				["groups"] = { i(221550) },	-- Boskroot Cap
			}),
			n(212928, {	-- Dalaran Sewer Turtle
				["description"] = createLocalizationString({
					readable = "5 min wait after turnin of the Dornish Pike until the Goldengill Trout is available. You will be able to loot the battle pet in Dornogal.",
					constant = "5_MIN_WAIT_AFTER_TURNIN_OF_THE_DORNISH_PIKE",
					export = true,
					text = {
						en = "5 min wait after turnin of the Dornish Pike until the Goldengill Trout is available. You will be able to loot the battle pet in Dornogal.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "交付多恩狗鱼后需等待 5 分钟，金鳃鳟鱼才会出现。你可以在多恩诺嘉尔拾取这只战斗宠物。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 40.9, 73.8, ISLE_OF_DORN },
				["questID"] = 79586,
				["cost"] = {
					{ "i", 220143, 5 },	-- 5x Dornish Pike
					{ "i", 222533, 1 },	-- 1x Goldengill Trout
				},
			}),
			o(443754, {	-- Earthen Coffer
				["coord"] = { 59.2, 27.5, ISLE_OF_DORN },
			}),
			o(443756, {	-- Ladened Earthen Coffer
				["coord"] = { 54.4, 64.9, ISLE_OF_DORN },
			}),
			o(442718, {	-- Elemental Pearl
				["coord"] = { 53.0, 18.5, ISLE_OF_DORN },
				["groups"] = {
					i(221504),	-- Elemental Pearl
				},
			}),
			n(222940, {	-- Freysworn Letitia
				["description"] = createLocalizationString({
					readable = "Find 6 Pearlescent Shellcrab around Isle of Dorn.",
					constant = "FIND_6_PEARLESCENT_SHELLCRAB_AROUND_ISLE_OF",
					export = true,
					text = {
						en = "Find 6 Pearlescent Shellcrab around Isle of Dorn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在多恩岛周围找到 6 只珠光贝壳蟹。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 48.6, 30.0, ISLE_OF_DORN },
				["groups"] = {
					i(224185),	-- Crab-Guiding Branch
					hqt(82751, {	-- First Crab
						["name"] = "First Crab",
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 50.7, 70.6, ISLE_OF_DORN },
					}),
					hqt(82752, {	-- Second Crab
						["name"] = "Second Crab",
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 74.9, 49.4, ISLE_OF_DORN },
					}),
					hqt(82753, {	-- Third Crab
						["name"] = "Third Crab",
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 70.8, 20.0, ISLE_OF_DORN },
					}),
					hqt(82754, {	-- Fourth Crab
						["name"] = "Fourth Crab",
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 41.9, 27.0, ISLE_OF_DORN },
					}),
					hqt(82755, {	-- Fifth Crab
						["name"] = "Fifth Crab",
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 19.7, 58.4, ISLE_OF_DORN },
					}),
					hqt(82756, {	-- Sixth Crab
						["name"] = "Sixth Crab",
						["description"] = createLocalizationString({
							readable = "On tree branch.",
							constant = "ON_TREE_BRANCH",
							export = true,
							text = {
								en = "On tree branch.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在树枝上。",
								-- TODO: tw = "",
							},
						}),
						["providers"] = {
							{ "n", 224548 },	-- Pearlescent Shellcrab
							{ "i", 224185 },	-- Crab-Guiding Branch
						},
						["coord"] = { 38.3, 42.0, ISLE_OF_DORN },
					}),
					o(443318, {	-- Tree's Treasure
						["sourceQuests"] = { 82751, 82752, 82753, 82754, 82755, 82756 },
						["questID"] = 83242,
						["groups"] = { i(224585) },	-- Hanna's Locket (TOY!)
					}),
				},
			}),
			o(441183, {	-- Galan's Edict
				["coord"] = { 37.3, 52.5, ISLE_OF_DORN },
				["questID"] = 82038,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(446473, {	-- Infused Fire-Honey Milk
				["coord"] = { 56.2, 60.9, ISLE_OF_DORN },
				["questID"] = 82714,
				["groups"] = {
					i(224263),	-- Infused Fire-Honey Milk
				},
			}),
			o(444773, {	-- Jade Pearl
				["coord"] = { 77.2, 24.5, ISLE_OF_DORN },
				["questID"] = 82287,
				["groups"] = {
					i(223280),	-- Jade Pearl
				},
			}),
			o(444899, {	-- Kobold Pickaxe
				["coord"] = { 62.6, 43.3, ISLE_OF_DORN },
				["questID"] = 82325,
				["groups"] = {
					i(223484),	-- Kobold Mastermind's "Pivel"
				},
			}),
			n(223104, {	-- Lionel
				["description"] = createLocalizationString({
					readable = "After you kick Lionel back into water, find 5 |cff888888Plump Snapcrabs|r on the shore and feed him.",
					constant = "AFTER_YOU_KICK_LIONEL_BACK_INTO_WATER_FIND_5",
					export = true,
					text = {
						en = "After you kick Lionel back into water, find 5 |cff888888Plump Snapcrabs|r on the shore and feed him.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "把莱昂内尔踢回水里后，在岸边找到 5 只 |cff888888肥硕的响壳蟹|r 喂给他。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 223159 },	-- Plump Snapcrab
				["coord"] = { 40.6, 59.9, ISLE_OF_DORN },
				["questID"] = 82212,	-- Weak Lionfish
				["cost"] = { { "i", 222906, 5 } },	-- 5x Plump Snapcrab
				["groups"] = {
					o(444022, {	-- Magical Treasure Chest
						["coord"] = { 40.7, 59.7, ISLE_OF_DORN },
						["questID"] = 83243,
						["groups"] = {
							i(224579),	-- Sapphire Crab (PET!)
						},
					}),
				},
			}),
			header(HEADERS.Object, 443638, {	-- Mosswool Flower
				["description"] = createLocalizationString({
					readable = "Interact with Lost Mosswool 3 times to spawn this treasure.",
					constant = "INTERACT_WITH_LOST_MOSSWOOL_3_TIMES_TO_SPAWN",
					export = true,
					text = {
						en = "Interact with Lost Mosswool 3 times to spawn this treasure.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与失落的苔茸互动 3 次以刷新这个宝藏。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					hqt(82145, {	-- Lost Mosswool
						["description"] = createLocalizationString({
							readable = "Hidden tracking quest which is active while finding the 3 sheep. They will show as Vignettes on the minimap.\n\nCheck Debug Mode to see the 3 sheep coordinates since they are unable to be 'tracked' by ATT.",
							constant = "HIDDEN_TRACKING_QUEST_WHICH_IS_ACTIVE_WHILE",
							export = true,
							text = {
								en = "Hidden tracking quest which is active while finding the 3 sheep. They will show as Vignettes on the minimap.\n\nCheck Debug Mode to see the 3 sheep coordinates since they are unable to be 'tracked' by ATT.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "隐藏的追踪任务，在寻找 3 只绵羊时激活。它们会在小地图上显示为小标记。\n\n由于 ATT 无法“追踪”这 3 只绵羊，请查看调试模式以获取它们的坐标。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 59.6, 24.6, ISLE_OF_DORN },
						["groups"] = {
							n(222956, {	-- Lost Mosswool
								["description"] = createLocalizationString({
									readable = "1st Mosswool spot",
									constant = "1ST_MOSSWOOL_SPOT",
									export = true,
									text = {
										en = "1st Mosswool spot",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "第 1 个苔羊毛点",
										-- TODO: tw = "",
									},
								}),
								["coord"] = { 59.6, 24.6, ISLE_OF_DORN },
							}),
							n(222963, {	-- Lost Mosswool
								["description"] = createLocalizationString({
									readable = "2nd Mosswool spot",
									constant = "2ND_MOSSWOOL_SPOT",
									export = true,
									text = {
										en = "2nd Mosswool spot",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "第 2 个苔羊毛点",
										-- TODO: tw = "",
									},
								}),
								["coord"] = { 59.1, 27.1, ISLE_OF_DORN },
							}),
							n(222965, {	-- Lost Mosswool
								["description"] = createLocalizationString({
									readable = "3rd Mosswool spot",
									constant = "3RD_MOSSWOOL_SPOT",
									export = true,
									text = {
										en = "3rd Mosswool spot",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "第 3 个苔羊毛点",
										-- TODO: tw = "",
									},
								}),
								["coord"] = { 59.7, 28.7, ISLE_OF_DORN },
							}),
						},
					}),
					o(443638, {	-- Mosswool Flower
						["sourceQuest"] = 82145,	-- Lost Mosswool
						["questID"] = 83246,
						["coord"] = { 59.7, 28.7, ISLE_OF_DORN },
						["groups"] = {
							i(224450),	-- Lil' Moss Rosy (PET!)
						},
					}),
				},
			}),
			o(444894, {	-- Shimmering Opal Lily
				["description"] = createLocalizationString({
					readable = "At the bottom of the cave.\nDespawns after being looted by someone. You may need to wait for it to respawn.",
					constant = "AT_THE_BOTTOM_OF_THE_CAVE_DESPAWNS_AFTER_BEING",
					export = true,
					text = {
						en = "At the bottom of the cave.\nDespawns after being looted by someone. You may need to wait for it to respawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴底部。\n被他人拾取后会消失。你可能需要等它重新刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 48.9, 60.9, ISLE_OF_DORN },
				["questID"] = 82326,
			}),
			o(423854, {	-- Soulwell
				["description"] = createLocalizationString({
					readable = "Can be obtained only during the Introductory quest chain.",
					constant = "CAN_BE_OBTAINED_ONLY_DURING_THE_INTRODUCTORY",
					export = true,
					text = {
						en = "Can be obtained only during the Introductory quest chain.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "只能在初始任务链期间获得。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 31.5, 54.2, ISLE_OF_DORN },
				["questID"] = 84494,
				["groups"] = {
					i(228417),	-- Emergency Healthstone
				},
			}),
			o(441223, {	-- Stone of The Unbound
				["coord"] = { 44.1, 30.1, ISLE_OF_DORN },
				["questID"] = 82046,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			n(223227, {	-- One-Eyed Thak
				["crs"] = { 223247 },	-- One-Eyed Thak
				["coords"] = {
					{ 38.1, 43.5, ISLE_OF_DORN },
					{ 36.9, 42.3, ISLE_OF_DORN },
				},
				["questID"] = 82245,	-- Friendly Thak
				["groups"] = {
					o(444137, {	-- Thak's Treasure
						["coord"] = { 36.9, 42.2, ISLE_OF_DORN },
						["questID"] = 82246,
					}),
				},
			}),
			o(441231, {	-- Titan Console
				["coord"] = { 78.1, 27.9, ISLE_OF_DORN },
				["questID"] = 82045,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			n(222894, {	-- U'llort the Self-Exiled
				["description"] = createLocalizationString({
					readable = "Talk to U'llort then bring it |cff888888Boskroot Cap|r from the woods nearby.",
					constant = "TALK_TO_U_LLORT_THEN_BRING_IT_CFF888888BOSKROOT",
					export = true,
					text = {
						en = "Talk to U'llort then bring it |cff888888Boskroot Cap|r from the woods nearby.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与乌洛特交谈，然后从附近的树林里给它带来 |cff888888林根菌盖|r。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 55.0, 65.6, ISLE_OF_DORN },
				["questID"] = 82142,
				["cost"] = { { "i", 221550, 1 } },	-- 1x Boskroot Cap
				["groups"] = {
					o(444233, {	-- Mushroom Cap
						["questID"] = 83245,
					}),
				},
			}),
			o(441797, {	-- Void-Scarred Stormhammer
				["coord"] = { 29.0, 36.2, ISLE_OF_DORN },
				["groups"] = {
					i(220770),	-- Void-Scarred Stormhammer
				},
			}),
			o(441284, {	-- Watcher of the North
				["coord"] = { 57.2, 20.0, ISLE_OF_DORN },
				["questID"] = 82047,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441278, {	-- Watcher of the South
				["coord"] = { 42.1, 80.2, ISLE_OF_DORN },
				["questID"] = 82048,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			n(222847, {	-- Weary Water Elemental
				["coord"] = { 54.1, 19.0, ISLE_OF_DORN },
				["questID"] = 82134,
				["cost"] = { { "i", 221504, 1 } },	-- 1x Elemental Pearl
				["groups"] = {
					o(444215, {	-- Mysterious Orb
						["questID"] = 83244,
						["groups"] = {
							i(224373),	-- Waterlord's Iridescent Gem
						},
					}),
				},
			}),
			o(446476, {	-- Web-wrapped Axe
				["coord"] = { 59.1, 23.5, ISLE_OF_DORN },
				["questID"] = 82715,
				["groups"] = {
					i(224290),	-- Storm Defender's Axe
				},
			}),
		}),
	}),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.TWW, {
	m(KHAZ_ALGAR, {
		m(ISLE_OF_DORN, bubbleDownSelf({ ["timeline"] = { ADDED_11_0_2 } }, {
			n(TREASURES, {
				q(82227),	-- Extra HQT: Magical Treasure Chest
				q(82253),	-- Extra HQT: Mushroom Cap
				q(82251),	-- Extra HQT: Mosswool Flower
				q(82252),	-- Completed with Quest 83244 (Mysterious Orb)
				q(79585),	-- Dalaran Sewer Turtle: Needs more time
				q(82160),	-- Gathered all the Pearlescent Shellcrab.
			}),
		})),
	}),
}));
