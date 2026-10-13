-----------------------------------------------
--      P L A Y E R   V S   P L A Y E R      --
-----------------------------------------------

battleground(MAP.DARKSPEAR_ISLANDS, {
	--["lore"] = "",
	timeline = { TIMELINE.ADDED_1_60_1 },
	icon = 441150,
	groups = {
		n(ACHIEVEMENTS, {
			ach(62049, {	-- Master of Darkspear Islands
				races = HORDE_ONLY,
			}),
			ach(64029, {	-- Master of Darkspear Islands
				races = ALLIANCE_ONLY,
			}),
		}),
		n(FACTIONS, {
			faction(2798, {	-- Darkspear Raiders
				races = HORDE_ONLY,
			}),
			faction(2799, {	-- Theramore Expeditionary Force
				races = ALLIANCE_ONLY,
			}),
		}),
		n(QUESTS, {
			q(98888, {	-- Conflict at Darkspear Islands [Level 30]
				qg = 15350,	-- Horde Warbringer
				coords = HORDE_WARBRINGER_COORDS,
				cost = { { "i", 274895, 3 } },	-- Darkspear Islands Mark of Honor
				races = HORDE_ONLY,
				lvl = 30,
			}),
			q(98895, {	-- Darkspear Islands Clash [Level 30]
				qg = 15351,	-- Alliance Brigadier General
				coords = ALLIANCE_BRIGADIER_COORDS,
				cost = { { "i", 274895, 3 } },	-- Darkspear Islands Mark of Honor
				races = ALLIANCE_ONLY,
				lvl = 30,
			}),
		}),
		n(REWARDS, {
			i(274895),	-- Darkspear Islands Mark of Honor
		}),
	},
});
