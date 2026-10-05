---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_1_0 } }, {
	m(KORTHIA, {
		n(SPECIAL, {
			n(180063, {	-- Darkmaul
				["description"] = createLocalizationString({
					readable = "Collect |cFFFFFFFFTasty Mawshrooms|r from the daily Invasive Mawshroom treasures in Korthia and feed them to Darkmaul.",
					constant = "COLLECT_CFFFFFFFFTASTY_MAWSHROOMS_R_FROM_THE",
					export = true,
					text = {
						en = "Collect |cFFFFFFFFTasty Mawshrooms|r from the daily Invasive Mawshroom treasures in Korthia and feed them to Darkmaul.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从刻希亚每日的入侵的巨口菇宝藏中收集|cFFFFFFFF美味巨口菇|r，并喂给暗颚。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 42.8, 32.7, KORTHIA },
				["cost"] = { { "i", 187153, 10 } },	-- 10x Tasty Mawshroom
				["groups"] = {
					i(186646),	-- Darkmaul (MOUNT!)
				},
			}),
			n(179871, {	-- Dusklight Matriarch
				["description"] = createLocalizationString({
					readable = "Bring 10 |cFFFFFFFFLost Razorwing Eggs|r to the Razorwing Nest to receive the mount.",
					constant = "BRING_10_CFFFFFFFFLOST_RAZORWING_EGGS_R_TO_THE",
					export = true,
					text = {
						en = "Bring 10 |cFFFFFFFFLost Razorwing Eggs|r to the Razorwing Nest to receive the mount.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "将 10 个|cFFFFFFFF失落的锋翼蛋|r带到锋翼巢穴即可获得坐骑。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = { { "i", 187054, 10 } },	-- 10x Lost Razorwing Egg
				["coord"] = { 25.7, 51.1, KORTHIA },
				["groups"] = {
					i(186651),	-- Dusklight Razorwing (MOUNT!)
				},
			}),
			header(HEADERS.Quest, 64292, {	-- Maelie, The Wanderer
				["icon"] = 3155422,
				["crs"] = { 179912 },	-- Maelie the Wanderer
				["coords"] = {
					{ 30.0, 55.6, KORTHIA },
					{ 35.8, 46.5, KORTHIA },
					{ 35.9, 62.3, KORTHIA },
					{ 38.5, 31.5, KORTHIA },
					{ 39.7, 34.8, KORTHIA },
					{ 41.1, 39.8, KORTHIA },
					{ 41.3, 27.8, KORTHIA },
					{ 43.2, 31.3, KORTHIA },
					{ 49.3, 41.8, KORTHIA },
					{ 50.6, 22.9, KORTHIA },
					{ 59.8, 15.1, KORTHIA },
					{ 61.3, 40.3, KORTHIA },
					{ 62.4, 49.7, KORTHIA },
					{ 67.0, 29.0, KORTHIA },
				},
				["questID"] = 64298,
				["isDaily"] = true,
				["groups"] = {
					q(64293, { ["name"] = "Day 1: Maelie found" }),	-- Day 1
					q(64294, { ["name"] = "Day 2: Maelie found" }),	-- Day 2
					q(64295, { ["name"] = "Day 3: Maelie found" }),	-- Day 3
					q(64296, { ["name"] = "Day 4: Maelie found" }),	-- Day 4
					q(64297, { ["name"] = "Day 5: Maelie found" }),	-- Day 5
					q(64299, { ["name"] = "Day 6: Maelie found" }),	-- Day 6
					q(64292, {	-- Maelie, The Wanderer
						["description"] = createLocalizationString({
							readable = "After you find Maelie 6 times, return to Tinybell and accept responsibility for the wayward unicorn.",
							constant = "AFTER_YOU_FIND_MAELIE_6_TIMES_RETURN_TO",
							export = true,
							text = {
								en = "After you find Maelie 6 times, return to Tinybell and accept responsibility for the wayward unicorn.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "找到梅莉 6 次后，回到小铃铛那里，为这头任性的独角兽承担责任。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 179930 },	-- Tinybell
						["coord"] = { 60.7, 21.8, KORTHIA },
						["groups"] = {
							i(186643),	-- Reins of the Wanderer (MOUNT!)
						},
					}),
				},
			}),
		}),
	}),
})));
