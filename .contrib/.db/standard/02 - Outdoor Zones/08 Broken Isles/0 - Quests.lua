---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		n(QUESTS, {
			["groups"] = {
				n(ACHIEVEMENTS, {	-- Achievements
					ach(11427, {	-- No Shellfish Endeavor (automated)
						i(143660),	-- Mrgrglhjorn (TOY!)
					}),
					ach(10877),	-- Pillars of Creation (automated)
					ach(11186),	-- Tehd & Marius' Excellent Adventure (automated)
					ach(11189),	-- Variety is the Spice of Life
				}),
				header(HEADERS.Spell, 41341, {	-- Balance of Power
					["description"] = createLocalizationString({
						readable = "The only known requirement to start this questline is the completion of your class campaign.",
						constant = "THE_ONLY_KNOWN_REQUIREMENT_TO_START_THIS",
						export = true,
						text = {
							en = "The only known requirement to start this questline is the completion of your class campaign.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "开启此任务线唯一已知的要求是完成你的职业战役。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						q(43496, {	-- The Power Within
							["description"] = createLocalizationString({
								readable = "This quest is available if you *have* completed the quests at Azurewing Repose in Azsuna.",
								constant = "THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_COMPLETED",
								export = true,
								text = {
									en = "This quest is available if you *have* completed the quests at Azurewing Repose in Azsuna.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "如果你*已经*完成阿苏纳蓝翼憩地的任务，此任务就会开放。",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "n", 110768 },	-- Image of Kalec
							["maps"] = exclude({HALL_OF_THE_GUARDIAN_2ND_FLOOR, HALL_OF_THE_GUARDIAN}, CLASS_HALL_MAPS),
							["classes"] = exclude(MAGE, ALL_CLASSES),
						}),
						q(43501, {	-- The Power Within
							["description"] = createLocalizationString({
								readable = "This quest is available if you *have not* completed the quests at Azurewing Repose in Azsuna.",
								constant = "THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_NOT",
								export = true,
								text = {
									en = "This quest is available if you *have not* completed the quests at Azurewing Repose in Azsuna.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "如果你*尚未*完成阿苏纳蓝翼栖地的任务，则可以接取此任务。",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "n", 110768 },	-- Image of Kalec
							["maps"] = exclude({HALL_OF_THE_GUARDIAN_2ND_FLOOR, HALL_OF_THE_GUARDIAN}, CLASS_HALL_MAPS),
							["classes"] = exclude(MAGE, ALL_CLASSES),
						}),
						q(43503, {	-- The Power Within
							["description"] = "~L.THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_COMPLETED",
							["provider"] = { "n", 108247 },	-- Image of Kalec
							["maps"] = { HALL_OF_THE_GUARDIAN_2ND_FLOOR, HALL_OF_THE_GUARDIAN },
							["classes"] = { MAGE },
						}),
						q(43505, {	-- The Power Within
							["description"] = createLocalizationString({
								readable = "This quest is available if you have *not* completed the quests at Azurewing Repose in Azsuna.",
								constant = "THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_NOT_2",
								export = true,
								text = {
									en = "This quest is available if you have *not* completed the quests at Azurewing Repose in Azsuna.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "如果你*尚未*完成阿苏纳蓝翼栖地的任务，则可以接取此任务。",
									-- TODO: tw = "",
								},
							}),
							["altQuests"] = { 43503 },	-- The Power Within (this is the only version that doesn't autocomplete with the others when you turn one in)
							["provider"] = { "n", 108247 },	-- Image of Kalec
							["coord"] = { 56.4, 39.1, HALL_OF_THE_GUARDIAN_2ND_FLOOR },
							["classes"] = { MAGE },
						}),
						q(40668, {	-- Eye of Azshara: The Heart of Zin-Azshari
							["sourceQuests"] = { 43496, 43501, 43503, 43505 },	-- The Power Within (4 versions)
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["maps"] = { 713 },	-- Eye of Azshara
							["groups"] = {
								o(245934, {	-- Heart of Zin-Azshari
									i(132738),	-- Heart of Zin-Azshari (QI!)
								}),
							},
						}),
						q(43514, {	-- A Vainglorious Past
							["sourceQuests"] = { 40668 },	-- Eye of Azshara: The Heart of Zin-Azshari
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["groups"] = {
								i(139631, {	-- Vainglorious Draught (QI!)
									["coord"] = { 46.9, 41.4, AZSUNA },
									["cr"] = 107376,	-- Veridis Fallon <Court of Farondis Emissary>
								}),
							},
						}),
						q(43517, {	-- Darkheart Thicket: Fallen Power
							["sourceQuests"] = { 40668 },	-- Eye of Azshara: The Heart of Zin-Azshari
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["maps"] = { 733 },	-- Darkheart Thicket
							["groups"] = {
								i(139633),	-- Corrupted Essence (QI!)
							},
						}),
						q(43518, {	-- Tempering Darkness
							["sourceQuests"] = { 40668 },	-- Eye of Azshara: The Heart of Zin-Azshari
							["provider"] = { "n", 110773 },	-- Archmage Kalec <Kirin Tor>
							["coord"] = { 48.0, 25.7, AZSUNA },
						}),
						q(43519, {	-- Lucid Strength
							["sourceQuests"] = {
								43514,	-- A Vainglorious Past
								43517,	-- Darkheart Thicket: Fallen Power
								43518,	-- Tempering Darkness
							},
							["provider"] = { "n", 110773 },	-- Archmage Kalec <Kirin Tor>
							["coord"] = { 48.0, 25.7, AZSUNA },
						}),
						q(43581, {	-- The Wisdom of Patience
							["sourceQuests"] = { 43519 },	-- Lucid Strength
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["u"] = REMOVED_FROM_GAME,
							-- NOTE: This quest was removed when Emerald Nightmare opened
						}),
						q(43520, {	-- The Emerald Nightmare: In Nightmares
							["sourceQuests"] = {
								43519,	-- Lucid Strength
								43581,	-- The Wisdom of Patience
							},
							["provider"] = { "n", 110773 },	-- Archmage Kalec <Kirin Tor>
							["coord"] = { 48.0, 25.7, AZSUNA },
							["maps"] = { 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, },	-- The Emerald Nightmare
							["groups"] = {
								i(139671),	-- Deathglare Iris (QI!)
								i(139672),	-- Horn of the Nightmare Lord (QI!)
							},
						}),
						q(43521, {	-- The Emerald Nightmare: Essence of Power
							["sourceQuests"] = {
								43519,	-- Lucid Strength
								43581,	-- The Wisdom of Patience
							},
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["maps"] = { 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, },	-- The Emerald Nightmare
							["groups"] = {
								i(139771, {	-- Seething Essence
									i(139706),	-- Corrupted Essence (QI!)
								}),
							},
						}),
						q(43522, {	-- Essential Consumption
							["sourceQuests"] = { 43520 },	-- The Emerald Nightmare: Essence of Power
							["provider"] = { "n", 100482 },	-- Senegos
							["coord"] = { 48.0, 25.7, AZSUNA },
							["maps"] = { SURAMAR },
						}),
						q(43523, {	-- Repaid Debt
							["description"] = createLocalizationString({
								readable = "This quest is available if you *have* completed the Moonguard Stronghold quests in Suramar.",
								constant = "THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_COMPLETED_2",
								export = true,
								text = {
									en = "This quest is available if you *have* completed the Moonguard Stronghold quests in Suramar.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "如果你*已经*完成苏拉玛月卫要塞的任务，则可以接取此任务。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuests"] = { 43522 },	-- Essential Consumption
							["provider"] = { "n", 110773 },	-- Archmage Kalec
						}),
						q(43527, {	-- Saving the Guard
							["description"] = createLocalizationString({
								readable = "This quest is available if you have *not* completed the Moonguard Stronghold quests in Suramar.",
								constant = "THIS_QUEST_IS_AVAILABLE_IF_YOU_HAVE_NOT_3",
								export = true,
								text = {
									en = "This quest is available if you have *not* completed the Moonguard Stronghold quests in Suramar.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "如果你*尚未*完成苏拉玛月卫要塞的任务，则可以接取此任务。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuests"] = { 43522 },	-- Essential Consumption
							["provider"] = { "n", 110773 },	-- Archmage Kalec
							["coord"] = { 48.1, 25.6, AZSUNA },
						}),
						q(43937),	-- Seeking Refuge (Saving the Guard gives credit for this; not sure if it is obtainable on its own anymore)
						q(43938, {	-- Focusing Our Efforts
							["sourceQuests"] = { 43522 },	-- Essential Consumption
							["provider"] = { "n", 110773 },	-- Archmage Kalec
							["coord"] = { 48.1, 25.6, AZSUNA },
							-- mogwai316 Note: Saving the Guard gives credit for this; not sure if it is obtainable on its own anymore
							-- Exo Note: I don't know about timelines but I got this quest from Kalec on Remix BEFORE completing anything in Suramar. TODO: Test on a fresh character on Live realm.
						}),
						q(40673, {	-- Lost Knowledge
							["sourceQuests"] = { 43527 },	-- Saving the Guard
							["provider"] = { "n", 101083 },	-- Thalrenus Rivertree
							["coord"] = { 37.8, 47.3, SURAMAR },
						}),
						q(43525, {	-- Vault of the Wardens: Borrowing Without Asking
							["sourceQuests"] = { 40673 },	-- Lost Knowledge
							["provider"] = { "n", 101083 },	-- Thalrenus Rivertree
							["coord"] = { 37.8, 47.3, SURAMAR },
							["maps"] = { 710, 711, 712, },	-- Vault of the Wardens
							["groups"] = {
								o(252443, {	-- Containment Crystal
									i(139788),	-- Containment Crystal (QI!)
								}),
							},
						}),
						q(40675, {	-- The Arcway: Rite of the Captain
							["sourceQuests"] = { 40673 },	-- Lost Knowledge
							["provider"] = { "n", 101080 },	-- Syrana Starweaver
							["coord"] = { 37.9, 47.3, SURAMAR },
							["maps"] = { 749 },	-- The Arcway
						}),
						q(43524, {	-- Court of Stars: Literary Perfection
							["sourceQuests"] = { 40673 },	-- Lost Knowledge
							["provider"] = { "n", 101082 },	-- Lothrius Mooncaller
							["coord"] = { 37.9, 47.4, SURAMAR },
							["maps"] = { 761, 762, 763 },	-- Court of Stars
							["groups"] = {
								o(252410, {	-- Scrolls, Sigils, and the Nightborne Way
									i(139782),	-- Wards, Sigils, and the Nightborne Way (QI!)
								}),
							},
						}),
						q(40678, {	-- Twisted Power
							["sourceQuests"] = {
								43524,	-- Court of Stars: Literary Perfection
								40675,	-- The Arcway: Rite of the Captain
								43525,	-- Vault of the Wardens: Borrowing Without Asking
							},
							["provider"] = { "n", 101080 },	-- Syrana Starweaver
							["coord"] = { 37.9, 47.3, SURAMAR },
						}),
						q(43526, {	-- A True Test
							["sourceQuests"] = { 40678 },	-- Twisted Power
							["provider"] = { "n", 101080 },	-- Syrana Starweaver
							["coord"] = { 37.9, 47.3, SURAMAR },
						}),
						q(40603, {	-- Seeking the Valkyra
							["sourceQuests"] = { 43526 },	-- A True Test
							["provider"] = { "n", 111826 },	-- Archmage Kalec
							["coord"] = { 37.8, 47.4, SURAMAR },
							["maps"] = { STORMHEIM },
						}),
						q(40608, {	-- The Mark
							["sourceQuest"] = 40603,	-- Seeking the Valkyra
							["provider"] = { "n", 100738 },	-- Ashildir
							["coord"] = { 62.7, 68.1, STORMHEIM },
						}),
						q(40613, {	-- Maw of Souls: Retrieving the Svalnguard
							["sourceQuest"] = 40608,	-- The Mark
							["provider"] = { "n", 100738 },	-- Ashildir
							["coord"] = { 62.7, 68.1, STORMHEIM },
							["maps"] = { 706, 707, 708 },	-- Maw of Souls
							["groups"] = {
								o(245849, {	-- The Svalnguard
									i(132440),	-- The Svalnguard (QI!)
								}),
							},
						}),
						q(40614, {	-- A Feast Fit for Odyn
							["sourceQuest"] = 40613,	-- Maw of Souls: Retrieving the Svalnguard
							["provider"] = { "n", 100738 },	-- Ashildir
							["coord"] = { 62.7, 68.1, STORMHEIM },
							["maps"] = { AZSUNA, HIGHMOUNTAIN },
						}),
						q(40672, {	-- Neltharion's Lair: Presentation is Key
							["sourceQuest"] = 40613,	-- Maw of Souls: Retrieving the Svalnguard
							["provider"] = { "n", 100738 },	-- Ashildir
							["coord"] = { 62.7, 68.1, STORMHEIM },
							["maps"] = { 731 },	-- Neltharion's Lair
							["groups"] = {
								o_repeated({	-- Adamantium Casing Scrap
									i(132744),	-- Adamantium Casing Scrap (QI!)
									o(245935),	-- Adamantium Casing Scrap
									o(245936),	-- Adamantium Casing Scrap
									o(245937),	-- Adamantium Casing Scrap
									o(245938),	-- Adamantium Casing Scrap
								}),
							},
						}),
						q(40615, {	-- Halls of Valor: Odyn's Blessing
							["sourceQuests"] = {
								40614,	-- A Feast Fit for Odyn
								40672,	-- Neltharion's Lair: Presentation is Key
							},
							["provider"] = { "n", 100738 },	-- Ashildir
							["coord"] = { 62.7, 68.1, STORMHEIM },
							["maps"] = { 703, 704, 705 },	-- Halls of Valor
							["groups"] = { i(132471) },	-- Grand Feast of Valhallas (PQI!)
						}),
						q(43898, {	-- Preparing to Move
							["sourceQuest"] = 40615,	-- Halls of Valor: Odyn's Blessing
							["provider"] = { "n", 111814 },	-- Archmage Kalec
							["coord"] = { 62.5, 68.2, STORMHEIM },
							["maps"] = { SURAMAR },
						}),
						q(43528, {	-- Planning the Assault
							["sourceQuest"] = 43898,	-- Preparing to Move
							["provider"] = { "n", 111814 },	-- Archmage Kalec
							["coord"] = { 62.5, 68.2, STORMHEIM },
							["maps"] = { SURAMAR },
							["u"] = REMOVED_FROM_GAME,
							-- NOTE: This quest was removed when The Nighthold opened
						}),
						q(43530, {	-- The Nighthold: Delusions of Grandeur
							["sourceQuests"] = {
								43898,	-- Preparing to Move
								43528,	-- Planning the Assault
							},
							["provider"] = { "n", 101083 },	-- Thalrenus Rivertree
							["coord"] = { 37.8, 47.3, SURAMAR },
							["maps"] = { 764, 765, 766, 767, 768, 769, 770, 771, 772 },	-- The Nighthold
						}),
						q(43531, {	-- The Nighthold: Into the Nighthold
							["sourceQuest"] = 43898,	-- Preparing to Move
							["provider"] = { "n", 111826 },	-- Archmage Kalec
							["coord"] = { 37.8, 47.4, SURAMAR },
							["maps"] = { 764, 765, 766, 767, 768, 769, 770, 771, 772 },	-- The Nighthold
						}),
						q(43532, {	-- The Nighthold: Darkness Calls
							["sourceQuest"] = 43898,	-- Preparing to Move
							["provider"] = { "n", 111826 },	-- Archmage Kalec
							["coord"] = { 37.8, 47.4, SURAMAR },
							["maps"] = { 764, 765, 766, 767, 768, 769, 770, 771, 772 },	-- The Nighthold
						}),
						q(43533, {	-- Balance of Power
							["sourceQuests"] = {
								43530,	-- The Nighthold: Delusions of Grandeur
								43531,	-- Into the Nighthold
								43532,	-- The Nighthold: Darkness Calls
							},
							["provider"] = { "n", 111826 },	-- Archmage Kalec
							["coord"] = { 37.8, 47.4, SURAMAR },
							["groups"] = {
								cl(WARRIOR, {
									["classes"] = { WARRIOR },
									["groups"] = {
										artifact(805),
										artifact(669),
										artifact(164),
									},
								}),
								cl(PALADIN, {
									["classes"] = { PALADIN },
									["groups"] = {
										artifact(16),
										artifact(545),
										artifact(856),
									},
								}),
								cl(HUNTER, {
									["classes"] = { HUNTER },
									["groups"] = {
										artifact(219),
										artifact(462),
										artifact(481),
									},
								}),
								cl(ROGUE, {
									["classes"] = { ROGUE },
									["groups"] = {
										artifact(237),
										artifact(765),
										artifact(71),
									},
								}),
								cl(PRIEST, {
									["classes"] = { PRIEST },
									["groups"] = {
										artifact(735),
										artifact(753),
										artifact(255),
									},
								}),
								cl(DEATHKNIGHT, {
									["classes"] = { DEATHKNIGHT },
									["groups"] = {
										artifact(368),
										artifact(371),
										artifact(403),
									},
								}),
								cl(SHAMAN, {
									["classes"] = { SHAMAN },
									["groups"] = {
										artifact(310),
										artifact(682),
										artifact(781),
									},
								}),
								cl(MAGE, {
									["classes"] = { MAGE },
									["groups"] = {
										artifact(184),
										artifact(499),
										artifact(134),
									},
								}),
								cl(WARLOCK, {
									["classes"] = { WARLOCK },
									["groups"] = {
										artifact(198),
										artifact(329),
										artifact(818),
									},
								}),
								cl(MONK, {
									["classes"] = { MONK },
									["groups"] = {
										artifact(517),
										artifact(348),
										artifact(525),
									},
								}),
								cl(DRUID, {
									["classes"] = { DRUID },
									["groups"] = {
										artifact(419),
										artifact(54),
										artifact(434),
										artifact(277),
									},
								}),
								cl(DEMONHUNTER, {
									["classes"] = { DEMONHUNTER },
									["groups"] = {
										artifact(36),
										artifact(563),
									},
								}),
							},
						}),
					},
				}),
				n(113857, {	-- Light's Heart
					["icon"] = 236415,
					["lore"] = "Light's Heart is the sentience core of the naaru prime Xe'ra sent as a last resort by High Exarch Turalyon who battles on Argus, to be handed to Prophet Velen. It fell from the Felstorm along the coast of Suramar, in the Broken Isles.\n\nThe Order of the Silver Hand witnessed the event and informed Archmage Khadgar, who then tasked order leaders with recovering it before the Burning Legion did. It has since been kept safe in a class order hall.\n\nUnlocked by the Tear of Elune, Xe'ra communicates through it with the order leader in order to provide insight into the history of Illidan Stormrage. She revealed that Light's Heart was to serve as the vessel for Illidan Stormrage's rebirth. After Illidan's soul was put into a prism to keep it safe, it was brought to Light's Heart where the prism was \"seemingly consumed\". Light's Heart, with Illidan's soul inside, is then brought to Khadgar with instructions to call forth the vessel's power when Gul'dan attempts to summon Sargeras, thus releasing Illidan's soul into his body before Sargeras can possess his empty shell.",
					["maps"] = CLASS_HALL_MAPS,
					["groups"] = {
						q(44009, {	-- A Falling Star (non-Paladin)
							["description"] = createLocalizationString({
								readable = "The prerequisite for this quest is recruiting your class's first two champions, doing your first short mission, and recruiting your first troops.",
								constant = "THE_PREREQUISITE_FOR_THIS_QUEST_IS_RECRUITING",
								export = true,
								text = {
									en = "The prerequisite for this quest is recruiting your class's first two champions, doing your first short mission, and recruiting your first troops.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此任务的前提条件是招募你职业的前两名勇士、完成你的第一个短任务，并招募你的第一批部队。",
									-- TODO: tw = "",
								},
							}),	-- i also sent out my first 1-hour mission after the 2-minute one, not sure if that's required. not sure whether paladin's requirements are different, so i didn't add the description to their version of the quest.
							["provider"] = { "n", 90417 },	-- Archmage Khadgar
							["coord"] = { 28.9, 48.4, LEGION_DALARAN },
							["classes"] = exclude(PALADIN, ALL_CLASSES),
							["groups"] = { i(140574) },	-- Mysterious Lightbound Object (QI!)
						}),
						q(44257, {	-- A Falling Star (Paladin)
							["sourceQuests"] = { 42866 },	-- A Sign From The Sky
							["provider"] = { "n", 90417 },	-- Archmage Khadgar
							["coord"] = { 28.9, 48.4, LEGION_DALARAN },
							["classes"] = { PALADIN },
							["groups"] = { i(140574) },	-- Mysterious Lightbound Object (QI!)
						}),
						q(44004, {	-- Bringer of the Light
							["description"] = createLocalizationString({
								readable = "This quest sends you to a scenario involving The Exodar and Prophet Velen. Before you kill the final boss, make sure to do everything contained within!",
								constant = "THIS_QUEST_SENDS_YOU_TO_A_SCENARIO_INVOLVING",
								export = true,
								text = {
									en = "This quest sends you to a scenario involving The Exodar and Prophet Velen. Before you kill the final boss, make sure to do everything contained within!",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此任务会把你送入一个涉及埃索达和先知维伦的场景战役。在击杀最终首领之前，请务必完成场景内的所有内容！",
									-- TODO: tw = "",
								},
							}),
							["sourceQuests"] = {
								44009,	-- A Falling Star (non-Paladin version)
								44257,	-- A Falling Star (Paladin version)
							},
							["provider"] = { "n", 112130 },	-- Archmage Khadgar
							["coord"] = { 27.5, 35.8, AEGWYNNS_GALLERY },
							["maps"] = { 775, 776 },	-- Scenario: In Defense of the Exodar
							["groups"] = {
								i(140319),	-- Khadgar's Beacon (QI!)
								--
								i(140614),	-- Amice of Steadfast Allies
								i(140616),	-- Annihilator's Mantle
								i(140613),	-- Bracers of Lost Lineage
								i(140612),	-- Bracers of the Fallen
								i(140611),	-- Fel Commander's Vambraces
								i(140615),	-- Felstalking Shoulders
								i(140617),	-- Rakeesh's Pauldron
								i(140610),	-- Wristwraps of the Grieving Prophet
								n(110486, {	-- Huk'roth the Huntmaster
									["altQuests"] = { 44004 },	-- Bringer of the Light
									["questID"] = 43480,
									-- #IF AFTER 11.2.5
									["isDaily"] = true,	-- Daily during Legion Remix 2025, and thereafter
									-- #endif
									["groups"] = {
										i(140533),	-- Huntmaster's Injector
									},
								}),
								q(43705, {	-- Nobundo's Last Stand
									["description"] = createLocalizationString({
										readable = "This quest can only be completed during the \"In Defense of the Exodar\" scenario. If you want to complete this optional quest, you MUST pick it up before completing the Step 2 objectives (Portals and Terrified Citizens) or else it will not be available!",
										constant = "THIS_QUEST_CAN_ONLY_BE_COMPLETED_DURING_THE_IN",
										export = true,
										text = {
											en = "This quest can only be completed during the \"In Defense of the Exodar\" scenario. If you want to complete this optional quest, you MUST pick it up before completing the Step 2 objectives (Portals and Terrified Citizens) or else it will not be available!",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "此任务只能在“保卫埃索达”场景战役期间完成。如果你想完成这个可选任务，必须在完成第 2 步目标（传送门和受惊的市民）之前接取它，否则它将不再可用！",
											-- TODO: tw = "",
										},
									}),
									["altQuests"] = { 44004 },	-- Bringer of the Light
									["provider"] = { "n", 110695 },	-- Farseer Nobundo
									["coord"] = { 44.9, 9.3, 775 },	-- The Exodar
									["groups"] = {
										i(140608),	-- Boots of the Broken
										i(140604),	-- Britches of Elemental Protection
										i(140606),	-- Earth-Crushing Sabatons
										i(140602),	-- Earth-Plate Legguards
										i(140605),	-- Earthmender's Pantaloons
										i(140607),	-- Elementally Infused Boots
										i(140603),	-- Nobundo's Earthshaper Kilt
										i(140609),	-- Slippers of the Earthen Healer
									},
								}),
								q(43483),	-- Fel Annihilation, unavailable afterwards
							},
						}),
						q(44153, {	-- Light's Charge
							["sourceQuest"] = 44004,	-- Bringer of the Light
							["provider"] = { "n", 90417 },	-- Archmage Khadgar
							["coord"] = { 28.7, 48.5, LEGION_DALARAN },
							["groups"] = { i(140763) },	-- Light's Heart (QI!)
						}),
						q(44337, {	-- Goddess Watch Over You
							["description"] = createLocalizationString({
								readable = "There are two versions of this quest: One for players that have already finished the quest chain to recover the Tears of Elune and one for those that haven't yet.\n\nThis one is for players that have.",
								constant = "THERE_ARE_TWO_VERSIONS_OF_THIS_QUEST_ONE_FOR",
								export = true,
								text = {
									en = "There are two versions of this quest: One for players that have already finished the quest chain to recover the Tears of Elune and one for those that haven't yet.\n\nThis one is for players that have.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这个任务有两个版本：一个面向已完成夺回艾露恩之泪任务链的玩家，另一个面向尚未完成的玩家。\n\n这个是面向已完成的玩家的。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44153,	-- Light's Charge
							["provider"] = { "n", 113686 },	-- Archmage Khadgar
						}),
						q(44338, {	-- Goddess Watch Over You
							["description"] = createLocalizationString({
								readable = "There are two versions of this quest: One for players that have already finished the quest chain to recover the Tears of Elune and one for those that haven't yet.\n\nThis one is for players that haven't.",
								constant = "THERE_ARE_TWO_VERSIONS_OF_THIS_QUEST_ONE_FOR_2",
								export = true,
								text = {
									en = "There are two versions of this quest: One for players that have already finished the quest chain to recover the Tears of Elune and one for those that haven't yet.\n\nThis one is for players that haven't.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这个任务有两个版本：一个面向已完成夺回艾露恩之泪任务链的玩家，另一个面向尚未完成的玩家。\n\n这个是面向尚未完成的玩家的。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44153,	-- Light's Charge
							["provider"] = { "n", 113686 },	-- Archmage Khadgar
						}),
						q(44448, {	-- In the House of Light and Shadow
							["sourceQuests"] = {
								40890,	-- The Tears of Elune (actually required to complete Goddess Watch Over You)
								44337,	-- Goddess Watch Over You (if you completed Val'sharah)
								44338,	-- Goddess Watch Over You (if you didn't complete Val'sharah)
							},
							["provider"] = { "n", 90417 },	-- Archmage Khadgar
							["coord"] = { 28.9, 48.4, LEGION_DALARAN },
							["groups"] = { i(141351) },	-- Tear of Elune (QI!)
						}),
						q(44464, {	-- Awakenings
							["sourceQuest"] = 44448,	-- In the House of Light and Shadow
							["provider"] = { "n", 113857 },	-- Light's Heart
						}),
						q(44466, {	-- An Unclear Path
							["sourceQuest"] = 44464,	-- Awakenings
							["provider"] = { "n", 113857 },	-- Light's Heart
						}),
						q(44479, {	-- Ravencrest's Legacy
							["description"] = createLocalizationString({
								readable = "This quest sends you to a scenario involving Kur'talos Ravencrest, Illidan Stormrage, and the ill-fated Moonguard. Before you kill the final boss, make sure to do everything contained within!",
								constant = "THIS_QUEST_SENDS_YOU_TO_A_SCENARIO_INVOLVING_2",
								export = true,
								text = {
									en = "This quest sends you to a scenario involving Kur'talos Ravencrest, Illidan Stormrage, and the ill-fated Moonguard. Before you kill the final boss, make sure to do everything contained within!",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此任务会把你送入一个涉及库塔洛斯·拉文凯斯、伊利丹·怒风和命运多舛的月卫的场景战役。在击杀最终首领之前，请务必完成场景内的所有内容！",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44466,	-- An Unclear Path
							["provider"] = { "n", 113857 },	-- Light's Heart
							["maps"] = { 793 },	-- Scenario: Black Rook Hold
							["groups"] = {
								q(44414, {	-- Felspawns of Lothros
									["description"] = createLocalizationString({
										readable = "This quest can only be completed while in the Ravencrest's Legacy scenario.",
										constant = "THIS_QUEST_CAN_ONLY_BE_COMPLETED_WHILE_IN_THE",
										export = true,
										text = {
											en = "This quest can only be completed while in the Ravencrest's Legacy scenario.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "此任务只能在“雷文凯斯的遗产”场景战役中完成。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuest"] = 44479,	-- Ravencrest's Legacy
									["altQuests"] = { 44479 },	-- Ravencrest's Legacy
									["qgs"] = {
										113361,	-- Captain Jarod Shadowsong
										113829,	-- Captain Jarod Shadowsong
									},
									["coord"] = { 38.7, 53.1, 793 },	-- Scenario: Black Rook Hold
								}),
								q(44415, {	-- The Red Axe
									["description"] = "~L.THIS_QUEST_CAN_ONLY_BE_COMPLETED_WHILE_IN_THE",
									["sourceQuest"] = 44414,	-- Felspawns of Lothros
									["altQuests"] = { 44479 },	-- Ravencrest's Legacy
									["qgs"] = {
										113361,	-- Captain Jarod Shadowsong
										113829,	-- Captain Jarod Shadowsong
									},
									["coord"] = { 40.4, 53.0, 793 },	-- Scenario: Black Rook Hold
								}),
								q(44416, {	-- Hunter of Night
									["description"] = "~L.THIS_QUEST_CAN_ONLY_BE_COMPLETED_WHILE_IN_THE",
									["sourceQuest"] = 44415,	-- The Red Axe
									["altQuests"] = { 44479 },	-- Ravencrest's Legacy
									["provider"] = { "n", 113355 },	-- Broxigar the Red
									["coord"] = { 43.8, 50.3, 793 },	-- Scenario: Black Rook Hold
									["groups"] = {
										i(139932),	-- Belt of Shadowsong
										i(140002),	-- Broxigar's Girdle
										i(139902),	-- Defiler's Cord
										i(139962),	-- Pit Lord's Chain
										i(121802),	-- Ring of the Displaced Mage
									},
								}),
								i(139994),	-- Breastplate of the Guard
								i(139903),	-- Felblaze Handwraps
								i(139942),	-- Felspawn Gloves
								i(139954),	-- Moon Guard Robes
								i(139984),	-- Ravencrest Chainmail
								i(139920),	-- Robes of Elune
								i(139995),	-- Siegebreaker's Gauntlets
								i(139963),	-- Skyguard Grips
							},
						}),
						q(44480, {	-- In My Father's House
							["sourceQuest"] = 44479,	-- Ravencrest's Legacy
							["provider"] = { "n", 113857 },	-- Light's Heart
							["groups"] = { i(249230, { ["timeline"] = { ADDED_LEGION_REMIX, REMOVED_LEGION_REMIX_END }}) },	-- Temple of Zin-Malor Scroll (QI!)
						}),
						q(44496, {	-- Destiny Unfulfilled
							["description"] = createLocalizationString({
								readable = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for players that haven't killed him.",
								constant = "THERE_ARE_THREE_VERSIONS_OF_THIS_QUEST_ONE_FOR",
								export = true,
								text = {
									en = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for players that haven't killed him.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这个任务有三个版本：一个面向恶魔猎手，一个面向已在黑暗神殿击败伊利丹的玩家，还有一个面向前者之外的玩家。\n\n这个是面向尚未击杀他的玩家的。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44480,	-- In My Father's House
							["groups"] = {
								i(249229, { ["timeline"] = { ADDED_LEGION_REMIX, REMOVED_LEGION_REMIX_END }}),	-- Black Temple Scroll (QI!)
								i(121745),	-- Helm of the Betrayed
								i(139909),	-- Illidari High Lord's Cowl
								i(140005),	-- Impenetrable Faceplate
								i(139946),	-- Purified Vision of Sargeras
							},
						}),
						q(44497, {	-- Destiny Unfulfilled
							["description"] = createLocalizationString({
								readable = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for Hunters and Demon Hunters only.",
								constant = "THERE_ARE_THREE_VERSIONS_OF_THIS_QUEST_ONE_FOR_2",
								export = true,
								text = {
									en = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for Hunters and Demon Hunters only.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这个任务有三个版本：一个面向恶魔猎手，一个面向已在黑暗神殿击败伊利丹的玩家，还有一个面向前者之外的玩家。\n\n这个版本仅限猎人和恶魔猎手。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44480,	-- In My Father's House
							["provider"] = { "n", 113857 },	-- Light's Heart
							["classes"] = { HUNTER, DEMONHUNTER },
							["groups"] = {
								i(249229, { ["timeline"] = { ADDED_LEGION_REMIX, REMOVED_LEGION_REMIX_END }}),	-- Black Temple Scroll (QI!)
								i(121745),	-- Helm of the Betrayed
								i(139909),	-- Illidari High Lord's Cowl
								i(140005),	-- Impenetrable Faceplate
								i(139946),	-- Purified Vision of Sargeras
							},
						}),
						q(44481, {	-- Destiny Unfulfilled
							["description"] = createLocalizationString({
								readable = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for players that have defeated him.",
								constant = "THERE_ARE_THREE_VERSIONS_OF_THIS_QUEST_ONE_FOR_3",
								export = true,
								text = {
									en = "There are three versions of this quest: One for Demon Hunters, one for players that have defeated Illidan in the Black Temple, and one for players that haven't.\n\nThis one is for players that have defeated him.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这个任务有三个版本：一个面向恶魔猎手，一个面向已在黑暗神殿击败伊利丹的玩家，还有一个面向前者之外的玩家。\n\n这个是面向已经击败他的玩家的。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuest"] = 44480,	-- In My Father's House
							["provider"] = { "n", 113857 },	-- Light's Heart
							["groups"] = {
								i(249229, { ["timeline"] = { ADDED_LEGION_REMIX, REMOVED_LEGION_REMIX_END }}),	-- Black Temple Scroll (QI!)
								i(121745),	-- Helm of the Betrayed
								i(139909),	-- Illidari High Lord's Cowl
								i(140005),	-- Impenetrable Faceplate
								i(139946),	-- Purified Vision of Sargeras
							},
						}),
						q(45174, {	-- The Hunt for Illidan Stormrage
							["sourceQuests"] = { 44496, 44497, 44481 },	-- Destiny Unfulfilled (any of the three)
							["provider"] = { "n", 113857 },	-- Light's Heart
						}),
						q(45175, {	-- Soul Prism of the Illidari
							["sourceQuest"] = 45174,	-- The Hunt for Illidan Stormrage
							["provider"] = { "n", 89398 },	-- Allari the Souleater <Illidari>
							["coord"] = { 43.3, 43.2, AZSUNA },
							["groups"] = {
								i(139930),	-- Belt of the Netherwalker
								i(139978),	-- Boots of the Illidari Crusade
								i(139933),	-- Footpads of the Illidari Crusade
								i(140000),	-- Girdle of the Nethertouched
								i(139900),	-- Nethertether Cord
								i(139960),	-- Netherwrested Chain Belt
								i(140014),	-- Sabatons of the Illidari Crusade
								i(139921),	-- Slippers of the Illidari Crusade
							},
						}),
						q(45176, {	-- Trial of Valor: The Once and Future Lord of Shadows
							["sourceQuest"] = 45175,	-- Soul Prism of the Illidari
							["provider"] = { "n", 89398 },	-- Allari the Souleater <Illidari>
							["coord"] = { 43.3, 43.2, AZSUNA },
							["maps"] = { 703, 704, 705 },	-- Halls of Valor
							["groups"] = {
								i(143661),	-- Soul Prism of the Illidari (QI!)
								i(139988),	-- Blazing Purpose Mantle
								i(140021),	-- Crusader's Inferno Pauldrons
								i(139941),	-- Gloves of the Shadow's Return
								i(139964),	-- Grips of Death's Grasp
								i(139904),	-- Handwraps of Soulwringing
								i(139958),	-- Inferno's March Shoulderpads
								i(139928),	-- Netherworld's March Amice
								i(139996),	-- The Soulbinder's Gauntlets
							},
						}),
						q(45177, {	-- The Nighthold
							["sourceQuest"] = 45176,	-- Trial of Valor: The Once and Future Lord of Shadows
							["provider"] = { "n", 113857 },	-- Light's Heart
							["maps"] = { 764, 765, 766, 767, 768, 769, 770, 771, 772 },	-- The Nighthold
						}),
					},
				}),
				header(HEADERS.Item, 135479, bubbleDownSelf({ ["timeline"] = { ADDED_7_2_5 } }, {	-- Lost Mail
					o(247797, {	-- Lost Mail
						["maps"] = {
							LEGION_DALARAN, LEGION_THE_UNDERBELLY, AEGWYNNS_GALLERY,
						},
						["groups"] = {
							i(134859),	-- Lost Mail
						},
					}),
					q(41368, {	-- Lost Mail
						["description"] = createLocalizationString({
							readable = "To get this quest, you must find a small envelope near a mailbox in Broken Isles Dalaran. It can spawn in multiple places and has a long respawn timer. If you don't want to wait, you can try to find Lost Mail for sale on the Auction House.",
							constant = "TO_GET_THIS_QUEST_YOU_MUST_FIND_A_SMALL",
							export = true,
							text = {
								en = "To get this quest, you must find a small envelope near a mailbox in Broken Isles Dalaran. It can spawn in multiple places and has a long respawn timer. If you don't want to wait, you can try to find Lost Mail for sale on the Auction House.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "要获得此任务，你必须在破碎群岛达拉然的邮箱附近找到一个小信封。它可能在多个位置刷新，且刷新时间很长。如果你不想等，可以尝试在拍卖行购买失落的信件。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 134859 },	-- Lost Mail
					}),
					q(41411, {	-- Lost Mail
						["description"] = createLocalizationString({
							readable = "If you don't want to camp out to start the questline, you can try to find Lost Mail for sale on the Auction House. (Players who complete the questline will get a piece of mail that can be traded or sold.)",
							constant = "IF_YOU_DON_T_WANT_TO_CAMP_OUT_TO_START_THE",
							export = true,
							text = {
								en = "If you don't want to camp out to start the questline, you can try to find Lost Mail for sale on the Auction House. (Players who complete the questline will get a piece of mail that can be traded or sold.)",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "如果你不想蹲守来开启任务线，你可以试着在拍卖行购买失落的邮件。（完成该任务线的玩家会获得一封可以交易或出售的邮件。）",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 135479 },	-- Lost Mail
					}),
					q(46278, {	-- Return to Sender
						["description"] = createLocalizationString({
							readable = "After turning in the Lost Mail to Madam Goya in the Underbelly, you'll receive a letter from the Postmaster instructing you to report for duty!  Use the Mail Tube at the coordinates provided to head down to the mail room.",
							constant = "AFTER_TURNING_IN_THE_LOST_MAIL_TO_MADAM_GOYA_IN",
							export = true,
							text = {
								en = "After turning in the Lost Mail to Madam Goya in the Underbelly, you'll receive a letter from the Postmaster instructing you to report for duty!  Use the Mail Tube at the coordinates provided to head down to the mail room.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在达拉然下水道把遗失的邮件交给郭雅夫人后，你会收到一封来自邮差的信，指示你前去报到！使用所提供坐标处的邮件管道前往下方的邮件室。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 41368, 41411 },	-- Lost Mail
						["provider"] = { "n", 103976 },	-- The Postmaster
						["coord"] = { 33.0, 31.7, LEGION_DALARAN },
					}),
					q(41397, {	-- A Huge Package
						["sourceQuests"] = { 46278 },	-- Return to Sender
						["provider"] = { "n", 103976 },	-- The Postmaster
						["coord"] = { 38.6, 40.8, LEGION_DALARAN },
					}),
					q(41367, {	-- Priority Delivery
						["sourceQuests"] = { 41397 },	-- A Huge Package
						["provider"] = { "n", 103976 },	-- The Postmaster
						["coord"] = { 38.6, 40.8, LEGION_DALARAN },
						["maps"] = { 701 },	-- Icecrown Citadel (scenario version)
						["groups"] = {
							i(134857),	-- Invincible's Reins (QI!)
						},
					}),
					q(41394, {	-- Service with a Smile
						["sourceQuests"] = { 41367 },	-- Priority Delivery
						["provider"] = { "n", 52562 },	-- Johnny Awesome
						["coord"] = { 68.6, 73.1, FERALAS },
						["groups"] = {
							i(135464),	-- Bulging Sack of Gold (QI!)
							i(135463),	-- Invincible's Reins (QI!)
						},
					}),
					q(41395, {	-- Due Reward
						["sourceQuests"] = { 41394 },	-- Service with a Smile
						["provider"] = { "n", 52562 },	-- Johnny Awesome
						["coord"] = { 68.6, 73.1, FERALAS },
					}),
					q(50247, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_5 } }, {	-- The Mail Must Flow
						["description"] = createLocalizationString({
							readable = "After you finish performing menial tasks for Johnny Awesome, you'll receive another letter from the Postmaster requesting your presence in the mail room.",
							constant = "AFTER_YOU_FINISH_PERFORMING_MENIAL_TASKS_FOR",
							export = true,
							text = {
								en = "After you finish performing menial tasks for Johnny Awesome, you'll receive another letter from the Postmaster requesting your presence in the mail room.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "为乔尼·了不起完成杂活后，你会收到邮差寄来的另一封信，要求你前往邮件室。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 41395 },	-- Due Reward
						["provider"] = { "n", 103976 },	-- The Postmaster
						["groups"] = {
							ach(12416),	-- The Total Package
						},
					})),
					ach(12431, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_5 } }, {	-- Post Haste
						["sourceQuests"] = { 50247 },	-- The Mail Must Flow
						["description"] = createLocalizationString({
							readable = "Once you've done the last quest, you can speak to the Postmaster again to offer more assistance sorting letters.",
							constant = "ONCE_YOU_VE_DONE_THE_LAST_QUEST_YOU_CAN_SPEAK",
							export = true,
							text = {
								en = "Once you've done the last quest, you can speak to the Postmaster again to offer more assistance sorting letters.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "完成最后一个任务后，你可以再次与邮政长交谈，提供更多分拣信件的帮助。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(156721),	-- Mailemental (PET!)
							i(156836, {	-- Bulging Package
								i(156833),	-- Katy's Stampwhistle (TOY!)
								i(135479),	-- Lost Mail
							}),
						},
					})),
					ach(12439, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_5 } }, {	-- Priority Mail
						["sourceQuests"] = { 50247 },	-- The Mail Must Flow
						["description"] = "~L.ONCE_YOU_VE_DONE_THE_LAST_QUEST_YOU_CAN_SPEAK",
						["groups"] = {
							title(372),	-- Postmaster <Name>
						},
					})),
				})),
			},
		}),
	}),
});

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3 } }, {
	m(BROKEN_ISLES, {
		n(QUESTS, {
			q(43511),	-- Kalec Arrives - triggered when turning in "The Power Within" at Azurewing Repose (starting Balance of Power)
			q(43775),	-- Kalec Arrives - triggered when completing Seeking the Valkyra (40603) in the Balance of Power questline
			q(40627),	-- Triggers after looting heart for Halls of Valor: Odyn's Blessing (40615) in the Balance of Power questline
			q(43529),	-- Triggered when turning in Preparing to Move (43898) in the Balance of Power questline
		}),
	}),
})));
