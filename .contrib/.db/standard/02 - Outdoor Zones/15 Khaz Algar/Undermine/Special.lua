---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(UNDERMINE, {
		n(SPECIAL, {
			o(509490, {	-- Sewer Cheese
				["description"] = createLocalizationString({
					readable = "In the sewers on a barrel, shared interaction between players but respawns quickly. Feed to the nearby Hungry rat.",
					constant = "IN_THE_SEWERS_ON_A_BARREL_SHARED_INTERACTION",
					export = true,
					text = {
						en = "In the sewers on a barrel, shared interaction between players but respawns quickly. Feed to the nearby Hungry rat.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在下水道的木桶上，多个玩家可以共享互动，但刷新很快。喂给附近的饥饿老鼠。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.3,
				["cr"] = 238661,	-- Hungry Rat
				["coord"] = { 33.1, 58.2, UNDERMINE },
			}),
			n(238661, {	-- Hungry Rat
				["description"] = createLocalizationString({
					readable = "Feed it Sewer Cheese picked up from a nearby barrel.",
					constant = "FEED_IT_SEWER_CHEESE_PICKED_UP_FROM_A_NEARBY",
					export = true,
					text = {
						en = "Feed it Sewer Cheese picked up from a nearby barrel.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "喂它从附近木桶里捡到的下水道奶酪。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 33.6, 58.1, UNDERMINE },
				["groups"] = {
					i(237129, {	-- Tarnished Undermine Real
						["description"] = createLocalizationString({
							readable = "Give to Pix Xizzix on the second floor of the Port Authority at the Blackwater Marina.",
							constant = "GIVE_TO_PIX_XIZZIX_ON_THE_SECOND_FLOOR_OF_THE",
							export = true,
							text = {
								en = "Give to Pix Xizzix on the second floor of the Port Authority at the Blackwater Marina.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "交给黑水码头港务局二楼的皮克斯·希兹克斯。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			n(237412, {	-- Pix Xizzix
				["coord"] = { 63.3, 16.9, UNDERMINE },
				["groups"] = {
					i(237130, {	-- Undermine Undershirt
						["cost"] = { { "i", 237129, 1 } },	-- Tarnished Undermine Real
					}),
				},
			}),
		}),
	}),
}));
