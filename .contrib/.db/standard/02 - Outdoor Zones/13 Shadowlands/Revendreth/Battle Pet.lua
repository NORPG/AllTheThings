---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(REVENDRETH, {
		petbattle(filter(BATTLE_PETS, {
			pet(2902),	-- Dusky Dredwing Pup (PET!)
			pet(2895, {	-- Lost Soul (PET!)
				["description"] = createLocalizationString({
					readable = "Shares spawn timer with Rosetipped Spiderling in The Banewood, killing any you see will increase spawn chances.",
					constant = "SHARES_SPAWN_TIMER_WITH_ROSETIPPED_SPIDERLING",
					export = true,
					text = {
						en = "Shares spawn timer with Rosetipped Spiderling in The Banewood, killing any you see will increase spawn chances.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与灾木林的玫瑰尖幼蛛共享刷新计时，击杀你看到的任何一只都会提高刷新几率。",
						-- TODO: tw = "",
					},
				}),
			}),
			pet(3014, {	-- Mire Creeper (PET!)
				["description"] = createLocalizationString({
					readable = "There is only one of these up at a time, and it runs around pools in The Endmire. Respawn time of ~5 minutes if it dies.",
					constant = "THERE_IS_ONLY_ONE_OF_THESE_UP_AT_A_TIME_AND_IT",
					export = true,
					text = {
						en = "There is only one of these up at a time, and it runs around pools in The Endmire. Respawn time of ~5 minutes if it dies.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这个稀有同时只会存在一个，它会在终末泥沼的水池周围奔跑。若被击杀，刷新时间约为 5 分钟。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 56.0, 59.0, REVENDRETH },
			}),
			pet(3007, {	-- Rosetipped Spiderling (PET!)
				["coord"] = { 78.4, 47.6, REVENDRETH },
			}),
			pet(3015),	-- Withering Creeper (PET!)
		})),
	}),
})));
