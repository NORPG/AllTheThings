---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
local PVP_MOUNT_COST = {
	{ "i", 20560, 30 },	-- Alterac Valley Mark of Honor
	{ "i", 20559, 30 },	-- Arathi Basin Mark of Honor
	{ "i", 20558, 30 },	-- Warsong Gulch Mark of Honor
};

root(ROOTS.Zones, m(MAP.EASTERN_KINGDOMS, {
	m(MAP.STORMWIND_CITY, {
		["lore"] = "Stormwind City is the capital city of the Alliance. It is located in the northwestern part of Elwynn Forest.\n\nDuring the First War, the Kingdom of Azeroth, including its capital, Stormwind Keep, was utterly destroyed by the Horde and its survivors fled to Lordaeron. After the orcs were defeated at the Dark Portal at the end of the Second War, it was decided that the city would be rebuilt. The nobles of Stormwind assembled a team of the most skilled and ingenious stonemasons and architects they could find--which later turned sour and led to the rise of the Defias.\n\nWith the fall of the northern kingdoms, Stormwind is by far the most populated city in the world. It serves in many ways as the cultural and trade center of the Alliance, even with remote access to the sea. It is home to the Academy of Arcane Sciences, the only wizarding school in Eastern Kingdoms, as well as SI:7, a rogue intelligence organization.",
		["zone-text-areas"] = {
			1519,	-- Stormwind City
			2918,	-- Champions' Hall
		},
		["icon"] = 255130,
		["isRaid"] = true,
		["groups"] = {
			n(FACTIONS, {
				faction(FACTION_STORMWIND, {	-- Stormwind
					["icon"] = 236447,
					["OnTooltip"] = [[_.OnTooltipDB.RuneclothTurnIns]],
					["races"] = ALLIANCE_ONLY,
				}),
			}),
			n(FLIGHT_PATHS, {
				fp(2, {	-- Stormwind City, Elwynn
					["cr"] = 352,	-- Dungar Longdrink <Gryphon Master>
					["coord"] = { 71.0, 72.5, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
				}),
			}),
			n(PROFESSIONS, {
				prof(ALCHEMY, {
					n(5499, {	-- Lilyssia Nightbreeze <Alchemy Trainer>
						["coord"] = { 55.6, 85.8, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_ALCHEMY,
					}),
				}),
				prof(BLACKSMITHING, {
					n(5511, {	-- Therum Deepforge <Expert Blacksmith>
						["coord"] = { 63.8, 37.6, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_BLACKSMITHING,
					}),
				}),
				prof(COOKING, {
					n(5482, {	-- Stephen Ryback <Cooking Trainer>
						["coord"] = { 78.2, 53.0, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_COOKING,
					}),
				}),
				prof(ENCHANTING, {
					n(1317, {	-- Lucan Cordell <Enchanting Trainer>
						["coord"] = { 53.0, 74.2, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_ENCHANTING,
					}),
				}),
				prof(ENGINEERING, {
					n(5518, {	-- Lilliam Sparkspindle <Engineering Trainer>
						["coord"] = { 62.2, 30.6, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_ENGINEERING,
					}),
				}),
				prof(FIRST_AID, {
					n(2327, {	-- Shaina Fuller <First Aid Trainer>
						["coord"] = { 52.8, 44.8, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_FIRST_AID,
					}),
				}),
				prof(FISHING, {
					n(5493, {	-- Arnold Leland <Fishing Trainer>
						["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_FISHING,
					}),
				}),
				prof(HERBALISM, {
					n(5566, {	-- Tannysa <Herbalism Trainer>
						["coord"] = { 44.8, 77.0, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_HERBALISM,
					}),
				}),
				prof(LEATHERWORKING, {
					n(5564, {	-- Simon Tanner <Expert Leatherworker>
						["coord"] = { 71.8, 62.8, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_LEGION_LEATHERWORKING,
					}),
				}),
				prof(MINING, {
					n(5513, {	-- Gelman Stonehand <Mining Trainer>
						["coord"] = { 59.2, 37.6, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_MINING,
					}),
				}),
				prof(POISONS, {
					n(13283, {	-- Lord Tony Romano <Rogue Trainer>
						["coord"] = { 80.2, 68.8, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_POISONS,
					}),
				}),
				prof(SKINNING, {
					n(1292, {	-- Maris Granger <Skinning Trainer>
						["coord"] = { 72.6, 62.0, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_CATA_SKINNING,
					}),
				}),
				prof(TAILORING, {
					n(1346, {	-- Georgio Bolero <Tailoring Trainer>
						["coord"] = { 53.2, 81.6, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = CLASSIC_TAILORING,
					}),
					n(9584, {	-- Jalane Ayrole <Master Shadoweave Tailor>
						["coord"] = { 40.6, 83.8, MAP.STORMWIND_CITY },
						["races"] = ALLIANCE_ONLY,
						["groups"] = SHADOWEAVE_TAILORING_CLASSIC,
					}),
				}),
			}),
			n(QUESTS, {
				q(7794, {	-- A Donation of Mageweave
					["qg"] = 14722,	-- Clavicus Knavingham <Alliance Cloth Quartermaster>
					["coords"] = {
						-- #if AFTER WRATH
						{ 53.9, 81.7, MAP.STORMWIND_CITY },
						-- #else
						{ 44.2, 73.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["cost"] = {{ "i", 4338, 60 }},	-- Mageweave Cloth
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 40,
				}),
				q(7795, {	-- A Donation of Runecloth
					["qg"] = 14722,	-- Clavicus Knavingham <Alliance Cloth Quartermaster>
					["coords"] = {
						-- #if AFTER WRATH
						{ 53.9, 81.7, MAP.STORMWIND_CITY },
						-- #else
						{ 44.2, 73.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 14047, 60 } },	-- Runecloth
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(7793, {	-- A Donation of Silk
					["qg"] = 14722,	-- Clavicus Knavingham <Alliance Cloth Quartermaster>
					["coords"] = {
						-- #if AFTER WRATH
						{ 53.9, 81.7, MAP.STORMWIND_CITY },
						-- #else
						{ 44.2, 73.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 4306, 60 } },	-- Silk Cloth
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 26,
				}),
				q(7791, {	-- A Donation of Wool
					["qg"] = 14722,	-- Clavicus Knavingham <Alliance Cloth Quartermaster>
					["coords"] = {
						-- #if AFTER WRATH
						{ 53.9, 81.7, MAP.STORMWIND_CITY },
						-- #else
						{ 44.2, 73.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 2592, 60 } },	-- Wool Cloth
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 12,
				}),
				q(26190, {	-- A Fisherman's Feast
					["qg"] = 42288,	-- Robby Flay
					["coords"] = {
						-- #if AFTER 9.2.5
						{ 50.7, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 50.6, 71.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = COOKING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/5 Gigantic Catfish
							["providers"] = {
								{ "i",  57245 },	-- Gigantic Catfish
								{ "o", 203800 },	-- Barrel of Canal Fish
							},
							["coord"] = { 56.8, 41.2, MAP.STORMWIND_CITY },
						}),
						COOKING_AWARD,
					},
				}),
				q(46275, {	-- A Kingdom's Heart
					["sourceQuest"] = 46274,	-- Consoling the King
					["qg"] = 119357,	-- Anduin Wrynn
					["coord"] = { 49.8, 45.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_2_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(5645, {	-- A Lack of Fear
					["altQuests"] = {
						5647,	-- A Lack of Fear [Darnassus]
						5641,	-- A Lack of Fear [Ironforge]
					},
					["qg"] = 376,	-- High Priestess Laurena <Priest Trainer>
					["coord"] = { 38.8, 26.4, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_3_0 },
					["maps"] = { MAP.IRONFORGE },
					["classes"] = { PRIEST },
					["races"] = { DWARF },
					["lvl"] = 20,
					-- #if BEFORE 2.3.0
					["groups"] = {
						recipe(6346),	-- Fear Ward
					},
					-- #endif
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_TWO, q(79940, {	-- A Lost Brother
					["sourceQuest"] = 79939,	-- The Broken Hammer
					["qg"] = 5492,	-- Katherine the Pure <Paladin Trainer>
					["coord"] = { 37.8, 31.6, MAP.STORMWIND_CITY },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 26,
					["groups"] = {
						objective(1, {	-- Speak with Katherine and Learn More
							["provider"] = { "n", 5492 },	-- Katherine the Pure <Paladin Trainer>
						}),
					},
				})),
				-- #endif
				q(212, {	-- A Meal Served Cold
					["qg"] = 1141,	-- Angus Stern
					["coords"] = {
						-- #if AFTER WRATH
						{ 51.8, 93.7, MAP.STORMWIND_CITY },
						-- #else
						{ 41.4, 89.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.STRANGLETHORN_VALE },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 35,
					["groups"] = {
						objective(1, {	-- 0/1 Chilled Basilisk Haunch
							["provider"] = { "i", 2476 },	-- Chilled Basilisk Haunch
							["cr"] = 690,	-- Cold Eye Basilisk
						}),
					},
				}),
				q(335, {	-- A Noble Brew (1/2)
					["qg"] = 1435,	-- Zardeth of the Black Claw
					["coords"] = {
						-- #if AFTER WRATH
						{ 40.1, 85.3, MAP.STORMWIND_CITY },
						-- #else
						{ 26.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DUSKWOOD, MAP.WETLANDS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 25,
					["groups"] = {
						objective(1, {	-- 0/1 Tear of Tilloa
							["providers"] = {
								{ "i", 2779 },	-- Tear of Tilloa
								{ "o", 321 },	-- Tear of Tilloa
							},
							["coord"] = { 78.5, 36.0, MAP.DUSKWOOD },
						}),
						objective(2, {	-- 0/1 Musquash Root
							["providers"] = {
								{ "i", 2784 },	-- Musquash Root
								{ "o", 2084 },	-- Musquash Root
							},
							["coord"] = { 64.7, 75.5, MAP.WETLANDS },
						}),
					},
				}),
				q(336, {	-- A Noble Brew (2/2)
					["sourceQuest"] = 335,	-- A Noble Brew (1/2)
					["providers"] = {
						{ "n", 1435 },	-- Zardeth of the Black Claw
						{ "i", 2788 },	-- Black Claw Stout
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 40.1, 85.3, MAP.STORMWIND_CITY },
						-- #else
						{ 26.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 25,
				}),
				q(62250, {	-- A New Adventure Awaits
					["description"] = "This quest is automatically offered upon reaching the specified level while in Chromie Time.",
					["timeline"] = { CREATED_9_0_2, ADDED_10_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", 61 },	-- either level or some HQT probably locks this... good luck
					["groups"] = {
						i(183185),	-- Chromie's Scroll (A) (QI!)
					},
				}),
				q(47202, {	-- A Personal Message
					["sourceQuest"] = 46275,	-- A Kingdom's Heart
					["qg"] = 120268,	-- Anduin Wrynn
					["coord"] = { 85.9, 34.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_2_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(25154, {	-- A Present for Lila
					["qg"] = 50480,	-- Isabel Jones
					["coord"] = { 63.8, 61.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = JEWELCRAFTING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = JEWELCRAFTING_AWARD_GROUPS,
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(78090, {	-- A Second Opinion
					["sourceQuest"] = 78089,	-- Advice From Stormwind
					["providers"] = {
						{ "n",   5492 },	-- Katherine the Pure <Paladin Trainer>
						{ "i", 209748 },	-- Althalaxx Orb
					},
					["coord"] = { 37.4, 32.0, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["classes"] = { PALADIN },
				})),
				-- #endif
				q(27106, {	-- A Villain Unmasked
					["sourceQuest"] = 27092,	-- Cataclysm in the Catacombs
					["provider"] = { "o", 205198 },	-- Pile of Explosives
					["coord"] = { 50.4, 42.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(63919, {	-- Corruption-Seeking Chestguard
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63918, {	-- Detective's Shoulderplates
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63920, {	-- Treads of Revelation
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63921, {	-- Truth-Seeker Belt
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63917, {	-- Truthbreaker Shield
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
					},
				}),
				q(1638, {	-- A Warrior's Training
					["altQuests"] = {
						1684,	-- Elanaria
						1679,	-- Muren Stormpike
						1678,	-- Vejrek
						-- #if AFTER TBC
						9582,	-- Strength of One
						-- #endif
					},
					["qgs"] = {
						913,	-- Lyria Du Lac <Warrior Trainer>
						5480,	-- Ilsa Corbin <Warrior Trainer>
					},
					["coords"] = {
						{ 41.0, 65.8, MAP.ELWYNN_FOREST },
						-- #if AFTER WRATH
						{ 80.4, 59.8, MAP.STORMWIND_CITY },
						-- #else
						{ 78.6, 45.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 10,
				}),
				q(44473, {	-- A Weapon of the Alliance
					["sourceQuest"] = 44463,	-- Demons Among Them
					["qg"] = 100973,	-- Anduin Wrynn
					["coord"] = { 85.6, 31.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["classes"] = { DEMONHUNTER },
					["races"] = ALLIANCE_ONLY,
				}),
				q(7796, {	-- Additional Runecloth [Stormwind]
					["sourceQuest"] = 7795,	-- A Donation of Runecloth
					["qg"] = 14722,	-- Clavicus Knavingham <Alliance Cloth Quartermaster>
					["coords"] = {
						-- #if AFTER WRATH
						{ 53.9, 81.7, MAP.STORMWIND_CITY },
						-- #else
						{ 44.2, 73.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["maxReputation"] = { FACTION_STORMWIND, EXALTED },	-- Stormwind, Exalted.
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 14047, 20 } },	-- Runecloth
					["races"] = ALLIANCE_ONLY,
					["repeatable"] = true,
					["lvl"] = 50,
				}),
				q(396, {	-- An Audience with the King
					["sourceQuest"] = 395,	-- Brotherhood's End
					["providers"] = {
						{ "n", 1646 },	-- Baros Alexston <City Architect>
						{ "i", 2956 },	-- Report on the Defias Brotherhood
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 57.7, 47.9, MAP.STORMWIND_CITY },
						-- #else
						{ 49.0, 30.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
					["groups"] = {
						i(2933, {	-- Seal of Wrynn
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(58496, {	-- An Unwelcome Advisor
					["description"] = "This quest is automatically offered.",
					["provider"] = { "o", 369893 },	-- Urgent Missive
					["coord"] = { 68.1, 22.4, BORALUS },	-- Urgent Missive
					["timeline"] = { ADDED_8_3_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(7643, {	-- Ancient Equine Spirit
					["sourceQuest"] = 7642,	-- Collection of Goods
					["providers"] = {
						{ "n", 928 },	-- Lord Grayson Shadowbreaker <Paladin Trainer>
						{ "i", 18753 },	-- Arcanite Barding
						{ "n", 14566 },	-- Ancient Equine Spirit
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DIRE_MAUL, MAP.HILLSBRAD_FOOTHILLS },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
					["groups"] = {
						q(7645, {	-- Ancient Equine Spirit
							["qg"] = 2357,	-- Merideth Carlson <Horse Breeder>
							["coord"] = { 52.0, 55.6, MAP.HILLSBRAD_FOOTHILLS },
							["timeline"] = { REMOVED_4_0_3 },
							["cost"] = {
								{ "i", 13724, 20 },	-- Enriched Manna Biscuit
								{ "g", 500000 },	-- 50g
							},
							["repeatable"] = true,
							["groups"] = {
								objective(1, {	-- 0/1 Manna-Enriched Horse Feed
									["questID"] = 7643,	-- Ancient Equine Spirit
									["provider"] = { "i", 18775 },	-- Manna-Enriched Horse Feed
								}),
							},
						}),
					},
				}),
				-- #if ANYCLASSIC
				q(5676, {	-- Arcane Feedback [Stormwind City]
					["altQuests"] = {
						5677,	-- Arcane Feedback [Ironforge]
						5678,	-- Arcane Feedback [Darnassus]
					},
					["qgs"] = {
						11406,	-- High Priest Rohan <Priest Trainer>
						376,	-- High Priestess Laurena <Priest Trainer>
						11401,	-- Priestess Alathea <Priest Trainer>
					},
					["coords"] = {
						{ 26.4, 7.6, MAP.IRONFORGE },
						{ 38.8, 26.6, MAP.STORMWIND_CITY },
						{ 40.0, 80.0, MAP.DARNASSUS },
					},
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = { HUMAN },
					["classes"] = { PRIEST },
					["lvl"] = 20,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 13896,	-- Feedback (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				-- #endif
				-- #if NOT ANYCLASSIC
				q(5676, {	-- Arcane Feedback [Stormwind City]
					["altQuests"] = {
						5677,	-- Arcane Feedback [Ironforge]
						5678,	-- Arcane Feedback [Darnassus]
					},
					["qg"] = 376,	-- High Priestess Laurena <Priest Trainer>
					["coord"] = { 38.8, 26.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = { HUMAN },
					["classes"] = { PRIEST },
					["lvl"] = 20,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 13896,	-- Feedback (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				-- #endif
				q(1942, {	-- Astral Knot Garment
					["sourceQuest"] = 1940,	-- Pristine Spider Silk
					["qg"] = 1309,	-- Wynne Larson <Robe Merchant>
					["coords"] = {
						-- #if AFTER WRATH
						{ 52.0, 83.6, MAP.STORMWIND_CITY },
						-- #else
						{ 41.8, 76.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { MAGE },
					["lvl"] = 26,
					["groups"] = {
						i(9516, {	-- Astral Knot Blouse
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(7511, {	-- Astral Knot Robe
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(1639, {	-- Bartleby the Drunk
					["sourceQuests"] = {
						1638,	-- A Warrior's Training
						1684,	-- Elanaria
						1679,	-- Muren Stormpike
						-- #if AFTER TBC
						9582,	-- Strength of One
						-- #endif
					},
					["qg"] = 6089,	-- Harry Burlguard
					["coords"] = {
						-- #if AFTER WRATH
						{ 77.1, 53.3, MAP.STORMWIND_CITY },
						-- #else
						{ 74.0, 37.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARRIOR },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
				}),
				q(1665, {	-- Bartleby's Mug
					["sourceQuest"] = 1640,	-- Beat Bartleby
					["altQuests"] = {
						-- 1665,	-- Bartleby's Mug
						-- #if AFTER TBC
						9582,	-- Strength of One
						-- #endif
						1678,	-- Vejrek
						1683,	-- Vorlus Vilehoof
					},
					["providers"] = {
						{ "n", 6090 },	-- Bartleby
						{ "i", 6781 },	-- Bartleby's Mug
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 76.8, 52.5, MAP.STORMWIND_CITY },
						-- #else
						{ 73.8, 36.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 10,
					-- #if BEFORE CATA
					["groups"] = {
						recipe(71),	-- Defensive Stance
						-- recipe(7386),	-- Sunder Armor	[TODO: Users are reporting they can't collect this.]
						recipe(355),	-- Taunt
					},
					-- #endif
				}),
				q(53370, {	-- Battle for Azeroth: Hour of Reckoning [SL+] / Hour of Reckoning
					["description"] = "If this quest is not automatically offered, you can try picking it up from a War Board, or taking the boat from Stormwind to Boralus.",
					["qg"] = 144095,	-- Master Mathias Shaw
					["timeline"] = { ADDED_8_0_1, REMOVED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(163542, {	-- Footman's Warmace
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163541, {	-- Longbow of the Hunt
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163539, {	-- Spear of the Hunt
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163537, {	-- Footman's Warhammer
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163534, {	-- Warmage's Spellblade
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163526, {	-- Footman's Handaxe
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163540, {	-- Footman's Boot Knife
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163538, {	-- Footman's Gladius
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163536, {	-- Warmage's Spire
							["timeline"] = { ADDED_8_0_1 },
						}),
						i(163533, {	-- Footman's Cleaver
							["timeline"] = { ADDED_8_0_1 },
						}),
					},
				}),
				q(46727, {	-- Battle for Azeroth: Tides of War (BfA version)
					["qgs"] = {
						142930,	-- Halford Wyrmbane
						-- #if AFTER 9.0.2
						49748,	-- Hero's Herald
						-- #endif
					},
					["coords"] = {
						{ 27.6, 21.2, MAP.STORMWIND_CITY },	-- Halford Wyrmbane
						{ 62.3, 30.3, MAP.STORMWIND_CITY },	-- Hero's Herald
						{ 63.2, 71.4, MAP.STORMWIND_CITY },	-- Hero's Herald
						{ 45.2, 50.2, MAP.DARNASSUS },	-- Hero's Herald
					},
					["timeline"] = { ADDED_8_0_1 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(1640, {	-- Beat Bartleby
					["sourceQuest"] = 1639,	-- Bartleby the Drunk
					["qg"] = 6090,	-- Bartleby
					["coords"] = {
						-- #if AFTER WRATH
						{ 76.8, 52.5, MAP.STORMWIND_CITY },
						-- #else
						{ 73.8, 36.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 10,
				}),
				q(26488, {	-- Big Gulp
					["qg"] = 5494,	-- Catherine Leland
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["requireSkill"] = FISHING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						i(67414),	-- Bag of Shiny Things
					},
				}),
				q(7644, {	-- Blessed Arcanite Barding
					["sourceQuest"] = 7643,	-- Ancient Equine Spirit
					["providers"] = {
						{ "n", 14566 },	-- Ancient Equine Spirit
						{ "i", 18792 },	-- Blessed Arcanite Barding
						{ "n", 928 },	-- Lord Grayson Shadowbreaker <Paladin Trainer>
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DIRE_MAUL },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(29412, {	-- Blown Away
					["qg"] = 54117,	-- Vin
					["coord"] = { 58.9, 52.7, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_2_0 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						objective(1, {	-- 0/5 Windswept Balloon
							["providers"] = {
								{ "i",  71034 },	-- Windswept Balloon
								{ "o", 209242 },	-- Windswept Balloon
							},
						}),
						i(72042, {	-- Alliance Balloon (PET!)
							["timeline"] = { ADDED_4_2_0 },
						}),
					},
				}),
				q(344, {	-- Brother Paxton
					["sourceQuest"] = 343,	-- Speaking of Fortitude
					["qg"] = 1440,	-- Milton Sheaf
					["coords"] = {
						-- #if AFTER WRATH
						{ 77.1, 30.2, MAP.STORMWIND_CITY },
						-- #else
						{ 74.2, 7.5, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
				}),
				q(395, {	-- Brotherhood's End
					["sourceQuest"] = 394,	-- The Head of the Beast
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, n(BURLY_BRAWL, {
					["questID"] = 75300,	-- Burly Brawl HQT
					["qgs"] = {
						203475,	-- Liv Bradford <Bartender>
						203478,	-- Stuart
					},
					["coord"] = { 22.6, 64.7, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["classes"] = { PALADIN, WARRIOR },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(204716, {	-- Rune of Frenzied Assault
							["classes"] = { WARRIOR },
							["groups"] = {
								recipe(425447),	-- Engrave Pants - Frenzied Assault
							},
						}),
						i(205683, {	-- Rune of Rebuke
							["classes"] = { PALADIN },
							["groups"] = {
								recipe(425621),	-- Engrave Pants - Rebuke
							},
						}),
					},
				})),
				-- #endif
				q(1705, {	-- Burning Blood
					["sourceQuest"] = 1700,	-- Grimand Elmore
					["qg"] = 1416,	-- Grimand Elmore
					["coords"] = {
						-- #if AFTER WRATH
						{ 59.7, 33.8, MAP.STORMWIND_CITY },
						-- #else
						{ 51.6, 12.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DUSKWOOD },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/20 Burning Blood
							["provider"] = { "i", 6844 },	-- Burning Blood
							["coord"] = { 74.2, 77.8, MAP.DUSKWOOD },
							["crs"] = {
								205,	-- Nightbane Dark Runner
								533,	-- Nightbane Shadow Weaver
								920,	-- Nightbane Tainted One
								206,	-- Nightbane Vile Fang
								898,	-- Nightbane Worgen
							},
						}),
						objective(2, {	-- 0/1 Burning Rock
							["provider"] = { "i", 6845 },	-- Burning Rock
							["coord"] = { 74.2, 77.8, MAP.DUSKWOOD },
							["cr"] = 6170,	-- Gutspill
						}),
					},
				}),
				q(60959, {	-- Burning Crusade: Onward to Adventure in Outland
					["sourceQuest"] = 60120,	-- Burning Crusade: To Outland!
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.2, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				q(60120, {	-- Burning Crusade: To Outland!
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.3, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["isBreadcrumb"] = true,
				}),
				q(60891, {	-- Cataclysm: Onward to Adventure in the Eastern Kingdoms
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.2, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				q(27092, {	-- Cataclysm in the Catacombs
					["sourceQuest"] = 27072,	-- The Old Barracks
					["qg"] = 50049,	-- Jack Bauden <SI:7 Agent>
					["coord"] = { 37.2, 56.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(7642, {	-- Collection of Goods
					["sourceQuest"] = 7641,	-- The Work of Grimand Elmore
					["qg"] = 1416,	-- Grimand Elmore
					["coords"] = {
						-- #if AFTER WRATH
						{ 59.7, 33.8, MAP.STORMWIND_CITY },
						-- #else
						{ 51.6, 12.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.STRATHOLME },
					["cost"] = {
						{ "i", 13180, 5 },	-- Stratholme Holy Water
						{ "i", 8836, 10 },	-- Arthas' Tears
						{ "i", 14047, 40 },	-- Runecloth
						{ "i", 12360, 6 },	-- Arcanite Bar
						{ "g", 1500000 },	-- 150g
					},
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(46274, {	-- Consoling the King
					["sourceQuest"] = 46272,	-- Summons to the Keep
					["qg"] = 119338,	-- Genn Greymane
					["coord"] = { 85.7, 32.1, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_2_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(32469, {	-- Crystal Clarity (A)
					["sourceQuest"] = 32470,	-- Light Camera Action (A)
					["qg"] = 16908,	-- Arielle Snapflash
					["coord"] = { 61.2, 22.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "toyID", 122674 },	-- S.E.L.F.I.E. Camera MkII
					["groups"] = {
						i(155832),	-- Pristine Crystal Shard (QI!)
						i(122661, {	-- S.E.L.F.I.E. Lens Upgrade Kit
							["timeline"] = { ADDED_6_1_0 },
							["groups"] = {
								i(122674, {	-- S.E.L.F.I.E. Camera MkII
									["timeline"] = { ADDED_6_1_0 },
								}),
							},
						}),
					},
				}),
				q(44463, {	-- Demons Among Them
					["sourceQuest"] = 44471,	-- Second Sight
					["qg"] = 102585,	-- Jace Darkweaver
					["coord"] = { 84.4, 33.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { DEMONHUNTER },
					["groups"] = {
						i(128959, {	-- Seal of House Wrynn
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(40593, {	-- Demons Among Us
					["sourceQuest"] = 40517,	-- The Fallen Lion
					["qg"] = 100675,	-- Jace Darkweaver
					["coord"] = { 85.2, 32.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(128959, {	-- Seal of House Wrynn
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(138774, {	-- Accolade of House Wrynn
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(138773, {	-- Favor of House Wrynn
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(5634, {	-- Desperate Prayer
					["altQuests"] = {
						5635,	-- Desperate Prayer [Elwynn Forest]
						5636,	-- Desperate Prayer [Teldrassil]
						5637,	-- Desperate Prayer [Dun Morogh]
						5638,	-- Desperate Prayer [Stormwind City #2]
						5639,	-- Desperate Prayer [Ironforge]
						5640,	-- Desperate Prayer [Darnassus]
					},
					["qg"] = 376,	-- High Priestess Laurena <Priest Trainer>
					["coord"] = { 38.8, 26.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = { HUMAN, DWARF },
					["classes"] = { PRIEST },
					["lvl"] = 10,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 13908,	-- Desperate Prayer (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				q(5638, {	-- Desperate Prayer
					["altQuests"] = {
						5634,	-- Desperate Prayer [Stormwind City #1]
						5635,	-- Desperate Prayer [Elwynn Forest]
						5636,	-- Desperate Prayer [Teldrassil]
						5637,	-- Desperate Prayer [Dun Morogh]
						5639,	-- Desperate Prayer [Ironforge]
						5640,	-- Desperate Prayer [Darnassus]
					},
					["qg"] = 11397,	-- Nara Meideros <Priest Trainer>
					["coord"] = { 20.8, 50.2, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = { HUMAN, DWARF },
					["classes"] = { PRIEST },
					["lvl"] = 10,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 13908,	-- Desperate Prayer (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				q(26420, {	-- Diggin' For Worms
					["qg"] = 5494,	-- Catherine Leland
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["requireSkill"] = FISHING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/1 Crystal Bass
							["providers"] = {
								{ "i",  58787 },	-- Crystal Bass
								{ "i",  58788 },	-- Overgrown Earthworm
								{ "o", 204281 },	-- Worm Mound
							},
							["coord"] = { 57.7, 14.1, MAP.STORMWIND_CITY },
						}),
						i(67414),	-- Bag of Shiny Things
					},
				}),
				q(6261, {	-- Dungar Longdrink
					-- #if AFTER 4.0.3
					["description"] = "This quest gets marked as completed when you complete the quest 'Dungar Longdrink' (26395).",
					-- #endif
					["sourceQuest"] = 6281,	-- Continue to Stormwind
					["providers"] = {
						{ "n", 1323 },	-- Osric Strang
						{ "i", 16115 },	-- Osric's Crate (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 77.0, 61.2, MAP.STORMWIND_CITY },
						-- #else
						{ 74.2, 47.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["lvl"] = 10,
				}),
				q(26395, {	-- Dungar Longdrink
					["sourceQuest"] = 26394,	-- Continue to Stormwind
					["providers"] = {
						{ "n", 1323 },	-- Osric Strang
						{ "i", 16115 },	-- Osric's Crate (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 77.2, 61.0, MAP.STORMWIND_CITY },
						-- #else
						{ 74.2, 47.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["races"] = { HUMAN, KULTIRAN },
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(78091, {	-- Earning Your Salt
					["sourceQuest"] = 78090,	-- A Second Opinion
					["qg"] = 5495,	-- Ursula Deline <Warlock Trainer>
					["coord"] = { 26.2, 77.4, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["maps"] = { MAP.REDRIDGE_MOUNTAINS },
					["classes"] = { PALADIN },
					["groups"] = {
						objective(1, {	-- 0/14 Summoner's Salt
							["provider"] = { "i", 209778 },	-- Summoner's Salt
							["crs"] = {
								4463,	-- Blackrock Summoner
								435,	-- Blackrock Champion
								615,	-- Blackrock Tracker
								4464,	-- Blackrock Gladiator
								4462,	-- Blackrock Hunter
								4065,	-- Blackrock Sentry
								436,	-- Blackrock Shadowcaster
							},
						}),
					},
				})),
				-- #endif
				q(25156, {	-- Elemental Goo
					["qg"] = 50480,	-- Isabel Jones
					["coord"] = { 63.8, 61.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = JEWELCRAFTING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = JEWELCRAFTING_AWARD_GROUPS,
				}),
				q(5673, {	-- Elune's Grace [Stormwind City]
					["altQuests"] = {
						5672,	-- Elune's Grace [Darnassus]
						5675,	-- Elune's Grace [Ironforge]
					},
					["qg"] = 376,	-- High Priestess Laurena <Priest Trainer>
					["coord"] = { 38.8, 26.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["classes"] = { PRIEST },
					["races"] = { NIGHTELF },
					["lvl"] = 20,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 2651,	-- Elune's Grace (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				q(7637, {	-- Emphasis on Sacrifice
					["sourceQuests"] = {
						7670,	-- Lord Grayson Shadowbreaker [Ironforge]
						7638,	-- Lord Grayson Shadowbreaker [Stormwind City]
					},
					["qg"] = 928,	-- Lord Grayson Shadowbreaker <Paladin Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.IRONFORGE },
					["cost"] = 1500000,	-- 150g
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(7640, {	-- Exorcising Terrordale
					["sourceQuest"] = 7639,	-- To Show Due Judgment
					["providers"] = {
						{ "n", 928 },	-- Lord Grayson Shadowbreaker <Paladin Trainer>
						{ "i", 18752 },	-- Exorcism Censer
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.EASTERN_PLAGUELANDS },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
					["groups"] = {
						objective(1, {	-- 0/25 Terrordale Spirit slain
							["provider"] = { "n", 14564 },	-- Terrordale Spirit
							["coords"] = {
								-- #if AFTER WRATH
								{ 16.4, 31.8, MAP.EASTERN_PLAGUELANDS },
								-- #else
								{ 19.6, 36.8, MAP.EASTERN_PLAGUELANDS },
								-- #endif
							},
						}),
					},
				}),
				q(28807, {	-- Expert Opinion
					["sourceQuests"] = {
						27064,	-- He's Holding Out on Us
						27060,	-- Unholy Cow
					},
					["qg"] = 44293,	-- Anduin Wrynn <Prince of Stormwind>
					["coord"] = { 85.7, 31.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(58708, {	-- Fame Waits for Gnome One
					["qg"] = 162393,	-- Gila Crosswires
					["coord"] = { 52.7, 14.1, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_8_3_0 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
				}),
				q(26177, {	-- Feeling Crabby?
					["qg"] = 42288,	-- Robby Flay
					["coords"] = {
						-- #if AFTER 9.2.5
						{ 50.7, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 50.6, 71.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = COOKING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/6 Canal Crab
							["providers"] = {
								{ "i", 57175 },	-- Canal Crab
								{ "n", 42339 },	-- Canal Crab
							},
							["coord"] = { 47.8, 68.4, MAP.STORMWIND_CITY },
						}),
						COOKING_AWARD,
					},
				}),
				q(1701, {	-- Fire Hardened Mail
					["sourceQuest"] = 1702,	-- The Shieldsmith
					["providers"] = {
						{ "n", 5413 },	-- Furen Longbeard
						{ "i", 6842 },	-- Furen's Instructions
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 64.6, 37.2, MAP.STORMWIND_CITY },
						-- #else
						{ 58.0, 16.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.RAZORFEN_KRAUL, MAP.WETLANDS, MAP.STONETALON_MOUNTAINS },
					["classes"] = { WARRIOR },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/50 Scorched Spider Fang
							["provider"] = { "i", 6838 },	-- Scorched Spider Fang
							["crs"] = {
								4040,	-- Cave Stalker
								1111,	-- Leech Stalker
							},
						}),
						objective(2, {	-- 0/12 Charred Horn
							["provider"] = { "i", 6839 },	-- Charred Horn
							["crs"] = {
								4031,	-- Fledgling Chimaera
								4032,	-- Young Chimaera
							},
						}),
						objective(3, {	-- 0/1 Galvanized Horn
							["provider"] = { "i", 6840 },	-- Galvanized Horn
							["cr"] = 6167,	-- Chimaera Matriarch
						}),
						objective(4, {	-- 0/1 Vial of Phlogiston
							["provider"] = { "i", 6841 },	-- Vial of Phlogiston
							["cr"] = 6168,	-- Roogug
						}),
					},
				}),
				q(6184, {	-- Flint Shadowmore
					["sourceQuest"] = 6183,	-- Honor the Dead
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 56,
				}),
				q(27675, {	-- Forged Documents
					["description"] = "After creating Forged Documents with Inscription, search the city for an NPC to accept them - the quest can end in a variety of different places.",
					["provider"] = { "i", 62056 },	-- Forged Documents
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = INSCRIPTION,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
				}),
				q(1782, {	-- Furen's Armor
					["sourceQuest"] = 1701,	-- Fire Hardened Mail
					["qg"] = 5413,	-- Furen Longbeard
					["coords"] = {
						-- #if AFTER WRATH
						{ 64.6, 37.2, MAP.STORMWIND_CITY },
						-- #else
						{ 58.0, 16.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 20,
					["groups"] = {
						i(6972, {	-- Fire Hardened Hauberk
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(1685, {	-- Gakin's Summons (Voidwalker)
					["altQuests"] = { 1715 },	-- The Slaughtered Lamb
					["qg"] = 6121,	-- Remen Marcot
					["coord"] = { 44.4, 66.2, MAP.ELWYNN_FOREST },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { WARLOCK },
					["isBreadcrumb"] = true,
					["lvl"] = 10,
				}),
				q(1717, {	-- Gakin's Summons (Succubus)
					["qg"] = 6120,	-- Lago Blackwrench
					["coord"] = { 47.6, 9.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { WARLOCK },
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(1921, {	-- Gathering Materials
					["sourceQuest"] = 1920,	-- Investigate the Blue Recluse
					["qg"] = 5497,	-- Jennea Cannon <Mage Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.5, 85.8, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 79.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.LOCH_MODAN },
					["cost"] = { { "i", 2589, 10 } },	-- Linen Cloth
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["lvl"] = 15,
					["groups"] = {
						objective(2, {	-- 0/6 Charged Rift Gem
							["providers"] = {
								{ "i", 7249 },	-- Charged Rift Gem
								{ "o", 271 },	-- Miners' League Crates
							},
							["coord"] = { 35.0, 27.0, MAP.LOCH_MODAN },
						}),
					},
				}),
				q(49976, {	-- Gifts of the Fallen
					["sourceQuest"] = 50371,	-- Summons to Stormwind
					["qg"] = 132255,	-- Master Mathias Shaw
					["coord"] = { 39.0, 62.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5, REMOVED_8_0_1 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(3630, {	-- Gnome Engineering [A]
					["altQuests"] = {
						3526,	-- Goblin Engineering
						3629,	-- Goblin Engineering
						-- 3630,	-- Gnome Engineering
						3632,	-- Gnome Engineering
						3633,	-- Goblin Engineering
						3634,	-- Gnome Engineering
						3635,	-- Gnome Engineering
						3637,	-- Gnome Engineering
						4181,	-- Goblin Engineering
						-- #if AFTER CATA
						29475,	-- Goblin Engineering
						29477,	-- Gnomish Engineering
						-- #endif
					},
					["providers"] = {
						{ "n", 5518 },	-- Lilliam Sparkspindle <Expert Engineer>
						{ "i", 10789 },	-- Manual of Engineering Disciplines
					},
					["coord"] = { 55.0, 8.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["requireSkill"] = ENGINEERING,
					["learnedAt"] = 200,
					["lvl"] = 30,
				}),
				q(3629, {	-- Goblin Engineering [A]
					["altQuests"] = {
						3526,	-- Goblin Engineering
						-- 3629,	-- Goblin Engineering
						3630,	-- Gnome Engineering
						3632,	-- Gnome Engineering
						3633,	-- Goblin Engineering
						3634,	-- Gnome Engineering
						3635,	-- Gnome Engineering
						3637,	-- Gnome Engineering
						4181,	-- Goblin Engineering
						-- #if AFTER CATA
						29475,	-- Goblin Engineering
						29477,	-- Gnomish Engineering
						-- #endif
					},
					["providers"] = {
						{ "n", 5518 },	-- Lilliam Sparkspindle <Expert Engineer>
						{ "i", 10789 },	-- Manual of Engineering Disciplines
					},
					["coord"] = { 55.0, 8.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["requireSkill"] = ENGINEERING,
					["learnedAt"] = 200,
					["lvl"] = 30,
				}),
				q(39800, {	-- Greymane's Gambit
					["sourceQuest"] = 38206,	-- Making the Rounds
					["qg"] = 96663,	-- Genn Greymane
					["coord"] = { 18.6, 50.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(139914, {	-- 7th Legion Battlemage Amice
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(121760, {	-- 7th Legion Battlemage Wraps
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(139950, {	-- Gryphon Rider's Shoulderpads
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(139955, {	-- Gryphon Rider's Cuffs
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(139976, {	-- Skyfire Engineer's Mantle
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(121762, {	-- Skyfire Engineer's Wristguards
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(121753, {	-- Skyfire Marine's Pauldrons
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(121761, {	-- Skyfire Marine's Vambraces
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(1700, {	-- Grimand Elmore
					["sourceQuest"] = 1701,	-- Fire Hardened Mail
					["providers"] = {
						{ "n", 5413 },	-- Furen Longbeard
						{ "i", 6926 },	-- Furen's Notes
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 64.6, 37.2, MAP.STORMWIND_CITY },
						-- #else
						{ 58.0, 16.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(1706, {	-- Grimand's Armor
					["sourceQuest"] = 1705,	-- Burning Blood
					["qg"] = 1416,	-- Grimand Elmore
					["coords"] = {
						-- #if AFTER WRATH
						{ 59.7, 33.8, MAP.STORMWIND_CITY },
						-- #else
						{ 51.6, 12.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARRIOR },
					["lvl"] = 20,
					["groups"] = {
						i(6971, {	-- Fire Hardened Coif
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(7648, {	-- Grimand's Finest Work
					["sourceQuest"] = 7642,	-- Collection of Goods
					["providers"] = {
						{ "n", 1416 },	-- Grimand Elmore
						{ "i", 18753 },	-- Arcanite Barding
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 59.7, 33.8, MAP.STORMWIND_CITY },
						-- #else
						{ 51.6, 12.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(66420, {	-- Happy Hour
					["sourceQuest"] = 66390,	-- Missing Merchandise
					["qg"] = 188342,	-- Onnesa
					["coord"] = { 51.5, 70.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_2_5, REMOVED_10_0_5 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(191865, {	-- Bottle of Briny Seawater (QI!)
							["timeline"] = { ADDED_9_2_5, REMOVED_10_0_5 },
						}),
					},
				}),
				q(333, {	-- Harlan Needs a Resupply
					["providers"] = {
						{ "n", 1427 },	-- Harlan Bagley
						{ "i", 2724 },	-- Cloth Request (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 62.3, 67.9, MAP.STORMWIND_CITY },
						-- #else
						{ 55.1, 56.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["races"] = ALLIANCE_ONLY,
				}),
				q(27064, {	-- He's Holding Out on Us
					["sourceQuest"] = 26997,	-- The Usual Suspects
					["qg"] = 44293,	-- Anduin Wrynn <Prince of Stormwind>
					["coord"] = { 85.7, 31.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(1939, {	-- High Sorcerer Andromath
					["qgs"] = {
						5144,	-- Bink <Mage Trainer>
						5497,	-- Jennea Cannon <Mage Trainer>
					},
					["coords"] = {
						{ 27.0, 8.2, MAP.IRONFORGE },
						-- #if AFTER WRATH
						{ 49.5, 85.8, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 79.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["isBreadcrumb"] = true,
					["lvl"] = 26,
				}),
				q(26414, {	-- Hitting a Walleye
					["qg"] = 5494,	-- Catherine Leland
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["requireSkill"] = FISHING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						i(67414),	-- Bag of Shiny Things
					},
				}),
				q(6183, {	-- Honor the Dead
					["sourceQuest"] = 6182,	-- The First and the Last
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 56,
				}),
				q(399, {	-- Humble Beginnings
					["qg"] = 1646,	-- Baros Alexston <City Architect>
					["coords"] = {
						-- #if AFTER WRATH
						{ 57.7, 47.9, MAP.STORMWIND_CITY },
						-- #else
						{ 49.0, 30.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.WESTFALL },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 A Simple Compass
							["providers"] = {
								{ "i", 2998 },	-- A Simple Compass
								{ "o", 1166 },	-- Alexston's Chest
							},
							["coord"] = { 36.3, 54.6, MAP.WESTFALL },
						}),
					},
				}),
				q(32675, {	-- I Believe You Can Fly
					["description"] = "This quest is automatically offered to Alliance players upon reaching the specified level.",
					["timeline"] = { ADDED_5_2_0, REMOVED_10_1_5 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1,
						"spellID", 34090,	-- Expert Riding
						"spellID", 34091,	-- Artisan Riding
						"spellID", 90265,	-- Master Riding
					},
					["isBreadcrumb"] = true,
					["DisablePartySync"] = true,
					["lvl"] = lvlsquish(60, 60, 30),
				}),
				q(44120, {	-- Illidari Allies
					["sourceQuest"] = 40593,	-- Demons Among Us
					["qg"] = 100973,	-- Anduin Wrynn
					["coord"] = { 85.6, 31.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(2759, {	-- In Search of Galvan
					["sourceQuest"] = 2758,	-- The Origins of Smithing
					["providers"] = {
						{ "n", 7798 },	-- Hank the Hammer
						{ "i", 8663 },	-- Mithril Insignia
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 63.0, 36.4, MAP.STORMWIND_CITY },
						-- #else
						{ 56.0, 16.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.STRANGLETHORN_VALE },
					["requireSkill"] = BLACKSMITHING,
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 40,
				}),
				q(1448, {	-- In Search of The Temple
					["qg"] = 5384,	-- Brohann Caskbelly <Explorers' League>
					["coords"] = {
						-- #if AFTER WRATH
						{ 69.5, 40.4, MAP.STORMWIND_CITY },
						-- #else
						{ 64.3, 20.7, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 38,
				}),
				q(2745, {	-- Infiltrating the Castle
					["sourceQuest"] = 350,	-- Look to an Old Friend
					["qg"] = 482,	-- Elling Trias <Master of Cheese>
					["coords"] = {
						-- #if AFTER WRATH
						{ 66.0, 74.1, MAP.STORMWIND_CITY },
						-- #else
						{ 60.0, 64.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				q(1920, {	-- Investigate the Blue Recluse
					["sourceQuest"] = 1919,	-- Report to Jennea
					["qg"] = 5497,	-- Jennea Cannon <Mage Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.5, 85.8, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 79.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["lvl"] = 15,
					["groups"] = {
						objective(1, {	-- 0/3 Filled Containment Coffer
							["providers"] = {
								{ "i",   7292 },	-- Filled Containment Coffer
								{ "o", 103574 },	-- Filled Containment Coffer
								{ "i",   7247 },	-- Chest of Containment Coffers
								{ "i",   7308 },	-- Cantation of Manifestation
							},
							["coords"] = {
								-- #if AFTER WRATH
								{ 51.0, 95.0, MAP.STORMWIND_CITY },
								-- #else
								{ 39.4, 86.0, MAP.STORMWIND_CITY },
								-- #endif
							},
							["cr"] = 6492,	-- Rift Spawn
						}),
						objective(2, {	-- 0/1 Chest of Containment Coffers
							["providers"] = {
								{ "i",   7247 },	-- Chest of Containment Coffers
								{ "o", 105174 },	-- Chest of Containment Coffers
							},
							["coords"] = {
								-- #if AFTER WRATH
								{ 49.6, 85.4, MAP.STORMWIND_CITY },
								-- #else
								{ 38.7, 79.1, MAP.STORMWIND_CITY },
								-- #endif
							},
						}),
						objective(3, {	-- 0/1 Cantation of Manifestation
							["providers"] = {
								{ "i",   7308 },	-- Cantation of Manifestation
								{ "o", 105175 },	-- Cantation of Manifestation
							},
							["coords"] = {
								-- #if AFTER WRATH
								{ 49.6, 85.4, MAP.STORMWIND_CITY },
								-- #else
								{ 38.7, 79.1, MAP.STORMWIND_CITY },
								-- #endif
							},
						}),
					},
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(78092, {	-- It Must Be Destroyed
					["sourceQuest"] = 78091,	-- Earning Your Salt
					["providers"] = {
						{ "n",   5495 },	-- Ursula Deline <Warlock Trainer>
						{ "i", 209748 },	-- Althalaxx Orb
						{ "o",   409311 },	-- Spear of Mannoroth
					},
					["coords"] = {
						{ 26.2, 77.4, MAP.STORMWIND_CITY },
						{ 89.5, 76.9, MAP.ASHENVALE },
					},
					["timeline"] = { REMOVED_2_0_1 },
					["classes"] = { PALADIN },
					["groups"] = {
						objective(1, {	-- 0/12 Mote of Mannoroth
							["provider"] = { "i", 209779 },	-- Mote of Mannoroth
							["crs"] = {
								11697,	-- Mannoroc Lasher
								6115,	-- Roaming Felguard
								6073,	-- Searing Infernal
								6071,	-- Legion Hound
							},
						}),
					},
				})),
				-- #endif
				q(2746, {	-- Items of Some Consequence
					["sourceQuest"] = 2745,	-- Infiltrating the Castle
					["qg"] = 7766,	-- Tyrion
					["coords"] = {
						-- #if AFTER WRATH
						{ 73.2, 35.7, MAP.STORMWIND_CITY },
						-- #else
						{ 69.2, 14.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["cost"] = { { "i", 4306, 3 } },	-- Silk Cloth
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
					["groups"] = {
						objective(2, {	-- 0/2 Clara's Fresh Apple
							["providers"] = {
								{ "i",   8683 },	-- Clara's Fresh Apple
								{ "o", 142076 },	-- Clara's Fresh Apples
							},
							["coord"] = { 34.0, 57.2, MAP.ELWYNN_FOREST },
						}),
					},
				}),
				q(1704, {	-- Klockmort Spannerspan
					["sourceQuest"] = 1701,	-- Fire Hardened Mail
					["providers"] = {
						{ "n", 5413 },	-- Furen Longbeard
						{ "i", 6926 },	-- Furen's Notes
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 64.6, 37.2, MAP.STORMWIND_CITY },
						-- #else
						{ 58.0, 16.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARRIOR },
					["races"] = { DWARF, GNOME },
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(32665, {	-- Learn To Ride
					["description"] = "This quest is automatically granted to Pandaren upon reaching the specified level.",
					["timeline"] = { ADDED_5_2_0, REMOVED_10_1_5 },
					["races"] = { PANDAREN_ALLIANCE },
					["lockCriteria"] = { 1,
						"spellID", 33388,	-- Apprentice Riding
						"spellID", 33391,	-- Journeyman Riding
						"spellID", 34090,	-- Expert Riding
						"spellID", 34091,	-- Artisan Riding
						"spellID", 90265,	-- Master Riding
					},
					["isBreadcrumb"] = true,
					["DisablePartySync"] = true,
					["lvl"] = lvlsquish(20, 20, 10),
				}),
				q(60971, {	-- Legion: Onward to Adventure in the Broken Isles
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.2, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				q(65896, {	-- Let the Healing Begin
					["qg"] = 190830,	-- Otan Tennoh
					["coord"] = { 44.2, 57.0, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_10_0_2 },
					["races"] = { DRACTHYR_ALLIANCE },
					["classes"] = { EVOKER },
				}),
				q(32470, {	-- Light Camera Action (A)
					["qg"] = 16908,	-- Arielle Snapflash
					["coord"] = { 61.2, 22.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5 },
					["cost"] = { { "i", 4406, 1 } },	-- Standard Scope
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "toyID", 122674 },	-- S.E.L.F.I.E. Camera MkII
					["groups"] = {
						objective(1, {	-- 0/1 Iron Box
							["provider"] = { "i", 155856 },	-- Iron Box
							["coord"] = { 68.1, 66.9, MAP.STORMWIND_CITY },
						}),
						objective(3, {	-- 0/1 Russet Belt
							["provider"] = { "i", 3593 },	-- Russet Belt
							["coord"] = { 53.2, 81.8, MAP.STORMWIND_CITY },
						}),
						i(122637, {	-- S.E.L.F.I.E. Camera
							["timeline"] = { ADDED_6_1_0 },
						}),
					},
				}),
				q(7670, {	-- Lord Grayson Shadowbreaker [Ironforge]
					["qg"] = 5149,	-- Brandur Ironhammer <Paladin Trainer>
					["coord"] = { 23.4, 6.2, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 60,
				}),
				q(7638, {	-- Lord Grayson Shadowbreaker [Stormwind City]
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 60,
				}),
				q(350, {	-- Look to an Old Friend
					["sourceQuest"] = 393,	-- Shadow of the Past
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				q(38206, {	-- Making the Rounds
					["sourceQuest"] = 38035,	-- A Royal Summons
					["qg"] = 96644,	-- Sky Admiral Rogers
					["coord"] = { 18.8, 42.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(1941, {	-- Manaweave Robe
					["sourceQuest"] = 1921,	-- Gathering Materials
					["qg"] = 1309,	-- Wynne Larson <Robe Merchant>
					["coords"] = {
						-- #if AFTER WRATH
						{ 52.0, 83.6, MAP.STORMWIND_CITY },
						-- #else
						{ 41.8, 76.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["lvl"] = 15,
					["groups"] = {
						i(7509, {	-- Manaweave Robe
							-- #if AFTER 4.0.3
							["description"] = "This item is still available in the Ghostlands for Blood Elf Mages, originally only available to the Alliance in Stormwind.",
							-- #endif
							["timeline"] = { REMOVED_4_0_3 },	-- Item is still available in the Ghostlands for Horde, but removed from this source.
						}),
					},
				}),
				q(65047, {	-- Mark of the Nightwing Raven
					["name"] = "Mark of the Nightwing Raven",	-- TODO: What is this?
					["qg"] = 44395,	-- Celestine of the Harvest
					["coord"] = { 57.6, 24.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_1_5 },
					["classes"] = { DRUID },
				}),
				q(1666, {	-- Marshal Haggard
					["sourceQuest"] = 1665,	-- Bartleby's Mug
					["qg"] = 6089,	-- Harry Burlguard
					["coords"] = {
						-- #if AFTER WRATH
						{ 77.1, 53.3, MAP.STORMWIND_CITY },
						-- #else
						{ 74.0, 37.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["classes"] = { WARRIOR },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
				}),
				q(2360, {	-- Mathias and the Defias
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 20,
				}),
				q(1703, {	-- Mathiel
					["sourceQuest"] = 1701,	-- Fire Hardened Mail
					["providers"] = {
						{ "n", 5413 },	-- Furen Longbeard
						{ "i", 6926 },	-- Furen's Notes
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 64.6, 37.2, MAP.STORMWIND_CITY },
						-- #else
						{ 58.0, 16.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARRIOR },
					["races"] = { NIGHTELF },
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(1363, {	-- Mazen's Behest (1/2)
					["qg"] = 338,	-- Mazen Mac'Nadir
					["coords"] = {
						-- #if AFTER WRATH
						{ 51.8, 74.3, MAP.STORMWIND_CITY },
						-- #else
						{ 41.4, 64.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
				}),
				q(1364, {	-- Mazen's Behest (2/2)
					["sourceQuest"] = 1363,	-- Mazen's Behest (1/2)
					["qg"] = 5386,	-- Acolyte Dellis
					["coords"] = {
						-- #if AFTER WRATH
						{ 51.4, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 40.8, 64.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.SWAMP_OF_SORROWS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						objective(1, {	-- 0/1 Khadgar's Essays on Dimensional Convergence
							["provider"] = { "i", 6065 },	-- Khadgar's Essays on Dimensional Convergence
							["crs"] = {
								1081,	-- Mire Lord
								14448,	-- Molt Thorn
								764,	-- Swampwalker
								765,	-- Swampwalker Elder
								766,	-- Tangled Horror
							},
						}),
						i(10747, {	-- Teacher's Sash
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(10748, {	-- Wanderlust Boots
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(1861, {	-- Mirror Lake
					["sourceQuest"] = 1860,	-- Speak with Jennea
					["altQuests"] = { 1880 },	-- Mage-tastic Gizmonitor
					["qg"] = 5497,	-- Jennea Cannon <Mage Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.5, 85.8, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 79.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["classes"] = { MAGE },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 Mirror Lake Water Sample
							["providers"] = {
								{ "i", 7206 },	-- Mirror Lake Water Sample
								{ "i", 7207 },	-- Jennea's Flask
							},
							["coord"] = { 28.0, 62.0, MAP.ELWYNN_FOREST },
						}),
						i(7508, {	-- Ley Orb
							-- #if AFTER 4.0.3
							["description"] = "This item is still available in Eversong Woods for Horde Mages.",
							-- #endif
							["timeline"] = { REMOVED_4_0_3 },	-- Item is still available in the Eversong Woods for Horde, but removed from this source.
						}),
						i(9513, {	-- Ley Staff
							-- #if AFTER 4.0.3
							["description"] = "This item is still available in Eversong Woods for Horde Mages.",
							-- #endif
							["timeline"] = { REMOVED_4_0_3 },	-- Item is still available in the Eversong Woods for Horde, but removed from this source.
						}),
					},
				}),
				q(66390, {	-- Missing Merchandise
					["qg"] = 188342,	-- Onnesa
					["coord"] = { 51.5, 70.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_2_5, REMOVED_10_0_5 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(27038, {	-- Missing Parts
					["sourceQuest"] = 26975,	-- Rallying the Fleet
					["qg"] = 44749,	-- Supply Sergeant Graves
					["coord"] = { 33.2, 39.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(63927, {	-- Machine-Linker Girdle
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63926, {	-- Reconstructing Hauberk
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
						i(63925, {	-- Scavenger Bracers
							["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
						}),
					},
				}),
				q(60965, {	-- Mists of Pandaria: Onward to Adventure in Pandaria
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.2, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				q(60125, {	-- Mists of Pandaria: To Pandaria!
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.3, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["isBreadcrumb"] = true,
				}),
				q(26960, {	-- My Son, the Prince
					["qg"] = 29611,	-- King Varian Wrynn <King of Stormwind>
					["coord"] = { 85.8, 31.7, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(25105, {	-- Nibbler! No!
					["qg"] = 50480,	-- Isabel Jones
					["coord"] = { 63.8, 61.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = JEWELCRAFTING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = JEWELCRAFTING_AWARD_GROUPS,
				}),
				q(25155, {	-- Ogrezonians in the Mood
					["qg"] = 50480,	-- Isabel Jones
					["coord"] = { 63.8, 61.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = JEWELCRAFTING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = JEWELCRAFTING_AWARD_GROUPS,
				}),
				q(6187, {	-- Order Must Be Restored
					["sourceQuest"] = 6186,	-- The Blightcaller Cometh
					["qgs"] = {
						-- #if AFTER WRATH
						29611,	-- King Varian Wrynn <King of Stormwind>
						-- #else
						1748,	-- Highlord Bolvar Fordragon
						-- #endif
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 79.8, 38.6, MAP.STORMWIND_CITY },	-- King Varian Wrynn <King of Stormwind>
						-- #else
						{ 78.0, 18.0, MAP.STORMWIND_CITY },	-- Highlord Bolvar Fordragon
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.EASTERN_PLAGUELANDS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 56,
					["groups"] = {
						objective(1, {	-- 0/1 Nathanos Blightcaller slain
							["provider"] = { "n", 11878 },	-- Nathanos Blightcaller <Champion of the Banshee Queen>
							["coords"] = {
								-- #if AFTER WRATH
								{ 23.0, 68.2, MAP.EASTERN_PLAGUELANDS },
								-- #else
								{ 26.6, 74.8, MAP.EASTERN_PLAGUELANDS },
								-- #endif
							},
						}),
						i(16996, {	-- Gorewood Bow
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(16997, {	-- Stormrager
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(16998, {	-- Sacred Protector
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26192, {	-- Orphans Like Cookies Too!
					["qg"] = 42288,	-- Robby Flay
					["coords"] = {
						-- #if AFTER 9.2.5
						{ 50.7, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 50.6, 71.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = COOKING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/4 Confectioners' Sugar
							["providers"] = {
								{ "i",  57246 },	-- Confectioners' Sugar
								{ "o", 203801 },	-- Sack of Confectioner's Sugar
							},
							["coord"] = { 77.6, 53.2, MAP.STORMWIND_CITY },
						}),
						COOKING_AWARD,
					},
				}),
				q(334, {	-- Package for Thurman
					["providers"] = {
						{ "n", 1428 },	-- Rema Schneider
						{ "i", 2760 },	-- Thurman's Sewing Kit
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 58.1, 67.5, MAP.STORMWIND_CITY },
						-- #else
						{ 49.5, 55.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["races"] = ALLIANCE_ONLY,
				}),
				q(27044, {	-- Peasant Problems
					["sourceQuests"] = {
						26975,	-- Rallying the Fleet
						26997,	-- The Usual Suspects
					},
					["qg"] = 44293,	-- Anduin Wrynn <Prince of Stormwind>
					["coord"] = { 85.7, 31.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(26153, {	-- Penny's Pumpkin Pancakes
					["qg"] = 42288,	-- Robby Flay
					["coords"] = {
						-- #if AFTER 9.2.5
						{ 50.7, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 50.6, 71.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = COOKING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/6 Stormwind Pumpkin
							["providers"] = {
								{ "i",  57137 },	-- Stormwind Pumpkin
								{ "o", 203751 },	-- Stormwind Pumpkin
							},
							["coord"] = { 55.2, 11.4, MAP.STORMWIND_CITY },
						}),
						COOKING_AWARD,
					},
				}),
				q(1940, {	-- Pristine Spider Silk
					["sourceQuest"] = 1938,	-- Ur's Treatise on Shadow Magic
					["qg"] = 5694,	-- High Sorcerer Andromath
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.7, 87.6, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 81.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DUSKWOOD },
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["lvl"] = 26,
					["groups"] = {
						objective(1, {	-- 0/8 Pristine Spider Silk
							["provider"] = { "i", 7267 },	-- Pristine Spider Silk
							["crs"] = {
								949,	-- Carrion Recluse
								930,	-- Black Widow Hatchling
							},
						}),
					},
				}),
				q(26975, {	-- Rallying the Fleet
					["sourceQuest"] = 26960,	-- My Son, the Prince
					["qg"] = 29611,	-- King Varian Wrynn <King of Stormwind>
					["coord"] = { 85.8, 31.7, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(2281, {	-- Redridge Rendezvous
					["sourceQuests"] = {
						2260,	-- Erion's Behest(Darnassus)
						2298,	-- Kingly Shakedown(Ironforge)
						2300,	-- SI:7(Elwynn Forest)
					},
					["qg"] = 6946,	-- Renzik "The Shiv" <SI:7 Operative>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.8, 70.8, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 60.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 16,
				}),
				q(1919, {	-- Report to Jennea
					["qg"] = 7312,	-- Dink <Mage Trainer>
					["coord"] = { 26.8, 8.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { MAGE },
					["isBreadcrumb"] = true,
					["lvl"] = 15,
				}),
				q(58498, {	-- Return of the Warrior King
					["sourceQuest"] = 58496,	-- An Unwelcome Advisor
					["qg"] = 154532,	-- Magni Bronzebeard <The Speaker>
					["coord"] = { 85.2, 32.5, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_8_3_0 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						o(344604, {	-- Fearbreaker
							["coord"] = { 87.6, 35.1, MAP.STORMWIND_CITY },
							["groups"] = { i(175151) },	-- Fearbreaker (QI!)
						}),
					},
				}),
				q(26396, {	-- Return to Argus
					["sourceQuest"] = 26395,	-- Dungar Longdrink
					["providers"] = {
						{ "n", 352 },	-- Dungar Longdrink <Gryphon Master>
						{ "i", 16115 },	-- Osric's Crate (PQI!)
					},
					["coord"] = { 71.0, 72.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["races"] = { HUMAN, KULTIRAN },
				}),
				q(6285, {	-- Return to Lewis
					-- #if AFTER 4.0.3
					["description"] = "This quest gets marked as completed when you complete the quest 'Return to Argus' (26396) in Elwynn Forest.",
					-- #endif
					["sourceQuest"] = 6261,	-- Dungar Longdrink
					["providers"] = {
						{ "n", 352 },	-- Dungar Longdrink <Gryphon Master>
						{ "i", 16115 },	-- Osric's Crate (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 71.0, 72.5, MAP.STORMWIND_CITY },
						-- #else
						{ 66.2, 62.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.WESTFALL },
					["races"] = { HUMAN },
					["lvl"] = 10,
				}),
				-- #if NOT ANYCLASSIC
				q(5631, {	-- Returning Home [Stormwind City]
					["altQuests"] = {
						5627,	-- Returning Home [Darnassus]
						5628,	-- Returning Home [Elwynn Forest]
						5629,	-- Returning Home [Teldrassil]
						5630,	-- Returning Home [Dun Morogh]
						5632,	-- Returning Home [Stormwind City]
						5633,	-- Returning Home [Ironforge]
					},
					["qg"] = 5489,	-- Brother Joshua <Priest Trainer>
					["coord"] = { 38.6, 26.8, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["classes"] = { PRIEST },
					["races"] = { NIGHTELF },
					["lvl"] = 10,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 10797,	-- Starshards (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				-- #endif
				-- #if NOT ANYCLASSIC
				q(5632, {	-- Returning Home [Stormwind City]
					["altQuests"] = {
						5627,	-- Returning Home [Darnassus]
						5628,	-- Returning Home [Elwynn Forest]
						5629,	-- Returning Home [Teldrassil]
						5630,	-- Returning Home [Dun Morogh]
						5631,	-- Returning Home [Stormwind City]
						5633,	-- Returning Home [Ironforge]
					},
					["qg"] = 11397,	-- Nara Meideros <Priest Trainer>
					["coord"] = { 20.8, 50.2, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["classes"] = { PRIEST },
					["races"] = { NIGHTELF },
					["lvl"] = 10,
					-- #if BEFORE 3.0.2
					["groups"] = {
						{
							["recipeID"] = 10797,	-- Starshards (Rank 1)
							["rank"] = 1,
						},
					},
					-- #endif
				}),
				-- #endif
				q(26442, {	-- Rock Lobster
					["qg"] = 5494,	-- Catherine Leland
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["requireSkill"] = FISHING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/6 Rock Lobster
							["providers"] = {
								{ "i",  58809 },	-- Rock Lobster
								{ "o", 204284 },	-- Stormwind Lobster Trap
							},
							["coord"] = { 21.5, 36.6, MAP.STORMWIND_CITY },
						}),
						i(67414),	-- Bag of Shiny Things
					},
				}),
				q(44471, {	-- Second Sight
					["sourceQuest"] = 39691,	-- The Call of War
					["qg"] = 102585,	-- Jace Darkweaver
					["coord"] = { 84.4, 33.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { DEMONHUNTER },
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(78194, {	-- Secrets of Elune (1/2)
					["qg"] = 11397,	-- Nara Meideros <Priest Trainer>
					["coord"] = { 20.8, 50.2, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["maps"] = { MAP.DUSKWOOD },
					["classes"] = { PRIEST },
					["races"] = { DWARF, HUMAN },
					["lvl"] = 17,
					["groups"] = {
						objective(1, {	-- 0/10 Dire Wolf Paw
							["provider"] = { "i", 210053 },	-- Dire Wolf Paw
							["coord"] = { 67.2, 27.2, MAP.DUSKWOOD },
							["crs"] = {
								565,	-- Rabid Dire Wolf
								213,	-- Starving Dire Wolf
								628,	-- Black Ravager
							},
						}),
					},
				})),
				applyclassicphase(SOD_PHASE_ONE, q(78195, {	-- Secrets of Elune (2/2)
					["description"] = "Completing this quest will allow you to meditate in the same manner as the night elves.",
					["sourceQuest"] = 78194,	-- Secrets of Elune (1/2)
					["qg"] = 11397,	-- Nara Meideros <Priest Trainer>
					["coord"] = { 20.8, 50.2, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["maps"] = { MAP.DARKSHORE },
					["classes"] = { PRIEST },
					["races"] = { DWARF, HUMAN },
					["lvl"] = 17,
					["groups"] = {
						recipe(424036, {	-- Secrets of Elune
							["classes"] = { PRIEST },
						}),
					},
				})),
				-- #endif
				q(393, {	-- Shadow of the Past
					["sourceQuest"] = 392,	-- The Curious Visitor
					["providers"] = {
						{ "n", 1646 },	-- Baros Alexston <City Architect>
						{ "i", 8687 },	-- Sealed Description of Thredd's Visitor
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 57.7, 47.9, MAP.STORMWIND_CITY },
						-- #else
						{ 49.0, 30.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(79077, {	-- Sharing the Faith
					["qg"] = 1212,	-- Bishop Farthing
					["coord"] = { 39.2, 28.0, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["classes"] = { PRIEST },
					["races"] = { DWARF, HUMAN },
					["lvl"] = 5,
					["groups"] = {
						objective(1, {	-- Pray over the Supplicant
							["provider"] = { "n", 215062 },	-- Supplicant
							["description"] = "You must first have your Meditation buff and then use /pray on the kneeling Supplicant.",
						}),
					},
				})),
				-- #endif
				q(2206, {	-- Snatch and Grab
					["sourceQuest"] = 2205,	-- Seek out SI:7
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 Defias Shipping Schedule
							["provider"] = { "i", 7675 },	-- Defias Shipping Schedule
							["coord"] = { 48.2, 87.6, MAP.ELWYNN_FOREST },
							["cr"] = 6846,	-- Defias Dockmaster
						}),
						i(7298, {	-- Blade of Cunning
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_THREE, q(81762, {	-- Some Good News
					["sourceQuest"] = 79970,	-- Aeonas the Vindicated
					["qg"] = 218160,	-- Aeonas the Vindicated <Former Paladin of the Silver Hand>
					["coord"] = { 37.6, 31.6, MAP.STORMWIND_CITY },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 44,
					["groups"] = {
						objective(1, {	-- Speak with Katherine the Pure
							["provider"] = { "n", 5492 },	-- Katherine the Pure <Paladin Trainer>
							["coord"] = { 37.8, 31.6, MAP.STORMWIND_CITY },
						}),
					},
				})),
				applyclassicphase(SOD_PHASE_ONE, n(createHeader({	-- Speak to Brother Romulus
					readable = "Speak to Brother Romulus",
					icon = 131038,
					text = {
						en = "Speak to Brother Romulus",
						de = "Sprich mit Bruder Romulus",
						es = "Habla con el Hermano Romulus",
						mx = "Habla con el Hermano Romulus",
						fr = "Parlez à Frère Romulus",
						it = "Parla con Fratello Romulus",
						ko = "로물루스 형제와 대화하세요",
						pt = "Fale com o Irmão Romulus",
						ru = "Поговорите с Брат Ромул",
						cn = "与罗穆卢斯修士交谈",
						-- TODO: tw = "",
					},
				}), {
					["questID"] = 75939,	-- Brother Romulus HQT
					["qg"] = 205278,	-- Brother Romulus
					["coord"] = { 38.6, 28.8, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
				})),
				-- #endif
				q(343, {	-- Speaking of Fortitude
					["qg"] = 1444,	-- Brother Kristoff
					["coords"] = {
						-- #if AFTER WRATH
						{ 55.0, 54.2, MAP.STORMWIND_CITY },
						-- #else
						{ 45.7, 38.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
				}),
				q(353, {	-- Stormpike's Delivery
					["sourceQuest"] = 1097,	-- Elmore's Task
					["providers"] = {
						{ "n", 1416 },	-- Grimand Elmore
						{ "i", 2806 },	-- Package for Stormpike (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 59.7, 33.8, MAP.STORMWIND_CITY },
						-- #else
						{ 51.6, 12.2, MAP.STORMWIND_CITY },
						-- #endif
					},
					["races"] = ALLIANCE_ONLY,
				}),
				q(579, {	-- Stormwind Library
					["providers"] = {
						{ "n", 2504 },	-- Donyal Tovald <Librarian>
						{ "i", 3898 },	-- Library Scrip
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 84.6, 24.2, MAP.STORMWIND_CITY },
						-- #else
						{ 71.6, 7.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["repeatable"] = true,
					["groups"] = {
						i(3899, {	-- Legends of the Gurubashi, Volume 3
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(2154, {	-- The Story of Morgan Ladimore
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(50371, {	-- Summons to Stormwind
					["qg"] = 132255,	-- Master Mathias Shaw
					["coord"] = { 39.0, 62.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5, REMOVED_8_0_1 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(1688, {	-- Surena Caledon
					["sourceQuests"] = {
						1685,	-- Gakin's Summons (Voidwalker)
						1715,	-- The Slaughtered Lamb
					},
					["qg"] = 6122,	-- Gakin the Darkbinder
					["coords"] = {
						-- #if AFTER WRATH
						{ 39.2, 85.2, MAP.STORMWIND_CITY },
						-- #else
						{ 25.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["races"] = { HUMAN, GNOME },
					["classes"] = { WARLOCK },
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- Surena's Choker
							["provider"] = { "i", 6810 },	-- Surena's Choker
							["coord"] = { 71.0, 80.6, MAP.ELWYNN_FOREST },
							["cr"] = 881,	-- Surena Caledon
						}),
					},
				}),
				q(434, {	-- The Attack!
					["sourceQuest"] = 2746,	-- Items of Some Consequence
					["qg"] = 7766,	-- Tyrion
					["coords"] = {
						-- #if AFTER WRATH
						{ 73.2, 35.7, MAP.STORMWIND_CITY },
						-- #else
						{ 69.2, 14.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
					["groups"] = {
						objective(1, {	-- 0/1 Lord Gregor Lescovar slain
							["provider"] = { "n", 1754 },	-- Lord Gregor Lescovar
						}),
						objective(2, {	-- 0/1 Marzon the Silent Blade slain
							["provider"] = { "n", 1755 },	-- Marzon the Silent Blade
						}),
					},
				}),
				q(42740, {	-- The Battle for Broken Shore
					["sourceQuest"] = 42782,	-- To Be Prepared
					-- ["altQuests"] = { 43806 },	-- Scenario Skip (A)
					["qg"] = 108916,	-- Knight Dameron
					["coord"] = { 19.0, 26.1, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["classes"] = exclude({ DEMONHUNTER }, ALL_CLASSES),
					["races"] = ALLIANCE_ONLY,
					-- CRIEVE NOTE: Perhaps move this and related quests/things to the Expansion Features section?
					-- Also find the right mapID for the scenario.
					["groups"] = {
						i(138767),	-- Stormwind Vanguard Battle Mace
						i(138772),	-- Stormwind Vanguard Bonegrinder
						i(138770),	-- Stormwind Vanguard Dagger
						i(138771),	-- Stormwind Vanguard Longbow
						i(138765),	-- Stormwind Vanguard Mageblade
						i(138769),	-- Stormwind Vanguard Polearm
						i(138768),	-- Stormwind Vanguard Quickblade
						i(136586),	-- Stormwind Vanguard Splitter
						i(138766),	-- Stormwind Vanguard Stave
						i(138764),	-- Stormwind Vanguard Waraxe
						o(240215, {	-- Ashes of a Fallen Crusader
							["coord"] = { 42.0, 42.0, BROKEN_ISLES},
							["groups"] = {
								i(139389, {	-- Charred Locket
									["description"] = "In order to get this you must do the scenario 'Battle for Broken Shore' and on Stage 6 search for a pile of ash titled 'Ashes of a Fallen Crusader' to retrieve the item. You will then go to 85, 69 in Elywnn Forest located at the Eastvale Logging Camp. From there you will go to the bedroom on the second floor to talk to Alaina. After talking to her leave (log or swap zones) and then come back to her to retrieve the item.",
									["groups"] = {
										o(252069, {	-- Alaina's Belongings
											["coord"] = { 85.6, 69.7, MAP.ELWYNN_FOREST },
											["groups"] = {
												i(139391),	-- Alaina's Bonnet (COSMETIC!)
											},
										}),
									},
								}),
							},
						}),
					},
				}),
				q(51795, {	-- The Battle for Lordaeron
					["sourceQuest"] = 53370,	-- Hour of Reckoning
					["qg"] = 144095,	-- Master Mathias Shaw
					["coord"] = { 22.4, 32.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_8_0_1, REMOVED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
				}),
				-- #if ANYCLASSIC
				q(65603, {	-- The Binding (Incubus) [Stormwind City]
					["sourceQuest"] = 65602,	-- What Is Love?
					["qg"] = 6122,	-- Gakin the Darkbinder
					["coords"] = {
						-- #if AFTER WRATH
						{ 39.2, 85.2, MAP.STORMWIND_CITY },
						-- #else
						{ 25.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARLOCK },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Summoned Incubus slain
							["provider"] = { "n", 185335 },	-- Summoned Incubus
							["cost"] = { { "i", 190186, 1 } },	-- Wooden Figurine
						}),
						-- #if BEFORE 4.0.3
						recipe(713),	-- Summon Incubus
						-- #endif
						i(22243, {	-- Small Soul Pouch
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				-- #endif
				q(1739, {	-- The Binding (Succubus) [Stormwind City]
					["sourceQuest"] = 1738,	-- Heartswood
					["qg"] = 6122,	-- Gakin the Darkbinder
					["coords"] = {
						-- #if AFTER WRATH
						{ 39.2, 85.2, MAP.STORMWIND_CITY },
						-- #else
						{ 25.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { WARLOCK },
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Summoned Succubus slain
							["provider"] = { "n", 5677 },	-- Summoned Succubus
							["cost"] = { { "i", 6913, 1 } },	-- Heartswood Core
						}),
						-- #if BEFORE 4.0.3
						recipe(712),	-- Summon Succubus
						-- #endif
						i(22243, {	-- Small Soul Pouch
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(1689, {	-- The Binding (Voidwalker) [Stormwind City]
					["sourceQuest"] = 1688,	-- Surena Caledon
					["qg"] = 6122,	-- Gakin the Darkbinder
					["coords"] = {
						-- #if AFTER WRATH
						{ 39.2, 85.2, MAP.STORMWIND_CITY },
						-- #else
						{ 25.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN, GNOME },
					["classes"] = { WARLOCK },
					["lvl"] = 10,
					["groups"] = {
						objective(1, {	-- 0/1 Summoned Voidwalker slain
							["provider"] = { "n", 5676 },	-- Summoned Voidwalker
							["cost"] = { { "i", 6928, 1 } },	-- Bloodstone Choker
						}),
						-- #if BEFORE 4.0.3
						recipe(697),	-- Summon Voidwalker
						-- #endif
					},
				}),
				q(39691, {	-- The Call of War
					["qg"] = 97296,	-- Archmage Khadgar
					["coord"] = { 72.4, 47.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { DEMONHUNTER },
				}),
				q(392, {	-- The Curious Visitor
					["sourceQuest"] = 391,	-- The Stockage Riots
					["providers"] = {
						{ "n", 1719 },	-- Warden Thelwater
						{ "i", 8687 },	-- Sealed Description of Thredd's Visitor
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 51.6, 69.4, MAP.STORMWIND_CITY },
						-- #else
						{ 41.2, 58.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				q(7646, {	-- The Divination Scryer
					["sourceQuest"] = 7644,	-- Blessed Arcanite Barding
					["qg"] = 928,	-- Lord Grayson Shadowbreaker <Paladin Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = {
						{ "i", 12800, 1 },	-- Azerothian Diamond
						{ "i", 18335, 1 },	-- Pristine Black Diamond
					},
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(28826, {	-- The Eye of the Storm
					["sourceQuest"] = 28825,	-- A Personal Summons
					["qg"] = 45226,	-- Naraat the Earthspeaker
					["coord"] = { 74.4, 18.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["groups"] = {
						objective(1, {	-- Peered into the Waters of Farseeing
							["provider"] = { "o", 207416 },	-- Waters of Farseeing
							["coord"] = { 74.3, 19.5, MAP.STORMWIND_CITY },
						}),
					},
				}),
				q(40517, {	-- The Fallen Lion
					["sourceQuest"] = 42740,	-- The Battle for Broken Shore (QuestID 43806 - Scenario Skip)
					["qg"] = 100395,	-- Genn Greymane
					["coord"] = { 19.8, 34.9, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(132251),	-- Letter to Anduin (QI!)
					},
				}),
				q(6182, {	-- The First and the Last
					["qgs"] = {
						-- #if AFTER WRATH
						29611,	-- King Varian Wrynn <King of Stormwind>
						-- #else
						1748,	-- Highlord Bolvar Fordragon
						-- #endif
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 79.8, 38.6, MAP.STORMWIND_CITY },	-- King Varian Wrynn <King of Stormwind>
						-- #else
						{ 78.0, 18.0, MAP.STORMWIND_CITY },	-- Highlord Bolvar Fordragon
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 56,
				}),
				q(394, {	-- The Head of the Beast
					["sourceQuest"] = 434,	-- The Attack!
					["qg"] = 482,	-- Elling Trias <Master of Cheese>
					["coords"] = {
						-- #if AFTER WRATH
						{ 66.0, 74.1, MAP.STORMWIND_CITY },
						-- #else
						{ 60.0, 64.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 16,
				}),
				q(26183, {	-- The King's Cider
					["qg"] = 42288,	-- Robby Flay
					["coords"] = {
						-- #if AFTER 9.2.5
						{ 50.7, 73.8, MAP.STORMWIND_CITY },
						-- #else
						{ 50.6, 71.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = COOKING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/12 Juicy Apple
							["providers"] = {
								{ "i",  57197 },	-- Juicy Apple
								{ "o", 203762 },	-- Juicy Apple
							},
							["coord"] = { 55.5, 74.2, MAP.STORMWIND_CITY },
						}),
						COOKING_AWARD,
					},
				}),
				q(25157, {	-- The Latest Fashion!
					["qg"] = 50480,	-- Isabel Jones
					["coord"] = { 63.8, 61.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3 },
					["requireSkill"] = JEWELCRAFTING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = JEWELCRAFTING_AWARD_GROUPS,
				}),
				q(1274, {	-- The Missing Diplomat (1/17)
					["qg"] = 4982,	-- Thomas <Altar Boy>
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.6, 44.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 28.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1241, {	-- The Missing Diplomat (2/17)
					["sourceQuest"] = 1274,	-- The Missing Diplomat (1/17)
					["providers"] = {
						{ "n", 4960 },	-- Bishop DeLavey
						{ "i", 5948 },	-- Letter to Jorgen
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 80.3, 44.1, MAP.STORMWIND_CITY },
						-- #else
						{ 78.4, 25.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1242, {	-- The Missing Diplomat (3/17)
					["sourceQuest"] = 1241,	-- The Missing Diplomat (2/17)
					["providers"] = {
						{ "n", 4959 },	-- Jorgen
						{ "i", 5946 },	-- Sealed Note to Elling
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 76.3, 85.1, MAP.STORMWIND_CITY },
						-- #else
						{ 73.2, 78.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1243, {	-- The Missing Diplomat (4/17)
					["sourceQuest"] = 1242,	-- The Missing Diplomat (3/17)
					["providers"] = {
						{ "n", 482 },	-- Elling Trias <Master of Cheese>
						{ "i", 5960 },	-- Sealed Note to Watcher Backus
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 66.0, 74.1, MAP.STORMWIND_CITY },
						-- #else
						{ 60.0, 64.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DUSKWOOD },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1244, {	-- The Missing Diplomat (5/17)
					["sourceQuest"] = 1243,	-- The Missing Diplomat (4/17)
					["qg"] = 840,	-- Watcher Backus
					["coord"] = { 73.21, 38.81, MAP.DUSKWOOD },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
					["groups"] = {
						objective(1, {	-- 0/1 Defias Docket
							["providers"] = {
								{ "o", 21052 },	-- Defias Strongbox
								{ "i", 5947 },	-- Defias Docket
							},
							["coord"] = { 24.0, 72.1, MAP.DUSKWOOD },
						}),
					},
				}),
				q(1245, {	-- The Missing Diplomat (6/17)
					["sourceQuest"] = 1244,	-- The Missing Diplomat (5/17)
					["providers"] = {
						{ "n", 840 },	-- Watcher Backus
						{ "i", 5947 },	-- Defias Docket
					},
					["coord"] = { 73.21, 38.81, MAP.DUSKWOOD },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1246, {	-- The Missing Diplomat (7/17)
					["sourceQuest"] = 1245,	-- The Missing Diplomat (6/17)
					["qg"] = 482,	-- Elling Trias <Master of Cheese>
					["coords"] = {
						-- #if AFTER WRATH
						{ 66.0, 74.1, MAP.STORMWIND_CITY },
						-- #else
						{ 60.0, 64.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1447, {	-- The Missing Diplomat (8/17)
					["description"] = "Dashel Stonefist will spawn 2 level 26 adds to fight alongside him.",
					["sourceQuest"] = 1246,	-- The Missing Diplomat (7/17)
					["qg"] = 4961,	-- Dashel Stonefist
					["coords"] = {
						-- #if AFTER WRATH
						{ 74.3, 59.2, MAP.STORMWIND_CITY },
						-- #else
						{ 70.5, 44.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1247, {	-- The Missing Diplomat (9/17)
					["sourceQuest"] = 1447,	-- The Missing Diplomat (8/17)
					["qg"] = 4961,	-- Dashel Stonefist
					["coords"] = {
						-- #if AFTER WRATH
						{ 74.3, 59.2, MAP.STORMWIND_CITY },
						-- #else
						{ 70.5, 44.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				q(1248, {	-- The Missing Diplomat (10/17)
					["sourceQuest"] = 1247,	-- The Missing Diplomat (9/17)
					["qg"] = 482,	-- Elling Trias <Master of Cheese>
					["coords"] = {
						-- #if AFTER WRATH
						{ 66.0, 74.1, MAP.STORMWIND_CITY },
						-- #else
						{ 60.0, 64.3, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 28,
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_FOUR, q(84418, {	-- The Missing Knight
					["qg"] = 5492,	-- Katherine the Pure <Paladin Trainer>
					["coord"] = { 37.4, 32.0, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_1_15_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						i(228238, {	-- Testament of Divine Steed
							["timeline"] = { ADDED_1_15_3 },
							["spellID"] = 461607,	-- Divine Steed
							["f"] = RECIPES,
						}),
					},
				})),
				-- #endif
				q(46728, {	-- The Nation of Kul Tiras
					["sourceQuest"] = 46727,	-- Battle for Azeroth: Tides of War (BfA version)
					["qg"] = 120756,	-- Anduin Wyrnn
					["coords"] = {
						{ 80.4, 33.4, MAP.STORMWIND_CITY },
						{ 85.0, 32.4, MAP.STORMWIND_CITY },
					},
					["timeline"] = { ADDED_8_0_1 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(27072, {	-- The Old Barracks
					["sourceQuest"] = 28807,	-- Expert Opinion
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coord"] = { 81.2, 63.2, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(2758, {	-- The Origins of Smithing
					["qg"] = 7798,	-- Hank the Hammer
					["coords"] = {
						-- #if AFTER WRATH
						{ 63.0, 36.4, MAP.STORMWIND_CITY },
						-- #else
						{ 56.0, 16.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = {
						-- #if SEASON_OF_DISCOVERY
						REMOVED_1_15_1,
						-- #else
						REMOVED_4_0_3,
						-- #endif
					},
					["cost"] = { { "i", 6040, 6 } },	-- Golden Scale Bracers
					["requireSkill"] = BLACKSMITHING,
					["learnedAt"] = 210,
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 40,
					["groups"] = {
						i(9367, {	-- Plans: Golden Scale Gauntlets (RECIPE!)
							-- #if BEFORE 4.0.3
							["description"] = "This item can be sold on the Neutral Auction House to Horde Blacksmiths for a... nominal fee.\n\nOnly naturally accessible to Alliance Blacksmiths.",
							-- #endif
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_TWO, q(80241, {	-- The Origins of Smithing
					["qg"] = 7798,	-- Hank the Hammer
					["coord"] = { 56.0, 16.0, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_1_15_1 },
					["cost"] = { { "i", 6040, 6 } },	-- Golden Scale Bracers
					["requireSkill"] = BLACKSMITHING,
					["learnedAt"] = 210,
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 40,
					["groups"] = {
						i(217274, {	-- Plans: Golden Scale Gauntlets (RECIPE!)
							["description"] = "This item can be sold on the Neutral Auction House to Horde Blacksmiths for a... nominal fee.\n\nOnly naturally accessible to Alliance Blacksmiths.",
							["timeline"] = { ADDED_1_15_1 },
						}),
					},
				})),
				-- #endif
				q(543, {	-- The Perenolde Tiara
					["qg"] = 2285,	-- Count Remington Ridgewell
					["coords"] = {
						-- #if AFTER CATA
						{ 81.6, 34.1, MAP.STORMWIND_CITY },
						-- #elseif AFTER WRATH
						{ 76.9, 47.8, MAP.STORMWIND_CITY },
						-- #else
						{ 74.0, 30.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["maps"] = {
						-- #if AFTER CATA
						MAP.HILLSBRAD_FOOTHILLS,
						-- #else
						MAP.ALTERAC_MOUNTAINS,
						-- #endif
					},
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(30, 30, 7),
					["groups"] = {
						objective(1, {	-- 0/1 Perenolde Tiara
							["provider"] = { "i", 3684 },	-- Perenolde Tiara
							["coords"] = {
								-- #if AFTER CATA
								{ 45.0, 24.5, MAP.HILLSBRAD_FOOTHILLS },
								-- #else
								{ 39.6, 52.8, MAP.ALTERAC_MOUNTAINS },
								-- #endif
							},
							["cr"] = 2417,	-- Grel'borg the Miser
						}),
						i(248662, {	-- Jewelcrafter's Tent (DECOR!)
							["timeline"] = { ADDED_11_2_7 },
						}),
					},
				}),
				q(58675, {	-- The Price of Peace
					["sourceQuest"] = 58674,	-- A Gathering of Champions
					["qg"] = 162178,	-- Master Mathias Shaw
					["coord"] = { 53.2, 15.0, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_8_3_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(2998, {	-- The Tome of Divinity (1a/10)
					["altQuests"] = {
						3681,	-- The Tome of Divinity (1b/10)
						1787,	-- The Tome of Divinity (8)
					},
					["qg"] = 927,	-- Brother Wilhelm
					["coord"] = { 41.0, 66.0, MAP.ELWYNN_FOREST },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(3681, {	-- The Tome of Divinity (1b/10)
					["altQuests"] = {
						2998,	-- The Tome of Divinity (1a/10)
						1787,	-- The Tome of Divinity (8)
					},
					["qg"] = 5149,	-- Brandur Ironhammer <Paladin Trainer>
					["coord"] = { 23.4, 6.2, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1641, {	-- The Tome of Divinity (2/10)
					["sourceQuests"] = {
						2998,	-- The Tome of Divinity (1a/10)
						3681,	-- The Tome of Divinity (1b/10)
					},
					["altQuests"] = { 1787 },	-- The Tome of Divinity (8)
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1642, {	-- The Tome of Divinity (3/10)
					["sourceQuest"] = 1641,	-- The Tome of Divinity (2/10)
					["providers"] = {
						{ "n", 6171 },	-- Duthorian Rall
						{ "i", 6775 },	-- Tome of Divinity
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1643, {	-- The Tome of Divinity (4/10)
					["sourceQuest"] = 1642,	-- The Tome of Divinity (3/10)
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1644, {	-- The Tome of Divinity (5/10)
					["sourceQuest"] = 1643,	-- The Tome of Divinity (4/10)
					["qg"] = 6174,	-- Stephanie Turner
					["coords"] = {
						-- #if AFTER WRATH
						{ 63.8, 72.2, MAP.STORMWIND_CITY },
						-- #else
						{ 57.0, 61.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 2589, 10 } },	-- Linen Cloth
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1780, {	-- The Tome of Divinity (6/10)
					["sourceQuest"] = 1644,	-- The Tome of Divinity (5/10)
					["qg"] = 6174,	-- Stephanie Turner
					["coords"] = {
						-- #if AFTER WRATH
						{ 63.8, 72.2, MAP.STORMWIND_CITY },
						-- #else
						{ 57.0, 61.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1781, {	-- The Tome of Divinity (7/10)
					["sourceQuest"] = 1780,	-- The Tome of Divinity (6/10)
					["providers"] = {
						{ "n", 6171 },	-- Duthorian Rall
						{ "i", 6866 },	-- Symbol of Life
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
				}),
				q(1786, {	-- The Tome of Divinity (8/10)
					["sourceQuest"] = 1781,	-- The Tome of Divinity (7/10)
					["qg"] = 6173,	-- Gazin Tenorm
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.5, 44.9, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 26.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
					["groups"] = {
						q(1790, {	-- The Symbol of Life
							["qg"] = 6171,	-- Duthorian Rall
							["coords"] = {
								-- #if AFTER WRATH
								{ 50.5, 47.5, MAP.STORMWIND_CITY },
								-- #else
								{ 39.8, 30.8, MAP.STORMWIND_CITY },
								-- #endif
							},
							["timeline"] = { REMOVED_4_0_3 },
							["repeatable"] = true,
							["groups"] = {
								objective(1, {	-- 0/1 Symbol of Life
									["questID"] = 1786,	-- The Tome of Divinity (8/10)
									["provider"] = { "i", 6866 },	-- Symbol of Life
								}),
							},
						}),
					},
				}),
				q(1787, {	-- The Tome of Divinity (9/10)
					["sourceQuest"] = 1786,	-- The Tome of Divinity (8/10)
					["qg"] = 6172,	-- Henze Faulk
					["coord"] = { 72.6, 51.6, MAP.ELWYNN_FOREST },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
					["groups"] = {
						objective(1, {	-- 0/1 Defias Script
							["provider"] = { "i", 6846 },	-- Defias Script
							["cr"] = 474,	-- Defias Rogue Wizard
						}),
					},
				}),
				q(1788, {	-- The Tome of Divinity (10/10)
					["sourceQuest"] = 1787,	-- The Tome of Divinity (9/10)
					["qg"] = 6173,	-- Gazin Tenorm
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.5, 44.9, MAP.STORMWIND_CITY },
						-- #else
						{ 38.6, 26.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = { HUMAN },
					["classes"] = { PALADIN },
					["lvl"] = 12,
					-- #if BEFORE 4.0.1
					["groups"] = {
						-- recipe(7328),	-- Redemption [Rank 1]
					},
					-- #endif
				}),
				q(4485, {	-- The Tome of Nobility (Stormwind City)
					["qg"] = 5491,	-- Arthur the Faithful <Paladin Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 49.6, 49.9, MAP.STORMWIND_CITY },
						-- #else
						{ 38.7, 32.9, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_2_4_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["isBreadcrumb"] = true,
					["lvl"] = 40,
				}),
				q(4486, {	-- The Tome of Nobility (Ironforge)
					["qg"] = 5149,	-- Brandur Ironhammer <Paladin Trainer>
					["coord"] = { 23.6, 6.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_2_4_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["isBreadcrumb"] = true,
					["lvl"] = 40,
				}),
				q(1661, {	-- The Tome of Nobility
					["sourceQuests"] = {
						4485,	-- The Tome of Nobility (Stormwind City)
						4486,	-- The Tome of Nobility (Ironforge)
					},
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_2_4_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["lvl"] = 40,
					-- #if BEFORE 2.4.3
					["groups"] = {
						mount(13819),	-- Summon Warhorse
					},
					-- #endif
				}),
				q(1794, {	-- The Tome of Valor [Dwarf]
					["qg"] = 5149,	-- Brandur Ironhammer <Paladin Trainer>
					["coord"] = { 23.6, 6.4, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = { DWARF },
					["repeatable"] = true,
					["lvl"] = 20,
				}),
				q(1793, {	-- The Tome of Valor [Human]
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = { HUMAN },
					["repeatable"] = true,
					["lvl"] = 20,
				}),
				q(1649, {	-- The Tome of Valor (1/4)
					["sourceQuests"] = {
						1794,	-- The Tome of Valor [Dwarf]
						1793,	-- The Tome of Valor [Human]
					},
					["providers"] = {
						{ "n", 6171 },	-- Duthorian Rall
						{ "i", 6776 },	-- Tome of Valor
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["lvl"] = 20,
				}),
				q(1650, {	-- The Tome of Valor (2/4)
					["sourceQuest"] = 1649,	-- The Tome of Valor (1/4)
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["lvl"] = 20,
				}),
				q(1651, {	-- The Tome of Valor (3/4)
					["sourceQuest"] = 1650,	-- The Tome of Valor (2/4)
					["qg"] = 6182,	-- Daphne Stilwell
					["coord"] = { 42.4, 88.4, MAP.WESTFALL },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["lvl"] = 20,
				}),
				q(1652, {	-- The Tome of Valor (4/4)
					["sourceQuest"] = 1651,	-- The Tome of Valor (3/4)
					["qg"] = 6171,	-- Duthorian Rall
					["coords"] = {
						-- #if AFTER WRATH
						{ 50.5, 47.5, MAP.STORMWIND_CITY },
						-- #else
						{ 39.8, 30.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { PALADIN },
					["lvl"] = 20,
					["groups"] = {
						-- #if BEFORE 4.0.3
						recipe(5502),	-- Sense Undead
						-- #endif
						i(9607, {	-- Bastion of Stormwind
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2607, {	-- The Touch of Zanzil (1/3)
					["sourceQuest"] = 2359,	-- Klaven's Tower
					["qg"] = 332,	-- Master Mathias Shaw <Leader of SI:7>
					["coords"] = {
						-- #if AFTER WRATH
						{ 78.3, 70.7, MAP.STORMWIND_CITY },
						-- #else
						{ 75.8, 59.8, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 20,
				}),
				q(2608, {	-- The Touch of Zanzil (2/3)
					["sourceQuest"] = 2607,	-- The Touch of Zanzil (1/3)
					["qg"] = 7207,	-- Doc Mixilpixil
					["coords"] = {
						-- #if AFTER WRATH
						{ 80.1, 69.9, MAP.STORMWIND_CITY },
						-- #else
						{ 78.0, 59.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- Diagnosis Complete
							["description"] = "Type /lay to lie down to be examined.",
						}),
					},
				}),
				q(2609, {	-- The Touch of Zanzil (3/3)
					["sourceQuest"] = 2608,	-- The Touch of Zanzil (2/3)
					["qg"] = 7207,	-- Doc Mixilpixil
					["coords"] = {
						-- #if AFTER WRATH
						{ 80.1, 69.9, MAP.STORMWIND_CITY },
						-- #else
						{ 78.0, 59.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = {
						{ "i", 3372, 1 },	-- Leaded Vial
						{ "i", 4371, 1 },	-- Bronze Tube
					},
					["races"] = ALLIANCE_ONLY,
					["classes"] = { ROGUE },
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Simple Wildflowers
							["provider"] = { "i", 3421 },	-- Simple Wildflowers
							["coords"] = {
								-- #if AFTER WRATH
								{ 69.6, 71.6, MAP.STORMWIND_CITY },
								-- #else
								{ 64.2, 61.0, MAP.STORMWIND_CITY },
								-- #endif
							},
							["crs"] = {
								1302,	-- Bernard Gump <Florist>
								1303,	-- Felicia Gump <Herbalism Supplies>
							},
						}),
						objective(4, {	-- 0/1 Spool of Light Chartreuse Silk Thread
							["providers"] = {
								{ "i",   8431 },	-- Spool of Light Chartreuse Silk Thread
								{ "o", 140911 },	-- Spool of Light Chartreuse Silk Thread
							},
							["coord"] = { 39.9, 46.3, MAP.STORMWIND_CITY },
							["coords"] = {
								-- #if AFTER WRATH
								{ 50.4, 60.2, MAP.STORMWIND_CITY },
								-- #else
								{ 39.9, 46.5, MAP.STORMWIND_CITY },
								-- #endif
							},
						}),
						i(8432, {	-- Eau de Mixilpixil
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26997, {	-- The Usual Suspects
					["sourceQuest"] = 26977,	-- Twilight Investigation
					["qg"] = 2439,	-- Major Samuelson <Stormwind City Guard>
					["coord"] = { 85.1, 31.0, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(7641, {	-- The Work of Grimand Elmore
					["sourceQuests"] = {
						-- #if SEASON_OF_DISCOVERY
						7670,	-- Lord Grayson Shadowbreaker [Ironforge]
						7638,	-- Lord Grayson Shadowbreaker [Stormwind City]
						-- #else
						7640,	-- Exorcising Terrordale
						-- #endif
					},
					["qg"] = 928,	-- Lord Grayson Shadowbreaker <Paladin Trainer>
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.6, 50.0, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 32.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(26536, {	-- Thunder Falls
					["qg"] = 5494,	-- Catherine Leland
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_1 },
					["maps"] = { MAP.ELWYNN_FOREST },
					["requireSkill"] = FISHING,
					["races"] = ALLIANCE_ONLY,
					["isDaily"] = true,
					["groups"] = {
						objective(1, {	-- 0/4 Violet Perch
							["provider"] = { "i", 58899 },	-- Violet Perch
							["coord"] = { 23.9, 59.8, MAP.ELWYNN_FOREST },
						}),
						i(67414),	-- Bag of Shiny Things
					},
				}),
				q(42782, {	-- To Be Prepared
					["sourceQuest"] = 40519,	-- The Legion Returns
					["qg"] = 107934,	-- Recruiter Lee
					["coord"] = { 36.8, 43.1, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(138450, {	-- Signet of Stormwind
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(7639, {	-- To Show Due Judgment
					["sourceQuest"] = 7637,	-- Emphasis on Sacrifice
					["providers"] = {
						{ "n", 11406 },	-- High Priest Rohan <Priest Trainer>
						{ "i", 18819 },	-- Rohan's Exorcism Censer
					},
					["coord"] = { 25.0, 8.2, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 60,
				}),
				q(1449, {	-- To The Hinterlands
					["sourceQuest"] = 1448,	-- In Search of The Temple
					["qg"] = 5384,	-- Brohann Caskbelly <Explorers' League>
					["coords"] = {
						-- #if AFTER WRATH
						{ 69.5, 40.4, MAP.STORMWIND_CITY },
						-- #else
						{ 64.3, 20.7, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.THE_HINTERLANDS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 38,
				}),
				q(26977, {	-- Twilight Investigation
					["sourceQuest"] = 26960,	-- My Son, the Prince
					["qg"] = 29611,	-- King Varian Wrynn <King of Stormwind>
					["coord"] = { 85.8, 31.7, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(47222, {	-- Two If By Sea
					["sourceQuests"] = {
						47221,	-- The Hand of Fate
						48506,	-- The Hand of Fate
					},
					["qg"] = 121754,	-- Vereesa Windrunner
					["coord"] = { 21.4, 30.4, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(27060, {	-- Unholy Cow
					["sourceQuest"] = 27044,	-- Peasant Problems
					["qg"] = 44807,	-- Farmer Wollerton
					["coord"] = { 52.0, 5.8, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_4_0_3, REMOVED_7_0_3 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(1938, {	-- Ur's Treatise on Shadow Magic
					["sourceQuest"] = 1939,	-- High Sorcerer Andromath
					["qg"] = 5694,	-- High Sorcerer Andromath
					["coords"] = {
						-- #if AFTER WRATH
						{ 48.7, 87.6, MAP.STORMWIND_CITY },
						-- #else
						{ 37.6, 81.6, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.REDRIDGE_MOUNTAINS },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { MAGE },
					["lvl"] = 26,
					["groups"] = {
						objective(1, {	-- 0/1 Ur's Treatise on Shadow Magic
							["providers"] = {
								{ "i",   7266 },	-- Ur's Treatise on Shadow Magic
								{ "o", 103628 },	-- Ur's Treatise on Shadow Magic
							},
							["coord"] = { 79.0, 37.6, MAP.REDRIDGE_MOUNTAINS },
							["description"] = "Located in one of the bookshelves at the top of the tower.",
						}),
					},
				}),
				q(60969, {	-- Warlords of Draenor: Onward to Adventure in Draenor
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.3, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				-- #if ANYCLASSIC
				q(65602, {	-- What Is Love?
					["qg"] = 6122,	-- Gakin the Darkbinder
					["coords"] = {
						-- #if AFTER WRATH
						{ 39.2, 85.2, MAP.STORMWIND_CITY },
						-- #else
						{ 25.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ASHENVALE },
					["classes"] = { WARLOCK },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Wooden Figurine
							["providers"] = {
								{ "i", 190309 },	-- Wooden Figurine
								{ "o", 375544 },	-- Wooden Figurine
								{ "o", createCustomObject({	-- Archaeologist's Cart [Couldn't find the proper objectID, so I faked it.]
									readable = "Archaeologist's Cart",
									text = {
										en = "Archaeologist's Cart",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "考古学家的车",
										tw = "考古學家的推車",
									},
								}) },
							},
							["coord"] = { 26.0, 22.0, MAP.ASHENVALE },
							["cost"] = { { "i", 190308, 1 } },	-- Burning Torch
						}),
						i(190308, {	-- 0/1 Burning Torch
							["description"] = "You can light the torch using a campfire. If you don't have the cooking skill (or mats), you can go to the campfire near Talen at 15,31. Once lit, toss the torch on to the Archaeologist's Cart.",
							["providers"] = {
								{ "i", 190307 },	-- Unlit Torch
								{ "o", createCustomObject({	-- Unlit Torch [Couldn't find the proper objectID, so I faked it.]
									readable = "Unlit Torch",
									model = 201129,
									icon = 135434,
									text = {
										en = "Unlit Torch",
										de = "Nicht angezündete Fackel",
										es = "Antorcha apagada",
										-- TODO: mx = "",
										fr = "Torche éteinte",
										it = "Unlit Torch",
										ko = "불을 붙이지 않은 횃불",
										pt = "Tocha Apagada",
										ru = "Незажженный факел",
										cn = "未点燃的火把",
										-- TODO: tw = "",
									},
								}) },
							},
							["coords"] = {
								{ 26.79, 22.42, MAP.ASHENVALE },
								{ 15.0, 31.0, MAP.ASHENVALE },
							},
						}),
					},
				}),
				-- #endif
				q(58502, {	-- Where the Heart Is
					["sourceQuest"] = 58498,	-- Return of the Warrior King
					["qg"] = 154532,	-- Magni Bronzebeard <The Speaker>
					["coord"] = { 87.5, 35.5, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_8_3_0 },
					["races"] = ALLIANCE_ONLY,
				}),
				q(332, {	-- Wine Shop Advert
					-- #if BEFORE CATA
					["sourceQuest"] = 61,	-- Shipment to Stormwind
					-- #endif
					["providers"] = {
						{ "n", 1432 },	-- Renato Gallina
						{ "i", 2722 },	-- Wine Ticket (PQI!)
					},
					["coords"] = {
						-- #if AFTER WRATH
						{ 63.8, 73.6, MAP.STORMWIND_CITY },
						-- #else
						{ 57.0, 63.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2723),	-- Bottle of Dalaran Noir
					},
				}),
				q(60962, {	-- Wrath of the Lich King: Onward to Adventure in Northrend
					["sourceQuest"] = 60096,	-- Wrath of the Lich King: To Northrend!
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.2, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_9_0_1 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["repeatable"] = true,
				}),
				q(60096, {	-- Wrath of the Lich King: To Northrend!
					["qg"] = 167032,	-- Chromie <Emissary of the Bronze Dragonflight>
					["coord"] = { 56.3, 17.3, MAP.STORMWIND_CITY },
					["timeline"] = { ADDED_7_3_5 },
					["races"] = ALLIANCE_ONLY,
					["lockCriteria"] = { 1, "lvl", LEVEL_CHROMIETIME_MAX },
					["isBreadcrumb"] = true,
				}),
				q(397, {	-- You Have Served Us Well
					["sourceQuest"] = 336,	-- A Noble Brew (2/2)
					["qg"] = 1435,	-- Zardeth of the Black Claw
					["coords"] = {
						-- #if AFTER WRATH
						{ 40.1, 85.3, MAP.STORMWIND_CITY },
						-- #else
						{ 26.4, 78.4, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["classes"] = { WARLOCK },
					["lvl"] = 25,
					["groups"] = {
						i(3556, {	-- Dread Mage Hat
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_ONE, q(78297, {	-- You've Got Yourself A Deal [A]
					["sourceQuest"] = 78287,	-- Let Me Make You An Offer [A]
					["providers"] = {
						{ "n",   8383 },	-- Master Wood
						{ "i", 211448 },	-- Signed Procurement Contract
					},
					["coord"] = { 79.2, 47.6, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_2_0_1 },
					["maps"] = { MAP.THE_BARRENS },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						i(210210),	-- Grizzwerks Defense Industries Founder's Certificate
					},
				})),
				-- #endif
			}),
			n(RARES, {
				n(3581, {	-- Sewer Beast
					["coords"] = {
						{ 49.8, 22.6, MAP.STORMWIND_CITY },
						{ 53.8, 30.6, MAP.STORMWIND_CITY },
						{ 66.8, 32.2, MAP.STORMWIND_CITY },
						{ 62.6, 38.0, MAP.STORMWIND_CITY },
						{ 66.6, 57.0, MAP.STORMWIND_CITY },
						{ 62.4, 50.2, MAP.STORMWIND_CITY },
						{ 35.2, 42.4, MAP.STORMWIND_CITY },
						{ 38.6, 47.4, MAP.STORMWIND_CITY },
						{ 31.4, 64.4, MAP.STORMWIND_CITY },
						{ 34.2, 60.2, MAP.STORMWIND_CITY },
						{ 50.0, 69.6, MAP.STORMWIND_CITY },
						{ 47.2, 61.6, MAP.STORMWIND_CITY },
					},
				}),
			}),
			n(TREASURES, {
				applyclassicphase(PHASE_FIVE, o(180665, {	-- Draconic for Dummies
					["coords"] = {
						-- #if AFTER WRATH
						{ 75.35, 29.73, MAP.STORMWIND_CITY },
						-- #else
						{ 72.0, 6.0, MAP.STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { ADDED_1_9_0, REMOVED_4_0_3 },
					["groups"] = {
						i(21107),	-- Draconic for Dummies [Chapter V]
					},
				})),
			}),
			n(VENDORS, {
				n(1347, {	-- Alexandra Bolero <Tailoring Supplies>
					["coord"] = { 53.2, 81.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(6274, {	-- Pattern: Blue Overalls (RECIPE!)
							["isLimited"] = true,
						}),
						i(10325, {	-- Pattern: White Wedding Dress (RECIPE!)
							["isLimited"] = true,
						}),
					},
				}),
				n(1315, {	-- Allan Hafgan <Staves Merchant>
					["coord"] = { 52.9, 75.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2527),	-- Battle Staff
						i(2535),	-- War Staff
					},
				}),
				n(1312, {	-- Ardwyn Cailen <Wand Merchant>
					["coord"] = { 52.8, 75.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(5239),	-- Blackbone Wand
						i(5210),	-- Burning Wand
						i(5236),	-- Combustible Wand
						i(5211),	-- Dusk Wand
						i(5209),	-- Gloom Wand
						i(5347),	-- Pestilent Wand
						i(5238),	-- Pitchwood Wand
						i(5208),	-- Smoldering Wand
					},
				}),
				n(1349, {	-- Agustus Moulaine <Mail Armor Merchant>
					["coord"] = { 53.6, 57.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2419,	-- Augmented Chain Belt
						2420,	-- Augmented Chain Boots
						2421,	-- Augmented Chain Bracers
						2422,	-- Augmented Chain Gloves
						3891,	-- Augmented Chain Helm
						2418,	-- Augmented Chain Leggings
						2417,	-- Augmented Chain Vest
						2424,	-- Brigandine Belt
						2426,	-- Brigandine Boots
						2427,	-- Brigandine Bracers
						2428,	-- Brigandine Gloves
						3894,	-- Brigandine Helm
						2425,	-- Brigandine Leggings
						2423,	-- Brigandine Vest
						2451,	-- Crested Heater Shield
						2448,	-- Heavy Pavise
						2446,	-- Kite Shield
						17189,	-- Metal Buckler
						17190,	-- Ornate Buckler
						8094,	-- Platemail Armor
						8088,	-- Platemail Belt
						8089,	-- Platemail Boots
						8090,	-- Platemail Bracers
						8091,	-- Platemail Gloves
						8092,	-- Platemail Helm
						8093,	-- Platemail Leggings
						2148,	-- Polished Scale Belt
						2149,	-- Polished Scale Boots
						2150,	-- Polished Scale Bracers
						2151,	-- Polished Scale Gloves
						2152,	-- Polished Scale Leggings
						2153,	-- Polished Scale Vest
						17192,	-- Reinforced Targe
					}},
				}),
				n(1302, {	-- Bernard Gump <Florist>
					["coord"] = { 69.6, 71.4, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(3422),	-- Beautiful Wildflowers
						i(3420),	-- Black Rose
						i(3424),	-- Bouquet Of Black Roses
						i(3423),	-- Bouquet Of White Roses
						i(3419),	-- Red Rose
						i(3421),	-- Simple Wildflowers
					},
				}),
				n(5514, {	-- Brooke Stonebraid <Mining Supplies>
					["coord"] = { 59.2, 37.5, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{ "sub", "common_vendor", 4256 }},	-- Golnir Bouldertoe <Mining Supplies>
				}),
				n(1319, {	-- Bryan Cross <Shield Merchant>
					["coord"] = { 69.6, 57.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2451,	-- Crested Heater Shield
						2448,	-- Heavy Pavise
						2446,	-- Kite Shield
						17189,	-- Metal Buckler
						17190,	-- Ornate Buckler
						17192,	-- Reinforced Targe
					}},
					["groups"] = {
						i(2445),	-- Large Metal Shield
						i(17188),	-- Ringed Buckler
					},
				}),
				n(12777, {	-- Captain Dirgehammer <Armor Quartermaster>
					["description"] = "Found within the Champion's Hall.",
					["sym"] = {	-- Grand Marshal Armor
						{"sub", "pvp_gear_base", EXPANSION.CLASSIC, FACTION_HEADER_ALLIANCE },
						{ "pop" },
						{ "exclude", "headerID", WEAPONS },
						{ "exclude", "f", TRINKET_F, NECK_F },
					},
					["races"] = ALLIANCE_ONLY,
				}),
				n(12782, {	-- Captain O'Neal <Weapons Quartermaster>
					["description"] = "Found within the Champion's Hall.",
					["sym"] = {{"sub", "pvp_gear_base", EXPANSION.CLASSIC, FACTION_HEADER_ALLIANCE, WEAPONS },{ "pop" }},	-- Grand Marshal Weapons
					["races"] = ALLIANCE_ONLY,
				}),
				n(1291, {	-- Carla Granger <Cloth Armor Merchant>
					["coord"] = { 62.2, 67.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(16059),	-- Common Brown Shirt
						i(3428),	-- Common Grey Shirt
						i(16060),	-- Common White Shirt
						i(837),	-- Heavy Weave Armor
						i(3589),	-- Heavy Weave Belt
						i(3590),	-- Heavy Weave Bracers
						i(839),	-- Heavy Weave Gloves
						i(838),	-- Heavy Weave Pants
						i(840),	-- Heavy Weave Shoes
						i(3602),	-- Knitted Belt
						i(3603),	-- Knitted Bracers
						i(793),	-- Knitted Gloves
						i(794),	-- Knitted Pants
						i(792),	-- Knitted Sandals
						i(795),	-- Knitted Tunic
						i(3597),	-- Thick Cloth Belt
						i(3598),	-- Thick Cloth Bracers
						i(203),	-- Thick Cloth Gloves
						i(201),	-- Thick Cloth Pants
						i(202),	-- Thick Cloth Shoes
						i(200),	-- Thick Cloth Vest
					},
				}),
				n(5494, {	-- Catherine Leland <Fishing Supplier>
					["coord"] = { 55.0, 69.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(6325),	-- Recipe: Brilliant Smallfish (RECIPE!)
						i(6330),	-- Recipe: Bristle Whisker Catfish (RECIPE!)
						i(6368),	-- Recipe: Rainbow Fin Albacore (RECIPE!)
					},
				}),
				n(1307, {	-- Charys Yserian <Arcane Trinkets Vendor>
					["coord"] = { 44.8, 86.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(4824, {	-- Blurred Axe
							["isLimited"] = true,
						}),
						i(4825, {	-- Callous Axe
							["isLimited"] = true,
						}),
						i(4829, {	-- Dreamer's Belt
							["isLimited"] = true,
						}),
						i(4826, {	-- Marauder Axe
							["isLimited"] = true,
						}),
						i(4828, {	-- Nightwind Belt
							["isLimited"] = true,
						}),
						i(4827, {	-- Wizard's Belt
							["isLimited"] = true,
						}),
					},
				}),
				n(1304, {	-- Darian Singh <Fireworks Vendor>
					["coord"] = { 42.6, 76.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(18649, {	-- Schematic: Blue Firework (RECIPE!)
							["isLimited"] = true,
						}),
					},
				}),
				n(1314, {	-- Duncan Cullen <Light Armor Merchant>
					["coord"] = { 53.2, 81.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2142),	-- Cuirboulli Belt
						i(2143),	-- Cuirboulli Boots
						i(2144),	-- Cuirboulli Bracers
						i(2145),	-- Cuirboulli Gloves
						i(2146),	-- Cuirboulli Pants
						i(2141),	-- Cuirboulli Vest
						i(2435),	-- Embroidered Armor
						i(3587),	-- Embroidered Belt
						i(2438),	-- Embroidered Boots
						i(3588),	-- Embroidered Bracers
						i(2440),	-- Embroidered Gloves
						i(3892),	-- Embroidered Hat
						i(2437),	-- Embroidered Pants
						i(2160),	-- Padded Armor
						i(3591),	-- Padded Belt
						i(2156),	-- Padded Boots
						i(3592),	-- Padded Bracers
						i(2158),	-- Padded Gloves
						i(2159),	-- Padded Pants
						i(2471),	-- Reinforced Leather Belt
						i(2473),	-- Reinforced Leather Boots
						i(2474),	-- Reinforced Leather Bracers
						i(3893),	-- Reinforced Leather Cap
						i(2475),	-- Reinforced Leather Gloves
						i(2472),	-- Reinforced Leather Pants
						i(2470),	-- Reinforced Leather Vest
						i(3593),	-- Russet Belt
						i(2432),	-- Russet Boots
						i(3594),	-- Russet Bracers
						i(2434),	-- Russet Gloves
						i(3889),	-- Russet Hat
						i(2431),	-- Russet Pants
						i(2429),	-- Russet Vest
						i(2464),	-- Studded Belt
						i(2467),	-- Studded Boots
						i(2468),	-- Studded Bracers
						i(2463),	-- Studded Doublet
						i(2469),	-- Studded Gloves
						i(3890),	-- Studded Hat
						i(2465),	-- Studded Pants
					},
				}),
				n(483, {	-- Elaine Trias <Mistress of Cheese>
					["coord"] = { 66.6, 73.4, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(8932),	-- Alterac Swiss
						i(414),	-- Dalaran Sharp
						i(2070),	-- Darnassian Bleu
						i(422),	-- Dwarven Mild
						i(3927),	-- Fine Aged Cheddar
						i(1707),	-- Stormwind Brie
					},
				}),
				n(5503, {	-- Eldraeith <Herbalism Supplier>
					["coord"] = { 55.6, 85.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{ "sub", "common_vendor", 4216 }},	-- Chardryn <Herbalism Supplies>
				}),
				n(5483, {	-- Erika Tate <Cooking Supplier>
					["coord"] = { 77.6, 53.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(21219),	-- Recipe: Sagefish Delight (RECIPE!)
						i(21099),	-- Recipe: Smoked Sagefish (RECIPE!)
					},
				}),
				n(1303, {	-- Felicia Gump <Herbalism Supplier>
					["coord"] = { 64.2, 60.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						3422,	-- Beautiful Wildflowers
						3420,	-- Black Rose
						3424,	-- Bouquet Of Black Roses
						3423,	-- Bouquet Of White Roses
						3419,	-- Red Rose
						3421,	-- Simple Wildflowers
					}},
					["groups"] = {
						i(2665),	-- Stormwind Seasoning Herbs
					},
				}),
				n(1298, {	-- Frederick Stover <Bow & Arrow Merchant>
					["coord"] = { 58.6, 69.0, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						3027,	-- Heavy Recurve Bow
						3026,	-- Reinforced Bow
					}},
					["groups"] = {
						i(11303, {	-- Fine Shortbow
							["isLimited"] = true,
						}),
						i(11307, {	-- Massive Longbow
							["isLimited"] = true,
						}),
						i(11306, {	-- Sturdy Recurve
							["isLimited"] = true,
						}),
					},
				}),
				n(1333, {	-- Gerik Koen <Two Handed Weapon Merchant>
					["coord"] = { 73.2, 57.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2523),	-- Bullova
						i(2521),	-- Flamberge
						i(2531),	-- Great Axe
						i(2525),	-- War Hammer
						i(2533),	-- War Maul
						i(2529),	-- Zweihander
					},
				}),
				n(1348, {	-- Gregory Ardus <Staff & Mace Merchant>
					["coord"] = { 48.2, 54.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						925,	-- Flail
						1197,	-- Giant Mace
						2030,	-- Gnarled Staff
						2028,	-- Hammer
						928,	-- Long Staff
						852,	-- Mace
						924,	-- Maul
						854,	-- Quarter Staff
						2026,	-- Rock Hammer
					}},
					["groups"] = {
						i(2492),	-- Cudgel
						i(2493),	-- Wooden Mallet
					},
				}),
				n(1289, {	-- Gunther Weller <Weapons Merchant>
					["coord"] = { 64.0, 68.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(926),	-- Battle Axe
						i(2025),	-- Bearded Axe
						i(1198),	-- Claymore
						i(2029),	-- Cleaver
						i(851),	-- Cutlass
						i(922),	-- Dacian Falx
						i(927),	-- Double Axe
						i(2024),	-- Espadon
						i(925),	-- Flail
						i(1197),	-- Giant Mace
						i(2030),	-- Gnarled Staff
						i(2028),	-- Hammer
						i(853),	-- Hatchet
						i(15811),	-- Heavy Spear
						i(2207),	-- Jambiya
						i(2209),	-- Kris
						i(923),	-- Longsword
						i(928),	-- Long Staff
						i(852),	-- Mace
						i(924),	-- Maul
						i(2208),	-- Poniard
						i(854),	-- Quarter Staff
						i(2027),	-- Scimitar
						i(2026),	-- Rock Hammer
						i(15810),	-- Short Spear
						i(1196),	-- Tabar
					},
				}),
				n(1324, {	-- Heinrich Stone <Blade Merchant>
					["coord"] = { 77.0, 57.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2520),	-- Broadsword
						i(2528),	-- Falchion
						i(2526),	-- Main Gauche
						i(2534),	-- Rondel
					},
				}),
				n(1318, {	-- Jessara Cordell <Enchanting Supplies>
					["coord"] = { 53.0, 74.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {
						{ "select","itemID",
							20753,	-- Formula: Lesser Wizard Oil (RECIPE!)
							20752,	-- Formula: Minor Mana Oil (RECIPE!)
							20758,	-- Formula: Minor Wizard Oil (RECIPE!)
							6342,	-- Formula: Enchant Chest - Minor Mana (RECIPE!)
							22307,	-- Pattern: Enchanted Mageweave Pouch (RECIPE!)
						},
					},
				}),
				n(5512, {	-- Kaita Deepforge <Blacksmithing Supplies>
					["coord"] = { 63.2, 37.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(12162, {	-- Plans: Hardened Iron Shortsword (RECIPE!)
							["isLimited"] = true,
						}),
					},
				}),
				n(5509, {	-- Kathrum Axehand <Axe Merchant>
					["coord"] = { 59.6, 34.0, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2523,	-- Bullova
						2531,	-- Great Axe
					}},
					["groups"] = {
						i(2522),	-- Crescent Axe
						i(2530),	-- Francisca
					},
				}),
				n(340, {	-- Kendor Kabonka <Master of Cooking Recipes>
					["coord"] = { 76.4, 53.0, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2889),	-- Recipe: Beer Basted Boar Ribs (RECIPE!)
						i(3679),	-- Recipe: Blood Sausage (RECIPE!)
						i(2698),	-- Recipe: Cooked Crab Claw (RECIPE!)
						i(3681),	-- Recipe: Crocolisk Gumbo (RECIPE!)
						i(3678),	-- Recipe: Crocolisk Steak (RECIPE!)
						i(3682),	-- Recipe: Curiously Tasty Omelet (RECIPE!)
						i(3683),	-- Recipe: Gooey Spider Cake (RECIPE!)
						i(2697),	-- Recipe: Goretusk Liver Pie (RECIPE!)
						i(3680),	-- Recipe: Murloc Fin Soup (RECIPE!)
						i(2699),	-- Recipe: Redridge Goulash (RECIPE!)
						i(2701),	-- Recipe: Seasoned Wolf Kabob (RECIPE!)
						i(2700),	-- Recipe: Succulent Pork Ribs (RECIPE!)
						i(728),	-- Recipe: Westfall Stew (RECIPE!)
					},
				}),
				n(1295, {	-- Lara Moore <Leather Armor Merchant>
					["coord"] = { 62.2, 67.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(236),	-- Cured Leather Armor
						i(1849),	-- Cured Leather Belt
						i(238),	-- Cured Leather Boots
						i(1850),	-- Cured Leather Bracers
						i(239),	-- Cured Leather Gloves
						i(237),	-- Cured Leather Pants
						i(1839),	-- Rough Leather Belt
						i(796),	-- Rough Leather Boots
						i(1840),	-- Rough Leather Bracers
						i(797),	-- Rough Leather Gloves
						i(798),	-- Rough Leather Pants
						i(799),	-- Rough Leather Vest
						i(1843),	-- Tanned Leather Belt
						i(843),	-- Tanned Leather Boots
						i(1844),	-- Tanned Leather Bracers
						i(844),	-- Tanned Leather Gloves
						i(846),	-- Tanned Leather Jerkin
						i(845),	-- Tanned Leather Pants
					},
				}),
				n(12783, {	-- Lieutenant Karter <Mount Vendor>
					["description"] = "Found within the Champion's Hall.",
					["races"] = ALLIANCE_ONLY,
					["groups"] = pvp({
						i(18243),	-- Black Battlestrider (MOUNT!)
						i(18244),	-- Black War Ram (MOUNT!)
						i(18241),	-- Black War Steed (MOUNT!)
						i(18242),	-- Black War Tiger (MOUNT!)
					}),
				}),
				n(8666, {	-- Lil Timmy <Boy with kittens>
					["coord"] = { 64.0, 38.0, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(8489, {	-- White Kitten (PET!)
							["isLimited"] = true,
						}),
					},
				}),
				n(8118, {	-- Lillian Singh <Holiday Fireworks Vendor>
					["coord"] = { 62.6, 70.0, MAP.STORMWIND_CITY },
					["description"] = "This NPC is only available on July 4th.",
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(8626),	-- Blue Sparkler
						i(8625),	-- White Sparkler
						i(8624),	-- Red Sparkler
					},
				}),
				n(1297, {	-- Lina Stover <Bow & Gun Merchant>
					["coord"] = { 58.6, 68.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(3024),	-- Bkp 2700 Enforcer
						i(3027),	-- Heavy Recurve Bow
						i(2506),	-- Hornwood Recurve Bow
						i(2511),	-- Hunter's Boomstick
						i(2507),	-- Laminated Recurve Bow
						i(3023),	-- Large Bore Blunderbuss
						i(2509),	-- Ornate Blunderbuss
						i(2505),	-- Polished Shortbow
						i(3026),	-- Reinforced Bow
						i(2504),	-- Worn Shortbow
					},
				}),
				n(1299, {	-- Lisbeth Schneider <Clothier>
					["coord"] = { 58.2, 67.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(3426),	-- Bold Yellow Shirt
						i(3428),	-- Common Grey Shirt
						i(3427),	-- Stylish Black Shirt
						i(13896),	-- Dark Green Wedding Hanbok
						i(13898),	-- Royal Dangui
						i(13897),	-- White Traditional Hanbok
					},
				}),
				n(1287, {	-- Marda Weller <Weapons Merchant>
					["coord"] = { 64.0, 68.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						926,	-- Battle Axe
						2025,	-- Bearded Axe
						2029,	-- Cleaver
						1198,	-- Claymore
						851,	-- Cutlass
						922,	-- Dacian Falx
						927,	-- Double Axe
						2024,	-- Espadon
						925,	-- Flail
						2030,	-- Gnarled Staff
						1197,	-- Giant Mace
						853,	-- Hatchet
						2207,	-- Jambiya
						2209,	-- Kris
						928,	-- Long Staff
						852,	-- Mace
						924,	-- Maul
						2208,	-- Poniard
						854,	-- Quarter Staff
						2026,	-- Rock Hammer
						2027,	-- Scimitar
					}},
					["groups"] = {
						i(15808),	-- Fine Light Crossbow
						i(15809),	-- Heavy Crossbow
						i(15807),	-- Light Crossbow
					},
				}),
				n(1313, {	-- Maria Lumere <Alchemy Supplies>
					["coord"] = { 55.6, 85.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(9301, {["isLimited"] = true}),	-- Recipe: Elixir of Shadow Power (RECIPE!)
					},
				}),
				n(12781, {	-- Master Sergeant Biggins <Officer Accessories Quartermaster>
					["description"] = "Found within the Champion's Hall.",
					["races"] = ALLIANCE_ONLY,
					["groups"] = pvp({
						i(18606),	-- Alliance Battle Standard
						i(18839),	-- Combat Healing Potion
						i(18841),	-- Combat Mana Potion
						moh(1, i(15198)),	-- Knight's Colors
					}),
				}),
				n(12805, {	-- Officer Areyn <Accessories Quartermaster>
					["coord"] = { 76.8, 65.8, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(18664),	-- A Treatise on Military Ranks
						i(15196, {	-- Private's Tabard
							["races"] = ALLIANCE_ONLY,
						}),
						i(18854, {	-- Insignia of the Alliance
							["classes"] = { WARRIOR },
						}),
						i(18857, {	-- Insignia of the Alliance
							["classes"] = { ROGUE },
						}),
						i(18862, {	-- Insignia of the Alliance
							["classes"] = { PRIEST },
						}),
						i(18859, {	-- Insignia of the Alliance
							["classes"] = { MAGE },
						}),
						i(18858, {	-- Insignia of the Alliance
							["classes"] = { WARLOCK },
						}),
						i(18863, {	-- Insignia of the Alliance
							["classes"] = { DRUID },
						}),
						i(18864, {	-- Insignia of the Alliance
							["classes"] = { PALADIN },
						}),
						i(18856, {	-- Insignia of the Alliance
							["classes"] = { HUNTER },
						}),
						i(16342),	-- Sergeant's Cape (58)
						i(18440),	-- Sergeant's Cape (45)
						i(18441),	-- Sergeant's Cape (30)
						i(18443),	-- Master Sergeant's Insignia (58)
						i(18444),	-- Master Sergeant's Insignia (45)
						i(18442),	-- Master Sergeant's Insignia (30)
						i(18449, {	-- Sergeant Major's Chain Armguards (45)
							["classes"] = { HUNTER },
						}),
						i(18455, {	-- Sergeant Major's Dragonhide Armsplints (45)
							["classes"] = { DRUID },
						}),
						i(18453, {	-- Sergeant Major's Leather Armsplints (45)
							["classes"] = { ROGUE },
						}),
						i(18447, {	-- Sergeant Major's Plate Wristguards (45)
							["classes"] = { PALADIN, WARRIOR },
						}),
						i(18457, {	-- Sergeant Major's Silk Cuffs (45)
							["classes"] = { MAGE, PRIEST, WARLOCK },
						}),
						i(18448, {	-- Sergeant Major's Chain Armguards (58)
							["classes"] = { HUNTER },
						}),
						i(18454, {	-- Sergeant Major's Dragonhide Armsplints (58)
							["classes"] = { DRUID },
						}),
						i(18452, {	-- Sergeant Major's Leather Armsplints (58)
							["classes"] = { ROGUE },
						}),
						i(18445, {	-- Sergeant Major's Plate Wristguards (58)
							["classes"] = { PALADIN, WARRIOR },
						}),
						i(18456, {	-- Sergeant Major's Silk Cuffs (58)
							["classes"] = { MAGE, PRIEST, WARLOCK },
						}),
					},
				}),
				n(1323, {	-- Osric Strang <Heavy Armor Merchant>
					["coord"] = { 77.0, 61.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2419,	-- Augmented Chain Belt
						2420,	-- Augmented Chain Boots
						2421,	-- Augmented Chain Bracers
						2422,	-- Augmented Chain Gloves
						3891,	-- Augmented Chain Helm
						2418,	-- Augmented Chain Leggings
						2417,	-- Augmented Chain Vest
						2424,	-- Brigandine Belt
						2426,	-- Brigandine Boots
						2427,	-- Brigandine Bracers
						2428,	-- Brigandine Gloves
						3894,	-- Brigandine Helm
						2425,	-- Brigandine Leggings
						2423,	-- Brigandine Vest
						2451,	-- Crested Heater Shield
						2448,	-- Heavy Pavise
						2446,	-- Kite Shield
						17189,	-- Metal Buckler
						17190,	-- Ornate Buckler
						8094,	-- Platemail Armor
						8088,	-- Platemail Belt
						8089,	-- Platemail Boots
						8090,	-- Platemail Bracers
						8091,	-- Platemail Gloves
						8092,	-- Platemail Helm
						8093,	-- Platemail Leggings
						2148,	-- Polished Scale Belt
						2149,	-- Polished Scale Boots
						2150,	-- Polished Scale Bracers
						2151,	-- Polished Scale Gloves
						2152,	-- Polished Scale Leggings
						2153,	-- Polished Scale Vest
						17192,	-- Reinforced Targe
					}},
				}),
				n(5193, {	-- Rebecca Laughlin <Tabard Designer>
					["coord"] = { 64.0, 77.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(5976),	-- Guild Tabard
					},
				}),
				n(277, {	-- Roberto Pupellyverbos <Merlot Connoisseur>
					["coord"] = { 59.4, 77.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(1941),	-- Cask of Merlot
					},
				}),
				n(1320, {	-- Seoman Griffith <Leather Armor Merchant>
					["coord"] = { 72.0, 62.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2471,	-- Reinforced Leather Belt
						2473,	-- Reinforced Leather Boots
						2474,	-- Reinforced Leather Bracers
						3893,	-- Reinforced Leather Cap
						2475,	-- Reinforced Leather Gloves
						2472,	-- Reinforced Leather Pants
						2470,	-- Reinforced Leather Vest
						2464,	-- Studded Belt
						2467,	-- Studded Boots
						2468,	-- Studded Bracers
						2463,	-- Studded Doublet
						2469,	-- Studded Gloves
						3890,	-- Studded Hat
						2465,	-- Studded Pants
					}},
				}),
				n(1350, {	-- Theresa Moulaine <Robe Vendor>
					["coord"] = { 53.4, 58.0, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(2617),	-- Burning Robes
						i(2615),	-- Chromatic Robe
						i(2613),	-- Double-Stitched Robes
						i(2612),	-- Plain Robe
						i(2614),	-- Robe of Apprenticeship
						i(2616),	-- Shimmering Silk Robes
						i(2618),	-- Silver Dress Robes
					},
				}),
				n(5510, {	-- Thulman Flintcrag <Guns Vendor>
					["coord"] = { 61.8, 36.2, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2509,	-- Ornate Blunderbuss
					}},
					["groups"] = {
						i(2510),	-- Solid Blunderbuss
					},
				}),
				n(1341, {	-- Wilhelm Strang <Mail Armor Merchant>
					["coord"] = { 77.2, 61.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2148,	-- Polished Scale Belt
						2149,	-- Polished Scale Boots
						2150,	-- Polished Scale Bracers
						2151,	-- Polished Scale Gloves
						2152,	-- Polished Scale Leggings
						2153,	-- Polished Scale Vest
						1853,	-- Scalemail Belt
						287,	-- Scalemail Boots
						1852,	-- Scalemail Bracers
						718,	-- Scalemail Gloves
						286,	-- Scalemail Pants
						285,	-- Scalemail Vest
					}},
				}),
				n(1309, {	-- Wynne Larson <Robe Merchant>
					["coord"] = { 52.0, 83.6, MAP.STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
					["sym"] = {{"select","itemID",
						2617,	-- Burning Robes
						2615,	-- Chromatic Robe
						2613,	-- Double Stitched Robes
						2612,	-- Plain Robe
						2614,	-- Robe Of Apprenticeship
						2616,	-- Shimmering Silk Robes
						2618,	-- Silver Dress Robes
					}},
				}),
			}),
		},
	}),
}));
