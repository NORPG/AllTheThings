---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(STORMSONG_VALLEY, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				2399,	-- Hermit Crab (PET!)
				2381,	-- Shack Crab (PET!)
			}},
			["groups"] = {
				pet(2374, {	-- Freshwater Crawler (PET!)
					["coord"] = { 65.6, 67.2, STORMSONG_VALLEY },
				}),
				pet(2379, {	-- Honey Bee (PET!)
					["description"] = createLocalizationString({
						readable = "Found mostly around these coords.",
						constant = "FOUND_MOSTLY_AROUND_THESE_COORDS",
						export = true,
						text = {
							en = "Found mostly around these coords.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "大多可在这些坐标附近找到。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 74.2, 69.6, STORMSONG_VALLEY },
						{ 45.6, 61.2, STORMSONG_VALLEY },
						{ 50.6, 50.4, STORMSONG_VALLEY },
					},
				}),
				pet(2373, {	-- River Frog (PET!)
					["description"] = createLocalizationString({
						readable = "Best found along the waterways above Sagehold. Coords are a route.",
						constant = "BEST_FOUND_ALONG_THE_WATERWAYS_ABOVE_SAGEHOLD",
						export = true,
						text = {
							en = "Best found along the waterways above Sagehold. Coords are a route.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最好沿着贤者堡上方的水道寻找。坐标是一条路线。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 64.6, 44.6, STORMSONG_VALLEY },
						{ 63.2, 37.2, STORMSONG_VALLEY },
						{ 63.2, 30.0, STORMSONG_VALLEY },
						{ 56.6, 30.2, STORMSONG_VALLEY },
					},
				}),
				pet(2378, {	-- River Otter (PET!)
					["description"] = createLocalizationString({
						readable = "Best found along the waterways above Sagehold. Coords are a route. Also found NW of Arom's Stand, Drustvar.",
						constant = "BEST_FOUND_ALONG_THE_WATERWAYS_ABOVE_SAGEHOLD_2",
						export = true,
						text = {
							en = "Best found along the waterways above Sagehold. Coords are a route. Also found NW of Arom's Stand, Drustvar.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最好沿着贤者堡上方的水道寻找。坐标是一条路线。也可在德鲁斯瓦阿罗姆之台的西北方找到。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 64.6, 44.6, STORMSONG_VALLEY },
						{ 63.2, 37.2, STORMSONG_VALLEY },
						{ 63.2, 30.0, STORMSONG_VALLEY },
						{ 56.6, 30.2, STORMSONG_VALLEY },
						{ 32.8, 43.4, DRUSTVAR },

					},
				}),
				pet(2377, {	-- Sandyback Crawler (PET!)
					["description"] = "~L.FOUND_MOSTLY_AROUND_THESE_COORDS",
					["coords"] = {
						{ 51.0, 24.6, STORMSONG_VALLEY },
						{ 65.6, 49.8, STORMSONG_VALLEY },
						{ 86.4, 46.4, TIRAGARDE_SOUND },
					}
				}),
				pet(2372, {	-- Shadowback Crawler (PET!)
					["coords"] = {
						{ 70.6, 32.0, STORMSONG_VALLEY },
						{ 75.0, 39.6, STORMSONG_VALLEY },
					},
				}),
				pet(2375, {	-- Vale Marmot (PET!)
					["description"] = createLocalizationString({
						readable = "Found all around Stormsong Valley.",
						constant = "FOUND_ALL_AROUND_STORMSONG_VALLEY",
						export = true,
						text = {
							en = "Found all around Stormsong Valley.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在斯托颂谷地各处都能找到。",
							-- TODO: tw = "",
						},
					})
				}),
				pet(2376, {	-- Valley Chicken (PET!)
					["description"] = createLocalizationString({
						readable = "Best found along a small route using given coords.",
						constant = "BEST_FOUND_ALONG_A_SMALL_ROUTE_USING_GIVEN",
						export = true,
						text = {
							en = "Best found along a small route using given coords.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最好沿着使用给定坐标的一条小路线寻找。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 43.8, 62.6, STORMSONG_VALLEY },
						{ 44.8, 65.8, STORMSONG_VALLEY },
						{ 45.2, 61.6, STORMSONG_VALLEY },
						{ 48.0, 61.6, STORMSONG_VALLEY },
					}
				}),
			},
		})),
	}),
})));
