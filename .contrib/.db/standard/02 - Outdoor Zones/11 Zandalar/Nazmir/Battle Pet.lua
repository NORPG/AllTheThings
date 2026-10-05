---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(ZANDALAR, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(NAZMIR, {
		petbattle(filter(BATTLE_PETS, {
			pet(2388, {	-- Bloodfeaver Tarantula (PET!)
				["description"] = createLocalizationString({
					readable = "Found all around the Terrace of Sorrows.",
					constant = "FOUND_ALL_AROUND_THE_TERRACE_OF_SORROWS",
					export = true,
					text = {
						en = "Found all around the Terrace of Sorrows.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在悲伤之台各处都能找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 35.0, 54.6, NAZMIR },
					{ 36.2, 65.2, NAZMIR },
					{ 36.4, 46.8, NAZMIR },
					{ 39.2, 64.2, NAZMIR },
				},
			}),
			pet(2398, {	-- Boghopper (PET!)
				["description"] = createLocalizationString({
					readable = "Found around Krag'wa's Burrow and NE of Shoaljai Tar Pits.",
					constant = "FOUND_AROUND_KRAG_WA_S_BURROW_AND_NE_OF",
					export = true,
					text = {
						en = "Found around Krag'wa's Burrow and NE of Shoaljai Tar Pits.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在克拉格瓦的巢穴周围以及绍尔贾伊焦油坑东北方可找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 76.8, 46.8, NAZMIR },
					{ 28.8, 39.4, NAZMIR },
				},
			}),
			pet(2400, {	-- Coastal Bounder (PET!)
				["coord"] = { 32.8, 35.6, NAZMIR },
			}),
			pet(2389, {	-- Elusive Skimmer (PET!)
				["description"] = createLocalizationString({
					readable = "Found along the southern waterways in Nazmir.",
					constant = "FOUND_ALONG_THE_SOUTHERN_WATERWAYS_IN_NAZMIR",
					export = true,
					text = {
						en = "Found along the southern waterways in Nazmir.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在纳兹米尔南部的河道中可找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 31.6, 79.8, NAZMIR },
					{ 40.6, 84.4, NAZMIR },
					{ 44.4, 80.8, NAZMIR },
					{ 63.0, 64.6, NAZMIR },
				},
			}),
			pet(2395, {	-- Glutted Bleeder (PET!)
				["coords"] = {
					{ 32.8, 46.2, NAZMIR },
					{ 30.6, 48.6, NAZMIR },
					{ 53.8, 70.2, NAZMIR },
					{ 51.2, 66.6, NAZMIR },
					{ 48.8, 57.6, NAZMIR },
					{ 53.8, 59.4, NAZMIR },
				},
			}),
			pet(2394, {	-- Returned Hatchling (PET!)
				["description"] = "~L.FOUND_IN_A_SMALL_AREA_AROUND_COORD",
				["coord"] = { 31.8, 58.8, NAZMIR},
			}),
			pet(2397, {	-- Spectral Raven (PET!)
				["description"] = createLocalizationString({
					readable = "Found on the outskirts of The Necropolis.",
					constant = "FOUND_ON_THE_OUTSKIRTS_OF_THE_NECROPOLIS",
					export = true,
					text = {
						en = "Found on the outskirts of The Necropolis.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于大墓地的外围。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 39.8, 34.6, NAZMIR },
					{ 36.0, 27.0, NAZMIR },
					{ 37.8, 22.0, NAZMIR },
					{ 42.6, 25.2, NAZMIR },
				},
			}),
			pet(2393, {	-- Sticky Oozeling (PET!)
				["description"] = createLocalizationString({
					readable = "Found in the Shoaljai Tar Pits.",
					constant = "FOUND_IN_THE_SHOALJAI_TAR_PITS",
					export = true,
					text = {
						en = "Found in the Shoaljai Tar Pits.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于绍尔贾伊焦油坑。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 24.0, 51.8, NAZMIR },
			}),
			pet(2392, {	-- Young Sand Sifter (PET!)
				["description"] = createLocalizationString({
					readable = "Found commonly around the outer shorelines of Nazmir.",
					constant = "FOUND_COMMONLY_AROUND_THE_OUTER_SHORELINES_OF",
					export = true,
					text = {
						en = "Found commonly around the outer shorelines of Nazmir.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "常见于纳兹米尔的外围海岸线一带。",
						-- TODO: tw = "",
					},
				}),
			}),
		})),
	}),
})));
