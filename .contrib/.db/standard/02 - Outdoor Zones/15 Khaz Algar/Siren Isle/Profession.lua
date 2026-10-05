---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(PROFESSIONS, {
			prof(FISHING, {
				i(232569, {	-- Cyclonic Runekey
					["description"] = createLocalizationString({
						readable = "Can be fished with any skill and also drops from the rare Zek'ul.\n\nRecommened to fish while waiting for Zek'ul respawn.",
						constant = "CAN_BE_FISHED_WITH_ANY_SKILL_AND_ALSO_DROPS",
						export = true,
						text = {
							en = "Can be fished with any skill and also drops from the rare Zek'ul.\n\nRecommened to fish while waiting for Zek'ul respawn.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "任何技能等级都能钓到，也会从稀有泽库尔身上掉落。\n\n建议在等待泽库尔刷新时钓鱼。",
							-- TODO: tw = "",
						},
					}),
				}),
			}),
		}),
	}),
}));
