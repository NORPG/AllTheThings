---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.ISLE_OF_QUELDANAS, {
		n(ACHIEVEMENTS, {
			ach(62191),	-- Call of the Light
			ach(62273, {	-- Echoes of Midnight	// https://worldofwarcraft.blizzard.com/en-us/news/24267942
				["description"] = createLocalizationString({
					readable = "Earning this achievement rewards a 'Voidfeather Dragonhawk' flying mount on Anniversary realms if completed before May 16th, 2026.",
					constant = "EARNING_THIS_ACHIEVEMENT_REWARDS_A_VOIDFEATHER",
					export = true,
					text = {
						en = "Earning this achievement rewards a 'Voidfeather Dragonhawk' flying mount on Anniversary realms if completed before May 16th, 2026.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果在 2026 年 5 月 16 日之前完成，在周年庆服务器上获得此成就将奖励一只“虚空羽龙鹰”飞行坐骑。",
						-- TODO: tw = "",
					},
				}),	-- Add preprocessors if required
			}),
		}),
	}),
}));
