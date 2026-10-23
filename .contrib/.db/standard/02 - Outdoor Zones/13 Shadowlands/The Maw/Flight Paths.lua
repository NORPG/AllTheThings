---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(SHADOWLANDS, THE_MAW, {
	timeline = { ADDED_9_1_0 },
	groups = {
		n(FLIGHT_PATHS, {
			fp(2700, {	-- Ve'nari's Refuge
				sourceQuests = { 63855 },	-- Ease of Passage
				coord = { 47.2, 43.6, THE_MAW },
				cr = 178823,	-- Animaflow Teleporter
			}),
		}),
	},
});
