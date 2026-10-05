---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(AZSUNA, {
			n(TREASURES, {
				o(253452, {	-- Beginner's Guide to Dimensional Rifting Ch. 1 - Navigating Through Time
					["coord"] = { 68.1, 51.1, AZSUNA },
				}),
				o(253453, {	-- Beginner's Guide to Dimensional Rifting Ch. 2 - Holy Places to Many
					["coord"] = { 55.2, 71.6, AZSUNA },
				}),
				o(253454, {	-- Beginner's Guide to Dimensional Rifting Ch. 3 - Water, Just Water
					["coord"] = { 33.4, 11.2, AZSUNA },
				}),
				o(253455, {	-- Beginner's Guide to Dimensional Rifting Ch. 4 - Risks and Rewards
					["coord"] = { 58.3, 12.3, AZSUNA },
				}),
				o(253456, {	-- Beginner's Guide to Dimensional Rifting Ch. 5 - Finding Others Along the Way
					["coord"] = { 53.1, 22.0, AZSUNA },
				}),
				o(253457, {	-- Beginner's Guide to Dimensional Rifting Ch. 6 - Pent up Energy
					["coord"] = { 61.1, 46.2, AZSUNA },
				}),
				o(253458, {	-- Beginner's Guide to Dimensional Rifting Ch. 7 - Our Legacy
					["coord"] = { 55.7, 48.3, AZSUNA },
				}),
				o(240638, {	-- Disputed Treasure
					["questID"] = 38365,
					["coord"] = { 55.9, 56.9, AZSUNA },
				}),
				o(256790, {	-- Elven Treasure Chest
					["description"] = createLocalizationString({
						readable = "These repeatable chests spawn all over the map in Azsuna and Val'Sharah.",
						constant = "THESE_REPEATABLE_CHESTS_SPAWN_ALL_OVER_THE_MAP",
						export = true,
						text = {
							en = "These repeatable chests spawn all over the map in Azsuna and Val'Sharah.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这些可重复的宝箱会在阿苏纳和瓦尔莎拉的地图各处刷新。",
							-- TODO: tw = "",
						},
					})
				}),
				o(240637, {	-- Glimmering Treasure Chest
					["questID"] = 38367,
					["coord"] = { 42.6, 8.1, AZSUNA },
				}),
				o(240639, {	-- Glimmering Treasure Chest
					["questID"] = 37830,
					["coord"] = { 58.4, 43.8, AZSUNA },
				}),
				o(240645, {	-- Glimmering Treasure Chest
					["questID"] = 37649,
					["coord"] = { 69.5, 49.3, 632 },	-- Oceanus Cove
					["description"] = createLocalizationString({
						readable = "In the Oceanus Cove cave next to Lady Sssurine.",
						constant = "IN_THE_OCEANUS_COVE_CAVE_NEXT_TO_LADY_SSSURINE",
						export = true,
						text = {
							en = "In the Oceanus Cove cave next to Lady Sssurine.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在瑟苏琳女士旁边的欧申纳斯海湾洞穴中。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = { i(129078) },	-- Sssurine's Luxurious Sssandals
				}),
				o(250107, {	-- Glimmering Treasure Chest
					["questID"] = 42297,
					["coord"] = { 43.4, 22.4, AZSUNA },
				}),
				o(250448, {	-- Imp in a Jar
					["coord"] = { 32.9, 49.9, AZSUNA },	-- Oceanus Cove
					["groups"] = { i(137622) },	-- Imp in a Jar
				}),
				o(240353, {	-- Seemingly Unguarded Treasure
					["coord"] = { 65.1, 69.8, AZSUNA },
					["groups"] = {
						o(240354, {	-- Genuinely Unguarded Treasure
							["questID"] = 38239,
							-- #if AFTER 11.2.7
							["isDaily"] = true,	-- Maybe only daily during remix, and thereafter
							-- #endif
							["coord"] = { 65.1, 69.8, AZSUNA },
							["groups"] = { i(129070) },	-- Ring of the Dread Pirate Bob
						}),
					},
				}),
				o(269064, {	-- Small Treasure Chest (need to verify objectID)
					["description"] = createLocalizationString({
						readable = "Inside Nar'thalas Academy, down the right branching hallway. May require Nar'thalas Academy quests to open the door.",
						constant = "INSIDE_NAR_THALAS_ACADEMY_DOWN_THE_RIGHT",
						export = true,
						text = {
							en = "Inside Nar'thalas Academy, down the right branching hallway. May require Nar'thalas Academy quests to open the door.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在纳萨拉斯学院内，沿右侧分岔走廊下去。可能需要完成纳萨拉斯学院的任务才能打开门。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 42285,
					["coord"] = { 71.7, 21.7, 631 },
				}),
				o(249997, {	-- Small Treasure Chest
					["questID"] = 42272,
					["coord"] = { 59.9, 63.2, AZSUNA },
				}),
				o(250104, {	-- Small Treasure Chest
					["questID"] = 42294,
					["coord"] = { 62.8, 44.8, AZSUNA },
				}),
				o(250081, {	-- Small Treasure Chest
					["questID"] = 42278,
					["coord"] = { 63.0, 54.2, AZSUNA },
				}),
				o(250085, {	-- Small Treasure Chest
					["questID"] = 42283,
					["coord"] = { 53.5, 45.5, AZSUNA },
				}),
				o(240644, {	-- Small Treasure Chest
					["questID"] = 37596,
					["coord"] = { 53.0, 37.3, AZSUNA },
				}),
				o(246206, {	-- Small Treasure Chest
					["questID"] = 40752,
					["coord"] = { 58.6, 53.4, AZSUNA },
				}),
				o(250080, {	-- Small Treasure Chest
					["questID"] = 42273,
					["coord"] = { 62.4, 58.4, AZSUNA },
				}),
				o(250090, {	-- Small Treasure Chest
					["questID"] = 42287,
					["coord"] = { 54.4, 36.3, AZSUNA },
				}),
				o(240630, {	-- Small Treasure Chest
					["questID"] = 37831,
					["coord"] = { 49.7, 34.5, AZSUNA },
				}),
				o(250088, {	-- Small Treasure Chest
					["questID"] = 44102,
					["coord"] = { 71.0, 22.3, 631 },	-- Nar'thalas Academy
				}),
				o(250083, {	-- Small Treasure Chest
					["questID"] = 42281,
					["coord"] = { 52.0, 42.1, AZSUNA },
				}),
				o(254025, {	-- Small Treasure Chest
					["questID"] = 44103,
					["coord"] = { 68.9, 29.7, AZSUNA },
					["description"] = createLocalizationString({
						readable = "In an underwater cave.",
						constant = "IN_AN_UNDERWATER_CAVE",
						export = true,
						text = {
							en = "In an underwater cave.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在水下洞穴中。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(246205, {	-- Small Treasure Chest
					["questID"] = 40751,
					["coord"] = { 66.1, 43.5, AZSUNA },
				}),
				o(250097, {	-- Small Treasure Chest
					["questID"] = 42290,
					["coord"] = { 50.2, 50.3, AZSUNA },
				}),
				o(250106, {	-- Small Treasure Chest
					["questID"] = 42295,
					["coord"] = { 47.9, 7.7, AZSUNA },
				}),
				o(250084, {	-- Small Treasure Chest
					["questID"] = 42282,
					["coord"] = { 53.6, 44.2, AZSUNA },
				}),
				o(250103, {	-- Small Treasure Chest
					["questID"] = 42293,
					["coord"] = { 63.6, 39.2, AZSUNA },
				}),
				o(250108, {	-- Small Treasure Chest
					["questID"] = 42338,
					["coord"] = { 57.2, 25.2, AZSUNA },
				}),
				o(258690, {	-- Small Treasure Chest
					["questID"] = 44405,
					["coord"] = { 54.9, 52.1, AZSUNA },
				}),
				o(254028, {	-- Small Treasure Chest
					["questID"] = 44105,
					["coord"] = { 26.2, 47.1, AZSUNA },
				}),
				o(250087, {	-- Small Treasure Chest
					["questID"] = 42284,
					["coord"] = { 62.0, 83.7, 631 },
				}),
				o(251552, {	-- Small Treasure Chest
					["questID"] = 42958,
					["coord"] = { 65.5, 29.6, AZSUNA },
				}),
				o(250091, {	-- Small Treasure Chest
					["questID"] = 42288,
					["coord"] = { 55.4, 27.7, AZSUNA },
				}),
				o(254027, {	-- Small Treasure Chest
					["questID"] = 44104,
					["coord"] = { 53.6, 18.1, AZSUNA },
				}),
				o(250098, {	-- Small Treasure Chest
					["questID"] = 42291,
					["coord"] = { 45.4, 67.0, 632 },
				}),
				o(240635, {	-- Treasure Chest
					["questID"] = 37980,
					["coord"] = { 58.4, 12.3, AZSUNA },
				}),
				o(240629, {	-- Treasure Chest
					["questID"] = 37829,
					["coord"] = { 53.2, 64.5, AZSUNA },
				}),
				o(240641, {	-- Treasure Chest
					["questID"] = 38370,
					["coord"] = { 49.4, 58.0, AZSUNA },
					["groups"] = { i(141882) },	-- Eternal Groom's Wedding Band
				}),
				o(240631, {	-- Treasure Chest
					["questID"] = 38316,
					["coord"] = { 40.6, 57.7, AZSUNA },
				}),
				o(250102, {	-- Treasure Chest
					["questID"] = 42292,
					["coord"] = { 41.4, 30.7, AZSUNA },
				}),
				o(246037, {	-- Treasure Chest
					["questID"] = 40711,
					["coord"] = { 55.6, 18.5, AZSUNA },
				}),
				o(240634, {	-- Treasure Chest
					["description"] = createLocalizationString({
						readable = "At the back of the room, behind some Withered Leyfeeders channeling a floating mana crystal.",
						constant = "AT_THE_BACK_OF_THE_ROOM_BEHIND_SOME_WITHERED",
						export = true,
						text = {
							en = "At the back of the room, behind some Withered Leyfeeders channeling a floating mana crystal.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在房间深处，一些正在引导一颗漂浮魔力水晶的枯法魔网吞食者后面。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 37958,
					["coord"] = { 57.3, 12.9, AZSUNA },
				}),
				o(239803, {	-- Treasure Chest
					["questID"] = 37832,
					["coord"] = { 63.2, 15.2, AZSUNA },
				}),
				o(240690, {	-- Treasure Chest
					["questID"] = 38419,
					["coord"] = { 57.1, 31.1, AZSUNA },
				}),
				o(240642, {	-- Treasure Chest
					["questID"] = 38251,
					["coord"] = { 56.4, 34.8, AZSUNA },
				}),
				o(250092, {	-- Treasure Chest
					["description"] = createLocalizationString({
						readable = "At the far back of the Leyhollow cave.",
						constant = "AT_THE_FAR_BACK_OF_THE_LEYHOLLOW_CAVE",
						export = true,
						text = {
							en = "At the far back of the Leyhollow cave.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在魔网洞穴的最深处。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 42289,
					["coord"] = { 51.5, 24.3, AZSUNA },
				}),
				o(240646, {	-- Treasure Chest
					["questID"] = 37713,
					["coord"] = { 44.5, 39.5, AZSUNA },
				}),
				o(240643, {	-- Treasure Chest
					["questID"] = 37828,
					["coord"] = { 49.5, 45.3, AZSUNA },
					["groups"] = { i(122681) },	-- Sternfathom's Pet Journal (TOY!)
				}),
				o(250109, {	-- Treasure Chest
					["questID"] = 42339,
					["coord"] = { 52.9, 20.6, AZSUNA },
					["description"] = createLocalizationString({
						readable = "At the end of the cave full of sleeping bears. Tread lightly!",
						constant = "AT_THE_END_OF_THE_CAVE_FULL_OF_SLEEPING_BEARS",
						export = true,
						text = {
							en = "At the end of the cave full of sleeping bears. Tread lightly!",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在满是沉睡熊的洞穴尽头。脚步放轻！",
							-- TODO: tw = "",
						},
					}),
				}),
				o(250432, {	-- Unstable Riftstone
					["coord"] = { 28.0, 51.1, AZSUNA },
					["groups"] = { i(137604) },	-- Unstable Riftstone
				}),
			}),
		}),
	}),
});
