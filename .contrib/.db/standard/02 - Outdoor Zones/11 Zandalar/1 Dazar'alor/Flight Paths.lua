---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(ZANDALAR, THE_GREAT_SEAL, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(FLIGHT_PATHS, {
			fp(1957, {	-- Port of Zandalar, Zuldazar [Horde]
				coord = { 52.0, 90.0, DAZARALOR },
				races = HORDE_ONLY,
			}),
			fp(1959, {	-- The Great Seal [Horde]
				coord = { 51.92, 41.21, DAZARALOR },
				races = HORDE_ONLY,
			}),
			fp(2061, {	-- The Sliver, Zuldazar [Horde]
				coord = { 53.0, 19.2, DAZARALOR },
				races = HORDE_ONLY,
			}),
		}),
	},
});
