-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.SL, {
	header(HEADERS.Spell, 344577, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_5 } }, {	-- Bound Shadehound
		["description"] = createLocalizationString({
			readable = "Requires |cFF006812Appreciative|r reputation with Ve'nari and a total of 3,500 Stygia.\n\nEnable quest tracking to see all the steps.\n\nPurchase a |cFF0070ddStygia Dowser|r from Ve'nari for 1,500 Stygia.Throughout the secret, harvest every Stygia Nexus you find, as you will eventually need 200 |cFF1eff00Stygia Dust|r and |cFF1eff00Stygia Slivers|r.",
			constant = "REQUIRES_CFF006812APPRECIATIVE_R_REPUTATION",
			export = true,
			text = {
				en = "Requires |cFF006812Appreciative|r reputation with Ve'nari and a total of 3,500 Stygia.\n\nEnable quest tracking to see all the steps.\n\nPurchase a |cFF0070ddStygia Dowser|r from Ve'nari for 1,500 Stygia.Throughout the secret, harvest every Stygia Nexus you find, as you will eventually need 200 |cFF1eff00Stygia Dust|r and |cFF1eff00Stygia Slivers|r.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "需要与维娜莉达到|cFF006812感激|r声望，并总共拥有 3,500 冥殇。\n\n启用任务追踪即可查看所有步骤。\n\n在维娜莉处以 1,500 冥殇购买一个|cFF0070dd冥殇探测杖|r。在整个秘密过程中，遇到冥殇节点就采集，因为你最终需要 200 个|cFF1eff00冥殇之尘|r和|cFF1eff00冥殇裂片|r。",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = 1.1,
		["displayID"] = 92632,
		["maps"] = { THE_MAW },
		["cost"] = {{ "i", 184870, 1 }},	-- 1x Stygia Dowser
		["groups"] = {
			prof(STYGIA_CRAFTING, sharedData({ ["u"] = TRAINING }, {
				r(350276),	-- Armored Husk
				r(350399),	-- Stygia Bar
			})),
			i(185618),	-- Stygia Dust
			i(185617),	-- Stygia Sliver
			n(177073, {	-- Runed Chest
				["description"] = createLocalizationString({
					readable = "Click the first grapple point at |cFFFFFFFF23.1, 68.3|r and the next grapple point at |cFFFFFFFF23.7, 75.3|r.\n\nUse your |cFF0070ddStygia Dowser|r when you are on the platform covered with green fog, and you will be transformed into a spirit.\n\nEach of the spikes on the platform is topped with a glowing rune. To open the chest, match the runes in the puzzle to the positioning of the runes atop the spikes. With your back to the grapple point, start with the rune to your left and continue, moving clockwise.\n\n|cffde1c1cIf you match the runes incorrectly, you will die and get a debuff that prevents you from trying the puzzle again for 2 hours.|r",
					constant = "CLICK_THE_FIRST_GRAPPLE_POINT_AT_CFFFFFFFF23_1",
					export = true,
					text = {
						en = "Click the first grapple point at |cFFFFFFFF23.1, 68.3|r and the next grapple point at |cFFFFFFFF23.7, 75.3|r.\n\nUse your |cFF0070ddStygia Dowser|r when you are on the platform covered with green fog, and you will be transformed into a spirit.\n\nEach of the spikes on the platform is topped with a glowing rune. To open the chest, match the runes in the puzzle to the positioning of the runes atop the spikes. With your back to the grapple point, start with the rune to your left and continue, moving clockwise.\n\n|cffde1c1cIf you match the runes incorrectly, you will die and get a debuff that prevents you from trying the puzzle again for 2 hours.|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击|cFFFFFFFF23.1, 68.3|r处的第一个抓钩点，以及|cFFFFFFFF23.7, 75.3|r处的下一个抓钩点。\n\n当你站在被绿色雾气覆盖的平台上时，使用你的|cFF0070dd冥殇探水棒|r，你会被变成灵魂。\n\n平台上的每一根尖刺顶端都有一颗发光的符文。要打开宝箱，请把谜题中的符文与尖刺顶端符文的排布对应起来。背对抓钩点，从你左边的符文开始，按顺时针方向继续。\n\n|cffde1c1c如果你配对错误，你会死亡，并获得一个在 2 小时内无法再次尝试该谜题的减益。|r",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 63611,
				["coords"] = {
					{ 23.1, 68.3, THE_MAW },	-- First Grapple Point
					{ 23.7, 75.3, THE_MAW },	-- Second Grapple Point
				},
				["groups"] = {
					i(185056),	-- Crumbling Stele
				},
			}),
			i(185353, {	-- Rune Codex Page: Binding (CI!)
				["description"] = createLocalizationString({
					readable = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe coordinates are to the teleport pad that takes you to Dartanos's platform, and the page is all the way at the back on a table, behind where the rare spawns.",
					constant = "REQUIRES_A_CFF0070DDPARTIAL_RUNE_CODEX_R_WHICH",
					export = true,
					text = {
						en = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe coordinates are to the teleport pad that takes you to Dartanos's platform, and the page is all the way at the back on a table, behind where the rare spawns.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一本|cFF0070dd残缺的符文法典|r，完成该秘密的第一步后可在维娜莉处以 2,000 冥殇购买。\n\n坐标指向通往达尔塔诺斯平台的传送台，书页在最深处的一张桌子上，位于稀有刷新点的后方。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63611 },	-- Runed Chest
				["coords"] = {
					{ 24.6, 12.5, THE_MAW },
					{ 27.6, 17.3, THE_MAW },
				},
				["cost"] = { { "i", 185350, 1 } },	-- Partial Rune Codex
			}),
			i(185351, {	-- Rune Codex Page: Forging (CI!)
				["description"] = createLocalizationString({
					readable = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe coordinates are to a cave entrance, and the page is at the back of the cave on the left side.",
					constant = "REQUIRES_A_CFF0070DDPARTIAL_RUNE_CODEX_R_WHICH_2",
					export = true,
					text = {
						en = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe coordinates are to a cave entrance, and the page is at the back of the cave on the left side.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一本|cFF0070dd残缺的符文法典|r，完成该秘密的第一步后可在维娜莉处以 2,000 冥殇购买。\n\n坐标指向一处洞穴入口，书页在洞穴深处的左侧。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63611 },	-- Runed Chest
				["coord"] = { 48.8, 84.7, THE_MAW },
				["cost"] = { { "i", 185350, 1 } },	-- Partial Rune Codex
			}),
			i(185352, {	-- Rune Codex Page: Souls (CI!)
				["description"] = createLocalizationString({
					readable = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe page is on the right side of Thanassos' platform.",
					constant = "REQUIRES_A_CFF0070DDPARTIAL_RUNE_CODEX_R_WHICH_3",
					export = true,
					text = {
						en = "Requires a |cFF0070ddPartial Rune Codex|r, which you can purchase from Ve'nari for 2,000 Stygia after completing the first step of the secret.\n\nThe page is on the right side of Thanassos' platform.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一本|cFF0070dd残缺的符文法典|r，完成该秘密的第一步后可在维娜莉处以 2,000 冥殇购买。\n\n书页在塔纳索斯平台的右侧。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63611 },	-- Runed Chest
				["coord"] = { 27.2, 72.3, THE_MAW },
				["cost"] = { { "i", 185350, 1 } },	-- Partial Rune Codex
			}),
			i(185632, {	-- Intact Rune Codex (CI!)
				["description"] = createLocalizationString({
					readable = "Received after collecting and using all the Rune Codex Pages.",
					constant = "RECEIVED_AFTER_COLLECTING_AND_USING_ALL_THE",
					export = true,
					text = {
						en = "Received after collecting and using all the Rune Codex Pages.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "收集并使用所有符文法典书页后获得。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = {
					63643,	-- Rune Codex Page: Binding
					63641,	-- Rune Codex Page: Forging
					63642,	-- Rune Codex Page: Souls
				},
			}),
			i(185473, {	-- Soulforger's Tools (CI!)
				["description"] = createLocalizationString({
					readable = "Used for the |cFFb19cd9Bound Shadehound|r secret mount. Only available to characters who have collected the |cFFa335eeIntact Rune Codex|r.",
					constant = "USED_FOR_THE_CFFB19CD9BOUND_SHADEHOUND_R_SECRET_2",
					export = true,
					text = {
						en = "Used for the |cFFb19cd9Bound Shadehound|r secret mount. Only available to characters who have collected the |cFFa335eeIntact Rune Codex|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "用于 |cFFb19cd9束缚影犬|r 秘密坐骑。只有已收集 |cFFa335ee完好的符文法典|r 的角色才能获得。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63668 },	-- Intact Rune Codex
				["crs"] = { 166398 },	-- Soulforger Rhovus
			}),
			n(177392, {	-- Soulsteel Anvil
				["description"] = createLocalizationString({
					readable = "Once you have the |cFFa335eeIntact Rune Codex|r, you can collect |cFFa335eeSoulforger's Tools|r from the rare mob Soulforger Rhovus and finish collecting all your |cFF1eff00Stygia Dust|r and |cFF1eff00Stygia Slivers|r (200 of each).\n\nGrapple all the way up to the Soulsteel Anvil — the first grapple point is at |cFFFFFFFF23.0, 68.4|r, and the anvil is at |cFFFFFFFF20.2, 67.0|r.\n\nCraft 20 |cFF0070ddStygia Bar|r and 1 |cFFa335eeArmored Husk|r.",
					constant = "ONCE_YOU_HAVE_THE_CFFA335EEINTACT_RUNE_CODEX_R",
					export = true,
					text = {
						en = "Once you have the |cFFa335eeIntact Rune Codex|r, you can collect |cFFa335eeSoulforger's Tools|r from the rare mob Soulforger Rhovus and finish collecting all your |cFF1eff00Stygia Dust|r and |cFF1eff00Stygia Slivers|r (200 of each).\n\nGrapple all the way up to the Soulsteel Anvil — the first grapple point is at |cFFFFFFFF23.0, 68.4|r, and the anvil is at |cFFFFFFFF20.2, 67.0|r.\n\nCraft 20 |cFF0070ddStygia Bar|r and 1 |cFFa335eeArmored Husk|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "获得 |cFFa335ee完好的符文法典|r 后，你可以从稀有怪物缚魂者罗弗斯身上收集 |cFFa335ee缚魂者的工具|r，并凑齐所有的 |cFF1eff00冥殇之尘|r 和 |cFF1eff00冥殇碎片|r（各 200 个）。\n\n一路钩索攀爬到魂钢铁砧——第一个钩索点在 |cFFFFFFFF23.0, 68.4|r，铁砧位于 |cFFFFFFFF20.2, 67.0|r。\n\n制作 20 个 |cFF0070dd冥殇锭|r 和 1 个 |cFFa335ee装甲外壳|r。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63667 },	-- Soulforger's Tools
				["coords"] = {
					{ 23.0, 68.4, THE_MAW },	-- grapple point
					{ 20.2, 67.0, THE_MAW },	-- Soulsteel Anvil
				},
				["questID"] = 63707,
				["cost"] = { { "i", 185474, 1 }, },	-- Armored Husk
				["groups"] = {
					i(185630, {	-- Stygia Bar
						["cost"] = {
							{ "i", 185618, 10 },	-- 10x Stygia Dust
							{ "i", 185617, 10 },	-- 10x Stygia Sliver
						},
					}),
					i(185474, {	-- Armored Husk
						["cost"] = {
							{ "i", 185473, 1 },	-- Soulforger's Tools
							{ "i", 185630, 20 },	-- 20x Stygia Bar
						},
					}),
				},
			}),
			n(177195, {	-- Stray Soul
				["description"] = createLocalizationString({
					readable = "Find a Stray Soul patting along Gorgoa, the River of Souls. Interact with it, and you will receive a |cFFa335eeWilling Wolf Soul|r.\n\nThe coordinates are near the beginning of the soul's path, where it respawns, but if no one interacts with the soul it can pat all the way to |cFFFFFFFF49.8, 16.4|r.",
					constant = "FIND_A_STRAY_SOUL_PATTING_ALONG_GORGOA_THE",
					export = true,
					text = {
						en = "Find a Stray Soul patting along Gorgoa, the River of Souls. Interact with it, and you will receive a |cFFa335eeWilling Wolf Soul|r.\n\nThe coordinates are near the beginning of the soul's path, where it respawns, but if no one interacts with the soul it can pat all the way to |cFFFFFFFF49.8, 16.4|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "找到一只沿着灵魂之河戈尔戈阿游荡的迷途灵魂。与它互动，你将获得|cFFa335ee自愿的狼灵|r。\n\n坐标位于灵魂路径的起点附近，也就是它重新刷新的位置，但如果没有人与灵魂互动，它可能会一直游荡到|cFFFFFFFF49.8, 16.4|r。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 63707 },	-- Soulsteel Anvil
				["coord"] = { 23.2, 46.8, THE_MAW },	-- Beginning of the Path
				["questID"] = 63666,
				["groups"] = {
					i(185471),	-- Willing Wolf Soul
				},
			}),
			i(185475, {	-- Feral Shadehound
				["sourceQuests"] = { 63666 },
				["cost"] = {
					{ "i", 185474, 1 },	-- 1x Armored Husk
					{ "i", 185471, 1 },	-- 1x Willing Wolf Soul
				},
			}),
			q(63684, {	-- Feral Shadehound
				["description"] = createLocalizationString({
					readable = "Once you have the |cFFa335eeArmored Husk|r and the |cFFa335eeWilling Wolf Soul|r, click on the Binding Altar at |cFFFFFFFF45.2, 48.3|r.\n\n|cffde1c1cAs soon as you summon the mount, it will start running, so make sure you're facing towards the interior of the zone and that you won't run off the edge and into the void!|r\n\nOnce you're mounted, your hotkeys will be replaced with runes. Use them in the order provided by your |cFFa335eeCrumbling Stele|r, and you will receive the mount!",
					constant = "ONCE_YOU_HAVE_THE_CFFA335EEARMORED_HUSK_R_AND",
					export = true,
					text = {
						en = "Once you have the |cFFa335eeArmored Husk|r and the |cFFa335eeWilling Wolf Soul|r, click on the Binding Altar at |cFFFFFFFF45.2, 48.3|r.\n\n|cffde1c1cAs soon as you summon the mount, it will start running, so make sure you're facing towards the interior of the zone and that you won't run off the edge and into the void!|r\n\nOnce you're mounted, your hotkeys will be replaced with runes. Use them in the order provided by your |cFFa335eeCrumbling Stele|r, and you will receive the mount!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "获得 |cFFa335ee装甲外壳|r 和 |cFFa335ee自愿的狼魂|r 后，点击位于 |cFFFFFFFF45.2, 48.3|r 的束缚祭坛。\n\n|cffde1c1c召唤坐骑后它会立刻开始奔跑，所以请确保你面朝区域内部，不会跑出边缘坠入虚空！|r\n\n骑上坐骑后，你的快捷键会被替换为符文。按照你的 |cFFa335ee崩裂石碑|r 给出的顺序使用它们，即可获得该坐骑！",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 185475 },	-- Feral Shadehound
				["groups"] = {
					i(184168),	-- Bound Shadehound (MOUNT!)
					i(185616),	-- Summon Feral Shadehound (QI!)
				},
			}),
		},
	})),
}));
