---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(MALDRAXXUS, {
		n(SPECIAL, {
			n(182194, {	-- Baroness Vashj
				["coord"] = { 57.6, 92.0, MALDRAXXUS },
				["groups"] = {
					i(187923, {	-- Aurelid Lure (CI!)
						["description"] = createLocalizationString({
							readable = "Step 1: Fish up Strange Goop from the water around Hirukon.\nStep 2: Talk to Vashj in Maldraxxus.\nStep 3: Collect the Three items needed.\nStep 4: Collect the Aurelid Lure from Vashj.\n\nObtained each week for free after the first time.",
							constant = "STEP_1_FISH_UP_STRANGE_GOOP_FROM_THE_WATER",
							export = true,
							text = {
								en = "Step 1: Fish up Strange Goop from the water around Hirukon.\nStep 2: Talk to Vashj in Maldraxxus.\nStep 3: Collect the Three items needed.\nStep 4: Collect the Aurelid Lure from Vashj.\n\nObtained each week for free after the first time.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 1 步：在希鲁肯周围的水域钓起奇怪的黏液。\n第 2 步：与玛卓克萨斯的瓦丝琪交谈。\n第 3 步：收集所需的三种物品。\n第 4 步：从瓦丝琪处取得奥雷利德诱饵。\n\n首次获取后，每周可免费获得一次。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { ADDED_9_2_0 },
						["cost"] = {
							{ "i", 187662, 1 },	-- Strange Goop
							{ "i", 187916, 1 },	-- Coilclutch Vine
							{ "i", 187922, 1 },	-- Flipper Fish
							{ "i", 187915, 1 },	-- Pungent Blobfish
						},
					}),
				},
			}),
			i(183114, {	-- Carpal (PET!)
				["description"] = createLocalizationString({
					readable = "Combine with the other bones to craft the pet:\n|cFF0070ddAnimated Radius|r: Purchased from |cFFFFFFFFNalcorn Talsen|r in Maldraxxus. \n|cFF0070ddAnimated Ulna|r: A rare reward from pet battle WQs in Maldraxxus. \n|cFF0070ddFlexing Phalanges|r: Skeletal Hand Fragments (47.4, 62.1 in Maldraxxus).",
					constant = "COMBINE_WITH_THE_OTHER_BONES_TO_CRAFT_THE_PET",
					export = true,
					text = {
						en = "Combine with the other bones to craft the pet:\n|cFF0070ddAnimated Radius|r: Purchased from |cFFFFFFFFNalcorn Talsen|r in Maldraxxus. \n|cFF0070ddAnimated Ulna|r: A rare reward from pet battle WQs in Maldraxxus. \n|cFF0070ddFlexing Phalanges|r: Skeletal Hand Fragments (47.4, 62.1 in Maldraxxus).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与其他骨骼组合，制作出该宠物：\n|cFF0070dd活化桡骨|r：在玛卓克萨斯从|cFFFFFFFF纳尔科恩·塔尔森|r处购买。 \n|cFF0070dd活化尺骨|r：玛卓克萨斯宠物对战世界任务的稀有奖励。 \n|cFF0070dd弯曲指骨|r：骷髅手碎片（玛卓克萨斯 47.4, 62.1）。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = {
					{ "i", 183112, 1 },	-- 1x Animated Radius
					{ "i", 183111, 1 },	-- 1x Animated Ulna
					{ "i", 183113, 1 },	-- 1x Flexing Phalanges
				},
			}),
			n(182105, bubbleDownSelf({ ["timeline"] = { ADDED_9_1_5 } }, {	-- Mysterious Trashpile
				["description"] = createLocalizationString({
					readable = "Use /bow on the Mysterious Trashpile. (Cave Entrance is 44.59, 65.48).",
					constant = "USE_BOW_ON_THE_MYSTERIOUS_TRASHPILE_CAVE",
					export = true,
					text = {
						en = "Use /bow on the Mysterious Trashpile. (Cave Entrance is 44.59, 65.48).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "对神秘的垃圾堆使用 /bow。（洞穴入口位于 44.59, 65.48）。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 44.84, 67.89, MALDRAXXUS },
				["groups"] = {
					i(187878),	-- Saurid Soul (SS!)
				},
			})),
		}),
	}),
})));
