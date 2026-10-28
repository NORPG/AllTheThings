-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local NAZJAR = 101;
local ULTHOK = 102;
local GHURSHA = 103;
local OZUMAT = 104;

------ EncounterToCRS ------
local EncounterToCRS = {
	[NAZJAR] = { 40586 },	-- Lady Naz'jar
	[ULTHOK] = { 40765 },	-- Commander Ulthok
	[GHURSHA] = { 40788 },	-- Mindbender Ghur'sha
	[OZUMAT] = { 44566 },	-- Ozumat
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty =
InstanceHelper.BossOnly, InstanceHelper.Difficulty

root(ROOTS.Instances, expansion(EXPANSION.CATA, {
	applyclassicphase(CATA_PHASE_ONE, inst(65, {	-- Throne of the Tides
		mapID = 322,
		coord = { 71.00, 29.00, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
		timeline = { ADDED_4_0_3 },
		maps = { 323 },
		groups = {
			n(QUESTS, sharedData({
				-- #if AFTER 6.0.3
				description = "Be careful not to oneshot the boss, otherwise you might not be able to turn in the quest.",
				-- #endif
				groups = {
					i(65654),	-- Belt of a Thousand Deaths
					i(65655),	-- Leggings of Opportune Strikes
					i(65656),	-- Sea Witch Charm
				},
			}, {
				q(28834, {	-- Rescue the Earthspeaker!
					qg = 50270,	-- Captain Taylor
					races = ALLIANCE_ONLY,
				}),
				q(28833, {	-- Rescue the Earthspeaker!
					qg = 50272,	-- Legionnaire Nazgrim
					races = HORDE_ONLY,
				}),
			})),
			n(QUESTS, {
				q(28836, {	-- Sins of the Sea Witch
					qg = 50270,	-- Captain Taylor
					races = ALLIANCE_ONLY,
					groups = {
						i(65657),	-- Deepmist Robes
						i(65659),	-- Kelp Forest Vest
						i(65658),	-- Stonespeaker's Belt
					},
				}),
				q(28843, {	-- Sins of the Sea Witch
					qg = 50272,	-- Legionnaire Nazgrim
					races = HORDE_ONLY,
					groups = {
						i(65657),	-- Deepmist Robes
						i(65659),	-- Kelp Forest Vest
						i(65658),	-- Stonespeaker's Belt
					},
				}),
				q(28798, {	-- Waters of Elune
					provider = { "o", 207406 },	-- Strange Fountain
					requireSkill = ARCHAEOLOGY,
					isRepeatable = true,
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.NORMAL, { timeline = { REMOVED_7_3_5 } }).AddGroups({
				BossOnly(NAZJAR, {
					i(55198),	-- Aurelian Mitre
					i(55201),	-- Entwined Nereis
					i(55203),	-- Lightning Whelk Axe
					i(55202),	-- Periwinkle Cloak
					i(55195),	-- Wrasse Handwraps
				}),
				BossOnly(ULTHOK, {
					i(55204),	-- Caridean Epaulets
					i(55228),	-- Cerith Spire Staff
					i(55205),	-- Chromis Chestpiece
					i(55206),	-- Eagle Ray Cloak
					i(55207),	-- Harp Shell Pauldrons
				}),
				BossOnly(GHURSHA, {
					i(55229),	-- Anomuran Helm
					i(55236),	-- Anthia's Ring
					i(55248, { timeline = { REMOVED_5_0_4 } }),	-- Conch of Thundering Waves
					i(55235),	-- Decapod Slippers
					i(55237),	-- Porcelain Crab
				}),
				BossOnly(OZUMAT, {
					-- #if BEFORE 7.3.5
					ach(4839),	-- Throne of the Tides
					-- #endif
					i(55254),	-- Abalone Plate Armor
					i(55259),	-- Bioluminescent Lamp
					i(55251),	-- Might of the Ocean
					i(55255),	-- Mnemiopsis Gloves
					i(55250),	-- Nautilus Ring
					i(55258),	-- Pipefish Cord
					i(55256),	-- Sea Star
					i(55249),	-- Triton Legplates
					i(55253),	-- Wentletrap Vest
					i(55252),	-- Whitefin Axe
				}),
			}),
			-- #if AFTER 7.3.5
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					crs = {
						40936,	-- Faceless Watcher
						40943,	-- Gilgoblin Aquamage
						40935,	-- Gilgoblin Hunter
						39616,	-- Naz'jar Invader
						40584,	-- Naz'jar Invader
						40577,	-- Naz'jar Sentinel
						41139,	-- Naz'jar Spiritmender
						41096,	-- Naz'jar Spiritmender
						40634,	-- Naz'jar Tempest Witch
						40925,	-- Tainted Sentry
					},
					groups = {
						i(55260),	-- Alpheus Legguards
						i(55262),	-- Barnacle Pendant
						i(55261),	-- Ring of the Great Whale
					},
				}),
				BossOnly(NAZJAR, {
					i(56269),	-- Aurelian Mitre
					i(56270),	-- Entwined Nereis
					i(157588, { timeline = { ADDED_7_3_5 } }),	-- Ironshell Pendant
					i(56266),	-- Lightning Whelk Axe
					i(157587, { timeline = { ADDED_7_3_5 } }),	-- Old One Eye's Cowl
					i(56267),	-- Periwinkle Cloak
					i(56268),	-- Wrasse Handwraps
				}),
				BossOnly(ULTHOK, {
					i(56273),	-- Caridean Epaulets
					i(56271),	-- Cerith Spire Staff
					i(56274),	-- Chromis Chestpiece
					i(56275),	-- Eagle Ray Cloak
					i(56272),	-- Harp Shell Pauldrons
				}),
				BossOnly(GHURSHA, {
					i(56278),	-- Anomuran Helm
					i(56276),	-- Anthia's Ring
					i(56277),	-- Decapod Slippers
					i(56280),	-- Porcelain Crab
					i(157586, { timeline = { ADDED_7_3_5 } }),	-- Stonespeaker's Spare Cinch
				}),
				BossOnly(OZUMAT, {
					ach(4839),	-- Throne of the Tides
					i(56291),	-- Abalone Plate Armor
					i(56289),	-- Bioluminescent Lamp
					i(56285),	-- Might of the Ocean
					i(56286),	-- Mnemiopsis Gloves
					i(56282),	-- Nautilus Ring
					i(56288),	-- Pipefish Cord
					i(157589, { timeline = { ADDED_7_3_5 } }),	-- Salty Shell-Studded Girdle
					i(56290),	-- Sea Star
					i(56283),	-- Triton Legplates
					i(56281),	-- Wentletrap Vest
					i(56284),	-- Whitefin Axe
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC).AddGroups({
				BossOnly(NAZJAR, {
					ach(5285, { timeline = { REMOVED_10_2_0 } }),	-- Old Faithful
				}),
				BossOnly(ULTHOK),
				BossOnly(GHURSHA, {
					i(56279, { timeline = { REMOVED_5_0_4 } }),	-- Conch of Thundering Waves
				}),
				BossOnly(OZUMAT, {
					ach(5061),	-- Heroic: Throne of the Tides
					ach(5135),	-- Heroic: Throne of the Tides Guild Run
					ach(5286, { timeline = { REMOVED_10_2_0 } }),	-- Prince of Tides
				}),
			}),
			-- #else
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_HEROIC).AddGroups({
				n(ZONE_DROPS, {
					crs = {
						40936,	-- Faceless Watcher
						40943,	-- Gilgoblin Aquamage
						40935,	-- Gilgoblin Hunter
						39616,	-- Naz'jar Invader
						40584,	-- Naz'jar Invader
						40577,	-- Naz'jar Sentinel
						41139,	-- Naz'jar Spiritmender
						41096,	-- Naz'jar Spiritmender
						40634,	-- Naz'jar Tempest Witch
						40925,	-- Tainted Sentry
					},
					groups = {
						i(55260),	-- Alpheus Legguards
						i(55262),	-- Barnacle Pendant
						i(55261),	-- Ring of the Great Whale
					},
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.HEROIC).AddGroups({
				BossOnly(NAZJAR, {
					ach(5285),	-- Old Faithful
					i(56269),	-- Aurelian Mitre
					i(56270),	-- Entwined Nereis
					i(56266),	-- Lightning Whelk Axe
					i(56267),	-- Periwinkle Cloak
					i(56268),	-- Wrasse Handwraps
				}),
				BossOnly(ULTHOK, {
					i(56273),	-- Caridean Epaulets
					i(56271),	-- Cerith Spire Staff
					i(56274),	-- Chromis Chestpiece
					i(56275),	-- Eagle Ray Cloak
					i(56272),	-- Harp Shell Pauldrons
				}),
				BossOnly(GHURSHA, {
					i(56278),	-- Anomuran Helm
					i(56276),	-- Anthia's Ring
					i(56279, { timeline = { REMOVED_5_0_4 } }),	-- Conch of Thundering Waves
					i(56277),	-- Decapod Slippers
					i(56280),	-- Porcelain Crab
				}),
				BossOnly(OZUMAT, {
					ach(5061),	-- Heroic: Throne of the Tides
					ach(5135),	-- Heroic: Throne of the Tides Guild Run
					ach(5286),	-- Prince of Tides
					i(56291),	-- Abalone Plate Armor
					i(56289),	-- Bioluminescent Lamp
					i(56285),	-- Might of the Ocean
					i(56286),	-- Mnemiopsis Gloves
					i(56282),	-- Nautilus Ring
					i(56288),	-- Pipefish Cord
					i(56290),	-- Sea Star
					i(56283),	-- Triton Legplates
					i(56281),	-- Wentletrap Vest
					i(56284),	-- Whitefin Axe
				}),
			}),
			-- #endif
			-- #if ANYCLASSIC
			applyclassicphase(CATA_PHASE_RAGE_OF_THE_FIRELANDS, n(PROTOCOL_INFERNO, {
				OnInit = FUNCTION_TEMPLATES.OnInit.GenerateShouldExcludeFromTooltipForBuffs(470595),
				groups = {
					BossOnly(OZUMAT, {
						ach(41140),	-- Protocol Inferno: Throne of the Tides
					}),
				},
			})),
			-- #endif
		},
	})),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, {
	inst(65, {
		q(35363),	-- Throne of the Tides Reward Quest - Normal completion
		q(35365),	-- Throne of the Tides Reward Quest - Heroic completion / Timewalking completion
		q(35364),	-- Throne of the Tides Bonus Reward - kill Mindbender Ghur'sha (Normal)
		q(35366),	-- Throne of the Tides Bonus Reward - kill Mindbender Ghur'sha (Heroic / Timewalking)
	}),
}));
