---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(HALLOWFALL, {
		petbattle(filter(BATTLE_PETS, {
			["groups"] = {
				pet(3525, {	-- Abyssal Lurker (PET!)
					["description"] = "~L.BACKLINE_PET_ONLY",
				}),
				pet(4456, {	-- Arachnoid Hatchling (PET!)
					["description"] = createLocalizationString({
						readable = "Found commonly in groups around the Ringing Deeps and as backline in all 3 main underground zones.",
						constant = "FOUND_COMMONLY_IN_GROUPS_AROUND_THE_RINGING",
						export = true,
						text = {
							en = "Found commonly in groups around the Ringing Deeps and as backline in all 3 main underground zones.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "常见于喧鸣深窟周围的群体中，并在全部 3 个主要地下区域作为后排刷新。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						-- { X, Y, HALLOWFALL },
						{ 62.0, 42.6, THE_RINGING_DEEPS },
					},
				}),
				pet(4460, {	-- Arathi Chicken (PET!)
					["description"] = createLocalizationString({
						readable = "Found around farms in Hallowfall, frontline & backline.",
						constant = "FOUND_AROUND_FARMS_IN_HALLOWFALL_FRONTLINE",
						export = true,
						text = {
							en = "Found around farms in Hallowfall, frontline & backline.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在陨圣峪的农场周围可找到，包括前线和后方。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 48.7, 35.6, HALLOWFALL },
				}),
				pet(4515, {	-- Azure Flickerfly (PET!)
					["description"] = createLocalizationString({
						readable = "Found most commonly between the Coreway and Hallowfall gates, or around Mereldar and The Weaver's Lair.",
						constant = "FOUND_MOST_COMMONLY_BETWEEN_THE_COREWAY_AND",
						export = true,
						text = {
							en = "Found most commonly between the Coreway and Hallowfall gates, or around Mereldar and The Weaver's Lair.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "最常见于核心通道与陨圣峪大门之间，或梅雷达尔和织网者的巢穴周围。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 45.9, 64.2, HALLOWFALL },
						{ 43.2, 37.9, THE_RINGING_DEEPS },
					},
				}),
				pet(4457, {	-- Chitin Burrower (PET!)
					["description"] = createLocalizationString({
						readable = "Found commonly in small groups around the 3 main underground zones.",
						constant = "FOUND_COMMONLY_IN_SMALL_GROUPS_AROUND_THE_3",
						export = true,
						text = {
							en = "Found commonly in small groups around the 3 main underground zones.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "常见于全部 3 个主要地下区域周围的小群体中。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 55.9, 43.0, HALLOWFALL },
						{ 59.4, 41.9, THE_RINGING_DEEPS },
					},
				}),
				pet(4499, {	-- Common Ploughworm (PET!)
					["coords"] = {
						{ 43.8, 49.4, HALLOWFALL },
						{ 40.6, 27.9, THE_RINGING_DEEPS },
					},
				}),
				pet(4461, {	-- Greenlands Chicken (PET!)
					["description"] = createLocalizationString({
						readable = "Likely a Rare spawn of Arathi Chicken, can be found frontline & backline. Coords are some confirmed repeat spawn spots.",
						constant = "LIKELY_A_RARE_SPAWN_OF_ARATHI_CHICKEN_CAN_BE",
						export = true,
						text = {
							en = "Likely a Rare spawn of Arathi Chicken, can be found frontline & backline. Coords are some confirmed repeat spawn spots.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "很可能是阿拉希鸡的稀有刷新，可作为前排和后排出现。坐标是一些已确认的重复刷新点。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 48.9, 40.0, HALLOWFALL },
						{ 49.0, 63.0, HALLOWFALL },
						{ 61.1, 29.8, HALLOWFALL },
					},
				}),
				pet(4533, {	-- Meek Bloodlasher (PET!)
					["coords"] = {
						{ 57.2, 38.2, HALLOWFALL },
						{ 42.2, 36.9, THE_RINGING_DEEPS },
						{ 52.6, 68.3, ISLE_OF_DORN },
					},
				}),
				pet(4521, {	-- Subterranean Dartswog (PET!)
					["coords"] = {
						-- { X, Y, HALLOWFALL },
						{ 72.7, 44.2, ISLE_OF_DORN },
					},
				}),
				pet(4544, {	-- Umbral Amalgam (PET!)
					["description"] = createLocalizationString({
						readable = "Only spawns during Beledar's void state. Found around cliffs overlooking water.",
						constant = "ONLY_SPAWNS_DURING_BELEDAR_S_VOID_STATE_FOUND",
						export = true,
						text = {
							en = "Only spawns during Beledar's void state. Found around cliffs overlooking water.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "仅在贝雷达尔的虚空状态下刷新。可在俯瞰水面的悬崖附近找到。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 37.6, 46.0, HALLOWFALL },
						{ 46.2, 31.8, HALLOWFALL },
						{ 48.4, 59.0, HALLOWFALL },
						{ 54.0, 51.8, HALLOWFALL },
						{ 58.6, 34.6, HALLOWFALL },
						{ 59.0, 49.2, HALLOWFALL },
						{ 61.4, 46.0, HALLOWFALL },
						{ 61.8, 44.2, HALLOWFALL },
						{ 63.2, 49.0, HALLOWFALL },
						{ 72.0, 46.0, HALLOWFALL },
					},
				}),
				pet(4516, {	-- Vibrant Glowfly (PET!)
					["coords"] = {
						-- { X, Y, HALLOWFALL },
						{ 57.2, 47.9, THE_RINGING_DEEPS },
						{ 57.8, 71.5, AZJ_KAHET },
					},
				}),
				pet(4510, {	-- Winged Arachnoid (PET!)
					["coord"] = { 65.9, 39.3, HALLOWFALL },
				}),
			},
		})),
	}),
}));
