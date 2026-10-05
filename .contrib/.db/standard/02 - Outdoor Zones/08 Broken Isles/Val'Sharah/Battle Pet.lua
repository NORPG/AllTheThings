---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(BROKEN_ISLES, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	m(VALSHARAH, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				398,	-- Black Rat (PET!)
				393,	-- Cockroach (PET!)
				396,	-- Dusk Spiderling (PET!)
				479,	-- Elfin Rabbit (PET!)
				397,	-- Skunk (PET!)
				1736,	-- Slithering Brownscale (PET!)
				379,	-- Squirrel (PET!)
			}},
			["groups"] = {
				pet(1738, {	-- Auburn Ringtail (PET!)
					["description"] = createLocalizationString({
						readable = "Best found around NW Moonclaw Vale.",
						constant = "BEST_FOUND_AROUND_NW_MOONCLAW_VALE",
						export = true,
						text = {
							en = "Best found around NW Moonclaw Vale.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最好在月爪谷西北方一带寻找。",
							-- TODO: tw = "",
						},
					}),
				}),
				pet(380, {	-- Bucktooth Flapper (PET!)
					["coord"] = { 53.2, 46.6, VALSHARAH },
				}),
				pet(1913, {	-- Gleamhoof Fawn (PET!)
					["description"] = createLocalizationString({
						readable = "Found around the grassy area in southern Val'Sharah.",
						constant = "FOUND_AROUND_THE_GRASSY_AREA_IN_SOUTHERN_VAL",
						export = true,
						text = {
							en = "Found around the grassy area in southern Val'Sharah.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在瓦尔莎拉南部草木茂盛的区域周围可找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				pet(1734, {	-- Shimmering Aquafly (PET!)
					["description"] = createLocalizationString({
						readable = "Found in the area around given coord, around the pond.",
						constant = "FOUND_IN_THE_AREA_AROUND_GIVEN_COORD_AROUND_THE",
						export = true,
						text = {
							en = "Found in the area around given coord, around the pond.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于指定坐标周围的区域，池塘附近。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 54.0, 83.0, VALSHARAH },
				}),
				pet(1739, {	-- Spring Strider (PET!)
					["coord"] = { 46.8, 70.2, VALSHARAH },
				}),
				pet(1735, {	-- Terror Larva (PET!)
					["description"] = createLocalizationString({
						readable = "Found around the large nightmare area.",
						constant = "FOUND_AROUND_THE_LARGE_NIGHTMARE_AREA",
						export = true,
						text = {
							en = "Found around the large nightmare area.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在大型梦魇区域周围可找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				pet(1737, {	-- Vale Flitter (PET!)
					["description"] = createLocalizationString({
						readable = "May be difficult to find. Can be found in the grassy area in southern Val'Sharah.",
						constant = "MAY_BE_DIFFICULT_TO_FIND_CAN_BE_FOUND_IN_THE",
						export = true,
						text = {
							en = "May be difficult to find. Can be found in the grassy area in southern Val'Sharah.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可能较难找到。可在瓦尔莎拉南部的草地上找到。",
							-- TODO: tw = "",
						},
					})
				}),
			},
		})),
	}),
})));
