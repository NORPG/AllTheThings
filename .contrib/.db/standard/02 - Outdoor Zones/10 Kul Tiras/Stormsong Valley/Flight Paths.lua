---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_0_1 } }, {
	m(STORMSONG_VALLEY, {
		n(FLIGHT_PATHS, {
			fp(2086, {	-- Brennadam, Stormsong Valley [Alliance]
				["coord"] = { 59.73, 70.57, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2097, {	-- Deadwash, Stormsong Valley [Alliance]
				["coord"] = { 42.72, 57.39, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2092, {	-- Diretusk Hollow, Stormsong Valley [Horde]
				["coord"] = { 54.2, 49.2, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2138, {	-- Fort Daelin, Stormsong Valley [Alliance]
				["coord"] = { 34.2, 47.2, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2090, {	-- Hillcrest Pasture, Stormsong Valley [Horde]
				["description"] = createLocalizationString({
					readable = "Requires completion of Mission Report: Hillcrest Pasture and related quest line to unlock.",
					constant = "REQUIRES_COMPLETION_OF_MISSION_REPORT_HILLCREST",
					export = true,
					text = {
						en = "Requires completion of Mission Report: Hillcrest Pasture and related quest line to unlock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成“任务报告：山脊牧场”及相关任务线才能解锁。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.8, 80.2, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2093, {	-- Ironmaul Overlook, Stormsong Valley [Horde]
				["coord"] = { 75.8, 64.2, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2088, {	-- Mildenhall Meadery, Stormsong Valley [Alliance]
				["coord"] = { 68.6, 65.0, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2137, {	-- Millstone Hamlet, Stormsong Valley [Alliance]
				["coord"] = { 30.8, 66.6, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2089, {	-- Seekers Vista, Stormsong Valley [N]
				["coord"] = { 40.0, 37.2, STORMSONG_VALLEY },
			}),
			fp(2095, {	-- Shrine of the Storm, Stormsong Valley [Horde]
				["coord"] = { 77.8, 24.0, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2133, {	-- Shrine of the Storm, Stormsong Valley [Alliance]
				["coord"] = { 78.2, 28.8, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2091, {	-- Stonetusk Watch, Stormsong Valley [Horde]
				["description"] = createLocalizationString({
					readable = "Requires completion of Mission Report: Stonetusk Watch and related quest line to unlock.",
					constant = "REQUIRES_COMPLETION_OF_MISSION_REPORT_STONETUSK",
					export = true,
					text = {
						en = "Requires completion of Mission Report: Stonetusk Watch and related quest line to unlock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成“任务报告：石牙哨岗”及相关任务线才能解锁。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 38.8, 66.6, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2101, {	-- The Amber Waves, Stormsong Valley [Alliance]
				["coord"] = { 50.8, 70.2, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2085, {	-- Tidecross, Stormsong Valley [Alliance]
				["coord"] = { 65.6, 48.0, STORMSONG_VALLEY },
				["races"] = ALLIANCE_ONLY,
			}),
			fp(2094, {	-- Warfang Hold, Stormsong Valley [Horde] [NOTE: Verification Required, this may be locked behind the War Campaign quests]
				["description"] = createLocalizationString({
					readable = "To unlock this Flight Path you must progress in the War Campaign and set a foothold in Stormsong Valley.",
					constant = "TO_UNLOCK_THIS_FLIGHT_PATH_YOU_MUST_PROGRESS_IN",
					export = true,
					text = {
						en = "To unlock this Flight Path you must progress in the War Campaign and set a foothold in Stormsong Valley.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要解锁此飞行路线，你必须在战争战役中取得进展，并在斯托颂谷地建立据点。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 51.4, 33.7, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
			fp(2139, {	-- Windfall Cave, Stormsong Valley [Horde]
				["description"] = createLocalizationString({
					readable = "Requires completion of Mission Report: Windfall Cavern and related quest line to unlock.",
					constant = "REQUIRES_COMPLETION_OF_MISSION_REPORT_WINDFALL",
					export = true,
					text = {
						en = "Requires completion of Mission Report: Windfall Cavern and related quest line to unlock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成“任务报告：风落洞穴”及相关任务线才能解锁。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 60.8, 27.0, STORMSONG_VALLEY },
				["races"] = HORDE_ONLY,
			}),
		}),
	}),
})));
