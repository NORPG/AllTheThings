-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

root(ROOTS.ExpansionFeatures,
	expansion(EXPANSION.WOD, {
		n(GARRISONS, {
			m(FROSTWALL, {
				["lvl"] = 90,
				["maps"] = {
					585,	-- Frostwall Mine [Unclaimed / Level 1]
					586,	-- Frostwall Mine [Level 2]
					587,	-- Frostwall Mine [Level 3]
				},
				["isRaid"] = true,
				["icon"] = 1046795,
				["description"] = createLocalizationString({
					readable = "Frostwall is the Horde Garrison, located in Frostfire Ridge. A fully-upgraded Frostwall garrison is considered to be a fortress.",
					constant = "FROSTWALL_IS_THE_HORDE_GARRISON_LOCATED_IN",
					export = true,
					text = {
						en = "Frostwall is the Horde Garrison, located in Frostfire Ridge. A fully-upgraded Frostwall garrison is considered to be a fortress.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "霜墙是位于霜火岭的部落要塞。完全升级的霜墙要塞被视为一座堡垒。",
						-- TODO: tw = "",
					},
				}),
			}),
		}),
	})
);
