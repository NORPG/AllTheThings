---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_2_0 } }, {
	m(EMERALD_DREAM, {
		petbattle(filter(BATTLE_PETS, {
			pet(4304, {	-- Dream Badger (PET!)
				["description"] = createLocalizationString({
					readable = "Kill pewling to force this pet to spawn.",
					constant = "KILL_PEWLING_TO_FORCE_THIS_PET_TO_SPAWN",
					export = true,
					text = {
						en = "Kill pewling to force this pet to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀皮尤林以强制刷出这只宠物。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 48.86, 57.94, EMERALD_DREAM },
					{ 51.40, 57.75, EMERALD_DREAM },
					{ 53.70, 59.48, EMERALD_DREAM },
					{ 49.98, 54.53, EMERALD_DREAM },
					{ 52.69, 77.74, EMERALD_DREAM },
				},
			}),
			pet(4275, {	-- Flooftalon (PET!)
				["description"] = createLocalizationString({
					readable = "Kill the critter version to force this to spawn.",
					constant = "KILL_THE_CRITTER_VERSION_TO_FORCE_THIS_TO_SPAWN",
					export = true,
					text = {
						en = "Kill the critter version to force this to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "杀死小动物形态的它，即可强制刷新出这个。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 47.04, 73.84, EMERALD_DREAM },
					{ 48.80, 74.51, EMERALD_DREAM },
					{ 48.85, 76.55, EMERALD_DREAM },
					{ 53.0, 66.0, EMERALD_DREAM },
				},
			}),
			pet(4276, {	-- Fol'ya Pup (PET!)
				["coords"] = {
					{ 54.0, 64.0, EMERALD_DREAM },
					{ 47.0, 47.0, EMERALD_DREAM },
				},
			}),
			pet(4278, {	-- Leyhart (PET!)
				["coords"] = {
					{ 59.0, 66.0, EMERALD_DREAM },
				},
			}),
			pet(4280, {	-- Pewling (PET!)
				["coords"] = {
					{ 59.0, 67.0, EMERALD_DREAM },
				},
			}),
			pet(4302, {	-- Pale Slumbertooth (PET!)
				["description"] = createLocalizationString({
					readable = "Requires the Friendsurge Defenders toy to see.",
					constant = "REQUIRES_THE_FRIENDSURGE_DEFENDERS_TOY_TO_SEE",
					export = true,
					text = {
						en = "Requires the Friendsurge Defenders toy to see.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要“友谊涌动防御者”玩具才能看到。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 209944 },	-- Friendsurge Defenders (TOY!)
				["coords"] = {
					{ 35.7, 62.3, EMERALD_DREAM },
					{ 53.6, 65.3, EMERALD_DREAM },
					{ 34.31, 67.65, EMERALD_DREAM },
					{ 34.60, 62.26, EMERALD_DREAM },
					{ 35.75, 62.29, EMERALD_DREAM },
					{ 53.61, 65.31, EMERALD_DREAM },
					{ 58.47, 35.07, EMERALD_DREAM },
					{ 48.36, 69.42, EMERALD_DREAM },
				},
			}),
			pet(4277, {	-- Sapnibbler (PET!)
				["coords"] = {
					{ 56.0, 70.0, EMERALD_DREAM },
				},
			}),
			pet(4279, {	-- Slumbertooth (PET!)
				["description"] = createLocalizationString({
					readable = "Can be caught outside of the Superbloom by killing the critter version.",
					constant = "CAN_BE_CAUGHT_OUTSIDE_OF_THE_SUPERBLOOM_BY",
					export = true,
					text = {
						en = "Can be caught outside of the Superbloom by killing the critter version.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在超级绽放之外击杀其小动物形态获得。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 44.41, 72.20, EMERALD_DREAM },
					{ 50.13, 78.04, EMERALD_DREAM },
				},
			}),
			pet(4303, {	-- Snaggletoof (PET!)
				["description"] = "~L.KILL_THE_CRITTER_VERSION_TO_FORCE_THIS_TO_SPAWN",
				["coords"] = {
					{ 25.53, 22.90, EMERALD_DREAM },
					{ 57.71, 26.31, EMERALD_DREAM },
					{ 49.74, 47.80, EMERALD_DREAM },
					{ 37.46, 57.65, EMERALD_DREAM },
					{ 33.58, 68.88, EMERALD_DREAM },
				},
			}),
		})),
	}),
})));
