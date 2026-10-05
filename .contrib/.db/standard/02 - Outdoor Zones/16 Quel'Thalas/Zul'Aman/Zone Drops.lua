---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.ZULAMAN, {
		n(ZONE_DROPS, {
			i(259361,{	-- Vile Essence
				["description"] = createLocalizationString({
					readable = "Can be looted from enemies near Maisara Caverns dungeon",
					constant = "CAN_BE_LOOTED_FROM_ENEMIES_NEAR_MAISARA_CAVERNS",
					export = true,
					text = {
						en = "Can be looted from enemies near Maisara Caverns dungeon",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可从迈萨拉洞穴地下城附近的敌人身上拾取",
						-- TODO: tw = "",
					},
				}),
			}),
		}),
	}),
}));
