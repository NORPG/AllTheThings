-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local FALRIC = 601;
local MARWYN = 602;
local LICH_KING = 603;

------ EncounterToCRS ------
local EncounterToCRS = {
	[FALRIC] = { 38112 },	-- Falric
	[MARWYN] = { 38113 },	-- Marwyn
	[LICH_KING] = { 36954 },	-- The Lich King
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty =
InstanceHelper.BossOnly, InstanceHelper.Difficulty

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_FOUR, bubbleDown({ ["timeline"] = { ADDED_3_3_0 } }, {
	inst(276, {	-- Halls of Reflection
		["mapID"] = HALLS_OF_REFLECTION,
		["coord"] = { 52.3, 89.3, ICECROWN },
		["lvl"] = lvlsquish(78, 78, 25),
		["groups"] = {
			n(ACHIEVEMENTS, {
				ach(4518, {	-- The Halls of Reflection
					-- #if AFTER 7.3.5
					crit(13320, {	-- Falric
						["_encounter"] = { FALRIC, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(13321, {	-- Marwyn
						["_encounter"] = { MARWYN, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					crit(13323, {	-- Survive the encounter with the Lich King
						["_encounter"] = { LICH_KING, DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC },
					}),
					-- #else
					crit(13320, {	-- Falric
						["_encounter"] = { FALRIC, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(13321, {	-- Marwyn
						["_encounter"] = { MARWYN, DIFFICULTY.DUNGEON.NORMAL },
					}),
					crit(13323, {	-- Survive the encounter with the Lich King
						["_encounter"] = { LICH_KING, DIFFICULTY.DUNGEON.NORMAL },
					}),
					-- #endif
				}),
				ach(4521, {	-- Heroic: The Halls of Reflection
					crit(13177, {	-- Falric
						["_encounter"] = { FALRIC, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(13179, {	-- Marwyn
						["_encounter"] = { MARWYN, DIFFICULTY.DUNGEON.HEROIC },
					}),
					crit(13181, {	-- Survive the encounter with the Lich King
						["_encounter"] = { LICH_KING, DIFFICULTY.DUNGEON.HEROIC },
					}),
				}),
			}),
			n(QUESTS, {
				q(24500, {	-- Wrath of the Lich King
					["qg"] = 37582,	-- Archmage Koreln <Kirin Tor>
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(78, 78, 25),
					["groups"] = {
						objective(1, {	-- Find Lady Jaina Proudmoore
							["provider"] = { "n", 36955 },	-- Lady Jaina Proudmoore
						}),
						objective(2, {	-- Escape The Lich King
							["provider"] = { "n", 36954 },	-- The Lich King
						}),
					},
				}),
				q(24802, {	-- Wrath of the Lich King
					["qg"] = 37779,	-- Dark Ranger Loralen
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(78, 78, 25),
					["groups"] = {
						objective(1, {	-- Find Lady Sylvanas Windrunner
							["provider"] = { "n", 37554 },	-- Lady Sylvanas Windrunner
						}),
						objective(2, {	-- Escape The Lich King
							["provider"] = { "n", 36954 },	-- The Lich King
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
				BossOnly(FALRIC, {
					i(50292),	-- Bracer of Worn Molars
					i(50294),	-- Chestpiece of High Treason
					i(49832),	-- Eerie Runeblade Polisher
					i(49830),	-- Fallen Sentry's Hood
					i(50290),	-- Falric's Wrist-Chopper
					i(49827),	-- Ghoulslicer
					i(49828),	-- Marwyn's Macabre Fingertips
					i(49831),	-- Muddied Boots of Brill
					i(50291),	-- Soulsplinter
					i(50293),	-- Spaulders of Black Betrayal
					i(50295),	-- Spiked Toestompers
					i(49829),	-- Valonforth's Tarnished Pauldrons
				}),
				BossOnly(MARWYN, {
					i(49838),	-- Carpal Tunnelers
					i(50300),	-- Choking Hauberk
					i(50260),	-- Ephemeral Snowflake
					i(49834),	-- Frayed Abomination Stitching Shoulders
					i(50297),	-- Frostsworn Bone Chestpiece
					i(49836),	-- Frostsworn Bone Leggings
					i(49837),	-- Mitts of Burning Hail
					i(50296),	-- Orca-Hunter's Harpoon
					i(50298),	-- Sightless Crown of Ulmaas
					i(49835),	-- Splintered Door of the Citadel
					i(49833),	-- Splintered Icecrown Parapet
					i(50299),	-- Suspiciously Soft Gloves
				}),
				BossOnly(LICH_KING, {
					i(50303),	-- Black Icicle
					i(49841),	-- Blackened Geist Ribs
					i(50308),	-- Blighted Leather Footpads
					i(49845),	-- Bone Golem Scapula
					i(50312),	-- Chestguard of Broken Branches
					i(49846),	-- Chilled Heart of the Glacier
					i(49844),	-- Crypt Fiend Slayer
					i(49843),	-- Crystalline Citadel Gauntlets
					i(50310),	-- Fossilized Ammonite Choker
					i(49851),	-- Greathelm of the Silver Hand
					i(49848),	-- Grim Lasher Shoulderguards
					i(50305),	-- Grinning Skull Boots
					i(49840),	-- Hate-Forged Cleaver
					i(50304),	-- Hoarfrost Gauntlets
					i(49847),	-- Legguards of Untimely Demise
					i(50302),	-- Liar's Tongue
					i(49839),	-- Mourning Malice
					i(50313),	-- Oath of Empress Zoe
					i(50311),	-- Second Helm of the Executioner
					i(50309),	-- Shriveled Heart
					i(50314),	-- Strip of Remorse
					i(49842),	-- Tapestry of the Frozen Throne
					i(49849),	-- Tattered Glacial-Woven Hood
					i(50306),	-- The Lady's Promise
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { ["lvl"] = lvlsquish(80, 80, 30) }).AddGroups({
				BossOnly(FALRIC),
				BossOnly(MARWYN),
				BossOnly(LICH_KING, {
					ach(5114, { ["timeline"] = { ADDED_4_0_3 } }),	-- Heroic: The Halls of Reflection Guild Run
					ach(4526),	-- We're Not Retreating; We're Advancing in a Different Direction.
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.NORMAL).AddGroups({
				n(ZONE_DROPS, {
					i(49852),	-- Coffin Nail
					i(49854),	-- Mantle of Tattered Feathers
					i(49855),	-- Plated Grips of Korth'azz
					i(49853),	-- Titanium Links of Lore
				}),
				BossOnly(FALRIC, {
					i(49832),	-- Eerie Runeblade Polisher
					i(49830),	-- Fallen Sentry's Hood
					i(49827),	-- Ghoulslicer
					i(49828),	-- Marwyn's Macabre Fingertips
					i(49831),	-- Muddied Boots of Brill
					i(49829),	-- Valonforth's Tarnished Pauldrons
				}),
				BossOnly(MARWYN, {
					i(49838),	-- Carpal Tunnelers
					i(49834),	-- Frayed Abomination Stitching Shoulders
					i(49836),	-- Frostsworn Bone Leggings
					i(49837),	-- Mitts of Burning Hail
					i(49835),	-- Splintered Door of the Citadel
					i(49833),	-- Splintered Icecrown Parapet
				}),
				BossOnly(LICH_KING, {
					i(49841),	-- Blackened Geist Ribs
					i(49845),	-- Bone Golem Scapula
					i(49846),	-- Chilled Heart of the Glacier
					i(49844),	-- Crypt Fiend Slayer
					i(49843),	-- Crystalline Citadel Gauntlets
					i(49851),	-- Greathelm of the Silver Hand
					i(49848),	-- Grim Lasher Shoulderguards
					i(49840),	-- Hate-Forged Cleaver
					i(49847),	-- Legguards of Untimely Demise
					i(49839),	-- Mourning Malice
					i(49842),	-- Tapestry of the Frozen Throne
					i(49849),	-- Tattered Glacial-Woven Hood
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC, { ["lvl"] = lvlsquish(80, 80, 30) }).AddGroups({
				n(ZONE_DROPS, {
					a(i(50379)),	-- Battered Hilt [A]
					h(i(50380)),	-- Battered Hilt [H]
					i(50318),	-- Ghostly Wristwraps
					i(50315),	-- Seven-Fingered Claws
					i(50319),	-- Unsharpened Ice Razor
				}),
				BossOnly(FALRIC, {
					i(50292),	-- Bracer of Worn Molars
					i(50294),	-- Chestpiece of High Treason
					i(50290),	-- Falric's Wrist-Chopper
					i(50291),	-- Soulsplinter
					i(50293),	-- Spaulders of Black Betrayal
					i(50295),	-- Spiked Toestompers
				}),
				BossOnly(MARWYN, {
					i(50300),	-- Choking Hauberk
					i(50260),	-- Ephemeral Snowflake
					i(50297),	-- Frostsworn Bone Chestpiece
					i(50296),	-- Orca-Hunter's Harpoon
					i(50298),	-- Sightless Crown of Ulmaas
					i(50299),	-- Suspiciously Soft Gloves
				}),
				BossOnly(LICH_KING, {
					ach(5114, { ["timeline"] = { ADDED_4_0_3 } }),	-- Heroic: The Halls of Reflection Guild Run
					ach(4526),	-- We're Not Retreating; We're Advancing in a Different Direction.
					i(50303),	-- Black Icicle
					i(50308),	-- Blighted Leather Footpads
					i(50312),	-- Chestguard of Broken Branches
					i(50310),	-- Fossilized Ammonite Choker
					i(50305),	-- Grinning Skull Boots
					i(50304),	-- Hoarfrost Gauntlets
					i(50302),	-- Liar's Tongue
					i(50313),	-- Oath of Empress Zoe
					i(50311),	-- Second Helm of the Executioner
					i(50309),	-- Shriveled Heart
					i(50314),	-- Strip of Remorse
					i(50306),	-- The Lady's Promise
				}),
			}),
			-- #endif
		},
	}),
}))));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_2 } }, {
	inst(276, {
		q(35441),	-- Halls of Reflection Reward Quest - Normal completion
		q(35442),	-- Halls of Reflection Reward Quest - Heroic completion
	}),
})));
