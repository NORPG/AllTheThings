-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local KRYSTALLUS = 604;
local MAIDEN_OF_GRIEF = 605;
local TRIBUNAL_OF_AGES = 606;
local SJONNIR = 607;

------ EncounterToCRS ------
local EncounterToCRS = {
	[KRYSTALLUS] = { 27977 },	-- Krystallus
	[MAIDEN_OF_GRIEF] = { 27975 },	-- Maiden of Grief
	[TRIBUNAL_OF_AGES] = { 28234 },	-- Tribunal of Ages
	[SJONNIR] = { 27978 },	-- Sjonnir The Ironshaper
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty, CommonBossDrops =
InstanceHelper.BossOnly, InstanceHelper.Difficulty, InstanceHelper.CommonBossDrops

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, {
	inst(277, {	-- Halls of Stone
		mapID = HALLS_OF_STONE,
		coord = { 44.8, 14.5, THE_STORM_PEAKS },
		timeline = { ADDED_3_0_2 },
		lvl = lvlsquish(75, 75, 20),
		groups = {
			n(ACHIEVEMENTS, {
				ach(485, {	-- Halls of Stone
					-- #if AFTER 7.3.5
					crit(5452, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(6935, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5453, {	-- Krystallus
						_encounter = { KRYSTALLUS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5454, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(5452, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(6935, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5453, {	-- Krystallus
						_encounter = { KRYSTALLUS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #if ANYCLASSIC
					-- NOTE: This boss has a different criteriaUID in classic for some dumb reason. BLIZZARD.
					crit(5628, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #else
					crit(5454, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
					-- #endif
				}),
				-- #if ANYCLASSIC
				applyclassicphase(WRATH_PHASE_TWO, ach(17297, {	-- Defense Protocol Alpha: Halls of Stone
					crit(57752, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57749, {	-- Krystallus
						_encounter = { KRYSTALLUS, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57751, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57748, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DEFENSE_PROTOCOL_ALPHA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_THREE, ach(18597, {	-- Defense Protocol Beta: Halls of Stone
					crit(60600, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60598, {	-- Krystallus
						_encounter = { KRYSTALLUS, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60599, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60597, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DEFENSE_PROTOCOL_BETA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_FOUR, ach(19434, {	-- Defense Protocol Gamma: Halls of Stone
					crit(63347, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63345, {	-- Krystallus
						_encounter = { KRYSTALLUS, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63346, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63344, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DEFENSE_PROTOCOL_GAMMA },
					}),
				})),
				-- #endif
				ach(496, {	-- Heroic: Halls of Stone
					crit(6856, {	-- Maiden of Grief
						_encounter = { MAIDEN_OF_GRIEF, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5615, {	-- Sjonnir the Ironshaper
						_encounter = { SJONNIR, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6936, {	-- Tribunal of Ages
						_encounter = { TRIBUNAL_OF_AGES, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6857, {	-- Krystallus
						_encounter = { KRYSTALLUS, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			n(QUESTS, {
				q(29850, {	-- Corrupt Constructs
					qg = 55835,	-- Kaldir Ironbane
					coord = { 35.6, 35.2, HALLS_OF_STONE },
					timeline = { ADDED_4_3_0 },
					lvl = lvlsquish(75, 75, 20),
				}),
				q(13207, {	-- Halls of Stone
					qg = 28070,	-- Brann Bronzebeard
					coord = { 70.8, 50.0, HALLS_OF_STONE },
					lvl = lvlsquish(76, 75, 20),
					groups = {
						i(44370),	-- Mantle of the Intrepid Explorer
						i(44373),	-- Pauldrons of Reconnaissance
						i(44371),	-- Shoulderpads of the Adventurer
						i(44372),	-- Spaulders of Lost Secrets
					},
				}),
				q(29848, {	-- The Forlorn Watcher
					qg = 55835,	-- Kaldir Ironbane
					coord = { 35.6, 35.2, HALLS_OF_STONE },
					timeline = { ADDED_4_3_0 },
					lvl = lvlsquish(75, 75, 20),
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					i(37673),	-- Dark Runic Mantle
					i(35683),	-- Palladium Ring
					i(37672),	-- Patina-Coated Breastplate
					i(37671),	-- Refined Ore Gloves
					i(42780),	-- Relics of Ulduar
					i(35682),	-- Rune Giant Bindings
					i(35681),	-- Unrelenting Blade
				}),
				BossOnly(KRYSTALLUS, {
					i(35670),	-- Brann's Lost Mining Helmet
					i(35672),	-- Hollow Geode Helm
					i(35673),	-- Leggings of Burning Gleam
					i(37649, { timeline = { CREATED_3_0_2, ADDED_7_3_5 } }),	-- Quarry Chisel
					i(37650),	-- Shardling Legguards
					i(37652),	-- Spaulders of Krystallus
					i(37651),	-- The Prospector's Prize
				}),
				BossOnly(MAIDEN_OF_GRIEF, {
					i(38613),	-- Chain of Fiery Orbs
					i(38614),	-- Embrace of Sorrow
					i(38618),	-- Hammer of Grief
					i(38615),	-- Lightning-Charged Gloves
					i(38616),	-- Maiden's Girdle
					i(38611),	-- Ringlet of Repose
					i(38617),	-- Woeful Band
				}),
				BossOnly(TRIBUNAL_OF_AGES, {
					i(35676),	-- Constellation Leggings
					i(35677),	-- Cosmos Vestments
					i(35675),	-- Linked Armor of the Sphere
					i(37655),	-- Mantle of the Tribunal
					i(157564, { timeline = { ADDED_7_3_5 } }),	-- Marbled Bracers
					i(37656),	-- Raging Construct Bands
					i(37654),	-- Sabaton of the Ages
					i(37653),	-- Sword of Justice
				}),
				BossOnly(SJONNIR, {
					i(35680),	-- Amulet of Wills
					i(37668),	-- Bands of the Stoneforge
					i(37666),	-- Boots of the Whirling Mist
					i(37660),	-- Forge Ember
					i(35678),	-- Ironshaper's Legplates
					i(37669),	-- Leggings of the Stone Halls
					i(37670),	-- Sjonnir's Girdle
					i(37657),	-- Spark of Life
					i(35679),	-- Static Cowl
					i(37658),	-- Sun-Emblazoned Chestplate
					i(37667),	-- The Fleshshaper
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(KRYSTALLUS),
				BossOnly(MAIDEN_OF_GRIEF, {
					ach(1866),	-- Good Grief
				}),
				BossOnly(TRIBUNAL_OF_AGES, {
					ach(2154),	-- Brann Spankin' New
				}),
				BossOnly(SJONNIR, {
					i(43699, { timeline = { REMOVED_4_0_1 } }),	-- The Curse of Flesh Disc (QI!)
					--
					ach(2155),	-- Abuse the Ooze
					ach(5102, { timeline = { ADDED_4_0_3 } }),	-- Heroic: Halls of Stone Guild Run
					i(41792, { timeline = { ADDED_3_0_3, REMOVED_4_0_3 } }),	-- Design: Deft Monarch Topaz (RECIPE!)
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					i(42780),	-- Relics of Ulduar
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				n(ZONE_DROPS, {
					i(35683),	-- Palladium Ring
					i(35682),	-- Rune Giant Bindings
					i(35681),	-- Unrelenting Blade
				}),
				BossOnly(KRYSTALLUS, {
					i(35670),	-- Brann's Lost Mining Helmet
					i(35672),	-- Hollow Geode Helm
					i(35673),	-- Leggings of Burning Gleam
					i(37649, { timeline = { CREATED_3_0_2, ADDED_7_3_5 } }),	-- Quarry Chisel
				}),
				BossOnly(MAIDEN_OF_GRIEF, {
					i(38613),	-- Chain of Fiery Orbs
					i(38614),	-- Embrace of Sorrow
					i(38611),	-- Ringlet of Repose
				}),
				BossOnly(TRIBUNAL_OF_AGES, {
					i(35676),	-- Constellation Leggings
					i(35677),	-- Cosmos Vestments
					i(35675),	-- Linked Armor of the Sphere
				}),
				BossOnly(SJONNIR, {
					i(35680),	-- Amulet of Wills
					i(35678),	-- Ironshaper's Legplates
					i(35679),	-- Static Cowl
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ZONE_DROPS, {
					i(37673),	-- Dark Runic Mantle
					i(37672),	-- Patina-Coated Breastplate
					i(37671),	-- Refined Ore Gloves
				}),
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(KRYSTALLUS, {
					i(37650),	-- Shardling Legguards
					i(37652),	-- Spaulders of Krystallus
					i(37651),	-- The Prospector's Prize
				}),
				BossOnly(MAIDEN_OF_GRIEF, {
					ach(1866),	-- Good Grief
					i(38618),	-- Hammer of Grief
					i(38615),	-- Lightning-Charged Gloves
					i(38616),	-- Maiden's Girdle
					i(38617),	-- Woeful Band
				}),
				BossOnly(TRIBUNAL_OF_AGES, {
					ach(2154),	-- Brann Spankin' New
					i(37655),	-- Mantle of the Tribunal
					i(37656),	-- Raging Construct Bands
					i(37654),	-- Sabaton of the Ages
					i(37653),	-- Sword of Justice
				}),
				BossOnly(SJONNIR, {
					i(43699, { timeline = { REMOVED_4_0_1 } }),	-- The Curse of Flesh Disc (QI!)
					--
					ach(2155),	-- Abuse the Ooze
					ach(5102, { timeline = { ADDED_4_0_3 } }),	-- Heroic: Halls of Stone Guild Run
					i(37668),	-- Bands of the Stoneforge
					i(37666),	-- Boots of the Whirling Mist
					i(41792, { timeline = { ADDED_3_0_3, REMOVED_4_0_3 } }),	-- Design: Deft Monarch Topaz (RECIPE!)
					i(37660),	-- Forge Ember
					i(37669),	-- Leggings of the Stone Halls
					i(37670),	-- Sjonnir's Girdle
					i(37657),	-- Spark of Life
					i(37658),	-- Sun-Emblazoned Chestplate
					i(37667),	-- The Fleshshaper
				}),
			}),
			-- #endif
			-- #if ANYCLASSIC
			applyclassicphase(WRATH_PHASE_TWO, n(DEFENSE_PROTOCOL_ALPHA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(394441, 413078, 424205),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(KRYSTALLUS, {
						i(39195),	-- Bracers of Lost Sentiments
						i(39198),	-- Frostblight Pauldrons
						i(39199),	-- Watchful Eye
					}),
					BossOnly(MAIDEN_OF_GRIEF, {
						i(39215),	-- Boots of the Follower
						i(39196),	-- Boots of the Worshiper
						i(39216),	-- Sash of Mortal Desire
					}),
					BossOnly(TRIBUNAL_OF_AGES, {
						i(39193),	-- Band of Neglected Pleas
						i(39197),	-- Gauntlets of the Master
						i(39200),	-- Grieving Spellblade
					}),
					BossOnly(SJONNIR, {
						i(43993),	-- Greatring of Collision
						i(40489),	-- Greatstaff of the Nexus
						i(44659),	-- Pendant of the Dragonsworn
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_THREE, n(DEFENSE_PROTOCOL_BETA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(413078, 424205),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(KRYSTALLUS, {
						i(45927),	-- Handwraps of Resonance
						i(45892),	-- Legacy of Thunder
					}),
					BossOnly(MAIDEN_OF_GRIEF, {
						i(45895),	-- Belt of the Blood Pit
						i(45302),	-- Treads of the Invader
					}),
					BossOnly(TRIBUNAL_OF_AGES, {
						i(46340),	-- Adamant Handguards
						i(45894),	-- Leggings of Unstable Discharge
					}),
					BossOnly(SJONNIR, {
						i(46351),	-- Bloodcrush Cudgel
						i(46346),	-- Boots of Unsettled Prey
						i(46345),	-- Bracers of Righteous Reformation
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_FOUR, n(DEFENSE_PROTOCOL_GAMMA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(424205),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(KRYSTALLUS),
					BossOnly(MAIDEN_OF_GRIEF),
					BossOnly(TRIBUNAL_OF_AGES),
					BossOnly(SJONNIR),
				},
			})),
			-- #endif
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(277, {
		q(35465),	-- Halls of Stone Reward Quest - Normal completion
		q(35468),	-- Halls of Stone Reward Quest - Heroic completion
	}),
}));
