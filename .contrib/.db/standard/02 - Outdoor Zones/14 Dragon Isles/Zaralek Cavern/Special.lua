---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_1_0 } }, {
	m(ZARALEK_CAVERN, {
		n(SPECIAL, {
			n(205010, {	-- Curious Top Hat
				["coords"] = {
					{ 38.9, 64.3, ZARALEK_CAVERN },
					{ 51.6, 66.9, ZARALEK_CAVERN },
					{ 61.7, 69.8, ZARALEK_CAVERN },
					{ 61.6, 69.5, ZARALEK_CAVERN },
					{ 44.0, 77.5, ZARALEK_CAVERN },
					{ 63.2, 55.7, ZARALEK_CAVERN },
				},
				["cost"] = { { "i", 205686, 1 } },	-- 1x Clacking Claw
				["groups"] = {
					i(205021),	-- Lord Stantley (PET!)
				},
			}),
			i(204849, {	-- Ratcipe: Charitable Cheddar (RECIPE!)
				["cost"] = { { "i", 204872, 30 } },	-- 30x Ripped Recipe Scrap
			}),
			o(398698, {	-- Squeaking Swiss
				["coord"] = { 52.4, 26.8, ZARALEK_CAVERN },
				["questID"] = 75648,
				["groups"] = {
					i(204871, {	-- Recipe Rat
						["cost"] = { { "i", 3927, 20 } },	-- 20x Fine Aged Cheddar
						["groups"] = {
							i(204872),	-- Ripped Recipe Scrap
						},
					}),
				},
			}),
			n(205227, {	-- Tarasek Fighter
				["description"] = createLocalizationString({
					readable = "Not technically a rare but behaves like one in regards to certain drops. May require killing any active 'Sundered Flame Cleaver' NPCs to trigger a spawn after 10 minutes.",
					constant = "NOT_TECHNICALLY_A_RARE_BUT_BEHAVES_LIKE_ONE_IN",
					export = true,
					text = {
						en = "Not technically a rare but behaves like one in regards to certain drops. May require killing any active 'Sundered Flame Cleaver' NPCs to trigger a spawn after 10 minutes.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "严格来说不是稀有怪，但在某些掉落上表现得像稀有怪。可能需要击杀所有活跃的“破碎烈焰切割者”NPC，10 分钟后触发刷新。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_0 },
				["coords"] = {
					{ 45.4, 56.2, ZARALEK_CAVERN },
					{ 46.6, 54.4, ZARALEK_CAVERN },
					{ 47.8, 56.8, ZARALEK_CAVERN },
					{ 46.2, 58.8, ZARALEK_CAVERN },
				},
			}),
		}),
	}),
})));
