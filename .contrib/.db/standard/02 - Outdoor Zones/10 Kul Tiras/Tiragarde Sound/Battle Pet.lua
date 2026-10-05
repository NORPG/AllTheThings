---------------------------------------------------
--          Z O N E S       M O D U L E          --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(TIRAGARDE_SOUND, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				487,	-- Alpine Chipmunk (PET!)
				2400,	-- Coastal Bounder (PET!)
				478,	-- Forest Moth (PET!)
				2399,	-- Hermit Crab (PET!)
				2377,	-- Sandyback Crawler (PET!)
			}},
			["groups"] = {
				pet(2383, {	-- Giant Woodworm (PET!)
					["description"] = createLocalizationString({
						readable = "Best found around these coords. Spawns all around the N/NE area by Freehold.",
						constant = "BEST_FOUND_AROUND_THESE_COORDS_SPAWNS_ALL",
						export = true,
						text = {
							en = "Best found around these coords. Spawns all around the N/NE area by Freehold.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最好在这些坐标附近寻找。会在自由镇周边的北/东北区域刷新。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 55.8, 16.6, TIRAGARDE_SOUND },
						{ 55.6, 35.2, TIRAGARDE_SOUND },
						{ 82.2, 72.0, TIRAGARDE_SOUND },
						{ 85.6, 81.8, TIRAGARDE_SOUND },
					},
				}),
				pet(2382, {	-- Inland Croaker (PET!)
					["description"] = createLocalizationString({
						readable = "Found along the inland waterways in Tiragarde by Hatherford and Norwington Estate.",
						constant = "FOUND_ALONG_THE_INLAND_WATERWAYS_IN_TIRAGARDE",
						export = true,
						text = {
							en = "Found along the inland waterways in Tiragarde by Hatherford and Norwington Estate.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在提拉加德海峡哈瑟福德和诺文顿庄园附近的内河水道中可找到。",
							-- TODO: tw = "",
						},
					}),
				}),
				pet(2380, {	-- Parasitic Boarfly (PET!)
					["description"] = createLocalizationString({
						readable = "Found in a small area around coord.",
						constant = "FOUND_IN_A_SMALL_AREA_AROUND_COORD",
						export = true,
						text = {
							en = "Found in a small area around coord.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可在坐标周围的一小片区域内找到。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 56.8, 17.0, TIRAGARDE_SOUND },
				}),
				pet(2381, {	-- Shack Crab (PET!)
					["description"] = createLocalizationString({
						readable = "Found along the coastlines of every Kul Tiras zone.",
						constant = "FOUND_ALONG_THE_COASTLINES_OF_EVERY_KUL_TIRAS",
						export = true,
						text = {
							en = "Found along the coastlines of every Kul Tiras zone.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在库尔提拉斯各区域的海岸线上都能找到。",
							-- TODO: tw = "",
						},
					}),
				}),
			},
		})),
	}),
})));
