---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(STORMSONG_VALLEY, {
		n(SPECIAL, {
			hqt(53111, name(HEADERS.NPC, 143128, {	-- Rosaline Mildenhall (give Annealed Honey Amulet)
				["description"] = createLocalizationString({
					readable = "Obtain an |cFFFfffffAnnealed Honey Amulet|r from mobs in the Mildenhall Meadery area in Stormsong Valley (|cFFFfffff69.2, 68.8|r). It has a low droprate, so be patient!\n\nTrack down Rosaline Mildenhall in Boralus, listen to her story, give her the amulet, and accept the letter she gives you.\n\nRosaline can be found in one of the following locations: (|cFFFfffff51.5, 48.0|r), (|cFFFfffff55.5, 62.5|r), (|cFFFfffff58.1, 66.3|r), or (|cFFFfffff72.4, 73.3|r). If you can't enter the building to speak to her, you can use /tar and set an 'interact with target' keybind.",
					constant = "OBTAIN_AN_CFFFFFFFFANNEALED_HONEY_AMULET_R_FROM",
					export = true,
					text = {
						en = "Obtain an |cFFFfffffAnnealed Honey Amulet|r from mobs in the Mildenhall Meadery area in Stormsong Valley (|cFFFfffff69.2, 68.8|r). It has a low droprate, so be patient!\n\nTrack down Rosaline Mildenhall in Boralus, listen to her story, give her the amulet, and accept the letter she gives you.\n\nRosaline can be found in one of the following locations: (|cFFFfffff51.5, 48.0|r), (|cFFFfffff55.5, 62.5|r), (|cFFFfffff58.1, 66.3|r), or (|cFFFfffff72.4, 73.3|r). If you can't enter the building to speak to her, you can use /tar and set an 'interact with target' keybind.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从斯托颂谷地米登霍尔蜜酒庄区域（|cFFFfffff69.2, 68.8|r）的怪物身上获得 |cFFFfffff淬火蜂蜜护符|r。它的掉率很低，请耐心一些！\n\n在伯拉勒斯找到罗萨琳·米登霍尔，听完她的故事，把护符交给她，并接受她给你的信。\n\n罗萨琳可能出现在以下位置之一：（|cFFFfffff51.5, 48.0|r）、（|cFFFfffff55.5, 62.5|r）、（|cFFFfffff58.1, 66.3|r）或（|cFFFfffff72.4, 73.3|r）。如果你无法进入建筑与她交谈，可以使用 /tar 并设置一个“与目标互动”的快捷键。",
						-- TODO: tw = "",
					},
				}),
				["races"] = ALLIANCE_ONLY,
				["qg"] = 143128,	-- Rosaline Mildenhall
				["qi"] = 163699,	-- Annealed Honey Amulet
				["coords"] = {
					{ 52.7, 47.9, BORALUS },
					{ 55.5, 62.9, BORALUS },
					{ 58.1, 66.3, BORALUS },
					{ 72.4, 73.3, BORALUS },
				},
				["groups"] = {
					i(163702, {	-- Rosaline's Letter
						["b"] = 1,	-- technically not BoP listed in-game, but can only obtain via yourself
					}),
				},
			})),
			hqt(53200, name(HEADERS.NPC, 131793, {	-- Ancel Mildenhall (give Rosaline's Letter)
				["description"] = createLocalizationString({
					readable = "Give the letter to Ancel Mildenhall in Stormsong Valley at (|cFFFfffff68.8, 65.2|r), and he will offer you |cFFFFD700Bumbles the Bee|r.",
					constant = "GIVE_THE_LETTER_TO_ANCEL_MILDENHALL_IN",
					export = true,
					text = {
						en = "Give the letter to Ancel Mildenhall in Stormsong Valley at (|cFFFfffff68.8, 65.2|r), and he will offer you |cFFFFD700Bumbles the Bee|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "将信件交给斯托颂谷地（|cFFFfffff68.8, 65.2|r）的安塞尔·米登霍尔，他就会提供给你|cFFFFD700蜜蜂邦布尔斯|r。",
						-- TODO: tw = "",
					},
				}),
				["qg"] = 143128,	-- Rosaline Mildenhall
				["qi"] = 163702,	-- Rosaline's Letter
				["sourceQuest"] = 53111,	-- Annealed Honey Amulet (looted)
				["races"] = ALLIANCE_ONLY,
				["coord"] = { 68.8, 65.2, STORMSONG_VALLEY },
			})),
			q(53347, {	-- Bumbles the Bee
				["sourceQuest"] = 53200,	-- Rosaline's Letter (looted)
				["provider"] = { "n", 131793 },	-- Ancel Mildenhall
				["coord"] = { 68.8, 65.2, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					i(163780),	-- Raimond's Secret Ingredient (QI!)
				},
			}),
			q(53371, {	-- Let's Bee Friends
				["description"] = createLocalizationString({
					readable = "Complete this daily quest 7 times to receive the Bumbles pet in your mailbox.",
					constant = "COMPLETE_THIS_DAILY_QUEST_7_TIMES_TO_RECEIVE",
					export = true,
					text = {
						en = "Complete this daily quest 7 times to receive the Bumbles pet in your mailbox.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "完成该日常任务 7 次，即可在邮箱中收到邦布尔斯宠物。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 53347 },	-- Bumbles the Bee
				["provider"] = { "n", 132647 },	-- Ancel Mildenhall
				["coord"] = { 71.0, 69.2, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
				["isDaily"] = true,
				["groups"] = {
					ach(13062, {	-- Let's Bee Friends
						["races"] = ALLIANCE_ONLY,
					}),
					i(163776),	-- Bumbles (PET!)
					i(163720),	-- Mildenhall Growth Formula (QI!)
					i(156825),	-- Vial of Honey Slime (QI!)
				},
			}),
		}),
	}),
})));
