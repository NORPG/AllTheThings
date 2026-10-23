---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(SHADOWLANDS, ARDENWEALD, {
	timeline = { ADDED_9_0_2_LAUNCH },
	groups = {
		n(FACTIONS, {
			header(HEADERS.Faction, FACTION_THE_WILD_HUNT, {
				faction(FACTION_THE_WILD_HUNT),
				n(ACHIEVEMENTS, {
					achWithRep(14337, FACTION_THE_WILD_HUNT),	-- The Wild Hunt
				}),
				n(EMISSARY_QUESTS, {
					q(62852, {	-- Paragon of the Wild Hunt
						provider = { "n", 158556 },	-- Aithlyn <Wild Hunt Quartermaster>
						coord = { 48.4, 50.4, ARDENWEALD },
						minReputation = { FACTION_THE_WILD_HUNT, EXALTED },
					}),
					q(61098, {	-- Supplies from The Wild Hunt
						provider = { "n", 158556 },	-- Aithlyn <Wild Hunt Quartermaster>
						coord = { 48.4, 50.4, ARDENWEALD },
						minReputation = { FACTION_THE_WILD_HUNT, EXALTED },
						repeatable = true,
						groups = {
							i(180649, {	-- Wild Hunt Supplies
								i(180635),	-- Hungry Burrower (PET!)
								i(183800),	-- Amber Ardenmoth (MOUNT!)
								i(187870, {timeline = { ADDED_9_1_5 }}),	-- Porcupine Soul (SS!)
								i(185054, {timeline = { ADDED_9_1_5 }}),	-- Mammoth Soul (SS!)
							}),
						},
					}),
				}),
				n(VENDORS, {
					n(158556, {	-- Aithlyn <Wild Hunt Quartermaster>
						coords = {
							{ 48.4, 50.4, ARDENWEALD },
							{ 59.6, 31.8, THE_TRUNK },	-- Heart of the Forest
						},
						groups = bubbleDownClassicRep(FACTION_THE_WILD_HUNT, {
							{		-- Neutral
								i(190644, {	-- Vessel of Profound Possibilities (CI!)
									sourceAchievement = 14834,	-- Bound with Purpose
									cost = { { "c", 2009, 10000 } },	-- 10,000 Cosmic Flux
									timeline = { ADDED_9_2_0 },
									sym = SYM.SHADOWLANDS.ALL_CONDUITS,
								}),
							}, {	-- Friendly
								i(283265, {	-- Fae Lantern Blossom (DECOR!)
									cost = { { "c", ANIMA, 200 } },
									timeline = { ADDED_12_1_5 },
								}),
								i(180641, { cost = { { "i", POLISHED_PET_CHARM, 250 } } }),	-- Floofa (PET!)
								i(283376, {	-- Leaning Wildgrove Tree (DECOR!)
									cost = { { "c", ANIMA, 500 } },
									timeline = { ADDED_12_1_5 },
								}),
							}, {	-- Honored
								i(283271, {	-- Blooming Celestial Dreamleaf (DECOR!)
									cost = { { "c", ANIMA, 200 } },
									timeline = { ADDED_12_1_5 },
								}),
								n(NIGHT_FAE, sharedData({customCollect = "SL_COV_NFA" }, {
									i(182168, { cost = { { "c", ANIMA, 1500 } } }),	-- Crane Soul (SS!)
								})),
								i(183096),	-- Formula: Sacred Shard (RECIPE!)
								i(184754),	-- Glitterwing Scarf
								i(217588, {	-- Glyph of Blessing of the Seasons
									classes = { PALADIN },
									timeline = { ADDED_10_2_6 },
								}),
								i(217585, {	-- Glyph of Convoke the Spirits
									classes = { DRUID },
									timeline = { ADDED_10_2_6 },
								}),
								i(217494, {	-- Glyph of Faeline Stomp
									classes = { MONK },
									timeline = { ADDED_10_2_6 },
								}),
								i(217583, {	-- Glyph of Sepsis
									classes = { ROGUE },
									timeline = { ADDED_10_2_6 },
								}),
								i(217594, {	-- Glyph of Shifting Power
									classes = { MAGE },
									timeline = { ADDED_10_2_6 },
								}),
								i(217600, {	-- Glyph of Soul Rot
									classes = { WARLOCK },
									timeline = { ADDED_10_2_6 },
								}),
								i(217590, {	-- Glyph of the Hunt
									classes = { DEMONHUNTER },
									timeline = { ADDED_10_2_6 },
								}),
								i(283345, {	-- Hanging Wildseed (DECOR!)
									cost = { { "c", ANIMA, 200 } },
									timeline = { ADDED_12_1_5 },
								}),
								i(183100),	-- Pattern: Heavy Desolate Armor Kit (RECIPE!)
							}, {	-- Revered
								i(283283, {	-- Fae Moonbough Cocoon (DECOR!)
									cost = { { "c", ANIMA, 500 } },
									timeline = { ADDED_12_1_5 },
								}),
								n(NIGHT_FAE, sharedData({customCollect = "SL_COV_NFA" }, {
									i(181309, { cost = { { "c", ANIMA, 3500 } } }),	-- Faewoven Pack
								})),
								i(184747),	-- Gamekeeper's Slippers
								i(184749),	-- Gametender's Bramblewards
								i(184746),	-- Gametender's Muckstompers
								i(184748),	-- Gametender's Wading Boots
								i(183242),	-- Memory of Eonar
								i(183106),	-- Recipe: Eternal Cauldron (RECIPE!)
								i(283275, {	-- Small Shimmering Moonvine (DECOR!)
									cost = { { "c", ANIMA, 200 } },
									timeline = { ADDED_12_1_5 },
								}),
								i(183093),	-- Technique: Contract: The Wild Hunt (RECIPE!)
								i(187883, { timeline = { ADDED_9_1_5 } }),	-- Technique: Mark of the Twilight Runestag (RECIPE!)
							}, {	-- Exalted
								i(184750),	-- Amber-Plated Legguards
								i(184751),	-- Cycle-Tender's Pantaloons
								i(180729),	-- Duskflutter Ardenmoth (MOUNT!)
								i(283370, {	-- Fae Moonbough Gate (DECOR!)
									cost = { { "c", ANIMA, 650 } },
									timeline = { ADDED_12_1_5 },
								}),
								i(184752),	-- Gormscale Leggings
								i(183134),	-- Illusion: Hunt's Favor (ILLUSION!)
								i(178336),	-- Tabard of the Wild Hunt
								i(184753),	-- Tree-Scaler's Britches
							},
						}),
					}),
				}),
			}),
		}),
	},
});
