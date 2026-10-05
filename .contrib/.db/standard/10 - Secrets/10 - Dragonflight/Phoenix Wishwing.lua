-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.DF, {
	header(HEADERS.Item, 193373, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_7 } }, {	-- Phoenix Wishwing
		["description"] = createLocalizationString({
			readable = "Below is a detailed explanation on how to obtain the Phoenix Wishwing pet.\n\n***This secret requires you to have debug mode enabled to see the steps. To enable debug mode right click the ATT icon on the minimap, navigate to the general tab and check the \"|Cff15abffDebug Mode|r |cFFFFFFFF(Show Everything)|r\" box.***",
			constant = "BELOW_IS_A_DETAILED_EXPLANATION_ON_HOW_TO_2",
			export = true,
			text = {
				en = "Below is a detailed explanation on how to obtain the Phoenix Wishwing pet.\n\n***This secret requires you to have debug mode enabled to see the steps. To enable debug mode right click the ATT icon on the minimap, navigate to the general tab and check the \"|Cff15abffDebug Mode|r |cFFFFFFFF(Show Everything)|r\" box.***",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "以下是如何获得凤凰许愿翼宠物的详细说明。\n\n***这个秘密需要你启用调试模式才能看到步骤。要启用调试模式，请右键点击小地图上的 ATT 图标，进入常规标签页，勾选“|Cff15abff调试模式|r |cFFFFFFFF（显示全部）|r”复选框。***",
				-- TODO: tw = "",
			},
		}),
		["displayID"] = 106643,
		["groups"] = {
			o(13000040, {	-- Step 1: Phoenix Ash Talisman
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 1:|r Obtain the Phoenix Ash Talisman from Zektar in Spires of Arak.",
					constant = "CFFFFFFFFSTEP_1_R_OBTAIN_THE_PHOENIX_ASH",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 1:|r Obtain the Phoenix Ash Talisman from Zektar in Spires of Arak.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 在阿兰卡峰林从泽克塔尔处获得凤凰灰烬护符。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 199203 },	-- Phoenix Ash Talisman
				["groups"] = {
					o(13000041, {	-- Step 1A: Glittering Phoenix Ember
						["description"] = createLocalizationString({
							readable = "|cFFFFFFFFStep 1A:|r Obtain the Glittering Phoenix Ember from Alysrazor in Firelands Timewalking.",
							constant = "CFFFFFFFFSTEP_1A_R_OBTAIN_THE_GLITTERING",
							export = true,
							text = {
								en = "|cFFFFFFFFStep 1A:|r Obtain the Glittering Phoenix Ember from Alysrazor in Firelands Timewalking.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "|cFFFFFFFF第 1A 步：|r 在火焰之地时光漫游中从奥利瑟拉佐尔处获得闪烁的凤凰余烬。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 199099 },	-- Glittering Phoenix Ember
					}),
					o(13000042, {	-- Step 1B: Inert Phoenix Ash
						["description"] = createLocalizationString({
							readable = "|cFFFFFFFFStep 1B:|r Obtain 20 Inert Phoenix Ash from fire elementals in Un'Goro Crater.",
							constant = "CFFFFFFFFSTEP_1B_R_OBTAIN_20_INERT_PHOENIX_ASH",
							export = true,
							text = {
								en = "|cFFFFFFFFStep 1B:|r Obtain 20 Inert Phoenix Ash from fire elementals in Un'Goro Crater.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "|cFFFFFFFF第 1B 步：|r 在安戈洛环形山从火元素身上获得 20 个惰性凤凰灰烬。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 199092 },	-- Inert Phoenix Ash
					}),
					o(13000043, {	-- Step 1C: Sacred Phoenix Ash
						["description"] = createLocalizationString({
							readable = "|cFFFFFFFFStep 1C:|r Obtain 10 Sacred Phoenix Ash from cookpots in Spires of Arak.",
							constant = "CFFFFFFFFSTEP_1C_R_OBTAIN_10_SACRED_PHOENIX_ASH",
							export = true,
							text = {
								en = "|cFFFFFFFFStep 1C:|r Obtain 10 Sacred Phoenix Ash from cookpots in Spires of Arak.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "|cFFFFFFFF第 1C 步：|r 在阿兰卡峰林从烹饪锅处获得 10 个神圣凤凰灰烬。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 199097 },	-- Sacred Phoenix Ash
					}),
				},
			}),
			o(13000044, {	-- Step 2: Ash Feather
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 2:|r Obtain 20 Ash Feathers spawned by Griftah's Ash Feather Amulet.",
					constant = "CFFFFFFFFSTEP_2_R_OBTAIN_20_ASH_FEATHERS",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 2:|r Obtain 20 Ash Feathers spawned by Griftah's Ash Feather Amulet.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 获得 20 根由格里伏塔的灰烬羽毛护符生成的灰烬羽毛。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 202062 },	-- Ash Feather
			}),
			o(13000045, {	-- Step 3: Smoldering Phoenix Ash
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 3:|r Obtain 15 Smoldering Phoenix Ash from phoenixes around the Dragon Isles.",
					constant = "CFFFFFFFFSTEP_3_R_OBTAIN_15_SMOLDERING_PHOENIX",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 3:|r Obtain 15 Smoldering Phoenix Ash from phoenixes around the Dragon Isles.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 从龙群岛各地的凤凰身上获得 15 个阴燃凤凰灰烬。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 199080 },	-- Smoldering Phoenix Ash
			}),
			q(72798, {	-- Tale of the Phoenix
				["sourceQuests"] = { 70779 },	-- Tarjin's Tales [Guessed, will see if error reports]
				["provider"] = { "n", 196214 },	-- Tarjin the Blind
				["coord"] = { 16.1, 62.6, THE_WAKING_SHORES },
				["cost"] = {
					{ "i", 202062, 20 },	-- 20x Ash Feather
					{ "i", 199080, 15 },	-- 15x Smoldering Phoenix Ash
					{ "i", 199203,  1 },	-- Phoenix Ash Talisman
				},
				["groups"] = { i(193373) },	-- Phoenix Wishwing
			}),
		},
	})),
}));
