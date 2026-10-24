-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local DRAKOS = 622;
local VAROS = 623;
local UROM = 624;
local EREGOS = 625;

------ EncounterToCRS ------
local EncounterToCRS = {
	[DRAKOS] = { 27654 },	-- Drakos the Interrogator
	[VAROS] = { 27447 },	-- Varos Cloudstrider
	[UROM] = { 27655 },	-- Mage-Lord Urom
	[EREGOS] = { 27656 },	-- Ley-Guardian Eregos
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty, CommonBossDrops =
InstanceHelper.BossOnly, InstanceHelper.Difficulty, InstanceHelper.CommonBossDrops

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, {
	inst(282, {	-- The Oculus
		mapID = THE_OCULUS,
		coord = { 28.1, 28.1, BOREAN_TUNDRA },
		timeline = { ADDED_3_0_2 },
		maps = { THE_OCULUS_FLOOR2, THE_OCULUS_FLOOR3, THE_OCULUS_FLOOR4, THE_OCULUS_FLOOR5 },
		lvl = lvlsquish(77, 77, 20),
		groups = {
			n(ACHIEVEMENTS, {
				ach(487, {	-- The Oculus
					-- #if AFTER 7.3.5
					crit(5459, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5460, {	-- Mage-Lord Urom
						_encounter = { UROM, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5461, {	-- Varos Cloudstrider
						_encounter = { VAROS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5462, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(5459, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5460, {	-- Mage-Lord Urom
						_encounter = { UROM, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5461, {	-- Varos Cloudstrider
						_encounter = { VAROS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #if ANYCLASSIC
					-- NOTE: This boss has a different criteriaUID in classic for some dumb reason. BLIZZARD.
					crit(5630, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #else
					crit(5462, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
					-- #endif
				}),
				-- #if ANYCLASSIC
				applyclassicphase(WRATH_PHASE_TWO, ach(17300, {	-- Defense Protocol Alpha: The Oculus
					crit(57763, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57765, {	-- Varos Cloudstrider
						_encounter = { VAROS, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57762, {	-- Mage-Lord Urom
						_encounter = { UROM, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57764, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DEFENSE_PROTOCOL_ALPHA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_THREE, ach(18599, {	-- Defense Protocol Beta: The Oculus
					crit(60606, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60608, {	-- Varos Cloudstrider
						_encounter = { VAROS, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60605, {	-- Mage-Lord Urom
						_encounter = { UROM, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60607, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DEFENSE_PROTOCOL_BETA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_FOUR, ach(19436, {	-- Defense Protocol Gamma: The Oculus
					crit(63358, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63361, {	-- Varos Cloudstrider
						_encounter = { VAROS, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63356, {	-- Mage-Lord Urom
						_encounter = { UROM, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63360, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DEFENSE_PROTOCOL_GAMMA },
					}),
				})),
				-- #endif
				ach(498, {	-- Heroic: The Oculus
					crit(6859, {	-- Drakos the Interrogator
						_encounter = { DRAKOS, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6860, {	-- Mage-Lord Urom
						_encounter = { UROM, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6861, {	-- Varos Cloudstrider
						_encounter = { VAROS, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5617, {	-- Ley-Guardian Eregos
						_encounter = { EREGOS, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			filter(MISC, {
				i(37859),	-- Amber Essence
				i(37815),	-- Emerald Essence
				i(37860),	-- Ruby Essence
			}),
			n(QUESTS, {
				q(13126, {	-- A Unified Front
					sourceQuest = 13124,	-- The Struggle Persists
					qg = 27658,	-- Belgaristrasz
					lvl = lvlsquish(77, 77, 20),
					groups = {
						objective(1, {	-- 0/10 Centrifuge Construct destroyed
							provider = { "n", 27641 },	-- Centrifuge Construct
						}),
						objective(2, {	-- 0/1 Varos Cloudstrider slain
							provider = { "n", 27447 },	-- Varos Cloudstrider <Azure-Lord of the Blue Dragonflight>
						}),
					},
				}),
				q(13128, {	-- A Wing and a Prayer
					sourceQuest = 13127,	-- Mage-Lord Urom
					qg = 28012,	-- Image of Belgaristrasz
					lvl = lvlsquish(77, 77, 20),
					groups = {
						objective(1, {	-- 0/1 Ley-Guardian Eregos slain
							provider = { "n", 27656 },	-- Ley-Guardian Eregos
						}),
						i(44340),	-- Bindings of Raelorasz
						i(44341),	-- Bracers of Reverence
						i(44338),	-- Cuffs of Gratitude
						i(44339),	-- Soaring Wristwraps
					},
				}),
				q(13127, {	-- Mage-Lord Urom
					sourceQuest = 13126,	-- A Unified Front
					qg = 28012,	-- Image of Belgaristrasz
					lvl = lvlsquish(77, 77, 20),
					groups = {
						objective(1, {	-- 0/1 Mage-Lord Urom slain
							provider = { "n", 27655 },	-- Mage-Lord Urom
						}),
					},
				}),
				q(13124, {	-- The Struggle Persists
					qg = 26117,	-- Raelorasz
					coord = { 33.2, 34.4, BOREAN_TUNDRA },
					lvl = lvlsquish(77, 77, 20),
					groups = {
						i(44335),	-- Band of Motivation
						i(44336),	-- Flourishing Band
						i(44334),	-- Ring of Temerity
						i(44337),	-- Staunch Signet
					},
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					i(37365),	-- Bands of the Sky Ring
					i(36977),	-- Bindings of the Construct
					i(37366),	-- Drake-Champion's Bracers
					i(37364),	-- Frostbridge Orb
					i(36978),	-- Ley-Whelphide Belt
					i(36976),	-- Ring-Lord's Leggings
				}),
				BossOnly(DRAKOS, {
					i(37257),	-- Band of Torture
					i(37258),	-- Drakewing's Raiments
					i(36944),	-- Lifeblade of Belgaristrasz
					i(157562, { timeline = { ADDED_7_3_5 } }),	-- Rod of Aggressive Questioning
					i(36946),	-- Runic Cage Chestpiece
					i(37256),	-- Scaled Armor of Drakos
					i(37255),	-- The Interrogator
					i(36943),	-- Timeless Beads of Eternos
					i(36945),	-- Verdisa's Cuffs of Dreaming
				}),
				BossOnly(VAROS, {
					i(37262),	-- Azure Ringmail Leggings
					i(36947),	-- Centrifuge Core Cloak
					i(37260),	-- Cloudstrider's Waraxe
					i(37261),	-- Gloves of Radiant Light
					i(36949),	-- Gloves of the Azure-Lord
					i(36948),	-- Horned Helm of Varos
					i(37263),	-- Legplates of the Oculus Guardian
					i(36950),	-- Wing Commander's Breastplate
				}),
				BossOnly(UROM, {
					i(37195),	-- Band of Enchanted Growth
					i(37288),	-- Catalytic Bands
					i(36952),	-- Girdle of Obscuring
					i(37264),	-- Pendulum of Telluric Currents
					i(37289),	-- Sash of Phantasmal Images
					i(36951),	-- Sidestepping Handguards
					i(36953),	-- Spaulders of Skillful Maneuvers
					i(36954),	-- The Conjurer's Slippers
				}),
				BossOnly(EREGOS, {
					i(37291),	-- Ancient Dragon Spirit Cape
					i(37294),	-- Crown of Unbridled Magic
					i(37361),	-- Cuffs of Winged Levitation
					i(41798),	-- Design: Bracing Earthsiege Diamond (RECIPE!)
					i(36961),	-- Dragonflight Great-Ring
					i(36974),	-- Eregos' Ornamented Chestguard
					i(37363),	-- Gauntlets of Dragon Wrath
					i(36971),	-- Headguard of Westrift
					i(36969),	-- Helm of the Ley-Guardian
					i(37362),	-- Leggings of Protective Auras
					i(37292),	-- Ley-Guardian's Legguards
					i(36975),	-- Malygos' Favor
					i(37293),	-- Mask of the Watcher
					i(37360),	-- Staff of Draconic Combat
					i(36972),	-- Tome of Arcane Phenomena
					i(36973),	-- Vestments of the Scholar
					i(36962),	-- Wyrmclaw Battleaxe
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(DRAKOS),
				BossOnly(VAROS),
				BossOnly(UROM),
				BossOnly(EREGOS, {
					i(43668, { timeline = { REMOVED_4_0_1 } }),	-- Ley Line Tuner (QI!)
					--
					ach(2046, {	-- Amber Void
						providers = {
							{ "n", 27755 },	-- Amber Drake
							{ "i", 37859 },	-- Amber Essence
							{ "n", 27659 },	-- Eternos
						},
					}),
					ach(2045, {	-- Emerald Void
						providers = {
							{ "n", 27692 },	-- Emerald Drake
							{ "i", 37815 },	-- Emerald Essence
							{ "n", 27657 },	-- Verdisa
						},
					}),
					ach(1871, {	-- Experienced Drake Rider
						crit(7177, {	-- Amber Drake
							providers = {
								{ "n", 27755 },	-- Amber Drake
								{ "i", 37859 },	-- Amber Essence
								{ "n", 27659 },	-- Eternos
							},
						}),
						crit(7178, {	-- Emerald Drake
							providers = {
								{ "n", 27692 },	-- Emerald Drake
								{ "i", 37815 },	-- Emerald Essence
								{ "n", 27657 },	-- Verdisa
							},
						}),
						crit(7179, {	-- Ruby Drake
							providers = {
								{ "n", 27756 },	-- Ruby Drake
								{ "i", 37860 },	-- Ruby Essence
								{ "n", 27658 },	-- Belgaristrasz
							},
						}),
					}),
					ach(5104, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Oculus Guild Run
					ach(1868),	-- Make It Count
					ach(2044, {	-- Ruby Void
						providers = {
							{ "n", 27756 },	-- Ruby Drake
							{ "i", 37860 },	-- Ruby Essence
							{ "n", 27658 },	-- Belgaristrasz
						},
					}),
					applyclassicphase(WRATH_PHASE_FOUR, i(52676, {	-- Cache of the Ley-Guardian
						description = "This bag is only available if you queue for the instance using the Random Dungeon Finder. It will not drop in an explicitly formed group or by using the Select Instance interface.",
						groups = { i(43953) },	-- Blue Drake (MOUNT!)
					})),
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				BossOnly(EREGOS, {
					i(41798),	-- Design: Bracing Earthsiege Diamond (RECIPE!)
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				n(ZONE_DROPS, {
					i(36977),	-- Bindings of the Construct
					i(36978),	-- Ley-Whelphide Belt
					i(36976),	-- Ring-Lord's Leggings
				}),
				BossOnly(DRAKOS, {
					i(36944),	-- Lifeblade of Belgaristrasz
					i(36946),	-- Runic Cage Chestpiece
					i(36943),	-- Timeless Beads of Eternos
					i(36945),	-- Verdisa's Cuffs of Dreaming
				}),
				BossOnly(VAROS, {
					i(36947),	-- Centrifuge Core Cloak
					i(36949),	-- Gloves of the Azure-Lord
					i(36948),	-- Horned Helm of Varos
					i(36950),	-- Wing Commander's Breastplate
				}),
				BossOnly(UROM, {
					i(36952),	-- Girdle of Obscuring
					i(36951),	-- Sidestepping Handguards
					i(36953),	-- Spaulders of Skillful Maneuvers
					i(36954),	-- The Conjurer's Slippers
				}),
				BossOnly(EREGOS, {
					i(36961),	-- Dragonflight Great-Ring
					i(36974),	-- Eregos' Ornamented Chestguard
					i(36971),	-- Headguard of Westrift
					i(36969),	-- Helm of the Ley-Guardian
					i(36975),	-- Malygos' Favor
					i(36972),	-- Tome of Arcane Phenomena
					i(36973),	-- Vestments of the Scholar
					i(36962),	-- Wyrmclaw Battleaxe
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ZONE_DROPS, {
					i(37365),	-- Bands of the Sky Ring
					i(37366),	-- Drake-Champion's Bracers
					i(37364),	-- Frostbridge Orb
				}),
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(DRAKOS, {
					i(37257),	-- Band of Torture
					i(37258),	-- Drakewing's Raiments
					i(37256),	-- Scaled Armor of Drakos
					i(37255),	-- The Interrogator
				}),
				BossOnly(VAROS, {
					i(37262),	-- Azure Ringmail Leggings
					i(37260),	-- Cloudstrider's Waraxe
					i(37261),	-- Gloves of Radiant Light
					i(37263),	-- Legplates of the Oculus Guardian
				}),
				BossOnly(UROM, {
					i(37195),	-- Band of Enchanted Growth
					i(37288),	-- Catalytic Bands
					i(37264),	-- Pendulum of Telluric Currents
					i(37289),	-- Sash of Phantasmal Images
				}),
				BossOnly(EREGOS, {
					i(43668, { timeline = { REMOVED_4_0_1 } }),	-- Ley Line Tuner (QI!)
					--
					ach(2046, {	-- Amber Void
						providers = {
							{ "n", 27755 },	-- Amber Drake
							{ "i", 37859 },	-- Amber Essence
							{ "n", 27659 },	-- Eternos
						},
					}),
					ach(2045, {	-- Emerald Void
						providers = {
							{ "n", 27692 },	-- Emerald Drake
							{ "i", 37815 },	-- Emerald Essence
							{ "n", 27657 },	-- Verdisa
						},
					}),
					ach(1871, {	-- Experienced Drake Rider
						crit(7177, {	-- Amber Drake
							providers = {
								{ "n", 27755 },	-- Amber Drake
								{ "i", 37859 },	-- Amber Essence
								{ "n", 27659 },	-- Eternos
							},
						}),
						crit(7178, {	-- Emerald Drake
							providers = {
								{ "n", 27692 },	-- Emerald Drake
								{ "i", 37815 },	-- Emerald Essence
								{ "n", 27657 },	-- Verdisa
							},
						}),
						crit(7179, {	-- Ruby Drake
							providers = {
								{ "n", 27756 },	-- Ruby Drake
								{ "i", 37860 },	-- Ruby Essence
								{ "n", 27658 },	-- Belgaristrasz
							},
						}),
					}),
					ach(5104, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Oculus Guild Run
					ach(1868),	-- Make It Count
					ach(2044, {	-- Ruby Void
						providers = {
							{ "n", 27756 },	-- Ruby Drake
							{ "i", 37860 },	-- Ruby Essence
							{ "n", 27658 },	-- Belgaristrasz
						},
					}),
					i(37291),	-- Ancient Dragon Spirit Cape
					applyclassicphase(WRATH_PHASE_FOUR, i(52676, {	-- Cache of the Ley-Guardian
						description = "This bag is only available if you queue for the instance using the Random Dungeon Finder. It will not drop in an explicitly formed group or by using the Select Instance interface.",
						groups = {
							i(43953),	-- Blue Drake (MOUNT!)
							-- #if BEFORE CATA
							i(36921),	-- Autumn's Glow
							i(36933),	-- Forest Emerald
							i(36930),	-- Monarch Topaz
							i(36918),	-- Scarlet Ruby
							i(36924),	-- Sky Sapphire
							i(36927),	-- Twilight Opal
							-- #endif
						},
					})),
					i(37294),	-- Crown of Unbridled Magic
					i(37361),	-- Cuffs of Winged Levitation
					i(37363),	-- Gauntlets of Dragon Wrath
					i(37362),	-- Leggings of Protective Auras
					i(37292),	-- Ley-Guardian's Legguards
					i(37293),	-- Mask of the Watcher
					i(37360),	-- Staff of Draconic Combat
				}),
			}),
			-- #endif
			-- #if ANYCLASSIC
			applyclassicphase(WRATH_PHASE_TWO, n(DEFENSE_PROTOCOL_ALPHA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(394435, 412991, 424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(DRAKOS, {
						i(39404),	-- Cloak of Mastery
						i(39399),	-- Helm of the Vast Legions
						i(39408),	-- Leggings of Sapphiron
					}),
					BossOnly(VAROS, {
						i(39401),	-- Circle of Death
						i(39409),	-- Cowl of Winged Fear
						i(39405),	-- Helmet of the Inner Sanctum
					}),
					BossOnly(UROM, {
						i(39403),	-- Helm of the Unsubmissive
						i(39311),	-- Scepter of Murmuring Spirits
						i(39415),	-- Shroud of the Citadel
					}),
					BossOnly(EREGOS, {
						i(40497),	-- Black Ice
						i(44658),	-- Chain of the Ancient Wyrm
						i(44660),	-- Drakescale Collar
						i(39310),	-- Mantle of the Extensive Mind
						i(44659),	-- Pendant of the Dragonsworn
						i(44657),	-- Torque of the Red Dragonflight
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_THREE, n(DEFENSE_PROTOCOL_BETA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(412991, 424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(DRAKOS, {
						i(45997),	-- Gauntlets of the Wretched
						i(45996),	-- Hoperender
					}),
					BossOnly(VAROS, {
						i(46015),	-- Pendant of Endless Despair
						i(46014),	-- Saronite Animus Cloak
					}),
					BossOnly(UROM, {
						i(46011),	-- Shadowbite
						i(46013),	-- Underworld Mantle
					}),
					BossOnly(EREGOS, {
						i(45872),	-- Avalanche
						i(46012),	-- Vestments of the Piercing Light
						i(45873),	-- Winter's Frigid Embrace
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_FOUR, n(DEFENSE_PROTOCOL_GAMMA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(424196),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(DRAKOS),
					BossOnly(VAROS),
					BossOnly(UROM),
					BossOnly(EREGOS),
				},
			})),
			-- #endif
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(282, {
		q(35446),	-- The Oculus Reward Quest - Normal completion
		q(35447),	-- The Oculus Reward Quest - Heroic completion
	}),
}));
