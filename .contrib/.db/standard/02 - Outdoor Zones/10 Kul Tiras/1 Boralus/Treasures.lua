---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(BORALUS, {
		n(TREASURES, {
			o(292673, {	-- A Damp Scroll
				["description"] = createLocalizationString({
					readable = "Located in the underwater cave in Stormsong Monastery. Scroll located in skeleton's hand next to altar.",
					constant = "LOCATED_IN_THE_UNDERWATER_CAVE_IN_STORMSONG",
					export = true,
					text = {
						en = "Located in the underwater cave in Stormsong Monastery. Scroll located in skeleton's hand next to altar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于斯托颂修道院的水下洞穴中。卷轴在祭坛旁骷髅的手中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 61.13, 84.15, BORALUS },	-- Entrance
				["questID"] = 52134,
			}),
			o(292674, {	-- A Damp Scroll
				["description"] = createLocalizationString({
					readable = "Located on the floor next to K'thir Occultist in Stormsong Monastery, down in a cellar.",
					constant = "LOCATED_ON_THE_FLOOR_NEXT_TO_K_THIR_OCCULTIST",
					export = true,
					text = {
						en = "Located on the floor next to K'thir Occultist in Stormsong Monastery, down in a cellar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于斯托颂修道院中克熙尔秘教徒旁边的地上，在一个地窖里。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 61.75, 78.12, BORALUS },	-- Entrance
				["questID"] = 52135,
			}),
			o(292675, {	-- A Damp Scroll
				["description"] = createLocalizationString({
					readable = "Located on the floor next to K'thir Occultist in Stormsong Monastery, down in another cellar.",
					constant = "LOCATED_ON_THE_FLOOR_NEXT_TO_K_THIR_OCCULTIST_2",
					export = true,
					text = {
						en = "Located on the floor next to K'thir Occultist in Stormsong Monastery, down in another cellar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于斯托颂修道院中克熙尔秘教徒旁边的地上，在另一个地窖里。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 70.33, 85.75, BORALUS },	-- Entrance
				["questID"] = 52137,
			}),
			o(292676, {	-- A Damp Scroll
				["description"] = createLocalizationString({
					readable = "Located underneath the deck in one of the concrete buildings in Stormsong Monastery.",
					constant = "LOCATED_UNDERNEATH_THE_DECK_IN_ONE_OF_THE",
					export = true,
					text = {
						en = "Located underneath the deck in one of the concrete buildings in Stormsong Monastery.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于斯托颂修道院其中一栋混凝土建筑的甲板下方。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 67.28, 79.80, BORALUS },	-- Scroll Location
				["questID"] = 52138,
			}),
			o(292677, {	-- A Damp Scroll
				["description"] = createLocalizationString({
					readable = "Located upstairs in the building before the underwater cave in Stormsong Monastery.",
					constant = "LOCATED_UPSTAIRS_IN_THE_BUILDING_BEFORE_THE",
					export = true,
					text = {
						en = "Located upstairs in the building before the underwater cave in Stormsong Monastery.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于斯托颂修道院水下洞穴之前那栋建筑的楼上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 63.03, 81.76, BORALUS },
				["questID"] = 52136,
			}),
			o(292843, {	-- Gem of Acquiescence
				["sourceQuest"] = 52195,	-- Secrets of the Depths
				["coord"] = { 62.31, 91.18, TIRAGARDE_SOUND },
				["groups"] = { i(161342) },	-- Gem of Acquiescence (TOY!)
			}),
			o(297905, {	-- Jay's Songbook
				["coord"] = { 53.01, 17.60, BORALUS },
				["questID"] = 53407,	-- Shanty of Inebriation [Criteria]
				["groups"] = { i(163716) },	-- Forbidden Sea Shanty of Inebriation
			}),
			o(292686, {	-- Ominous Altar
				["description"] = createLocalizationString({
					readable = "Once you have clicked all five damp scrolls, return to the altar in the underwater cave. From there you will click the altar and click each time a new line comes up. Once all five are entered it will ask you are sure hit \"Accept\". You will then be teleported (way south of Tiragarde Sound) where a gem will be in front of you. Click it to open it up and receive the toy.",
					constant = "ONCE_YOU_HAVE_CLICKED_ALL_FIVE_DAMP_SCROLLS",
					export = true,
					text = {
						en = "Once you have clicked all five damp scrolls, return to the altar in the underwater cave. From there you will click the altar and click each time a new line comes up. Once all five are entered it will ask you are sure hit \"Accept\". You will then be teleported (way south of Tiragarde Sound) where a gem will be in front of you. Click it to open it up and receive the toy.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击全部五张潮湿的卷轴后，返回水下洞穴中的祭坛。在那里点击祭坛，每当出现新的一行就点击一次。五行全部输入后，它会询问你是否确定，点击“接受”。随后你会被传送（提拉加德海峡最南端），面前会有一颗宝石。点击它将其打开，即可获得玩具。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = {
					52134,	-- A Damp Scroll
					52135,	-- A Damp Scroll
					52136,	-- A Damp Scroll
					52137,	-- A Damp Scroll
					52138,	-- A Damp Scroll
				},
				["coord"] = { 61.13, 84.15, BORALUS },	-- Entrance
				["questID"] = 52195,	-- Secrets of the Depths
			}),
			o(293131, {	-- Pepe
				["description"] = createLocalizationString({
					readable = "Located inside the fish tank of |cFFFFD700Catherine Morgan's|r cat house.",
					constant = "LOCATED_INSIDE_THE_FISH_TANK_OF",
					export = true,
					text = {
						en = "Located inside the fish tank of |cFFFFD700Catherine Morgan's|r cat house.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于|cFFFFD700凯瑟琳·摩根|r猫舍的鱼缸里。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 54.01, 71.01, BORALUS },
				["groups"] = { i(161451) },	-- A Tiny Diving Helmet (Pepe!)
			}),
			o(297906, {	-- Russel's Songbook
				["coord"] = { 72.48, 69.24, BORALUS },
				["questID"] = 53408,	-- Shanty of the Lively Men [Criteria]
				["groups"] = { i(163714) },	-- Forbidden Sea Shanty of the Lively Men
			}),
			o(284469, {	-- Small Treasure Chest
				["coord"] = { 70.3, 85.2, BORALUS },
			}),
		}),
	}),
})));
