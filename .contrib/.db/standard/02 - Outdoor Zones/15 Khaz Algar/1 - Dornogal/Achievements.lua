---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(DORNOGAL, {
		n(ACHIEVEMENTS, {
			ach(40606, {	-- Flat Earthen
				["description"] = createLocalizationString({
					readable = "Stand at the coordinates and let the machine crush you.",
					constant = "STAND_AT_THE_COORDINATES_AND_LET_THE_MACHINE",
					export = true,
					text = {
						en = "Stand at the coordinates and let the machine crush you.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "站在该坐标处，让机器把你压碎。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 50.0, 62.0, DORNOGAL },	-- The Forgegrounds
			}),
		}),
	}),
}));
