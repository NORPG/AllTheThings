-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.SL, bubbleDown({ ["customCollect"] = "SL_COV_NEC" }, {
	n(NECROLORD, {
		n(SANCTUM_UPGRADES, {
			["icon"] = 3641396,
			["groups"] = {
				n(TRANSPORT_NETWORK, {
					["icon"] = 3854019,
					["groups"] = sharedData({ ["icon"] = 3854019 }, {
						n(TIER_ONE, {
							n(QUESTS, {
								q(63059, {	-- Blink of an Eye
									["sourceQuests"] = { 63055 },	-- Powering the Portals
									["provider"] = { "n", 175963 },	-- Serafina Von
									["coord"] = { 59.8, 31.8, SEAT_OF_THE_PRIMUS },
								}),
								q(63055, {	-- Powering the Portals
									["description"] = createLocalizationString({
										readable = "Becomes available after you build Transport Network tier 1 in your sanctum.",
										constant = "BECOMES_AVAILABLE_AFTER_YOU_BUILD_TRANSPORT",
										export = true,
										text = {
											en = "Becomes available after you build Transport Network tier 1 in your sanctum.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在你的圣所中建造 1 级运输网络后开放。",
											-- TODO: tw = "",
										},
									}),
									["provider"] = { "n", 161909 },	-- Arkadia Moa
									["coord"] = { 52.4, 38.4, SEAT_OF_THE_PRIMUS },
								}),
							}),
						}),
						n(TIER_TWO, {
							n(QUESTS, {
								q(60184, {	-- Dude, Where's My Necropolis?
									["description"] = createLocalizationString({
										readable = "Becomes available during the campaign.",
										constant = "BECOMES_AVAILABLE_DURING_THE_CAMPAIGN",
										export = true,
										text = {
											en = "Becomes available during the campaign.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "在战役期间开放。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = {
										58820,	-- Bindings of Fleshcrafting
									},
									["provider"] = { "n", 173306 },	-- Khaliiq
									["coord"] = { 60.0, 33.6, SEAT_OF_THE_PRIMUS },
								}),
							}),
						}),
					}),
				}),
			},
		}),
	}),
})));
