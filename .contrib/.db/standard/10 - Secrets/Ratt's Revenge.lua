--------------------------------------------
--     S E C R E T S  M O D U L E       --
--------------------------------------------

root(ROOTS.Secrets, header(HEADERS.Achievement, 40967, {	-- Ratts' Revenge
	["description"] = "~L.USING_DEBUG_MODE_IS_RECOMMENDED",
	["timeline"] = { ADDED_11_0_5 },
	["groups"] = {
		o(182030, {	-- Inert Peculiar Key
			["description"] = createLocalizationString({
				readable = "Inside a rotten tree trunk in the far north of Un'Goro Crater. Use your Torch of Pyrreth to reveal it.",
				constant = "INSIDE_A_ROTTEN_TREE_TRUNK_IN_THE_FAR_NORTH_OF",
				export = true,
				text = {
					en = "Inside a rotten tree trunk in the far north of Un'Goro Crater. Use your Torch of Pyrreth to reveal it.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在安戈洛环形山最北部的腐烂树干内。使用派瑞斯火炬来揭示它。",
					-- TODO: tw = "",
				},
			}),
			["provider"] = { "i", 208092 },	-- Torch of Pyrreth
			["coord"] = { 44.5, 8.0, UNGORO_CRATER },
			["groups"] = { i(228941) },	-- Inert Peculiar Key
		}),
		hqt(84685, {	-- Talk to the Dalaran Survivor while using the Detective title
			["name"] = "Talk to the Dalaran Survivor while using the Detective title",
			["sourceAchievement"] = 40870,	-- Azeroth's Greatest Detective
			["coord"] = { 54.9, 28.9, DORNOGAL },
		}),
		q(84684, {	-- Ratts' Race
			["description"] = createLocalizationString({
				readable = "Find 3 notes scattered around Azj-Kahet then confront Ratts in Pillar-nest Vosh.",
				constant = "FIND_3_NOTES_SCATTERED_AROUND_AZJ_KAHET_THEN",
				export = true,
				text = {
					en = "Find 3 notes scattered around Azj-Kahet then confront Ratts in Pillar-nest Vosh.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "找到散布在艾兹卡赫特的 3 张字条，然后去柱巢沃什与拉茨对质。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuest"]	= 84685,	-- Talk to the Dalaran Survivor with the Detective title
			["provider"] = { "n", 230042 },	-- Dalaran Survivor
			["coord"] = { 54.9, 28.9, DORNOGAL },
			["groups"] = {
				i(228934),	-- Carefully Penned Note (QI!)
				o(466118, {	-- Unfinished Note
					["description"] = createLocalizationString({
						readable = "#1. In a cave in Azj'Kahet in the center of 5 Rotglow Settlers.",
						constant = "1_IN_A_CAVE_IN_AZJ_KAHET_IN_THE_CENTER_OF_5",
						export = true,
						text = {
							en = "#1. In a cave in Azj'Kahet in the center of 5 Rotglow Settlers.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "#1. 位于艾基-卡赫特一处洞穴中，在 5 个腐光定居者的中央。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 69.3, 93.3, AZJ_KAHET },
					["groups"] = { i(228935) },	-- Unfinished Note (QI!)
				}),
				o(466119, {	-- Hastily Scrawled Note
					["description"] = createLocalizationString({
						readable = "#2. High up on a ridge overlooking the City of Threads.",
						constant = "2_HIGH_UP_ON_A_RIDGE_OVERLOOKING_THE_CITY_OF",
						export = true,
						text = {
							en = "#2. High up on a ridge overlooking the City of Threads.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "#2. 在高处的山脊上，俯瞰丝线之城。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 31.5, 20.8, NERUBAR },
					["groups"] = { i(228936) },	-- Hastily Scrawled Note (QI!)
				}),
				o(466120, {	-- Water-Resistant Note
					["description"] = createLocalizationString({
						readable = "#3. Underwater in the center of a lake on the right side of the Azj-Kahet-Hallowfall transition.",
						constant = "3_UNDERWATER_IN_THE_CENTER_OF_A_LAKE_ON_THE",
						export = true,
						text = {
							en = "#3. Underwater in the center of a lake on the right side of the Azj-Kahet-Hallowfall transition.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "#3. 在艾基-卡赫特与圣陨谷交界处右侧一个湖泊中央的水下。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 50.7, 86.6, HALLOWFALL },
					["groups"] = { i(228937) },	-- Water-Resistant Note (QI!)
				}),
				o(466128, {	-- Peculiar Gem
					["description"] = createLocalizationString({
						readable = "#4. To turn in the quest, enter Pillar-nest Vosh to the left of Faerin's advance, navigate toward the back of the cave then turn around to find a wall you can climb, fall into a tunnel hidden in the wall.",
						constant = "4_TO_TURN_IN_THE_QUEST_ENTER_PILLAR_NEST_VOSH",
						export = true,
						text = {
							en = "#4. To turn in the quest, enter Pillar-nest Vosh to the left of Faerin's advance, navigate toward the back of the cave then turn around to find a wall you can climb, fall into a tunnel hidden in the wall.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "#4. 要交付任务，请进入斐林先锋左侧的柱巢沃什，往洞穴深处走，然后转身找到一面可以攀爬的墙壁，掉进墙内隐藏的隧道。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 55.1, 19.0, AZJ_KAHET },	-- Cave Entrance
						{ 56.4, 17.5, AZJ_KAHET },	-- Wall Tunnel
					},
				}),
				i(228938),	-- Peculiar Gem
			},
		}),
		i(44124, {	-- Peculiar Key
			["description"] = createLocalizationString({
				readable = "Once reformed, go to the entrance of the Karazhan Catacombs in Deadwind Pass and use your Torch of Pyrreth by the gate to teleport into a secret scenario.",
				constant = "ONCE_REFORMED_GO_TO_THE_ENTRANCE_OF_THE",
				export = true,
				text = {
					en = "Once reformed, go to the entrance of the Karazhan Catacombs in Deadwind Pass and use your Torch of Pyrreth by the gate to teleport into a secret scenario.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "完成重塑后，前往逆风小径的卡拉赞墓穴入口，在门前使用派瑞斯火炬即可传送进入一个秘密场景战役。",
					-- TODO: tw = "",
				},
			}),
			["cost"] = {
				{ "i", 228941, 1 },	-- Inert Peculiar Key
				{ "i", 228938, 1 },	-- Peculiar Gem
			},
		}),
		m(46, {	-- Karazhan Catacombs (this makes sense to have as a root map when it's the minilist)
			["description"] = createLocalizationString({
				readable = "Deep into the catacombs the bike is just sitting there out of reach, but is surrounded by 12 basins which can light up with orbs if enough actions are performed.",
				constant = "DEEP_INTO_THE_CATACOMBS_THE_BIKE_IS_JUST",
				export = true,
				text = {
					en = "Deep into the catacombs the bike is just sitting there out of reach, but is surrounded by 12 basins which can light up with orbs if enough actions are performed.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在地下墓穴深处，那辆摩托就停在那里却无法触及，但它周围有 12 个水池，只要完成足够多的动作，就会有宝珠将其点亮。",
					-- TODO: tw = "",
				},
			}),
			["coord"] = { 46.3, 69.1, DEADWIND_PASS },
			["providers"] = {
				{ "i",  44124 },	-- Peculiar Key
				{ "i", 208092 },	-- Torch of Pyrreth
			},
			["groups"] = {
				-- 1 O'clock Basin
				hqt(84676, {	-- The Light of Their Love
					["name"] = "Acquire The Light of Their Love buff stacked 3 times",
					["description"] = createLocalizationString({
						readable = "Acquire The Light of Their Love buff (spellID 153715) 3 times from visiting areas relevant to Olgra, Mankrik's wife. Stand at these areas with your Torch of Pyrreth until a stack is gained.\n1. The Humble Monument in Northern Barrens.\n2. Young Olgra in Draenor.\n3. Decimator Olgra in Maldraxxus.\n\nFully lights up the 1 O'clock basin.",
						constant = "ACQUIRE_THE_LIGHT_OF_THEIR_LOVE_BUFF_SPELLID",
						export = true,
						text = {
							en = "Acquire The Light of Their Love buff (spellID 153715) 3 times from visiting areas relevant to Olgra, Mankrik's wife. Stand at these areas with your Torch of Pyrreth until a stack is gained.\n1. The Humble Monument in Northern Barrens.\n2. Young Olgra in Draenor.\n3. Decimator Olgra in Maldraxxus.\n\nFully lights up the 1 O'clock basin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "前往与曼克里克的妻子奥格拉相关的地点，获取 3 次“她们爱的光芒”增益（法术 ID 153715）。带着你的皮雷斯火炬站在这些地点，直到获得一层增益。\n1. 北贫瘠之地的谦卑纪念碑。\n2. 德拉诺的年轻奥格拉。\n3. 玛卓克萨斯的屠戮者奥格拉。\n\n可完全点亮 1 点钟方向的水池。",
							-- TODO: tw = "",
						},
					}),
					["sourceQuest"] = 84684,	-- Ratts' Race
					["provider"] = { "i", 208092 },	-- Torch of Pyrreth
					["coords"] = {
						{ 55.0, 40.2, NORTHERN_BARRENS },
						{ 74.2, 37.5, DRAENOR_NAGRAND },	-- Before (35170) Consumed by Vengence is completed
						{ 49.2, 48.0, DRAENOR_NAGRAND },	-- After (35170) Consumed by Vengence is completed
						{ 27.3, 61.3, MALDRAXXUS },
					},
					["crs"] = {
						82688,	-- Olgra
						175815,	-- Decimator Olgra
					},
				}),
				-- 2 O'clock Basin
				hqt(84677, {	-- Acquire the Key of Shadows
					["name"] = "Acquire the Key of Shadows from the Ny'Alotha Obelisk",
					["description"] = createLocalizationString({
						readable = "Requires the 1 O'clock basin to have been completed to see the obelisk personally.\n1. Acquire the Twitching Eyaball or All-Seeing Eyes toys\n2. Acquire a Perky Pug with either the Dogg-Saron costume from Vashti the Wandering Merchant in Azsuna or the Yipp-Saron costume from Hallow's End (or the AH.)\n3. Bring these items OR find a friend who has them and visit the Ny'Alotha Obelisk above the Seat of Knowledge in the Vale of Eternal Blossoms (BFA).\n4. Have someone summon a perky pug and use the toys, then /pray in front of the obelisk to be granted the Key of Shadows.\n\nThere is a 5-15 minute delay even if you do everything right. Everyone within 10 yards should get the key if anyone in range does it correctly.\n\nFully lights up the 2 O'clock basin",
						constant = "REQUIRES_THE_1_O_CLOCK_BASIN_TO_HAVE_BEEN",
						export = true,
						text = {
							en = "Requires the 1 O'clock basin to have been completed to see the obelisk personally.\n1. Acquire the Twitching Eyaball or All-Seeing Eyes toys\n2. Acquire a Perky Pug with either the Dogg-Saron costume from Vashti the Wandering Merchant in Azsuna or the Yipp-Saron costume from Hallow's End (or the AH.)\n3. Bring these items OR find a friend who has them and visit the Ny'Alotha Obelisk above the Seat of Knowledge in the Vale of Eternal Blossoms (BFA).\n4. Have someone summon a perky pug and use the toys, then /pray in front of the obelisk to be granted the Key of Shadows.\n\nThere is a 5-15 minute delay even if you do everything right. Everyone within 10 yards should get the key if anyone in range does it correctly.\n\nFully lights up the 2 O'clock basin",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要先完成 1 点钟方向的水池，才能亲自看到方尖碑。\n1. 获得抽搐的眼球或全视之眼玩具\n2. 获得一只活泼的哈巴狗，并搭配阿苏纳的流浪商人瓦什提出售的“多格萨隆”装束，或万圣节的“伊普萨隆”装束（也可从拍卖行购买）。\n3. 带上这些物品，或找一位拥有它们的朋友，前往锦绣谷（争霸艾泽拉斯）知识之座上方的尼奥罗萨方尖碑。\n4. 让某人召唤一只活泼的哈巴狗并使用玩具，然后在方尖碑前 /pray，即可获得暗影钥匙。\n\n即使你每一步都做对，也会有 5-15 分钟的延迟。只要范围内有人操作正确，10 码内的所有玩家都应能获得钥匙。\n\n可完全点亮 2 点钟方向的水池",
							-- TODO: tw = "",
						},
					}),
					["providers"] = {
						{ "n", 153297 },	-- Ny'Alotha Obelisk
						{ "n", 37865 },	-- Perky Pug
					},
					["groups"] = {
						n(153297, {	-- Ny'Alotha Obelisk
							["coord"] = { 83.7, 27.6, NZOTH_ASSAULT_VALE_OF_ETERNAL_BLOSSOMS },
							["providers"] = {
								{ "i", 175140 },	-- All Seeing Eyes
								{ "i", 168123 },	-- Twitching Eyeball
							},
							["cost"] = {
								{ "i", 229413, 1 },	-- "Dogg-Saron" Costume
								{ "i", 116812, 1 },	-- "Yipp-Saron" Costume
							},
							["groups"] = {
								i(53156, {	-- Key of Shadows
									["description"] = createLocalizationString({
										readable = "Opens both doors in the room with the Red Button.",
										constant = "OPENS_BOTH_DOORS_IN_THE_ROOM_WITH_THE_RED",
										export = true,
										text = {
											en = "Opens both doors in the room with the Red Button.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "打开红色按钮所在房间里的两扇门。",
											-- TODO: tw = "",
										},
									}),
								}),
							},
						}),
					},
				}),
				-- 3 O'clock Basin
				header(HEADERS.Item, 228967, bubbleDownSelf( {["sourceQuest"] = 84677 }, {	-- Acquire the Key of Shadows
					["description"] = createLocalizationString({
						readable = "1. Use the Key of Shadows to enter the room to the left of the Red Button. Fish up an Astral key from the bowl on the left bookshelf. Open the Astral chest in the same room, use the goggles.\n2. Interact with any of the consoles around the catacombs until you get a new actionbar. Can't see it? Look in your spellbook for a Number Sequence spell. Click the console again to submit your code.\n3. Enter the codes on adjacent consoles to open each of the chests, each Piece of Hate will give you an orb at the 3 O'clock basin, fully lighting with 9 orbs.",
						constant = "1_USE_THE_KEY_OF_SHADOWS_TO_ENTER_THE_ROOM_TO",
						export = true,
						text = {
							en = "1. Use the Key of Shadows to enter the room to the left of the Red Button. Fish up an Astral key from the bowl on the left bookshelf. Open the Astral chest in the same room, use the goggles.\n2. Interact with any of the consoles around the catacombs until you get a new actionbar. Can't see it? Look in your spellbook for a Number Sequence spell. Click the console again to submit your code.\n3. Enter the codes on adjacent consoles to open each of the chests, each Piece of Hate will give you an orb at the 3 O'clock basin, fully lighting with 9 orbs.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "1. 使用暗影钥匙进入红色按钮左边的房间。从左侧书架上的碗里钓出一把星界钥匙。打开同一个房间里的星界宝箱，使用护目镜。\n2. 与地下墓穴周围任意一个控制台互动，直到你获得新的动作条。看不到？在你的法术书中找“数字序列”法术。再次点击控制台提交你的代码。\n3. 在相邻的控制台上输入代码来打开每个宝箱，每块憎恨碎片都会在 3 点钟方向的水池给你一个宝珠，集齐 9 个宝珠即可完全点亮。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "i", 53156 },	-- Key of Shadows
					["groups"] = {
						i(228965),	-- Astral Key
						o(466393, {	-- Astral Chest
							["provider"] = { "i", 228965 },	-- Astral Key
							["coord"] = { 48.4, 79.5, 46 },	-- Karazhan Catacombs
							["groups"] = { i(228966) },	-- Starry-Eyed Goggles (TOY!)
						}),
						o(466400, {	-- Property of Elder Ko'nani
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 88224646",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 88224646",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：88224646",
									-- TODO: tw = "",
								},
							}),
							["coord"] = { 48.9, 80.3, 46 },	-- Karazhan Catacombs
							["questID"] = 84757,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466413, {	-- Encrypted Puzzle Box
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 17112317",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_2",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 17112317",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：17112317",
									-- TODO: tw = "",
								},
							}),
							["coord"] = { 42.9, 70.6, 46 },	-- Karazhan Catacombs
							["questID"] = 84758,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466479, {	-- Encrypted Chest
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 1533, 3457, 8265, or 10638",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_3",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 1533, 3457, 8265, or 10638",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：1533、3457、8265 或 10638",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 49.5, 65.1, 46 },	-- Karazhan Catacombs
							["questID"] = 84768,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466495, {	-- Encrypted Chest
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 19019",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_4",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 19019",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：19019",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 67.4, 84.3, 46 },	-- Karazhan Catacombs
							["questID"] = 84771,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466484, {	-- Encrypted Chest
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 5661",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_5",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 5661",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：5661",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 56.3, 62.6, 46 },	-- Karazhan Catacombs
							["questID"] = 84769,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466420, {	-- Rubenstein's Safe
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 52233",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_6",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 52233",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：52233",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 64.9, 48.3, 46 },	-- Karazhan Catacombs
							["questID"] = 84766,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466497, {	-- Encrypted Chest
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 51567",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_7",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 51567",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：51567",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 70.3, 55.4, 46 },	-- Karazhan Catacombs
							["questID"] = 84772,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						o(466489, {	-- Encrypted Chest
							["description"] = createLocalizationString({
								readable = "Code to open at the adjacent decryption console: 115",
								constant = "CODE_TO_OPEN_AT_THE_ADJACENT_DECRYPTION_CONSOLE_8",
								export = true,
								text = {
									en = "Code to open at the adjacent decryption console: 115",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在相邻的解密控制台输入的密码：115",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 66.3, 15.2, 46 },	-- Karazhan Catacombs
							["questID"] = 84770,	-- Orb
							["groups"] = { i(228967) },	-- Piece of Hate
						}),
						header(HEADERS.Quest, 84786, {	-- Acquire the Piece of Hate from the Lucky slot machine consoles
							["description"] = createLocalizationString({
								readable = "In the felcycle room is over a dozen slot machine consoles around the walls, any of them work for this coin. Variations of 777, 888 and 168 are correct answers but the machines only pay out a coin if you are deemed lucky.\nYour luck can be increased by obtaining at least 5 unique lucky things. It's not clear what counts but Blizzard states there are 13 possible lucky sources, some have been listed as a provider for this step. If you see the 'You feel lucky' emote in chat, you should be good, but try at least once anyway, the machine will pay out on first attempt if you're lucky enough, it is not random.\nNo chest will spawn, you will be given the Piece of Hate directly.",
								constant = "IN_THE_FELCYCLE_ROOM_IS_OVER_A_DOZEN_SLOT",
								export = true,
								text = {
									en = "In the felcycle room is over a dozen slot machine consoles around the walls, any of them work for this coin. Variations of 777, 888 and 168 are correct answers but the machines only pay out a coin if you are deemed lucky.\nYour luck can be increased by obtaining at least 5 unique lucky things. It's not clear what counts but Blizzard states there are 13 possible lucky sources, some have been listed as a provider for this step. If you see the 'You feel lucky' emote in chat, you should be good, but try at least once anyway, the machine will pay out on first attempt if you're lucky enough, it is not random.\nNo chest will spawn, you will be given the Piece of Hate directly.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在邪能摩托车房间的墙壁周围有十几个老虎机控制台，其中任何一个都能用于这枚硬币。777、888 和 168 的变体都是正确答案，但只有在你被认为足够幸运时，机器才会吐出一枚硬币。\n获取至少 5 件不同的幸运物品可以提高你的幸运值。目前尚不清楚什么才计入其中，但暴雪表示有 13 种可能的幸运来源，其中一些已被列为这一步的提供者。如果你在聊天中看到“你感觉很幸运”的表情，那就说明你没问题了，但无论如何至少试一次，只要足够幸运，机器第一次尝试就会吐币，这并不是随机的。\n不会生成宝箱，你会直接获得憎恨碎片。",
									-- TODO: tw = "",
								},
							}),
							["providers"] = {
								{ "i", 5373 },	-- Lucky Charm
								{ "i", 200265 },	-- Lucky Dragon's Claw
								{ "i", 198857 },	-- Lucky Duck
								{ "i", 198400 },	-- Lucky Horseshoe
								{ "i", 138382 },	-- Lucky Rat's Tooth
								{ "i", 138385 },	-- Lucky Shirt
								{ "i", 202046 },	-- Lucky Tortollan Charm
							},
							["groups"] = {
								i(228967),	-- Piece of Hate
								hqt(84786, {	-- Orb
									["name"] = "Acquire the Piece of Hate from the Lucky slot machine consoles",
								}),
							},
						}),
					},
				})),
				-- 4 O'clock Basin
				hqt(84780, {	-- Use the Scroll of Fel Binding at Uther's Tomb
					["name"] = "Use the Scroll of Fel Binding at Uther's Tomb",
					["description"] = createLocalizationString({
						readable = "1. Use the Scroll of Fel Binding sold by Vashti the Wandering Merchant in Azsuna (Broken Isles) right outside Uther's Tomb in the Western Plaugelands.\n2. You will die, return to your corpse and fight the Doomguard while inspecting the four writings on the floor of the tomb. Anyone can summon the demon and writings will stay visible as long as it lives.\n\nFully lights up the 4 O'clock basin.",
						constant = "1_USE_THE_SCROLL_OF_FEL_BINDING_SOLD_BY_VASHTI",
						export = true,
						text = {
							en = "1. Use the Scroll of Fel Binding sold by Vashti the Wandering Merchant in Azsuna (Broken Isles) right outside Uther's Tomb in the Western Plaugelands.\n2. You will die, return to your corpse and fight the Doomguard while inspecting the four writings on the floor of the tomb. Anyone can summon the demon and writings will stay visible as long as it lives.\n\nFully lights up the 4 O'clock basin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "1. 使用由阿苏纳（破碎群岛）的流浪商人瓦什提出售的邪能束缚卷轴，就在西瘟疫之地乌瑟尔之墓的外面。\n2. 你会死亡，跑尸后一边查看墓穴地板上的四段文字，一边与末日守卫战斗。任何人都可以召唤这个恶魔，只要它还活着，文字就会保持可见。\n\n可完全点亮 4 点钟方向的水池。",
							-- TODO: tw = "",
						},
					}),
					["cost"] = { { "i", 228987, 1 }	},	-- Scroll of Fel Binding
					["coord"] = { 52.1, 85.1, WESTERN_PLAGUELANDS },
				}),
				-- 5 O'clock Basin
				q(84781, {	-- Master of Secrets
					["description"] = createLocalizationString({
						readable = "1. Visit the Timeless isle and find Zarhym in the Cavern of Lost Spirits. Talk to Zarhym, a rare ghostly skull inside the entrance to enter the spirit realm.\n2. Within 5 minutes, Navigate to the back of the cave while avoiding ghosts to find Jeremy Feasel. Stay nearby to him, and you will not exit the spirit realm even if your 5 minutes buff expires.\n3. Defeat Jeremy in a pet battle using only 'secret' pets from the list. If someone in your group beats him in a battle, that also counts and he will grant you the quest too on talking to him. The pets MUST be level 25.\n\nFully lights up the 5 O'clock basin.\n\nValid pets:\nBaa'l, Bumbles, Filthy Slime, Francois, Gizmo the Pure, Glimr, Hungering Claw, Jenafur, Lil' Abom, Nelthara, Phoenix Wishwing, Renny, Snowclaw Cub, Spyragos, Sun Darter Hatchling, Taptaf, Terky, Tobias, Wicker Pup",
						constant = "1_VISIT_THE_TIMELESS_ISLE_AND_FIND_ZARHYM_IN",
						export = true,
						text = {
							en = "1. Visit the Timeless isle and find Zarhym in the Cavern of Lost Spirits. Talk to Zarhym, a rare ghostly skull inside the entrance to enter the spirit realm.\n2. Within 5 minutes, Navigate to the back of the cave while avoiding ghosts to find Jeremy Feasel. Stay nearby to him, and you will not exit the spirit realm even if your 5 minutes buff expires.\n3. Defeat Jeremy in a pet battle using only 'secret' pets from the list. If someone in your group beats him in a battle, that also counts and he will grant you the quest too on talking to him. The pets MUST be level 25.\n\nFully lights up the 5 O'clock basin.\n\nValid pets:\nBaa'l, Bumbles, Filthy Slime, Francois, Gizmo the Pure, Glimr, Hungering Claw, Jenafur, Lil' Abom, Nelthara, Phoenix Wishwing, Renny, Snowclaw Cub, Spyragos, Sun Darter Hatchling, Taptaf, Terky, Tobias, Wicker Pup",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "1. 前往永恒岛，在迷失灵魂洞穴中找到扎瑞姆。与入口内那个稀有的幽灵骷髅扎瑞姆交谈，即可进入灵魂世界。\n2. 在 5 分钟内，避开幽灵，前往洞穴深处找到杰里米·费塞尔。待在他附近，即使你的 5 分钟增益到期，你也不会离开灵魂世界。\n3. 仅使用列表中的“秘密”宠物，在宠物对战中击败杰里米。如果你队伍中的某人也在对战中击败了他，那同样算数，你与他交谈时他也会把任务给你。这些宠物必须是 25 级。\n\n可完全点亮 5 点钟方向的水池。\n\n有效宠物：\n巴尔、嗡嗡、肮脏的软泥怪、弗朗索瓦、纯净的吉兹莫、格利姆、饥饿之爪、珍娜芙、小憎恶、奈尔萨拉、凤凰许愿翼、雷尼、雪爪幼崽、斯派拉戈斯、逐日雏龙、塔普塔夫、特基、托比亚斯、柳条幼崽",
							-- TODO: tw = "",
						},
					}),
					["sourceQuest"] = 84780,	-- Use the Scroll of Fel Binding at Uther's Tomb
					["qgs"] = {
						232048,	-- Jeremy Feasel
						141941,	-- Baa'l
						143730,	-- Bumbles
						160704,	-- Filthy Slime
						134406,	-- Francois
						229779,	-- Gizmo the Pure
						169514,	-- Glimr
						111984,	-- Hungering Claw
						159783,	-- Jenafur
						179008,	-- Lil' Abom
						204367,	-- Nelthara
						189117,	-- Phoenix Wishwing
						163897,	-- Renny
						192343,	-- Snowclaw Cub
						191381,	-- Spyragos
						61087,	-- Sun Darter Hatchling
						139770,	-- Taptaf
						16445,	-- Terky
						208643,	-- Tobias
						143189,	-- Wicker Pup
					},
					["coords"] = {
						{ 43.1, 41.4, TIMELESS_ISLE },
						{ 53.3, 56.8, 555 },	-- Cavern of Lost Spirits
						{ 39.6, 38.4, 555 },	-- Cavern of Lost Spirits
					},
					["crs"] = 71876,
					["groups"] = { i(228995) },	-- Golden Muffin
				}),
				-- 6 O'clock Basin
				hqt(84811, {	-- Acquire the Ancient Shaman Blood
					["name"] = "Acquire the Ancient Shaman Blood",
					["description"] = createLocalizationString({
						readable = "Use your Torch of Pyrreth at various alters to summon a Spirit of Collections. Perform several actions to appease the spirits on each alter of acquisition, an action may require summoning a mount, pet, or toy associated with each spirit, emoting in some way, or changing your transmog.\n\nSomeone in your phase can appease a spirit for you if nearby, but they must fulfill each part of a spirit's appeasement themselves. If one person covers mount, and another covers pet for example, it will not work.\n\nEach appeased spirit will add an orb to the 6 O'clock basin, and looting the final chest will light it fully.",
						constant = "USE_YOUR_TORCH_OF_PYRRETH_AT_VARIOUS_ALTERS_TO",
						export = true,
						text = {
							en = "Use your Torch of Pyrreth at various alters to summon a Spirit of Collections. Perform several actions to appease the spirits on each alter of acquisition, an action may require summoning a mount, pet, or toy associated with each spirit, emoting in some way, or changing your transmog.\n\nSomeone in your phase can appease a spirit for you if nearby, but they must fulfill each part of a spirit's appeasement themselves. If one person covers mount, and another covers pet for example, it will not work.\n\nEach appeased spirit will add an orb to the 6 O'clock basin, and looting the final chest will light it fully.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在各个祭坛使用你的皮雷斯火把来召唤收藏之灵。在每个获取祭坛上执行若干动作来安抚灵魂，某个动作可能需要召唤与每个灵魂相关的坐骑、宠物或玩具，以某种方式做表情，或者更改你的幻化。\n\n与你处于同一镜像的人如果就在附近，可以替你安抚灵魂，但每个人必须亲自完成安抚灵魂的每个部分。例如，如果一个人负责坐骑、另一个人负责宠物，那是行不通的。\n\n每个被安抚的灵魂都会在 6 点钟位置的水盆中添加一颗宝珠，拾取最终的宝箱会使其完全点亮。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "i", 208092 },	-- Torch of Pyrreth
					["groups"] = {
						hqt(84809, {	-- Appease the Spirit of Collections (Blood)
							["description"] = createLocalizationString({
								readable = "Confirmed actions to appease:\nMounts: Any with 'blood' in their name\n\nPets: Any with 'blood' in their name\n\nToys: Throbbing Blood Orb",
								constant = "CONFIRMED_ACTIONS_TO_APPEASE_MOUNTS_ANY_WITH",
								export = true,
								text = {
									en = "Confirmed actions to appease:\nMounts: Any with 'blood' in their name\n\nPets: Any with 'blood' in their name\n\nToys: Throbbing Blood Orb",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "已确认的安抚方式：\n坐骑：名称中带有“血”的任意坐骑\n\n宠物：名称中带有“血”的任意宠物\n\n玩具：搏动血球",
									-- TODO: tw = "",
								},
							}),
							["name"] = "Appease the Spirit of Collections (Blood)",
							["coord"] = { 77.1, 46.3, NORTHERN_STRANGLETHORN },
							["crs"] = 230430,
						}),
						hqt(84807, {	-- Appease the Spirit of Collections (Corruption)
							["description"] = createLocalizationString({
								readable = "Confirmed actions to appease:\nOutfit: Cloak of Overwhelming Corruption (or a cloak with the same appearance)\n\nEmotes: /cower with the spirit targeted\n\nMounts: Any with 'corrupted' in their name\n\nPets: Any with 'corrupted' in their name\n\nToys: Ring of Broken Promises, Accursed Tome of the Sargerei",
								constant = "CONFIRMED_ACTIONS_TO_APPEASE_OUTFIT_CLOAK_OF",
								export = true,
								text = {
									en = "Confirmed actions to appease:\nOutfit: Cloak of Overwhelming Corruption (or a cloak with the same appearance)\n\nEmotes: /cower with the spirit targeted\n\nMounts: Any with 'corrupted' in their name\n\nPets: Any with 'corrupted' in their name\n\nToys: Ring of Broken Promises, Accursed Tome of the Sargerei",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "已确认的安抚方式：\n幻化：压倒性腐蚀斗篷（或外观相同的斗篷）\n\n表情：选中该灵魂后使用 /cower\n\n坐骑：名称中带有“腐蚀”的任意坐骑\n\n宠物：名称中带有“腐蚀”的任意宠物\n\n玩具：破碎誓言指环、萨格雷的诅咒宝典",
									-- TODO: tw = "",
								},
							}),
							["name"] = "Appease the Spirit of Collections (Corruption)",
							["coord"] = { 77.5, 43.9, NORTHERN_STRANGLETHORN },
							["crs"] = 230424,
						}),
						hqt(84810, {	-- Appease the Spirit of Collections (Shadow)
							["description"] = createLocalizationString({
								readable = "Confirmed actions to appease:\nOutfit: Cloak of the Black Void (or a cloak with the same appearance)\n\nEmotes: /smirk with the spirit targeted\n\nPets: Lesser Voidcaller, Sir Shady Mrrgglton Junior, Voidwiggler\n\nToys: Shadowy Disguise, Void Totem",
								constant = "CONFIRMED_ACTIONS_TO_APPEASE_OUTFIT_CLOAK_OF_2",
								export = true,
								text = {
									en = "Confirmed actions to appease:\nOutfit: Cloak of the Black Void (or a cloak with the same appearance)\n\nEmotes: /smirk with the spirit targeted\n\nPets: Lesser Voidcaller, Sir Shady Mrrgglton Junior, Voidwiggler\n\nToys: Shadowy Disguise, Void Totem",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "已确认的安抚方式：\n幻化：黑暗虚空斗篷（或外观相同的斗篷）\n\n表情：选中该灵魂后使用 /smirk\n\n宠物：小型虚空召唤者、阴险先生莫格顿二世、虚空蠕虫\n\n玩具：暗影伪装、虚空图腾",
									-- TODO: tw = "",
								},
							}),
							["name"] = "Appease the Spirit of Collections (Shadow)",
							["coord"] = { 78.1, 46.3, NORTHERN_STRANGLETHORN },
							["crs"] = 230440,
						}),
						hqt(84806, {	-- Appease the Spirit of Collections (Sin)
							["description"] = createLocalizationString({
								readable = "Confirmed actions to appease:\nOutfit: Any sinstone back cosmetic\n\nPets: Sinheart\n\nToys: Bondable Sinstone",
								constant = "CONFIRMED_ACTIONS_TO_APPEASE_OUTFIT_ANY",
								export = true,
								text = {
									en = "Confirmed actions to appease:\nOutfit: Any sinstone back cosmetic\n\nPets: Sinheart\n\nToys: Bondable Sinstone",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "已确认的安抚方式：\n幻化：任意罪石背部装饰\n\n宠物：罪心\n\n玩具：可绑定罪石",
									-- TODO: tw = "",
								},
							}),
							["name"] = "Appease the Spirit of Collections (Sin)",
							["coord"] = { 78.3, 44.0, NORTHERN_STRANGLETHORN },
							["crs"] = 230423,
						}),
						hqt(84808, {	-- Appease the Spirit of Collections (Temptation)
							["description"] = createLocalizationString({
								readable = "Confirmed actions to appease:\nOutfit: Be naked\n\nEmotes: /flirt with the spirit targeted\n\nPets: Sister of Temptation\n\nToys: Moroes' Famous Polish, Steamy Romance Novel Kit",
								constant = "CONFIRMED_ACTIONS_TO_APPEASE_OUTFIT_BE_NAKED",
								export = true,
								text = {
									en = "Confirmed actions to appease:\nOutfit: Be naked\n\nEmotes: /flirt with the spirit targeted\n\nPets: Sister of Temptation\n\nToys: Moroes' Famous Polish, Steamy Romance Novel Kit",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "已确认的安抚方式：\n幻化：赤身裸体\n\n表情：选中该灵魂后使用 /flirt\n\n宠物：诱惑姐妹\n\n玩具：莫罗斯的著名鞋油、香艳小说套装",
									-- TODO: tw = "",
								},
							}),
							["name"] = "Appease the Spirit of Collections (Temptation)",
							["coord"] = { 77.1, 44.9, NORTHERN_STRANGLETHORN },
							["crs"] = 230425,
						}),
						o(466808, {	-- Chest of Acquisitions
							["description"] = createLocalizationString({
								readable = "Appears by the wall nearby the Shadow alter once each spirit has been appeased. Use your goggles to see it.",
								constant = "APPEARS_BY_THE_WALL_NEARBY_THE_SHADOW_ALTER",
								export = true,
								text = {
									en = "Appears by the wall nearby the Shadow alter once each spirit has been appeased. Use your goggles to see it.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "当每个灵魂都被安抚后，它会出现在暗影祭坛附近的墙边。使用你的护目镜才能看到它。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuests"] = {
								84809,	-- Appease the Spirit of Collections (Blood)
								84807,	-- Appease the Spirit of Collections (Corruption)
								84810,	-- Appease the Spirit of Collections (Shadow)
								84806,	-- Appease the Spirit of Collections (Sin)
								84808,	-- Appease the Spirit of Collections (Temptation)
								84781,	-- Master of Secrets
							},
							["provider"] = { "i", 228966 },	-- Starry-Eyed Goggles
							["coord"] = { 78.2, 47.7, NORTHERN_STRANGLETHORN },
							["groups"] = { i(229007)	},	-- Ancient Shaman Blood
						}),
					},
				}),
				-- 7 O'clock Basin
				hqt(84823, {	-- Acquire the Warden's Mirror
					["name"] = "Acquire the Warden's Mirror",
					["description"] = createLocalizationString({
						readable = "Empower your owl pet with the Owl statues in Azsuna then enter the Vault of the Wardens to find a Sentry Statue. Use it to solve a puzzle to receive the mirror.\n\nEmpowering your owl will add 4 orbs to the 7 O'clock basin, and solving the sentry puzzle will light it fully.",
						constant = "EMPOWER_YOUR_OWL_PET_WITH_THE_OWL_STATUES_IN",
						export = true,
						text = {
							en = "Empower your owl pet with the Owl statues in Azsuna then enter the Vault of the Wardens to find a Sentry Statue. Use it to solve a puzzle to receive the mirror.\n\nEmpowering your owl will add 4 orbs to the 7 O'clock basin, and solving the sentry puzzle will light it fully.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在阿苏纳用猫头鹰雕像强化你的猫头鹰宠物，然后进入守望者地窟寻找哨兵雕像。用它解开谜题即可获得镜子。\n\n强化你的猫头鹰会向 7 点钟方向的盆中添加 4 个法球，解开哨兵谜题则会将其完全点亮。",
							-- TODO: tw = "",
						},
					}),
					["maps"] = { AZSUNA, 710, 711, 712 },	-- Vault of the Wardens
					["groups"] = {
						header(HEADERS.Object, 254262, {	-- Owl of the Watchers
							["description"] = createLocalizationString({
								readable = "On the Isle of the Watchers in Azsuna are 9 Owl of the Watchers statues, on any shard, only 4 of them will be interactable at any given time.\n\nYou need an owl pet, the Fledgling Warden Owl sold by the Wardens quartermaster on the same island is confirmed to work, but other owls may work too.\n\nSummon your owl and don't let it disappear by flying too far away. Find an interactable statue and sit in the aura it creates with your pet until an audible sound cue plays and a secret magnifying glass icon appears over your head. Do that again for 4 different statue auras, Red, Green, Blue and Purple.\nYou'll know you're done when your owl has a distinct white orb above their head. Unlocks 4 orbs at Basin 7.",
								constant = "ON_THE_ISLE_OF_THE_WATCHERS_IN_AZSUNA_ARE_9_OWL",
								export = true,
								text = {
									en = "On the Isle of the Watchers in Azsuna are 9 Owl of the Watchers statues, on any shard, only 4 of them will be interactable at any given time.\n\nYou need an owl pet, the Fledgling Warden Owl sold by the Wardens quartermaster on the same island is confirmed to work, but other owls may work too.\n\nSummon your owl and don't let it disappear by flying too far away. Find an interactable statue and sit in the aura it creates with your pet until an audible sound cue plays and a secret magnifying glass icon appears over your head. Do that again for 4 different statue auras, Red, Green, Blue and Purple.\nYou'll know you're done when your owl has a distinct white orb above their head. Unlocks 4 orbs at Basin 7.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在阿苏纳的看守者之岛上有 9 座守望者猫头鹰雕像，无论哪个位面，任意时刻都只有其中 4 座可以互动。\n\n你需要一只猫头鹰宠物，同岛上守望者军需官出售的幼年守望者猫头鹰已确认可用，但其他猫头鹰可能也可以。\n\n召唤你的猫头鹰，别让它飞得太远而消失。找到一座可互动的雕像，与你的宠物一起待在它产生的光环中，直到响起可听见的音效并在你头顶出现一个秘密的放大镜图标。对 4 座不同雕像的光环重复此操作：红、绿、蓝、紫。\n当你的猫头鹰头顶出现一个明显的白色法球时，就说明你完成了。会解锁 7 号水池的 4 个光球。",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "n", 97128 },	-- Fledgling Warden Owl
							["coords"] = {	-- Likely objectids are 254261 - 254269
								{ 44.18, 72.41, AZSUNA },
								{ 40.54, 73.15, AZSUNA },
								{ 40.52, 75.19, AZSUNA },
								{ 37.10, 82.16, AZSUNA },
								{ 43.24, 85.30, AZSUNA },
								{ 43.66, 87.51, AZSUNA },
								{ 50.45, 91.67, AZSUNA },
								{ 47.48, 84.74, AZSUNA },
								{ 45.97, 84.06, AZSUNA },
							},	-- TODO: if we REALLY want to, we could source objectids for each statue but it'd be trial and error with coordinates since wowhead is missing data and debugger doesn't report.
							["groups"] = {
								hqt(39353, {	-- Empower your owl with the red statue aura
									["name"] = "Empower your owl with the red statue aura",
									["description"] = createLocalizationString({
										readable = "Unlocks an orb at the 7 O'clock basin.",
										constant = "UNLOCKS_AN_ORB_AT_THE_7_O_CLOCK_BASIN",
										export = true,
										text = {
											en = "Unlocks an orb at the 7 O'clock basin.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "可在 7 点钟方向的水池处解锁一颗宝珠。",
											-- TODO: tw = "",
										},
									})	-- Orb
								}),
								hqt(26741, {	-- Empower your owl with the green statue aura
									["name"] = "Empower your owl with the green statue aura",
									["description"] = "~L.UNLOCKS_AN_ORB_AT_THE_7_O_CLOCK_BASIN",	-- Orb
									["_drop"] = { "r" },	-- drop Alliance tag from API
								}),
								hqt(40721, {	-- Empower your owl with the blue statue aura
									["name"] = "Empower your owl with the blue statue aura",
									["description"] = "~L.UNLOCKS_AN_ORB_AT_THE_7_O_CLOCK_BASIN"	-- Orb
								}),
								hqt(26704, {	-- Empower your owl with the purple statue aura
									["name"] = "Empower your owl with the purple statue aura",
									["description"] = "~L.UNLOCKS_AN_ORB_AT_THE_7_O_CLOCK_BASIN"	-- Orb
								}),
							},
						}),
						o(466943, {	-- Sentry Statue
							["description"] = createLocalizationString({
								readable = "You must first have completed the previous steps with the watcher statues and empowering your owl.\n1. Clear Vault of the Wardens (any difficulty) with your owl pet summoned through to last boss.\n2. Pick up Elune's light from a statue in the corner of Cordana's arena and QUICKLY get back up to the first boss's room.\n3. Backtrack from the first boss room towards the dungeon entrance, enter the newly opened door on your right, the statue will sit in the center.",
								constant = "YOU_MUST_FIRST_HAVE_COMPLETED_THE_PREVIOUS",
								export = true,
								text = {
									en = "You must first have completed the previous steps with the watcher statues and empowering your owl.\n1. Clear Vault of the Wardens (any difficulty) with your owl pet summoned through to last boss.\n2. Pick up Elune's light from a statue in the corner of Cordana's arena and QUICKLY get back up to the first boss's room.\n3. Backtrack from the first boss room towards the dungeon entrance, enter the newly opened door on your right, the statue will sit in the center.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "你必须先完成与观察者雕像以及强化你的猫头鹰相关的前置步骤。\n1. 全程带着你的猫头鹰宠物打通守望者地窟（任意难度），直到最后一个首领。\n2. 从科达娜竞技场角落的一座雕像处拾取艾露恩之光，并迅速回到第一个首领的房间。\n3. 从第一个首领房间往回走向副本入口，进入你右侧新打开的门，雕像就在中央。",
									-- TODO: tw = "",
								},
							}),
							["provider"] = { "n", 97128 },	-- Fledgling Warden Owl
							["maps"] = { 710, 711, 712 },	-- Vault of the Wardens
							["groups"] = {
								i(229046, {	-- Sentry Statue
									["description"] = createLocalizationString({
										readable = "Place in the center platform before the last set of stairs leading to Glazer's platform in the Vault of Mirrors.",
										constant = "PLACE_IN_THE_CENTER_PLATFORM_BEFORE_THE_LAST",
										export = true,
										text = {
											en = "Place in the center platform before the last set of stairs leading to Glazer's platform in the Vault of Mirrors.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "放在通往镜子大厅中格雷泽平台的最后一段楼梯前的中央平台上。",
											-- TODO: tw = "",
										},
									})
								}),
							},
						}),
						hqt(84916, {	-- Place the Sentry Statue in the Vault of Mirrors
							["name"] = "Place the Sentry Statue in the Vault of Mirrors",
							["description"] = "~L.PLACE_IN_THE_CENTER_PLATFORM_BEFORE_THE_LAST",
							["maps"] = { 710, 711, 712 },	-- Vault of the Wardens
						}),
						o(466960, {	-- Treasure of the Wardens
							["description"] = createLocalizationString({
								readable = "Once you place the Sentry Statue in the Vault of Mirrors, a 5x5 grid of watcher statues will appear. You need to make each statue descend into the floor, but each statue you click will toggle the state of 4 other statues.\n\nThere are addons and website tools to solve this, for your sanity, use one. You may solve this secret in a group.\n\nFully lights up the 7 O'clock basin.",
								constant = "ONCE_YOU_PLACE_THE_SENTRY_STATUE_IN_THE_VAULT",
								export = true,
								text = {
									en = "Once you place the Sentry Statue in the Vault of Mirrors, a 5x5 grid of watcher statues will appear. You need to make each statue descend into the floor, but each statue you click will toggle the state of 4 other statues.\n\nThere are addons and website tools to solve this, for your sanity, use one. You may solve this secret in a group.\n\nFully lights up the 7 O'clock basin.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "将哨兵雕像放入镜像宝库后，会出现一个 5x5 的守望者雕像阵列。你需要让每座雕像都沉入地面，但每点击一座雕像都会切换另外 4 座雕像的状态。\n\n有插件和网站工具可以解开这个谜题，为了你的身心健康，请用它们。这个秘密可以由团队共同完成。\n\n会完全点亮 7 点钟方向的水池。",
									-- TODO: tw = "",
								},
							}),
							["providers"] = {
								{ "n", 97128 },	-- Fledgling Warden Owl
								{ "i", 208092 },	-- Torch of Pyrreth
							},
							["maps"] = { 710, 711, 712 },	-- Vault of the Wardens
							["crs"] = 109300,	-- Sentry
							["groups"] = { i(229054) },	-- Warden's Mirror
						}),
					},
				}),
				-- 8 O'clock Basin
				o(466975, {	-- Enigma Machine
					["description"] = createLocalizationString({
						readable = "On the left side of the hallway after the second stairwell.",
						constant = "ON_THE_LEFT_SIDE_OF_THE_HALLWAY_AFTER_THE",
						export = true,
						text = {
							en = "On the left side of the hallway after the second stairwell.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在第二段楼梯之后走廊的左侧。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 59.9, 42.6, 46 },	-- Karazhan Catacombs
					["groups"] = {
						hqt(84829, {	-- Insert the Ancient Shaman Blood into the Enigma Machine
							["name"] = "Insert the Ancient Shaman Blood into the Enigma Machine",
							["sourceQuest"] = 84811,	-- Acquire the Ancient Shaman Blood
							["cost"] = { { "i", 229007, 1 } },	-- Ancient Shaman Blood
						}),
						hqt(84830, {	-- Insert the Warden's Mirror into the Enigma Machine
							["name"] = "Insert the Warden's Mirror into the Enigma Machine",
							["sourceQuest"] = 84823,	-- Acquire the Warden's Mirror
							["cost"] = { { "i", 229054, 1 } },	-- Warden's Mirror
						}),
						hqt(84837, {	-- Decipher the Enigma Machine
							["name"] = "Decipher the Enigma Machine",
							["description"] = createLocalizationString({
								readable = "1. Hit begin on the console, then hit submit. A randomized number of rats will spawn in the catacombs.\n2. Count the number of Rats in the whole catacombs, use a targeting macro to make sure you don't miss one. There will also be Catacombs Rats, those DO NOT COUNT. Kill both types of rats once you are sure of your count so they cannot interfere with pressure plates.\n3. Depending on the number of rats, you need to drag a certain number of statues to a specific pressure plate and stack them, the beacon color will shift from Blue->Green->Yellow->Orange->Purple as a plate has 1->2->3->4->5 entities stack on it.\n4. Head back to the Enigma Machine and submit, you will be electrocuted if you get it wrong, leave and reset the instance if you do, restarting at lock 1. Otherwise, continue counting the next set of rats and submitting results using info from the next column until you've completed all 7 locks.\n\nPlate 1 is at 71.6, 20.1 at the top of the map in the felcycle room\nPlate 2 is at 68.5, 34.2 right at the entrance to the felcycle room\nPlate 3 is at 73.6, 43.0 behind the locked gate on the right of the map, use your Relic of Crystal Connections to teleport to the humming crystal in the room by targeting it\nPlate 4 is at 68.8, 50.9 in the center of the hallway opposite the felcycle room\nPlate 5 is at 73.6, 65.3 in the flooded dead end hallway right as you enter the catacombs\nPlate 6 is at 60.2, 71.6 on the left side of the hallway before the cat room\nPlate 7 is at 47.8, 78.9 in the corner of the room with the Astral chest\n\n[# Rats | Lock 1| Lock 2| Lock 3|\n[1 Rats | 1 > P1 | 1 > P2 | 1 > P3 |\n[2 Rats | 1 > P2 | 1 > P4 | 1 > P6 |\n[3 Rats | 1 > P3 | 1 > P6 | 2 > P2 |\n[4 Rats | 1 > P4 | 2 > P1 | 2 > P5 |\n[5 Rats | 1 > P5 | 2 > P3 | 3 > P1 |\n[6 Rats | 1 > P6 | 2 > P3 | 3 > P4 |\n[7 Rats | 1 > P7 | 2 > P7 | 1 > P1 |\n[8 Rats | 2 > P1 | 3 > P2 | 1 > P4 |\n[9 Rats | 2 > P2 | 3 > P4 | 1 > P7 |\n[10Rats| 2 > P3 | 3 > P6 | 2 > P3 |\nExample: Counting 2 rats during Lock 2, stack 1 statue on pressure plate 4.\n\nFully lights up the 8 O'clock basin.",
								constant = "1_HIT_BEGIN_ON_THE_CONSOLE_THEN_HIT_SUBMIT_A",
								export = true,
								text = {
									en = "1. Hit begin on the console, then hit submit. A randomized number of rats will spawn in the catacombs.\n2. Count the number of Rats in the whole catacombs, use a targeting macro to make sure you don't miss one. There will also be Catacombs Rats, those DO NOT COUNT. Kill both types of rats once you are sure of your count so they cannot interfere with pressure plates.\n3. Depending on the number of rats, you need to drag a certain number of statues to a specific pressure plate and stack them, the beacon color will shift from Blue->Green->Yellow->Orange->Purple as a plate has 1->2->3->4->5 entities stack on it.\n4. Head back to the Enigma Machine and submit, you will be electrocuted if you get it wrong, leave and reset the instance if you do, restarting at lock 1. Otherwise, continue counting the next set of rats and submitting results using info from the next column until you've completed all 7 locks.\n\nPlate 1 is at 71.6, 20.1 at the top of the map in the felcycle room\nPlate 2 is at 68.5, 34.2 right at the entrance to the felcycle room\nPlate 3 is at 73.6, 43.0 behind the locked gate on the right of the map, use your Relic of Crystal Connections to teleport to the humming crystal in the room by targeting it\nPlate 4 is at 68.8, 50.9 in the center of the hallway opposite the felcycle room\nPlate 5 is at 73.6, 65.3 in the flooded dead end hallway right as you enter the catacombs\nPlate 6 is at 60.2, 71.6 on the left side of the hallway before the cat room\nPlate 7 is at 47.8, 78.9 in the corner of the room with the Astral chest\n\n[# Rats | Lock 1| Lock 2| Lock 3|\n[1 Rats | 1 > P1 | 1 > P2 | 1 > P3 |\n[2 Rats | 1 > P2 | 1 > P4 | 1 > P6 |\n[3 Rats | 1 > P3 | 1 > P6 | 2 > P2 |\n[4 Rats | 1 > P4 | 2 > P1 | 2 > P5 |\n[5 Rats | 1 > P5 | 2 > P3 | 3 > P1 |\n[6 Rats | 1 > P6 | 2 > P3 | 3 > P4 |\n[7 Rats | 1 > P7 | 2 > P7 | 1 > P1 |\n[8 Rats | 2 > P1 | 3 > P2 | 1 > P4 |\n[9 Rats | 2 > P2 | 3 > P4 | 1 > P7 |\n[10Rats| 2 > P3 | 3 > P6 | 2 > P3 |\nExample: Counting 2 rats during Lock 2, stack 1 statue on pressure plate 4.\n\nFully lights up the 8 O'clock basin.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "1. 在控制台上点击开始，然后点击提交。地下墓穴中会随机生成一定数量的老鼠。\n2. 数清整个地下墓穴中的老鼠数量，使用目标宏确保不会漏掉任何一只。那里还会有地下墓穴老鼠，那些不算数。确定数量后把两种老鼠都杀掉，以免它们干扰压力板。\n3. 根据老鼠的数量，你需要把特定数量的雕像拖到特定的压力板上并堆叠起来。当一块压力板上有 1->2->3->4->5 个实体堆叠时，信标颜色会从蓝色->绿色->黄色->橙色->紫色变化。\n4. 返回谜语机器并提交。如果你弄错了会被电击，那样的话就离开并重置副本，从锁 1 重新开始。否则，继续数下一组老鼠，并使用下一列的信息提交结果，直到你完成全部 7 个锁。\n\n1 号压力板位于地图顶部邪能摩托房间的 71.6, 20.1\n2 号压力板位于邪能摩托房间入口处的 68.5, 34.2\n3 号压力板位于地图右侧锁住的大门后面的 73.6, 43.0，对准房间中嗡鸣的水晶使用你的水晶连接圣物即可传送过去\n4 号压力板位于邪能摩托房间对面走廊中央的 68.8, 50.9\n5 号压力板位于你刚进入地下墓穴时那条被水淹没的死胡同走廊的 73.6, 65.3\n6 号压力板位于猫房间之前走廊左侧的 60.2, 71.6\n7 号压力板位于有星界宝箱的房间角落的 47.8, 78.9\n\n[# 老鼠 | 锁 1| 锁 2| 锁 3|\n[1 只老鼠 | 1 > P1 | 1 > P2 | 1 > P3 |\n[2 只老鼠 | 1 > P2 | 1 > P4 | 1 > P6 |\n[3 只老鼠 | 1 > P3 | 1 > P6 | 2 > P2 |\n[4 只老鼠 | 1 > P4 | 2 > P1 | 2 > P5 |\n[5 只老鼠 | 1 > P5 | 2 > P3 | 3 > P1 |\n[6 只老鼠 | 1 > P6 | 2 > P3 | 3 > P4 |\n[7 只老鼠 | 1 > P7 | 2 > P7 | 1 > P1 |\n[8 只老鼠 | 2 > P1 | 3 > P2 | 1 > P4 |\n[9 只老鼠 | 2 > P2 | 3 > P4 | 1 > P7 |\n[10只老鼠| 2 > P3 | 3 > P6 | 2 > P3 |\n示例：在锁 2 期间数到 2 只老鼠，就在 4 号压力板上堆叠 1 座雕像。\n\n可完全点亮 8 点钟方向的水池。",
									-- TODO: tw = "",
								},
							}),
							["sourceQuests"] = {
								84829,	-- Insert the Ancient Shaman Blood into the Enigma Machine
								84830,	-- Insert the Warden's Mirror into the Enigma Machine
							},
							["provider"] = { "i", 228996 },	-- Relic of Crystal Connections
							["groups"] = {
								n(230653, {	-- Greed Statue
									["description"] = createLocalizationString({
										readable = "Right of the entrance of the felcycle room.",
										constant = "RIGHT_OF_THE_ENTRANCE_OF_THE_FELCYCLE_ROOM",
										export = true,
										text = {
											en = "Right of the entrance of the felcycle room.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "邪能摩托房间入口的右侧。",
											-- TODO: tw = "",
										},
									}),
									["coord"] = { 70.6, 34.5, 46 },	-- Karazhan Catacombs
								}),
								n(230654, {	-- Guardian Statue
									["description"] = createLocalizationString({
										readable = "Opposite the Enigma Machine.",
										constant = "OPPOSITE_THE_ENIGMA_MACHINE",
										export = true,
										text = {
											en = "Opposite the Enigma Machine.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在谜机对面。",
											-- TODO: tw = "",
										},
									}),
									["coord"] = { 61.2, 47.9, 46 },	-- Karazhan Catacombs
								}),
								n(230655, {	-- Watcher  Statue
									["description"] = createLocalizationString({
										readable = "On the right inside the room ahead of the Red Button.",
										constant = "ON_THE_RIGHT_INSIDE_THE_ROOM_AHEAD_OF_THE_RED",
										export = true,
										text = {
											en = "On the right inside the room ahead of the Red Button.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在红色按钮前方房间内的右侧。",
											-- TODO: tw = "",
										},
									}),
									["coord"] = { 43.4, 64.9, 46 },	-- Karazhan Catacombs
								}),
								n(230652, {	-- Nature Statue
									["description"] = createLocalizationString({
										readable = "In the room with the Astral Chest, left of the Red Button.",
										constant = "IN_THE_ROOM_WITH_THE_ASTRAL_CHEST_LEFT_OF_THE",
										export = true,
										text = {
											en = "In the room with the Astral Chest, left of the Red Button.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在有星界宝箱的房间里，红色按钮的左侧。",
											-- TODO: tw = "",
										},
									}),
									["coord"] = { 49.3, 75.9, 46 },	-- Karazhan Catacombs
								}),
								n(230657, {	-- Rage Statue
									["description"] = createLocalizationString({
										readable = "At the bottom of the entrance stairwell.",
										constant = "AT_THE_BOTTOM_OF_THE_ENTRANCE_STAIRWELL",
										export = true,
										text = {
											en = "At the bottom of the entrance stairwell.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在入口楼梯井的底部。",
											-- TODO: tw = "",
										},
									}),
									["coord"] = { 70.3, 79.1, 46 },	-- Karazhan Catacombs
								}),
								n(230596, {	-- Rat
									["description"] = createLocalizationString({
										readable = "This is a |cff4caf50VALID|r rat, it counts!",
										constant = "THIS_IS_A_CFF4CAF50VALID_R_RAT_IT_COUNTS",
										export = true,
										text = {
											en = "This is a |cff4caf50VALID|r rat, it counts!",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "这是一只|cff4caf50有效|r的老鼠，它算数！",
											-- TODO: tw = "",
										},
									}),
								}),
								n(230599, {	-- Catacombs Rat
									["description"] = createLocalizationString({
										readable = "This is an |cffff0000INVALID|r rat, it DOESN'T count!",
										constant = "THIS_IS_AN_CFFFF0000INVALID_R_RAT_IT_DOESN_T",
										export = true,
										text = {
											en = "This is an |cffff0000INVALID|r rat, it DOESN'T count!",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "这是一只|cffff0000无效|r的老鼠，它不算数！",
											-- TODO: tw = "",
										},
									}),
								}),
							},
						}),
					},
				}),
				-- 9 O'clock Basin
				o(467191, {	-- Encrypted Chest
					["description"] = createLocalizationString({
						readable = "Return to Pillar-nest Vosh to the left of Faerin's advance, navigate toward the back of the cave then turn around to find a wall you can climb, fall into a tunnel hidden in the wall.\n\nUse your Starry-Eyed goggles to reveal a translucent platform, use your Relic of Crystal Connections on the humming crystal to get up to it.\n\nCode to open at the adjacent decryption console: 84847078.\n\nFully lights the 9 O'clock Basin.",
						constant = "RETURN_TO_PILLAR_NEST_VOSH_TO_THE_LEFT_OF",
						export = true,
						text = {
							en = "Return to Pillar-nest Vosh to the left of Faerin's advance, navigate toward the back of the cave then turn around to find a wall you can climb, fall into a tunnel hidden in the wall.\n\nUse your Starry-Eyed goggles to reveal a translucent platform, use your Relic of Crystal Connections on the humming crystal to get up to it.\n\nCode to open at the adjacent decryption console: 84847078.\n\nFully lights the 9 O'clock Basin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "回到斐林先锋左侧的柱巢沃什，往洞穴深处走，然后转身找到一面可以攀爬的墙壁，掉进墙内隐藏的隧道。\n\n使用你的星眸护目镜显露出一处半透明平台，对嗡鸣的水晶使用你的水晶连接圣物即可上去。\n\n在相邻的解密控制台输入的密码：84847078。\n\n可完全点亮 9 点钟方向的水池。",
							-- TODO: tw = "",
						},
					}),
					["sourceQuest"] = 84837,	-- Decipher the Enigma Machine
					["providers"] = {
						{ "i", 228966 },	-- Starry-Eyed Goggles
						{ "i", 228996 },	-- Relic of Crystal Connections
					},
					["coords"] = {
						{ 55.1, 19.0, AZJ_KAHET },	-- Cave Entrance
						{ 56.4, 17.5, AZJ_KAHET },	-- Wall Tunnel
						{ 56.1, 17.9, AZJ_KAHET },	-- Encrypted Chest
					},
					["questID"] = 84854,	-- Fully lights the 9 O'clock basin
					["groups"] = {
						i(229348),	-- Incognitro, the Indecipherable Felcycle (MOUNT!)
						ach(40967),	-- Ratts' Revenge
					},
				}),
				-- 10 O'clock Basin
				n(230070, {	-- Red Button
					["description"] = createLocalizationString({
						readable = "Interacting with the button starts a 20 second timer, refreshing on clicking again. The orb to the left of the button reports how many times the button has been clicked within that window.",
						constant = "INTERACTING_WITH_THE_BUTTON_STARTS_A_20_SECOND",
						export = true,
						text = {
							en = "Interacting with the button starts a 20 second timer, refreshing on clicking again. The orb to the left of the button reports how many times the button has been clicked within that window.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与按钮互动会开始 20 秒的计时，再次点击会刷新。按钮左侧的宝珠会显示在该时间窗口内按钮被点击了多少次。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 47.4, 68.3, 46 },	-- Karazhan Catacombs
					["groups"] = {
						hqt(84702, {	-- Red Button x100
							["name"] = "Press the Red Button 100 times",
							["description"] = createLocalizationString({
								readable = "Unlocks an orb at the 10 O'clock basin.",
								constant = "UNLOCKS_AN_ORB_AT_THE_10_O_CLOCK_BASIN",
								export = true,
								text = {
									en = "Unlocks an orb at the 10 O'clock basin.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "解锁 10 点钟方向水池处的一个宝珠。",
									-- TODO: tw = "",
								},
							})	-- Orb
						}),
						hqt(84703, {	-- Red Button x1000
							["name"] = "Press the Red Button 1000 times",
							["description"] = "~L.UNLOCKS_AN_ORB_AT_THE_10_O_CLOCK_BASIN"	-- Orb
						}),
					},
				}),
				n(182086, {	-- Hek the Hungry Hornswog
					["description"] = createLocalizationString({
						readable = "Feed Hek a Bubblefilled Flounder to be vomited a Duck Egg.",
						constant = "FEED_HEK_A_BUBBLEFILLED_FLOUNDER_TO_BE_VOMITED",
						export = true,
						text = {
							en = "Feed Hek a Bubblefilled Flounder to be vomited a Duck Egg.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "喂给赫克一条气泡比目鱼，让它吐出一个鸭蛋。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 66.2, 70.2, THE_WAKING_SHORES },
					["cost"] = { { "i", 200638, 1 } },	-- Bubblefilled Flounder
					["groups"] = {
						o(616048, {	-- Duck Egg
							["coord"] = { 66.3, 70.2, THE_WAKING_SHORES },
							["timeline"] = { ADDED_12_0_1_LAUNCH },
							["groups"] = { i(260522) },	-- Duck Egg
						}),
					},
				}),
				n(197973, {	-- Papa
					["description"] = createLocalizationString({
						readable = "If Papa and the shiny gift are missing, click the nearby Papa's Feather to call him home.",
						constant = "IF_PAPA_AND_THE_SHINY_GIFT_ARE_MISSING_CLICK",
						export = true,
						text = {
							en = "If Papa and the shiny gift are missing, click the nearby Papa's Feather to call him home.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "如果帕帕和闪亮的礼物都不见了，点击附近的帕帕的羽毛把他叫回家。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 40.0, 78.3, VALDRAKKEN },
					["groups"] = {
						o(616053, {	-- Shiny Gift of Avian Appreciation
							["coord"] = { 40.0, 78.3, VALDRAKKEN },
							["provider"] = { "i", 260522 },	-- Duck Egg //Not removed? Probably supposed to be.
							--["cost"] = { { "i", 260522, 1 } },	-- Duck Egg
							["timeline"] = { ADDED_12_0_1_LAUNCH },
							["groups"] = { i(260532) },	-- Tuskarr Dinner Bell
						}),
					},
				}),
				n(184166, {	-- To'no <"The Greatest Explorer Ever">
					["description"] = createLocalizationString({
						readable = "Hiding on the Forbidden Reach in one of several locations, To'No and Ko will be stealthed until you're right on top of them. May not be up in any locations, you might have to loop around until a spawn. Disappears a few minutes after being found. \nThe second dialogue interaction awards the Oddsight Focus while the first gives you some random loot.",
						constant = "HIDING_ON_THE_FORBIDDEN_REACH_IN_ONE_OF_SEVERAL",
						export = true,
						text = {
							en = "Hiding on the Forbidden Reach in one of several locations, To'No and Ko will be stealthed until you're right on top of them. May not be up in any locations, you might have to loop around until a spawn. Disappears a few minutes after being found. \nThe second dialogue interaction awards the Oddsight Focus while the first gives you some random loot.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "隐藏在禁忌离岛的几处地点之一，托诺和科会一直处于潜行状态，直到你正好走到它们身上。可能任何地点都没有刷新，你可能需要绕圈等待刷新。被发现后几分钟就会消失。\n第二次对话交互会奖励概率之眼焦点，第一次则给予一些随机战利品。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 37.4, 23.2, THE_FORBIDDEN_REACH },
						{ 63.9, 50.7, THE_FORBIDDEN_REACH },
						{ 54.6, 55.4, THE_FORBIDDEN_REACH },
						{ 29.8, 47.5, THE_FORBIDDEN_REACH },
						{ 41.3, 38.0, THE_FORBIDDEN_REACH },
						{ 73.9, 37.6, THE_FORBIDDEN_REACH },
						{ 62.7, 61.4, THE_FORBIDDEN_REACH },
						{ 35.3, 40.7, THE_FORBIDDEN_REACH },
						{ 54.4, 46.4, THE_FORBIDDEN_REACH },
					},
					["groups"] = {
						i(260533, {	-- Oddsight Focus
							["cost"] = { { "i", 260532, 1 } },	-- Tuskarr Dinner Bell
							["timeline"] = { ADDED_12_0_1_LAUNCH },
						}),
					}
				}),
				hqt(93688, {	-- Acquire the Oddsight Focus
					["name"] = "Acquire the Oddsight Focus",
					["description"] = createLocalizationString({
						readable = "Obtaining the focus fully lights up the 10 O'Clock Basin and removes the void from 11 and 12 O'Clock.",
						constant = "OBTAINING_THE_FOCUS_FULLY_LIGHTS_UP_THE_10_O",
						export = true,
						text = {
							en = "Obtaining the focus fully lights up the 10 O'Clock Basin and removes the void from 11 and 12 O'Clock.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "获得该焦点后会完全点亮 10 点钟方向的水池，并清除 11 点和 12 点方向的虚空。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "i", 260533 },	-- Oddsight Focus
					["timeline"] = { ADDED_12_0_1_LAUNCH },
				}),
				-- 11 O'clock Basin
				n(255888, {	-- Divine Flame of Beledar
					["provider"] = { "i", 260533 },	-- Oddsight Focus
					["timeline"] = { ADDED_12_0_1_LAUNCH },
					["coord"] = { 33.2, 54.6, HALLOWFALL },
				}),
				hqt(93764, {	-- Radiant Singer
					["name"] = "Become a Radiant Singer",
					["description"] = createLocalizationString({
						readable = "This step is pretty complicated and requires a 40 man raid, you're also gonna probably need an addon like BeledarOrchestra.\n\nFully lights up the 11 O'Clock Basin.",
						constant = "THIS_STEP_IS_PRETTY_COMPLICATED_AND_REQUIRES_A",
						export = true,
						text = {
							en = "This step is pretty complicated and requires a 40 man raid, you're also gonna probably need an addon like BeledarOrchestra.\n\nFully lights up the 11 O'Clock Basin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此步骤相当复杂，需要 40 人团队，你可能还需要像 BeledarOrchestra 这样的插件。\n\n完全点亮 11 点钟盆地。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "n", 255888 },	-- Divine Flame of Beledar
					["timeline"] = { ADDED_12_0_1_LAUNCH },
					["groups"] = { ach(61516) },	-- Radiant Singer
				}),
				-- 12 O'clock Basin
				hqt(93765, {	-- Deliver the Orb of Shadows
					["name"] = "Deliver the Orb of Shadows",
					["description"] = createLocalizationString({
						readable = "Head to the southeast of Suramar near the coordinates. Use your Torch of Pyrreth to find a wandering invisible ghost, once found, an extra action button will spawn an Orb of Shadows.\n\nYou must take this orb to Golk the Rumble in the center of Azsuna at the second coordinates and talk to them. The player carrying the orb cannot take damage, jump, or swim, and enemies will spark periodically to attack them, a group of players and water walking of some kind will make this easier. Don't be over water for too long though or your buff will drop. The Starry-Eyed Goggles will stop the Darkness debuff.\n\nFully lights up the 12 O'Clock Basin.",
						constant = "HEAD_TO_THE_SOUTHEAST_OF_SURAMAR_NEAR_THE",
						export = true,
						text = {
							en = "Head to the southeast of Suramar near the coordinates. Use your Torch of Pyrreth to find a wandering invisible ghost, once found, an extra action button will spawn an Orb of Shadows.\n\nYou must take this orb to Golk the Rumble in the center of Azsuna at the second coordinates and talk to them. The player carrying the orb cannot take damage, jump, or swim, and enemies will spark periodically to attack them, a group of players and water walking of some kind will make this easier. Don't be over water for too long though or your buff will drop. The Starry-Eyed Goggles will stop the Darkness debuff.\n\nFully lights up the 12 O'Clock Basin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "前往苏拉玛东南部坐标附近。使用派瑞斯火炬找到一个游荡的隐形幽灵，找到后会出现一个额外动作按钮，可召唤出一颗暗影宝珠。\n\n你必须把这颗宝珠带到阿苏纳中心第二个坐标处的轰鸣者戈尔克那里并与之交谈。携带宝珠的玩家不能受到伤害、跳跃或游泳，敌人会周期性地迸出火花攻击该玩家，组一队玩家并使用某种水上行走手段会让这变得更容易。但不要在水面上停留太久，否则你的增益会消失。星眼护目镜可以阻止黑暗减益。\n\n完全点亮 12 点盆地。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 82.5, 67.4, SURAMAR },
						{ 57.8, 42.8, AZSUNA },
					},
					["timeline"] = { ADDED_12_0_1_LAUNCH },
					["groups"] = {
						i(262432, {	-- Weathered Lockbox
							iensemble(246973),	-- Ensemble: Fashion of the Fanatic Felcyclist
						}),
						i(262559),	-- Spare Key
					},
				}),
				o(616681, {	-- Hidden Footlocker
					["description"] = createLocalizationString({
						readable = "In the center of the Karazhan Catacombs clock room, can only be seen with buffs from the Oddsight Focus, Starry-Eyed Goggles, and having posession of the Spare Key.",
						constant = "IN_THE_CENTER_OF_THE_KARAZHAN_CATACOMBS_CLOCK",
						export = true,
						text = {
							en = "In the center of the Karazhan Catacombs clock room, can only be seen with buffs from the Oddsight Focus, Starry-Eyed Goggles, and having posession of the Spare Key.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在卡拉赞墓穴钟表室的中央，只有获得奇视聚焦器和星眼护目镜的增益，并持有备用钥匙时才可见。",
							-- TODO: tw = "",
						},
					}),
					["providers"] = {
						{ "i", 260533 },	-- Oddsight Focus
						{ "i", 228966 },	-- Starry-Eyed Goggles
					},
					["coord"] = { 68.5, 20.9, 46 },	-- Karazhan Catacombs
					["cost"] = { { "i", 262559, 1 } },	-- Spare Key
					["timeline"] = { ADDED_12_0_1_LAUNCH },
					["groups"] = { i(262561) },	-- Ratts' Journal, Page 317
				}),
				o(475116, {	-- Ordinary Pebble
					["description"] = createLocalizationString({
						readable = "These pebbles can be found throughout the catacombs.\n1. Halfway down the entrance stairwell, behind a candelabra sitting on the bannister.\n2. Behind the frame of the archway halfway down the entrance stairwell, opposite the skeleton sitting on the other side of the arch.\n3. To the left of the tilted Replica Owl of the Watchers in the first room after the entrance stairs.\n4. On the inside corner of the doorway to the cat room, interactable through the gate.\n5. In the hand of a skeleton in the corner of the hallway leading to the Felcycle.\n6. On a shelf in the back in the Nature statue room.",
						constant = "THESE_PEBBLES_CAN_BE_FOUND_THROUGHOUT_THE",
						export = true,
						text = {
							en = "These pebbles can be found throughout the catacombs.\n1. Halfway down the entrance stairwell, behind a candelabra sitting on the bannister.\n2. Behind the frame of the archway halfway down the entrance stairwell, opposite the skeleton sitting on the other side of the arch.\n3. To the left of the tilted Replica Owl of the Watchers in the first room after the entrance stairs.\n4. On the inside corner of the doorway to the cat room, interactable through the gate.\n5. In the hand of a skeleton in the corner of the hallway leading to the Felcycle.\n6. On a shelf in the back in the Nature statue room.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这些卵石可以在整个地下墓穴中找到。\n1. 在入口楼梯下到一半处，楼梯扶手上的烛台后面。\n2. 在入口楼梯下到一半处拱门框的后面，与拱门另一侧坐着的骷髅相对。\n3. 在入口楼梯后的第一个房间里，倾斜的守望者猫头鹰复制品的左侧。\n4. 在通往猫房间门口的角落里，可以隔着栅栏互动。\n5. 在通往邪能摩托的走廊角落里，一具骷髅的手中。\n6. 在自然雕像房间后部的一个架子上。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 70.1, 90.3, 46 },	-- Stair Pebble
						{ 70.3, 81.0, 46 },	-- Arch Pebble
						{ 70.5, 61.7, 46 },	-- Statue Pebble
						{ 56.3, 73.3, 46 },	-- Catgate Pebble
						{ 70.9, 53.9, 46 },	-- Skelly Pebble
						{ 47.0, 78.1, 46 },	-- Shelf Pebble
					},
				}),
				i(228953),	-- Rosy Spat
			},
		}),
	},
}))

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.TWW, {
	header(HEADERS.Achievement, 40967, {
		["timeline"] = { ADDED_11_0_5 },
		["groups"] = {
			-- Felcycle HQTs
			q(84718),	-- Flags and unflags CONSTANTLY all over the catacombs.
			q(85169),	-- Triggered on interacting with an ordinary pebble in the catacombs. Doesn't reliably trigger on first click, or from specific pebble locations, can unflag.
			q(85170),	-- Triggered on interacting with an ordinary pebble in the catacombs. Doesn't reliably trigger on first click, or from specific pebble locations, can unflag.
			q(85171),	-- Triggered on interacting with an ordinary pebble in the catacombs. Doesn't reliably trigger on first click, or from specific pebble locations, can unflag.
			q(85172),	-- Triggered on interacting with an ordinary pebble in the catacombs. Doesn't reliably trigger on first click, or from specific pebble locations, can unflag.
		},
	}),
}));
