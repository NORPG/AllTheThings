---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(SHADOWLANDS, ORIBOS, {
	timeline = { ADDED_9_0_2_LAUNCH },
	groups = {
		o(353484, {	-- The Great Vault
			coord = { 64.3, 32.1, ORIBOS },
			timeline = { ADDED_9_0_2_LAUNCH, REMOVED_10_0_2_LAUNCH },
			groups = {
				i(187219, {	-- Attendant's Token of Merit
					timeline = { ADDED_9_2_0, REMOVED_9_2_5 },
				}),
				i(199202, {	-- Attendant's Token of Merit
					timeline = { ADDED_9_2_5, REMOVED_10_0_0 },
				}),
			},
		}),
	},
});
