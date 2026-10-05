-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

local MATRIX_PUNCHOGRAPH_A = o(142345, {	-- Matrix Punchograph 3005-A
	["description"] = "~L.THIS_IS_LOCATED_OUTSIDE_OF_THE_INSTANCE_JUST_TO",
	["timeline"] = { REMOVED_5_0_4 },	-- guessed from WH comments
	["cost"] = { { "i", 9279, 1 } },	-- White Punch Card
	["groups"] = {
		i(9280),	-- Yellow Punch Card
	},
});
local MATRIX_PUNCHOGRAPH_B = o(142475, {	-- Matrix Punchograph 3005-B
	["description"] = "~L.THIS_IS_LOCATED_IN_THE_BOTTOM_OF_THE",
	["cost"] = { { "i", 9280, 1 } },	-- Yellow Punch Card
	["groups"] = {
		i(9282),	-- Blue Punch Card
		i(14639, {	-- Schematic: Minor Recombobulator (RECIPE!)
			["description"] = "~L.IF_YOU_ARE_AN_ENGINEER_YOU_WILL_ALSO_GET_THESE",
		}),
	},
});
local MATRIX_PUNCHOGRAPH_C = o(142476, {	-- Matrix Punchograph 3005-C
	["description"] = "~L.THIS_IS_LOCATED_AT_THE_BOTTOM_OF_THE_PLATFORM",
	["cost"] = { { "i", 9282, 1 } },	-- Blue Punch Card
	["groups"] = {
		i(9281),	-- Red Punch Card
	},
});
local MATRIX_PUNCHOGRAPH_D = o(142696, {	-- Matrix Punchograph 3005-D
	["description"] = "~L.THIS_IS_LOCATED_IN_THE_WORKSHOP_BELOW_CROWD",
	["cost"] = { { "i", 9281, 1 } },	-- Red Punch Card
	["groups"] = {
		i(9316),	-- Prismatic Punch Card
		i(4413, {	-- Schematic: Discombobulator Ray (RECIPE!)
			["description"] = "~L.IF_YOU_ARE_AN_ENGINEER_AND_HAVE_A_SECURITY",
			["provider"] = { "i", 9327 },	-- Security DELTA Data Access Card
		}),
	},
});
local MATRIX_PUNCHOGRAPH_E = o(251048, {	-- Matrix Punchograph 3005-E
	["description"] = createLocalizationString({
		readable = "This is located in the Dormitory, in the top-left cubby hole of the sloped southern wall.",
		constant = "THIS_IS_LOCATED_IN_THE_DORMITORY_IN_THE_TOP",
		export = true,
		text = {
			en = "This is located in the Dormitory, in the top-left cubby hole of the sloped southern wall.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "它位于宿舍中，南侧斜墙左上角的壁龛里。",
			-- TODO: tw = "",
		},
	}),
	["timeline"] = { ADDED_7_0_3 },
	["cost"] = { { "i", 9316, 1 } },	-- Prismatic Punch Card
	["groups"] = {
		n(108106, {	-- Sentient Mechanostrider
			-- special hunter pet spawn
			["provider"] = { "i", 9446 },	-- Electrocutioner Leg
		}),
	},
});

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(231, {	-- Gnomeregan
		-- #if BEFORE MOP
		["lore"] = "Located in Dun Morogh, the technological wonder known as Gnomeregan has been the gnomes' capital city for generations. Recently, a hostile race of mutant troggs infested several regions of Dun Morogh - including the great gnome city. In a desperate attempt to destroy the invading troggs, High Tinker Mekkatorque ordered the emergency venting of the city's radioactive waste tanks. Several gnomes sought shelter from the airborne pollutants as they waited for the troggs to die or flee. Unfortunately, though the troggs became irradiated from the toxic assault - their siege continued, unabated. Those gnomes who were not killed by noxious seepage were forced to flee, seeking refuge in the nearby dwarven city of Ironforge. There, High Tinker Mekkatorque set out to enlist brave souls to help his people reclaim their beloved city.\n\nIt is rumored that Mekkatorque's once-trusted advisor, Mekgineer Thermaplug, betrayed his people by allowing the invasion to happen. Now, his sanity shattered, Thermaplug remains in Gnomeregan - furthering his dark schemes and acting as the city's new techno-overlord.",
		-- #endif
		-- #if AFTER 4.0.6
		["description"] = createLocalizationString({
			readable = "Horde players can access Gnomeregan from the teleporter in Grom'gol Base Camp, Northern Stranglethorn.",
			constant = "HORDE_PLAYERS_CAN_ACCESS_GNOMEREGAN_FROM_THE",
			export = true,
			text = {
				en = "Horde players can access Gnomeregan from the teleporter in Grom'gol Base Camp, Northern Stranglethorn.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "部落玩家可以通过北荆棘谷格罗姆高营地的传送器进入诺莫瑞根。",
				-- TODO: tw = "",
			},
		}),	-- The teleporter was removed from Booty Bay with 4.0.3, and returned to the game with 4.0.6.
		-- #endif
		-- #if BEFORE CATA
		["zone-text-areaID"] = 133,	-- Gnomeregan
		-- #elseif BEFORE MOP
		["zone-text-areaID"] = 5495,	-- Gnomeregan
		["zone-text-names"] = {
			"Workshop Entrance",
		},
		-- #endif
		["mapID"] = GNOMEREGAN,
		["coords"] = {
			-- #if AFTER MOP
			{ 30.1, 74.6, NEW_TINKERTOWN_LOWER },	-- Gnomeregan [Dun Morogh]
			-- #else
			{ 18.4, 38.6, DUN_MOROGH },	-- Gnomeregan [Dun Morogh]
			-- #endif
		},
		["maps"] = { GNOMEREGAN_LEVEL2, GNOMEREGAN_LEVEL3, GNOMEREGAN_LEVEL4 },
		-- #if SEASON_OF_DISCOVERY
		["sharedLockout"] = 1,
		["isRaid"] = true,
		-- #endif
		["lvl"] = lvlsquish(19, 19, 10),
		["groups"] = {
			n(ZONE_DROPS, {
				i(9510, {	-- Caverndeep Trudgers
					["crs"] = {
						6228,	-- Dark Iron Ambassador
						6235,	-- Electrocutioner 6000
						7800,	-- Mekgineer Thermaplugg
						7079,	-- Viscous Fallout
					},
				}),
				i(5108, {	-- Dark Iron Leather
					["cr"] = 6212,	-- Dark Iron Agent
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_TWO, i(216634, { ["timeline"] = { ADDED_1_15_1, REMOVED_2_0_1 } })),	-- GG12-082 Cartridge Fuse
				-- #endif
				i(9490, {	-- Gizmotron Megachopper
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6212,	-- Dark Iron Agent
						6220,	-- Irradiated Horror
						6329,	-- Irradiated Pillager
						7603,	-- Leprous Assistant
						6223,	-- Leprous Defender
						6222,	-- Leprous Technician
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6226,	-- Mechano-Flamewalker
						6227,	-- Mechano-Frostwalker
						6225,	-- Mechano-Tank
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9308),	-- Grime-Encrusted Object
				i(9326, {	-- Grime-Encrusted Ring
					-- #if SEASON_OF_DISCOVERY
					["timeline"] = { REMOVED_1_15_1 },
					-- #endif
					["cr"] = 6212,	-- Dark Iron Agent
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_TWO, i(216661, {	-- Grime-Encrusted Ring
					["timeline"] = { ADDED_1_15_1, REMOVED_2_0_1 },
					["crs"] = {
						6212,	-- Dark Iron Agent
						6228,	-- Dark Iron Ambassador
					},
				})),
				applyclassicphase(SOD_PHASE_TWO, i(216661, { ["timeline"] = { ADDED_1_15_1, REMOVED_2_0_1 } })),	-- Grime-Encrusted Salvage
				applyclassicphase(SOD_PHASE_TWO, i(215430, { ["timeline"] = { ADDED_1_15_1, REMOVED_2_0_1 } })),	-- Gnomeregan Fallout
				-- #endif
				i(9489, {	-- Gyromatic Icemaker
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6212,	-- Dark Iron Agent
						6220,	-- Irradiated Horror
						7603,	-- Leprous Assistant
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6227,	-- Mechano-Frostwalker
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9487, {	-- Hi-Tech Supergun
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6211,	-- Caverndeep Reaver
						6212,	-- Dark Iron Agent
						6391,	-- Holdout Warrior
						6220,	-- Irradiated Horror
						6329,	-- Irradiated Pillager
						7603,	-- Leprous Assistant
						6223,	-- Leprous Defender
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9491),	-- Hotshot Pilot's Gloves
				i(9508, {	-- Mechbuilder's Overalls
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6212,	-- Dark Iron Agent
						6223,	-- Leprous Defender
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6230,	-- Peacekeeper Security Suit
					},
					-- TODO: new itemdb file required to remove this requirement
					-- #if AFTER 10.1.7
					["_drop"] = { "requireSkill" },
					-- #endif
				}),
				i(9488, {	-- Oscillating Power Hammer
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6211,	-- Caverndeep Reaver
						6212,	-- Dark Iron Agent
						6329,	-- Irradiated Pillager
						7603,	-- Leprous Assistant
						6223,	-- Leprous Defender
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6226,	-- Mechano-Flamewalker
						6227,	-- Mechano-Frostwalker
						6225,	-- Mechano-Tank
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9509, {	-- Petrolspill Leggings
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6212,	-- Dark Iron Agent
						6391,	-- Holdout Warrior
						6220,	-- Irradiated Horror
						6329,	-- Irradiated Pillager
						6218,	-- Irradiated Slime
						7603,	-- Leprous Assistant
						6223,	-- Leprous Defender
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6227,	-- Mechano-Frostwalker
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9309, {	-- Robo-mechanical Guts
					["description"] = "~L.THESE_CAN_DROP_FROM_ANY_MECHANICAL_UNIT_IN",
					["races"] = ALLIANCE_ONLY,
				}),
				-- #if AFTER 3.1.0
				i(11827, {	-- Schematic: Lil' Smoky (RECIPE!)
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6229,	-- Crowd Pummeler 9-60
						6230,	-- Peacekeeper Security Suit
					},
				}),
				-- #endif
				i(9486, {	-- Supercharger Battle Axe
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6211,	-- Caverndeep Reaver
						6212,	-- Dark Iron Agent
						6392,	-- Holdout Medic
						6220,	-- Irradiated Horror
						6329,	-- Irradiated Pillager
						6223,	-- Leprous Defender
						6224,	-- Leprous Machinesmith
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6227,	-- Mechano-Frostwalker
						6225,	-- Mechano-Tank
						6230,	-- Peacekeeper Security Suit
					},
				}),
				-- #if AFTER 10.1.7
				i(9444, {	-- Techbot CPU Shell
					["timeline"] = { ADDED_10_1_7 },
				}),
				-- #endif
				i(9485, {	-- Vibroblade
					["crs"] = {
						6232,	-- Arcane Nullifier X-21
						6207,	-- Caverndeep Ambusher
						6206,	-- Caverndeep Burrower
						6212,	-- Dark Iron Agent
						6220,	-- Irradiated Horror
						6329,	-- Irradiated Pillager
						7603,	-- Leprous Assistant
						6223,	-- Leprous Defender
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6226,	-- Mechano-Flamewalker
						6227,	-- Mechano-Frostwalker
						6230,	-- Peacekeeper Security Suit
					},
				}),
				i(9279, {	-- White Punch Card
					["description"] = "~L.THIS_CAN_BE_LOOTED_FROM_CREATURES_OUTSIDE_OF",
					["timeline"] = { REMOVED_5_0_4 },	-- guessed from WH comments
				}),
				i(140781, {	-- X-87 Battle Circuit
					["timeline"] = { ADDED_7_0_3 },
					["crs"] = {
						6229,	-- Crowd Pummeler 9-60
						6235,	-- Electrocutioner 6000
						7800,	-- Mekgineer Thermaplug
						6232,	-- Arcane Nullifier X-21
						6234,	-- Mechanized Guardian
						6233,	-- Mechanized Sentry
						6226,	-- Mechano-Flamewalker
						6227,	-- Mechano-Frostwalker
						6225,	-- Mechano-Tank
						6230,	-- Peacekeeper Security Suit
					},
				}),
			}),
			-- #if SEASON_OF_DISCOVERY
			MATRIX_PUNCHOGRAPH_A,
			MATRIX_PUNCHOGRAPH_B,
			MATRIX_PUNCHOGRAPH_C,
			MATRIX_PUNCHOGRAPH_D,
			-- In Season of Discovery, this version of the instance has been deprecated and removed in favor of the raid.
			d(DIFFICULTY.DUNGEON.NORMAL, bubbleDownTimelineEventSelf(REMOVED_1_15_1, {
			-- #endif
			n(QUESTS, {
				header(HEADERS.Object, 142487, {	-- The Sparklematic 5200
					q(2951, {	-- The Sparklematic 5200!
						["provider"] = { "o", 142487 },	-- The Sparklematic 5200
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
					}),
					q(4601, {	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175084 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15084 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
					}),
					q(4602, {	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175085 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15085 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
					}),
					q(2952, {	-- The Sparklematic 5200!
						["sourceQuest"] = 2951,	-- The Sparklematic 5200!
						["provider"] = { "o", 142487 },	-- The Sparklematic 5200
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
					q(4605, {	-- The Sparklematic 5200!
						["sourceQuest"] = 4601,	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175084 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15084 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
					q(4606, {	-- The Sparklematic 5200!
						["sourceQuest"] = 4602,	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175085 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15085 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
					q(2953, {	-- More Sparklematic Action
						["sourceQuest"] = 2952,	-- The Sparklematic 5200!
						["provider"] = { "o", 142487 },	-- The Sparklematic 5200
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["repeatable"] = true,
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
					q(4603, {	-- More Sparklematic Action
						["sourceQuest"] = 4605,	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175084 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15084 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["repeatable"] = true,
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
					q(4604, {	-- More Sparklematic Action
						["sourceQuest"] = 4606,	-- The Sparklematic 5200!
						["providers"] = {
							-- #if AFTER LEGION
							{ "o", 175085 },	-- The Sparklematic 5200
							-- #else
							{ "o", 15085 },	-- The Sparklematic 5200
							-- #endif
						},
						["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
						["repeatable"] = true,
						["groups"] = {
							i(9363),	-- Sparklematic-Wrapped Box
						},
					}),
				}),
				q(2904, {	-- A Fine Mess
					["qg"] = 7850,	-- Kernobee
					["timeline"] = { REMOVED_4_0_3 },
					-- #if BEFORE 4.0.3
					["maps"] = { STRANGLETHORN_VALE },
					-- #endif
					["lvl"] = 20,
					["groups"] = {
						i(9536, {	-- Fairywing Mantle
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9535, {	-- Fire-welded Bracers
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2931, {	-- Castpipe's Task
					["qg"] = 4077,	-- Gaxim Rustfizzle
					["coord"] = { 59.6, 67.0, STONETALON_MOUNTAINS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 25,
				}),
				q(2842, {	-- Chief Engineer Scooty
					["description"] = "~L.ALTHOUGH_THIS_QUEST_IS_AVAILABLE_FROM_LEVEL_20",
					["qg"] = 3413,	-- Sovik <Engineering Supplies>
					["coord"] = { 75.6, 25.2, ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					-- #if BEFORE 4.0.3
					["maps"] = { STRANGLETHORN_VALE },
					-- #endif
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
				}),
				q(2930, {	-- Data Rescue
					["sourceQuest"] = 2931,	-- Castpipe's Task
					["qg"] = 7950,	-- Master Mechanic Castpipe
					["coord"] = { 70.2, 48.4, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 25,
					["groups"] = {
						objective(1, {	-- 0/1 Prismatic Punch Card
							["provider"] = { "i", 9316 },	-- Prismatic Punch Card
						}),
						i(9604, {	-- Mechanic's Pipehammer
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9605, {	-- Repairman's Cape
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2924, {	-- Essential Artificials
					["sourceQuest"] = 2925,	-- Klockmort's Essentials
					["qg"] = 6169,	-- Klockmort Spannerspan
					["coord"] = { 68.2, 46.2, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 24,
					["groups"] = {
						objective(1, {	-- 0/12 Essential Artificial
							["providers"] = {
								{ "i",   9278 },	-- Essential Artificial
								{ "o", 142344 },	-- Artificial Extrapolator
							},
							["description"] = "~L.THESE_ARE_SCATTERED_THROUGHOUT_THE_INSTANCE",
						}),
					},
				}),
				q(26944, {	-- Exploring Gnomeregan
					["altQuests"] = { 26943 },	-- Home Sweet Gnome
					["qg"] = 44018,	-- Wulfred Harrys
					["coord"] = { 53.3, 66.2, NORTHERN_STRANGLETHORN },
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = lvlsquish(26, 26, 10),
				}),
				q(2926, {	-- Gnogaine
					["sourceQuest"] = 2927,	-- The Day After
					["qg"] = 1268,	-- Ozzie Togglevolt
					["coord"] = { 45.8, 49.2, DUN_MOROGH },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Full Leaden Collection Phial
							["provider"] = { "i", 9284 },	-- Full Leaden Collection Phial
							["cost"] = { { "i", 9283, 1 } },	-- Empty Leaden Collection Phial
							["cr"] = 6329,	-- Irradiated Pillager
						}),
					},
				}),
				q(2948, {	-- Gnome Improvement
					["sourceQuest"] = 2947,	-- Return of the Ring [Alliance]
					["qg"] = 6826,	-- Talvash del Kissel
					["coord"] = { 36.2, 3.8, IRONFORGE },
					["cost"] = {
						{ "i", 9362, 1 },	-- Brilliant Gold Ring
						{ "i", 2842, 1 },	-- Silver Bar
						{ "i", 1206, 1 },	-- Moss Agate
						{ "g", 3000 },	-- 30s
					},
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(28, 28, 10),
					["groups"] = {
						i(9538),	-- Talvash's Gold Ring
					},
				}),
				q(2843, {	-- Gnomer-gooooone!
					["sourceQuest"] = 2842,	-- Chief Engineer Scooty
					["qg"] = 7853,	-- Scooty <Chief Engineer>
					["coord"] = { 27.6, 77.4, STRANGLETHORN_VALE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						i(9173, {	-- Goblin Transponder
							["description"] = "~L.YOU_DO_NOT_NEED_TO_KEEP_THIS_IN_YOUR_INVENTORY",
						}),
					},
				}),
				q(2945, {	-- Grime-Encrusted Ring
					["description"] = "~L.TAKE_THIS_TO_THE_SPARKLEMATIC_5200",
					["provider"] = { "i", 9326 },	-- Grime-Encrusted Ring
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						i(9362),	-- Brilliant Gold Ring
					},
				}),
				q(2928, {	-- Gyrodrillmatic Excavationators
					["qg"] = 6579,	-- Shoni the Shilent
					["coords"] = {
						-- #if AFTER WRATH
						{ 62.8, 34.8, STORMWIND_CITY },
						-- #else
						{ 55.5, 12.5, STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/24 Robo-mechanical Guts
							["provider"] = { "i", 9309 },	-- Robo-mechanical Guts
						}),
						i(9608, {	-- Shoni's Disarming Tool
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9609, {	-- Shilly Mitts
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26943, {	-- Home Sweet Gnome
					["altQuests"] = { 26944 },	-- Exploring Gnomeregan
					["qg"] = 2789,	-- Skuerto
					["coord"] = { 40.3, 49.1, ARATHI_HIGHLANDS },
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = lvlsquish(26, 26, 10),
				}),
				q(2925, {	-- Klockmort's Essentials
					["qg"] = 6142,	-- Mathiel
					["coord"] = { 59.2, 45.2, DARNASSUS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 24,
				}),
				q(2950, {	-- Nogg's Ring Redo
					["sourceQuest"] = 2949,	-- Return of the Ring [Horde]
					["qg"] = 3412,	-- Nogg <Expert Engineer>
					["coords"] = {
						-- #if AFTER CATA
						{ 56.7, 57.0, ORGRIMMAR },
						-- #else
						{ 75.8, 25.2, ORGRIMMAR },
						-- #endif
					},
					["cost"] = {
						{ "i", 9362, 1 },	-- Brilliant Gold Ring
						{ "i", 2842, 1 },	-- Silver Bar
						{ "i", 1206, 1 },	-- Moss Agate
						{ "g", 3000 },	-- 30s
					},
					["races"] = HORDE_ONLY,
					["lvl"] = 28,
					["groups"] = {
						i(9588),	-- Nogg's Gold Ring
					},
				}),
				q(2947, {	-- Return of the Ring [Alliance]
					["sourceQuest"] = 2945,	-- Grime-Encrusted Ring
					["provider"] = { "o", 142487 },	-- The Sparklematic 5200
					["maps"] = { IRONFORGE },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(28, 28, 10),
					["groups"] = {
						i(9362),	-- Brilliant Gold Ring
					},
				}),
				q(2949, {	-- Return of the Ring [Horde]
					["sourceQuest"] = 2945,	-- Grime-Encrusted Ring
					["provider"] = { "o", 142487 },	-- The Sparklematic 5200
					["maps"] = { ORGRIMMAR },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(28, 28, 10),
					["groups"] = {
						i(9362),	-- Brilliant Gold Ring
					},
				}),
				q(2841, {	-- Rig Wars
					["qg"] = 3412,	-- Nogg <Expert Engineer>
					["coord"] = { 75.8, 25.2, ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lockCriteria"] = { 1, "questID", 2842 },	-- Chief Engineer Scooty
					["lvl"] = 25,
					["groups"] = {
						objective(1, {	-- 0/1 Rig Blueprints
							["providers"] = {
								{ "i",   9153 },	-- Rig Blueprints
								{ "o", 142477 },	-- Thermaplugg's Safe
							},
						}),
						objective(2, {	-- 0/1 Thermaplugg's Safe Combination
							["provider"] = { "i", 9299 },	-- Thermaplugg's Safe Combination
							["cr"] = 7800,	-- Mekgineer Thermaplugg
						}),
						i(9623, {	-- Civinad Robes
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9625, {	-- Dual Reinforced Leggings
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9624, {	-- Triprunner Dungarees
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2922, {	-- Save Techbot's Brain!
					["sourceQuest"] = 2923,	-- Tinkmaster Overspark
					["qg"] = 7944,	-- Tinkmaster Overspark <Master Gnome Engineer>
					["coord"] = { 70.4, 49.4, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 Techbot's Memory Core
							["provider"] = { "i", 9277 },	-- Techbot's Memory Core
						}),
					},
				}),
				q(2927, {	-- The Day After
					["qg"] = 6569,	-- Gnoarn
					["coord"] = { 69.6, 50.6, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
				q(2929, {	-- The Grand Betrayal
					["qg"] = 7937,	-- High Tinker Mekkatorque <King of Gnomes>
					["coord"] = { 69.2, 49.2, IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 25,
					["groups"] = {
						objective(1, {	-- 0/1 Mekgineer Thermaplugg
							["provider"] = { "n", 7800 },	-- Mekgineer Thermaplugg
						}),
						i(9623, {	-- Civinad Robes
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9625, {	-- Dual Reinforced Leggings
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9624, {	-- Triprunner Dungarees
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(26939, {	-- The G-Team (1/3) [Alliance]
					["sourceQuests"] = {
						26943,	-- Home Sweet Gnome
						26944,	-- Exploring Gnomeregan
					},
					["qg"] = 44556,	-- Murd Doc
					["qi"] = 60680,	-- S.A.F.E. "Parachute"
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Viscous Fallout slain
							["provider"] = { "n", 7079 },	-- Viscous Fallout
						}),
					},
				}),
				q(26941, {	-- The G-Team (2/3) [Alliance]
					["sourceQuest"] = 26939,	-- The G-Team (1/3) [Alliance]
					["qg"] = 44560,	-- B.E Barechus <S.A.F.E.>
					["qi"] = 60680,	-- S.A.F.E. "Parachute"
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Electrocutioner 6000 slain
							["provider"] = { "n", 6235 },	-- Electrocutioner 6000
						}),
					},
				}),
				q(26942, {	-- The G-Team (3/3) [Alliance]
					["sourceQuest"] = 26941,	-- The G-Team (2/3) [Alliance]
					["qg"] = 44561,	-- Face <S.A.F.E.>
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Mekgineer Thermaplugg slain
							["provider"] = { "n", 7800 },	-- Mekgineer Thermaplugg
						}),
						i(65987),	-- G-Team Belt
						i(66004),	-- Barechus' Greaves
						i(65963),	-- Temple's Vest
						i(65939),	-- Murd Doc's Leggings
						i(65913),	-- Hann Ibal's Epaulets
						i(131624, {	-- Barechus' Chainmail
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(131625, {	-- Hann Ibal's Chain Dungarees
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(50338, {	-- The G-Team (1/3) [Horde]
					["qg"] = 44556,	-- Murd Doc
					["qi"] = 60680,	-- S.A.F.E. "Parachute"
					["timeline"] = { ADDED_7_3_5 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Viscous Fallout slain
							["provider"] = { "n", 7079 },	-- Viscous Fallout
						}),
					},
				}),
				q(50337, {	-- The G-Team (2/3) [Horde]
					["sourceQuest"] = 50338,	-- The G-Team (1/3) [Horde]
					["qg"] = 44560,	-- B.E Barechus <S.A.F.E.>
					["qi"] = 60680,	-- S.A.F.E. "Parachute"
					["timeline"] = { ADDED_7_3_5 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Electrocutioner 6000 slain
							["provider"] = { "n", 6235 },	-- Electrocutioner 6000
						}),
					},
				}),
				q(50336, {	-- The G-Team (3/3) [Horde]
					["sourceQuest"] = 50337,	-- The G-Team (2/3) [Horde]
					["qg"] = 44561,	-- Face <S.A.F.E.>
					["timeline"] = { ADDED_7_3_5 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(24, 24, 10),
					["groups"] = {
						objective(1, {	-- 0/1 Mekgineer Thermaplugg slain
							["provider"] = { "n", 7800 },	-- Mekgineer Thermaplugg
						}),
						i(65987),	-- G-Team Belt
						i(66004),	-- Barechus' Greaves
						i(65963),	-- Temple's Vest
						i(65939),	-- Murd Doc's Leggings
						i(65913),	-- Hann Ibal's Epaulets
						i(131624, {	-- Barechus' Chainmail
							["timeline"] = { ADDED_7_0_3 },
						}),
						i(131625, {	-- Hann Ibal's Chain Dungarees
							["timeline"] = { ADDED_7_0_3 },
						}),
					},
				}),
				q(2962, {	-- The Only Cure is More Green Glow
					["sourceQuest"] = 2926,	-- Gnogaine
					["qg"] = 1268,	-- Ozzie Togglevolt
					["coord"] = { 45.8, 49.2, DUN_MOROGH },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 20,
					["groups"] = {
						objective(1, {	-- 0/1 High Potency Radioactive Fallout
							["provider"] = { "i", 9365 },	-- High Potency Radioactive Fallout
							["cost"] = { { "i", 9364, 1 } },	-- Heavy Leaden Collection Phial
							["cr"] = 6219,	-- Corrosive Lurker
						}),
					},
				}),
				q(2923, {	-- Tinkmaster Overspark
					["qg"] = 7917,	-- Brother Sarno
					["coords"] = {
						-- #if AFTER WRATH
						{ 51.6, 48.6, STORMWIND_CITY },
						-- #else
						{ 40.6, 30.0, STORMWIND_CITY },
						-- #endif
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { IRONFORGE },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 20,
				}),
			}),
			n(REWARDS, {
				container(9363, {	-- Sparklematic-Wrapped Box
					["description"] = "~L.KILL_HOSTILE_CREATURES_FOR_GRIME_ENCRUSTED",
					["groups"] = {
						i(122207, {	-- Music Roll: Tinkertown
							["timeline"] = { ADDED_6_1_0 },
							["races"] = ALLIANCE_ONLY,
						}),
						i(9280),	-- Yellow Punch Card
						i(10299),	-- Gnomeregan Amulet
						i(10298),	-- Gnomeregan Band
					},
				}),
			}),
			-- #if NOT SEASON_OF_DISCOVERY
			MATRIX_PUNCHOGRAPH_A,
			-- #endif
			n(6231, {	-- Techbot
				["description"] = "~L.LOCATED_OUTSIDE_THE_INSTANCE_NEAR_THE",
				["timeline"] = { REMOVED_4_0_3 },
				["groups"] = {
					i(9277),	-- Techbot's Memory Core
					-- #if BEFORE 10.1.7
					i(9444, {	-- Techbot CPU Shell
						["timeline"] = { REMOVED_4_0_3 },
					}),
					-- #endif
				},
			}),
			e(419, {	-- Grubbis
				["creatureID"] = 7361,
				["groups"] = {
					i(151080, {	-- Grubbis' Protective Pail
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(9445),	-- Grubbis Paws
					i(151079, {	-- Chomper-Hide Belt
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151078, {	-- Shabby Trogg Britches
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			-- #if NOT SEASON_OF_DISCOVERY
			MATRIX_PUNCHOGRAPH_B,
			MATRIX_PUNCHOGRAPH_C,
			MATRIX_PUNCHOGRAPH_E,
			-- #endif
			-- #if AFTER 4.0.3
			n(7850, {	-- Kernobee
				["description"] = createLocalizationString({
					readable = "Kernobee was the quest giver of the now removed quest 'A Fine Mess', and remains abandoned on the ground without any purpose.",
					constant = "KERNOBEE_WAS_THE_QUEST_GIVER_OF_THE_NOW_REMOVED",
					export = true,
					text = {
						en = "Kernobee was the quest giver of the now removed quest 'A Fine Mess', and remains abandoned on the ground without any purpose.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "科诺比曾是现已移除的任务“一团糟”的任务给予者，如今仍被遗弃在地上，没有任何用处。",
						-- TODO: tw = "",
					},
				}),
			}),
			-- #endif
			e(420, {	-- Viscous Fallout
				["creatureID"] = 7079,
				["groups"] = {
					i(9452),	-- Hydrocane
					i(9453),	-- Toxic Revenger
					i(151081, {	-- Gnomish Rebreather
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151082, {	-- Lead Apron
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(9454),	-- Acidic Walkers
					i(151083, {	-- Hazmat Galoshes
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(421, {	-- Electrocutioner 6000
				["creatureID"] = 6235,
				["groups"] = {
					i(6893, {	-- Workshop Key
						["description"] =
							-- #if AFTER 5.2.0
							"This key no longer has any practical use, and disappears from the inventory like a conjured item. Entering through the Workshop entrance will zone you into the main entrance.",	-- Removed with 4.0.3, and started dropping again with 5.2.0 for no apparent reason.
							-- #elseif AFTER 4.0.3
							"This key no longer has any practical use.",
							-- #else
							"This key allows you to get into the back door of Gnomeregan.",
							-- #endif
					}),
					i(9446),	-- Electrocutioner Leg
					i(9448),	-- Spidertank Oilrag
					i(9447),	-- Electrocutioner Lagnut
				},
			}),
			-- #if NOT SEASON_OF_DISCOVERY
			MATRIX_PUNCHOGRAPH_D,
			-- #endif
			e(418, {	-- Crowd Pummeler 9-60
				["creatureID"] = 6229,
				["groups"] = {
					i(9449),	-- Manual Crowd Pummeler
					i(151085, {	-- Glitchbot Helm
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151084, {	-- Grease-Smudged Sash
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(132558, {	-- Bot Operator's Treads
						["timeline"] = { ADDED_7_0_3 },
					}),
					i(9450),	-- Gnomebot Operating Boots
				},
			}),
			n(6228, {	-- Dark Iron Ambassador
				["description"] = "~L.THIS_IS_A_RARE_CREATURE_AND_AS_SUCH_IS_NOT",
				["groups"] = {
					i(5108),	-- Dark Iron Leather
					i(9456),	-- Glass Shooter
					i(9457),	-- Royal Diplomatic Scepter
					i(9455),	-- Emissary Cuffs
				},
			}),
			e(422, {	-- Mekgineer Thermaplugg
				["creatureID"] = 7800,
				["groups"] = {
					ach(634),	-- Gnomeregan
					ach(5044, {	-- Gnomeregan Guild Run
						["timeline"] = { ADDED_4_0_3 },
					}),
					i(9459),	-- Thermaplugg's Left Arm
					i(9458),	-- Thermaplugg's Central Core
					i(9492),	-- Electromagnetic Gigaflux Reactivator
					i(9461),	-- Charged Gear
					i(4415),	-- Schematic: Craftsman's Monocle (RECIPE!)
					i(4413),	-- Schematic: Discombobulator Ray (RECIPE!)
					i(6716),	-- Schematic: EZ-Thro Dynamite (RECIPE!)
					i(4411),	-- Schematic: Flame Deflector (RECIPE!)
					i(6672),	-- Schematic: Flash Bomb (RECIPE!)
					i(7742),	-- Schematic: Gnomish Cloaking Device (RECIPE!)
					i(7560),	-- Schematic: Gnomish Universal Remote (RECIPE!)
					i(7561),	-- Schematic: Goblin Jumper Cables (RECIPE!)
					i(4416),	-- Schematic: Goblin Land Mine (RECIPE!)
					i(7192, {	-- Schematic: Goblin Rocket Boots
						["timeline"] = { DELETED_3_0_2 },
					}),
					i(4417),	-- Schematic: Large Seaforium Charge (RECIPE!)
					i(4408),	-- Schematic: Mechanical Squirrel Box (RECIPE!)
					i(4412),	-- Schematic: Moonsight Rifle (RECIPE!)
					-- #if AFTER 3.1.0
					i(11828),	-- Schematic: Pet Bombling (RECIPE!)
					-- #endif
					i(4414),	-- Schematic: Portable Bronze Mortar (RECIPE!)
					i(4410),	-- Schematic: Shadow Goggles (RECIPE!)
					i(4409),	-- Schematic: Small Seaforium Charge (RECIPE!)
				},
			}),
			n(113621, {	-- Endgineer Omegaplugg
				["description"] = createLocalizationString({
					readable = "|cff3399ffSTEP 1:|r Kill the last boss in Gnomeregan.\n|cff3399ffSTEP 2:|r Go to the back of the pillar on the left side of the room's entrance, and press the small button.\n|cff3399ffSTEP 3:|r Endgineer Omegaplugg will spawn, and his health scales to max level.\n|cff3399ffSTEP 4:|r To stop the bombs from spawning, you must disable the conduits in the room by pressing all the large red buttons in a counterclockwise format. (This is the first conduit on the right as you enter the room.)\n|cff3399ffSTEP 5:|r Kill the boss, and all players can loot the toy. Good luck, have fun!",
					constant = "CFF3399FFSTEP_1_R_KILL_THE_LAST_BOSS_IN",
					export = true,
					text = {
						en = "|cff3399ffSTEP 1:|r Kill the last boss in Gnomeregan.\n|cff3399ffSTEP 2:|r Go to the back of the pillar on the left side of the room's entrance, and press the small button.\n|cff3399ffSTEP 3:|r Endgineer Omegaplugg will spawn, and his health scales to max level.\n|cff3399ffSTEP 4:|r To stop the bombs from spawning, you must disable the conduits in the room by pressing all the large red buttons in a counterclockwise format. (This is the first conduit on the right as you enter the room.)\n|cff3399ffSTEP 5:|r Kill the boss, and all players can loot the toy. Good luck, have fun!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cff3399ff第 1 步：|r 击杀诺莫瑞根的最后一名首领。\n|cff3399ff第 2 步：|r 走到房间入口左侧柱子后方，按下小按钮。\n|cff3399ff第 3 步：|r 总工程师欧米加普格将会刷新，其生命值会按最高等级缩放。\n|cff3399ff第 4 步：|r 要阻止炸弹刷新，你必须按逆时针顺序按下房间内所有大型红色按钮，从而关闭导管。（进入房间后右侧第一个就是导管。）\n|cff3399ff第 5 步：|r 击杀首领，所有玩家都可以拾取该玩具。祝你好运，玩得开心！",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_7_1_0 },
				["groups"] = {
					i(141331, {	-- Vial of Green Goo (TOY!)
						["timeline"] = { ADDED_7_0_3 },
					}),
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			})),
			applyclassicphase(SOD_PHASE_TWO, d(DIFFICULTY.SOD.PLAYER10, bubbleDownSelf({ ["timeline"] = { ADDED_1_15_1, REMOVED_2_0_1 }, }, {
				["description"] = "~L.THIS_INSTANCE_WAS_CONVERTED_FROM_A_NORMAL_2",
				["lvl"] = 40,
				["groups"] = {
					n(QUESTS, {
						q(79985, {	-- A Fine Mess
							["qg"] = 7850,	-- Kernobee
							-- #if BEFORE 4.0.3
							["maps"] = { STRANGLETHORN_VALE },
							-- #endif
							["lvl"] = 40,
							["groups"] = {
								i(9536, {	-- Fairywing Mantle
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(9535, {	-- Fire-welded Bracers
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(80133, {	-- Chief Engineer Scooty
							["qg"] = 3413,	-- Sovik <Engineering Supplies>
							["coord"] = { 75.6, 25.2, ORGRIMMAR },
							-- #if BEFORE 4.0.3
							["maps"] = { STRANGLETHORN_VALE },
							-- #endif
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
						}),
						q(80143, {	-- Data Rescue
							["qg"] = 7950,	-- Master Mechanic Castpipe
							["coord"] = { 70.2, 48.4, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Prismatic Punch Card
									["provider"] = { "i", 9316 },	-- Prismatic Punch Card
								}),
								i(217005),	-- Repairman's Cape
								i(217006),	-- Mechanic's Pipehammer
							},
						}),
						q(80136, {	-- Essential Artificials
							["sourceQuest"] = 80135,	-- Klockmort's Essentials
							["qg"] = 6169,	-- Klockmort Spannerspan
							["coord"] = { 68.2, 46.2, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/12 Essential Artificial
									["providers"] = {
										{ "i",   9278 },	-- Essential Artificial
										{ "o", 142344 },	-- Artificial Extrapolator
									},
									["description"] = "~L.THESE_ARE_SCATTERED_THROUGHOUT_THE_INSTANCE",
								}),
							},
						}),
						q(80139, {	-- Gnogaine
							["sourceQuest"] = 2927,	-- The Day After
							["qg"] = 1268,	-- Ozzie Togglevolt
							["coord"] = { 45.8, 49.2, DUN_MOROGH },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Full Leaden Collection Phial
									["provider"] = { "i", 9284 },	-- Full Leaden Collection Phial
									["cost"] = { { "i", 9283, 1 } },	-- Empty Leaden Collection Phial
									["cr"] = 6329,	-- Irradiated Pillager
								}),
							},
						}),
						q(80131, {	-- Gnome Improvement
							["sourceQuest"] = 79987,	-- Return of the Ring [Alliance]
							["qg"] = 6826,	-- Talvash del Kissel
							["coord"] = { 36.2, 3.8, IRONFORGE },
							["cost"] = {
								{ "i", 216662, 1 },	-- Brilliant Gold Ring
								{ "i", 2842, 1 },	-- Silver Bar
								{ "i", 1206, 1 },	-- Moss Agate
								{ "g", 3000 },	-- 30s
							},
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								i(216673),	-- Talvash's Brilliant Gold Ring
							},
						}),
						q(80134, {	-- Gnomer-gooooone!
							["sourceQuest"] = 80133,	-- Chief Engineer Scooty
							["qg"] = 7853,	-- Scooty <Chief Engineer>
							["coord"] = { 27.6, 77.4, STRANGLETHORN_VALE },
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								i(9173, {	-- Goblin Transponder
									["description"] = "~L.YOU_DO_NOT_NEED_TO_KEEP_THIS_IN_YOUR_INVENTORY",
								}),
							},
						}),
						q(79986, {	-- Grime-Encrusted Ring
							["description"] = "~L.TAKE_THIS_TO_THE_SPARKLEMATIC_5200",
							["provider"] = { "i", 216661 },	-- Grime-Encrusted Ring
							["lvl"] = 40,
							["groups"] = {
								i(216662),	-- Brilliant Gold Ring
							},
						}),
						q(80181, {	-- Gyrodrillmatic Excavationators
							["qg"] = 6579,	-- Shoni the Shilent
							["coords"] = {
								-- #if AFTER WRATH
								{ 62.8, 34.8, STORMWIND_CITY },
								-- #else
								{ 55.5, 12.5, STORMWIND_CITY },
								-- #endif
							},
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/24 Robo-mechanical Guts
									["provider"] = { "i", 9309 },	-- Robo-mechanical Guts
								}),
								i(216679),	-- Shoni's Dismantling Tool
								i(216680),	-- Shilly Mittens
							},
						}),
						q(80135, {	-- Klockmort's Essentials
							["qg"] = 6142,	-- Mathiel
							["coord"] = { 59.2, 45.2, DARNASSUS },
							["races"] = ALLIANCE_ONLY,
							["isBreadcrumb"] = true,
							["lvl"] = 40,
						}),
						q(80160, {	-- More Sparklematic Action
							["sourceQuest"] = 80153,	-- The Sparklematic 5200!
							["provider"] = { "o", 175084 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["repeatable"] = true,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80155, {	-- More Sparklematic Action
							["sourceQuest"] = 80158,	-- The Sparklematic 5200!
							["provider"] = { "o", 142487 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["repeatable"] = true,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80141, {	-- Nogg's Ring Redo
							["sourceQuest"] = 80140,	-- Return of the Ring [Horde]
							["qg"] = 3412,	-- Nogg <Expert Engineer>
							["coords"] = {
								-- #if AFTER CATA
								{ 56.7, 57.0, ORGRIMMAR },
								-- #else
								{ 75.8, 25.2, ORGRIMMAR },
								-- #endif
							},
							["cost"] = {
								{ "i", 216662, 1 },	-- Brilliant Gold Ring
								{ "i", 2842, 1 },	-- Silver Bar
								{ "i", 1206, 1 },	-- Moss Agate
								{ "g", 3000 },	-- 30s
							},
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								i(216674),	-- Nogg's Brilliant Gold Ring
							},
						}),
						q(79984, {	-- Quadrangulation
							["description"] = createLocalizationString({
								readable = "You can technically skip this quest if you get summoned to the next one... But you're a Completionist, right? Right?!",
								constant = "YOU_CAN_TECHNICALLY_SKIP_THIS_QUEST_IF_YOU_GET",
								export = true,
								text = {
									en = "You can technically skip this quest if you get summoned to the next one... But you're a Completionist, right? Right?!",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "严格来说，如果你被召唤到下一个任务，就可以跳过此任务……但你是个全收集玩家，对吧？对吧？！",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 79981,	-- The Corroded Core
							["qg"] = 7853,	-- Scooty <Chief Engineer>
							["coord"] = { 27.6, 77.4, STRANGLETHORN_VALE },
							["maps"] = {
								DUSTWALLOW_MARSH,
								DESOLACE,
								TANARIS,
								FERALAS,
							},
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- Quadrangulation Beacon 001
									["provider"] = { "o", 424074 },	-- Quadrangulation Beacon 001
									["coord"] = { 58.6, 13.0, DUSTWALLOW_MARSH },
								}),
								objective(2, {	-- Quadrangulation Beacon 002
									["provider"] = { "o", 424075 },	-- Quadrangulation Beacon 002
									["coord"] = { 32.01, 72.72, DESOLACE },
								}),
								objective(3, {	-- Quadrangulation Beacon 003
									["provider"] = { "o", 424076 },	-- Quadrangulation Beacon 003
									["coord"] = { 37.8, 27.3, TANARIS },
								}),
								objective(4, {	-- Quadrangulation Beacon 004
									["provider"] = { "o", 424077 },	-- Quadrangulation Beacon 004
									["coord"] = { 29.3, 93.8, FERALAS },
								}),
							},
						}),
						q(79987, {	-- Return of the Ring [Alliance]
							["sourceQuest"] = 79986,	-- Grime-Encrusted Ring
							["providers"] = {
								{ "i", 216662 },	-- Brilliant Gold Ring
								{ "o", 142487 },	-- The Sparklematic 5200
							},
							["maps"] = { IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
						}),
						q(80140, {	-- Return of the Ring [Horde]
							["sourceQuest"] = 79986,	-- Grime-Encrusted Ring
							["providers"] = {
								{ "i", 216662 },	-- Brilliant Gold Ring
								{ "o", 142487 },	-- The Sparklematic 5200
							},
							["maps"] = { ORGRIMMAR },
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
						}),
						q(80132, {	-- Rig Wars
							["qg"] = 3412,	-- Nogg <Expert Engineer>
							["coord"] = { 75.8, 25.2, ORGRIMMAR },
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Rig Blueprints
									["providers"] = {
										{ "i",   9153 },	-- Rig Blueprints
										{ "o", 142477 },	-- Thermaplugg's Safe
									},
								}),
								objective(2, {	-- 0/1 Thermaplugg's Safe Combination
									["provider"] = { "i", 9299 },	-- Thermaplugg's Safe Combination
									["cr"] = 7800,	-- Mekgineer Thermaplugg
								}),
								i(216675),	-- Pristine Civinad Robes
								i(216676),	-- Nimble Triprunner Dungarees
								i(216678),	-- Triple Reinforced Leggings
							},
						}),
						q(79705, {	-- Salvaging the Salvagematic
							["sourceQuest"] = 79626,	-- The Salvagematic 9000!
							["qg"] = 217689,	-- Ziri "The Wrench" Littlesprocket <Gearhead>
							["cost"] = {
								{ "i", 3860, 10 },	-- Mithril Bar
								{ "i", 11135, 5 },	-- Greater Mystic Essence
								{ "i", 216634, 3 },	-- GG12-082 Cartridge Fuse
								{ "i", 213735, 1 },	-- Pristine G-7 C.O.R.E. Processor
							},
							["lvl"] = 40,
						}),
						q(80137, {	-- Save Techbot's Brain!
							["sourceQuest"] = 80138,	-- Tinkmaster Overspark
							["qg"] = 7944,	-- Tinkmaster Overspark <Master Gnome Engineer>
							["coord"] = { 70.4, 49.4, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Techbot's Memory Core
									["provider"] = { "i", 9277 },	-- Techbot's Memory Core
								}),
							},
						}),
						q(79981, {	-- The Corroded Core
							["providers"] = {
								{ "i", 213736 },	-- Corroded G-7 C.O.R.E. Processor
								{ "n", 218237 },	-- Wirdal Wondergear <Gnomeregan Refugee>
							},
							["maps"] = { FERALAS },
							["lvl"] = 40,
						}),
						q(80180, {	-- The Grand Betrayal
							["qg"] = 7937,	-- High Tinker Mekkatorque <King of Gnomes>
							["coord"] = { 69.2, 49.2, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Mekgineer Thermaplugg
									["provider"] = { "n", 218537 },	-- Mekgineer Thermaplugg
								}),
								i(216675),	-- Pristine Civinad Robes
								i(216676),	-- Nimble Triprunner Dungarees
								i(216678),	-- Triple Reinforced Leggings
							},
						}),
						q(80324, {	-- The Mad King [Alliance]
							["providers"] = {
								{ "i", 217350 },	-- Thermaplugg's Engineering Notes (A)
								{ "n", 7937 },	-- High Tinker Mekkatorque <King of Gnomes>
							},
							["coord"] = { 69.0, 49.0, IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								i(213344),	-- Gnomeregan Peace Officer's Torque
								i(213343),	-- Justice Badge
								i(213346),	-- Pendant of Homecoming
								i(213345),	-- Piston Pendant
							},
						}),
						q(80325, {	-- The Mad King [Horde]
							["providers"] = {
								{ "i", 217351 },	-- Thermaplugg's Engineering Notes (B)
								{ "n", 3412 },	-- Nogg <Expert Engineer>
							},
							["coord"] = { 75.8, 25.2, ORGRIMMAR },
							["races"] = HORDE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								i(213344),	-- Gnomeregan Peace Officer's Torque
								i(213343),	-- Justice Badge
								i(213346),	-- Pendant of Homecoming
								i(213345),	-- Piston Pendant
							},
						}),
						q(80182, {	-- The Only Cure is More Green Glow
							["sourceQuest"] = 80139,	-- Gnogaine
							["qg"] = 1268,	-- Ozzie Togglevolt
							["coord"] = { 45.8, 49.2, DUN_MOROGH },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 High Potency Radioactive Fallout
									["provider"] = { "i", 9365 },	-- High Potency Radioactive Fallout
									["cost"] = { { "i", 9364, 1 } },	-- Heavy Leaden Collection Phial
									["cr"] = 6219,	-- Corrosive Lurker
								}),
							},
						}),
						q(79626, {	-- The Salvagematic 9000!
							["provider"] = { "o", 422483 },	-- The Salvagematic 9000
							["cost"] = {
								{ "i", 213427, 1 },	-- Grime-Encrusted Salvage
								{ "g", 3000 },	-- 30s
							},
							["lvl"] = 40,
						}),
						q(79704, {	-- The Salvagematic 9000!
							["sourceQuest"] = 79705,	-- Salvaging the Salvagematic
							["provider"] = { "o", 422483 },	-- The Salvagematic 9000
							["cost"] = {
								{ "i", 213427, 1 },	-- Grime-Encrusted Salvage
								{ "g", 3000 },	-- 30s
							},
							["repeatable"] = true,	-- TODO: Confirm this?
							["lvl"] = 40,
							["groups"] = {
								i(213641, {	-- Box of Gnomeregan Salvage
									i(216637),	-- A Pile of Random Parts
									i(213378),	-- Unstable Microfilament
									i(213370),	-- Irradiated Leather Scraps
									i(213381),	-- Pile of Tarnished Gears
									i(213371),	-- Crate of Tainted Gniodine Solution
									i(213373),	-- Reflective Scrapmetal
								}),
							},
						}),
						q(80161, {	-- The Sparklematic 5200!
							["provider"] = { "o", 175084 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["lvl"] = 40,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80153, {	-- The Sparklematic 5200!
							["sourceQuest"] = 80161,	-- The Sparklematic 5200!
							["provider"] = { "o", 175084 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["lvl"] = 40,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80157, {	-- The Sparklematic 5200!
							["provider"] = { "o", 142487 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["lvl"] = 40,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80158, {	-- The Sparklematic 5200!
							["sourceQuest"] = 80157,	-- The Sparklematic 5200!
							["provider"] = { "o", 142487 },	-- The Sparklematic 5200
							["cost"] = { { "i", 9308, 1 } },	-- Grime-Encrusted Object
							["lvl"] = 40,
							["groups"] = {
								i(9363),	-- Sparklematic-Wrapped Box
							},
						}),
						q(80138, {	-- Tinkmaster Overspark
							["qg"] = 7917,	-- Brother Sarno
							["coords"] = {
								-- #if AFTER WRATH
								{ 51.6, 48.6, STORMWIND_CITY },
								-- #else
								{ 40.6, 30.0, STORMWIND_CITY },
								-- #endif
							},
							["maps"] = { IRONFORGE },
							["races"] = ALLIANCE_ONLY,
							["isBreadcrumb"] = true,
							["lvl"] = 40,
						}),
						q(79982, {	-- Warranty Claim
							["sourceQuest"] = 79981,	-- The Corroded Core
							["qg"] = 218237,	-- Wirdal Wondergear <Gnomeregan Refugee>
							["coord"] = { 84.2, 43.8, FERALAS },
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- 0/1 Charged Voidcore
									["provider"] = { "i", 216636 },	-- Charged Voidcore
									["cost"] = {
										{ "i", 216635, 1 },	-- Spent Voidcore
										{ "i", 216645, 1 },	-- Mote of Darkness
									},
								}),
								i(213735),	-- Pristine G-7 C.O.R.E. Processor
							},
						}),
					}),
					n(VENDORS, {
						n(217689, {	-- Ziri "The Wrench" Littlesprocket <Gearhead>
							["sourceQuest"] = 79705,	-- Salvaging the Salvagematic
							["description"] = createLocalizationString({
								readable = "Located in the Clean Zone.",
								constant = "LOCATED_IN_THE_CLEAN_ZONE",
								export = true,
								text = {
									en = "Located in the Clean Zone.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "位于净化区。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								-- Recipes
								i(215141, {	-- Enchanted Sigil: Innovation
									["cost"] = 250000,	-- 25g
								}),
								i(215138, {	-- Formula: Enchant Chest - Retricutioner (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215129, {	-- Formula: Enchant Weapon - Dismantle (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215367, {	-- Pattern: Faintly Glowing Leather (RECIPE!)
									["cost"] = 150000,	-- 15g
								}),
								i(215152, {	-- Pattern: Glowing Gneuro-Linked Cowl (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215422, {	-- Pattern: Glowing Hyperconductive Scale Coif (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215423, {	-- Pattern: Gneuro-Conductive Channeler's Hood (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215149, {	-- Pattern: Gneuro-Linked Arcano-Filament Monocle (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215368, {	-- Pattern: Hyperconductive Arcano-Filament (RECIPE!)
									["cost"] = 150000,	-- 15g
								}),
								i(215424, {	-- Pattern: Rad-Resistant Scale Hood (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215384, {	-- Plans: Low-Background Truesilver Plates (RECIPE!)
									["cost"] = 150000,	-- 15g
								}),
								i(215383, {	-- Plans: Reflective Truesilver Braincage (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215155, {	-- Plans: Tempered Interference-Negating Helmet (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215433, {	-- Recipe: Insulating Gniodine (RECIPE!)
									["cost"] = 150000,	-- 15g
								}),
								i(215163, {	-- Recipe: Mildly-Irradiated Rejuvenation Potion (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215432, {	-- Schematic: Ez-Thro Radiation Bomb (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215431, {	-- Schematic: High-Yield Radiation Bomb (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215156, {	-- Schematic: Hyperconductive Goldwrap (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								i(215429, {	-- Schematic: Polished Truesilver Gears (RECIPE!)
									["cost"] = 250000,	-- 15g
								}),
								i(215153, {	-- Schematic: Whirling Truesilver Gearwall (RECIPE!)
									["cost"] = 250000,	-- 25g
								}),
								-- Plate
								i(213316, {	-- H.A.Z.A.R.D. Breastplate
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213330, {	-- H.A.Z.A.R.D. Legplates
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213335, {	-- H.A.Z.A.R.D. Boots
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								i(216485, {	-- Shockforged Breastplate
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(216486, {	-- Shockforged Legplates
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(216484, {	-- Shockforged Battleboots
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								-- Mail
								i(213314, {	-- Electromantic Chainmail
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213315, {	-- Electromantic Chainshirt
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213333, {	-- Electromantic Chausses
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213334, {	-- Electromantic Gambeson
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213338, {	-- Electromantic Grounding Boots
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								i(213339, {	-- Electromantic Grounding Sabatons
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								-- Leather
								i(213312, {	-- Insulated Apron
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213331, {	-- Insulated Leggings
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213342, {	-- Insulated Galoshes
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								i(213313, {	-- Insulated Chestguard
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213332, {	-- Insulated Legguards
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213341, {	-- Insulated Workboots
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								-- Cloth
								i(213311, {	-- Hyperconductive Robe
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213328, {	-- Hyperconductive Pantaloons
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213337, {	-- Hyperconductive Sandals
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								i(213310, {	-- Hyperconductive Shimmershirt
									["cost"] = { { "i", 217008, 1 } },	-- Power Depleted Chest
								}),
								i(213329, {	-- Hyperconductive Skirt
									["cost"] = { { "i", 217009, 1 } },	-- Power Depleted Legs
								}),
								i(213336, {	-- Hyperconductive Walkers
									["cost"] = { { "i", 217007, 1 } },	-- Power Depleted Boots
								}),
								i(216646, {	-- Ziri's Mystery Crate
									["description"] = createLocalizationString({
										readable = "Contains random reagents and world drops within. Can also contain epics!",
										constant = "CONTAINS_RANDOM_REAGENTS_AND_WORLD_DROPS_WITHIN",
										export = true,
										text = {
											en = "Contains random reagents and world drops within. Can also contain epics!",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "内含随机材料与世界掉落物品。也可能包含史诗物品！",
											-- TODO: tw = "",
										},
									}),
									["cost"] = { { "i", 216637, 3 } },	-- A Pile of Random Parts
								}),
							},
						}),
					}),
					n(COMMON_BOSS_DROPS, {
						["description"] = createLocalizationString({
							readable = "The following can drop from three of the bosses.",
							constant = "THE_FOLLOWING_CAN_DROP_FROM_THREE_OF_THE_BOSSES",
							export = true,
							text = {
								en = "The following can drop from three of the bosses.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "以下物品可以从三个首领处掉落。",
								-- TODO: tw = "",
							},
						}),
						["crs"] = {
							220072,	-- Electrocutioner 6000
							218537,	-- Mekgineer Thermaplugg
							218242,	-- STX-04/BD
						},
						["groups"] = {
							i(217008),	-- Power Depleted Chest
							i(217009),	-- Power Depleted Legs
							i(217007),	-- Power Depleted Boots
							i(215377),	-- Irradiated Robe
							i(215379),	-- Irradiated Trousers
							i(215378),	-- Irradiated Boots
						},
					}),
					n(216666, {	-- Techbot
						["description"] = "~L.LOCATED_OUTSIDE_THE_INSTANCE_NEAR_THE",
						["groups"] = {
							i(213736),	-- Corroded G-7 C.O.R.E. Processor
							i(9277),	-- Techbot's Memory Core
							-- #if BEFORE 10.1.7
							i(9444, {	-- Techbot CPU Shell
								["timeline"] = { REMOVED_4_0_3 },
							}),
							-- #endif
						},
					}),
					n(217280, {	-- Grubbis
						["description"] = createLocalizationString({
							readable = "The Grubbis fight starts with a short gauntlet style fight, a mix of Troggs will spawn in small waves followed by Poison Clouds, you should kite the Troggs into the Poison Clouds. This causes the Poison Clouds to explode and kill the Troggs and then despawn.\n\nAfter a few waves, Grubbis spawns alongside his basilisk pet - Chomper, because of his pet this fight easier to manage with two tanks, but not required with disciplined damage dealers who focus Grubbis himself - this makes threat more manageable. Additionally, everyone with an interrupt must be paying close attention to Chomper's casts, to kick the Petrify cast - otherwise the only tank will lose threat of both bosses.\n\nOnce he spawns, the waves of Troggs and Poison Clouds continue to spawn, these can be managed through the same means as during the gauntlet by kiting the creatures into the clouds. It is possible to ignore the clouds for uptime and cleave or ignore the adds while focusing the boss but it is not recommended for the average raid.",
							constant = "THE_GRUBBIS_FIGHT_STARTS_WITH_A_SHORT_GAUNTLET",
							export = true,
							text = {
								en = "The Grubbis fight starts with a short gauntlet style fight, a mix of Troggs will spawn in small waves followed by Poison Clouds, you should kite the Troggs into the Poison Clouds. This causes the Poison Clouds to explode and kill the Troggs and then despawn.\n\nAfter a few waves, Grubbis spawns alongside his basilisk pet - Chomper, because of his pet this fight easier to manage with two tanks, but not required with disciplined damage dealers who focus Grubbis himself - this makes threat more manageable. Additionally, everyone with an interrupt must be paying close attention to Chomper's casts, to kick the Petrify cast - otherwise the only tank will lose threat of both bosses.\n\nOnce he spawns, the waves of Troggs and Poison Clouds continue to spawn, these can be managed through the same means as during the gauntlet by kiting the creatures into the clouds. It is possible to ignore the clouds for uptime and cleave or ignore the adds while focusing the boss but it is not recommended for the average raid.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "格拉比斯的战斗以一段短促的闯关式战斗开始，会成小波刷新混合的穴居人，随后出现毒云，你应该把穴居人风筝进毒云里。这会使毒云爆炸，杀死穴居人然后消失。\n\n几波之后，格拉比斯会与他的石化蜥蜴宠物——咀嚼者一同出现，因为有这只宠物，这场战斗用两个坦克会更好处理，但如果输出有纪律地专注于格拉比斯本人，则并非必需——这样仇恨也更好控制。此外，所有有打断技能的人都必须密切关注咀嚼者的施法，以打断石化，否则唯一的坦克会同时失去两个首领的仇恨。\n\n他刷新后，成波的穴居人和毒云会继续刷新，可以按闯关阶段的同样方式处理，即把生物风筝进云里。为了保持输出时间而忽略毒云并顺劈，或在专注首领时忽略小怪，都是可行的，但不推荐普通团队这样做。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(213542),	-- The Necro-Gnomicon
							i(213351),	-- Irradiated Tower Shield
							i(213327),	-- Belt of the Trogg Berserker
							i(213294),	-- Caverndeep Sabatons
							i(213326),	-- Girdle of Reclamation
							i(213288),	-- Grubbis Grubby Gauntlets
							i(213324),	-- Electromagnetic Waistcord
							i(213304),	-- Troggslayer Pauldrons
							i(213323),	-- Cord of Deep Earth
							i(213322),	-- Skullduggery Waistband
							i(213321),	-- Volatile Concoction Belt
							i(215437),	-- Trogg Transfigurator 3000
							i(216490),	-- Idol of Wrath
							i(215435),	-- Libram of Benediction
							i(215436),	-- Totem of Invigorating Flame
						},
					}),
					n(220007, {	-- Viscous Fallout
						["description"] = createLocalizationString({
							readable = "He will drop pools of toxic slime that both damages and slows those that stand on it. Making sure to move the boss out of these will make it a lot easier for healers.\n\nThe Viscous Fallout boss will also sometimes spawn in 3x Irradiated Goo, these will run towards the fallen Desiccated Fallout in the ground, make sure to kill them before they make it to the corpses or they will respawn the Desiccated Fallout which cause a lot more raid-wide damage if not interrupted. This can be made easier by initially moving the boss to further from the Desiccated Fallout corpses to give longer leeway for killing the Irradiated Goo.",
							constant = "HE_WILL_DROP_POOLS_OF_TOXIC_SLIME_THAT_BOTH",
							export = true,
							text = {
								en = "He will drop pools of toxic slime that both damages and slows those that stand on it. Making sure to move the boss out of these will make it a lot easier for healers.\n\nThe Viscous Fallout boss will also sometimes spawn in 3x Irradiated Goo, these will run towards the fallen Desiccated Fallout in the ground, make sure to kill them before they make it to the corpses or they will respawn the Desiccated Fallout which cause a lot more raid-wide damage if not interrupted. This can be made easier by initially moving the boss to further from the Desiccated Fallout corpses to give longer leeway for killing the Irradiated Goo.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "他会投下有毒黏液池，站在其中的目标会受到伤害并被减速。务必把首领拉离这些黏液池，这样会大大减轻治疗的压力。\n\n黏稠辐射体首领有时还会生成 3 只辐射软泥怪，它们会朝地上的干枯辐射体尸体跑去，务必在它们到达尸体前将其击杀，否则它们会使干枯辐射体复活，若未能打断会造成大量团队范围伤害。可以先把首领拉得离干枯辐射体尸体更远一些，这样就有更充裕的时间击杀辐射软泥怪。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(213291),	-- Toxic Revenger II
							i(213352),	-- Gear-Mender's Grace
							i(213353),	-- Defibrillating Staff
							i(213289),	-- Hydrostaff
							i(213355),	-- Falco's Sting
							i(213307),	-- Drape of Dismantling
							i(213413),	-- Generously Padded Shoulderpads
							i(213302),	-- Mantle of the Cunning Negotiator
							i(213299),	-- Petrolspill Pants
							i(213301),	-- Synthetic Mantle
							i(213285),	-- Lev's Oil-Stained Bindings
							i(213290),	-- Acidic Waders
						},
					}),
					n(220072, {	-- Electrocutioner 6000
						["description"] = createLocalizationString({
							readable = "The main mechanic of this fight comes from Static Arc, this ability does a chain lighting cast on a player and it bounces twice, hitting a total of three players - these get debuffed and cannot be hit by it again twice in a row or the 500% damage increase will kill them.\n\nThe way to deal with it is to have two pre-assigned groups be moving in and out of close proximity to the boss in order to soak every other Static Arc. Doing this will make the mechanic safe. Ideally have the caster damage dealers do this so that the melee can keep up high uptime on the boss. Healers can potentially be assigned for moving in and out as well, but ideally it's important that they can heal freely since the fight has somewhat respectable damage throughout.\n\nLastly, Magnetic Pulse is an ability that must be respected by everyone, if targeted the player must move out to a empty space or pre-assigned spot in order to avoid damaging other players as well. Just be aware that if targeted, the player should not by any means ever be further away from the boss than the groups soaking Static Arc, otherwise you'll get targeted by it instead and potentially killing the players with the debuff that are currently standing near the boss.",
							constant = "THE_MAIN_MECHANIC_OF_THIS_FIGHT_COMES_FROM",
							export = true,
							text = {
								en = "The main mechanic of this fight comes from Static Arc, this ability does a chain lighting cast on a player and it bounces twice, hitting a total of three players - these get debuffed and cannot be hit by it again twice in a row or the 500% damage increase will kill them.\n\nThe way to deal with it is to have two pre-assigned groups be moving in and out of close proximity to the boss in order to soak every other Static Arc. Doing this will make the mechanic safe. Ideally have the caster damage dealers do this so that the melee can keep up high uptime on the boss. Healers can potentially be assigned for moving in and out as well, but ideally it's important that they can heal freely since the fight has somewhat respectable damage throughout.\n\nLastly, Magnetic Pulse is an ability that must be respected by everyone, if targeted the player must move out to a empty space or pre-assigned spot in order to avoid damaging other players as well. Just be aware that if targeted, the player should not by any means ever be further away from the boss than the groups soaking Static Arc, otherwise you'll get targeted by it instead and potentially killing the players with the debuff that are currently standing near the boss.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "这场战斗的主要机制来自静电弧，该技能会对一名玩家施放连锁闪电并弹跳两次，总共命中三名玩家——这些玩家会被施加负面效果，不能连续两次被命中，否则 500% 的伤害提升会杀死他们。\n\n应对方式是让两个预先分配好的小组轮流靠近和远离首领，以轮流承受每一次静电弧。这样做就能使该机制变得安全。最好让法系输出这样做，以便近战能保持对首领的高输出时间。治疗也可以被分配进出，但最好让他们能自由治疗，因为整场战斗的伤害相当可观。\n\n最后，磁力脉冲是每个人都必须认真对待的技能，如果被点名，玩家必须移动到空旷处或预先指定的位置，以避免同时伤害其他玩家。只要注意，如果被点名，玩家绝不能离首领比其他承受静电弧的小组更远，否则你反而会被它点名，并可能杀死当前站在首领附近、带有负面效果的玩家。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(213560),	-- Mechanostrider Muffler
							i(213286),	-- Electrocutioner's Needle
							i(213354),	-- Staff of the Evil Genius
							i(213293),	-- Hi-tech Supergun Mk.VII
							i(213559),	-- Mechanostrider Gear Shifter
							i(213309),	-- Cloak of Invention
							i(213418),	-- Welded Truesilver Ringlets
							i(213279),	-- Reflective Skullcap
							i(213319),	-- Machinist's Gloves
							i(213300),	-- Fighter Ace Gloves
							i(213414),	-- Mech-Mender's Sash
							i(213298),	-- Mechbuilder's Overalls
							i(213287),	-- Electrocutioner Hexnut
							i(216494),	-- Aragriar's Whimsical World Warper
						},
					}),
					n(215728, {	-- Crowd Pummeler 9-60
						["description"] = createLocalizationString({
							readable = "This fight only requires one tank and should just be tanked normally, the tank should be careful to not get knocked back in order to help with melee dps uptime.\n\nThe boss will initially throw out two gears onto the floor using Gear Toss, which you must dodge as they run linearly through the boss area, they're pretty slow so just position with them in mind since they can knock the players off the platforms and kill them.\n\nOccasionally, the boss will shoot out a frontal Gnomeregan Smash which targets a player and shoots a large projectile that will knock back and kill mainly via fall damage, this can easily be dodged by looking at the boss's feet to see where he's facing since the upper half of the body can be facing elsewhere.\n\nTowards the end of the fight (30%) the boss will also be able to cast The Claw! which will target a random player and dash to grab them and do significant damage - this is telegraphed quite well so healers should pay attention to it and keep that player alive through the initial damage and follow up.",
							constant = "THIS_FIGHT_ONLY_REQUIRES_ONE_TANK_AND_SHOULD",
							export = true,
							text = {
								en = "This fight only requires one tank and should just be tanked normally, the tank should be careful to not get knocked back in order to help with melee dps uptime.\n\nThe boss will initially throw out two gears onto the floor using Gear Toss, which you must dodge as they run linearly through the boss area, they're pretty slow so just position with them in mind since they can knock the players off the platforms and kill them.\n\nOccasionally, the boss will shoot out a frontal Gnomeregan Smash which targets a player and shoots a large projectile that will knock back and kill mainly via fall damage, this can easily be dodged by looking at the boss's feet to see where he's facing since the upper half of the body can be facing elsewhere.\n\nTowards the end of the fight (30%) the boss will also be able to cast The Claw! which will target a random player and dash to grab them and do significant damage - this is telegraphed quite well so healers should pay attention to it and keep that player alive through the initial damage and follow up.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "这场战斗只需要一名坦克，按常规拉怪即可；坦克要注意不要被击退，以便近战输出能持续进行。\n\n首领一开始会用投掷齿轮向地面扔出两个齿轮，它们会沿直线滚过首领区域，你必须躲开；它们速度相当慢，所以只要预判它们的位置站位就行，因为它们能把玩家撞下平台摔死。\n\n偶尔，首领会射出正面的诺莫瑞根重击，锁定一名玩家并射出大型投射物，将其击退并主要靠坠落伤害杀死；由于首领上半身可能朝向别处，只要看它脚下的朝向就能轻松躲开。\n\n战斗接近尾声时（30%），首领还会施放利爪！，锁定一名随机玩家冲过去抓住并造成大量伤害——这个技能的预警相当明显，所以治疗应当留意它，并在初次伤害及后续伤害中保住该玩家。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(213442),	-- Cogmaster's Claw
							i(213295),	-- Ultrasonic Vibroblade
							i(210741),	-- Automatic Crowd Pummeler
							i(213292),	-- Gizmotron Gigachopper
							i(213408),	-- Gyromatic Macro-Adjustor
							i(213419),	-- 9-60 Repair Manual
							i(213412),	-- Dielectric Safety Shield
							i(213305),	-- Machined Alloy Shoulderplates
							i(213317),	-- Experimental Aim Stabilizers
							i(213278),	-- Bonk-Maestro's Handguards
							i(213340),	-- Gnomebot Operators Boots
							i(213415),	-- Tinker's Wrist Wraps
							i(215449),	-- World Shrinker
						},
					}),
					n(218242, {	-- Mechanical Menagerie (STX-04/BD)
						["description"] = createLocalizationString({
							readable = "The chicken, squirrel and whelp must be tanked, meaning it requires at least two tanks.\n\nThe sheep instead of being tanked, targets a player and slowly moves towards them. It must be kited, ideally somewhat near the other three but not close enough where it'll Binary Bleat silence the melee and tanks.\n\nRanged should stand near the middle so that the tank and melee can kite the bosses around the perimeter of the boss area.\n\nThe dps should try to damage the bosses somewhat evenly - but pay attention to which boss the whelp applies Overheat onto, since this causes that target to get damaged 25% more while the buff is active, making it more effective to focus while it's up.\n\nEvery boss should die at the same time, otherwise they cast Self Repair which only gets canceled by all of them being at 1hp - this ability will heal them for 31% of their total health.",
							constant = "THE_CHICKEN_SQUIRREL_AND_WHELP_MUST_BE_TANKED",
							export = true,
							text = {
								en = "The chicken, squirrel and whelp must be tanked, meaning it requires at least two tanks.\n\nThe sheep instead of being tanked, targets a player and slowly moves towards them. It must be kited, ideally somewhat near the other three but not close enough where it'll Binary Bleat silence the melee and tanks.\n\nRanged should stand near the middle so that the tank and melee can kite the bosses around the perimeter of the boss area.\n\nThe dps should try to damage the bosses somewhat evenly - but pay attention to which boss the whelp applies Overheat onto, since this causes that target to get damaged 25% more while the buff is active, making it more effective to focus while it's up.\n\nEvery boss should die at the same time, otherwise they cast Self Repair which only gets canceled by all of them being at 1hp - this ability will heal them for 31% of their total health.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "小鸡、松鼠和雏龙必须由坦克拉住，这意味着至少需要两个坦克。\n\n绵羊则不靠拉怪，而是会锁定一名玩家并缓慢向其移动。必须对它进行风筝，最好把它带得离其他三个不太远，但又不能近到它会用二元嘶鸣沉默近战和坦克。\n\n远程应站在中间附近，以便坦克和近战能沿首领区域的外围风筝这些首领。\n\n输出应尽量让这些首领受到的伤害保持均衡——但要注意雏龙把过热施加到了哪个首领身上，因为这会使其在增益持续期间多受 25% 的伤害，所以在增益存在时集中攻击它更有效。\n\n所有首领必须同时死亡，否则它们会施放自我修复，而只有让它们全部处于 1 点生命值才能打断这个技能——该技能会为它们恢复总生命值的 31%。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(213410),	-- Glimmering Gizmoblade
							i(213297),	-- Oscillating Blasthammer
							i(213296),	-- Supercharged Headchopper
							i(213411),	-- Izzleflick's Inextinguishable Igniter
							i(213306),	-- Ingenuity's Cover
							i(213308),	-- Prototype Parachute Cloak
							i(213280),	-- Marksman's Scopevisor
							i(213303),	-- Lightning Rod Spaulders
							i(213320),	-- Fingers of Arcane Accuracy
							i(213325),	-- Darkvision Girdle
							i(215380),	-- Power-Assisted Lifting Belt
							i(213318),	-- Ornate Dark Iron Bangles
							i(213417),	-- Truesilver Filament Coif
							i(4415),	-- Schematic: Craftsman's Monocle (RECIPE!)
							i(4413),	-- Schematic: Discombobulator Ray (RECIPE!)
							i(6716),	-- Schematic: EZ-Thro Dynamite (RECIPE!)
							i(4411),	-- Schematic: Flame Deflector (RECIPE!)
							i(6672),	-- Schematic: Flash Bomb (RECIPE!)
							i(7742),	-- Schematic: Gnomish Cloaking Device (RECIPE!)
							i(7560),	-- Schematic: Gnomish Universal Remote (RECIPE!)
							i(4416),	-- Schematic: Goblin Land Mine (RECIPE!)
							i(7192, {	-- Schematic: Goblin Rocket Boots
								["timeline"] = { DELETED_3_0_2 },
							}),
							i(4417),	-- Schematic: Large Seaforium Charge (RECIPE!)
							i(4408),	-- Schematic: Mechanical Squirrel Box (RECIPE!)
							i(4412),	-- Schematic: Moonsight Rifle (RECIPE!)
							i(4414),	-- Schematic: Portable Bronze Mortar (RECIPE!)
							i(4409),	-- Schematic: Small Seaforium Charge (RECIPE!)
						},
					}),
					n(218537, {	-- Mekgineer Thermaplugg
						["description"] = createLocalizationString({
							readable = "This fight requires two tanks, as each phase has a different forced tank swap mechanic.\n\nThroughout the fight, the six pillars around the boss arena will ocasionally activate and spawn in bombs if different types depending on the current phase. These pillars must be turned off by clicking the red button to on their right side.\n\nDuring the first phase, the fire boss will be stacking Sprocketfire on the tank, via either Sprocketfire Punch, Furnace Surge, and Incendiary Bombs; and on the raid through the latter two. Furnace Surge can be avoided entirely even by the tank by running directly away from the boss while it does its frontal. Between 5 and 7 stacks, the off-tank should taunt and pick up the boss until the main tank's Sprocketfire runs out.\n\nDuring the second phase, the frost boss will be stacking Freezing on the raid, via Coolant Discharge, and Frost Bomb; and on the tank, via Supercooled Smash. This debuff can be dispelled, meaning one tank can handle the boss the entire phase - without worrying about getting Frozen Solid. Make sure to keep the tank and the raid below 9 stacks, because during the 10th, it will freeze the target, and when Coolant Discharge is cast, it'll causes a raid-wipe.\n\nDuring the third phase, the nature boss will be stacking Radiation Sickness on the raid via Radioactive Bomb; and on the tank through Hazardous Hammer. These stacks should be either dispelled, or at least kept low. Otherwise, when the Toxic Ventilation gets casted, it'll have massive AoE damage. Toxic Ventilation can be interrupted, but the lack of a cast bar can make it more challenging than normal - so those with kicks should pay close attention.\n\nDuring the fourth phase, STX-99/XD will spawn and have all of the abilities mentioned above, although it sounds chaotic, it makes each individual mechanic somewhat easier to deal with, since the none of the three stacks will be major concern as long as you continue dealing with the bombs, and remember the previous basic mechanics.",
							constant = "THIS_FIGHT_REQUIRES_TWO_TANKS_AS_EACH_PHASE_HAS",
							export = true,
							text = {
								en = "This fight requires two tanks, as each phase has a different forced tank swap mechanic.\n\nThroughout the fight, the six pillars around the boss arena will ocasionally activate and spawn in bombs if different types depending on the current phase. These pillars must be turned off by clicking the red button to on their right side.\n\nDuring the first phase, the fire boss will be stacking Sprocketfire on the tank, via either Sprocketfire Punch, Furnace Surge, and Incendiary Bombs; and on the raid through the latter two. Furnace Surge can be avoided entirely even by the tank by running directly away from the boss while it does its frontal. Between 5 and 7 stacks, the off-tank should taunt and pick up the boss until the main tank's Sprocketfire runs out.\n\nDuring the second phase, the frost boss will be stacking Freezing on the raid, via Coolant Discharge, and Frost Bomb; and on the tank, via Supercooled Smash. This debuff can be dispelled, meaning one tank can handle the boss the entire phase - without worrying about getting Frozen Solid. Make sure to keep the tank and the raid below 9 stacks, because during the 10th, it will freeze the target, and when Coolant Discharge is cast, it'll causes a raid-wipe.\n\nDuring the third phase, the nature boss will be stacking Radiation Sickness on the raid via Radioactive Bomb; and on the tank through Hazardous Hammer. These stacks should be either dispelled, or at least kept low. Otherwise, when the Toxic Ventilation gets casted, it'll have massive AoE damage. Toxic Ventilation can be interrupted, but the lack of a cast bar can make it more challenging than normal - so those with kicks should pay close attention.\n\nDuring the fourth phase, STX-99/XD will spawn and have all of the abilities mentioned above, although it sounds chaotic, it makes each individual mechanic somewhat easier to deal with, since the none of the three stacks will be major concern as long as you continue dealing with the bombs, and remember the previous basic mechanics.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "这场战斗需要两名坦克，因为每个阶段都有不同的强制换坦机制。\n\n整场战斗中，首领场地周围的六根柱子会偶尔激活，并根据当前阶段生成不同类型的炸弹。必须点击柱子右侧的红色按钮来将其关闭。\n\n第一阶段中，火焰首领会通过齿轮烈焰拳、熔炉涌动和燃烧弹对坦克叠加齿轮烈焰，并通过后两者同时对团队叠加。即使是坦克，只要在首领正面施放时径直远离它，也能完全躲开熔炉涌动。叠加到 5 至 7 层时，副坦克应当嘲讽并接手首领，直到主坦克身上的齿轮烈焰消失。\n\n第二阶段中，冰霜首领会通过冷却液喷发和冰霜炸弹对团队叠加冰冻，并通过超冷重击对坦克叠加。该减益可以被驱散，也就是说一名坦克就能应对整个阶段的首领——不必担心被完全冰冻。务必让坦克和团队的层数保持在 9 层以下，因为第 10 层会冻结目标，而此时若施放冷却液喷发，就会导致团队全灭。\n\n第三阶段中，自然首领会通过辐射炸弹对团队叠加辐射病，并通过危险之锤对坦克叠加。这些层数应当被驱散，或至少保持较低。否则，当剧毒排气被施放时，会造成巨额的群体伤害。剧毒排气可以被打断，但它没有施法条，因此比一般情况更难应付——所以有打断技能的人要格外留意。\n\n第四阶段会刷新 STX-99/XD，它拥有上述所有技能；虽然听起来很混乱，但实际上会让每个单独的机制都更容易处理，因为只要你继续处理炸弹并记住之前的基本机制，三种层数都不会再是大问题。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(13325),	-- Fluorescent Green Mechanostrider (MOUNT!)
							i(217350),	-- Thermaplugg's Engineering Notes (A)
							i(217351),	-- Thermaplugg's Engineering Notes (H)
							-- Fist Weapons
							i(213409),	-- Mekkatorque's Arcano-Shredder
							-- Guns
							i(213356),	-- Thermaplugg's Custom Blaster
							-- Two-Handed Axe
							i(213416),	-- Thermaplugg's Rocket Cleaver
							-- Cloth
							i(213281),	-- Electromagnetic Hyperflux Reactivator
							i(216608),	-- Radiant Ray Reflectors
							-- Rings
							i(213283),	-- Hypercharged Gear of Conflagration
							i(213284),	-- Hypercharged Gear of Devastation
							i(213282),	-- Hypercharged Gear of Innovation
							-- Trinkets
							i(215461),	-- Domesticated Attack Chicken
							i(213349),	-- Gniodine Pill Bottle
							i(213348),	-- Gyromatic Experiment 420b
							i(213347),	-- Miniaturized Combustion Chamber
							i(213350),	-- Wirdal's Hardened Core
							-- Original recipe drops.
							i(4415),	-- Schematic: Craftsman's Monocle (RECIPE!)
							i(4413),	-- Schematic: Discombobulator Ray (RECIPE!)
							i(6716),	-- Schematic: EZ-Thro Dynamite (RECIPE!)
							i(4411),	-- Schematic: Flame Deflector (RECIPE!)
							i(6672),	-- Schematic: Flash Bomb (RECIPE!)
							i(7742),	-- Schematic: Gnomish Cloaking Device (RECIPE!)
							i(7560),	-- Schematic: Gnomish Universal Remote (RECIPE!)
							i(7561),	-- Schematic: Goblin Jumper Cables (RECIPE!)
							i(4416),	-- Schematic: Goblin Land Mine (RECIPE!)
							i(7192, {	-- Schematic: Goblin Rocket Boots
								["timeline"] = { DELETED_3_0_2 },
							}),
							i(4417),	-- Schematic: Large Seaforium Charge (RECIPE!)
							i(4408),	-- Schematic: Mechanical Squirrel Box (RECIPE!)
							i(4412),	-- Schematic: Moonsight Rifle (RECIPE!)
							i(4414),	-- Schematic: Portable Bronze Mortar (RECIPE!)
							i(4410),	-- Schematic: Shadow Goggles (RECIPE!)
							i(4409),	-- Schematic: Small Seaforium Charge (RECIPE!)
						},
					}),
				},
			}))),
			-- #endif
		},
	}),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_2 } }, {
	inst(231, {
		q(35601),	-- Gnomeregan Reward Quest - Normal completion
		q(35602),	-- Gnomeregan Bonus Objective Reward Quest - kill Grubbis
	}),
})));
