---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(THE_RINGING_DEEPS, {
		petbattle(filter(BATTLE_PETS, {
			["groups"] = {
				pet(4498, {	-- Ebon Ploughworm (PET!)
					["coords"] = {
						{ 43.4, 27.6, THE_RINGING_DEEPS },
						{ 44.7, 57.8, HALLOWFALL },
					},
				}),
				pet(3547, {	-- Jade Cragviper (PET!)
					["description"] = "~L.BACKLINE_PET_ONLY",
				}),
				pet(4571, {	-- Pinkskin Burrower (PET!)
					["coord"] = { 47.8, 31.6, THE_RINGING_DEEPS },
				}),
				pet(4573, {	-- Skittish Sniffler (PET!)
					["coord"] = { 56.8, 43.8, THE_RINGING_DEEPS },
				}),
				pet(4574, {	-- Snuffling (PET!)
					["description"] = createLocalizationString({
						readable = "Found around the area of Taelloch/Obsidian Hollow.",
						constant = "FOUND_AROUND_THE_AREA_OF_TAELLOCH_OBSIDIAN",
						export = true,
						text = {
							en = "Found around the area of Taelloch/Obsidian Hollow.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在泰尔洛克/黑曜石谷区域周围可找到。",
							-- TODO: tw = "",
						},
					}),
					["coords"] = {
						{ 64.7, 48.5, THE_RINGING_DEEPS },
						{ 68.0, 47.0, THE_RINGING_DEEPS },
					},
				}),
			},
		})),
	}),
}));
