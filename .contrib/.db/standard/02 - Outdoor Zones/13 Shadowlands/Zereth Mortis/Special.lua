---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_2_0 } }, {
	m(ZERETH_MORTIS, {
		n(SPECIAL, {
			header(HEADERS.Item, 190196, bubbleDownSelf({ ["timeline"] = { ADDED_10_2_5 } }, {	-- Enlightened Hearthstone
				["description"] = createLocalizationString({
					readable = "To obtain this toy, you will need six people with the Sphere of Enlightened Cogitation toy.\nEach person with the toy needs to stand on top of one of the hexagon pillars surrounding the pool of water under the Forge of Afterlives, right at the center of Zereth Mortis, and use the toy while sitting.\nOne person needs to be in each pillar.\nIf all 6 people use the toy successfully at the same time, a zone-wide chat emote will show up - The Ponderer's Portal has been opened. Once this happens, simply head to the southern hexagon pillar and loot the toy from the Ponderer's Portal - The Portal looks like a white glowy sphere.",
					constant = "TO_OBTAIN_THIS_TOY_YOU_WILL_NEED_SIX_PEOPLE",
					export = true,
					text = {
						en = "To obtain this toy, you will need six people with the Sphere of Enlightened Cogitation toy.\nEach person with the toy needs to stand on top of one of the hexagon pillars surrounding the pool of water under the Forge of Afterlives, right at the center of Zereth Mortis, and use the toy while sitting.\nOne person needs to be in each pillar.\nIf all 6 people use the toy successfully at the same time, a zone-wide chat emote will show up - The Ponderer's Portal has been opened. Once this happens, simply head to the southern hexagon pillar and loot the toy from the Ponderer's Portal - The Portal looks like a white glowy sphere.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要获得此玩具，你需要六个拥有“启智之球”玩具的玩家。\n每个拥有该玩具的人都必须站在来世熔炉下方水池周围的六边形柱子上，位置就在扎雷殁提斯的正中央，并在坐下时使用玩具。\n每根柱子上都需要有一人。\n如果 6 个人同时成功使用玩具，会出现一条全区域聊天表情——冥想者的传送门已经开启。出现后，只需前往南侧的六边形柱子，从冥想者的传送门中拾取玩具——传送门看起来像一个白色的发光球体。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(190196),	-- Enlightened Hearthstone (TOY!)
				},
			})),
			i(189167, {	-- Glimmer of Satisfaction
				["description"] = "~L.EATING_A_EMPTY_KETTLE_OF_STONE_SOUP_ATT_I",
			}),
			o(375516, {	-- Lost Comb
				["description"] = createLocalizationString({
					readable = "Almost at the top of the pillar in a little nest attached to the side of the pillar. Require flying but might be doable during Portal Play and with Venthyr Ability.",
					constant = "ALMOST_AT_THE_TOP_OF_THE_PILLAR_IN_A_LITTLE",
					export = true,
					text = {
						en = "Almost at the top of the pillar in a little nest attached to the side of the pillar. Require flying but might be doable during Portal Play and with Venthyr Ability.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "几乎在石柱的顶部，一个附着在柱侧的小巢里。需要飞行，但也许可以借助传送门游戏和温西尔技能完成。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 63.3, 60.5, ZERETH_MORTIS },
				["groups"] = {
					i(189990),	-- Bee Soul (SS!)
				},
			}),
			n(185452, {	-- Lost Soul
				["description"] = createLocalizationString({
					readable = "In multiple hidden areas.",
					constant = "IN_MULTIPLE_HIDDEN_AREAS",
					export = true,
					text = {
						en = "In multiple hidden areas.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在多个隐藏区域中。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 43.9, 79.9, ZERETH_MORTIS },
					{ 30.4, 67.2, ZERETH_MORTIS },
					{ 37.0, 34.2, ZERETH_MORTIS },
					{ 37.6, 77.2, ZERETH_MORTIS },
					{ 38.2, 71.4, ZERETH_MORTIS },
					{ 38.4, 80.4, ZERETH_MORTIS },
					{ 38.6, 80.4, ZERETH_MORTIS },
					{ 43.8, 79.4, ZERETH_MORTIS },
					{ 49.8, 80.0, ZERETH_MORTIS },
					{ 58.4, 75.0, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189988),	-- Sheep Soul (SS!)
				},
			}),
			n(185279, {	-- Lost Soul
				["description"] = createLocalizationString({
					readable = "On top of an Orb.",
					constant = "ON_TOP_OF_AN_ORB",
					export = true,
					text = {
						en = "On top of an Orb.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在一个法球顶部。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 34.4, 71.3, ZERETH_MORTIS },
				["groups"] = {
					i(189989),	-- Penguin Soul (SS!)
				},
			}),
			i(187662, {	-- Strange Goop
				["description"] = createLocalizationString({
					readable = "Can be fished from around Hirukon spawn point, or purchased from auction house.",
					constant = "CAN_BE_FISHED_FROM_AROUND_HIRUKON_SPAWN_POINT",
					export = true,
					text = {
						en = "Can be fished from around Hirukon spawn point, or purchased from auction house.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在希鲁孔的刷新点附近钓到，或从拍卖行购买。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.2, 75.2, ZERETH_MORTIS },
			}),
		}),
	}),
})));
