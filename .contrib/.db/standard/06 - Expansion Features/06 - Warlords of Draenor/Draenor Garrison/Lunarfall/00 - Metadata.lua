-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

root(ROOTS.ExpansionFeatures,
	expansion(EXPANSION.WOD, {
		n(GARRISONS, {
			m(LUNARFALL, {
				["lvl"] = 90,
				["maps"] = {
					579,	-- Lunarfall Excavation [Unclaimed / Level 1]
					580,	-- Lunarfall Excavation [Level 2]
					581,	-- Lunarfall Excavation [Level 3]
				},
				["isRaid"] = true,
				["icon"] = 1046782,
				["description"] = createLocalizationString({
					readable = "Lunarfall is the Alliance Garrison, located in Shadowmoon Valley. Several Shadowmoon clan ruins dotted the area before the garrison was built. A fully-upgraded Lunarfall garrison is considered to be a castle.",
					constant = "LUNARFALL_IS_THE_ALLIANCE_GARRISON_LOCATED_IN",
					export = true,
					text = {
						en = "Lunarfall is the Alliance Garrison, located in Shadowmoon Valley. Several Shadowmoon clan ruins dotted the area before the garrison was built. A fully-upgraded Lunarfall garrison is considered to be a castle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "月落要塞是位于影月谷的联盟要塞。在要塞建成之前，这片区域散布着若干影月氏族的废墟。完全升级的月落要塞被视为一座城堡。",
						-- TODO: tw = "",
					},
				}),
			}),
		}),
	})
);
