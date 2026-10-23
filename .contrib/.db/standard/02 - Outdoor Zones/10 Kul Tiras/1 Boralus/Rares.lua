---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(KUL_TIRAS, BORALUS, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(RARES, {
			n(139287, {	-- Sawtooth
				questID = 51877,
				coords = {
					{ 76.8, 37.2, BORALUS },
					{ 81.6, 50.4, BORALUS },
				},
				groups = {
					i(155273),	-- Shartook Hatchet
					crit(41830, {	-- Sawtooth
						achievementID = 12939,	-- Adventurer of Tiragarde Sound
					}),
				},
			}),
		}),
	},
});
