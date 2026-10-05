---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(HALLOWFALL, {
		n(TREASURES, {
			i(220123, {	-- Ominous Offering
				["description"] = createLocalizationString({
					readable = "Combine 'Offering of Pure Water' and 'Jar of Mucus' to get this item.\nUsed to summon 'Deathtide'.",
					constant = "COMBINE_OFFERING_OF_PURE_WATER_AND_JAR_OF_MUCUS",
					export = true,
					text = {
						en = "Combine 'Offering of Pure Water' and 'Jar of Mucus' to get this item.\nUsed to summon 'Deathtide'.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "将“纯净之水供品”和“黏液罐”组合以获得该物品。\n用于召唤“死亡之潮”。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = {
					{ "i", 220124, 1 },	-- 1x Jar of Mucus
					{ "i", 220122, 1 },	-- 1x Offering of Pure Water
				},
			}),
			o(444798, {	-- Arathi Treasure Hoard
				["description"] = "~L.SPAWNS_RANDOMLY_THROUGHOUT_THE_ZONE",
				["maps"] = { HALLOWFALL },
				["groups"] = {
					i(212333),	-- Expedition Tinderbox (QS!)
					i(224463),	-- Lily's Locket (QS!)
					i(224460),	-- The Lost Diary (QS!)
					i(224466),	-- Wilber The Chicken (QS!)
				},
			}),
			o(444801, {	-- Brimming Arathi Treasure Hoard
				["maps"] = { HALLOWFALL },
			}),
			n(225948, {	-- Caesper
				["description"] = createLocalizationString({
					readable = "Bring Caesper Meaty Haunch and follow him, he will dig up treasure for you.",
					constant = "BRING_CAESPER_MEATY_HAUNCH_AND_FOLLOW_HIM_HE",
					export = true,
					text = {
						en = "Bring Caesper Meaty Haunch and follow him, he will dig up treasure for you.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "给凯斯珀带一份多汁的腿肉并跟着他，他会为你挖出宝藏。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 41.8, 58.3, HALLOWFALL },	-- Caesper
				["cost"] = { { "i", 225238, 1 } },	-- Meaty Haunch
				["groups"] = {
					o(453167, {	-- Disturbed Lyns Treasure
						["questID"] = 83263,
						["groups"] = {
							i(225639),	-- Recipe: Exquisitely Eviscerated Muscle (RECIPE!)
						},
					}),
				},
			}),
			o(444804, {	-- Concentrated Shadow
				["description"] = createLocalizationString({
					readable = "Spawns all over the zone only when Beledar shifts into its Void state.",
					constant = "SPAWNS_ALL_OVER_THE_ZONE_ONLY_WHEN_BELEDAR",
					export = true,
					text = {
						en = "Spawns all over the zone only when Beledar shifts into its Void state.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅当贝雷达尔转变为虚空状态时，才会在该区域各处刷新。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { HALLOWFALL },
				["groups"] = {
					-- some crafting reagents and gray item
				},
			}),
			o(444799, {	-- Potent Concentrated Shadow
				["description"] = "~L.SPAWNS_ALL_OVER_THE_ZONE_ONLY_WHEN_BELEDAR",
				["maps"] = { HALLOWFALL },
				["groups"] = {
					-- some crafting reagents and gray item
				},
			}),
			o(453374, {	-- Shadowed Essence (Dark Ritual, event)
				["description"] = createLocalizationString({
					readable = "Inside the cave. Interract with the book and start the ritual. Survive the attack and kill the shadows.",
					constant = "INSIDE_THE_CAVE_INTERRACT_WITH_THE_BOOK_AND",
					export = true,
					text = {
						en = "Inside the cave. Interract with the book and start the ritual. Survive the attack and kill the shadows.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴内。与书互动并开始仪式。在攻击中存活下来并击杀暗影。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "o", 453359 },	-- Dark Ritual (vignette)
				["coord"] = { 59.5, 59.7, HALLOWFALL },
				["questID"] = 83284,
				["groups"] = {
					i(225693),	-- Shadowed Essence
				},
			}),
			o(437211, {	-- Illuminated Footlocker
				["description"] = createLocalizationString({
					readable = "Starblessed Glimmerfly flies around in circle casting Lightning Orbs on the ground.\nCatch 5 Lightning Orbs by standing in illuminated circles in order to reveal the treasure.",
					constant = "STARBLESSED_GLIMMERFLY_FLIES_AROUND_IN_CIRCLE",
					export = true,
					text = {
						en = "Starblessed Glimmerfly flies around in circle casting Lightning Orbs on the ground.\nCatch 5 Lightning Orbs by standing in illuminated circles in order to reveal the treasure.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "星佑微光蝇会盘旋飞行，并在地面施放闪电宝珠。\n站在发光的圆圈中接住 5 个闪电宝珠，即可让宝藏显现。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 58.4, 27.2, HALLOWFALL },
				["questID"] = 81468,
				["crs"] = { 220703 },	-- Starblessed Glimmerfly
				["groups"] = {
					i(224552),	-- Cave Spelunker's Torch (TOY!)
				},
			}),
			o(440926, {	-- Jar of Mucus
				["description"] = createLocalizationString({
					readable = "One of two parts required to create 'Ominous Offering'. An item required to summon 'Deathtide'.",
					constant = "ONE_OF_TWO_PARTS_REQUIRED_TO_CREATE_OMINOUS",
					export = true,
					text = {
						en = "One of two parts required to create 'Ominous Offering'. An item required to summon 'Deathtide'.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "制作“不祥的祭品”所需的两部分之一。这是召唤“死亡之潮”所需的物品。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 48.0, 16.7, HALLOWFALL },
					{ 48.8, 50.2, HALLOWFALL },
				},
				["groups"] = {
					i(220124),	-- Jar of Mucus
				},
			}),
			o(441606, {	-- Jewel of the Cliffs
				["description"] = createLocalizationString({
					readable = "Located inside the crack of the pillar high above ground.",
					constant = "LOCATED_INSIDE_THE_CRACK_OF_THE_PILLAR_HIGH",
					export = true,
					text = {
						en = "Located inside the crack of the pillar high above ground.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于高悬于地面的柱子裂缝内。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 55.8, 69.5, HALLOWFALL },
				["questID"] = 81971,
				["groups"] = {
					i(224580, {	-- Massive Sapphire Chunk
					-- i(212508),	-- Stunning Sapphire x3
					}),
				},
			}),
			o(444802, {	-- Kobyss Ritual Cache
				["description"] = createLocalizationString({
					readable = "Spawns randomly around the costal regions of the zone.",
					constant = "SPAWNS_RANDOMLY_AROUND_THE_COSTAL_REGIONS_OF",
					export = true,
					text = {
						en = "Spawns randomly around the costal regions of the zone.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在该区域的沿海地带随机刷新。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { HALLOWFALL },
			}),
			o(441638, {	-- Lost Memento
				["coord"] = { 50.1, 13.8, HALLOWFALL },
				["questID"] = 81978,
				["groups"] = {
					i(224575),	-- Lightbearer's Pendant
				},
			}),
			o(457062, {	-- Sky-Captain Lancekat's Curse
				["questID"] = 84289,
				["coord"] = { 42.6, 53.7, HALLOWFALL },
				["isWeekly"] = true,	-- unflagged at some point (Runaway)
				["groups"] = {
					i(225213),	-- Sky-Captain Lancekat's Curse
				}
			}),
			o_repeated({	-- Smuggler's Treasure
				o(453283, {
					["description"] = createLocalizationString({
						readable = "Fly down to the Dead Arathi body and loot key.",
						constant = "FLY_DOWN_TO_THE_DEAD_ARATHI_BODY_AND_LOOT_KEY",
						export = true,
						text = {
							en = "Fly down to the Dead Arathi body and loot key.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "飞到死亡的阿拉希人尸体处并拾取钥匙。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 55.1, 51.9, HALLOWFALL },
					["questID"] = 83273,
				}),
				o(453274, {
					["description"] = "~L.FLY_DOWN_TO_THE_DEAD_ARATHI_BODY_AND_LOOT_KEY",
					["coord"] = { 55.1, 51.9, HALLOWFALL },
				}),
				i(225335),	-- Smuggler's Key
				i(226021),	-- Jar of Pickles
			}),
			o(419695, {	-- Spore-Covered Coffer
				["description"] = createLocalizationString({
					readable = "Inside the Shadowmire cave.",
					constant = "INSIDE_THE_SHADOWMIRE_CAVE",
					export = true,
					text = {
						en = "Inside the Shadowmire cave.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暗影泥沼洞穴内。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 76.8, 53.8, HALLOWFALL },
				["questID"] = 79275,
			}),
			o(454797, {	-- From the Depths They Come
				["coord"] = { 57.8, 51.7, HALLOWFALL },
				-- ["questID"] = ,
				["groups"] = {
					i(225208),	-- From the Depths They Come [book]
				},
			}),
			o(455038, {	-- Light's Gambit Playbook
				["coord"] = { 68.7, 41.5, HALLOWFALL },
				-- ["questID"] = ,
				["groups"] = {
					i(225206),	-- Light's Gambit Playbook [book]
				},
			}),
			o(463979, {	-- Lightspark Sky Academy Gradebook
				["coord"] = { 52.6, 60.0, HALLOWFALL },
				["questID"] = 84497,
				["groups"] = {
					i(228457),	-- Lightspark Grade Book [book]
				},
			}),
			o(440914, {	-- Offering of Pure Water
				["description"] = "~L.ONE_OF_TWO_PARTS_REQUIRED_TO_CREATE_OMINOUS",
				["coords"] = {
					{ 28.9, 51.2, HALLOWFALL },
					{ 34.2, 57.9, HALLOWFALL },
					{ 34.3, 53.6, HALLOWFALL },
					{ 34.5, 53.6, HALLOWFALL },
					{ 43.4, 14.1, HALLOWFALL },
					{ 43.5, 14.1, HALLOWFALL },
					{ 50.1, 49.7, HALLOWFALL },
					{ 52.4, 50.2, HALLOWFALL },
					{ 53.8, 19.1, HALLOWFALL },
					{ 55.2, 23.4, HALLOWFALL },
					{ 55.2, 23.5, HALLOWFALL },
				},
				["groups"] = {
					i(220122),	-- Offering of Pure Water
				},
			}),
			o(455183, {	-- Shadow Curfew Journal
				["coord"] = { 59.8, 22.1, HALLOWFALL },
				-- ["questID"] = ,
				["groups"] = {
					i(225205),	-- Shadow Curfew Journal [book]
				},
			}),
			o(453937, {	-- 500 Dishes Using Cave Fish and Mushrooms
				["coord"] = { 43.9, 50.0, HALLOWFALL },
				-- ["questID"] = ,
				["groups"] = {
					i(225217),	-- 500 Dishes Using Cave Fish and Mushrooms [book]
				},
			}),
			o(453749, {	-- Palawltar's Codex of Dimensional Structure
				["coord"] = { 48.7, 64.7, HALLOWFALL },
				["groups"] = {
					i(225216),	-- Palawltar's Codex of Dimensional Structure (CI!)
				},
			}),
			o(453751, {	-- Care and Feeding of the Imperial Lynx
				["coord"] = { 69.4, 44.0, HALLOWFALL },
				["groups"] = {
					i(225207),	-- Care and Feeding of the Imperial Lynx (CI!)
				},
			}),
			o(453752, {	-- Shadow Curfew Guidelines
				["coord"] = { 64.2, 28.1, HALLOWFALL },
				["groups"] = {
					i(225204),	-- Shadow Curfew Guidelines (CI!)
				},
			}),
			o(453753, {	-- Beledar - The Emperor's Vision
				["coord"] = { 56.6, 65.2, HALLOWFALL },
				["groups"] = {
					i(225203),	-- Beledar - The Emperor's Vision (CI!)
				},
			}),
			o(439473, {	-- Tenir and the Order of Night
				["description"] = createLocalizationString({
					readable = "In the basement.",
					constant = "IN_THE_BASEMENT",
					export = true,
					text = {
						en = "In the basement.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在地下室中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 63.5, 29.5, HALLOWFALL },
				["groups"] = {
					i(219384),	-- Tenir and the Order of Night
				},
			}),
			o(453754, {	-- The Song of Renilash
				["coord"] = { 70.2, 56.8, HALLOWFALL },
				["groups"] = {
					i(225215),	-- The Song of Renilash (CI!)
				},
			}),
			o(453755, {	-- The Big Book of Arathi Idioms
				["coord"] = { 48.1, 39.6, HALLOWFALL },
				["groups"] = {
					i(225212),	-- The Big Book of Arathi Idioms (CI!)
				},
			}),
			o(419729, {	-- Strange Eggs
				["coord"] = { 67.1, 21.8, HALLOWFALL },
				["groups"] = {
					i(212331),	-- The Unusual Bug
				},
			}),
			o(441611, {	-- Windswept Satchel
				["coord"] = { 30.2, 38.8, HALLOWFALL },
				["questID"] = 81972,
				["groups"] = {
					i(224578),	-- Arathor Courier's Satchel
				},
			}),
			-- Ryfus Sacredpyr / Arathi Loremaster
			o(453741, {	-- Loremaster's Reward
				["provider"] = { "n", 221630 },	-- Ryfus Sacredpyr
				["coord"] = { 40.0, 51.1, HALLOWFALL },
				["questID"] = 83298,
				["sourceQuest"] = 83305,	-- Question 6
				-- ["cost"] = {
				-- 	{ "i", 225216, 1 },	-- Palawltar's Codex of Dimensional Structure / Question 1
				-- 	{ "i", 225207, 1 },	-- Care and Feeding of the Imperial Lynx / Question 2
				-- 	{ "i", 225204, 1 },	-- Shadow Curfew Guidelines / Question 3
				-- 	{ "i", 225203, 1 },	-- Beledar- The Emperor's Vision / Question 4
				-- 	{ "i", 225215, 1 },	-- The Song of Renilash / Question 5
				-- 	{ "i", 225212, 1 },	-- The Big Book of Arathi Idioms / Question 6
				-- },
				["groups"] = {
					i(225659),	-- Arathi Book Collection (TOY!)
					hqt(83300, {	-- Question 1
						["name"] = "Answer 1: That the Cosmos consisted of monopole elemental phase spaces.",
						["sourceQuests"] = {
							83309,	-- Palawltar's Codex of Dimensional Structure
						},
					}),
					hqt(83301, {	-- Question 2
						["name"] = "Answer 2: Patience and respect.",
						["sourceQuests"] = {
							83300,	-- previous step
							83310,	-- Care and Feeding of the Imperial Lynx
						},
					}),
					hqt(83302, {	-- Question 3
						["name"] = "Answer 3: Seek shelter and light. Have plans, have backup plans. Find joy while sheltering.",
						["sourceQuests"] = {
							83301,	-- previous step
							83311,	-- Shadow Curfew Guidelines
						},
					}),
					hqt(83303, {	-- Question 4
						["name"] = "Answer 4: The third fleet.",
						["sourceQuests"] = {
							83302,	-- previous step
							83312,	-- Beledar- The Emperor's Vision
						},
					}),
					hqt(83304, {	-- Question 5
						["name"] = "Answer 5: The Remains of gods.",
						["sourceQuests"] = {
							83303,	-- previous step
							83313,	-- The Song of Renilash
						},
					}),
					hqt(83305, {	-- Question 6
						["name"] = "Answer 6: From the letters of Mereldar.",
						["sourceQuests"] = {
							83304,	-- previous step
							83314,	-- The Big Book of Arathi Idioms
						},
					}),
				},
			}),
			-- achievement crits
			o(441720, {	-- A Scout's Journal
				["coord"] = { 62.2, 45.6, HALLOWFALL },
				["questID"] = 82066,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441688, {	-- A Tattered Note
				["coord"] = { 71.4, 36.7, HALLOWFALL },
				["questID"] = 82065,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441637, {	-- A Weathered Tome
				["coord"] = { 78.2, 40.3, HALLOWFALL },
				["questID"] = 82064,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441633, {	-- A Worn Down Book
				["coord"] = { 25.1, 53.7, HALLOWFALL },
				["questID"] = 82063,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441628, {	-- Captain's Chest
				["coord"] = { 25.7, 38.4, HALLOWFALL },
				["questID"] = 82061,
				-- #if AFTER 11.0.2.56313
				-- #if BEFORE 11.0.7
				["description"] = "~L.THIS_OBJECT_FOR_ITS_ACHIEVEMENT_IS_CURRENTLY",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56313", ADDED_11_0_7 },
			}),
			o(441800, {	-- Sunken Cache
				["description"] = createLocalizationString({
					readable = "You need to talk to Sky-Captains Aerthin, Clairmonte, Dornald, and Onaro on their respective airships.",
					constant = "YOU_NEED_TO_TALK_TO_SKY_CAPTAINS_AERTHIN",
					export = true,
					text = {
						en = "You need to talk to Sky-Captains Aerthin, Clairmonte, Dornald, and Onaro on their respective airships.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你需要分别在他们各自的飞艇上与天空船长艾尔辛、克莱尔蒙特、多纳尔德和奥纳罗对话。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 82012, 82024, 82025, 82026 },	-- Talk to all Sky-Captains
				["coord"] = { 45.9, 45.1, HALLOWFALL },
				["questID"] = 82005,
				["groups"] = {
					i(224554),	-- Silver Linin' Scepter (TOY!)
				},
			}),
		}),
	}),
}));
