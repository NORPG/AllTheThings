---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(NAZJATAR, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	n(FLIGHT_PATHS, {
		fp(2410, {	-- Ashen Strand
			["coord"] = { 31.8, 38.1, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
		}),
		fp(2411, {	-- Ashen Strand
			["coord"] = { 34.5, 37.3, NAZJATAR },
			["races"] = HORDE_ONLY,
		}),
		fp(2437, {	-- Ekka's Hideaway
			["coord"] = { 64.0, 51.8, NAZJATAR },
			["races"] = HORDE_ONLY,
		}),
		fp(2406, {	-- Elun'alor Temple
			["coord"] = { 74.0, 40.0, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
		}),
		fp(2403, {	-- Kelya's Grave
			["coord"] = { 74.2, 24.9, NAZJATAR },
			["description"] = createLocalizationString({
				readable = "Must complete the |cFFFFD700On Ghostly Wings|r quest to unlock this path.",
				constant = "MUST_COMPLETE_THE_CFFFFD700ON_GHOSTLY_WINGS_R",
				export = true,
				text = {
					en = "Must complete the |cFFFFD700On Ghostly Wings|r quest to unlock this path.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "必须完成|cFFFFD700乘着幽灵之翼|r任务才能解锁此路线。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuest"] = 56422,	-- On Ghostly Wings
		}),
		fp(2408, {	-- Mezzamere
			["description"] = createLocalizationString({
				readable = "Must complete the |cFFFFD700Where the Road Leads|r quest to unlock this path.",
				constant = "MUST_COMPLETE_THE_CFFFFD700WHERE_THE_ROAD_LEADS",
				export = true,
				text = {
					en = "Must complete the |cFFFFD700Where the Road Leads|r quest to unlock this path.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "必须完成|cFFFFD700道路通向何方|r任务才能解锁此路线。",
					-- TODO: tw = "",
				},
			}),
			["coord"] = { 39.9, 54.1, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
			["sourceQuest"] = 55175,	-- Where the Road Leads
		}),
		fp(2404, {	-- Newhome
			["coord"] = { 47.5, 63.3, NAZJATAR },
			["races"] = HORDE_ONLY,
		}),
		fp(2483, {	-- The Tidal Conflux (A)
			["coord"] = { 49.8, 23.6, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
			["sourceQuests"] = {
				56325,	-- Changing Tides
			},
		}),
		fp(2482, {	-- The Tidal Conflux (H)
			["coord"] = { 51.1, 23.6, NAZJATAR },
			["races"] = HORDE_ONLY,
			["sourceQuests"] = {
				55799,	-- The Tide Turns
			},
		}),
		fp(2407, {	-- Utama's Stand
			["coord"] = { 61.7, 36.5, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
		}),
		fp(2412, {	-- Wreck of the Hungry Riverbeast
			["coord"] = { 36.1, 82.3, NAZJATAR },
			["races"] = HORDE_ONLY,
		}),
		fp(2409, {	-- Wreck of the Old Blanchy
			["coord"] = { 44.5, 85.5, NAZJATAR },
			["races"] = ALLIANCE_ONLY,
		}),
		fp(2405, {	-- Zin'Azshari
			["coord"] = { 79.5, 37.9, NAZJATAR },
			["races"] = HORDE_ONLY,
		}),
	}),
})));
