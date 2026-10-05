---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(DRUSTVAR, {
		n(FLIGHT_PATHS, {
			fp(2127, {	-- Anyport, Drustvar [N]
				["coord"] = { 19.2, 43.2, DRUSTVAR },
			}),
			fp(2106, {	-- Arom's Stand, Drustvar [Alliance]
				["coord"] = { 38.14, 52.53, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2037, {	-- Barbthorn Ridge, Drustvar [Alliance]
				["coord"] = { 62.6, 23.8, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2108, {	-- Falconhurst, Drustvar [Alliance]
				["description"] = createLocalizationString({
					readable = "This flight path may be unlocked prior to completion of the nearby quest chain, but interacting with a different flight master on the same continent will be required to mark it as collected.",
					constant = "THIS_FLIGHT_PATH_MAY_BE_UNLOCKED_PRIOR_TO",
					export = true,
					text = {
						en = "This flight path may be unlocked prior to completion of the nearby quest chain, but interacting with a different flight master on the same continent will be required to mark it as collected.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这条飞行路线可能在完成附近任务线之前就已解锁，但需要与同一大陆上的另一个飞行管理员互动才能将其标记为已收集。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 27.0, 72.2, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
				-- ["sourceQuest"] = ,	-- TODO: this flight master does not provide flight path and has dialog about improving the town situation
			}),
			fp(2056, {	-- Fallhaven, Drustvar (Ferry) [Alliance]
				["coord"] = { 61.6, 36.6, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2033, {	-- Fallhaven, Drustvar [Alliance]
				["coord"] = { 55.2, 34.8, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2057, {	-- Fletcher's Hollow, Drustvar (Ferry) [Alliance]
				["coord"] = { 69.4, 57.2, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2035, {	-- Fletcher's Hollow, Drustvar [Alliance]
				["coord"] = { 70.2, 60.4, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2034, {	-- Hangman's Point, Drustvar [Alliance]
				["coord"] = { 71.0, 40.8, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2135, {	-- Krazzlefrazz Outpost, Drustvar [Horde] [NOTE: Verification Required, this may be locked behind the War Campaign quests]
				["coord"] = { 37.4, 24.0, DRUSTVAR },
				["races"] = HORDE_ONLY,
			}),
			fp(2275, {	-- Mudfisher Cove, Drustvar [Horde]
				["description"] = createLocalizationString({
					readable = "Requires completion of Mission Report: Mudfisher Cove and related quest line to unlock.",
					constant = "REQUIRES_COMPLETION_OF_MISSION_REPORT_MUDFISHER",
					export = true,
					text = {
						en = "Requires completion of Mission Report: Mudfisher Cove and related quest line to unlock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成“任务报告：泥鱼湾”及相关任务线才能解锁。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 62.0, 16.8, DRUSTVAR },
				["races"] = HORDE_ONLY,
			}),
			fp(2274, {	-- Swiftwind Post, Drustvar [Horde]
				["description"] = createLocalizationString({
					readable = "Requires completion of Mission Report: Swiftwind Post and related quest line to unlock.",
					constant = "REQUIRES_COMPLETION_OF_MISSION_REPORT_SWIFTWIND",
					export = true,
					text = {
						en = "Requires completion of Mission Report: Swiftwind Post and related quest line to unlock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成“任务报告：疾风岗哨”及相关任务线才能解锁。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 66.4, 59.2, DRUSTVAR },
				["races"] = HORDE_ONLY,
			}),
			fp(2107, {	-- Watchman's Rise, Drustvar [Alliance]
				["coord"] = { 31.8, 30.4, DRUSTVAR },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2109, {	-- Whitegrove Chapel, Drustvar [N]
				["coord"] = { 25.6, 16.6, DRUSTVAR },
			}),
		}),
	}),
})));
