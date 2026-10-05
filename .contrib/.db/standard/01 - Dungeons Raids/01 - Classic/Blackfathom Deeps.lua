-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(227, {	-- Blackfathom Deeps
		-- #if BEFORE MOP
		["lore"] = "Situated along the Zoram Strand of Ashenvale, Blackfathom Deeps was once a glorious temple dedicated to the night elves' moon-goddess, Elune. However, the great Sundering shattered the temple - sinking it beneath the waves of the Veiled Sea. There it remained untouched - until, drawn by its ancient power - the naga and satyr emerged to plumb its secrets. Legends hold that the ancient beast, Aku'mai, has taken up residence within the temple's ruins. Aku'mai, a favored pet of the primordial Old Gods, has preyed upon the area ever since. Drawn to Aku'mai's presence, the cult known as the Twilight's Hammer has also come to bask in the Old Gods' evil presence.",
		-- #endif
		-- #if BEFORE CATA
		["zone-text-areaID"] = 719,	-- Blackfathom Deeps
		-- #endif
		-- #if AFTER CATA
		["coords"] = {
			{ 16.5, 11.0, ASHENVALE },
			{ 14.2, 14.0, ASHENVALE },	-- Cave entrance
		},
		-- #else
		["coord"] = { 14.0, 11.1, ASHENVALE },
		-- #endif
		["maps"] = { BLACKFATHOM_DEEPS, BLACKFATHOM_DEEPS_LEVEL2, BLACKFATHOM_DEEPS_LEVEL3 },
		-- #if SEASON_OF_DISCOVERY
		["sharedLockout"] = 1,
		["isRaid"] = true,
		-- #endif
		["lvl"] = lvlsquish(19, 19, 10),
		["groups"] = {
			n(ZONE_DROPS, {
				i(1454),	-- Axe of the Enforcer
				i(3414),	-- Crested Scepter
				i(3413),	-- Doomspike
				i(2567),	-- Evocator's Blade
				i(1481),	-- Grimclaw
				i(3416),	-- Martyr's Chain
				i(3417),	-- Onyx Claymore
				i(1491),	-- Ring of Precision
				i(2034),	-- Scholarly Robes
				i(2271),	-- Staff of the Blessed Seer
				i(3415),	-- Staff of the Friar
				i(1486),	-- Tree Bark Jacket
				-- #if AFTER 6.0.1.18322
				i(4410, {	-- Schematic: Shadow Goggles
					["cr"] = 74363,	-- Twilight Shadow
				}),
				-- #endif
			}),
			-- #if SEASON_OF_DISCOVERY
			-- In Season of Discovery, this version of the instance has been deprecated and removed in favor of the raid.
			d(DIFFICULTY.DUNGEON.NORMAL, bubbleDownTimelineEventSelf(REMOVED_1_15_0, {
			-- #endif
			n(QUESTS, {
				q(6564, {	-- Allegiance to the Old Gods (1/2)
					["description"] = "~L.FOR_THIS_TO_DROP_YOU_NEED_TO_BE_ON_THE_ESSENCE",
					["sourceQuest"] = 6563,	-- The Essence of Aku'Mai [Pre-CATA]
					["provider"] = { "i", 16790 },	-- Damp Note
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["cr"] = 4802,	-- Blackfathom Tide Priestess
					["lvl"] = 17,
				}),
				q(6565, {	-- Allegiance to the Old Gods (2/2)
					["sourceQuest"] = 6564,	-- Allegiance to the Old Gods (1/2)
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["coord"] = { 11.6, 34.3, ASHENVALE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 17,
					["groups"] = {
						objective(1, {	-- 0/1 Lorgus Jett slain
							["provider"] = { "n", 12902 },	-- Lorgus Jett
						}),
						i(17695, {	-- Chestnut Mantle
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(17694, {	-- Band of the Fist
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26891, {	-- Amongst the Ruins
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Fathom Core
							["provider"] = { "i", 16762 },	-- Fathom Core
						}),
					},
				}),
				q(908, {	-- Amongst the Ruins
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["coord"] = { 11.6, 34.3, ASHENVALE },
					["timeline"] = { REMOVED_1_2_4 },
					-- #if AFTER 1.2.4
					["description"] = createLocalizationString({
						readable = "This quest gets marked as completed when you complete the quest 'Amongst the Ruins' (6921).",
						constant = "THIS_QUEST_GETS_MARKED_AS_COMPLETED_WHEN_YOU_3",
						export = true,
						text = {
							en = "This quest gets marked as completed when you complete the quest 'Amongst the Ruins' (6921).",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "当你完成任务“废墟之中”（6921）时，此任务会被标记为已完成。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["races"] = HORDE_ONLY,
					["lvl"] = 21,
					["groups"] = {
						objective(1, {	-- 0/1 Fathom Core
							["provider"] = { "i", 16762 },	-- Fathom Core
						}),
					},
				}),
				q(6921, {	-- Amongst the Ruins
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["coord"] = { 11.6, 34.3, ASHENVALE },
					["timeline"] = { ADDED_1_2_4, REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 21,
					["groups"] = {
						objective(1, {	-- 0/1 Fathom Core
							["provider"] = { "i", 16762 },	-- Fathom Core
						}),
					},
				}),
				q(6922, {	-- Baron Aquanis
					["provider"] = { "i", 16782 },	-- Strange Water Globe
					["timeline"] = { REMOVED_6_0_2 },
					["maps"] = { ASHENVALE },
					["races"] = HORDE_ONLY,
					["lvl"] = 21,
					["groups"] = {
						i(16886, {	-- Outlaw Sabre
							["timeline"] = { REMOVED_6_0_2 },
						}),
						i(16887, {	-- Witch's Finger
							["timeline"] = { REMOVED_6_0_2 },
						}),
					},
				}),
				q(26894, {	-- Blackfathom Deeps (H)
					["qg"] = 34122,	-- Commander Grimfang
					["coord"] = { 12.1, 33.8, ASHENVALE },
					["timeline"] = { ADDED_4_0_3 },
					["races"] = HORDE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = lvlsquish(22, 22, 10),
				}),
				q(26897, {	-- Blackfathom Deeps (A)
					["qg"] = 3845,	-- Shindrell Swiftfire
					["coord"] = { 18.2, 20.4, ASHENVALE },
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = lvlsquish(22, 22, 10),
				}),
				q(26898, {	-- Blackfathom Deeps (A)
					["qg"] = 3691,	-- Raene Wolfrunner
					["coord"] = { 36.6, 49.6, ASHENVALE },
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = lvlsquish(22, 22, 10),
				}),
				q(1200, {	-- Blackfathom Villainy (A)
					["sourceQuest"] = 1198,	-- In Search of Thaelrid
					["qg"] = 4787,	-- Argent Guard Thaelrid <The Argent Dawn>
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { DARNASSUS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 18,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Kelris
							["provider"] = { "i", 5881 },	-- Head of Kelris
							["cr"] = 4832,	-- Twilight Lord Kelris
						}),
						i(7002, {	-- Arctic Buckler
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(7001, {	-- Gravestone Scepter
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26882, {	-- Blackfathom Villainy (A) [CATA]
					["sourceQuest"] = 26881,	-- In Search of Thaelrid
					["qg"] = 4787,	-- Scout Thaelrid
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Kelris
							["provider"] = { "i", 5881 },	-- Head of Kelris
							["cr"] = 4832,	-- Twilight Lord Kelris
						}),
						-- #if BEFORE 6.0.1.18322
						i(65986),	-- Shield Against the Evil Presence
						i(65962),	-- Thaelrid's Greaves
						i(65938),	-- Blackfathom Leggings
						i(65912),	-- Robe of Kelris
						-- #endif
					},
				}),
				q(6561, {	-- Blackfathom Villainy (H)
					["qg"] = 4787,	-- Argent Guard Thaelrid <The Argent Dawn>
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { THUNDER_BLUFF },
					["races"] = HORDE_ONLY,
					["lvl"] = 18,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Kelris
							["provider"] = { "i", 5881 },	-- Head of Kelris
							["cr"] = 4832,	-- Twilight Lord Kelris
						}),
						i(7002, {	-- Arctic Buckler
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(7001, {	-- Gravestone Scepter
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26892, {	-- Deep in the Deeps
					["qg"] = 44375,	-- Zeya
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Ghamoo-Ra slain
							["provider"] = { "n", 4887 },	-- Ghamoo-Ra
						}),
						objective(2, {	-- 0/1 Lady Sarevess slain
							["provider"] = { "n", 4831 },	-- Lady Sarevess
						}),
						objective(3, {	-- 0/1 Gelihast slain
							["provider"] = { "n", 6243 },	-- Gelihast
						}),
					},
				}),
				q(1198, {	-- In Search of Thaelrid
					-- #if AFTER TBC
					["races"] = ALLIANCE_ONLY,
					-- #else
					["description"] = "~L.THIS_QUEST_IS_ALSO_AVAILABLE_TO_HORDE_THOUGH",
					-- #endif
					["qg"] = 4786,	-- Dawnwatcher Shaedlass <The Argent Dawn>
					["coord"] = { 28.7, 52.1, DARNASSUS },
					["timeline"] = { REMOVED_4_0_3 },
					["isBreadcrumb"] = true,
					["lvl"] = 18,
				}),
				q(26881, {	-- In Search of Thaelrid [CATA]
					["qg"] = 33256,	-- Ashelan Northwood
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(971, {	-- Knowledge in the Deeps
					["sourceQuest"] = 968,	-- The Powers Below
					["qg"] = 2786,	-- Gerrig Bonegrip
					["coord"] = { 50.8, 5.6, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 Lorgalis Manuscript
							["providers"] = {
								{ "i", 5359 },	-- Lorgalis Manuscript
								{ "o", 13949 },	-- Pitted Iron Chest
							},
							["description"] = "~L.GUARDED_BY_A_FEW_NAGA_IN_THE_UNDERWATER_ROOM",
						}),
						-- #if BEFORE 4.0.3
						i(6743, {	-- Sustaining Ring
							["timeline"] = { REMOVED_6_0_2 },
						}),
						-- #endif
					},
				}),
				q(26885, {	-- Knowledge in the Deeps [CATA]
					["qg"] = 33261,	-- Sentinel-trainee Issara
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 Lorgalis Manuscript
							["providers"] = {
								{ "i", 5359 },	-- Lorgalis Manuscript
								{ "o", 13949 },	-- Pitted Iron Chest
							},
							["description"] = "~L.GUARDED_BY_A_FEW_NAGA_IN_THE_UNDERWATER_ROOM",
						}),
						i(56660, {	-- Dusk-Stained Cloak
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56658, {	-- Eventide Bow
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56659, {	-- Gloaming Band
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(6743, {	-- Sustaining Ring
							["timeline"] = { REMOVED_6_0_2 },
						}),
					},
				}),
				q(26888, {	-- Nightmare of the Deeps (H) [CATA]
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Aku'mai slain
							["provider"] = { "n", 4829 },	-- Aku'mai
						}),
						-- #if BEFORE 6.0.1.18322
						i(66030),	-- Plates of Aku'mai
						i(66039),	-- Shield Against the Evil Presence
						i(66021),	-- Blackfathom Leggings
						i(66012),	-- Je'neu's Robes
						-- #endif
					},
				}),
				q(1275, {	-- Researching the Corruption
					["sourceQuest"] = 3765,	-- The Corruption Abroad
					["qg"] = 8997,	-- Gershala Nightwhisper
					["coord"] = { 38.3, 43.0, DARKSHORE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 18,
					["groups"] = {
						objective(1, {	-- 0/8 Corrupted Brain Stem
							["provider"] = { "i", 5952 },	-- Corrupted Brain Stem
							["crs"] = {
								4807,	-- Blackfathom Myrmidon
								4803,	-- Blackfathom Oracle
								4805,	-- Blackfathom Sea Witch
								4802,	-- Blackfathom Tide Priestess
								4799,	-- Fallenroot Hellcaller
								4789,	-- Fallenroot Rogue
								4788,	-- Fallenroot Satyr
								4798,	-- Fallenroot Shadowstalker
								4831,	-- Lady Sarevess
							},
						}),
						i(7003, {	-- Beetle Clasps
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(7004, {	-- Prelacy Cape
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26884, {	-- Researching the Corruption [CATA]
					["qg"] = 33258,	-- Relwyn Shadestar
					["coord"] = { 38.3, 43.0, DARKSHORE },
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/8 Corrupted Brain Stem
							["provider"] = { "i", 5952 },	-- Corrupted Brain Stem
						}),
						i(56682, {	-- Band of the Skull Crusher
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56679, {	-- Dissector
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56681, {	-- Searching Wand
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56680, {	-- Shadestar Mace
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
					},
				}),
				-- #if NOT SEASON_OF_DISCOVERY
				q(3765, {	-- The Corruption Abroad
					["qg"] = 4984,	-- Argos Nightwhisper
					["coords"] = {
						-- #if AFTER WRATH
						{ 36.2, 67.6, STORMWIND_CITY },
						-- #else
						{ 21.6, 55.6, STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { DARKSHORE },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				-- #endif
				q(26899, {	-- The Enemy of My Enemy (H) [CATA]
					["qg"] = 44387,	-- Flaming Eradicator
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Kelris
							["provider"] = { "i", 5881 },	-- Head of Kelris
							["cr"] = 4832,	-- Twilight Lord Kelris
						}),
					},
				}),
				q(6563, {	-- The Essence of Aku'Mai [Pre-CATA]
					["sourceQuest"] = 6562,	-- Trouble in the Deeps
					["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
					["coord"] = { 11.6, 34.3, ASHENVALE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 17,
					["groups"] = {
						objective(1, {	-- 0/20 Sapphire of Aku'Mai
							["providers"] = {
								{ "i",  16784 },	-- Sapphire of Aku'Mai
								{ "o", 178184 },	-- Sapphire of Aku'Mai
								{ "o", 178185 },	-- Sapphire of Aku'Mai
								{ "o", 178186 },	-- Sapphire of Aku'Mai
							},
						}),
					},
				}),
				q(34672, {	-- The Rise of Aku'mai (A)
					["qg"] = 75606,	-- Sentinel Aluwyn
					["timeline"] = { ADDED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(20, 20, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Aku'mai the Devourer slain
							["provider"] = { "n", 75155 },	-- Aku'mai the Devourer <Terror from the Deep>
						}),
						i(65986),	-- Shield Against the Evil Presence
						i(65962),	-- Thaelrid's Greaves
						i(65938),	-- Blackfathom Leggings
						i(65912),	-- Robe of Kelris
						i(131713, {	-- Scales of Aku'mai
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(34673, {	-- The Rise of Aku'mai (H)
					["qg"] = 74409,	-- Zeya
					["timeline"] = { ADDED_6_0_2 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(20, 20, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Aku'mai the Devourer slain
							["provider"] = { "n", 75155 },	-- Aku'mai the Devourer <Terror from the Deep>
						}),
						i(66030),	-- Plates of Aku'mai
						i(66039),	-- Shield Against the Evil Presence
						i(66021),	-- Blackfathom Leggings
						i(66012),	-- Je'neu's Robes
						i(131714, {	-- Blackfathom Chain Leggings
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(6562, {	-- Trouble in the Deeps
					["qg"] = 11862,	-- Tsunaman
					["coord"] = { 47.3, 64.4, STONETALON_MOUNTAINS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { ASHENVALE },
					["races"] = HORDE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 17,
				}),
				q(1199, {	-- Twilight Falls
					["qg"] = 4784,	-- Argent Guard Manados <The Argent Dawn>
					["coord"] = { 38.3, 43.0, DARNASSUS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/10 Twilight Pendant
							["provider"] = { "i", 5879 },	-- Twilight Pendant
							["crs"] = {
								4809,	-- Twilight Acolyte
								4811,	-- Twilight Aquamancer
								4814,	-- Twilight Elementalist
								4812,	-- Twilight Loreseeker
								4810,	-- Twilight Reaver
								4813,	-- Twilight Shadowmage
							},
						}),
						i(7000, {	-- Heartwood Girdle
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(6998, {	-- Nimbus Boots
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26883, {	-- Twilight Falls [CATA]
					["qg"] = 33260,	-- Sentinel Aluwyn
					["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/10 Twilight Pendant
							["provider"] = { "i", 5879 },	-- Twilight Pendant
						}),
						i(56697, {	-- Blackfathom Mace
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56698, {	-- Gift of the Enigmatic Tree
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(56699, {	-- Aluwyn's Legguards
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(7000, {	-- Heartwood Girdle
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
						i(6998, {	-- Nimbus Boots
							["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
						}),
					},
				}),
			}),
			n(TREASURES, {
				o(19018, {	-- Giant Clam
					i(2143),	-- Cuirboulli Boots (confirmed - Danny Donkey)
					i(5500),	-- Iridescent Pearl
					i(5504),	-- Tangy Clam Meat
				}),
			}),
			n(4887, {	-- Ghamoo-ra
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					i(6907),	-- Tortoise Armor
					i(6908),	-- Ghamoo-ra's Bind
				},
				-- #endif
			}),
			n(4831, {	-- Lady Sarevess
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					i(11121),	-- Darkwater Talwar
					i(3078),	-- Naga Heartpiercer
					i(888),	-- Naga Battle Gloves
				},
				-- #endif
			}),
			o(177964, {	-- Fathom Stone
				["description"] = "~L.IN_THE_WATER_BELOW_THE_TWILIGHT_BRIDGE_WARNING",
				["sourceQuests"] = {
					-- #if AFTER 4.0.3
					26891,	-- Amongst the Ruins
					-- #else
					6921,	-- Amongst the Ruins
					-- #endif
				},
				["timeline"] = { REMOVED_6_0_2 },
				["races"] = HORDE_ONLY,
				["groups"] = {
					i(16762, {	-- Fathom Core
						["timeline"] = { REMOVED_6_0_2 },
					}),
					n(12876, {	-- Baron Aquanis
						["description"] = "~L.THIS_BOSS_CAN_ONLY_BE_SUMMONED_BY_HORDE_PLAYERS",
						["timeline"] = { REMOVED_6_0_2 },
						["groups"] = {
							i(16782, {	-- Strange Water Globe
								["timeline"] = { REMOVED_6_0_2 },
							}),
						},
					}),
				},
			}),
			n(6243, {	-- Gelihast
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					i(6906),	-- Algae Fists
					i(1470),	-- Murloc Skin Bag
					i(6905),	-- Reef Axe
				},
				-- #endif
			}),
			n(4830, {	-- Old Serra'kis
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					i(6904),	-- Bite of Serra'kis
					i(6902),	-- Bands of Serra'kis
					i(6901),	-- Glowing Thresher Cape
				},
				-- #endif
			}),
			n(4832, {	-- Twilight Lord Kelris
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					i(1155),	-- Rod of the Sleepwalker
					i(6903),	-- Gaze Dreamer Pants
				},
				-- #endif
			}),
			n(4829, {	-- Aku'mai
				["timeline"] = { REMOVED_6_0_2 },
				-- #if BEFORE 6.0.1.18322
				["groups"] = {
					ach(632),	-- Blackfathom Deeps
					ach(5041, {	-- Blackfathom Deeps Guild Run
						["timeline"] = { ADDED_4_0_3, REMOVED_6_0_2 },
					}),
					i(6909),	-- Strike of the Hydra
					i(6911),	-- Moss Cinch
					i(6910),	-- Leech Pants
				},
				-- #endif
			}),
			e(368, {	-- Ghamoo-Ra
				["creatureID"] = 74446,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(151433, {	-- Thick Shellplate Shoulders
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(6907),	-- Tortoise Armor
					i(6908),	-- Ghamoo-Ra's Bind
					i(151432, {	-- Twilight Turtleskin Leggings
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(436, {	-- Domina <Mistress of Shadows>
				["creatureID"] = 74476,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(11121),	-- Darkwater Talwar
					i(3078),	-- Naga Heartpiercer
					i(132554, {	-- Deadly Serpentine Grips
						["timeline"] = { ADDED_7_0_3 },
					}),
					i(888),	-- Naga Battle Gloves
					i(151435, {	-- Domina's Deathmaw Greaves
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151434, {	-- Foul Shadowsleet Slippers
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(426, {	-- Subjugator Kor'ul
				["creatureID"] = 74565,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(6906),	-- Algae Fists
					i(151436, {	-- Murloc Oppressor's Band
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(1470),	-- Murloc Skin Bag
					i(6905),	-- Reef Axe
				},
			}),
			e(1145, {	-- Thruk
				["creatureID"] = 74505,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(120164, {	-- Thruk's Heavy Duty Fishing Pole
						["timeline"] = { ADDED_6_0_2 },
					}),
					i(120165, {	-- Thruk's Fillet Knife
						["timeline"] = { ADDED_6_0_2 },
					}),
					i(120163, {	-- Thruk's Fishing Rod
						["timeline"] = { ADDED_6_0_2 },
					}),
					i(151437, {	-- Hook Charm Necklace
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(447, {	-- Guardian of the Deep
				["crs"] = {
					75410,	-- Guardian of the Deep [Netted by Thruk]
					74508,	-- Guardian of the Deep [Fight location]
				},
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(6904),	-- Bite of Serra'kis
					i(132555, {	-- Serra'kis Scale Wraps
						["timeline"] = { ADDED_7_0_3 },
					}),
					i(6902),	-- Bands of Serra'kis
					i(6901),	-- Glowing Thresher Cape
				},
			}),
			e(1144, {	-- Executioner Gore
				["creatureID"] = 74988,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(120167, {	-- Bloody Twilight Cloak
						["timeline"] = { ADDED_6_0_2 },
					}),
					i(120166, {	-- Gorestained Garb
						["timeline"] = { ADDED_6_0_2 },
					}),
				},
			}),
			e(437, {	-- Twilight Lord Bathiel
				["creatureID"] = 74728,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					i(1155),	-- Rod of the Sleepwalker
					i(151440, {	-- Blackfathom Ascendant's Helm
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151439, {	-- Bathiel's Scale Spaulders
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(6903),	-- Gaze Dreamer Pants
					i(151438, {	-- Hungering Deepwater Treads
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(444, {	-- Aku'mai
				["creatureID"] = 75408,
				["timeline"] = { ADDED_6_0_2 },
				["groups"] = {
					ach(632),	-- Blackfathom Deeps
					ach(5041, {	-- Blackfathom Deeps Guild Run
						["timeline"] = { ADDED_6_0_2 },
					}),
					i(6909),	-- Strike of the Hydra
					i(6911),	-- Moss Cinch
					i(132553, {	-- Algae-Twined Waistcord
						["timeline"] = { ADDED_7_0_3 },
					}),
					i(6910),	-- Leech Pants
					i(151441, {	-- Aku'mai Worshipper's Greatboots
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			})),
			applyclassicphase(SOD_PHASE_ONE, d(DIFFICULTY.SOD.PLAYER10, bubbleDownSelf({ ["timeline"] = { ADDED_1_15_0, REMOVED_2_0_1 }, }, {
				["description"] = createLocalizationString({
					readable = "This instance was converted from a normal difficulty dungeon into a 10-player raid instance.",
					constant = "THIS_INSTANCE_WAS_CONVERTED_FROM_A_NORMAL_2",
					export = true,
					text = {
						en = "This instance was converted from a normal difficulty dungeon into a 10-player raid instance.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "该副本已从普通难度地下城转换为 10 人团队副本。",
						-- TODO: tw = "",
					},
				}),
				["lvl"] = 25,
				["groups"] = {
					n(QUESTS, {
						q(78927, {	-- Allegiance to the Old Gods
							["qg"] = 12736,	-- Je'neu Sancrea <The Earthen Ring>
							["coord"] = { 11.6, 34.3, ASHENVALE },
							["races"] = HORDE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/1 Lorgus Jett slain
									["provider"] = { "n", 12902 },	-- Lorgus Jett
								}),
								i(211467),	-- Band of the Iron Fist
								i(211468),	-- Frayed Chestnut Mantle
							},
						}),
						q(79099, {	-- Baron Aquanis (A)
							["description"] = createLocalizationString({
								readable = "PROTIP: Completing this quest gives you a portal to BFD!",
								constant = "PROTIP_COMPLETING_THIS_QUEST_GIVES_YOU_A_PORTAL",
								export = true,
								text = {
									en = "PROTIP: Completing this quest gives you a portal to BFD!",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "小提示：完成此任务会给你一个通往黑暗深渊的传送门！",
									-- TODO: tw = "",
								},
							}),
							["qg"] = 214876,	-- Davius Voidstar
							["coord"] = { 36.8, 43.6, DARKSHORE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/1 Strange Water Globe
									["provider"] = { "i", 211818 },	-- Strange Water Globe
									["cr"] = 202699,	-- Baron Aquanis
								}),
							},
						}),
						q(78920, {	-- Baron Aquanis (H)
							["providers"] = {
								{ "i", 211454 },	-- Strange Water Globe
								{ "n",  12736 },	-- Je'neu Sancrea <The Earthen Ring>
							},
							["coord"] = { 11.6, 34.2, ASHENVALE },
							["races"] = HORDE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								i(16886, {	-- Outlaw Sabre
									["timeline"] = { REMOVED_2_0_1 },
								}),
								i(16887, {	-- Witch's Finger
									["timeline"] = { REMOVED_2_0_1 },
								}),
							},
						}),
						q(78921, {	-- Blackfathom Villainy (A)
							["qg"] = 4787,	-- Argent Guard Thaelrid <The Argent Dawn>
							["maps"] = { DARNASSUS },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/1 Head of Kelris
									["provider"] = { "i", 5881 },	-- Head of Kelris
									["cr"] = 209678,	-- Twilight Lord Kelris
								}),
								i(211460),	-- Ancient Arctic Buckler
								i(211461),	-- Inscribed Gravestone Scepter
							},
						}),
						q(78922, {	-- Blackfathom Villainy (H)
							["qg"] = 4787,	-- Argent Guard Thaelrid <The Argent Dawn>
							["maps"] = { THUNDER_BLUFF },
							["races"] = HORDE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/1 Head of Kelris
									["provider"] = { "i", 5881 },	-- Head of Kelris
									["cr"] = 209678,	-- Twilight Lord Kelris
								}),
								i(211460),	-- Ancient Arctic Buckler
								i(211461),	-- Inscribed Gravestone Scepter
							},
						}),
						q(78923, {	-- Knowledge in the Deeps
							["qg"] = 2786,	-- Gerrig Bonegrip
							["coord"] = { 50.8, 5.6, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/1 Lorgalis Manuscript
									["providers"] = {
										{ "i", 5359 },	-- Lorgalis Manuscript
										{ "o", 13949 },	-- Pitted Iron Chest
									},
									["description"] = "~L.GUARDED_BY_A_FEW_NAGA_IN_THE_UNDERWATER_ROOM",
								}),
								i(211462),	-- Ever-Sustaining Ring
							},
						}),
						q(78926, {	-- Researching the Corruption
							["sourceQuest"] = 3765,	-- The Corruption Abroad
							["qg"] = 8997,	-- Gershala Nightwhisper
							["coord"] = { 38.3, 43.0, DARKSHORE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/8 Corrupted Brain Stem
									["provider"] = { "i", 5952 },	-- Corrupted Brain Stem
									["crs"] = {
										4807,	-- Blackfathom Myrmidon
										4803,	-- Blackfathom Oracle
										4805,	-- Blackfathom Sea Witch
										4802,	-- Blackfathom Tide Priestess
										4799,	-- Fallenroot Hellcaller
										4789,	-- Fallenroot Rogue
										4788,	-- Fallenroot Satyr
										4798,	-- Fallenroot Shadowstalker
										4831,	-- Lady Sarevess
										216660,	-- Fallenroot Rogue
										204645,	-- Blackfathom Elite
										216662,	-- Blackfathom Oracle
										216659,	-- Fallenroot Satyr
										216661,	-- Blackfathom Tide Priestess
									},
								}),
								i(211463),	-- Chittering Beetle Clasps
								i(211464),	-- Worn Prelacy Cape
							},
						}),
						q(3765, {	-- The Corruption Abroad
							["qg"] = 4984,	-- Argos Nightwhisper
							["coords"] = {
								-- #if AFTER WRATH
								{ 36.2, 67.6, STORMWIND_CITY },
								-- #else
								{ 21.6, 55.6, STORMWIND_CITY },
								-- #endif
							},
							["timeline"] = { REMOVED_4_0_3 },
							["maps"] = { DARKSHORE },
							["races"] = ALLIANCE_ONLY,
							["isBreadcrumb"] = true,
							["lvl"] = 20,
						}),
						q(78916, {	-- The Heart of the Void (A)
							["providers"] = {
								{ "i", 209693 },	-- Perfect Blackfathom Pearl
								{ "n", 215367 },	-- Dawnwatcher Selgorm <The Argent Dawn>
							},
							["coord"] = { 56.0, 24.5, DARNASSUS },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								i(211451),	-- Acolyte's Void Pearl
								i(211449),	-- Avenger's Void Pearl
								i(211450),	-- Invoker's Void Pearl
							},
						}),
						q(78917, {	-- The Heart of the Void (H)
							["providers"] = {
								{ "i", 211452 },	-- Perfect Blackfathom Pearl
								{ "n",   9087 },	-- Bashana Runetotem
							},
							["coord"] = { 70.8, 33.8, THUNDER_BLUFF },
							["races"] = HORDE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								i(211451),	-- Acolyte's Void Pearl
								i(211449),	-- Avenger's Void Pearl
								i(211450),	-- Invoker's Void Pearl
							},
						}),
						q(78925, {	-- Twilight Falls
							["qg"] = 4784,	-- Argent Guard Manados <The Argent Dawn>
							["coord"] = { 38.3, 43.0, DARNASSUS },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 25,
							["groups"] = {
								objective(1, {	-- 0/10 Twilight Pendant
									["provider"] = { "i", 5879 },	-- Twilight Pendant
									["crs"] = {
										4809,	-- Twilight Acolyte
										4811,	-- Twilight Aquamancer
										4814,	-- Twilight Elementalist
										4812,	-- Twilight Loreseeker
										4810,	-- Twilight Reaver
										4813,	-- Twilight Shadowmage
									},
								}),
								i(211466),	-- Tender's Heartwood Girdle
								i(211465),	-- Nimbus Boots of Insight
							},
						}),
					}),
					n(PROFESSIONS, {
						n(212159, {	-- Old Serra'kis <The Devoured>
							["sourceQuest"] = 78907,	-- Speak to the Dead
							["OnUpdate"] = [[_.OnUpdateDB.SOD_FOR_CRAFTER]],
							["groups"] = {
								i(211419),	-- Handful of Shifting Scales
							},
						}),
						o(411358, {	-- Artisan's Chest
							["provider"] = { "i", 211420 },	-- Shifting Scale Talisman
							["sourceQuest"] = 78909,	-- Shifting Scale Talisman
							["timeline"] = { REMOVED_2_0_1 },
							["OnUpdate"] = [[_.OnUpdateDB.SOD_FOR_CRAFTER]],
							["groups"] = {
								i(211421),	-- The Box
							},
						}),
					}),
					n(TREASURES, {
						["description"] = createLocalizationString({
							readable = "After dealing with Aku'mai, you can head back to Lady Sarevess' cave and delve deeper, now that the waterfall is gone. At the very end of the cave, you will be able to loot the recipes from a table.",
							constant = "AFTER_DEALING_WITH_AKU_MAI_YOU_CAN_HEAD_BACK_TO",
							export = true,
							text = {
								en = "After dealing with Aku'mai, you can head back to Lady Sarevess' cave and delve deeper, now that the waterfall is gone. At the very end of the cave, you will be able to loot the recipes from a table.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "解决阿库麦尔之后，你可以回到萨利维丝女士的洞穴并继续深入，此时瀑布已经消失。在洞穴的最深处，你可以从一张桌子上拾取配方。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(211849, {	-- Formula: Blackfathom Mana Oil
								["provider"] = { "o", 415614 },	-- Mysterious Formulae
							}),
							i(211846, {	-- Blackfathom Sharpening Stone
								["provider"] = { "o", 415614 },	-- Mysterious Formulae
							}),
						},
					}),
					n(COMMON_BOSS_DROPS, {
						["description"] = createLocalizationString({
							readable = "The Twilight armor sets can drop from any of the last 4 bosses.",
							constant = "THE_TWILIGHT_ARMOR_SETS_CAN_DROP_FROM_ANY_OF",
							export = true,
							text = {
								en = "The Twilight armor sets can drop from any of the last 4 bosses.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "暮光护甲套装可以从最后 4 个首领中的任意一个掉落。",
								-- TODO: tw = "",
							},
						}),
						["crs"] = {
							204921,	-- Gelihast
							207356,	-- Lorgus Jett
							209678,	-- Twilight Lord Kelris
							213334,	-- Aku'mai
						},
						["groups"] = {
							i(211505),	-- Twilight Avenger's Helm
							i(211504),	-- Twilight Avenger's Chain
							i(211506),	-- Twilight Avenger's Boots
							i(211507),	-- Twilight Elementalist's Cowl
							i(211509),	-- Twilight Elementalist's Robe
							i(211508),	-- Twilight Elementalist's Footpads
							i(209683),	-- Twilight Invoker's Shawl
							i(209671),	-- Twilight Invoker's Robes
							i(209669),	-- Twilight Invoker's Shoes
							i(211510),	-- Twilight Slayer's Cowl
							i(211512),	-- Twilight Slayer's Tunic
							i(211511),	-- Twilight Slayer's Footpads
						},
					}),
					n(202699, {	-- Baron Aquanis
						["description"] = createLocalizationString({
							readable = "Baron Aquanis sits stationary atop three broken platforms, and raid members must dodge his mechanics to avoid being thrown into the water and possibly aggroing extra enemies - Bubble Beam knocks enemies in front of him, and Depth Charge knocks back anyone close to the target! In addition to this, players must jump through platforms to avoid Torrential Downpour damage.",
							constant = "BARON_AQUANIS_SITS_STATIONARY_ATOP_THREE_BROKEN",
							export = true,
							text = {
								en = "Baron Aquanis sits stationary atop three broken platforms, and raid members must dodge his mechanics to avoid being thrown into the water and possibly aggroing extra enemies - Bubble Beam knocks enemies in front of him, and Depth Charge knocks back anyone close to the target! In addition to this, players must jump through platforms to avoid Torrential Downpour damage.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "阿奎尼斯男爵静止不动地坐在三个破碎的平台上方，团队成员必须躲避他的机制，以免被抛入水中并可能引到额外的敌人——气泡射线会击退他前方的敌人，深水炸弹会击退目标附近的所有人！除此之外，玩家还必须跳过平台以躲避倾盆暴雨的伤害。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(211454, {	-- Strange Water Globe
								["races"] = HORDE_ONLY,
							}),
							i(204807),	-- Fathomblade
							i(209590),	-- Cracked Water Globe
							i(209825),	-- Droplet Choker
							i(209422),	-- High Tide Choker
							i(209423),	-- Flowing Scarf
							i(209676),	-- Shoulderguards of Crushing Depths
							i(209828),	-- Sub-Zero Pauldrons
							i(204804),	-- Hydraxian Bangles
							i(211852),	-- Handwraps of Befouled Water
							i(209421),	-- Cord of Aquanis
							i(209677),	-- Loop of Swift Currents
						},
					}),
					n(201722, {	-- Ghamoo-ra
						["description"] = createLocalizationString({
							readable = "Ghamoo-ra patrols around an island and requires clearing around the area before being engageed. In the fight itself, tanks must taunt swap to avoid massive stacks of Crunch Armor, while other members of the raid must deal with Ghamoo-ra's shield, Aqua Shell - Deal damage to break it. Once Aqua Shell is broken, DPS the turtle down while dealing with massive raid-wide damage!",
							constant = "GHAMOO_RA_PATROLS_AROUND_AN_ISLAND_AND_REQUIRES",
							export = true,
							text = {
								en = "Ghamoo-ra patrols around an island and requires clearing around the area before being engageed. In the fight itself, tanks must taunt swap to avoid massive stacks of Crunch Armor, while other members of the raid must deal with Ghamoo-ra's shield, Aqua Shell - Deal damage to break it. Once Aqua Shell is broken, DPS the turtle down while dealing with massive raid-wide damage!",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "加穆拉绕着岛屿巡逻，需要先清理周围区域才能开战。战斗本身，坦克必须嘲讽换位，以避免碾压护甲叠加过高；团队其他成员则要应对加穆拉的护盾——水甲壳，通过造成伤害将其打破。一旦水甲壳被打破，就在应对大量全团伤害的同时集火击杀这只乌龟！",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209436),	-- Chipped Bite of Serra'kis
							i(209830),	-- Ironhide Arbalest
							i(209424),	-- Shell Plate Barrier
							i(209523),	-- Shimmering Thresher Cape
							i(209678),	-- Mantle of the Thresher Slayer
							i(209824),	-- Shimmering Shoulderpads
							i(209418),	-- Adamantine Tortoise Armor
							i(209675),	-- Clamweave Tunic
							i(209524),	-- Bindings of Serra'kis
							i(209432),	-- Ghamoo-ra's Cinch
						},
					}),
					n(204068, {	-- Lady Sarevess
						["description"] = createLocalizationString({
							readable = "Lady Sarevess is accompanied by a tanky Blackfathom Elite that needs to be off-tanked. The main mechanic players must deal with is Freezing Arrow, in which a player is randomly targetted by an arrow that leaves a frost patch that the off-tank can move the Blackfathom Elite to stun it for a short duration. In addition to this, spread out to not chain Forked Lightning damage!",
							constant = "LADY_SAREVESS_IS_ACCOMPANIED_BY_A_TANKY",
							export = true,
							text = {
								en = "Lady Sarevess is accompanied by a tanky Blackfathom Elite that needs to be off-tanked. The main mechanic players must deal with is Freezing Arrow, in which a player is randomly targetted by an arrow that leaves a frost patch that the off-tank can move the Blackfathom Elite to stun it for a short duration. In addition to this, spread out to not chain Forked Lightning damage!",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "萨莉维丝女士身边有一只耐打的黑暗深渊精英，需要由副坦克拉住。玩家必须应对的主要机制是冰冻之箭：一名玩家会被随机选中并被箭矢标记，留下一片冰霜区域，副坦克可以把黑暗深渊精英拉过去，将其短暂昏迷。除此之外，请分散站位，以免叉状闪电的伤害连锁！",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209564),	-- Guardian's Trident
							i(209525),	-- Honed Darkwater Talwar
							i(209563),	-- Naga Heartrender
							i(209822),	-- Strength of Purpose
							i(211789),	-- Artemis Cowl
							i(211843),	-- Mask of Scorn
							i(211842),	-- Rakkamar's Tattered Thinking Cap
							i(209680),	-- Waterproof Scarf
							i(209679),	-- Azshari Novice's Shoulderpads
							i(209527),	-- Naga Battle Gauntlets
							i(209566),	-- Leggings of the Faithful
							i(209565),	-- Band of Deep Places
							i(209823),	-- Signet of Beasts
						},
					}),
					n(204921, {	-- Gelihast
						["description"] = createLocalizationString({
							readable = "Gelihast has a quite dangerous curse with Curse of Blackfathom, so you must have ways to decurse it off. The raid must avoid getting hit by Shadow Crash while the tanks taunt swap to prevent reaching high stacks of Shadow Strike. Healers can also dispel the random Fear he throws at people.\n\nThe big mechanic happens once the boss reaches 10% - March of the Murlocs will begin, spawning dozens of murlocs that players must dodge while the boss heals himself and throws more Shadow Crashes. Once fully healed, the fight starts again, with Gelihast summoning low-health Blackfathom Tendril that must be killed. Gelihast will heal himself to full twice with March of the Murlocs before finally dying.",
							constant = "GELIHAST_HAS_A_QUITE_DANGEROUS_CURSE_WITH_CURSE",
							export = true,
							text = {
								en = "Gelihast has a quite dangerous curse with Curse of Blackfathom, so you must have ways to decurse it off. The raid must avoid getting hit by Shadow Crash while the tanks taunt swap to prevent reaching high stacks of Shadow Strike. Healers can also dispel the random Fear he throws at people.\n\nThe big mechanic happens once the boss reaches 10% - March of the Murlocs will begin, spawning dozens of murlocs that players must dodge while the boss heals himself and throws more Shadow Crashes. Once fully healed, the fight starts again, with Gelihast summoning low-health Blackfathom Tendril that must be killed. Gelihast will heal himself to full twice with March of the Murlocs before finally dying.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "格里哈斯特拥有一个相当危险的诅咒——黑暗深渊的诅咒，所以你必须具备解除诅咒的手段。团队必须避免被暗影冲撞击中，同时坦克要嘲讽换位，以防止暗影打击叠加过高。治疗者也可以驱散他随机向玩家投掷的恐惧效果。\n\n当首领的生命值降至 10% 时，关键机制便会触发——鱼人大军开始，生成数十只鱼人，玩家必须一边躲避它们，一边应对首领自我治疗并投掷更多暗影冲撞。完全治愈后，战斗会重新开始，格里哈斯特会召唤生命值很低的黑暗深渊触须，必须将其击杀。格里哈斯特会借助鱼人大军将自身治疗至满血两次，之后才会最终死亡。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209567),	-- Coral Reef Axe
							i(209571),	-- Deadlight
							i(209559),	-- Twilight Sage's Walking Stick
							i(209573),	-- Wrathful Spire
							i(209570),	-- Tome of Cavern Lore
							i(209820),	-- Black Shroud Choker
							i(209568),	-- Algae Gauntlets
							i(209572),	-- Black Boiled Leathers
							i(209569),	-- Murloc Hide Kneeboots
							i(209670),	-- Skinwalkers
							i(209821),	-- Ring of Shadowsight
							i(209681),	-- Black Murloc Egg
							i(211491),	-- Bottomless Murloc Skin Bag
						},
					}),
					n(207356, {	-- Lorgus Jett
						["description"] = createLocalizationString({
							readable = "Lorgus Jett can be found behind a gauntlet of Naga and Murlocs that must be dealt with before engaging the boss itself. Lorgus Jett himself has 3 totems he will use - One totem is spawned every 10 seconds in a set order. You can simply ignore two out of the three totems and DPS Lorgus Jett:\n\n    Corrupted Windfury Totem - Ignore and tank through his enhanced attacks;\n    Corrupted Lightning Shield Totem - Kill this totem immediately once it spawns;\n    Corrupted Molten Fury Totem - Ignore this totem and dodge the molten boulders it spawns.",
							constant = "LORGUS_JETT_CAN_BE_FOUND_BEHIND_A_GAUNTLET_OF",
							export = true,
							text = {
								en = "Lorgus Jett can be found behind a gauntlet of Naga and Murlocs that must be dealt with before engaging the boss itself. Lorgus Jett himself has 3 totems he will use - One totem is spawned every 10 seconds in a set order. You can simply ignore two out of the three totems and DPS Lorgus Jett:\n\n    Corrupted Windfury Totem - Ignore and tank through his enhanced attacks;\n    Corrupted Lightning Shield Totem - Kill this totem immediately once it spawns;\n    Corrupted Molten Fury Totem - Ignore this totem and dodge the molten boulders it spawns.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "洛古斯·杰特位于一群纳迦和鱼人之后，必须先清理掉他们才能与首领本身交战。洛古斯·杰特自身会使用 3 个图腾——每 10 秒按固定顺序刷新一个图腾。你可以直接无视三个图腾中的两个，专心输出洛古斯·杰特：\n\n    腐化的风怒图腾 - 无视它，硬扛他增强后的攻击；\n    腐化的闪电之盾图腾 - 它一刷新就立刻击杀；\n    腐化的熔岩之怒图腾 - 无视这个图腾，并躲开它刷出的熔岩巨石。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209579),	-- Crashing Thunder
							i(209577),	-- Fist of the Wild
							i(209560),	-- Hammer of Righteous Judgement
							i(209818),	-- Sun-Touched Crescent
							i(209682),	-- Sturdy Hood
							i(209578),	-- Glowing Leather Bands
							i(209581),	-- Silver Hand Sabatons
							i(209575),	-- Carved Driftwood Icon
							i(209574),	-- Discarded Tenets of the Silver Hand
							i(209576),	-- Mind-Expanding Mushroom
						},
					}),
					n(209678, {	-- Twilight Lord Kelris
						["description"] = createLocalizationString({
							readable = "Kelris is a two-phase fight with Phase 1 starting on pull and Phase 2 starting at 35%, so DPS must hold their big cooldowns until Kelris enters Phase 2. Through the fight, players must dodge Shadow Crashes and interrupt Shadowy Chains (priority) and Mind Blast.\n\nThe main difficult in the fight is the Dream Realm mechanic - Every so often, the two closest players to Kelris will be put to Sleep, being sent to a Dream Realm in which they need to kill neutral Phantasmal Priestesses for a chance to spawn a portal to be sent back to reality. After 30 seconds in the Dream Phase, the Priestesses will become aggressive and attack the two players on the Dream Realm. If possible, avoid using casters to go to the Dream Realm, as the Priestesses have high magical resistance.\n\nOnce Kelris reaches 35%, Phase 2 will start - Kelris will no longer send players to the Dream Realm, but will deal increased damage, in addition to his previous interruptible spells now being immune to interrupts. Save your resources and spread around the room to burn the boss down!",
							constant = "KELRIS_IS_A_TWO_PHASE_FIGHT_WITH_PHASE_1",
							export = true,
							text = {
								en = "Kelris is a two-phase fight with Phase 1 starting on pull and Phase 2 starting at 35%, so DPS must hold their big cooldowns until Kelris enters Phase 2. Through the fight, players must dodge Shadow Crashes and interrupt Shadowy Chains (priority) and Mind Blast.\n\nThe main difficult in the fight is the Dream Realm mechanic - Every so often, the two closest players to Kelris will be put to Sleep, being sent to a Dream Realm in which they need to kill neutral Phantasmal Priestesses for a chance to spawn a portal to be sent back to reality. After 30 seconds in the Dream Phase, the Priestesses will become aggressive and attack the two players on the Dream Realm. If possible, avoid using casters to go to the Dream Realm, as the Priestesses have high magical resistance.\n\nOnce Kelris reaches 35%, Phase 2 will start - Kelris will no longer send players to the Dream Realm, but will deal increased damage, in addition to his previous interruptible spells now being immune to interrupts. Save your resources and spread around the room to burn the boss down!",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "凯尔里斯是一场分为两个阶段的战斗，第一阶段从开怪时开始，第二阶段在 35% 时开始，因此输出职业必须把大招留到凯尔里斯进入第二阶段。整场战斗中，玩家必须躲避暗影冲撞，并打断暗影锁链（优先）和心灵震爆。\n\n这场战斗的主要难点在于梦境领域机制——每隔一段时间，离凯尔里斯最近的两名玩家会被催眠，送入梦境领域，他们需要在其中击杀中立状态的幻影女祭司，以有机会生成一个传送门被送回现实。在梦境阶段持续 30 秒后，女祭司们会变得具有攻击性，攻击身处梦境领域的两名玩家。如果可能的话，避免让施法者进入梦境领域，因为女祭司具有很高的魔法抗性。\n\n当凯尔里斯达到 35% 时，第二阶段开始——凯尔里斯不再把玩家送入梦境领域，但会造成更高的伤害，此外他之前可被中断的法术现在免疫打断。留好你的资源，分散在房间各处，全力输出首领！",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209561),	-- Rod of the Ancient Sleepwalker
							i(209694),	-- Blackfathom Ritual Dagger
							i(209674),	-- Phoenix Ignition
							i(211458),	-- Tome of Shadow Warding
							i(209673),	-- Glowing Fetish Amulet
							i(209686),	-- Jagged Bone Necklace
							i(209817),	-- Voidwalker Brooch
							i(209672),	-- Black Fingerless Gloves
							i(211455),	-- Slick Fingerless Gloves
							i(211457),	-- Twilight Defender's Girdle
							i(209667),	-- Gaze Dreamer Leggings
							i(209668),	-- Signet of the Twilight Lord
							i(209816),	-- Fetish of Mischief
							i(211492),	-- Kelris's Satchel
						},
					}),
					n(213334, {	-- Aku'mai
						["description"] = createLocalizationString({
							readable = "Once engaged, all raid members should stay close to Aku'mai at all times, to easily dodge the Corrosive Blast cones. Getting hit by this gives a stack of Corrosion. Tanks will naturally be affected with Corrosion over time, and once they reach 3-4 stacks of Corrosion, they must drag themselves and the boss to one of the four Cleansing Pool scattered across the room - Cleansing themselves and generating adds that must be killed.\n\nOnce Aku'mai hits 50%, he will enter Phase 2 by casting Dark Protection becoming big and voidlike. His abilities remain mostly the same, but now deal Shadow damage instead of Nature. The main difference is that Corrosion becomes Shadow Seep, and tanks must taunt swap to avoid getting high stacks of the debuff. It is possible to cleanse these the same way as you did Corrosion in Phase 1, but it is largely unnecessary if your DPS is good.",
							constant = "ONCE_ENGAGED_ALL_RAID_MEMBERS_SHOULD_STAY_CLOSE",
							export = true,
							text = {
								en = "Once engaged, all raid members should stay close to Aku'mai at all times, to easily dodge the Corrosive Blast cones. Getting hit by this gives a stack of Corrosion. Tanks will naturally be affected with Corrosion over time, and once they reach 3-4 stacks of Corrosion, they must drag themselves and the boss to one of the four Cleansing Pool scattered across the room - Cleansing themselves and generating adds that must be killed.\n\nOnce Aku'mai hits 50%, he will enter Phase 2 by casting Dark Protection becoming big and voidlike. His abilities remain mostly the same, but now deal Shadow damage instead of Nature. The main difference is that Corrosion becomes Shadow Seep, and tanks must taunt swap to avoid getting high stacks of the debuff. It is possible to cleanse these the same way as you did Corrosion in Phase 1, but it is largely unnecessary if your DPS is good.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "开战后，所有团队成员都应始终紧贴阿库麦尔，以便轻松躲开腐蚀冲击的锥形范围。被其命中会叠加一层腐蚀。坦克会随着时间自然积累腐蚀，一旦叠加到 3-4 层，就必须把自己和首领拉到散布在房间四周的四个净化水池之一——净化自身并产生需要击杀的小怪。\n\n当阿库麦尔的生命值降至 50% 时，他会施放黑暗庇护进入第二阶段，变得巨大而带有虚空形态。他的技能基本不变，但造成的伤害由自然改为暗影。最主要的区别是腐蚀变为暗影渗透，坦克必须通过嘲讽交接来避免叠加过多层数。也可以用第一阶段净化腐蚀的同样方式净化它，但如果你们的输出足够，则基本没有必要。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(209693),	-- Perfect Blackfathom Pearl
							i(211452),	-- Perfect Blackfathom Pearl
							i(211456),	-- Dagger of Willing Sacrifice
							i(209562),	-- Deadly Strike of the Hydra
							i(209691),	-- Vampiric Boot Knife
							i(209534),	-- Azshari Arbalest
							i(209688),	-- Bael Modan Blunderbuss
							i(209580),	-- Gusting Wind
							i(209690),	-- Shadowscale Coif
							i(209692),	-- Sentinel Pauldrons
							i(209687),	-- Hydra Hide Cuirass
							i(209685),	-- Ancient Moss Cinch
							i(209684),	-- Soul Leech Pants
							i(209689),	-- Crabshell Waders
						},
					}),
				},
			}))),
			-- #endif
		},
	}),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_2 } }, {
	inst(227, {
		q(35929),	-- Blackfathom Deeps Reward Quest - Normal completion
		q(35930),	-- Blackfathom Deeps (Bonus) Reward Quest
	}),
})));
