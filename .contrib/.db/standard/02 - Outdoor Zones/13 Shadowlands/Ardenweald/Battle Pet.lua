---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(ARDENWEALD, {
		petbattle(filter(BATTLE_PETS, {
			pet(3081, {	-- Decay Grub (PET!)
				["description"] = createLocalizationString({
					readable = "Found around Heartwood Grove, along the path of coords.",
					constant = "FOUND_AROUND_HEARTWOOD_GROVE_ALONG_THE_PATH_OF",
					export = true,
					text = {
						en = "Found around Heartwood Grove, along the path of coords.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在心木林地周围、沿坐标路径可找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 61.2, 31.8, ARDENWEALD },
					{ 64.2, 23.6, ARDENWEALD },
					{ 71.0, 29.2, ARDENWEALD },
					{ 72.2, 38.2, ARDENWEALD },
				},
			}),
			pet(3021, {	-- Deepwood Leaper (PET!)
				["description"] = createLocalizationString({
					readable = "Found in most of southeast Ardenweald. Coords are general locations.",
					constant = "FOUND_IN_MOST_OF_SOUTHEAST_ARDENWEALD_COORDS",
					export = true,
					text = {
						en = "Found in most of southeast Ardenweald. Coords are general locations.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在炽蓝仙野东南部的大部分区域都能找到。坐标只是大致位置。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 51.2, 55.6, ARDENWEALD },
					{ 38.8, 64.6, ARDENWEALD },
					{ 37.8, 52.0, ARDENWEALD },
					{ 28.6, 58.6, ARDENWEALD },
				},
			}),
			pet(2919, {	-- Gorm Rootstinger (PET!)
				["description"] = createLocalizationString({
					readable = "Found in the areas around these coords.",
					constant = "FOUND_IN_THE_AREAS_AROUND_THESE_COORDS",
					export = true,
					text = {
						en = "Found in the areas around these coords.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于这些坐标周围的区域。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 68.8, 56.6, ARDENWEALD },
					{ 30.0, 50.6, ARDENWEALD },
				},
			}),
			pet(3082, {	-- Starmoth (PET!)
				["description"] = createLocalizationString({
					readable = "Found south of Glitterfall Basin in large area around coord.",
					constant = "FOUND_SOUTH_OF_GLITTERFALL_BASIN_IN_LARGE_AREA",
					export = true,
					text = {
						en = "Found south of Glitterfall Basin in large area around coord.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于闪瀑盆地以南，坐标周围的大片区域内。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 53.0, 34.4, ARDENWEALD },
			}),
			pet(2924, {	-- Tranquil Wader (PET!)
				["description"] = createLocalizationString({
					readable = "Found between Hibernal Hollow and Heart of the Forest.",
					constant = "FOUND_BETWEEN_HIBERNAL_HOLLOW_AND_HEART_OF_THE",
					export = true,
					text = {
						en = "Found between Hibernal Hollow and Heart of the Forest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于寒冬谷与森林之心之间。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 54.2, 55.2, ARDENWEALD },
					{ 55.2, 60.8, ARDENWEALD },
					{ 50.6, 60.2, ARDENWEALD },
				},
			}),
			pet(3080, {	-- Verdant Kit (PET!)
				["description"] = createLocalizationString({
					readable = "Found west of Heart of the Forest.",
					constant = "FOUND_WEST_OF_HEART_OF_THE_FOREST",
					export = true,
					text = {
						en = "Found west of Heart of the Forest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于森林之心以西。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 42.6, 54.6, ARDENWEALD },
					{ 41.2, 49.8, ARDENWEALD },
				},
			}),
		})),
	}),
})));
