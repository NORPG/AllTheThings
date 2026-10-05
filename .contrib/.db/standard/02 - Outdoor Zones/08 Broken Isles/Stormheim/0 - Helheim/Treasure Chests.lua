---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(STORMHEIM, {
			m(HELHEIM, {
				n(TREASURES, {
					o(240649, {	-- Small Treasure Chest
						["questID"] = 38383,
						["coord"] = { 60.9, 53.3, HELHEIM },
					}),
					o(241267, {	-- Small Treasure Chest
						["questID"] = 38510,
						["coord"] = { 79.9, 24.7, HELHEIM },
					}),
					o(241216, {	-- Treasure Chest
						["questID"] = 38503,
						["coord"] = { 83.3, 24.6, HELHEIM },
						["description"] = createLocalizationString({
							readable = "Inside a sunken ship.",
							constant = "INSIDE_A_SUNKEN_SHIP",
							export = true,
							text = {
								en = "Inside a sunken ship.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在一艘沉船内。",
								-- TODO: tw = "",
							},
						}),
					}),
					o(241272, {	-- Treasure Chest
						["questID"] = 38516,
						["coord"] = { 19.6, 47.0, HELHEIM },
					}),
				}),
			}),
		}),
	}),
});
