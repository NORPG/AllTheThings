-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local GARFROST = 608;
local ICK_AND_KRICK = 609;
local TYRANNUS = 610;

------ EncounterToCRS ------
local EncounterToCRS = {
	[GARFROST] = { 36494 },	-- Forgemaster Garfrost
	[ICK_AND_KRICK] = {
		36476,	-- Ick <Krick's Minion>
		36477,	-- Krick
	},
	[TYRANNUS] = { 36658 },	-- Scourgelord Tyrannus
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty =
InstanceHelper.BossOnly, InstanceHelper.Difficulty

-- TODO with InstanceHelper
-- InstanceHelper.BossObjects = {
-- 	[MPLUS] = { 574411 },	-- Challenger's Cache
-- }

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_FOUR, {
	inst(278, {	-- Pit of Saron
		mapID = PIT_OF_SARON,
		coord = { 52.3, 89.3, ICECROWN },
		timeline = { ADDED_3_3_0 },
		lvl = lvlsquish(78, 78, 25),
		groups = {
			n(ACHIEVEMENTS, {
				ach(4517, {	-- The Pit of Saron
					-- #if AFTER 7.3.5
					crit(13317, {	-- Forgemaster Garfrost
						_encounter = { GARFROST, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(13318, {	-- Ick and Krick
						_encounter = { ICK_AND_KRICK, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(13319, {	-- Scourgelord Tyrannus and Rimefang
						_encounter = { TYRANNUS, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(13317, {	-- Forgemaster Garfrost
						_encounter = { GARFROST, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(13318, {	-- Ick and Krick
						_encounter = { ICK_AND_KRICK, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(13319, {	-- Scourgelord Tyrannus and Rimefang
						_encounter = { TYRANNUS, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
				}),
				ach(4520, {	-- Heroic: The Pit of Saron
					crit(13182, {	-- Forgemaster Garfrost
						_encounter = { GARFROST, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(13173, {	-- Ick and Krick
						_encounter = { ICK_AND_KRICK, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(13175, {	-- Scourgelord Tyrannus and Rimefang
						_encounter = { TYRANNUS, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			n(QUESTS, {
				q(24710, {	-- Deliverance from the Pit (A)
					sourceQuest = 24498,	-- The Path to the Citadel (A)
					qg = 37591,	-- Martin Victus
					races = ALLIANCE_ONLY,
					lvl = lvlsquish(78, 78, 25),
					groups = {
						objective(1, {	-- 0/1 Scourgelord Tyrannus slain
							provider = { "n", 36658 },	-- Scourgelord Tyrannus
						}),
					},
				}),
				q(24712, {	-- Deliverance from the Pit (H)
					sourceQuest = 24507,	-- The Path to the Citadel (H)
					qg = 24712,	-- Gorkun Ironskull
					races = HORDE_ONLY,
					lvl = lvlsquish(78, 78, 25),
					groups = {
						objective(1, {	-- 0/1 Scourgelord Tyrannus slain
							provider = { "n", 36658 },	-- Scourgelord Tyrannus
						}),
					},
				}),
				q(24711, {	-- Frostmourne (A)
					sourceQuest = 24710,	-- Deliverance from the Pit (A)
					qg = 38188,	-- Lady Jaina Proudmoore
					maps = { HALLS_OF_REFLECTION },
					races = ALLIANCE_ONLY,
					lvl = lvlsquish(78, 78, 25),
				}),
				q(24713, {	-- Frostmourne (H)
					sourceQuest = 24712,	-- Deliverance from the Pit (H)
					qg = 38189,	-- Lady Sylvanas Windrunner <Banshee Queen>
					maps = { HALLS_OF_REFLECTION },
					races = HORDE_ONLY,
					lvl = lvlsquish(78, 78, 25),
				}),
				q(24498, {	-- The Path to the Citadel (A)
					sourceQuest = 24683,	-- The Pit of Saron (A)
					qg = 36993,	-- Lady Jaina Proudmoore
					races = ALLIANCE_ONLY,
					lvl = lvlsquish(78, 78, 25),
					groups = {
						objective(1, {	-- 0/15 Alliance Slave freed
							provider = { "n", 36764 },	-- Alliance Slave
						}),
						objective(2, {	-- 0/1 Forgemaster Garfrost slain
							provider = { "n", 36494 },	-- Forgemaster Garfrost
						}),
					},
				}),
				q(24507, {	-- The Path to the Citadel (H)
					sourceQuest = 24682,	-- The Pit of Saron (H)
					qg = 36990,	-- Lady Sylvanas Windrunner <Banshee Queen>
					races = HORDE_ONLY,
					lvl = lvlsquish(78, 78, 25),
					groups = {
						objective(1, {	-- 0/15 Horde Slave freed
							provider = { "n", 36770 },	-- Horde Slave
						}),
						objective(2, {	-- 0/1 Forgemaster Garfrost slain
							provider = { "n", 36494 },	-- Forgemaster Garfrost
						}),
					},
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					a(i(50379)),	-- Battered Hilt [A]
					h(i(50380)),	-- Battered Hilt [H]
					i(49852),	-- Coffin Nail
					i(50318),	-- Ghostly Wristwraps
					i(49854),	-- Mantle of Tattered Feathers
					i(49855),	-- Plated Grips of Korth'azz
					i(50315),	-- Seven-Fingered Claws
					i(49853),	-- Titanium Links of Lore
					i(50319),	-- Unsharpened Ice Razor
				}),
				BossOnly(GARFROST, {
					i(50228),	-- Barbed Ymirheim Choker
					i(49806),	-- Flayer's Black Belt
					i(49802),	-- Garfrost's Two-Ton Hammer
					i(49805),	-- Ice-Steeped Sandals
					i(50229),	-- Legguards of the Frosty Depths
					i(50230),	-- Malykriss Vambraces
					i(49804),	-- Polished Mirror Helm
					i(49803),	-- Ring of Carnelian and Bone
					i(50234),	-- Shoulderplates of Frozen Blood
					i(50233),	-- Spurned Val'kyr Shoulderguards
					i(50227),	-- Surgeon's Needle
					i(49801),	-- Unspeakable Secret
				}),
				BossOnly(ICK_AND_KRICK, {
					i(50266),	-- Ancient Polar Bear Hide
					i(49808),	-- Bent Gold Belt
					i(49811),	-- Black Dragonskin Breeches
					i(50265),	-- Blackened Ghoul Skin Leggings
					i(50263),	-- Braid of Salt and Fire
					i(50264),	-- Chewed Leather Wristguards
					i(50262),	-- Felglacier Bolter
					i(50235),	-- Ick's Rotting Thumb
					i(49807),	-- Krick's Beetle Stabber
					i(49812),	-- Purloined Wedding Ring
					i(49810),	-- Scabrous Zombie Leather Belt
					i(49809),	-- Wristguards of Subterranean Moss
				}),
				BossOnly(TYRANNUS, {
					i(50271),	-- Band of Stained Souls
					i(50270),	-- Belt of Rotted Fingernails
					i(49823),	-- Cloak of the Fallen Cardinal
					i(50273),	-- Engraved Gargoyle Femur
					i(267007, { timeline = { ADDED_12_0_0 } }),	-- Eye of Acherus (DECOR!)
					i(50269),	-- Fleshwerk Leggings
					i(50272),	-- Frost Wyrm Ribcage
					i(49820),	-- Gondria's Spectral Bracer
					i(49824),	-- Horns of the Spurned Val'kyr
					i(50285),	-- Icebound Bronze Cuirass
					i(50283),	-- Mudslide Boots
					i(50259),	-- Nevermelting Ice Crystal
					i(49818),	-- Painfully Sharp Choker
					i(49825),	-- Palebone Robes
					i(50286),	-- Prelate's Snowshoes
					i(49821),	-- Protector of Frigid Souls
					i(49813),	-- Rimebane Rifle
					i(50268),	-- Rimefang's Claw
					i(49822),	-- Rimewoven Silks
					i(50284),	-- Rusty Frozen Fingerguards
					i(49816),	-- Scourgelord's Frigid Chestplate
					i(49817),	-- Shaggy Wyrmleather Leggings
					i(49826),	-- Shroud of Rime
					i(49819),	-- Skeleton Lord's Cranium
					i(50267),	-- Tyrannical Beheader
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ACHIEVEMENTS, {
					ach(4525, { timeline = { REMOVED_12_0_1_LAUNCH } }),	-- Don't Look Up
				}),
				BossOnly(GARFROST, {
					ach(4524, { timeline = { REMOVED_12_0_1_LAUNCH } }),	-- Doesn't Go to Eleven
				}),
				BossOnly(ICK_AND_KRICK),
				BossOnly(TYRANNUS, {
					ach(5113, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Pit of Saron Guild Run
					i(252421, { timeline = { ADDED_12_0_1_LAUNCH } }),	-- Rotting Globule
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				-- #if ANYCLASSIC
				n(ZONE_DROPS, {
					i(49718, {	-- Infused Saronite Bar
						provider = { "o", 201592 },	-- Infused Saronite Bars
					}),
				}),
				-- #endif
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				n(ZONE_DROPS, {
					i(49852),	-- Coffin Nail
					i(49854),	-- Mantle of Tattered Feathers
					i(49855),	-- Plated Grips of Korth'azz
					i(49853),	-- Titanium Links of Lore
				}),
				BossOnly(GARFROST, {
					i(49806),	-- Flayer's Black Belt
					i(49802),	-- Garfrost's Two-Ton Hammer
					i(49805),	-- Ice-Steeped Sandals
					i(49804),	-- Polished Mirror Helm
					i(49803),	-- Ring of Carnelian and Bone
					i(49801),	-- Unspeakable Secret
				}),
				BossOnly(ICK_AND_KRICK, {
					i(49808),	-- Bent Gold Belt
					i(49811),	-- Black Dragonskin Breeches
					i(49807),	-- Krick's Beetle Stabber
					i(49812),	-- Purloined Wedding Ring
					i(49810),	-- Scabrous Zombie Leather Belt
					i(49809),	-- Wristguards of Subterranean Moss
				}),
				BossOnly(TYRANNUS, {
					i(49823),	-- Cloak of the Fallen Cardinal
					i(49820),	-- Gondria's Spectral Bracer
					i(49824),	-- Horns of the Spurned Val'kyr
					i(49818),	-- Painfully Sharp Choker
					i(49825),	-- Palebone Robes
					i(49821),	-- Protector of Frigid Souls
					i(49813),	-- Rimebane Rifle
					i(49822),	-- Rimewoven Silks
					i(49816),	-- Scourgelord's Frigid Chestplate
					i(49817),	-- Shaggy Wyrmleather Leggings
					i(49826),	-- Shroud of Rime
					i(49819),	-- Skeleton Lord's Cranium
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { lvl = lvlsquish(80, 80, 30) }).AddGroups({
				n(ACHIEVEMENTS, {
					ach(4525, { timeline = { REMOVED_12_0_1_LAUNCH } }),	-- Don't Look Up
				}),
				n(ZONE_DROPS, {
					a(i(50379)),	-- Battered Hilt [A]
					h(i(50380)),	-- Battered Hilt [H]
					i(50318),	-- Ghostly Wristwraps
					i(50315),	-- Seven-Fingered Claws
					i(50319),	-- Unsharpened Ice Razor
				}),
				BossOnly(GARFROST, {
					ach(4524, { timeline = { REMOVED_12_0_1_LAUNCH } }),	-- Doesn't Go to Eleven
					i(50228),	-- Barbed Ymirheim Choker
					i(50229),	-- Legguards of the Frosty Depths
					i(50230),	-- Malykriss Vambraces
					i(50234),	-- Shoulderplates of Frozen Blood
					i(50233),	-- Spurned Val'kyr Shoulderguards
					i(50227),	-- Surgeon's Needle
				}),
				BossOnly(ICK_AND_KRICK, {
					i(50266),	-- Ancient Polar Bear Hide
					i(50265),	-- Blackened Ghoul Skin Leggings
					i(50263),	-- Braid of Salt and Fire
					i(50264),	-- Chewed Leather Wristguards
					i(50262),	-- Felglacier Bolter
					i(50235),	-- Ick's Rotting Thumb
				}),
				BossOnly(TYRANNUS, {
					ach(5113, { timeline = { ADDED_4_0_3 } }),	-- Heroic: The Pit of Saron Guild Run
					i(50271),	-- Band of Stained Souls
					i(50270),	-- Belt of Rotted Fingernails
					i(50273),	-- Engraved Gargoyle Femur
					i(50269),	-- Fleshwerk Leggings
					i(50272),	-- Frost Wyrm Ribcage
					i(50285),	-- Icebound Bronze Cuirass
					i(50283),	-- Mudslide Boots
					i(50259),	-- Nevermelting Ice Crystal
					i(50286),	-- Prelate's Snowshoes
					i(50268),	-- Rimefang's Claw
					i(50284),	-- Rusty Frozen Fingerguards
					i(50267),	-- Tyrannical Beheader
				}),
			}),
			-- #endif
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(278, {
		q(35438),	-- Pit of Saron Reward Quest - Normal completion
		q(35440),	-- Pit of Saron Reward Quest - Heroic completion
	}),
}));
