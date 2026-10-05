---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local function bo(questID, isDaily)
    return { ["questID"] = questID, ["isDaily"] = isDaily };
end

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_WAKING_SHORES, {
		n(RARES, sharedData({ ["isDaily"] = true }, {
			-- n(193132),	-- Amethyzar the Glittering // under DF/Timed Based Rare
			n(187111, {	-- Ancient Hornswog
				["coord"] = { 77.6, 22.2, THE_WAKING_SHORES },
				["questID"] = 72835,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(187945, {	-- Anhydros the Tidetaker
				["coord"] = { 58.7, 40.3, THE_WAKING_SHORES },
				["questID"] = 73865,
			}),
			-- n(193135),	-- Azra's Prized Peony // under DF/Timed Based Rare
			n(193177, {	-- Beakers
				["questID"] = 73902,
				["coords"] = {
					{ 27.8, 78.8, THE_WAKING_SHORES },
					{ 30.2, 78.2, THE_WAKING_SHORES },
				},
			}),
			n(193198, {	-- Captain Lancer
				["coord"] = { 26.9, 76.1, THE_WAKING_SHORES },
				["questID"] = 73075,
				["groups"] = {
					bo(72127, true),
					i(200286),	-- Dragonbane Lance
				},
			}),
			n(187745, {	-- Disoriented Watcher
				["coord"] = { 67.8, 55.4, THE_WAKING_SHORES },
				["questID"] = 74092,
			}),
			n(191611, {	-- Dragonhunter Igordan
				["coord"] = { 64.3, 33.0, THE_WAKING_SHORES },
				["questID"] = 72838,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193217, {	-- Drakewing
				["description"] = createLocalizationString({
					readable = "Spawns at the top right of the river & follows it all the way down to the Dragonscale Basecamp. Once there, he cycles back to his spawnpoint, again following the river. Coordinates roughly show his path.",
					constant = "SPAWNS_AT_THE_TOP_RIGHT_OF_THE_RIVER_FOLLOWS_IT",
					export = true,
					text = {
						en = "Spawns at the top right of the river & follows it all the way down to the Dragonscale Basecamp. Once there, he cycles back to his spawnpoint, again following the river. Coordinates roughly show his path.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在河流右上方刷新，然后沿河一路向下直到龙鳞营地。到达后他会沿河返回刷新点，如此循环。坐标大致标示了他的路线。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 73.6, 46.4, THE_WAKING_SHORES },
					{ 69.2, 59.6, THE_WAKING_SHORES },
					{ 54.0, 34.6, THE_WAKING_SHORES },
					{ 55.2, 59.2, THE_WAKING_SHORES },
					{ 47.2, 78.0, THE_WAKING_SHORES },
				},
				["questID"] = 73874,
				["groups"] = {
					i(200219),	-- Dangerous Drapery
				},
			}),
			n(193134, {	-- Enkine the Voracious
				["description"] = createLocalizationString({
					readable = "Can only be summoned by fishing with the Lava Spices buff active at 22 65 in the Waking Shores. Lava Spices can be obtained by killing Restless Lava, Lavaslurpers and Basalt Shells along the lava river leading to the rare.",
					constant = "CAN_ONLY_BE_SUMMONED_BY_FISHING_WITH_THE_LAVA",
					export = true,
					text = {
						en = "Can only be summoned by fishing with the Lava Spices buff active at 22 65 in the Waking Shores. Lava Spices can be obtained by killing Restless Lava, Lavaslurpers and Basalt Shells along the lava river leading to the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "只有在觉醒海岸 22 65 处、带有熔岩香料增益时钓鱼才能召唤。熔岩香料可通过击杀通往该稀有怪沿途熔岩河中的躁动熔岩、岩浆吮吸者和玄武岩壳获得。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 40.3, 64.9, THE_WAKING_SHORES },	-- The Rare
					{ 22.0, 64.9, THE_WAKING_SHORES },	-- Fishing Spot
				},
				["cost"] = { { "i", 201092, 1 } },	-- 1x Lava Spices
				["questID"] = 73072,
				["groups"] = {
					bo(72128, true),
					i(200167),	-- Regurgitated Stone Handaxe
				},
			}),
			n(195915, {	-- Firava the Rekindler
				["coord"] = { 56.9, 25.3, THE_WAKING_SHORES },
				["questID"] = 72839,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193154, {	-- Forgotten Gryphon
				["coord"] = { 33.1, 76.3, THE_WAKING_SHORES },
				["questID"] = 73073,
				["groups"] = {
					bo(72130, true),
					i(200858),	-- Plume of the Forgotten
				},
			}),
			-- n(193226),	-- Gorjo the Crab Shackler // under DF/Timed Based Rare
			n(196056, {	-- Gushgut the Beaksinker
				["coord"] = { 52.6, 58.6, THE_WAKING_SHORES },
				["questID"] = 73879,
			}),
			-- n(186200),	-- Harkyn Grymstone // under DF/Timed Based Rare
			n(193263, {	-- Helmet Missingway
				["coord"] = { 43.4, 73.6, THE_WAKING_SHORES },
				["questID"] = 73880,
			}),
			n(187209, {	-- Klozicc the Ascended
				["coord"] = { 54.7, 82.3, THE_WAKING_SHORES },
				["questID"] = 72841,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193266, {	-- Lepidoralia the Resplendent
				["description"] = createLocalizationString({
					readable = "Talk to Collector Zik at the entrance to the cave and get a net. Start catching butterflies- no really, like, 200-400 butterflies. You'll be here a while.\n\nYou can talk to Collector Zik and select chat option 3: 'How many shimmerwings have you collected so far?' to get a hint toward your progress:\n0-33% I've only just started.\n34-66%We're making good progress.\n67-99%We're close to a discovery.",
					constant = "TALK_TO_COLLECTOR_ZIK_AT_THE_ENTRANCE_TO_THE",
					export = true,
					text = {
						en = "Talk to Collector Zik at the entrance to the cave and get a net. Start catching butterflies- no really, like, 200-400 butterflies. You'll be here a while.\n\nYou can talk to Collector Zik and select chat option 3: 'How many shimmerwings have you collected so far?' to get a hint toward your progress:\n0-33% I've only just started.\n34-66%We're making good progress.\n67-99%We're close to a discovery.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴入口处与收藏者兹克交谈并拿到一张网。然后开始抓蝴蝶——真的，大概要抓 200 到 400 只。你得在这儿待上一阵子了。\n\n你可以与收藏者兹克交谈并选择对话选项 3：“到目前为止你收集了多少只微光蝶？”来了解进度提示：\n0-33% 我才刚刚开始。\n34-66% 我们进展顺利。\n67-99% 我们离发现很近了。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 33.8, 85.8, THE_WAKING_SHORES },
				["questID"] = 74065,
				["groups"] = {
					bo(69891, true),
				},
			}),
			-- n(186827),	-- Magmaton // under DF/Timed Based Rare
			-- n(193152),	-- Massive Magmashell // under DF/Timed Based Rare
			n(190718, {	-- Monsoo, The Boiling Rage
				["coord"] = { 46.8, 57.3, THE_WAKING_SHORES },
				-- ["questID"] = ,
			}),
			n(193256, {	-- Nulltheria the Void Gazer
				["description"] = createLocalizationString({
					readable = "At the top of the Tower. Nearby ghostly telescopes will indicate her spawn timer:\n\n2 telescopes means roughly 2h30min till respawn.\n\n3 telescopes indicate 2h respawn till respawn.\n\n4 telescopes indicate 1h till respawn.",
					constant = "AT_THE_TOP_OF_THE_TOWER_NEARBY_GHOSTLY",
					export = true,
					text = {
						en = "At the top of the Tower. Nearby ghostly telescopes will indicate her spawn timer:\n\n2 telescopes means roughly 2h30min till respawn.\n\n3 telescopes indicate 2h respawn till respawn.\n\n4 telescopes indicate 1h till respawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在塔顶。附近幽灵般的望远镜会显示她的刷新计时：\n\n2 个望远镜表示大约 2 小时 30 分钟后刷新。\n\n3 个望远镜表示 2 小时后刷新。\n\n4 个望远镜表示 1 小时后刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 56.00, 45.87, THE_WAKING_SHORES },
				["questID"] = 73888,
				["groups"] = {
					i(200236),	-- Memory of Nulltheria
				},
			}),
			-- n(193118),	-- O'nank Shorescour // under DF/Timed Based Rare
			n(184853, {	-- Primal Scythid Queen
				["coord"] = { 81.3, 37.7, THE_WAKING_SHORES },
				["questID"] = 72843,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(192737, {	-- Qalashi War Mammoth
				["description"] = createLocalizationString({
					readable = "Marked with an icon on the map if they are up.",
					constant = "MARKED_WITH_AN_ICON_ON_THE_MAP_IF_THEY_ARE_UP",
					export = true,
					text = {
						en = "Marked with an icon on the map if they are up.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果它们已刷新，会在地图上以图标标记。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 33.8, 70.4, THE_WAKING_SHORES },
					{ 39.2, 68.2, THE_WAKING_SHORES },
					{ 47.0, 73.0, THE_WAKING_SHORES },
					{ 48.4, 65.8, THE_WAKING_SHORES },
					{ 53.0, 66.4, THE_WAKING_SHORES },
				},
				["questID"] = 73890,
				["groups"] = {	-- He "drops" 4 rare npcs upon dieing, but they have no drops. CRS doesnt seem useful
					n(192738),	-- Brundin the Dragonbane
					n(192741),	-- Flamebreaker Grella
					n(192744),	-- Scalemelter Dorbane
					n(192743),	-- Stonefist Rejara
				},
			}),
			n(193271, {	-- Shadeslash Trakken
				["description"] = createLocalizationString({
					readable = "Cave Entrance: 48.6, 74.3. Have to touch Focus, Globe and Telescope to spawn.",
					constant = "CAVE_ENTRANCE_48_6_74_3_HAVE_TO_TOUCH_FOCUS",
					export = true,
					text = {
						en = "Cave Entrance: 48.6, 74.3. Have to touch Focus, Globe and Telescope to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "洞穴入口：48.6, 74.3。必须触碰聚焦水晶、地球仪和望远镜才能刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 47.3, 73.9, THE_WAKING_SHORES },
				["questID"] = 74076,
				["groups"] = {
					bo(70719, true),
					i(200152),	-- Gleaming Blade of Insight
				},
			}),
			n(193181, {	-- Skewersnout <Raypier of the Deep>
				["description"] = createLocalizationString({
					readable = "Swims between these 2 coordinates.",
					constant = "SWIMS_BETWEEN_THESE_2_COORDINATES",
					export = true,
					text = {
						en = "Swims between these 2 coordinates.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在这两个坐标之间游动。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 38.8, 41.6, THE_WAKING_SHORES },
					{ 48.6, 16.4, THE_WAKING_SHORES },
				},
				["questID"] = 73895,
				["groups"] = {
					i(200132),	-- Skewer's Snout
				},
			}),
			n(193175, {	-- Slurpo, the Incredible Snail
				["description"] = createLocalizationString({
					readable = "Bring a Magical Salt Crystal from the Azure Span into the cave. If the pool is full of Unsalted Water Snails, use the Extra Action Button to summon the rare.",
					constant = "BRING_A_MAGICAL_SALT_CRYSTAL_FROM_THE_AZURE",
					export = true,
					text = {
						en = "Bring a Magical Salt Crystal from the Azure Span into the cave. If the pool is full of Unsalted Water Snails, use the Extra Action Button to summon the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "把一块魔法盐晶从碧蓝林海带进洞穴。如果水池里全是无盐水蜗牛，使用额外动作按钮召唤稀有生物。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 34.5, 89.7, THE_WAKING_SHORES },
				["questID"] = 74079,
				["cost"] = { { "i", 201033, 1 } },	-- 1x Magical Salt Crystal
				["groups"] = {
					bo(72126, true),
					i(200189),	-- Hydroforged Shell Helm
				},
			}),
			-- n(193120),	-- Smogswog the Firebreather // under DF/Timed Based Rare
			n(193171, {	-- Terillod the Devout
				["coord"] = { 60.6, 82.9, THE_WAKING_SHORES },
				["questID"] = 72850,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193148, {	-- Thunderous Matriarch
				["coord"] = { 45.4, 35.6, THE_WAKING_SHORES },
				["questID"] = 73899,
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.DF, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(DRAGON_ISLES, {
		m(THE_WAKING_SHORES, {
			n(RARES, {
				q(74000),	-- Triggers when killing Harkyn Grymstone's group (Snee, Groth and Voll)
				q(74033),	-- Triggers when killing Harkyn Grymstone's group (Snee, Groth and Voll)
				q(74037),	-- Triggers when killing Harkyn Grymstone's group (Snee, Groth and Voll)
			}),
		}),
	}),
})));
