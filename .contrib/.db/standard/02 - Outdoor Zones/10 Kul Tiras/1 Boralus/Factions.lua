---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(KUL_TIRAS, BORALUS, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(FACTIONS, {
			faction(FACTION_7TH_LEGION, {	-- 7th Legion
				races = ALLIANCE_ONLY,
			}),
			faction(FACTION_PROUDMOORE_ADMIRALTY, {	-- Proudmoore Admiralty
				races = ALLIANCE_ONLY,
			}),
		}),
	},
});
