--------------------------------------------
--     H O L I D A Y S  M O D U L E       --
--------------------------------------------

root(ROOTS.Holidays, {
	applyevent(EVENTS.SEASONAL_FISH_SUMMER_BASS, n(createHeader({
		readable = "Seasonal Fish: Summer Bass",
		icon = EVENTS.SEASONAL_FISH_SUMMER_BASS,
		eventID = EVENTS.SEASONAL_FISH_SUMMER_BASS,
		eventSchedule = {
			1,	-- Recurring
			3, 20, 0, 0,	-- 3/20 at 00:00 AM
			9, 22, 23, 59	-- 9/22 at 23:59 AM
		},
		text = {
			en = "Seasonal Fish: Summer Bass",
			de = "Saisonfisch: Sommerbarsch",
			es = "Pescado de temporada: lubina de verano",
			mx = "Pescado de temporada: lubina de verano",
			fr = "Poisson de saison : bar d'été",
			it = "Pesce di stagione: spigola estiva",
			ko = "제철 생선: 여름 농어",
			pt = "Peixe sazonal: robalo de verão",
			ru = "Сезонная рыба: летний окунь",
			cn = "时令鱼类：夏季鲈鱼",
			tw = "季節性魚類：夏日鱸魚",
		},
	}), {
		["maps"] = {
			MAP.AZSHARA,
			MAP.TANARIS,
			MAP.THE_HINTERLANDS,
			MAP.FERALAS,
			MAP.STRANGLETHORN_VALE,
		},
		["groups"] = {
			i(13756, {	-- Raw Summer Bass
				["description"] = createLocalizationString({
					readable = "Can be caught in open sea water in Azshara, Tanaris, The Hinterlands, Feralas, and STV from 20th March to 22nd September.",
					constant = "CAN_BE_CAUGHT_IN_OPEN_SEA_WATER_IN_AZSHARA",
					export = true,
					text = {
						en = "Can be caught in open sea water in Azshara, Tanaris, The Hinterlands, Feralas, and STV from 20th March to 22nd September.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "3 月 20 日至 9 月 22 日期间，可在艾萨拉、塔纳利斯、辛特兰、菲拉斯和荆棘谷的远海海水中钓到。",
						-- TODO: tw = "",
					},
				}),
			}),
		},
	})),
	applyevent(EVENTS.SEASONAL_FISH_WINTER_SQUID, n(createHeader({
		readable = "Seasonal Fish: Winter Squid",
		icon = EVENTS.SEASONAL_FISH_WINTER_SQUID,
		eventID = EVENTS.SEASONAL_FISH_WINTER_SQUID,
		eventSchedule = {
			1,	-- Recurring
			9, 23, 0, 0,	-- 9/23 at 00:00 AM
			3, 19, 23, 59	-- 3/19 at 23:59 AM
		},
		text = {
			en = "Seasonal Fish: Winter Squid",
			de = "Saisonfisch: Winterkalmar",
			es = "Pescado de temporada: calamares de invierno",
			mx = "Pescado de temporada: calamares de invierno",
			fr = "Poisson de saison : calmar d'hiver",
			it = "Pesce di stagione: calamari invernali",
			ko = "제철 생선: 겨울 오징어",
			pt = "Peixe sazonal: Lula de Inverno",
			ru = "Сезонная рыба: зимний кальмар",
			cn = "时令鱼类：冬鱿鱼",
			tw = "季節性魚類：冬魷魚",
		},
	}), {
		["maps"] = {
			MAP.AZSHARA,
			MAP.TANARIS,
			MAP.THE_HINTERLANDS,
			MAP.FERALAS,
			MAP.STRANGLETHORN_VALE,
		},
		["groups"] = {
			i(13755, {	-- Winter Squid
				["description"] = createLocalizationString({
					readable = "Can be caught in open sea water in Azshara, Tanaris, The Hinterlands, Feralas, and STV from 23nd September to 20th March.",
					constant = "CAN_BE_CAUGHT_IN_OPEN_SEA_WATER_IN_AZSHARA_2",
					export = true,
					text = {
						en = "Can be caught in open sea water in Azshara, Tanaris, The Hinterlands, Feralas, and STV from 23nd September to 20th March.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "9 月 23 日至 3 月 20 日期间，可在艾萨拉、塔纳利斯、辛特兰、菲拉斯和荆棘谷的远海海水中钓到。",
						-- TODO: tw = "",
					},
				}),
			}),
		},
	})),
});
