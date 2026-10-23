---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(KUL_TIRAS, STORMSONG_VALLEY, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(FACTIONS, {
			faction(FACTION_TORTOLLAN_SEEKERS),	-- Tortollan Seekers
			faction(FACTION_STORMS_WAKE, {	-- Storm's Wake
				races = ALLIANCE_ONLY,
			}),
		}),
	},
});
