-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.MID, {
	header(HEADERS.Item, 246723, bubbleDownSelf({ ["timeline"] = { ADDED_12_0_7 } }, {	-- Unfazed Diver
		["level"] = 90,
		["groups"] = {
			o(656056, {	-- Bill of Lading
				["description"] = createLocalizationString({
					readable = "In Untethered Space on the floor to the left of the counter.",
					constant = "IN_UNTETHERED_SPACE_ON_THE_FLOOR_TO_THE_LEFT_OF",
					export = true,
					text = {
						en = "In Untethered Space on the floor to the left of the counter.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在无束空间内，柜台左侧的地上。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 235499 },	-- Reshii Wraps
				["coord"] = { 46.9, 58.6, KARESH_TAZAVESH },
				["questID"] = 97098,
				["groups"] = {
					i(275670),	-- Bill of Lading
					i(275665),	-- Phase-Displaced Toy
				},
			}),
			o(656049, {	-- Odd Smelling Crate
				["coord"] = { 48.2, 70.3, MAP.MIDNIGHT.VOIDSTORM },
				["questID"] = 97099,
			}),
			i(276465, {	-- Specimen Container Key
				["cr"] = 265891,	-- Hal'hadar Manatech
			}),
			o(658801, {	-- Specimen Container
				["description"] = createLocalizationString({
					readable = "Currently only visible in Normal World Tier.",
					constant = "CURRENTLY_ONLY_VISIBLE_IN_NORMAL_WORLD_TIER",
					export = true,
					text = {
						en = "Currently only visible in Normal World Tier.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "目前仅在普通世界层级可见。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 71.5, 45.3, NAIGTAL },
				["cost"] = { { "i", 276465, 1 } },	-- Specimen Container Key
				["groups"] = { i(246723) },	-- Unfazed Diver (PET!)
			}),
		},
	})),
}));
