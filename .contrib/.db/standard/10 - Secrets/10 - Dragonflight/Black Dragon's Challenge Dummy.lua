-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.DF, {
	header(HEADERS.Item, 201933, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {	-- Black Dragon's Challenge Dummy
		["description"] = createLocalizationString({
			readable = "***Debugg Mode enabled is required to see all the steps.***\n\nFollow the steps as ordered in the descriptions.",
			constant = "DEBUGG_MODE_ENABLED_IS_REQUIRED_TO_SEE_ALL_THE",
			export = true,
			text = {
				en = "***Debugg Mode enabled is required to see all the steps.***\n\nFollow the steps as ordered in the descriptions.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须启用调试模式才能看到所有步骤。***\n\n请按描述中的顺序执行步骤。",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = 1.6,
		["displayID"] = 110513,
		["groups"] = {
			o(377485, {	-- Sour Apple
				["description"] = createLocalizationString({
					readable = "Step 1: Get a Sour Apple.",
					constant = "STEP_1_GET_A_SOUR_APPLE",
					export = true,
					text = {
						en = "Step 1: Get a Sour Apple.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "第 1 步：获取一个酸苹果。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = .1,
				["coord"] = { 43.7, 71.7, THE_WAKING_SHORES },
				["groups"] = { i(194122) },	-- Sour Apple
			}),
			n(191851, {	-- Blacktalon Shadowclaw
				["description"] = createLocalizationString({
					readable = "Step 2: Use the Sour Apple on the Blacktalon Shadowclaw and then, mount up on it.",
					constant = "STEP_2_USE_THE_SOUR_APPLE_ON_THE_BLACKTALON",
					export = true,
					text = {
						en = "Step 2: Use the Sour Apple on the Blacktalon Shadowclaw and then, mount up on it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "第 2 步：对黑爪影爪使用酸苹果，然后骑上它。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = .8,
				["coord"] = { 43.2, 67.3, THE_WAKING_SHORES },
				["cost"] = { { "i", 194122, 1 } },	-- 1x Sour Apple
			}),
			o(379168, {	-- Lost Cache Key
				["description"] = createLocalizationString({
					readable = "Step 3: Loot the 'Lost Cache Key'.",
					constant = "STEP_3_LOOT_THE_LOST_CACHE_KEY",
					export = true,
					text = {
						en = "Step 3: Loot the 'Lost Cache Key'.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "第 3 步：拾取遗失的宝库钥匙。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = .2,
				["coord"] = { 43.7, 69.6, THE_WAKING_SHORES },
				["groups"] = { i(198085) },	-- Lost Obsidian Cache Key
			}),
			o(378857, {	-- Lost Obsidian Cache
				["description"] = createLocalizationString({
					readable = "Step 4: Venture into the cave to locate the 'Lost Obsidian Cache'.",
					constant = "STEP_4_VENTURE_INTO_THE_CAVE_TO_LOCATE_THE_LOST",
					export = true,
					text = {
						en = "Step 4: Venture into the cave to locate the 'Lost Obsidian Cache'.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "第 4 步：深入洞穴，找到遗失的黑曜石宝库。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 1.6,
				["coord"] = { 44.6, 70.1, THE_WAKING_SHORES },
				["questID"] = 70018,
				["cost"] = { { "i", 198085, 1 } },	-- 1x Lost Obsidian Cache Key
				["groups"] = { i(201933) },	-- Black Dragon's Challenge Dummy (TOY!)
			}),
		},
	})),
}));
