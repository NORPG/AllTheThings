---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(ZANDALAR, THE_GREAT_SEAL, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(FACTIONS, {
			faction(FACTION_THE_HONORBOUND, {	-- The Honorbound
				races = HORDE_ONLY,
			}),
			faction(FACTION_ZANDALARI_EMPIRE, {	-- Zandalari Empire
				races = HORDE_ONLY,
			}),
		}),
	},
});
