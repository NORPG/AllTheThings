---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(STORMHEIM, {
			m(HELHEIM, {
				n(RARES, {
					n(92040, {	-- Fenri
						["questID"] = 38461,
						-- #if AFTER 11.2.7
						["isDaily"] = true,
						-- #endif
						["coord"] = { 84.6, 49.2, HELHEIM },
						["groups"] = {
							crit(33298, {	-- Fenri
								["achievementID"] = 11263,	-- Adventurer of Stormheim
							}),
							i(129044),	-- Frothing Helhound's Fury
						},
					}),
					n(115732, {	-- Jorvild the Trusted
						["description"] = createLocalizationString({
							readable = "The coordinates provided will take you to a small, door-sized cave entrance. It's hidden in some mist and, depending on your camera angle, can be difficult to see.",
							constant = "THE_COORDINATES_PROVIDED_WILL_TAKE_YOU_TO_A",
							export = true,
							text = {
								en = "The coordinates provided will take you to a small, door-sized cave entrance. It's hidden in some mist and, depending on your camera angle, can be difficult to see.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "提供的坐标会带你到一个门大小的小洞穴入口。它隐藏在雾气中，根据你的视角不同可能很难看清。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 46949,
						-- #if AFTER 11.2.7
						["isDaily"] = true,
						-- #endif
						["coord"] = { 32.9, 43.2, HELHEIM },
						["sym"] = {{"select","itemID",144437}},	-- Lost Legend of the Valarjar (highest drop chance NPC)
					}),
					n(97630, {	-- Soulthirster
						["questID"] = 39870,
						-- #if AFTER 11.2.7
						["isDaily"] = true,
						-- #endif
						["coord"] = { 29.0, 61.6, HELHEIM },
						["groups"] = {
							crit(33310, {	-- Soulthirster
								["achievementID"] = 11263,	-- Adventurer of Stormheim
							}),
							i(129188),	-- Bleakwater Jelly (PET!)
						},
					}),
				}),
			}),
		}),
	}),
});
