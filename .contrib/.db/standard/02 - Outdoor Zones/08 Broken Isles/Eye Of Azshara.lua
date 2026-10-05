---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(EYE_OF_AZSHARA, {
			["description"] = createLocalizationString({
				readable = "The Eye of Azshara is zone south of Dalaran in the Broken Isles. It is an elite zone that is a replica of the dungeon of the same name. A flight master can be found here, you need to unlock it by visiting the flight point.",
				constant = "THE_EYE_OF_AZSHARA_IS_ZONE_SOUTH_OF_DALARAN_IN",
				export = true,
				text = {
					en = "The Eye of Azshara is zone south of Dalaran in the Broken Isles. It is an elite zone that is a replica of the dungeon of the same name. A flight master can be found here, you need to unlock it by visiting the flight point.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "艾萨拉之眼是破碎群岛中达拉然以南的区域。它是一个精英区域，是同一名称副本的复制版。这里可以找到一名飞行管理员，你需要访问飞行点来解锁它。",
					-- TODO: tw = "",
				},
			}),
			["icon"] = 1417426,
			["groups"] = {
				petbattle(filter(BATTLE_PETS, {
					["sym"] = {{"select","speciesID",
						1914,	-- Coastal Sandpiper (PET!)
						1728,	-- Juvenile Scuttleback (PET!)
					}},
				})),
				explorationHeader({
					visit_exploration(8373,{coord={47.5,78.7,BROKEN_ISLES}}),	-- Eye of Azshara
				}),
				n(FLIGHT_PATHS, {
					fp(1870, {	-- Eye of Azshara, Azsuna
						["coord"] = { 38.2, 46.0, EYE_OF_AZSHARA },
					}),
				}),
				n(WORLD_QUESTS, {
					q(43805, {	-- Aquatic Assassination
						["isWorldQuest"] = true,
						["lvl"] = 110,
					}),
				}),
			},
		}),
	}),
});
