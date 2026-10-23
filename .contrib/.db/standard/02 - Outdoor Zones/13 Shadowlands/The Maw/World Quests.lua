---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(SHADOWLANDS, THE_MAW, {
	n(WORLD_QUESTS, sharedData({ timeline = { ADDED_9_1_0 } }, {
		q(64273, {	-- Containing the Helsworn
			sourceQuests = { 63622 },	-- Victory in Our Name
			isWorldQuest = true,
			isWeekly = true,
		}),
	})),
});
