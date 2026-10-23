---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(KUL_TIRAS, TIRAGARDE_SOUND, {
	timeline = { ADDED_8_0_1 },
	groups = {
		n(PROFESSIONS, {
			prof(JEWELCRAFTING, {
				q(55578, {	-- Tol Dagor: Jewel of the Tides (H)
					sourceQuest = 49599,	-- The Missing Chapter (H)
					provider = { "n", 150893 },	-- Shrine of the Sea
					coord = { 46.4, 23.5, TIRAGARDE_SOUND },
					requireSkill = JEWELCRAFTING,
					races = HORDE_ONLY,
					modelScale = 2,
					lvl = 50,
					groups = {
						i(155648),	-- Jewel of the Tides
					},
				}),
			}),
		}),
	},
});
