---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(ZANDALAR, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(DAZARALOR, {
		n(TREASURES, {
			o(293110, {	-- Pepe'jin
				["description"] = createLocalizationString({
					readable = "Located inside the |cFFFFD700Hot House|r.",
					constant = "LOCATED_INSIDE_THE_CFFFFD700HOT_HOUSE_R",
					export = true,
					text = {
						en = "Located inside the |cFFFFD700Hot House|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于|cFFFFD700温室|r内。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 38.98, 15.80, DAZARALOR },
				["groups"] = { i(161443) },	-- A Tiny Voodoo Mask (Pepe!)
			}),
		}),
	}),
})));
