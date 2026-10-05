-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.BFA, {
	header(HEADERS.Item, 161479, {	-- Nazjatar Blood Serpent (MOUNT!)
		["timeline"] = { ADDED_8_0_1_LAUNCH },
		["groups"] = {
			i(161344, {	-- Abyssal Fragment
				["description"] = createLocalizationString({
					readable = "These are a World Drop in any zone and can be bought from the Auction House. Once you collect 20, combine them.",
					constant = "THESE_ARE_A_WORLD_DROP_IN_ANY_ZONE_AND_CAN_BE",
					export = true,
					text = {
						en = "These are a World Drop in any zone and can be bought from the Auction House. Once you collect 20, combine them.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这些是所有区域的世界掉落，也可以从拍卖行购买。集齐 20 个后可将它们合并。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = {
					VOLDUN,
					NAZMIR,
					ZULDAZAR,
					DRUSTVAR,
					TIRAGARDE_SOUND,
					STORMSONG_VALLEY,
				},
			}),
			i(161345, {	-- Abhorrent Essence of the Abyss
				["description"] = createLocalizationString({
					readable = "Use this on the \"Abyssal Icon\" located at 73.5, 23.6 in Stormsong Valley. The cave entrance is behind a waterfall.",
					constant = "USE_THIS_ON_THE_ABYSSAL_ICON_LOCATED_AT_73_5_23",
					export = true,
					text = {
						en = "Use this on the \"Abyssal Icon\" located at 73.5, 23.6 in Stormsong Valley. The cave entrance is behind a waterfall.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "对位于斯托颂谷地 73.5, 23.6 的“深渊雕像”使用此物品。洞穴入口在瀑布后面。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = {{"i",161344,20}},	-- Abyssal Fragment
				["coord"] = { 73.5, 23.6, STORMSONG_VALLEY },
			}),
			n(140474, {	-- Adherent of the Abyss
				["cost"] = {{"i",161345,1}},	-- Abhorrent Essence of the Abyss
				["coord"] = { 73.5, 23.6, STORMSONG_VALLEY },
				["groups"] = {
					i(161479),	-- Nazjatar Blood Serpent (MOUNT!)
					i(163929),	-- Aether of the Abyss
				},
			}),
		},
	}),
}))
