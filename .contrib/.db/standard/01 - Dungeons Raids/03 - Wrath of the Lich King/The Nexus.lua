-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local TELESTRA = 618;
local ANOMALUS = 619;
local ORMOROK = 620;
local KERISTRASZA = 621;

------ EncounterToCRS ------
local EncounterToCRS = {
	[TELESTRA] = { 26731 },	-- Grand Magus Telestra
	[ANOMALUS] = { 26763 },	-- Anomalus
	[ORMOROK] = { 26794 },	-- Ormorok the Tree-Shaper
	[KERISTRASZA] = { 26723 },	-- Keristrasza
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty, CommonBossDrops =
InstanceHelper.BossOnly, InstanceHelper.Difficulty, InstanceHelper.CommonBossDrops

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, {
	inst(281, {	-- The Nexus
		mapID = THE_NEXUS,
		coord = { 28.1, 28.1, BOREAN_TUNDRA },
		timeline = { ADDED_3_0_2 },
		lvl = lvlsquish(68, 68, 10),
		groups = {
			n(ACHIEVEMENTS, {
				ach(478, {	-- The Nexus
					-- #if AFTER 7.3.5
					crit(5381, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5382, {	-- Anomalus
						_encounter = { ANOMALUS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5383, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5384, {	-- Keristrasza
						_encounter = { KERISTRASZA, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(5381, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5382, {	-- Anomalus
						_encounter = { ANOMALUS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5383, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #if ANYCLASSIC
					-- NOTE: This boss has a different criteriaUID in classic for some dumb reason. BLIZZARD.
					crit(5622, {	-- Keristrasza
						_encounter = { KERISTRASZA, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #else
					crit(5384, {	-- Keristrasza
						_encounter = { KERISTRASZA, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
					-- #endif
				}),
				-- #if ANYCLASSIC
				applyclassicphase(WRATH_PHASE_TWO, ach(17283, {	-- Defense Protocol Alpha: The Nexus
					crit(57690, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57688, {	-- Anomalus
						_encounter = { ANOMALUS, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57687, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57689, {	-- Keristrasza
						_encounter = { KERISTRASZA, DEFENSE_PROTOCOL_ALPHA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_THREE, ach(18591, {	-- Defense Protocol Beta: The Nexus
					crit(60578, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60576, {	-- Anomalus
						_encounter = { ANOMALUS, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60575, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60577, {	-- Keristrasza
						_encounter = { KERISTRASZA, DEFENSE_PROTOCOL_BETA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_FOUR, ach(19428, {	-- Defense Protocol Gamma: The Nexus
					crit(63325, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63323, {	-- Anomalus
						_encounter = { ANOMALUS, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63322, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63324, {	-- Keristrasza
						_encounter = { KERISTRASZA, DEFENSE_PROTOCOL_GAMMA },
					}),
				})),
				-- #endif
				ach(490, {	-- Heroic: The Nexus
					crit(5245, {	-- Grand Magus Telestra
						_encounter = { TELESTRA, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5246, {	-- Anomalus
						_encounter = { ANOMALUS, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5247, {	-- Ormorok the Tree-Shaper
						_encounter = { ORMOROK, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5609, {	-- Keristrasza
						_encounter = { KERISTRASZA, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			n(QUESTS, {
				q(13094, {	-- Have They No Shame?
					-- #if AFTER 4.3.0.15005
					qg = 55537,	-- Image of Warmage Kaitlyn
					-- #else
					provider = { "n", 26110 },	-- Librarian Serrah <Food & Drink>
					coord = { 33.4, 34.4, BOREAN_TUNDRA },
					-- #endif
					races = ALLIANCE_ONLY,
					lvl = lvlsquish(68, 68, 10),
					groups = {
						objective(1, {	-- 0/1 Berinand's Research
							provider = { "i", 43095 },	-- Berinand's Research
						}),
						i(43182),	-- Cured Mammoth Hide Mantle
						i(43181),	-- Shoulders of the Northern Lights
						i(43184),	-- Tundra Pauldrons
						i(43183),	-- Tundra Tracker's Shoulderguards
					},
				}),
				q(13095, {	-- Have They No Shame?
					-- #if AFTER 4.3.0.15005
					qg = 55537,	-- Image of Warmage Kaitlyn
					-- #else
					provider = { "n", 26110 },	-- Librarian Serrah <Food & Drink>
					coord = { 33.4, 34.4, BOREAN_TUNDRA },
					-- #endif
					races = HORDE_ONLY,
					lvl = lvlsquish(68, 68, 10),
					groups = {
						objective(1, {	-- 0/1 Berinand's Research
							provider = { "i", 43095 },	-- Berinand's Research
						}),
						i(43182),	-- Cured Mammoth Hide Mantle
						i(43181),	-- Shoulders of the Northern Lights
						i(43184),	-- Tundra Pauldrons
						i(43183),	-- Tundra Tracker's Shoulderguards
					},
				}),
				q(11905, {	-- Postponing the Inevitable
					-- #if AFTER 4.3.0.15005
					qg = 55535,	-- Image of Warmage Kaitlyn
					-- #else
					provider = { "n", 25314 },	-- Archmage Berinand <Maces & Staves>
					sourceQuest = 11900,	-- Reading the Meters
					coord = { 33.0, 34.2, BOREAN_TUNDRA },
					-- #endif
					lvl = lvlsquish(69, 69, 10),
					groups = {
						objective(1, {	-- 0/1 Interdimensional Rift Stalled
							provider = { "i", 35479 },	-- Interdimensional Refabricator
							cr = 26763,	-- Anomalus
						}),
						i(42763),	-- Bindings of Sabotage
						i(42765),	-- Gauntlets of the Disturbed Giant
						i(42761),	-- Time-Stop Gloves
						i(42758),	-- Time-Twisted Wraps
					},
				}),
				q(11973, {	-- Prisoner of War
					-- #if AFTER 4.3.0.15005
					qg = 55531,	-- Warmage Kaitlyn
					-- #else
					provider = { "n", 26117 },	-- Raelorasz
					sourceQuest = 11969,	-- Springing the Trap
					coord = { 33.2, 34.4, BOREAN_TUNDRA },
					-- #endif
					lvl = lvlsquish(69, 69, 10),
					groups = {
						objective(1, {	-- 0/1 Keristrasza Laid to Rest
							provider = { "n", 26723 },	-- Keristrasza
						}),
						i(38223),	-- Cloak of Azure Lights
						i(38222),	-- Mantle of Keristrasza
						i(38221),	-- Shroud of Fluid Strikes
					},
				}),
				q(11911, {	-- Quickening
					-- #if AFTER 4.3.0.15005
					qg = 55536,	-- Image of Warmage Kaitlyn
					-- #else
					provider = { "n", 25314 },	-- Archmage Berinand <Maces & Staves>
					sourceQuest = 11910,	-- Secrets of the Ancients
					coord = { 33.0, 34.2, BOREAN_TUNDRA },
					-- #endif
					lvl = lvlsquish(69, 69, 10),
					groups = {
						objective(1, {	-- 0/5 Arcane Splinter
							provider = { "i", 35490 },	-- Arcane Splinter
							cr = 26792,	-- Crystalline Protector
						}),
						i(42768),	-- Boots of the Unbowed Protector
						i(42767),	-- Invigorating Sabatons
						i(42760),	-- Sandals of Mystical Evolution
						i(42766),	-- Spiked Treads of Mutation
						i(42762),	-- Treads of Torn Future
					},
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				BossOnly(TELESTRA, {
					i(37135),	-- Arcane-Shielded Helm
					i(37138),	-- Bands of Channeled Energy
					i(35605),	-- Belt of Draconic Runes
					i(35604),	-- Insulating Bindings
					i(37139),	-- Spaulders of the Careless Thief
					i(37134),	-- Telestra's Journal
					i(35617),	-- Wand of Shimmering Scales
				}),
				BossOnly(ANOMALUS, {
					i(37141),	-- Amulet of Dazzling Light
					i(35600),	-- Cleated Ice Boots
					i(35599),	-- Gauntlets of Serpent Scales
					i(37144),	-- Hauberk of the Arcane Wraith
					i(37149),	-- Helm of Anomalus
					i(37150),	-- Rift Striders
					i(35598),	-- Tome of the Lore Keepers
				}),
				BossOnly(ORMOROK, {
					i(37151),	-- Band of Frosted Thorns
					i(157559, { timeline = { ADDED_7_3_5 } }),	-- Chilly Cinch
					i(35602),	-- Chiseled Stalagmite Pauldrons
					i(35601),	-- Drakonid Arm Blade
					i(37155),	-- Frozen Forest Kilt
					i(37152),	-- Girdle of Ice
					i(37153),	-- Gloves of the Crystal Gardener
					i(35603),	-- Greaves of the Blue Flight
				}),
				BossOnly(KERISTRASZA, {
					i(35596),	-- Attuned Crystalline Boots
					i(35597),	-- Band of Glittering Permafrost
					i(37162),	-- Bulwark of the Noble Protector
					i(37165),	-- Crystal-Infused Tunic
					i(37167),	-- Dragon Slayer's Sabatons
					i(37171),	-- Flame-Bathed Steel Girdle
					i(35595),	-- Glacier Sharpened Vileblade
					i(37172),	-- Gloves of Glistening Runes
					i(37170),	-- Interwoven Scale Bracers
					i(37166),	-- Sphere of Red Dragon's Blood
					i(157565, { timeline = { ADDED_7_3_5 } }),	-- Tangler-Leather Gloves
					i(37169),	-- War Mace of Unrequited Love
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				{	-- Commander [Commander Kolurg (A) / Commander Stoutbeard (H)]
					aqd = e(833, {
						creatureID = 26798,	-- Commander Kolurg (A)
					}),
					hqd = e(617, {
						creatureID = 26796,	-- Commander Stoutbeard (H)
					}),
					groups = {
						i(37730),	-- Cleric's Linen Shoes
						i(37728),	-- Cloak of the Enemy
						i(37729),	-- Grips of Sculptured Icicles
						i(37731),	-- Opposed Stasis Leggings
					},
				},
				BossOnly(TELESTRA, {
					ach(2150),	-- Split Personality
				}),
				BossOnly(ANOMALUS, {
					ach(2037),	-- Chaos Theory
				}),
				BossOnly(ORMOROK),
				BossOnly(KERISTRASZA, {
					i(43665, { timeline = { REMOVED_4_0_1 } }),	-- Keristrasza's Broken Heart (QI!)
					--
					ach(5096, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Nexus Guild Run
					ach(2036),	-- Intense Cold
					i(41794, { timeline = { ADDED_3_0_3, REMOVED_4_0_3 } }),	-- Design: Deadly Monarch Topaz (RECIPE!)
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				BossOnly(TELESTRA, {
					i(35605),	-- Belt of Draconic Runes
					i(35604),	-- Insulating Bindings
					i(35617),	-- Wand of Shimmering Scales
				}),
				BossOnly(ANOMALUS, {
					i(35600),	-- Cleated Ice Boots
					i(35599),	-- Gauntlets of Serpent Scales
					i(35598),	-- Tome of the Lore Keepers
				}),
				BossOnly(ORMOROK, {
					i(35602),	-- Chiseled Stalagmite Pauldrons
					i(35601),	-- Drakonid Arm Blade
					i(35603),	-- Greaves of the Blue Flight
				}),
				BossOnly(KERISTRASZA, {
					i(35596),	-- Attuned Crystalline Boots
					i(35597),	-- Band of Glittering Permafrost
					i(35595),	-- Glacier Sharpened Vileblade
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				{	-- Commander [Commander Kolurg (A) / Commander Stoutbeard (H)]
					aqd = e(833, {
						creatureID = 26798,	-- Commander Kolurg (A)
					}),
					hqd = e(617, {
						creatureID = 26796,	-- Commander Stoutbeard (H)
					}),
					groups = {
						i(37730),	-- Cleric's Linen Shoes
						i(37728),	-- Cloak of the Enemy
						i(37729),	-- Grips of Sculptured Icicles
						i(37731),	-- Opposed Stasis Leggings
					},
				},
				BossOnly(TELESTRA, {
					ach(2150),	-- Split Personality
					i(37135),	-- Arcane-Shielded Helm
					i(37138),	-- Bands of Channeled Energy
					i(37139),	-- Spaulders of the Careless Thief
					i(37134),	-- Telestra's Journal
				}),
				BossOnly(ANOMALUS, {
					ach(2037),	-- Chaos Theory
					i(37141),	-- Amulet of Dazzling Light
					i(37144),	-- Hauberk of the Arcane Wraith
					i(37149),	-- Helm of Anomalus
					i(37150),	-- Rift Striders
				}),
				BossOnly(ORMOROK, {
					i(37151),	-- Band of Frosted Thorns
					i(37155),	-- Frozen Forest Kilt
					i(37152),	-- Girdle of Ice
					i(37153),	-- Gloves of the Crystal Gardener
				}),
				BossOnly(KERISTRASZA, {
					i(43665, { timeline = { REMOVED_4_0_1 } }),	-- Keristrasza's Broken Heart (QI!)
					--
					ach(5096, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Nexus Guild Run
					ach(2036),	-- Intense Cold
					i(37162),	-- Bulwark of the Noble Protector
					i(37165),	-- Crystal-Infused Tunic
					i(41794, { timeline = { ADDED_3_0_3, REMOVED_4_0_3 } }),	-- Design: Deadly Monarch Topaz (RECIPE!)
					i(37167),	-- Dragon Slayer's Sabatons
					i(37171),	-- Flame-Bathed Steel Girdle
					i(37172),	-- Gloves of Glistening Runes
					i(37170),	-- Interwoven Scale Bracers
					i(37166),	-- Sphere of Red Dragon's Blood
					i(37169),	-- War Mace of Unrequited Love
				}),
			}),
			-- #endif
			-- #if ANYCLASSIC
			applyclassicphase(WRATH_PHASE_TWO, n(DEFENSE_PROTOCOL_ALPHA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(394435, 412991, 424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					{	-- Commander [Commander Kolurg (A) / Commander Stoutbeard (H)]
						aqd = e(833, {
							creatureID = 26798,	-- Commander Kolurg (A)
						}),
						hqd = e(617, {
							creatureID = 26796,	-- Commander Stoutbeard (H)
						}),
						groups = {
							i(39394),	-- Charmed Cierge
							i(39398),	-- Massive Skeletal Ribcage
							i(39390),	-- Resurgent Phantom Bindings
						},
					},
					BossOnly(TELESTRA, {
						i(39393),	-- Claymore of Ancient Power
						i(39397),	-- Pauldrons of Havoc
						i(39388),	-- Spirit-World Glass
					}),
					BossOnly(ANOMALUS, {
						i(39407),	-- Circle of Life
						i(39396),	-- Gown of Blaumeux
						i(39386),	-- Tunic of Dislocation
					}),
					BossOnly(ORMOROK, {
						i(39391),	-- Heinous Mail Chestguard
						i(39389),	-- Signet of the Malevolent
						i(39395),	-- Thane's Tainted Greathelm
					}),
					BossOnly(KERISTRASZA, {
						i(39306),	-- Plated Gloves of Relief
						i(39422),	-- Staff of the Plaguehound
						i(44657),	-- Torque of the Red Dragonflight
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_THREE, n(DEFENSE_PROTOCOL_BETA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(412991, 424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					{	-- Commander [Commander Kolurg (A) / Commander Stoutbeard (H)]
						aqd = e(833, {
							creatureID = 26798,	-- Commander Kolurg (A)
						}),
						hqd = e(617, {
							creatureID = 26796,	-- Commander Stoutbeard (H)
						}),
						groups = {
							i(45832),	-- Mantle of the Preserver
							i(45713),	-- Nurturing Touch
						},
					},
					BossOnly(TELESTRA, {
						i(45865),	-- Raiments of the Corrupted
						i(45707),	-- Shieldwall of the Breaker
					}),
					BossOnly(ANOMALUS, {
						i(45291),	-- Combustion Bracers
						i(45292),	-- Energy Siphon
					}),
					BossOnly(ORMOROK, {
						i(45287),	-- Firesoul
						i(45288),	-- Firestrider Chestguard
					}),
					BossOnly(KERISTRASZA, {
						i(45283),	-- Flamewatch Armguards
						i(45282),	-- Ironsoul
						i(45286),	-- Pyrite Infuser
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_FOUR, n(DEFENSE_PROTOCOL_GAMMA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					{	-- Commander [Commander Kolurg (A) / Commander Stoutbeard (H)]
						aqd = e(833, {
							creatureID = 26798,	-- Commander Kolurg (A)
						}),
						hqd = e(617, {
							creatureID = 26796,	-- Commander Stoutbeard (H)
						}),
					},
					BossOnly(TELESTRA),
					BossOnly(ANOMALUS),
					BossOnly(ORMOROK),
					BossOnly(KERISTRASZA),
				},
			})),
			-- #endif
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(281, {
		q(35513),	-- The Nexus - Reward Quest - Normal completion
		q(35514),	-- The Nexus - Reward Quest - Heroic completion
		q(35515),	-- The Nexus - Bonus Objective Reward Quest - kill Commander Stoutbeard (A) / Commander Kolurg (H) (Heroic only)
	}),
}));
