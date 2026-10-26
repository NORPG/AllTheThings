-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local SVALA = 641;
local GORTOK = 642;
local SKADI = 643;
local YMIRON = 644;

------ EncounterToCRS ------
local EncounterToCRS = {
	[SVALA] = {
		26668,	-- Svala Sorrowgrave
		29281,	-- Svala Sorrowgrave useless form
	},
	[GORTOK] = { 26687 },	-- Gortok Palehoof
	[SKADI] = { 26693 },	-- Skadi the Ruthless
	[YMIRON] = { 26861 },	-- King Ymiron
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty, CommonBossDrops =
InstanceHelper.BossOnly, InstanceHelper.Difficulty, InstanceHelper.CommonBossDrops

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, {
	inst(286, {	-- Utgarde Pinnacle
		mapID = UTGARDE_PINNACLE,
		coord = { 57.0, 47.0, HOWLING_FJORD },
		timeline = { ADDED_3_0_2 },
		maps = { UTGARDE_PINNACLE_FLOOR2 },
		lvl = lvlsquish(75, 75, 20),
		groups = {
			n(ACHIEVEMENTS, {
				ach(488, {	-- Utgarde Pinnacle
					-- #if AFTER 7.3.5
					crit(5463, {	-- Skadi the Ruthless
						_encounter = { SKADI, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5465, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5466, {	-- Gortok Palehoof
						_encounter = { GORTOK, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(5464, {	-- King Ymiron
						_encounter = { YMIRON, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(5463, {	-- Skadi the Ruthless
						_encounter = { SKADI, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5465, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(5466, {	-- Gortok Palehoof
						_encounter = { GORTOK, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #if ANYCLASSIC
					-- NOTE: This boss has a different criteriaUID in classic for some dumb reason. BLIZZARD.
					crit(5631, {	-- King Ymiron
						_encounter = { YMIRON, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #else
					crit(5464, {	-- King Ymiron
						_encounter = { YMIRON, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
					-- #endif
				}),
				-- #if ANYCLASSIC
				applyclassicphase(WRATH_PHASE_TWO, ach(17301, {	-- Defense Protocol Alpha: Utgarde Pinnacle
					crit(57767, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57769, {	-- Gortok Palehoof
						_encounter = { GORTOK, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57768, {	-- Skadi the Ruthless
						_encounter = { SKADI, DEFENSE_PROTOCOL_ALPHA },
					}),
					crit(57766, {	-- King Ymiron
						_encounter = { YMIRON, DEFENSE_PROTOCOL_ALPHA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_THREE, ach(18600, {	-- Defense Protocol Beta: Utgarde Pinnacle
					crit(60610, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60612, {	-- Gortok Palehoof
						_encounter = { GORTOK, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60611, {	-- Skadi the Ruthless
						_encounter = { SKADI, DEFENSE_PROTOCOL_BETA },
					}),
					crit(60609, {	-- King Ymiron
						_encounter = { YMIRON, DEFENSE_PROTOCOL_BETA },
					}),
				})),
				applyclassicphase(WRATH_PHASE_FOUR, ach(19437, {	-- Defense Protocol Gamma: Utgarde Pinnacle
					crit(63367, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63371, {	-- Gortok Palehoof
						_encounter = { GORTOK, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63369, {	-- Skadi the Ruthless
						_encounter = { SKADI, DEFENSE_PROTOCOL_GAMMA },
					}),
					crit(63366, {	-- King Ymiron
						_encounter = { YMIRON, DEFENSE_PROTOCOL_GAMMA },
					}),
				})),
				-- #endif
				ach(499, {	-- Heroic: Utgarde Pinnacle
					crit(6864, {	-- Svala Sorrowgrave
						_encounter = { SVALA, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6865, {	-- Gortok Palehoof
						_encounter = { GORTOK, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(6863, {	-- Skadi the Ruthless
						_encounter = { SKADI, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(5618, {	-- King Ymiron
						_encounter = { YMIRON, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			n(QUESTS, {
				q(13131, {	-- Junk in My Trunk
					qg = 30871,	-- Brigg Smallshanks
					lvl = lvlsquish(78, 78, 20),
					groups = {
						objective(1, {	-- 0/5 Untarnished Silver Bar
							providers = {
								{ "i",  43238 },	-- Untarnished Silver Bar
								{ "o", 192941 },	-- Untarnished Silver Bar
							},
						}),
						objective(2, {	-- 0/3 Shiny Bauble
							providers = {
								{ "i",  43239 },	-- Shiny Bauble
								{ "o", 192942 },	-- Shiny Bauble
								{ "o", 192943 },	-- Shiny Bauble
							},
						}),
						objective(3, {	-- 0/2 Golden Goblet
							providers = {
								{ "i",  43240 },	-- Golden Goblet
								{ "o", 192944 },	-- Golden Goblet
							},
						}),
						objective(4, {	-- 0/1 Jade Statue
							providers = {
								{ "i",  43241 },	-- Jade Statue
								{ "o", 192945 },	-- Jade Statue
							},
						}),
						i(44404),	-- Bauble-Woven Gown
						i(44405),	-- Exotic Leather Tunic
						i(44406),	-- Gilded Ringmail Hauberk
						i(44407),	-- Silver-Plated Battlechest
					},
				}),
				q(13132, {	-- Vengeance Be Mine!
					qg = 30871,	-- Brigg Smallshanks
					lvl = lvlsquish(78, 78, 20),
					groups = {
						objective(1, {	-- 0/1 King Ymiron slain
							provider = { "n", 26861 },	-- King Ymiron
						}),
						i(44408),	-- Cowl of the Vindictive Captain
						i(44412),	-- Faceguard of Punishment
						i(44409),	-- Headguard of Retaliation
						i(44410),	-- Helmet of Just Retribution
						i(44411),	-- Platehelm of Irate Revenge
					},
				}),
				q(29864, {	-- Working at the Source, No actual awards.
					qg = 56072,	-- Image of Argent Confessor Paletress
					timeline = { ADDED_4_3_0 },
					lvl = lvlsquish(78, 78, 20),
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					i(37590),	-- Bands of Fading Light
					i(37068),	-- Berserker's Sabatons
					i(37069),	-- Dragonflayer Seer's Bindings
					i(37372, {	-- Harpoon
						description = "Gather 3 of these harpoons and then bring him down in one go by clicking each of the launchers.",
						cr = 26692,	-- Ymirjar Harpooner
					}),
					i(37070),	-- Tundra Wolf Boots
					i(37587),	-- Ymirjar Physician's Robe
				}),
				BossOnly(SVALA, {
					i(37038),	-- Brazier Igniter
					i(37370),	-- Cuffs of the Trussed Hall
					i(37367),	-- Echoing Stompers
					i(37037),	-- Ritualistic Athame
					i(37368),	-- Silent Spectator Shoulderpads
					i(37369),	-- Sorrowgrave's Breeches
					i(37040),	-- Svala's Bloodied Shackles
					i(37043),	-- Tear-Linked Gauntlets
				}),
				BossOnly(GORTOK, {
					i(37376),	-- Ferocious Pauldrons of the Rhino
					i(37373),	-- Massive Spaulders of the Jormungar
					i(37374),	-- Ravenous Leggings of the Furbolg
					i(37052),	-- Reanimated Armor
					i(37371),	-- Ring of the Frenzied Wolvar
					i(37051),	-- Seal of Valgarde
					i(37048),	-- Shroud of Resurrection
					i(37050),	-- Trophy Gatherer
				}),
				BossOnly(SKADI, {
					i(37053),	-- Amulet of Deflected Blows
					i(37389),	-- Crenelation Leggings
					i(37057),	-- Dark Rider's Tunic
					i(37056),	-- Harpooner's Striders
					i(37377),	-- Netherbreath Spellblade
					i(37055),	-- Silken Amice of the Ymirjar
					i(37379),	-- Skadi's Iron Belt
					i(157560, { timeline = { ADDED_7_3_5 } }),	-- Skadi's Scaled Boots
					i(37384),	-- Staff of Wayward Principles
				}),
				BossOnly(YMIRON, {
					i(37066),	-- Ancient Royal Legguards
					i(37067),	-- Ceremonial Pyre Mantle
					i(37062),	-- Crown of the Forgotten Kings
					i(41797),	-- Design: Austere Earthsiege Diamond (RECIPE!)
					i(37409),	-- Gilt-Edged Leather Gauntlets
					i(37408),	-- Girdle of Bane
					i(37397),	-- Gold Amulet of Kings
					i(37060),	-- Jeweled Coronation Sword
					i(37398),	-- Mantle of Discarded Ways
					i(37390),	-- Meteorite Whetstone
					i(37395),	-- Ornamented Plate Regalia
					i(37401),	-- Red Sword of Courage
					i(37058),	-- Signet of Ranulf
					i(37407),	-- Sovereign's Belt
					i(37061),	-- Tor's Crest
					i(37064),	-- Vestige of Haldor
					i(37065),	-- Ymiron's Blade
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ZONE_DROPS, {
					i(37410, { timeline = { REMOVED_5_0_4 } }),	-- Tracker's Balanced Knives
				}),
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(SVALA, {
					ach(2043),	-- The Incredible Hulk
				}),
				BossOnly(GORTOK),
				BossOnly(SKADI, {
					ach(1873),	-- Lodi Dodi We Loves the Skadi
					ach(2156),	-- My Girl Loves to Skadi All the Time
					i(44151),	-- Blue Proto-Drake (MOUNT!)
				}),
				BossOnly(YMIRON, {
					i(43669, { timeline = { REMOVED_4_0_1 } }),	-- Locket of the Deceased Queen (QI!)
					--
					ach(5105, { timeline = { ADDED_4_0_3 } }),	-- Heroic: Utgarde Pinnacle Guild Run
					ach(2157),	-- King's Bane
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					i(37372, {	-- Harpoon
						description = "Gather 3 of these harpoons and then bring him down in one go by clicking each of the launchers.",
						cr = 26692,	-- Ymirjar Harpooner
					}),
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				n(ZONE_DROPS, {
					i(37068),	-- Berserker's Sabatons
					i(37069),	-- Dragonflayer Seer's Bindings
					i(37070),	-- Tundra Wolf Boots
				}),
				BossOnly(SVALA, {
					i(37038),	-- Brazier Igniter
					i(37037),	-- Ritualistic Athame
					i(37040),	-- Svala's Bloodied Shackles
					i(37043),	-- Tear-Linked Gauntlets
				}),
				BossOnly(GORTOK, {
					i(37052),	-- Reanimated Armor
					i(37051),	-- Seal of Valgarde
					i(37048),	-- Shroud of Resurrection
					i(37050),	-- Trophy Gatherer
				}),
				BossOnly(SKADI, {
					i(37053),	-- Amulet of Deflected Blows
					i(37057),	-- Dark Rider's Tunic
					i(37056),	-- Harpooner's Striders
					i(37055),	-- Silken Amice of the Ymirjar
				}),
				BossOnly(YMIRON, {
					i(37066),	-- Ancient Royal Legguards
					i(37067),	-- Ceremonial Pyre Mantle
					i(37062),	-- Crown of the Forgotten Kings
					i(37060),	-- Jeweled Coronation Sword
					i(37058),	-- Signet of Ranulf
					i(37061),	-- Tor's Crest
					i(37064),	-- Vestige of Haldor
					i(37065),	-- Ymiron's Blade
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ZONE_DROPS, {
					i(37590),	-- Bands of Fading Light
					i(37410, { timeline = { REMOVED_5_0_4 } }),	-- Tracker's Balanced Knives
					i(37587),	-- Ymirjar Physician's Robe
				}),
				CommonBossDrops({
					currency(101, { timeline = { REMOVED_4_0_1 } }),	-- Emblem of Heroism
				}),
				BossOnly(SVALA, {
					ach(2043),	-- The Incredible Hulk
					i(37370),	-- Cuffs of the Trussed Hall
					i(37367),	-- Echoing Stompers
					i(37368),	-- Silent Spectator Shoulderpads
					i(37369),	-- Sorrowgrave's Breeches
				}),
				BossOnly(GORTOK, {
					i(37376),	-- Ferocious Pauldrons of the Rhino
					i(37373),	-- Massive Spaulders of the Jormungar
					i(37374),	-- Ravenous Leggings of the Furbolg
					i(37371),	-- Ring of the Frenzied Wolvar
				}),
				BossOnly(SKADI, {
					ach(1873),	-- Lodi Dodi We Loves the Skadi
					ach(2156),	-- My Girl Loves to Skadi All the Time
					i(44151),	-- Blue Proto-Drake (MOUNT!)
					i(37389),	-- Crenelation Leggings
					i(37377),	-- Netherbreath Spellblade
					i(37379),	-- Skadi's Iron Belt
					i(37384),	-- Staff of Wayward Principles
				}),
				BossOnly(YMIRON, {
					i(43669, { timeline = { REMOVED_4_0_1 } }),	-- Locket of the Deceased Queen (QI!)
					--
					ach(5105, { timeline = { ADDED_4_0_3 } }),	-- Heroic: Utgarde Pinnacle Guild Run
					ach(2157),	-- King's Bane
					i(41797),	-- Design: Austere Earthsiege Diamond (RECIPE!)
					i(37409),	-- Gilt-Edged Leather Gauntlets
					i(37408),	-- Girdle of Bane
					i(37397),	-- Gold Amulet of Kings
					i(37398),	-- Mantle of Discarded Ways
					i(37390),	-- Meteorite Whetstone
					i(37395),	-- Ornamented Plate Regalia
					i(37401),	-- Red Sword of Courage
					i(37407),	-- Sovereign's Belt
				}),
			}),
			-- #endif
			-- #if ANYCLASSIC
			applyclassicphase(WRATH_PHASE_TWO, n(DEFENSE_PROTOCOL_ALPHA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(392430, 412770, 424194),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(SVALA, {
						i(39296),	-- Accursed Bow of the Elite
						i(39308),	-- Girdle of Lenience
						i(39299),	-- Rapid Attack Gloves
					}),
					BossOnly(GORTOK, {
						i(39295),	-- Cowl of Sheet Lightning
						i(39284),	-- Miasma Mantle
						i(39298),	-- Waistguard of the Tutor
					}),
					BossOnly(SKADI, {
						i(39294),	-- Arc-Scorched Helmet
						i(39472),	-- Chain of Latent Energies
						i(39297),	-- Cloak of Darkening
					}),
					BossOnly(YMIRON, {
						i(39421),	-- Gem of Imprisoned Vassals
						i(39423),	-- Hammer of the Astral Plane
						i(39194),	-- Rusted-Link Spiked Gauntlets
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_THREE, n(DEFENSE_PROTOCOL_BETA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(412770, 424194),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(SVALA, {
						i(45331),	-- Rune-Etched Nightblade
						i(45423),	-- Runetouch Wristwraps
					}),
					BossOnly(GORTOK, {
						i(45708),	-- Archaedas' Lost Legplates
						i(45332),	-- Stormtip
					}),
					BossOnly(SKADI, {
						i(45712),	-- Chestplate of Titanic Fury
						i(45864),	-- Cover of the Keepers
					}),
					BossOnly(YMIRON, {
						i(45866),	-- Elemental Focus Stone
						i(45711),	-- Ironaya's Discarded Mantle
						i(45709),	-- Nimble Climber's Belt
					}),
				},
			})),
			applyclassicphase(WRATH_PHASE_FOUR, n(DEFENSE_PROTOCOL_GAMMA, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(424194),
				lvl = lvlsquish(80, 80, 30),
				groups = {
					BossOnly(SVALA),
					BossOnly(GORTOK),
					BossOnly(SKADI),
					BossOnly(YMIRON),
				},
			})),
			-- #endif
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(286, {
		q(35452),	-- Utgarde Pinnacle - Bonus Objective Reward
		q(35454),	-- Utgarde Pinnacle - Bonus Objective Reward
		q(35449),	-- Utgarde Pinnacle Reward Quest - Normal completion
		q(35453),	-- Utgarde Pinnacle Reward Quest - Heroic completion
	}),
}));
