---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.THE_COILED_ISLE, {
		m(MAP.MIDNIGHT.VAULTS_OF_ATALUTEK, {
			n(ZONE_DROPS, {
				currency(3448),	-- Corrosive Coin
				i(275048, {	-- Decrepit Key
					["description"] = createLocalizationString({
						readable = "Can be obtained from creatures with 'Corrosive' Aura after unlocking 'Slithering Secrets' trait at |cFFFFD700Altar of Corrosion|r.",
						constant = "CAN_BE_OBTAINED_FROM_CREATURES_WITH_CORROSIVE",
						export = true,
						text = {
							en = "Can be obtained from creatures with 'Corrosive' Aura after unlocking 'Slithering Secrets' trait at |cFFFFD700Altar of Corrosion|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在|cFFFFD700腐蚀祭坛|r解锁“滑行之秘”特质后，可从带有“腐蚀”光环的生物身上获得。",
							-- TODO: tw = "",
						},
					}),
				}),
			}),
		}),
	}),
}));
