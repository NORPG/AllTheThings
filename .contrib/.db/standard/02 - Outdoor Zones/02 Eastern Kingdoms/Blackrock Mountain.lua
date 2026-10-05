---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(EASTERN_KINGDOMS, {
	m(BLACKROCK_MOUNTAIN, {
		["lore"] = "Blackrock Mountain is a zone between the Burning Steppes and the Searing Gorge, linking the two regions. This zone is deceptively small and appears empty when first entered - however, it is among the most dangerous places in Azeroth. It was hotly contested between the forces of Ragnaros and his Dark Iron servants on one side and the black dragon Nefarian and his orc minions on the other. This is one of the most important areas in World of Warcraft lore.",
		-- #if BEFORE MOP
		["zone-text-areaID"] = 25,	-- Blackrock Mountain (mapID doesn't exist for a couple expansions)
		-- #endif
		["icon"] = 254649,
		["maps"] = {
			BLACKROCK_MOUNTAIN_LEVEL2,	-- Blackrock Caverns
			BLACKROCK_MOUNTAIN_LEVEL3,	-- Blackrock Depths
		},
		["lvl"] = 40,
		["groups"] = {
			n(RARES, {
				n(50839, {	-- Chromehound
					["coords"] = {
						{ 47.4, 36.0, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 62.0, 44.8, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 36.0, 49.6, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 44.6, 75.0, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 56.2, 76.0, BLACKROCK_MOUNTAIN_LEVEL3 },
					},
					["timeline"] = { ADDED_5_1_0 },
				}),
				n(51066, {	-- Crystalfang
					["coord"] = { 34.0, 20.0, BLACKROCK_MOUNTAIN_LEVEL3 },
					["timeline"] = { ADDED_5_2_0 },
				}),
				n(9026, {	-- Overmaster Pyron
					["coords"] = {
						{ 36.2, 36.2, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 40.6, 37.8, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 37.0, 28.2, BLACKROCK_MOUNTAIN_LEVEL3 },
					},
					["groups"] = {
						i(14486),	-- Pattern: Cloak of Fire (RECIPE!)
					},
				}),
				n(9046, {	-- Scarshield Quartermaster <Scarshield Legion>
					["description"] = createLocalizationString({
						readable = "This used to be a simple Rare Creature with a limited loot table. He was later repurposed for use with the BWL Attunement Quest Chain. The two items listed below were never available in WoW Classic.",
						constant = "THIS_USED_TO_BE_A_SIMPLE_RARE_CREATURE_WITH_A",
						export = true,
						text = {
							en = "This used to be a simple Rare Creature with a limited loot table. He was later repurposed for use with the BWL Attunement Quest Chain. The two items listed below were never available in WoW Classic.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这曾经只是一个掉落列表有限的普通稀有生物。后来它被改用于黑翼之巢门任务链。下面列出的两件物品在魔兽世界经典旧世中从未开放。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(13254, {	-- Astral Guard
							["timeline"] = { REMOVED_1_6_0, ADDED_10_1_7 },
						}),
						i(13248, {	-- Burstshot Harquebus
							["timeline"] = { REMOVED_1_6_0, ADDED_10_1_7 },
						}),
						i(18987, {	-- Blackhand's Command
							["timeline"] = { REMOVED_6_0_3 },
						}),
					},
				}),
				n(8924, {	-- The Behemoth
					["coords"] = {
						{ 37.8, 61.3, BLACKROCK_MOUNTAIN_LEVEL3 },
						{ 47.6, 62.0, BLACKROCK_MOUNTAIN_LEVEL3 },
					},
					["groups"] = {
						applyclassicphase(PHASE_THREE_DMF_CARDS, i(19259)),	-- Two of Warlords
						i(11603),	-- Vilerend Slicer
					},
				}),
			}),
			n(SPECIAL, {
				hqt(53656, {	-- Speak to Wan'be in Blackrock Mountain
					["name"] = "Speak to Wan'be in Blackrock Mountain",
					["sourceQuest"] = 53655,	-- Speak to Wan'be underwater at Fizzle and Pozzik's Speedway
					["qg"] = 143129,	-- Wan'be <The Explorer>
					["qi"] = 163213,	-- Ghostly Explorer's Skull
					["coord"] = { 66.1, 96.6, BLACKROCK_MOUNTAIN_LEVEL3 },
					["races"] = HORDE_ONLY,
					["timeline"] = { ADDED_8_0_1 },
				}),
				n(16033, {	-- Bodley
					["coord"] = { 63.1, 44.4, BLACKROCK_MOUNTAIN },
					["provider"] = { "i", 22115 },	-- Extra-Dimensional Ghost Revealer
					["groups"] = {
						n(SPECIAL, {
							["description"] = "~L.AVAILABLE_IF_A_SPECIFIC_QUEST_8996_HAS_BEEN",
							["sourceQuest"] = 8996,	-- Return to Bodley
							["timeline"] = { ADDED_1_11_1, REMOVED_4_0_3 },
							["u_sqs"] = true,	-- remove the u flag if sourcequests are completed
							["groups"] = {
								i(22057),	-- Brazier of Invocation
							},
						}),
					},
				}),
			}),
			-- #if SEASON_OF_DISCOVERY
			n(TREASURES, {
				applyclassicphase(SOD_PHASE_FOUR, i(226694, {	-- Rune of Defense Specialization
					["description"] = createLocalizationString({
						readable = "1. Head to the South end of Searing Gorge and enter Blackrock Mountain.\n2. As you enter the main chamber, head left down the circular pathway.\n3. When you come to the meeting stone for Lower Blackrock Spire, turn left and head up the hallway.\n4. Watch out for level 54-ish creatures and take the first right in to a small room.\n5. You will see two copies of the book laying on the floor.\n*One is next to a pair of creatures. Another is in a small nook where you may safely loot the book without pulling aggro.",
						constant = "1_HEAD_TO_THE_SOUTH_END_OF_SEARING_GORGE_AND",
						export = true,
						text = {
							en = "1. Head to the South end of Searing Gorge and enter Blackrock Mountain.\n2. As you enter the main chamber, head left down the circular pathway.\n3. When you come to the meeting stone for Lower Blackrock Spire, turn left and head up the hallway.\n4. Watch out for level 54-ish creatures and take the first right in to a small room.\n5. You will see two copies of the book laying on the floor.\n*One is next to a pair of creatures. Another is in a small nook where you may safely loot the book without pulling aggro.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "1. 前往灼热峡谷的南端，进入黑石山。\n2. 进入主厅后，沿环形通道向左下方走。\n3. 当你来到黑石塔下层的集合石处时，向左转，沿走廊向上走。\n4. 小心 54 级左右的生物，在第一个路口右转进入一个小房间。\n5. 你会看到两本放在地上的同一本书。\n*一本在一对生物旁边。另一本在一个小凹室里，你可以在那里安全地拾取它而不会引到仇恨。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 457099 },	-- Zirene's Guide to Getting Punched
					["timeline"] = { ADDED_1_15_3 },
					["classes"] = { WARRIOR, PALADIN, ROGUE, SHAMAN, WARLOCK, DRUID },
					["groups"] = {
						recipe(459313, {	-- Engrave Ring - Defense Specialization
							["classes"] = { WARRIOR, PALADIN, ROGUE, SHAMAN, WARLOCK, DRUID },
						}),
					},
				})),
			}),
			-- #endif
		},
	}),
}));
