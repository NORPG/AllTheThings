---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(SHADOWLANDS, THE_MAW, {
	n(EMISSARY_QUESTS, sharedData({ timeline = { ADDED_9_1_0 } }, {
		q(64267, {	-- Mysterious Gifts from Ve'nari
			minReputation = { FACTION_VENARI, 1 },	-- Ve'nari, Dubious
			repeatable = true,
			groups = {
				i(187029, {	-- Mysterious Gift from Ve'nari
					i(186657),	-- Soulbound Gloomcharger (MOUNT!)
					i(186552),	-- Rook (PET!)
				}),
			},
		}),
	})),
});

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, {
	m(SHADOWLANDS, {
		m(THE_MAW, {
			n(EMISSARY_QUESTS, sharedData({ timeline = { ADDED_9_1_0 } }, {
				q(64288),	-- Paragon of Ve'nari
				q(64315),	-- Ve'nari paragon chest
			})),
		}),
	}),
}));
