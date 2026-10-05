---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(ZANDALAR, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(ZULDAZAR, {
		petbattle(filter(BATTLE_PETS, {
			pet(2537, {	-- Baby Zandalari Raptor (PET!)
				["coord"] = { 71.2, 41.2, ZULDAZAR },
				["timeline"] = { ADDED_8_1_0 },
			}),
			pet(2385, {	-- Barrier Hermit (PET!)
				["description"] = createLocalizationString({
					readable = "Found commonly on the shorelines of Tusk Isle and Isle of Fang, islands south of Zuldazar.",
					constant = "FOUND_COMMONLY_ON_THE_SHORELINES_OF_TUSK_ISLE",
					export = true,
					text = {
						en = "Found commonly on the shorelines of Tusk Isle and Isle of Fang, islands south of Zuldazar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "常见于祖达萨以南的獠牙岛和尖牙岛的海岸线上。",
						-- TODO: tw = "",
					},
				})
			}),
			pet(2387, {	-- Golden Beetle (PET!)
				["description"] = createLocalizationString({
					readable = "Found at the coord in Atal'Dazar area, as well as alongside Barrier Hermits.",
					constant = "FOUND_AT_THE_COORD_IN_ATAL_DAZAR_AREA_AS_WELL",
					export = true,
					text = {
						en = "Found at the coord in Atal'Dazar area, as well as alongside Barrier Hermits.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于阿塔达萨区域的坐标处，以及屏障隐士附近。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 42.8, 39.2, ZULDAZAR },
			}),
			pet(2390, {	-- Leafy Flutterwing (PET!)
				["description"] = createLocalizationString({
					readable = "Found mosly along walkways in east Zuldazar.",
					constant = "FOUND_MOSLY_ALONG_WALKWAYS_IN_EAST_ZULDAZAR",
					export = true,
					text = {
						en = "Found mosly along walkways in east Zuldazar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "主要分布在祖达萨东部的通道沿线。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 77.0, 14.8, ZULDAZAR },
					{ 72.6, 20.2, ZULDAZAR },
					{ 71.6, 29.8, ZULDAZAR },
					{ 71.6, 39.0, ZULDAZAR },
					{ 79.6, 46.2, ZULDAZAR },
				},
			}),
			pet(2384, {	-- Shore Butterfly (PET!)
				["description"] = createLocalizationString({
					readable = "Found on the SW coasts of Tusk Isle and Isle of Fang, may be easier to find as a backline.",
					constant = "FOUND_ON_THE_SW_COASTS_OF_TUSK_ISLE_AND_ISLE_OF",
					export = true,
					text = {
						en = "Found on the SW coasts of Tusk Isle and Isle of Fang, may be easier to find as a backline.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于獠牙岛和尖牙岛的西南海岸，作为后排可能更容易找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 60.2, 75.8, ZULDAZAR },
					{ 59.4, 79.6, ZULDAZAR },
					{ 54.6, 89.6, ZULDAZAR },
					{ 56.8, 95.4, ZULDAZAR },
				},
			}),
		})),
	}),
})));
