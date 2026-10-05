---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_7 } }, {
	m(THE_FORBIDDEN_REACH, {
		n(WORLD_QUESTS, {
			["sourceQuests"] = {
				71232,	-- Renown of the Dragon Isles
				DF_ACCOUNT_CAMPAIGN_QUEST,
			},
			["groups"] = sharedData({
				["isWorldQuest"] = true,
			}, {
				petbattle(q(73148, {	-- Combustible Vegetation
					["coord"] = { 13.6, 53.6, THE_FORBIDDEN_REACH },
					-- ["maxReputation"] = { FACTION_DARK_TALONS, EXALTED },	-- TODO: convert to 'givesRep' if ever added
					["crs"] = {
						200771,	-- Wildfire (Rare?)
						200689,	-- Wildfire
						200686,	-- Wildfire
						200688,	-- Wildfire
					},
					["groups"] = {
						i(202412, {	-- Wildfire (PET!)
							["description"] = createLocalizationString({
								readable = "Weaken the boss by defeating battle pets in the area around. Only Rare version of the boss gives this pet.",
								constant = "WEAKEN_THE_BOSS_BY_DEFEATING_BATTLE_PETS_IN_THE",
								export = true,
								text = {
									en = "Weaken the boss by defeating battle pets in the area around. Only Rare version of the boss gives this pet.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "击败周围区域内的战斗宠物可以削弱首领。只有稀有版本的首领才会给予这只宠物。",
									-- TODO: tw = "",
								},
							}),
						}),
					},
				})),
				petbattle(q(73146, {	-- Cutting Wind
					["coord"] = { 18.3, 13.2, THE_FORBIDDEN_REACH },
					-- ["maxReputation"] = { FACTION_DARK_TALONS, EXALTED },	-- TODO: convert to 'givesRep' if ever added
					["crs"] = {
						200769,	-- Vortex (Rare?)
						200685,	-- Vortex
						200684,	-- Vortex
						200682,	-- Vortex
					},
					["groups"] = {
						i(202413, {	-- Vortex (PET!)
							["description"] = "~L.WEAKEN_THE_BOSS_BY_DEFEATING_BATTLE_PETS_IN_THE",
						}),
					},
				})),
				petbattle(q(73149, {	-- Flood Warning
					["coord"] = { 86.7, 62.4, THE_FORBIDDEN_REACH },
					-- ["maxReputation"] = { FACTION_DARK_TALONS, EXALTED },	-- TODO: convert to 'givesRep' if ever added
					["crs"] = {
						200772,	-- Flow (Rare?)
						200697,	-- Flow
						200694,	-- Flow
						200696,	-- Flow
					},
					["groups"] = {
						i(202407, {	-- Flow (PET!)
							["description"] = "~L.WEAKEN_THE_BOSS_BY_DEFEATING_BATTLE_PETS_IN_THE",
						}),
					},
				})),
				petbattle(q(73147, {	-- Shifting Ground
					["coord"] = { 29.0, 6.4, THE_FORBIDDEN_REACH },
					-- ["maxReputation"] = { FACTION_DARK_TALONS, EXALTED },	-- TODO: convert to 'givesRep' if ever added
					["crs"] = {
						-- 200770,	-- Tremblor
						200693,	-- Tremblor (Rare!)
						-- 200690,	-- Tremblor
						-- 200692,	-- Tremblor (Epic!)
					},
					["groups"] = {
						i(202411, {	-- Tremblor (PET!)
							["description"] = "~L.WEAKEN_THE_BOSS_BY_DEFEATING_BATTLE_PETS_IN_THE",
						}),
					},
				})),
				q(75257, {	-- The War Creche
					["coord"] = { 66.9, 5.6, THE_FORBIDDEN_REACH },
				}),
			}),
		}),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.DF, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_7 } }, {
	m(DRAGON_ISLES, {
		m(THE_FORBIDDEN_REACH, {
			n(WORLD_QUESTS, {
				q(72907),	-- [DNT] Storm Pet Battle Fodder Tracking Quest (Used for Vortex & Flow, maybe others too)
			}),
		}),
	}),
})));
