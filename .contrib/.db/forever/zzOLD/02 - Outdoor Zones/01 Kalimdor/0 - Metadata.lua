---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(MAP.KALIMDOR, {
		["lore"] = "Kalimdor is home to the night elves, orcs, tauren, trolls, and draenei. Other races present include the ogres, centaur, naga, demons, and other, more minor races.",
		["icon"] = 236807,
		["zone-text-continent"] = true,
		["groups"] = {
			n(ACHIEVEMENTS, {
				ach(43),	-- Kalimdor Explorer [7.0.3] / Explore Kalimdor (automated)
			}),
		},
	}),
});
