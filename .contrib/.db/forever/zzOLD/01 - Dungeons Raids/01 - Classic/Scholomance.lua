-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

local SCHOLOMANCE_GROUPS = {};
local KORMOK_LEGACY_DESCRIPTION = "This boss can be summoned in Ras Frostwhisper's room using the Brazier of Beckoning or the Brazier of Invocation, which can summon any of the spirits.\nSummon Location: Ras Frostwhisper's room.";
local ignoreTimeline = function(item)	-- Items applied with this were never actually removed.
	item.timeline = IGNORED_VALUE;
	return item;
end

local SCHOLOMANCE_LEGACY_DATA = bubbleDownSelf({ ["timeline"] = { ADDED_1_3_0, REMOVED_5_0_4, ADDED_10_1_5 } }, {
	n(ACHIEVEMENTS, bubbleDownSelf({ ["timeline"] = { ADDED_3_0_2, REMOVED_5_0_4, ADDED_10_1_5 } }, {
		ach(18368, {	-- Memory of Scholomance
			["sourceQuest"] = 76249,	-- Memory of Scholomance
			["maps"] = { MAP.EASTERN_PLAGUELANDS, MAP.STRATHOLME, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { ADDED_10_1_5 },
		}),
		ach(18558, bubbleDownSelf({ ["timeline"] = { ADDED_10_1_5 } }, {	-- Leaders of Scholomance
			crit(549, {	-- Darkmaster Gandling
				["_npcs"] = { 1853 },
			}),
			crit(60409, {	-- Kirtonos the Herald
				["_npcs"] = { 10506 },
			}),
		})),
		-- #if BEFORE 5.0.4
		ach(645),	-- Scholomance (automated)
		-- #endif
		ach(5054, {	-- Scholomance Guild Run
			["timeline"] = { ADDED_4_0_3 },
		}),
	})),
	n(QUESTS, {
		-- #if BEFORE 5.0.4
		q(28756, {	-- Aberrations of Bone
			["sourceQuest"] = 27464,	-- Argent Call: The Trial of the Crypt
			["qg"] = 49856,	-- Lord Raymond George
			["coord"] = { 76.2, 50.9, MAP.EASTERN_PLAGUELANDS },
			["maxReputation"] = { FACTION_ARGENT_DAWN, EXALTED },	-- Argent Dawn, Exalted.
			["timeline"] = { ADDED_4_0_3 },
			["repeatable"] = true,
			["lvl"] = lvlsquish(40, 40, 15),
			["groups"] = {
				objective(1, {	-- 0/1 Rattlegore slain
					["provider"] = { "n", 11622 },	-- Rattlegore
				}),
			},
		}),
		-- #endif
		applyclassicphase(PHASE_FOUR, q(8259, {	-- A More Fitting Reward (Post 1.7, Phase 4)
			["sourceQuest"] = 7668,	-- The Darkreaver Menace (Original: 1.4 till 1.7 only)
			["altQuests"] = { 8258 },	-- The Darkreaver Menace (New)
			["qg"] = 13417,	-- Sagorne Creststrider <Shaman Trainer>
			["coord"] = { 38.7, 35.9, MAP.ORGRIMMAR },
			["timeline"] = { ADDED_1_7_0, REMOVED_4_0_3 },
			["classes"] = { SHAMAN },
			["races"] = HORDE_ONLY,
			["lvl"] = 55,
			["groups"] = {
				i(20134, {	-- Skyfury Helm
					["timeline"] = { ADDED_1_7_0, REMOVED_4_0_3 },
				}),
			},
		})),
		q(7666,	-- Again Into the Great Ossuary [A]
		bubbleDownSelf({["timeline"] = { REMOVED_4_0_3 }}, {
			["qg"] = 928,	-- Lord Grayson Shadowbreaker <Paladin Trainer>
			["sourceQuest"] = 7647,	-- Judgment and Redemption
			["coord"] = { 48.6, 50.0, MAP.STORMWIND_CITY },
			["classes"] = { PALADIN },
			["races"] = ALLIANCE_ONLY,
			["repeatable"] = true,
			["lvl"] = 60,
			["groups"] = {
				i(18746),	-- Divination Scryer
			},
		})),
		q(7669,	-- Again Into the Great Ossuary [H]
		bubbleDownSelf({["timeline"] = { REMOVED_4_0_3 }}, {
			["qg"] = 13417,	-- Sagorne Creststrider <Shaman Trainer>
			["sourceQuest"] = 8258,	-- The Darkreaver Menace
			["coord"] = { 38.7, 35.9, MAP.ORGRIMMAR },
			["classes"] = { SHAMAN },
			["races"] = HORDE_ONLY,
			["repeatable"] = true,
			["lvl"] = 60,
			["groups"] = {
				i(18746),	-- Divination Scryer
			},
		})),
		q(27140, {	-- Alexi's Gambit
			["qg"] = 45110,	-- Alexi Barov <House of Barov>
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Vectus slain
					["provider"] = { "n", 10432 },	-- Vectus
				}),
				objective(2, {	-- 0/1 Marduk Blackpool slain
					["provider"] = { "n", 10433 },	-- Marduk Blackpool
				}),
			},
		}),
		{	-- Araj's Scarab
			["allianceQuestData"] = q(5803, {	-- Araj's Scarab [A]
				["sourceQuest"] = 5801,	-- Fire Plume Forged [Alliance]
				["qg"] = 11056,	-- Alchemist Arbington
				["coord"] = { 42.7, 83.8, MAP.WESTERN_PLAGUELANDS },
			}),
			["hordeQuestData"] = q(5804, {	-- Araj's Scarab [H]
				["sourceQuest"] = 5802,	-- Fire Plume Forged [Horde]
				["qg"] = 11057,	-- Apothecary Dithers
				["coord"] = { 83.3, 69.2, MAP.TIRISFAL_GLADES },
				["maps"] = { MAP.WESTERN_PLAGUELANDS },
			}),
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Araj's Scarab
					["providers"] = {
						{ "i",  14610 },	-- Araj's Scarab
						{ "o", 177241 },	-- Araj's Phylactery
					},
					["coord"] = { 45.6, 69.2, MAP.WESTERN_PLAGUELANDS },
					["cr"] = 1852,	-- Araj the Summoner
				}),
			},
		},
		{	-- Barov Family Fortune
			["allianceQuestData"] = q(5343, {	-- Barov Family Fortune [A]
				["qg"] = 11023,	-- Weldon Barov <House of Barov>
				["coord"] = { 43.5, 83.7, MAP.WESTERN_PLAGUELANDS },
			}),
			["hordeQuestData"] = q(5341, {	-- Barov Family Fortune [H]
				["qg"] = 11022,	-- Alexi Barov <House of Barov>
				["coord"] = { 83.06, 71.6, MAP.TIRISFAL_GLADES },
				["maps"] = { MAP.WESTERN_PLAGUELANDS },
			}),
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 52,
			["groups"] = {
				objective(1, {	-- 0/1 The Deed to Brill
					["providers"] = {
						{ "i",  13471 },	-- The Deed to Brill
						{ "o", 176484 },	-- The Deed to Brill
					},
					["description"] = createLocalizationString({
						readable = "Can be found along the wall in Ras Frostwhisper's room.",
						constant = "CAN_BE_FOUND_ALONG_THE_WALL_IN_RAS_FROSTWHISPER",
						export = true,
						text = {
							en = "Can be found along the wall in Ras Frostwhisper's room.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可在拉丝·霜语的房间中沿墙找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				objective(2, {	-- 0/1 The Deed to Caer Darrow
					["providers"] = {
						{ "i",  13448 },	-- The Deed to Caer Darrow
						{ "o", 176485 },	-- The Deed to Caer Darrow
					},
					["description"] = createLocalizationString({
						readable = "Can be found right next to Alexi Barov.",
						constant = "CAN_BE_FOUND_RIGHT_NEXT_TO_ALEXI_BAROV",
						export = true,
						text = {
							en = "Can be found right next to Alexi Barov.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可在阿莱克斯·巴罗夫旁边找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				objective(3, {	-- 0/1 The Deed to Southshore
					["providers"] = {
						{ "i",  13450 },	-- The Deed to Southshore
						{ "o", 176486 },	-- The Deed to Southshore
					},
					["description"] = createLocalizationString({
						readable = "Can be found in the very back of the first room hidden behind some bookshelves.",
						constant = "CAN_BE_FOUND_IN_THE_VERY_BACK_OF_THE_FIRST_ROOM",
						export = true,
						text = {
							en = "Can be found in the very back of the first room hidden behind some bookshelves.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可在第一个房间最深处、书架后面找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				objective(4, {	-- 0/1 The Deed to Tarren Mill
					["providers"] = {
						{ "i",  13451 },	-- The Deed to Tarren Mill
						{ "o", 176487 },	-- The Deed to Tarren Mill
					},
					["description"] = createLocalizationString({
						readable = "Can be found on the table in the back corner just before you enter the dragon whelpling room or travel downstairs to fight Jandice Barov.",
						constant = "CAN_BE_FOUND_ON_THE_TABLE_IN_THE_BACK_CORNER",
						export = true,
						text = {
							en = "Can be found on the table in the back corner just before you enter the dragon whelpling room or travel downstairs to fight Jandice Barov.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可在后方角落的桌子上找到，就在你进入幼龙房间或下楼与詹迪斯·巴罗夫战斗之前。",
							-- TODO: tw = "",
						},
					}),
				}),
			},
		},
		q(27143, {	-- Barov Family Fortune [CATA]
			["qg"] = 45109,	-- Weldon Barov <House of Barov>
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 The Deed to Brill
					["providers"] = {
						{ "i",  13471 },	-- The Deed to Brill
						{ "o", 176484 },	-- The Deed to Brill
					},
					["description"] = "~L.CAN_BE_FOUND_ALONG_THE_WALL_IN_RAS_FROSTWHISPER",
				}),
				objective(2, {	-- 0/1 The Deed to Caer Darrow
					["providers"] = {
						{ "i",  13448 },	-- The Deed to Caer Darrow
						{ "o", 176485 },	-- The Deed to Caer Darrow
					},
					["description"] = "~L.CAN_BE_FOUND_RIGHT_NEXT_TO_ALEXI_BAROV",
				}),
				objective(3, {	-- 0/1 The Deed to Southshore
					["providers"] = {
						{ "i",  13450 },	-- The Deed to Southshore
						{ "o", 176486 },	-- The Deed to Southshore
					},
					["description"] = "~L.CAN_BE_FOUND_IN_THE_VERY_BACK_OF_THE_FIRST_ROOM",
				}),
				objective(4, {	-- 0/1 The Deed to Tarren Mill
					["providers"] = {
						{ "i",  13451 },	-- The Deed to Tarren Mill
						{ "o", 176487 },	-- The Deed to Tarren Mill
					},
					["description"] = "~L.CAN_BE_FOUND_ON_THE_TABLE_IN_THE_BACK_CORNER",
				}),
				i(65923, {	-- Barov Servant Caller
					["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
				}),
			},
		}),
		q(5531, {	-- Betina Bigglezink
			["sourceQuest"] = 5522,	-- Leonid Barthalomew
			["qg"] = 11036,	-- Leonid Barthalomew the Revered <The Argent Dawn>
			["coord"] = { 81.73, 57.83, MAP.EASTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
			["qi"] = 13761,	-- Frozen Eggs (QI!)
		}),
		q(76257, {	-- Darkmaster's Scourgestone
			["qs"] = 206373,	-- Darkmaster's Scourgestone (QS!)
			["timeline"] = { ADDED_10_1_5 },
			["groups"] = { i(12844) },	-- Argent Dawn Valor Token
		}),
		q(4771, {	-- Dawn's Gambit
			-- #if BEFORE 4.0.3
			["description"] = createLocalizationString({
				readable = "After completing this quest, you can return to Betina to have her give you another Gambit.",
				constant = "AFTER_COMPLETING_THIS_QUEST_YOU_CAN_RETURN_TO",
				export = true,
				text = {
					en = "After completing this quest, you can return to Betina to have her give you another Gambit.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "完成此任务后，你可以回到贝蒂娜处，让她再给你一个计策。",
					-- TODO: tw = "",
				},
			}),
			-- #endif
			["sourceQuest"] = 5531,	-- Betina Bigglezink
			["qg"] = 11035,	-- Betina Bigglezink <The Argent Dawn>
			["coord"] = { 81.5, 59.7, MAP.EASTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
			["groups"] = {
				objective(1, {	-- 0/1 Vectus slain
					["provider"] = { "n", 10432 },	-- Vectus
				}),
				objective(2, {	-- 0/1 Place Dawn's Gambit
					["provider"] = { "i", 12368 },	-- Dawn's Gambit
					["description"] = createLocalizationString({
						readable = "This will significantly reduce all of the nearby student's health and damage. As soon as the component opens, you should have your tank or plate/rogue dps aggro the room other than the 2 bosses and get ready to AOE.",
						constant = "THIS_WILL_SIGNIFICANTLY_REDUCE_ALL_OF_THE",
						export = true,
						text = {
							en = "This will significantly reduce all of the nearby student's health and damage. As soon as the component opens, you should have your tank or plate/rogue dps aggro the room other than the 2 bosses and get ready to AOE.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这会大幅降低附近所有学员的生命值和伤害。一旦组件打开，你应该让坦克或板甲/潜行者输出去拉住房间里除两个首领之外的所有怪，并准备进行范围攻击。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(15854, {	-- Dancing Sliver
					["timeline"] = { REMOVED_4_0_3 },
				}),
				i(15853, {	-- Windreaper
					["timeline"] = { REMOVED_4_0_3 },
				}),
			},
		}),
		q(5382, {	-- Doctor Theolen Krastinov, the Butcher
			["description"] = createLocalizationString({
				readable = "Talk to Eva until she offers the quest.",
				constant = "TALK_TO_EVA_UNTIL_SHE_OFFERS_THE_QUEST",
				export = true,
				text = {
					en = "Talk to Eva until she offers the quest.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "与伊娃交谈，直到她提供该任务。",
					-- TODO: tw = "",
				},
			}),
			["qg"] = 11216,	-- Eva Sarkhoff
			["coord"] = { 70.2, 73.7, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Doctor Theolen Krastinov slain
					["provider"] = { "n", 11261 },	-- Doctor Theolen Krastinov <The Butcher>
				}),
				objective(2, {	-- 0/1 Remains of Eva Sarkhoff Burned
					["provider"] = { "o", 176544 },	-- Remains of Eva Sarkhoff
				}),
				objective(3, {	-- 0/1 Remains of Lucien Sarkhoff Burned
					["provider"] = { "o", 176545 },	-- Remains of Lucien Sarkhoff
				}),
			},
		}),
		q(27146, {	-- Doctor Theolen Krastinov, the Butcher [CATA]
			["qg"] = 45107,	-- Eva Sarkhoff
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Doctor Theolen Krastinov slain
					["provider"] = { "n", 11261 },	-- Doctor Theolen Krastinov <The Butcher>
				}),
				objective(2, {	-- 0/1 Remains of Eva Sarkhoff Burned
					["provider"] = { "o", 176544 },	-- Remains of Eva Sarkhoff
				}),
				objective(3, {	-- 0/1 Remains of Lucien Sarkhoff Burned
					["provider"] = { "o", 176545 },	-- Remains of Lucien Sarkhoff
				}),
			},
		}),
		{	-- Fire Plume Forged
			["allianceQuestData"] = q(5801, {	-- Fire Plume Forged [A]
				["sourceQuest"] = 5538,	-- Mold Rhymes With... [Alliance]
			}),
			["hordeQuestData"] = q(5802, {	-- Fire Plume Forged [H]
				["sourceQuest"] = 5514,	-- Mold Rhymes With... [Horde]
			}),
			["qg"] = 5411,	-- Krinkle Goodsteel <Blacksmithing Supplies>
			["coord"] = { 51.5, 28.8, MAP.TANARIS },
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.UNGORO_CRATER },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Unfinished Skeleton Key
					["provider"] = { "i", 14645 },	-- Unfinished Skeleton Key
					["coord"] = { 49.6, 47.6, MAP.UNGORO_CRATER },
					["cost"] = {
						{ "i", 14644, 1 },	-- Skeleton Key Mold
						{ "i", 12359, 2 },	-- Thorium Bar
					},
				}),
			},
		},
		q(5582, {	-- Healthy Dragon Scale
			["sourceQuest"] = 5529,	-- Plagued Hatchlings
			["provider"] = { "i", 13920 },	-- Healthy Dragon Scale
			["maxReputation"] = { FACTION_ARGENT_DAWN, EXALTED },	-- Argent Dawn, Exalted.
			["timeline"] = { REMOVED_4_0_3 },
			["repeatable"] = true,
			["lvl"] = 55,
		}),
		q(5384,	-- Kirtonos the Herald
		bubbleDownSelf({["timeline"] = { REMOVED_4_0_3 }},{
			["qg"] = 11216,	-- Eva Sarkhoff
			["sourceQuest"] = 5515,	-- Krastinov's Bag of Horrors
			["coord"] = { 70.2, 73.7, MAP.WESTERN_PLAGUELANDS },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Kirtonos the Herald slain
					["provider"] = { "n", 10506 },	-- Kirtonos the Herald
				}),
				i(15806),	-- Mirah's Song
				i(15805),	-- Penelope's Rose
				ig(13544),	-- Spectral Essence
			},
		})),
		q(27147, {	-- Kirtonos the Herald [CATA]
			["qg"] = 45107,	-- Eva Sarkhoff
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Kirtonos the Herald slain
					["provider"] = { "n", 10506 },	-- Kirtonos the Herald
				}),
			},
		}),
		q(5515, {	-- Krastinov's Bag of Horrors
			["sourceQuest"] = 5382,	-- Doctor Theolen Krastinov, the Butcher
			["qg"] = 11216,	-- Eva Sarkhoff
			["coord"] = { 70.2, 73.7, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Krastinov's Bag of Horrors
					["provider"] = { "i", 13725 },	-- Krastinov's Bag of Horrors
				}),
			},
		}),
		q(7647,	-- Judgment and Redemption
		bubbleDownSelf({["timeline"] = { REMOVED_4_0_3 }}, {
			["providers"] = {
				{ "n", 928 },	-- Lord Grayson Shadowbreaker <Paladin Trainer>
				{ "i", 18804 },	-- Lord Grayson's Satchel
			},
			["sourceQuest"] = 7646,	-- The Divination Scryer
			["coord"] = { 48.6, 50.0, MAP.STORMWIND_CITY },
			["classes"] = { PALADIN },
			["races"] = ALLIANCE_ONLY,
			["lvl"] = 60,
			["groups"] = {
				objective(1, {	-- 0/1 Charger's Redeemed Soul
					["provider"] = { "i", 18799 },	-- Charger's Redeemed Soul
					["cost"] = { { "i", 18749, 1 } },	-- Charger's Lost Soul
					["crs"] = {
						14516,	-- Death Knight Darkreaver
						14568,	-- Darkreaver's Fallen Charger
					},
				}),
				objective(2, {	-- 0/1 Blessed Arcanite Barding
					["provider"] = { "i", 18792 },	-- Blessed Arcanite Barding
				}),
				mount(23214, {	-- Charger (MOUNT!)
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
			},
		})),
		q(5522, {	-- Leonid Barthalomew
			["sourceQuest"] = 4735,	-- Egg Collection
			["providers"] = {
				{ "n", 10267 },	-- Tinkee Steamboil
				{ "i", 13761 },	-- Frozen Eggs
			},
			["coord"] = { 65.2, 23.8, MAP.BURNING_STEPPES },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
		}),
		q(7667, {	-- Material Assistance
			["qg"] = 13417,	-- Sagorne Creststrider
			["coord"] = { 39.2, 48.4, MAP.ORGRIMMAR },
			["timeline"] = { ADDED_1_4_0, REMOVED_4_0_3 },
			["cost"] = {
				{ "i", 12800, 1 },	-- Azerothian Diamond
				{ "i", 18335, 1 },	-- Pristine Black Diamond
			},
			["classes"] = { SHAMAN },
			["races"] = HORDE_ONLY,
			["lvl"] = 58,
		}),
		q(76249, name(HEADERS.Achievement, 18368, {	-- Memory of Scholomance
			["description"] = createLocalizationString({
				readable = "It's recommended to activate the Debug Mode to properly see every step and description.\n\nTo start unlocking old Scholomance, you must first do a clear of Heroic Scholomance. Once done, go to the room that used to be Doctor Theolen Krastinov's room in the original Scholomance (top center room). At the top left portion of the room, use the Krastinov's Bag of Horrors toy. When you do, the ghost of Eva Sarkhoff will spawn, afraid of you (as the toy transforms you into the Butcher himself). Removing the toy's buff will make Eva realize you're not her murderer, and she will talk to you, giving you the old Spectral Essence trinket and allowing you to loot Eva's Femur on the ground. This allows you to see ghosts in Caer Darrow.\n\nOnce you do, you can talk to Eva at her old spot outside Scholomance, where she will request you to look for her journal, as well as five candles, to perform a horrible ritual. The candles are traded from citizens in Caer Darrow, and require items they treasured when alive. Below, we have the locations for all items:",
				constant = "IT_S_RECOMMENDED_TO_ACTIVATE_THE_DEBUG_MODE_TO",
				export = true,
				text = {
					en = "It's recommended to activate the Debug Mode to properly see every step and description.\n\nTo start unlocking old Scholomance, you must first do a clear of Heroic Scholomance. Once done, go to the room that used to be Doctor Theolen Krastinov's room in the original Scholomance (top center room). At the top left portion of the room, use the Krastinov's Bag of Horrors toy. When you do, the ghost of Eva Sarkhoff will spawn, afraid of you (as the toy transforms you into the Butcher himself). Removing the toy's buff will make Eva realize you're not her murderer, and she will talk to you, giving you the old Spectral Essence trinket and allowing you to loot Eva's Femur on the ground. This allows you to see ghosts in Caer Darrow.\n\nOnce you do, you can talk to Eva at her old spot outside Scholomance, where she will request you to look for her journal, as well as five candles, to perform a horrible ritual. The candles are traded from citizens in Caer Darrow, and require items they treasured when alive. Below, we have the locations for all items:",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "建议开启调试模式，以便正确查看每个步骤和说明。\n\n要开始解锁旧通灵学院，你必须先通关一次英雄难度通灵学院。完成之后，前往原通灵学院中曾是瑟尔林·克拉斯托诺夫医生房间的那个房间（顶部中央的房间）。在房间左上方，使用玩具克拉斯托诺夫的恐怖之袋。使用后，伊娃·萨克霍夫的幽灵会出现，并且害怕你（因为该玩具会把你变成屠夫本人）。移除玩具的增益效果后，伊娃会意识到你并不是杀害她的凶手，便会与你交谈，交给你旧的幽灵精华饰品，并让你可以拾取地上的伊娃的股骨。这样你就能在凯尔达隆看到幽灵了。\n\n完成之后，你可以在通灵学院外她原来的位置与她交谈，她会请求你寻找她的日记以及五支蜡烛，以举行一场可怕的仪式。蜡烛需要与凯尔达隆的居民交易，并需要他们生前珍视的物品。下面是所有物品的位置：",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_10_1_5 },
			["maps"] = { MAP.EASTERN_PLAGUELANDS, MAP.STRATHOLME, MAP.WESTERN_PLAGUELANDS },
			["cost"] = {
				{ "i", 206357, 1 },	-- 1x Authentic Andorhal Candle
				{ "i", 206364, 1 },	-- 1x Eva's Femur
				{ "i", 206346, 1 },	-- 1x Eva's Journal
				{ "i", 206356, 1 },	-- 1x Ghost-Warding Candle
				{ "i", 206358, 1 },	-- 1x Imported Candle
				{ "i", 206354, 1 },	-- 1x Stinky Candle
				{ "i", 206355, 1 },	-- 1x Tobacco-Filled Candle
			},
		})),
		q(5463, {	-- Menethil's Gift (1/2)
			["description"] = createLocalizationString({
				readable = "Take the Keepsake to the symbol on the floor in Baron Rivendare's room in Stratholme.",
				constant = "TAKE_THE_KEEPSAKE_TO_THE_SYMBOL_ON_THE_FLOOR_IN",
				export = true,
				text = {
					en = "Take the Keepsake to the symbol on the floor in Baron Rivendare's room in Stratholme.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "将纪念品带到斯坦索姆瑞文戴尔男爵房间地上的符号处。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuest"] = 5462,	-- The Dying, Ras Frostwhisper
			["providers"] = {
				{ "n", 11036 },	-- Leonid Barthalomew the Revered <The Argent Dawn>
				{ "i", 13585 },	-- Keepsake of Remembrance
			},
			["coord"] = { 81.7, 57.8, MAP.EASTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.STRATHOLME },
			["lvl"] = 57,
		}),
		q(5464, {	-- Menethil's Gift (2/2)
			["sourceQuest"] = 5463,	-- Menethil's Gift (1/2)
			["providers"] = {
				{ "o", 176631 },	-- Menethil's Gift
				{ "i", 13624 },	-- Soulbound Keepsake
			},
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.STRATHOLME },
			["lvl"] = 57,
		}),
		{	-- Mold Rhymes With...
			["allianceQuestData"] = q(5538, {	-- Mold Rhymes With... [A]
				["sourceQuest"] = 5537,	-- Skeletal Fragments [Alliance]
				["qg"] = 11056,	-- Alchemist Arbington
				["coord"] = { 42.66, 83.77, MAP.WESTERN_PLAGUELANDS },
			}),
			["hordeQuestData"] = q(5514, {	-- Mold Rhymes With... [H]
				["sourceQuest"] = 964,	-- Skeletal Fragments [Horde]
				["qg"] = 11057,	-- Apothecary Dithers
				["coord"] = { 83.3, 69.2, MAP.TIRISFAL_GLADES },
				["maps"] = { MAP.WESTERN_PLAGUELANDS },
			}),
			["timeline"] = { REMOVED_4_0_3 },
			["cost"] = {
				{ "i", 14628, 1 },	-- Imbued Skeletal Fragments
				{ "g", 150000 },	-- 15g
			},
			["lvl"] = 55,
		},
		q(5529, {	-- Plagued Hatchlings
			["qg"] = 11035,	-- Betina Bigglezink <The Argent Dawn>
			["coord"] = { 81.47, 59.66, MAP.EASTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/20 Plagued Hatchling slain
					["provider"] = { "n", 10678 },	-- Plagued Hatchling
				}),
			},
		}),
		q(27145, {	-- Plagued Hatchlings...For Now
			["qg"] = 45109,	-- Weldon Barov <House of Barov>
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/10 Plagued Hatchling slain
					["provider"] = { "n", 10678 },	-- Plagued Hatchling
				}),
				objective(2, {	-- 0/1 Rattlegore slain
					["provider"] = { "n", 11622 },	-- Rattlegore
				}),
			},
		}),
		q(5533, {	-- Scholomance [Alliance]
			["sourceQuest"] = 5097,	-- All Along the Watchtowers [Alliance]
			["qg"] = 10838,	-- Commander Ashlam Valorfist
			["coord"] = { 42.7, 84.0, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["races"] = ALLIANCE_ONLY,
			["lvl"] = 55,
		}),
		q(838, {	-- Scholomance [Horde]
			["sourceQuest"] = 5098,	-- All Along the Watchtowers [Horde]
			["qg"] = 10837,	-- High Executor Derrington
			["coord"] = { 83.1, 68.9, MAP.TIRISFAL_GLADES },
			["timeline"] = { REMOVED_4_0_3 },
			["races"] = HORDE_ONLY,
			["lvl"] = 55,
		}),
		q(27148, {	-- School's Out Forever
			["qg"] = 45108,	-- Lucien Sarkhoff
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Darkmaster Gandling slain
					["provider"] = { "n", 1853 },	-- Darkmaster Gandling
				}),
				i(65974, {	-- Discipline Rod
					["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
				}),
				i(65925, {	-- Lucien's Boots
					["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
				}),
				i(65950, {	-- Shackles of Punishment
					["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
				}),
				i(65995, {	-- Signet of the Darkmaster
					["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
				}),
			},
		}),
		{	-- Skeletal Fragments
			["allianceQuestData"] = q(5537, {	-- Skeletal Fragments [A]
				["sourceQuest"] = 5533,	-- Scholomance [Alliance]
				["qg"] = 11056,	-- Alchemist Arbington
				["coord"] = { 42.66, 83.77, MAP.WESTERN_PLAGUELANDS },
			}),
			["hordeQuestData"] = q(964, {	-- Skeletal Fragments [H]
				["sourceQuest"] = 838,	-- Scholomance [Horde]
				["qg"] = 11057,	-- Apothecary Dithers
				["coord"] = { 83.3, 69.2, MAP.TIRISFAL_GLADES },
				["maps"] = { MAP.WESTERN_PLAGUELANDS },
			}),
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/15 Skeletal Fragments
					["provider"] = { "i", 14619 },	-- Skeletal Fragments
					["crs"] = {
						1789,	-- Skeletal Acolyte
						1787,	-- Skeletal Executioner
						1783,	-- Skeletal Flayer
						1784,	-- Skeletal Sorcerer
						1785,	-- Skeletal Terror
						1788,	-- Skeletal Warlord
					},
				}),
			},
		},
		q(5465, {	-- Soulbound Keepsake
			["sourceQuest"] = 5464,	-- Menethil's Gift (2/2)
			["providers"] = {
				{ "n", 11036 },	-- Leonid Barthalomew the Revered <The Argent Dawn>
				{ "i", 13624 },	-- Soulbound Keepsake
			},
			["coord"] = { 81.7, 57.8, MAP.EASTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
		}),
		q(7668, {	-- The Darkreaver Menace (Original: 1.4 till 1.7 only)
			["sourceQuest"] = 7667,	-- Material Assistance
			["qg"] = 13417,	-- Sagorne Creststrider <Shaman Trainer>
			["coord"] = { 38.7, 35.9, MAP.ORGRIMMAR },
			["timeline"] = { REMOVED_1_7_0 },
			["classes"] = { SHAMAN },
			["races"] = HORDE_ONLY,
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Darkreaver's Head
					["provider"] = { "i", 18880 },	-- Darkreaver's Head
					["cr"] = 14516,	-- Death Knight Darkreaver
				}),
				i(18807, {	-- Helm of Latent Power
					["timeline"] = { REMOVED_1_7_0 },
				}),
			},
		}),
		applyclassicphase(PHASE_FOUR, q(8258, {	-- The Darkreaver Menace (Post 1.7, Phase 4)
			["sourceQuest"] = 7667,	-- Material Assistance
			["altQuests"] = {
				7668,	-- The Darkreaver Menace (Original)
			},
			["qg"] = 13417,	-- Sagorne Creststrider <Shaman Trainer>
			["coord"] = { 38.7, 35.9, MAP.ORGRIMMAR },
			["timeline"] = { ADDED_1_7_0, REMOVED_4_0_3 },
			["classes"] = { SHAMAN },
			["races"] = HORDE_ONLY,
			["lvl"] = 55,
			["groups"] = {
				objective(1, {	-- 0/1 Darkreaver's Head
					["provider"] = { "i", 18880 },	-- Darkreaver's Head
					["cr"] = 14516,	-- Death Knight Darkreaver
				}),
				i(20134, {	-- Skyfury Helm
					["timeline"] = { ADDED_1_7_0, REMOVED_4_0_3 },
				}),
			},
		})),
		q(5462, {	-- The Dying, Ras Frostwhisper
			["sourceQuest"] = 5461,	-- The Human, Ras Frostwhisper
			["providers"] = {
				{ "n", 11286 },	-- Magistrate Marduke
				{ "i", 13544 },	-- Spectral Essence
				{ "i", 13585 },	-- Keepsake of Remembrance
			},
			["coord"] = { 70.6, 74.1, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
		}),
		q(5461, {	-- The Human, Ras Frostwhisper
			["sourceQuest"] = 5384,	-- Kirtonos the Herald
			["providers"] = {
				{ "n", 11286 },	-- Magistrate Marduke
				{ "i", 13544 },	-- Spectral Essence
			},
			["coord"] = { 70.6, 74.1, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.ARATHI_HIGHLANDS },
			["lvl"] = 57,
			["groups"] = {
				objective(1, {	-- 0/1 Keepsake of Remembrance
					["providers"] = {
						{ "i",  13585 },	-- Keepsake of Remembrance
						{ "o", 176630 },	-- Keepsake of Remembrance
					},
					["coord"] = { 17.9, 69.4, MAP.ARATHI_HIGHLANDS },
				}),
			},
		}),
		{	-- The Key to Scholomance
			["allianceQuestData"] = q(5505, {	-- The Key to Scholomance [A]
				["sourceQuest"] = 5803,	-- Araj's Scarab
				["qg"] = 11056,	-- Alchemist Arbington
				["coord"] = { 42.6, 83.8, MAP.WESTERN_PLAGUELANDS },
			}),
			["hordeQuestData"] = q(5511, {	-- The Key to Scholomance [H]
				["sourceQuest"] = 5804,	-- Araj's Scarab
				["qg"] = 11057,	-- Apothecary Dithers
				["coord"] = { 83.2, 69.2, MAP.TIRISFAL_GLADES },
				["maps"] = { MAP.WESTERN_PLAGUELANDS },
			}),
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 55,
			["groups"] = {
				i(13704, {	-- Skeleton Key
					["timeline"] = { DELETED_4_0_3 },
				}),
			},
		},
		q(5344, {	-- The Last Barov [Alliance]
			["sourceQuest"] = 5343,	-- Barov Family Fortune [Alliance]
			["qg"] = 11023,	-- Weldon Barov <House of Barov>
			["coord"] = { 43.5, 83.7, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.TIRISFAL_GLADES },
			["races"] = ALLIANCE_ONLY,
			["lvl"] = 52,
			["groups"] = {
				objective(1, {	-- 0/1 Head of Alexi Barov
					["provider"] = { "i", 13470 },	-- Head of Alexi Barov
					["coord"] = { 83.0, 71.6, MAP.TIRISFAL_GLADES },
					["cr"] = 11022,	-- Alexi Barov <House of Barov>
				}),
				i(14023, {	-- Barov Peasant Caller
					["timeline"] = { REMOVED_4_0_3 },
				}),
			},
		}),
		q(5342, {	-- The Last Barov [Horde]
			["sourceQuest"] = 5341,	-- Barov Family Fortune [Horde]
			["qg"] = 11022,	-- Alexi Barov <House of Barov>
			["coord"] = { 83.06, 71.6, MAP.TIRISFAL_GLADES },
			["timeline"] = { REMOVED_4_0_3 },
			["maps"] = { MAP.WESTERN_PLAGUELANDS },
			["races"] = HORDE_ONLY,
			["lvl"] = 52,
			["groups"] = {
				objective(1, {	-- 0/1 Head of Weldon Barov
					["provider"] = { "i", 13469 },	-- Head of Weldon Barov
					["coord"] = { 43.4, 83.6, MAP.WESTERN_PLAGUELANDS },
					["cr"] = 11023,	-- Weldon Barov <House of Barov>
				}),
				i(14022, {	-- Barov Peasant Caller
					["timeline"] = { REMOVED_4_0_3 },
				}),
			},
		}),
		q(5466, {	-- The Lich, Ras Frostwhisper
			["sourceQuest"] = 5465,	-- Soulbound Keepsake
			["providers"] = {
				{ "n", 11286 },	-- Magistrate Marduke
				{ "i", 13544 },	-- Spectral Essence
			},
			["coord"] = { 70.6, 74.1, MAP.WESTERN_PLAGUELANDS },
			["timeline"] = { REMOVED_4_0_3 },
			["lvl"] = 57,
			["groups"] = {
				objective(1, {	-- 0/1 Human Head of Ras Frostwhisper
					["provider"] = { "i", 13626 },	-- Human Head of Ras Frostwhisper
				}),
				i(14002, {	-- Darrowshire Strongguard
					["timeline"] = { REMOVED_4_0_3 },
				}),
				i(13984, {	-- Darrowspike
					["timeline"] = { REMOVED_4_0_3 },
				}),
				i(13982, {	-- Warblade of Caer Darrow
					["timeline"] = { REMOVED_4_0_3 },
				}),
				i(13986, {	-- Crown of Caer Darrow
					["timeline"] = { REMOVED_4_0_3 },
				}),
			},
		}),
		q(27142, {	-- The Lich, Ras Frostwhisper [CATA]
			["qg"] = 45110,	-- Alexi Barov <House of Barov>
			["timeline"] = { ADDED_4_0_3, REMOVED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Ras Frostwhisper slain
					["provider"] = { "n", 10508 },	-- Ras Frostwhisper
				}),
			},
		}),
	}),
	n(TREASURES, {
		o(403567, bubbleDownSelf({ ["timeline"] = { ADDED_10_1_5 } }, {		-- Cracked Argent Dawn Commission
			["description"] = createLocalizationString({
				readable = "Can be found at the top of the southwest bone pile in Rattlegore's room. From the Great Ossuary, you can drop down from the southwest hole leading to Rattlegore's room and look down, it's a small object on the pile.\n\nThis is not visible if your character already has an Argent Dawn Commission or a Rune/Seal of the Dawn!",
				constant = "CAN_BE_FOUND_AT_THE_TOP_OF_THE_SOUTHWEST_BONE",
				export = true,
				text = {
					en = "Can be found at the top of the southwest bone pile in Rattlegore's room. From the Great Ossuary, you can drop down from the southwest hole leading to Rattlegore's room and look down, it's a small object on the pile.\n\nThis is not visible if your character already has an Argent Dawn Commission or a Rune/Seal of the Dawn!",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "可以在碎骨者房间西南角的骨堆顶部找到。从大骨库的西南洞口跳下进入碎骨者的房间并向下看，它是骨堆上的一个小物件。\n\n如果你的角色已经拥有银色黎明委任徽章或黎明符文/黎明徽记，则无法看到此物品！",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(206372),	-- Cracked Argent Dawn Commission
			},
		})),
		o(405388, bubbleDownSelf({ ["timeline"] = { ADDED_10_1_5 } }, {		-- Familiar Journal
			["description"] = createLocalizationString({
				readable = "The Familiar Journal itself can be found in the Viewing Room of Old Scholomance, on the second bookshelf from the left wall, near the mini-boss Marduk Blackpool. All you have to do is pick up the book, and the toy is yours! It's as simple as that.",
				constant = "THE_FAMILIAR_JOURNAL_ITSELF_CAN_BE_FOUND_IN_THE",
				export = true,
				text = {
					en = "The Familiar Journal itself can be found in the Viewing Room of Old Scholomance, on the second bookshelf from the left wall, near the mini-boss Marduk Blackpool. All you have to do is pick up the book, and the toy is yours! It's as simple as that.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "魔宠日志本身可以在旧通灵学院的观阅室中找到，位于从左墙数第二个书架上，就在小首领马杜克·布莱克波尔附近。你只需捡起这本书，玩具就归你了！就是这么简单。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(208096),	-- Familiar Journal (TOY!)
			},
		})),
		i(12736, {	-- Frostwhisper's Embalming Fluid
			["description"] = createLocalizationString({
				readable = "Can be found inside the chemistry lab in Scholomance, in Ras Frostwhisper's room.",
				constant = "CAN_BE_FOUND_INSIDE_THE_CHEMISTRY_LAB_IN",
				export = true,
				text = {
					en = "Can be found inside the chemistry lab in Scholomance, in Ras Frostwhisper's room.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "可在通灵学院内的化学实验室中找到，就在拉斯·霜语的房间。",
					-- TODO: tw = "",
				},
			}),
			["provider"] = { "o", 175965 },	-- Frostwhisper's Embalming Fluid
			["timeline"] = { ADDED_1_11_1, REMOVED_5_0_4, ADDED_10_2_5 }	-- Maybe added with Scholo in 10.1.7, but its an useless item anyway.
		}),
	}),
	n(ZONE_DROPS, {
		i(20520),	-- Dark Rune
		i(16255, {	-- Formula: Enchant 2H Weapon - Major Spirit (RECIPE!)
			["cr"] = 10469,	-- Scholomance Adept
		}),
		i(16254, {	-- Formula: Enchant Weapon - Lifestealing (RECIPE!)
			["cr"] = 10499,	-- Spectral Researcher
		}),
		i(15776, {	-- Pattern: Runic Leather Armor (RECIPE!)
			-- #if AFTER 4.0.3
			["description"] = createLocalizationString({
				readable = "This pattern no longer drops. The recipe can now be trained at any leatherworking trainer.",
				constant = "THIS_PATTERN_NO_LONGER_DROPS_THE_RECIPE_CAN_NOW",
				export = true,
				text = {
					en = "This pattern no longer drops. The recipe can now be trained at any leatherworking trainer.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "该图样已不再掉落。现在可以在任意制皮训练师处学会该配方。",
					-- TODO: tw = "",
				},
			}),
			-- #endif
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
			["cr"] = 11582,	-- Scholomance Dark Summoner
		}),
		i(15773, {	-- Pattern: Wicked Leather Armor (RECIPE!)
			-- #if AFTER 4.0.3
			["description"] = "~L.THIS_PATTERN_NO_LONGER_DROPS_THE_RECIPE_CAN_NOW",
			-- #endif
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
			["cr"] = 10499,	-- Spectral Researcher
		}),
		applyclassicphase(PHASE_SIX, i(22526)),	-- Bone Fragments
		i(12843, {	-- Corruptor's Scourgestone / Inert Corruptor's Scourgestone
			["description"] = createLocalizationString({
				readable = "Can drop from any Undead creature in the Plaguelands and associated dungeons so long as you are equipped with one of the Argent Dawn trinkets.",
				constant = "CAN_DROP_FROM_ANY_UNDEAD_CREATURE_IN_THE",
				export = true,
				text = {
					en = "Can drop from any Undead creature in the Plaguelands and associated dungeons so long as you are equipped with one of the Argent Dawn trinkets.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "只要你装备了任意一件银色黎明饰品，就能从瘟疫之地及相关副本中的任意亡灵生物身上掉落。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		i(12841, {	-- Invader's Scourgestone / Inert Invader's Scourgestone
			["description"] = "~L.CAN_DROP_FROM_ANY_UNDEAD_CREATURE_IN_THE",
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		i(12840, {	-- Minion's Scourgestone / Inert Minion's Scourgestone
			["description"] = createLocalizationString({
				readable = "Can drop from weak Undead creature in the Plaguelands and associated dungeons so long as you are equipped with one of the Argent Dawn trinkets.",
				constant = "CAN_DROP_FROM_WEAK_UNDEAD_CREATURE_IN_THE",
				export = true,
				text = {
					en = "Can drop from weak Undead creature in the Plaguelands and associated dungeons so long as you are equipped with one of the Argent Dawn trinkets.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "只要你装备了任意一件银色黎明饰品，就能从瘟疫之地及相关副本中的弱小亡灵生物身上掉落。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		i(13920, {	-- Healthy Dragon Scale
			["description"] = createLocalizationString({
				readable = "This item can only drop from the Hatchlings after you have completed the Plagued Hatchlings quest.",
				constant = "THIS_ITEM_CAN_ONLY_DROP_FROM_THE_HATCHLINGS",
				export = true,
				text = {
					en = "This item can only drop from the Hatchlings after you have completed the Plagued Hatchlings quest.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "只有在完成瘟疫雏龙任务后，该物品才会从雏龙身上掉落。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { REMOVED_4_0_3, ADDED_10_1_5 },
			["cr"] = 10678,	-- Plagued Hatchling
		}),
		i(12753, {	-- Skin of Shadow
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		ignoreTimeline(i(18702)),	-- Belt of the Ordained
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226751, {	-- Bindings of Elements
			["timeline"] = { ADDED_1_15_3 },
			["cr"] = 10478,	-- Splintered Skeleton
		})),
		-- #endif
		i(16671, {	-- Bindings of Elements
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10478,	-- Splintered Skeleton
		}),
		ignoreTimeline(i(14536)),	-- Bonebrace Hauberk
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228703, {	-- Coldstone Slippers
			["description"] = createLocalizationString({
				readable = "None of these have been found on WoWHead or the AH. @Crieve if you get one to drop!",
				constant = "NONE_OF_THESE_HAVE_BEEN_FOUND_ON_WOWHEAD_OR_THE",
				export = true,
				text = {
					en = "None of these have been found on WoWHead or the AH. @Crieve if you get one to drop!",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "这些物品均未在 WoWHead 或拍卖行上被发现。如果你让其中一件掉落了，请 @Crieve！",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { CREATED_1_15_3 },
		})),
		-- #endif
		ignoreTimeline(i(18697, {	-- Coldstone Slippers
			-- #if SEASON_OF_DISCOVERY
			-- CRIEVE NOTE: There is a reitemized version, but it doesn't seem to exist yet.
			-- ["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		})),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226761, {	-- Dreadmist Belt
			["timeline"] = { ADDED_1_15_3 },
			["cr"] = 10477,	-- Scholomance Necromancer
		})),
		-- #endif
		i(16702, {	-- Dreadmist Belt
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10477,	-- Scholomance Necromancer
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226758, {	-- Dreadmist Wraps
			["timeline"] = { ADDED_1_15_3 },
			["cr"] = 10477,	-- Scholomance Necromancer
		})),
		-- #endif
		i(16705, {	-- Dreadmist Wraps
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10477,	-- Scholomance Necromancer
		}),
		ignoreTimeline(i(18699)),	-- Icy Tomb Spaulders
		ignoreTimeline(i(18701)),	-- Innervating Band
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226739, {	-- Lightforge Bracers
			["timeline"] = { ADDED_1_15_3 },
			["crs"] = {
				10487,	-- Risen Protector
				10486,	-- Risen Warrior
			},
		})),
		-- #endif
		i(16722, {	-- Lightforge Bracers
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["crs"] = {
				10487,	-- Risen Protector
				10486,	-- Risen Warrior
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226724, {	-- Magister's Belt
			["timeline"] = { ADDED_1_15_3 },
			["cr"] = 10469,	-- Scholomance Adept
		})),
		-- #endif
		i(16685, {	-- Magister's Belt
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10469,	-- Scholomance Adept
		}),
		i(16684, {	-- Magister's Gloves
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10469,	-- Scholomance Adept
		}),
		ignoreTimeline(i(18700)),	-- Malefic Bracers
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226704, {	-- Shadowcraft Bracers
			["timeline"] = { ADDED_1_15_3 },
			["crs"] = {
				11284,	-- Dark Shade
				10472,	-- Scholomance Occultist
				10488,	-- Risen Construct
			},
		})),
		-- #endif
		i(16710, {	-- Shadowcraft Bracers
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["crs"] = {
				11284,	-- Dark Shade
				10472,	-- Scholomance Occultist
				10488,	-- Risen Construct
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228704, {	-- Tattered Leather Hood
			["description"] = "~L.NONE_OF_THESE_HAVE_BEEN_FOUND_ON_WOWHEAD_OR_THE",
			["timeline"] = { CREATED_1_15_3 },
		})),
		-- #endif
		ignoreTimeline(i(18698, {	-- Tattered Leather Hood
			-- #if SEASON_OF_DISCOVERY
			-- CRIEVE NOTE: There is a reitemized version, but it doesn't seem to exist yet.
			-- ["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		})),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226712, {	-- Wildheart Belt
			["timeline"] = { ADDED_1_15_3 },
			["crs"] = {
				11257,	-- Scholomance Handler
				10500,	-- Spectral Teacher
				10499,	-- Spectral Researcher
			},
		})),
		-- #endif
		i(16716, {	-- Wildheart Belt
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["crs"] = {
				11257,	-- Scholomance Handler
				10500,	-- Spectral Teacher
				10499,	-- Spectral Researcher
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226714, {	-- Wildheart Bracers
			["timeline"] = { ADDED_1_15_3 },
			["cr"] = 10495,	-- Diseased Ghoul
		})),
		-- #endif
		i(16714, {	-- Wildheart Bracers
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
			["cr"] = 10495,	-- Diseased Ghoul
		}),
	}),
	n(14861, {	-- Blood Steward of Kirtonos
		i(13523, {	-- Blood of Innocents
			["timeline"] = { REMOVED_5_0_4 },
		}),
	}),
	n(10506, {	-- Kirtonos the Herald
		["providers"] = {
			{ "o", 175564 },	-- Brazier of the Herald
			-- #if BEFORE 10.1.5
			{ "i",  13523 },	-- Blood of Innocents
			-- #else
			{ "i", 206370 },	-- Blood of Innocents
			-- #endif
		},
		["description"] = createLocalizationString({
			readable = "Can only be summoned if someone in your group has the Blood of Innocents.",
			constant = "CAN_ONLY_BE_SUMMONED_IF_SOMEONE_IN_YOUR_GROUP",
			export = true,
			text = {
				en = "Can only be summoned if someone in your group has the Blood of Innocents.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "只有当队伍中有人拥有无辜者之血时才能召唤。",
				-- TODO: tw = "",
			},
		}),
		["groups"] = {
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228015, {	-- Frightalon
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14024, {	-- Frightalon
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228029, {	-- Gravestone War Axe
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13983, {	-- Gravestone War Axe
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228019, {	-- Heart of the Fiend
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13960, {	-- Heart of the Fiend
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228001, {	-- Stoneform Shoulders
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13955, {	-- Stoneform Shoulders
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(13969),	-- Loomguard Armbraces
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228007, {	-- Gargoyle Slashers
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13957, {	-- Gargoyle Slashers
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228005, {	-- Clutch of Andros
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13956, {	-- Clutch of Andros
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226764, {	-- Boots of Valor
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16734, {	-- Boots of Valor
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228004, {	-- Windreaver Greaves
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13967, {	-- Windreaver Greaves
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
		},
	}),
	n(10503, {	-- Jandice Barov
		i(13523, {	-- Blood of Innocents
			["timeline"] = { REMOVED_5_0_4 },
		}),
		i(13725),	-- Krastinov's Bag of Horrors
		o(180794, {	-- Journal of Jandice Barov
			["description"] = createLocalizationString({
				readable = "Jandice Barov drops this item when killed, which teaches Felcloth Bag. You must be a tailor of skill 285 or higher to learn this recipe.",
				constant = "JANDICE_BAROV_DROPS_THIS_ITEM_WHEN_KILLED_WHICH",
				export = true,
				text = {
					en = "Jandice Barov drops this item when killed, which teaches Felcloth Bag. You must be a tailor of skill 285 or higher to learn this recipe.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "杀死詹迪斯·巴罗夫后她会掉落此物品，可学会恶魔布包。你必须是一名技能 285 或更高的裁缝才能学习该配方。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				r(26086, {	-- Felcloth Bag
					["requireSkill"] = TAILORING,
				}),
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(227997, {	-- Barovian Family Sword
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14541, {	-- Barovian Family Sword
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		applyclassicphase(PHASE_FIVE, i(22394)),	-- Staff of Metanoia
		i(18689),	-- Phantasmal Cloak
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226756, {	-- Dreadmist Mantle
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16701, {	-- Dreadmist Mantle
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
		i(14548),	-- Royal Cap Spaulders
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228031, {	-- Darkshade Gloves
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14543, {	-- Darkshade Gloves
			-- #if AFTER 2.0.1
			["description"] = "~L.THIS_ITEM_APPEARS_TO_HAVE_BEEN_REMOVED_WITH_TBC",
			["isBounty"] = true,
			-- #endif
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_2_0_1,
				-- #endif
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228040, {	-- Ghostloom Leggings
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14545, {	-- Ghostloom Leggings
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228041, {	-- Wraithplate Leggings
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(18690, {	-- Wraithplate Leggings
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
	}),
	n(11622, {	-- Rattlegore
		i(13873, {	-- Viewing Room Key
			["description"] = createLocalizationString({
				readable = "You must use this item on the door prior to Vectus and Marduk.",
				constant = "YOU_MUST_USE_THIS_ITEM_ON_THE_DOOR_PRIOR_TO",
				export = true,
				text = {
					en = "You must use this item on the door prior to Vectus and Marduk.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "你必须在维克图斯和马尔杜克之前对门使用此物品。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		i(206371, {	-- Viewing Room Key
			["description"] = "~L.YOU_MUST_USE_THIS_ITEM_ON_THE_DOOR_PRIOR_TO",
			["timeline"] = { ADDED_10_1_5 },
		}),
		i(18782, {	-- Top Half of Advanced Armorsmithing: Volume II
			["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(227994, {	-- Frightskull Shaft
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14531, {	-- Frightskull Shaft
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228037, {	-- Rattlecage Buckler
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14528, {	-- Rattlecage Buckler
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228032, {	-- Bone Ring Helm
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14539, {	-- Bone Ring Helm
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(18686),	-- Bone Golem Shoulders
		i(14538),	-- Deadwalker Mantle
		i(14537),	-- Corpselight Greaves
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226703, {	-- Shadowcraft Boots
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16711, {	-- Shadowcraft Boots
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
	}),
	-- The Re-release of Scholomance should allow the summon of this boss once again, however the item required to summon him is one time.
	-- To get the summon item again, you would have to abandon the quest and pick it up again, which you cant.	-- Gold 02/08/2023 (EU)
	n(14516, bubbleDownSelf({ ["timeline"] = { REMOVED_4_0_3 } }, {	-- Death Knight Darkreaver
		["cost"] = { { "i", 18746, 1 } },	-- Divination Scryer
		["groups"] = {
			i(18749),	-- Charger's Lost Soul
			i(18880),	-- Darkreaver's Head
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228030, {	-- Malicious Axe
				["description"] = createLocalizationString({
					readable = "There are no recorded drops for this version, if you get it to drop, @Crieve on Discord!",
					constant = "THERE_ARE_NO_RECORDED_DROPS_FOR_THIS_VERSION_IF",
					export = true,
					text = {
						en = "There are no recorded drops for this version, if you get it to drop, @Crieve on Discord!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此版本没有任何掉落记录，如果你让它掉落了，请在 Discord 上 @Crieve！",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { CREATED_1_15_3 },
			})),
			-- #endif
			i(18759, {	-- Malicious Axe
				-- #if SEASON_OF_DISCOVERY
				-- CRIEVE NOTE: The reitemized version isn't in the game yet?
				-- ["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(18761),	-- Oblivion's Touch
			i(18758),	-- Specter's Blade
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228045, {	-- Necromantic Band
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(18760, {	-- Necromantic Band
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
		},
	})),
	n(10433, {	-- Marduk Blackpool
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(227993, {	-- Ebon Hilt of Marduk
			["description"] = "~L.THERE_ARE_NO_RECORDED_DROPS_FOR_THIS_VERSION_IF",
			["timeline"] = { CREATED_1_15_3 },
		})),
		-- #endif
		i(14576, {	-- Ebon Hilt of Marduk
			-- #if SEASON_OF_DISCOVERY
			-- CRIEVE NOTE: The reitemized version isn't in the game.
			-- ["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(18692),	-- Death Knight Sabatons
	}),
	n(10432, {	-- Vectus
		i(18691),	-- Dark Advisor's Pendant
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228017, {	-- Skullsmoke Pants
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14577, {	-- Skullsmoke Pants
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
	}),
	n(10508, {	-- Ras Frostwhisper
		i(13626, {	-- Human Head of Ras Frostwhisper
			["description"] = createLocalizationString({
				readable = "Use the Keepsake on him before he dies to turn him back into a human.",
				constant = "USE_THE_KEEPSAKE_ON_HIM_BEFORE_HE_DIES_TO_TURN",
				export = true,
				text = {
					en = "Use the Keepsake on him before he dies to turn him back into a human.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在他死前对他使用纪念品，将他变回人类。",
					-- TODO: tw = "",
				},
			}),
			["cost"] = { { "i", 13752, 1 } },	-- Soulbound Keepsake
		}),
		i(13521),	-- Recipe: Flask of Supreme Power (RECIPE!)
		i(14487),	-- Bonechill Hammer
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228027, {	-- Iceblade Hacker
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(13952, {	-- Iceblade Hacker
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(18696),	-- Intricately Runed Shield
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228039, {	-- Spellbound Tome
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(18695, {	-- Spellbound Tome
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226726, {	-- Magister's Mantle
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16689, {	-- Magister's Mantle
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228023, {	-- Alanna's Embrace
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(13314, {	-- Alanna's Embrace
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228036, {	-- Death's Clutch
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14503, {	-- Death's Clutch
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(14525),	-- Boneclenched Gauntlets
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228034, {	-- Shivery Handwraps
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(18693, {	-- Shivery Handwraps
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(14340),	-- Freezing Lich Robes
		i(14502),	-- Frostbite Girdle
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(228044, {	-- Maelstrom Leggings
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(14522, {	-- Maelstrom Leggings
			-- #if SEASON_OF_DISCOVERY
			["timeline"] = { REMOVED_1_15_3 },
			-- #endif
		}),
		i(18694),	-- Shadowy Mail Greaves
	}),
	applyclassicphase(PHASE_FIVE_TIER_ZERO_POINT_FIVE_SETS, n_conditional(16118, {	-- Kormok
		["description"] =
			-- #if AFTER 10.1.5
			KORMOK_LEGACY_DESCRIPTION,
			-- #elseif BEFORE 5.0.4
			KORMOK_LEGACY_DESCRIPTION,
			-- #else
			"This boss was summoned using the Brazier of Beckoning in Ras Frostwhisper's room, which is currently inaccessible.",
			-- #endif
		-- #if BEFORE 6.0.2
		["cost"] = {
			{ "i", 22052, 1 },	-- Brazier of Beckoning [Kormok]
		},
		-- #endif

		-- #if AFTER 10.1.5
		["sourceQuest"] = 8996,	-- Return to Bodley
		["u_sqs"] = true,	-- remove the u flag if sourcequests are completed
		-- #elseif AFTER 4.0.3
			-- #if BEFORE 5.0.4
			["u_providers"] = true,	-- remove the u flag if providers are available
			-- #endif
		-- #endif

		["provider"] = { "i", 22057 },	-- Brazier of Invocation
		["timeline"] = { REMOVED_4_0_3 },
		["groups"] = {
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228026, {	-- Blade of Blackwood
				["timeline"] = { ADDED_1_15_3 },
			})),
			applyclassicphase(SOD_PHASE_FOUR, i(228028, {	-- Blade of Necromancy
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(22332, {	-- Blade of Necromancy
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228033, {	-- Hammer of Divine Might
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(22333, {	-- Hammer of Divine Might
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228038, {	-- Ironweave Pants
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(22303, {	-- Ironweave Pants
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228047, {	-- Amalgam's Band
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(22326, {	-- Amalgam's Band
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(22331),	-- Band of the Steadfast Hero
		},
	})),
	n(COMMON_BOSS_DROPS, {
		["description"] = createLocalizationString({
			readable = "The following items can drop from any of the mini-bosses in the crypt before fighting Darkmaster Gandling. The bosses other than Lady Illucia Barov have an item or two exclusive to their own drop tables.",
			constant = "THE_FOLLOWING_ITEMS_CAN_DROP_FROM_ANY_OF_THE_2",
			export = true,
			text = {
				en = "The following items can drop from any of the mini-bosses in the crypt before fighting Darkmaster Gandling. The bosses other than Lady Illucia Barov have an item or two exclusive to their own drop tables.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "以下物品可以从与黑暗院长加丁战斗之前墓室中的任何小首领身上掉落。除伊露希亚·巴罗夫女士之外的首领都有一两件专属掉落列表的物品。",
				-- TODO: tw = "",
			},
		}),
		["crs"] = {
			10505,	-- Instructor Malicia
			11261,	-- Doctor Theolen Krastinov <The Butcher>
			10901,	-- Lorekeeper Polkelt
			10502,	-- Lady Illucia Barov
			10504,	-- Lord Alexi Barov
			10507,	-- The Ravenian
		},
		["groups"] = {
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(227996, {	-- Ancient Bone Bow
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(18680, {	-- Ancient Bone Bow
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(18683),	-- Hammer of the Vesper
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228012, {	-- Bloodmail Hauberk
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14611, {	-- Bloodmail Hauberk
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228020, {	-- Bloodmail Gauntlets
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14615, {	-- Bloodmail Gauntlets
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228014, {	-- Bloodmail Belt
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14614, {	-- Bloodmail Belt
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228003, {	-- Bloodmail Legguards
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14612, {	-- Bloodmail Legguards
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(227998, {	-- Bloodmail Boots
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14616, {	-- Bloodmail Boots
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(18681),	-- Burial Shawl
			i(14637),	-- Cadaverous Armor
			i(14640),	-- Cadaverous Gloves
			i(14636),	-- Cadaverous Belt
			i(14638),	-- Cadaverous Leggings
			i(14641),	-- Cadaverous Walkers
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228000, {	-- Deathbone Chestplate
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14624, {	-- Deathbone Chestplate
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228006, {	-- Deathbone Gauntlets
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14622, {	-- Deathbone Gauntlets
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228002, {	-- Deathbone Girdle
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14620, {	-- Deathbone Girdle
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228008, {	-- Deathbone Legguards
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14623, {	-- Deathbone Legguards
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(227999, {	-- Deathbone Sabatons
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14621, {	-- Deathbone Sabatons
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228016, {	-- Dimly Opalescent Ring
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(18684, {	-- Dimly Opalescent Ring
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(207058, {	-- Fractured Shin
				["timeline"] = { ADDED_10_1_5 },
			}),
			i(18682),	-- Ghoul Skin Leggings
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228010, {	-- Necropile Mantle
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14633, {	-- Necropile Mantle
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228013, {	-- Necropile Robe
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14626, {	-- Necropile Robe
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228011, {	-- Necropile Cuffs
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14629, {	-- Necropile Cuffs
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228018, {	-- Necropile Leggings
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14632, {	-- Necropile Leggings
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228009, {	-- Necropile Boots
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(14631, {	-- Necropile Boots
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(207060, {	-- Skeletal Knight's Buckler
				["timeline"] = { ADDED_10_1_5 },
			}),
			i(207059, {	-- Skeletal Knights Blade
				["timeline"] = { ADDED_10_1_5 },
			}),
			applyclassicphase(PHASE_FIVE, i(23201, {	-- Libram of Divinity
				["timeline"] = { DELETED_5_0_4 },
			})),
			applyclassicphase(PHASE_FIVE, i(23200, {	-- Totem of Sustaining
				["timeline"] = { DELETED_5_0_4 },
			})),
		},
	}),
	n(10505, {	-- Instructor Malicia
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226704, {	-- Shadowcraft Bracers
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16710, {	-- Shadowcraft Bracers
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
	}),
	n(11261, {	-- Doctor Theolen Krastinov <The Butcher>
		i(206370, {	-- Blood of Innocents
			["timeline"] = { ADDED_10_1_5 },
		}),
		i(13523, {	-- Blood of Innocents
			["timeline"] = { REMOVED_5_0_4 },
		}),
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226731, {	-- Magister's Gloves
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16684, {	-- Magister's Gloves
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
		i(14617),	-- Sawbones Shirt
	}),
	n(10901, {	-- Lorekeeper Polkelt
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226758, {	-- Dreadmist Wraps
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16705, {	-- Dreadmist Wraps
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
	}),
	n(10507, {	-- The Ravenian
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226712, {	-- Wildheart Belt
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16716, {	-- Wildheart Belt
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
	}),
	n(10504, {	-- Lord Alexei Barov
		-- #if SEASON_OF_DISCOVERY
		applyclassicphase(SOD_PHASE_FOUR, i(226739, {	-- Lightforge Bracers
			["timeline"] = { ADDED_1_15_3 },
		})),
		-- #endif
		i(16722, {	-- Lightforge Bracers
			["timeline"] = {
				-- #if SEASON_OF_DISCOVERY
				REMOVED_1_15_3,
				-- #else
				REMOVED_4_0_3,
				-- #endif
			},
		}),
	}),
	n(1853, {	-- Darkmaster Gandling
		["description"] = createLocalizationString({
			readable = "You must fully clear out the six rooms around Headmaster's Study before this boss will spawn on the bottom floor. It is recommended that you clear the top floor last so that you have an opportunity to properly position your group.",
			constant = "YOU_MUST_FULLY_CLEAR_OUT_THE_SIX_ROOMS_AROUND",
			export = true,
			text = {
				en = "You must fully clear out the six rooms around Headmaster's Study before this boss will spawn on the bottom floor. It is recommended that you clear the top floor last so that you have an opportunity to properly position your group.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "你必须彻底清空院长书房周围的六个房间，这个首领才会在底层生成。建议最后清理顶层，这样你就有机会妥善安排队伍站位。",
				-- TODO: tw = "",
			},
		}),
		["groups"] = {
			i(206373, {	-- Darkmaster's Scourgestone (QI!)
				["description"] = createLocalizationString({
					readable = "Drops only with equipped Argent Dawn Commission",
					constant = "DROPS_ONLY_WITH_EQUIPPED_ARGENT_DAWN_COMMISSION",
					export = true,
					text = {
						en = "Drops only with equipped Argent Dawn Commission",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在装备银色黎明委任徽章时掉落",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 12846 },	-- Argent Dawn Commission
				["timeline"] = { ADDED_10_1_5 },
			}),
			i(14514, {	-- Pattern: Robe of the Void (RECIPE!)
				-- #if TBC
				-- During TBC this was made exclusively usable by Warlocks, then that change was reverted with Wrath.
				["classes"] = { WARLOCK },
				-- #endif
			}),
			i(13501),	-- Recipe: Major Mana Potion (RECIPE!)
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228022, {	-- Headmaster's Charge
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13937, {	-- Headmaster's Charge
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(13938),	-- Bonecreeper Stylus
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228024, {	-- Silent Fang
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13953, {	-- Silent Fang
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228021, {	-- Witchblade
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13964, {	-- Witchblade
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226720, {	-- Beaststalker's Cap
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16677, {	-- Beaststalker's Cap
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226755, {	-- Coif of Elements
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16667, {	-- Coif of Elements
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226746, {	-- Devout Crown
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16693, {	-- Devout Crown
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226762, {	-- Dreadmist Mask
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16698, {	-- Dreadmist Mask
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226769, {	-- Helm of Valor
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16731, {	-- Helm of Valor
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226733, {	-- Lightforge Helm
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16727, {	-- Lightforge Helm
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226728, {	-- Magister's Crown
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16686, {	-- Magister's Crown
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226707, {	-- Shadowcraft Cap
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16707, {	-- Shadowcraft Cap
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(226708, {	-- Wildheart Cowl
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(16720, {	-- Wildheart Cowl
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_4_0_3,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228025, {	-- Tombstone Breastplate
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13944, {	-- Tombstone Breastplate
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			i(13951),	-- Vigorsteel Vambraces
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228042, {	-- Detention Strap
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			i(13950, {	-- Detention Strap [CRIEVE NOTE: This item seems to have disappeared with TBC Classic.]
				["description"] = createLocalizationString({
					readable = "This item seems to have disappeared in Classic. If you get this item in any game flavor, please screenshot this and send it directly to @Crieve on Discord!",
					constant = "THIS_ITEM_SEEMS_TO_HAVE_DISAPPEARED_IN_CLASSIC_2",
					export = true,
					text = {
						en = "This item seems to have disappeared in Classic. If you get this item in any game flavor, please screenshot this and send it directly to @Crieve on Discord!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "该物品似乎在经典怀旧服中消失了。如果你在任何游戏版本中获得该物品，请截图并直接发送到 Discord 上的 @Crieve！",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					-- #if SEASON_OF_DISCOVERY
					REMOVED_1_15_3,
					-- #else
					REMOVED_2_0_1,
					-- #endif
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			--[[
			applyclassicphase(SOD_PHASE_FOUR, i(228043, {	-- Boots of the Shrieker
				["description"] = "None of these have been found on WoWHead. @Crieve if you get one to drop!",
				["timeline"] = { CREATED_1_15_3 },
			})),
			]]--
			-- #endif
			i(13398, {	-- Boots of the Shrieker
				-- #if SEASON_OF_DISCOVERY
				-- CRIEVE NOTE: This item is likely still in the game, the reitemized version doesn't appear to be yet.
				-- ["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			applyclassicphase(SOD_PHASE_FOUR, i(228046, {	-- Don Mauricio's Band of Domination
				["timeline"] = { ADDED_1_15_3 },
			})),
			-- #endif
			applyclassicphase(PHASE_FIVE, i(22433, {	-- Don Mauricio's Band of Domination
				-- #if SEASON_OF_DISCOVERY
				["timeline"] = { REMOVED_1_15_3 },
				-- #endif
			})),
			-- #if BEFORE 5.0.4
			applyclassicphase(PHASE_THREE_DMF_CARDS, i(19276)),	-- Ace of Portals
			-- #endif
		},
	}),
	-- n(14695),	-- Lord Blackwood
	-- Listed under Worldevent>Scourge>
});

-- #if BEFORE 5.0.4
-- Before MOP there was only one difficulty for Scholomance. Merge all the legacy data into the groups directly.
for i,o in ipairs(SCHOLOMANCE_LEGACY_DATA.groups) do
	table.insert(SCHOLOMANCE_GROUPS, o);
end
-- #else
-- After MOP they revamped Scholomance and included a lot of extra stuff. They also created a Heroic Difficulty, so a Normal header is now necessary.
local LEGACY_DUNGEON_GROUPS = {};
for i,o in ipairs(SCHOLOMANCE_LEGACY_DATA.groups) do
	table.insert(LEGACY_DUNGEON_GROUPS, o);
end
-- #if AFTER 10.1.5
table.insert(SCHOLOMANCE_GROUPS, header(HEADERS.Achievement, 18368, {	-- Memory of Scholomance
	["sourceQuest"] = 76249,	-- Memory of Scholomance
	["description"] = createLocalizationString({
		readable = "With 10.1.5, Blizzard readded the original version of Scholomance!\n\nThank you, Blizzard!\n  -Crieve\n\nHere is how to get started:\n\n1. Obtain 'Krastinov's Bag of Horrors' from the rare spawn Doctor Theolen Krastinov in Scholomance, Heroic difficulty. This step can be skipped if you are accompanied by someone who already have the toy.\n\n2. Defeat Darkmaster Gandling in Headmaster's Retreat and enter the upper level centre room.\n\n3. Find a pile of bones on the ground in the southeastern part of the room, and use the toy 'Krastinov's Bag of Horrors'.\n\n4. Eva Sarkhoff should now have spawned, but you cannot interact with her before you remove the toy visage/buff named 'Surgical Alterations'.\n\n5. Accept Eva Sarkhoof's quest and her Inert Spectral Essence. Loot Eva's Femur from the pile of bones.\n\n6. Walk back upstairs to The Viewing Room. There is two bookcases in the southwestern corner of the room. Eva's Journal can be found on a middle shelf on the backside of the left bookcase.\n\n7. Obtain the reagents 3x Dark Runes and 5x Essence of Undeath and use the Inert Spectral Essence. Equip the crafted trinket 'Spectral Essence'.\n\n8. Obtain candles from doing objectives around Caer Darrow (outside Scholomance):\n8.1 Loot 'The Deed to Andorhal' from inside Andorhal Townhall at 43.35, 69.3., and give it to Magistrate Marduke at 70.5, 74.0.\n8.2 Loot 'Bucket of Fountain Water' from the candlelit fountain at 68.9, 78.8., and give it to Joseph Dirte at 68.0, 74.8.\n8.3 Loot 'Trampled Doll' from the meatwagon in Darrowshire at 35.7, 83.5. (Eastern Plaguelands!), return to Caer Darrow and give it to Sammy at 69.15, 78.7.\n8.4 Loot 'The Road Ahead' from a wall inside old Corin's Crossing tavern  at 55.0, 64.0. (Eastern Plaguelands!), return to Caer Darrow and give it to Artist Renfray at 65.8, 75.4.\n8.5 Loot 'Undelivered Shipment of Smokes' from a wagon behind the fountain at King's Square in Stratholme, return to Caer Darrow and give it to Rory at 63.4, 75.5.\n\n9. Use Eva's Journal to begin the ritual at 69.7, 71.7., inside Caer Darrow keep/open world Scholomance.",
		constant = "WITH_10_1_5_BLIZZARD_READDED_THE_ORIGINAL",
		export = true,
		text = {
			en = "With 10.1.5, Blizzard readded the original version of Scholomance!\n\nThank you, Blizzard!\n  -Crieve\n\nHere is how to get started:\n\n1. Obtain 'Krastinov's Bag of Horrors' from the rare spawn Doctor Theolen Krastinov in Scholomance, Heroic difficulty. This step can be skipped if you are accompanied by someone who already have the toy.\n\n2. Defeat Darkmaster Gandling in Headmaster's Retreat and enter the upper level centre room.\n\n3. Find a pile of bones on the ground in the southeastern part of the room, and use the toy 'Krastinov's Bag of Horrors'.\n\n4. Eva Sarkhoff should now have spawned, but you cannot interact with her before you remove the toy visage/buff named 'Surgical Alterations'.\n\n5. Accept Eva Sarkhoof's quest and her Inert Spectral Essence. Loot Eva's Femur from the pile of bones.\n\n6. Walk back upstairs to The Viewing Room. There is two bookcases in the southwestern corner of the room. Eva's Journal can be found on a middle shelf on the backside of the left bookcase.\n\n7. Obtain the reagents 3x Dark Runes and 5x Essence of Undeath and use the Inert Spectral Essence. Equip the crafted trinket 'Spectral Essence'.\n\n8. Obtain candles from doing objectives around Caer Darrow (outside Scholomance):\n8.1 Loot 'The Deed to Andorhal' from inside Andorhal Townhall at 43.35, 69.3., and give it to Magistrate Marduke at 70.5, 74.0.\n8.2 Loot 'Bucket of Fountain Water' from the candlelit fountain at 68.9, 78.8., and give it to Joseph Dirte at 68.0, 74.8.\n8.3 Loot 'Trampled Doll' from the meatwagon in Darrowshire at 35.7, 83.5. (Eastern Plaguelands!), return to Caer Darrow and give it to Sammy at 69.15, 78.7.\n8.4 Loot 'The Road Ahead' from a wall inside old Corin's Crossing tavern  at 55.0, 64.0. (Eastern Plaguelands!), return to Caer Darrow and give it to Artist Renfray at 65.8, 75.4.\n8.5 Loot 'Undelivered Shipment of Smokes' from a wagon behind the fountain at King's Square in Stratholme, return to Caer Darrow and give it to Rory at 63.4, 75.5.\n\n9. Use Eva's Journal to begin the ritual at 69.7, 71.7., inside Caer Darrow keep/open world Scholomance.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "从 10.1.5 补丁开始，暴雪重新加入了通灵学院的原始版本！\n\n谢谢你，暴雪！\n  -Crieve\n\n以下是入门方法：\n\n1. 在英雄难度的通灵学院中，从稀有刷新塞奥林·克拉斯特诺夫医生身上获得“克拉斯特诺夫的恐怖之袋”。如果你有已经拥有该玩具的人陪同，可以跳过这一步。\n\n2. 在院长密室击败黑暗院长加丁，然后进入上层的中央房间。\n\n3. 在房间东南部的地面上找到一堆骸骨，使用玩具“克拉斯特诺夫的恐怖之袋”。\n\n4. 此时伊娃·萨克霍夫应该已经生成，但在你移除名为“外科改造”的玩具幻象/增益之前，你无法与她互动。\n\n5. 接受伊娃·萨克霍夫的任务并获得她的惰性幽灵精华。从骸骨堆中拾取伊娃的股骨。\n\n6. 走回楼上前往观览室。房间西南角有两个书架。伊娃的日志可以在左侧书架背面的中层隔板上找到。\n\n7. 获取所需材料：3 个黑暗符文和 5 个不死精华，然后使用惰性幽灵精华。装备制作出的饰品“幽灵精华”。\n\n8. 通过在凯尔达隆（通灵学院外）周围完成目标来获取蜡烛：\n8.1 在安多哈尔市政厅内 43.35, 69.3 处拾取“安多哈尔的地契”，并把它交给 70.5, 74.0 处的执政官马杜克。\n8.2 从 68.9, 78.8 处点着蜡烛的喷泉拾取“一桶喷泉水”，并把它交给 68.0, 74.8 处的约瑟夫·迪尔特。\n8.3 从东瘟疫之地达隆郡 35.7, 83.5 处的肉车上拾取“被踩踏的玩偶”，返回凯尔达隆并把它交给 69.15, 78.7 处的萨米。\n8.4 从东瘟疫之地旧科林十字路口酒馆内 55.0, 64.0 处的一堵墙上拾取“前方的路”，返回凯尔达隆并把它交给 65.8, 75.4 处的画家伦弗雷。\n8.5 从斯坦索姆国王广场喷泉后的一辆货车上拾取“未送达的烟草货物”，返回凯尔达隆并把它交给 63.4, 75.5 处的罗里。\n\n9. 使用伊娃的日志，在 69.7, 71.7 处、凯尔达隆要塞/开放世界通灵学院内开始仪式。",
			-- TODO: tw = "",
		},
	}),
	["mapID"] = 306,
	["maps"] = { 307, 308, 309 },
	["modID"] = 1,
	["groups"] = LEGACY_DUNGEON_GROUPS,
}));
-- #else
table.insert(SCHOLOMANCE_GROUPS, n(createHeader({
	readable = "Memory of Scholomance",
	icon = 133743,
	text = {
		en = "Memory of Scholomance",
		de = "Erinnerung an Scholomance",
		es = "Recuerdo de Scholomance",
		mx = "Recuerdo de Scholomance",
		fr = "Souvenir de Scholomance",
		it = "Ricordo di Scholomance",
		ko = "스칼로맨스의 기억",
		pt = "Lembrança de Scolomântia",
		ru = "Воспоминание о Некроситете",
		cn = "通灵学院的回忆",
		tw = "通靈學院的回憶",
	},
}), {
	["mapID"] = 306,
	["maps"] = { 307, 308, 309 },
	["modID"] = 1,
	["groups"] = LEGACY_DUNGEON_GROUPS,
}));
-- #endif

-- #if AFTER 5.0.4
table.insert(SCHOLOMANCE_GROUPS, d(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC, {
	["timeline"] = { ADDED_5_0_4 },
	["groups"] = {
		-- #if AFTER 10.1.5
		header(HEADERS.NPC, 206014, bubbleDown({ ["timeline"] = { ADDED_10_1_5 } }, {	-- Eva Sarkhoff
			["description"] = createLocalizationString({
				readable = "See the 'Memory of Scholomance'-header for proper instructions on how to do this.",
				constant = "SEE_THE_MEMORY_OF_SCHOLOMANCE_HEADER_FOR_PROPER",
				export = true,
				text = {
					en = "See the 'Memory of Scholomance'-header for proper instructions on how to do this.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "有关具体做法的说明，请参阅“通灵学院的记忆”标题。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				n(TREASURES, {
					o(403552, {	-- Eva's Femur
						["sourceQuests"] = { 76248 },	-- Eva Sarkhoff
						["groups"] = {
							i(206364),	-- Eva's Femur
						},
					}),
					o(403498, {	-- Eva's Journal
						["sourceQuests"] = { 76248 },	-- Eva Sarkhoff
						["groups"] = {
							i(206346, {	-- Eva's Journal
								["description"] = createLocalizationString({
									readable = "Use at 69.7, 71.7 outside the Scholomance Dungeon",
									constant = "USE_AT_69_7_71_7_OUTSIDE_THE_SCHOLOMANCE",
									export = true,
									text = {
										en = "Use at 69.7, 71.7 outside the Scholomance Dungeon",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "在通灵学院副本外的 69.7, 71.7 处使用",
										-- TODO: tw = "",
									},
								}),
							}),
						},
					}),
				}),
				n(206014, {	-- Eva Sarkhoff
					["provider"] = { "i", 88566 },	-- Krastinov's Bag of Horrors
					["questID"] = 76248,
					["groups"] = {
						i(206365),	-- Inert Spectral Essence
						hqt(76250, name(HEADERS.Item, 13544, {	-- Spectral Essence
							["cost"] = {
								{ "i", 20520, 3 },	-- 3x Dark Rune
								{ "i", 12808, 5 },	-- 5x Essence of Undeath
								{ "i", 206365, 1 },	-- 1x Inert Spectral Essence
							},
							-- ["lockCriteria"] = {},	-- cannot be triggered if Spectral Essence already in player inventory from Vanilla
							["groups"] = {
								i(13544),	-- Spectral Essence
							},
						})),
					},
				}),
			},
		})),
		-- #endif
		n(59613, {	-- Professor Slate <Potions Master>
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = bubbleDown({["ignoreBonus"] = true},{
				i(85580, {	-- Empty Polyformic Acid Vial
					["description"] = createLocalizationString({
						readable = "Use this at the table nearby to apply the appearance, or to store the appearance once applied.",
						constant = "USE_THIS_AT_THE_TABLE_NEARBY_TO_APPLY_THE",
						export = true,
						text = {
							en = "Use this at the table nearby to apply the appearance, or to store the appearance once applied.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在附近的桌子上使用此物以应用外观，或在应用后储存该外观。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(85589),	-- Nearly Full Vial of Polyformic Acid
						i(85592),	-- Half Full Vial of Polyformic Acid
						i(85593),	-- Nearly Empty Vial of Polyformic Acid
					},
				}),
			}),
		}),
		e(684, {	-- Darkmaster Gandling
			["creatureID"] = 59080,	-- Darkmaster Gandling
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				ach(645),	-- Scholomance
				ach(5054, {	-- Scholomance Guild Run
					["timeline"] = { ADDED_5_0_4 },
				}),
			},
		}),
	},
}));
-- #endif
table.insert(SCHOLOMANCE_GROUPS, d(DIFFICULTY.DUNGEON.NORMAL, {
	n(QUESTS, sharedData({["modID"] = 0},{
		q(28756, {	-- Aberrations of Bone
			["sourceQuest"] = 27464,	-- Argent Call: The Trial of the Crypt
			["qg"] = 49856,	-- Lord Raymond George
			["coord"] = { 76.1, 50.9, MAP.EASTERN_PLAGUELANDS },
			["maxReputation"] = { FACTION_ARGENT_DAWN, EXALTED },	-- Argent Dawn, Exalted.
			["timeline"] = { ADDED_4_0_3 },
			["repeatable"] = true,
			["lvl"] = lvlsquish(40, 40, 15),
			-- #if AFTER 10.1.5
			["description"] = createLocalizationString({
				readable = "Killing Rattlegore in Old Scholomance DOES NOT progress this quest.",
				constant = "KILLING_RATTLEGORE_IN_OLD_SCHOLOMANCE_DOES_NOT",
				export = true,
				text = {
					en = "Killing Rattlegore in Old Scholomance DOES NOT progress this quest.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在旧通灵学院杀死血骨傀儡不会推进此任务。",
					-- TODO: tw = "",
				},
			}),
			-- #endif
			["groups"] = {
				objective(1, {	-- 0/1 Rattlegore slain
					["provider"] = { "n", 59153 },	-- Rattlegore
				}),
			},
		}),
		q(31447, {	-- An End to the Suffering
			["qg"] = 64562,	-- Talking Skull
			["timeline"] = { ADDED_5_0_4 },
			["lvl"] = 38,
			["groups"] = {
				objective(1, {	-- 0/1 Darkmaster Gandling slain
					["provider"] = { "n", 59080 },	-- Darkmaster Gandling
				}),
			},
		}),
		q(31440, {	-- The Four Tomes
			["qg"] = 64562,	-- Talking Skull
			["timeline"] = { ADDED_5_0_4 },
			["lvl"] = 38,
		}),
	})),
	n(ZONE_DROPS, {
		i(16255, {	-- Formula: Enchant 2H Weapon - Major Spirit (RECIPE!)
			["cr"] = 58757,	-- Scholomance Acolyte
		}),
		i(18702),	-- Belt of the Ordained
		i(14536),	-- Bonebrace Hauberk
		i(18697),	-- Coldstone Slippers
		i(18699),	-- Icy Tomb Spaulders
		i(18701, {	-- Innervating Band
			["crs"] = {
				59614,	-- Bored Student
				58823,	-- Scholomance Neophyte
			},
		}),
		i(18700),	-- Malefic Bracers
		i(18698),	-- Tattered Leather Hood
	}),
	e(659, {	-- Instructor Chillheart
		["crs"] = {
			58633,	-- Instructor Chillheart
			58664,	-- Instructor Chillheart's Phylactery
		},
		["timeline"] = { ADDED_5_0_4 },
		["groups"] = {
			i(88339),	-- Gravetouch Greatsword
			i(88335),	-- Anarchist's Pendant
			i(88338),	-- Breastplate of Wracking Souls
			i(88337),	-- Shadow Puppet Bracers
			i(88336),	-- Icewrath Belt
		},
	}),
	e(663, {	-- Jandice Barov
		["creatureID"] = 59184,	-- Jandice Barov
		["timeline"] = { ADDED_5_0_4 },
		["groups"] = {
			i(88346),	-- Metanoia Shield
			i(88345),	-- Barovian Ritual Hood
			i(88349),	-- Phantasmal Drape
			i(88347),	-- Ghostwoven Legguards
			i(88348),	-- Wraithplate Treads
		},
	}),
	e(665, {	-- Rattlegore
		["creatureID"] = 59153,
		["timeline"] = { ADDED_5_0_4 },
		["groups"] = {
			i(88344),	-- Goresoaked Headreaper
			i(88341),	-- Necromantic Wand
			-- #if AFTER 7.3.0
			i(88357),	-- Vigorsteel Spaulders
			-- #endif
			i(88340),	-- Deadwalker Bracers
			i(88342),	-- Rattling Gloves
			i(88343),	-- Bone Golem Boots
		},
	}),
	e(666, {	-- Lilian Voss
		["creatureID"] = 58722,
		["timeline"] = { ADDED_5_0_4 },
		["groups"] = {
			i(88351),	-- Soulburner Crown
			i(88354),	-- Necklace of the Dark Blaze
			i(88352),	-- Shivbreaker Vest
			i(88353),	-- Dark Blaze Gauntlets
			i(88350),	-- Leggings of Unleashed Anguish
		},
	}),
	e(684, {	-- Darkmaster Gandling
		["creatureID"] = 59080,
		["timeline"] = { ADDED_5_0_4 },
		["groups"] = {
			i(88362),	-- Shoulderguards of Painful Lessons
			i(88357),	-- Vigorsteel Spaulders
			i(88361),	-- Gloves of Explosive Pain
			i(88356),	-- Tombstone Gauntlets
			i(88359),	-- Incineration Belt
			i(88358),	-- Lessons of the Darkmaster
			i(88360),	-- Price of Progress
			i(88355),	-- Searing Words
		},
	}),
}));
table.insert(SCHOLOMANCE_GROUPS, d(DIFFICULTY.DUNGEON.HEROIC, {
	["timeline"] = { ADDED_5_0_4 },
	["lvl"] = 90,
	["groups"] = {
		n(ACHIEVEMENTS, {
			ach(6715, {	-- Polyformic Acid Science
				["timeline"] = { ADDED_5_0_4 },
				["groups"] = sharedData({
					["cost"] = {
						{ "i", 85589, 1 },	-- Nearly Full Vial of Polyformic Acid
						{ "i", 85592, 1 },	-- Half Full Vial of Polyformic Acid
						{ "i", 85593, 1 },	-- Nearly Empty Vial of Polyformic Acid
					},
				},{
					crit(19603, {	-- Commander Ri'mok
						["_encounter"] = { 676, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(19605, {	-- Liu Flameheart
						["_encounter"] = { 658, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(19606, {	-- Gu Cloudstrike
						["_encounter"] = { 673, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(19609, {	-- Trial of the King
						["_encounter"] = { 708, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(19604, {	-- Vizier Jin'bak
						["_encounter"] = { 693, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(19608, {	-- Yan-Zhu the Uncasked
						["_encounter"] = { 670, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			ach(6396, {	-- Sanguinarian
				["crs"] = { 59368 },	-- Krastinovian Carver
			}),
		}),
		n(QUESTS, sharedData({["modID"] = 0},{
			q(31448, {	-- An End to the Suffering
				["qg"] = 64563,	-- Talking Skull
				["groups"] = {
					i(87379),	-- Runed Deathbone Chestplate
					i(87380),	-- Carver's Bloodspattered Chestpiece
					i(87381),	-- Coldforge Carapace
					i(87382),	-- Patchwork Flesh Armor
					i(87383),	-- Ghoulskin Vestments
					i(87384),	-- Darkmaster's Spare Robe
					i(87385),	-- Empowered Necropile Robe
					i(87386),	-- Inscribed Bloodmail Hauberk
					i(87387),	-- Foul Cadaverous Armor
				},
			}),
			q(31442, {	-- The Four Tomes
				["qg"] = 64563,	-- Talking Skull
			}),
		})),
		e(659, {	-- Instructor Chillheart
			["crs"] = {
				58633,	-- Instructor Chillheart
				58664,	-- Instructor Chillheart's Phylactery
			},
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				i(144201, {	-- Gravetouch Greatsword
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144180, {	-- Anarchist's Pendant
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(143967, {	-- Breastplate of Wracking Souls
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144200, {	-- Shadow Puppet Bracers
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144202, {	-- Icewrath Belt
					["timeline"] = { ADDED_7_1_5 },
				}),
				-- With Patch 7.1.5, Blizzard did a dumb and recreated all of the items from Heroic.
				i(82822, {	-- Gravetouch Greatsword
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(81566, {	-- Anarchist's Pendant
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82821, {	-- Breastplate of Wracking Souls
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82820, {	-- Shadow Puppet Bracers
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82823, {	-- Icewrath Belt
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
			},
		}),
		e(663, {	-- Jandice Barov
			["creatureID"] = 59184,	-- Jandice Barov
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				ach(6531),	-- Attention to Detail
				i(144207, {	-- Metanoia Shield
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144029, {	-- Barovian Ritual Hood
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144208, {	-- Phantasmal Drape
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144012, {	-- Ghostwoven Legguards
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144013, {	-- Wraithplate Treads
					["timeline"] = { ADDED_7_1_5 },
				}),
				-- With Patch 7.1.5, Blizzard did a dumb and recreated all of the items from Heroic.
				i(82847, {	-- Metanoia Shield
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82848, {	-- Barovian Ritual Hood
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82850, {	-- Phantasmal Drape
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82851, {	-- Ghostwoven Legguards
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82852, {	-- Wraithplate Treads
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
			},
		}),
		e(665, {	-- Rattlegore
			["creatureID"] = 59153,	-- Rattlegore
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				ach(6394),	-- Rattle No More
				i(144011, {	-- Bone Golem Boots
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144204, {	-- Deadwalker Bracers
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144203, {	-- Goresoaked Headreaper
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144205, {	-- Necromantic Wand
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144206, {	-- Rattling Gloves
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144015, {	-- Vigorsteel Spaulders
					["timeline"] = { ADDED_7_3_0 },
				}),
				-- With Patch 7.1.5, Blizzard did a dumb and recreated all of the items from Heroic.
				i(82824, {	-- Goresoaked Headreaper
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82826, {	-- Necromantic Wand
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82825, {	-- Deadwalker Bracers
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82827, {	-- Rattling Gloves
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82828, {	-- Bone Golem Boots
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
			},
		}),
		n(59369, {	-- Doctor Theolen Krastinov
			["description"] = createLocalizationString({
				readable = "This is a Rare Creature and, as such, is not always present.\nThe only way to find out if you will encounter him is right after Rattlegore is killed.\nHe will make his presence known...",
				constant = "THIS_IS_A_RARE_CREATURE_AND_AS_SUCH_IS_NOT_4",
				export = true,
				text = {
					en = "This is a Rare Creature and, as such, is not always present.\nThe only way to find out if you will encounter him is right after Rattlegore is killed.\nHe will make his presence known...",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "这是一种稀有生物，因此并不总是存在。\n只有在拉特戈尔被击杀后，你才能知道他是否会出现。\n他会让人知道他的存在……",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				i(88566, {	-- Krastinov's Bag of Horrors (TOY!)
					["timeline"] = { ADDED_5_0_4 },
				}),
			},
		}),
		e(666, {	-- Lilian Voss
			["creatureID"] = 58722,	-- Lilian Voss
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				i(144030, {	-- Soulburner Crown
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144181, {	-- Necklace of the Dark Blaze
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(143968, {	-- Shivbreaker Vest
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144209, {	-- Dark Blaze Gauntlets
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144014, {	-- Leggings of Unleashed Anguish
					["timeline"] = { ADDED_7_1_5 },
				}),
				-- With Patch 7.1.5, Blizzard did a dumb and recreated all of the items from Heroic.
				i(82853, {	-- Soulburner Crown
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(81567, {	-- Necklace of the Dark Blaze
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82855, {	-- Shivbreaker Vest
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82856, {	-- Dark Blaze Gauntlets
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82854, {	-- Leggings of Unleashed Anguish
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
			},
		}),
		e(684, {	-- Darkmaster Gandling
			["creatureID"] = 59080,	-- Darkmaster Gandling
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				ach(6762),	-- Heroic: Scholomance
				ach(6771),	-- Heroic: Scholomance Guild Run
				ach(6821),	-- School's Out Forever
				i(144211, {	-- Headmaster's Will
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144016, {	-- Shoulderguards of Painful Lessons
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144015, {	-- Vigorsteel Spaulders
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144212, {	-- Gloves of Explosive Pain
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144210, {	-- Tombstone Gauntlets
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144213, {	-- Incineration Belt
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144161, {	-- Lessons of the Darkmaster
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144159, {	-- Price of Progress
					["timeline"] = { ADDED_7_1_5 },
				}),
				i(144160, {	-- Searing Words
					["timeline"] = { ADDED_7_1_5 },
				}),
				-- With Patch 7.1.5, Blizzard did a dumb and recreated all of the items from Heroic.
				i(82859, {	-- Headmaster's Will
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82862, {	-- Shoulderguards of Painful Lessons
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82857, {	-- Vigorsteel Spaulders
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82860, {	-- Gloves of Explosive Pain
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82858, {	-- Tombstone Gauntlets
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(82861, {	-- Incineration Belt
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(81268, {	-- Lessons of the Darkmaster
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(81266, {	-- Price of Progress
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
				i(81267, {	-- Searing Words
					["timeline"] = { ADDED_5_0_4, REMOVED_7_1_5 },
				}),
			},
		}),
	},
}));
-- #if AFTER 5.0.4
table.insert(SCHOLOMANCE_GROUPS, d(DIFFICULTY.DUNGEON.CHALLENGE_MODE, bubbleDownSelf({ ["timeline"] = { ADDED_5_0_4, REMOVED_6_0_2 } }, {
	challengemaster(ach(8438, bubbleDownSelf({ ["timeline"] = { ADDED_5_4_0, REMOVED_6_0_2 } }, {	-- Challenge Master: Scholomance
		title(245),	-- Darkmaster <Name>
	}))),
	ach(6897),	-- Scholomance Challenger
	ach(6914),	-- Scholomance: Bronze
	ach(6915),	-- Scholomance: Silver
	ach(6916, {	-- Scholomance: Gold
		spell(131232),	-- Path of the Necromancer
	}),
	-- #if ANYCLASSIC
	ach(61974, {	-- Scholomance: Platinum
		i(265415),	-- Platinum Vial of Polyformic Acid
	}),
	-- #endif
})));
-- #endif
-- #endif

-- #if ANYCLASSIC
-- #if AFTER MOP
table.insert(SCHOLOMANCE_GROUPS, applyclassicphase(MOP_PHASE_ONE_CELESTIAL_DUNGEONS_MSV, n(CELESTIAL_DUNGEON_DIFFICULTY, {
		["OnInit"] = FUNCTION_TEMPLATES.OnInit.CELESTIAL_DUNGEON_DIFFICULTY_BUFFS,
		["timeline"] = { ADDED_5_5_0 },
		["groups"] = {
			e(684, {	-- Darkmaster Gandling
				["creatureID"] = 59080,	-- Darkmaster Gandling
				["groups"] = appendGroups(
				{
					ach(60899),	-- Celestial: Scholomance
				},
				-- #if BEFORE 5.5.3
				{	-- Season 1 Drops
					applyclassicphase(MOP_PHASE_ONE_CELESTIAL_DUNGEONS_HOF, i(86863)),	-- Scimitar of Seven Stars (HoF)
					applyclassicphase(MOP_PHASE_ONE_CELESTIAL_DUNGEONS_TOES, i(86893)),	-- Jin'ya, Orb of the Waterspeaker (Terrace)
					i(86782),	-- Arrow Breaking Windcloak
					i(89968),	-- Feng's Ring of Dreams
					i(86802),	-- Lei Shen's Final Orders
				},
				-- #elseif BEFORE 5.5.4
				applyclassicphase(MOP_PHASE_RISE_OF_THE_THUNDER_KING_CELESTIAL_DUNGEONS, {	-- Season 2 Drops
					i(95664),	-- Armplates of the Vanquished Abomination
					i(95665),	-- Bad Juju
					i(95772),	-- Cha-Ye's Essence of Brilliance
					i(95773),	-- Constantly Accelerating Cloak
					i(95718),	-- Cord of Cacophonous Cawing
					i(95690),	-- Crystal-Claw Gloves
					i(95862),	-- Darkwood Spiritstaff
					i(95966),	-- Deeproot Treads
					i(95636),	-- Fissure-Split Shoulderwraps
					i(95799),	-- Gaze of the Twins
					i(95746),	-- Iceshatter Gauntlets
					i(95638),	-- Jin'rokh's Dreamshard
					i(95663),	-- Legguards of Scintillating Scales
					i(95717),	-- Pinionfeather Greatcloak
					i(95719),	-- Robe of Midnight Down
					i(95637),	-- Robes of Static Bursts
					i(95744),	-- Sandals of the Starving Eye
					i(95691),	-- Shimmershell Cape
					i(95967),	-- Spiritbound Boots
					i(97129),	-- Tia-Tia, the Scything Star
					i(95798),	-- Tidal Force Treads
					i(95692),	-- Tortos' Discarded Shell
					i(95968),	-- Vaultwalker Sabatons
					i(95745),	-- Vein-Cover Bracers
					i(95861),	-- Zeeg's Ancient Kegsmasher
				}),
				-- #else
				applyclassicphase(MOP_PHASE_SIEGE_OF_ORGRIMMAR_CELESTIAL_DUNGEONS,{	-- Season 3 Drops
					i(105093),	-- Avool's Ancestral Bracers
					i(105075),	-- Black-Blooded Drape
					i(105066),	-- Blood Rage Bracers
					i(104913),	-- Bubble-Burst Bracers
					i(104958),	-- Bracers of Blind Hatred
					i(99678),	-- Chest of the Cursed Conqueror
					i(105156),	-- Chestplate of Fallen Passion
					i(105056),	-- Crown of Tragic Truth
					i(105147),	-- Curse of Hubris
					i(105030),	-- Damron's Belt of Darkness
					i(104931),	-- Death Lotus Crossbow
					i(99681),	-- Gauntlets of the Cursed Conqueror
					i(99667),	-- Gauntlets of the Cursed Protector
					i(99680),	-- Gauntlets of the Cursed Vanquisher
					i(105003),	-- Grips of Tidal Force
					i(99673),	-- Helm of the Cursed Protector
					i(104922),	-- Hood of Swirling Senses
					i(105138),	-- Kor'kron Elite Skullmask
					i(99675),	-- Leggings of the Cursed Conqueror
					i(99674),	-- Leggings of the Cursed Vanquisher
					i(105102),	-- Mogu Mindbender's Greaves
					i(105084),	-- Pandaren Roofsprinters
					i(105120),	-- Powder-Stained Totemic Treads
					i(104976),	-- Prismatic Prison of Pride
					i(105129),	-- Rik'kal's Bloody Scalpel
					i(104940),	-- Rook's Unlucky Talisman
					i(105021),	-- Shock Pulse Robes
					i(99668),	-- Shoulders of the Cursed Vanquisher
					i(104949),	-- Shoulderguards of Dark Meditations
					i(105048),	-- Shoulderplates of Gushing Geysers
					i(104985),	-- Swift Serpent Signet
					i(105111),	-- Thok's Tail Tip
					i(105039),	-- Toxic Tornado Treads
					i(104967),	-- Untainted Guardian's Chain
					i(105012),	-- Wall-Borer Bracers
				}),
				-- #endif
				{}),
			}),
		},
})));
-- #endif
-- #endif

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(246, {	-- Scholomance
		-- #if BEFORE MOP
		["lore"] = "The Scholomance is housed within a series of crypts that lie beneath the ruined keep of Caer Darrow. Once owned by the noble Barov family, Caer Darrow fell to ruin following the Second War. As the wizard Kel'thuzad enlisted followers for his Cult of the Damned he would often promise immortality in exchange for serving his Lich King. The Barov family fell to Kel'thuzad's charismatic influence and donated the keep and its crypts to the Scourge. The cultists then killed the Barovs and turned the ancient crypts into a school for necromancy known as the Scholomance. Though Kel'thuzad no longer resides in the crypts, devoted cultists and instructors still remain. The powerful lich, Ras Frostwhisper, rules over the site and guards it in the Scourge's name - while the mortal necromancer, Darkmaster Gandling, serves as the school's insidious headmaster.",
		-- #endif
		-- #if BEFORE MOP
		["zone-text-areaID"] = 2057,	-- TODO: Determine what expansion this gets its own (correct) mapID.
		-- #endif
		-- #if BEFORE 4.0.3
		["sourceQuests"] = {
			5505,	-- The Key to Scholomance [Alliance]
			5511,	-- The Key to Scholomance [Horde]
		},
		["cost"] = { { "i", 13704, 1 } },	-- Skeleton Key
		-- #endif
		["mapID"] = MAP.SCHOLOMANCE,
		["coord"] = { 69.07, 72.96, MAP.WESTERN_PLAGUELANDS },
		["lvl"] = 55,
		["groups"] = SCHOLOMANCE_GROUPS,
	}),
}));
