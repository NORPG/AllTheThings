---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(HIGHMOUNTAIN, {
			petbattle(filter(BATTLE_PETS, {
				["sym"] = {{"select","speciesID",
					487,	-- Alpine Chipmunk (PET!)
					407,	-- Forest Spiderling (PET!)
					391,	-- Mountain Cottontail (PET!)
					1441,	-- Mud Jumper (PET!)
					378,	-- Rabbit (PET!)
					417,	-- Rat (PET!)
					496,	-- Rusty Snail (PET!)
					379,	-- Squirrel (PET!)
					1590,	-- Swamplighter Firefly (PET!)
				}},
				["groups"] = {
					pet(1743),	-- Black-Footed Fox Kit (PET!)
					pet(1726, {	-- Burrow Spiderling (PET!)
						["description"] = createLocalizationString({
							readable = "Found inside Neltharion's Vault. Coord is entrance.",
							constant = "FOUND_INSIDE_NELTHARION_S_VAULT_COORD_IS",
							export = true,
							text = {
								en = "Found inside Neltharion's Vault. Coord is entrance.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于奈萨里奥的宝库内。坐标是入口位置。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 44.6, 72.4, HIGHMOUNTAIN },
					}),
					pet(1775, {	-- Coralback Fiddler (PET!)
						["description"] = createLocalizationString({
							readable = "Found on the northern coastline of Highmountain.",
							constant = "FOUND_ON_THE_NORTHERN_COASTLINE_OF_HIGHMOUNTAIN",
							export = true,
							text = {
								en = "Found on the northern coastline of Highmountain.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在至高岭北部海岸线找到。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(1761, {	-- Echo Batling (PET!)
						["description"] = createLocalizationString({
							readable = "Found in Rockcrawler Chasm and Mucksnout Den. Something is making the critter form of this pet unattackable, so this pet may be hard to come across.",
							constant = "FOUND_IN_ROCKCRAWLER_CHASM_AND_MUCKSNOUT_DEN",
							export = true,
							text = {
								en = "Found in Rockcrawler Chasm and Mucksnout Den. Something is making the critter form of this pet unattackable, so this pet may be hard to come across.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于岩爬者裂谷和泥鼻兽穴。有某种原因使这只宠物的野生小动物形态无法被攻击，因此这只宠物可能很难遇到。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(1731, {	-- Felspider (PET!)
						["description"] = createLocalizationString({
							readable = "Found in the Blind Marshlands and in Faronaar (in a small area under the 'F' on the map.)",
							constant = "FOUND_IN_THE_BLIND_MARSHLANDS_AND_IN_FARONAAR",
							export = true,
							text = {
								en = "Found in the Blind Marshlands and in Faronaar (in a small area under the 'F' on the map.)",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于盲眼沼泽以及法拉纳尔（地图上“F”字母下方的一小片区域）。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(569, {	-- Garden Frog (PET!)
						["coord"] = { 43.0, 59.8, HIGHMOUNTAIN },
					}),
					pet(1762, {	-- Hog-Nosed Bat (PET!)
						["coord"] = { 50.8, 33.6, HIGHMOUNTAIN },
					}),
					pet(1713),	-- Long-Eared Owl (PET!)
					pet(1744, {	-- Mist Fox Kit (PET!)
						["coord"] = { 47.8, 30.6, HIGHMOUNTAIN },
					}),
					pet(1776, {	-- Mudshell Conch (PET!)
						["description"] = "~L.FOUND_ON_THE_NORTHERN_COASTLINE_OF_HIGHMOUNTAIN",
					}),
					pet(1714, {	-- Northern Hawk Owl (PET!)
						["description"] = createLocalizationString({
							readable = "Found in the snowy area of Highmountain by Frosthoof Watch.",
							constant = "FOUND_IN_THE_SNOWY_AREA_OF_HIGHMOUNTAIN_BY",
							export = true,
							text = {
								en = "Found in the snowy area of Highmountain by Frosthoof Watch.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于至高岭霜蹄岗哨附近的雪地区域。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(1763),	-- Spiketail Beaver (PET!)
					header(HEADERS.NPC, 115784, bubbleDownSelf({ ["timeline"] = { ADDED_7_1_0 } }, {	-- Snowfeather Hatchling
						["description"] = createLocalizationString({
							readable = "1. Buy Smoked Elderhorn from Marius Felbane in Highmountain.\n2. Kill Snowfeather Matriarch.\n3. /target Orphaned Snowfeather\n4. Feed Orphaned Snowfeather Smoked Elderhorn.\n5. Enjoy new Snowfeather Hatchling|r",
							constant = "1_BUY_SMOKED_ELDERHORN_FROM_MARIUS_FELBANE_IN",
							export = true,
							text = {
								en = "1. Buy Smoked Elderhorn from Marius Felbane in Highmountain.\n2. Kill Snowfeather Matriarch.\n3. /target Orphaned Snowfeather\n4. Feed Orphaned Snowfeather Smoked Elderhorn.\n5. Enjoy new Snowfeather Hatchling|r",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "1. 在至高岭向马里乌斯·灭魔购买熏制长者鹿角。\n2. 杀死雪羽母鹰。\n3. /target 孤雏雪羽鹰\n4. 用熏制长者鹿角喂食孤雏雪羽鹰。\n5. 享受新的雪羽雏鹰|r",
								-- TODO: tw = "",
							},
						}),
						["crs"] = { 115737 },	-- Orphaned Snowfeather
						["groups"] = {
							pet(1974),	-- Snowfeather Hatchling (PET!)
							q(44953, {	-- Allies in Highmountain
								["sourceQuest"] = 44950,	-- Hunting Lesson: Northern Hawk Owls
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44956, {	-- Deadly Prey
								["sourceQuest"] = 44954,	-- Snowfeather Team Up
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44962, {	-- Hunting Lesson: Coralback Fiddler
								["sourceQuest"] = 44961,	-- Teamwork Lesson: Naraxas
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44960, {	-- Hunting Lesson: Mudshell Conch
								["sourceQuest"] = 44959,	-- Snowfeather Bonding
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44950, {	-- Hunting Lesson: Northern Hawk Owls
								["sourceQuests"] = {
									44949,	-- The Smell of Humans
									44971,	-- The Smell of Orcs
								},
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44957, {	-- Hunting Lesson: Spiketail Beaver
								["sourceQuest"] = 44956,	-- Deadly Prey
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44948, {	-- Raising Your Snowfeather
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44959, {	-- Snowfeather Bonding
								["sourceQuest"] = 44958,	-- The Unfriendly Faction
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
								["groups"] = {
									i(142497),	-- Tiny Pack (TOY!)
								},
							}),
							q(44969, {	-- Snowfeather Reunion
								["sourceQuest"] = 44968,	-- Snowfeather Team Rumble
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
								["groups"] = {
									i(137578),	-- Snowfeather Hunter (MOUNT!)
								},
							}),
							q(44968, {	-- Snowfeather Team Rumble
								["sourceQuest"] = 44967,	-- Teamwork Lesson: Ursoc
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44954, {	-- Snowfeather Team Up
								["sourceQuest"] = 44953,	-- Allies in Highmountain
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44961, {	-- Teamwork Lesson: Naraxas
								["sourceQuest"] = 44960,	-- Hunting Lesson: Mudshell Conch
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
							q(44967, {	-- Teamwork Lesson: Ursoc
								["sourceQuest"] = 44962,	-- Hunting Lesson: Coralback Fiddler
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
								["_drop"] = { "g" },	-- Drop Ultimate Battle-Training Stone
							}),
							q(44949, {	-- The Smell of Humans
								["sourceQuest"] = 44948,	-- Raising Your Snowfeather
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
								["races"] = ALLIANCE_ONLY,
							}),
							q(44971, {	-- The Smell of Orcs
								["sourceQuest"] = 44948,	-- Raising Your Snowfeather
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
								["races"] = HORDE_ONLY,
							}),
							q(44958, {	-- The Unfriendly Faction
								["sourceQuest"] = 44957,	-- Hunting Lesson: Spiketail Beaver
								["provider"] = { "n", 115784 },	-- Snowfeather Hatchling
							}),
						},
					})),
				},
			})),
		}),
	}),
});
