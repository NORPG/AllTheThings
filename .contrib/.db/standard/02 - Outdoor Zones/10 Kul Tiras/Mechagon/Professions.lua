---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_2_0 } }, {
	m(MECHAGON, {
		n(PROFESSIONS, {
			prof(FISHING, {
				n(QUESTS, sharedData({
					["isDaily"] = true,
				},{
					q(55311, {	-- Energized Lightning Cod
						["provider"] = { "i", 167661 },	-- Energized Lightning Cod
					}),
					q(55312, {	-- Solarsprocket Barbel
						["provider"] = { "i", 167662 },	-- Solarsprocket Barbel
					}),
					q(55305, {	-- Bolted Steelhead
						["provider"] = { "i", 167655 },	-- Bolted Steelhead
					}),
					q(55313, {	-- Tasty Steelfin
						["provider"] = { "i", 167663 },	-- Tasty Steelfin
					}),
					q(55299, {	-- Bottom Feeding Stinkfish
						["provider"] = { "i", 167654 },	-- Bottom Feeding Stinkfish
					}),
					q(55306, {	-- Pond Hopping Springfish
						["provider"] = { "i", 167656 },	-- Pond Hopping Springfish
					}),
					q(55307, {	-- Shadowy Cave Eel
						["provider"] = { "i", 167657 },	-- Shadowy Cave Eel
					}),
					q(55310, {	-- Sludge-fouled Carp
						["provider"] = { "i", 167660 },	-- Sludge-fouled Carp
					}),
					q(55309, {	-- Spitting Clownfish
						["provider"] = { "i", 167659 },	-- Spitting Clownfish
					}),
					q(55308, {	-- Mechanical Blowfish
						["provider"] = { "i", 167658 },	-- Mechanical Blowfish
					}),
				})),
				n(ZONE_DROPS, {
					i(167661, {	-- Energized Lightning Cod
						["description"] = createLocalizationString({
							readable = "Can be caught near Danielle, though it's likely they can be caught anywhere along the coast of the island.",
							constant = "CAN_BE_CAUGHT_NEAR_DANIELLE_THOUGH_IT_S_LIKELY",
							export = true,
							text = {
								en = "Can be caught near Danielle, though it's likely they can be caught anywhere along the coast of the island.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在丹妮尔附近钓到，不过它们很可能在该岛沿岸的任何地方都能钓到。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(167562),	-- Ionized Minnow
					i(168262),	-- Sentry Fish
					i(167662, {	-- Solarsprocket Barbel
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere on the island.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_ON_THE_ISLAND",
							export = true,
							text = {
								en = "Can be caught anywhere on the island.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在岛上任何地方钓到。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(167655, {	-- Bolted Steelhead
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_ON_THE_ISLAND",
					}),
					i(167663, {	-- Tasty Steelfin
						["description"] = createLocalizationString({
							readable = "Can be caught at the waterfall - 47.37.",
							constant = "CAN_BE_CAUGHT_AT_THE_WATERFALL_47_37",
							export = true,
							text = {
								en = "Can be caught at the waterfall - 47.37.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在瀑布处钓到 - 47.37。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 47.0, 37.0, MECHAGON },
					}),
					i(167654, {	-- Bottom Feeding Stinkfish
						["description"] = createLocalizationString({
							readable = "Can be caught south of Rustbolt - 79.49",
							constant = "CAN_BE_CAUGHT_SOUTH_OF_RUSTBOLT_79_49",
							export = true,
							text = {
								en = "Can be caught south of Rustbolt - 79.49",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在锈栓镇以南钓到 - 79.49",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 79.0, 49.0, MECHAGON },
					}),
					i(167656, {	-- Pond Hopping Springfish
						["description"] = createLocalizationString({
							readable = "Can be caught at the pond near the waterfall - 56.32",
							constant = "CAN_BE_CAUGHT_AT_THE_POND_NEAR_THE_WATERFALL_56",
							export = true,
							text = {
								en = "Can be caught at the pond near the waterfall - 56.32",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在瀑布附近的池塘钓到 - 56.32",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 56.0, 32.0, MECHAGON },
					}),
					i(167657, {	-- Shadowy Cave Eel
						["description"] = createLocalizationString({
							readable = "Can be caught in the cave near the waterfall - 59.24",
							constant = "CAN_BE_CAUGHT_IN_THE_CAVE_NEAR_THE_WATERFALL_59",
							export = true,
							text = {
								en = "Can be caught in the cave near the waterfall - 59.24",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在瀑布附近的洞穴中钓到 - 59.24",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 59.0, 24.0, MECHAGON },
					}),
					i(167660, {	-- Sludge-fouled Carp
						["description"] = createLocalizationString({
							readable = "Can be caught in the oil pond in the middle - 66.52",
							constant = "CAN_BE_CAUGHT_IN_THE_OIL_POND_IN_THE_MIDDLE_66",
							export = true,
							text = {
								en = "Can be caught in the oil pond in the middle - 66.52",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在中央的油池中钓到 - 66.52",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 66.0, 52.0, MECHAGON },
					}),
					i(167659, {	-- Spitting Clownfish
						["description"] = createLocalizationString({
							readable = "Can be caught in the far southeast - 83.74",
							constant = "CAN_BE_CAUGHT_IN_THE_FAR_SOUTHEAST_83_74",
							export = true,
							text = {
								en = "Can be caught in the far southeast - 83.74",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在最东南处钓到 - 83.74",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 83.0, 74.0, MECHAGON },
					}),
					i(167658, {	-- Mechanical Blowfish
						["description"] = createLocalizationString({
							readable = "Can be caught in the far southwest - 25.77",
							constant = "CAN_BE_CAUGHT_IN_THE_FAR_SOUTHWEST_25_77",
							export = true,
							text = {
								en = "Can be caught in the far southwest - 25.77",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在最西南处钓到 - 25.77",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 25.0, 77.0, MECHAGON },
					}),
				}),
			}),
		}),
	}),
})));
