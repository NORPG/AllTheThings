-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------
root(ROOTS.Promotions, bubbleDown({ ["u"] = REAL_MONEY }, {
	-- #if ANYCLASSIC
	expansion(EXPANSION.TBC, {
		["timeline"] = { ADDED_2_5_1 },
		["groups"] = {
			-- 2021 5th May until 5th Nov 2021
			q(63768, {	-- Imp in a Ball
				["altQuests"] = { 63767 },	-- Imp in a Ball (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					16739,	-- Caregiver Breel <Innkeeper>
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6741,	-- Innkeeper Norman <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					16618,	-- Innkeeper Velandra <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					17630,	-- Inkeeper Jovia
					6735,	-- Inkeeper Saelienne
					19046,	-- Minalei (ALDOR)
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(32542, {	-- Imp in a Ball
						["description"] = createLocalizationString({
							readable = "Obtained if you set up a 6 Month WoW Subscription between 5th May 2021 until 5th Nov 2022.",
							constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_4",
							export = true,
							text = {
								en = "Obtained if you set up a 6 Month WoW Subscription between 5th May 2021 until 5th Nov 2022.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "如果你在 2021 年 5 月 5 日至 2022 年 11 月 5 日期间开通 6 个月《魔兽世界》订阅即可获得。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			-- 2022 13th Feb until 13th Aug 2022
			q(65285, {	-- Goblin Gumbo Kettle
				["altQuests"] = { 65284 },	-- Goblin Gumbo Kettle (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					16739,	-- Caregiver Breel <Innkeeper>
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6741,	-- Innkeeper Norman <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					16618,	-- Innkeeper Velandra <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					19046,	-- Minalei (ALDOR)
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(33219, {	-- Goblin Gumbo Kettle
						["description"] = createLocalizationString({
							readable = "Obtained if you set up a 6 Month WoW Subscription between 13th February 2022 until 13th August 2022.",
							constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_5",
							export = true,
							text = {
								en = "Obtained if you set up a 6 Month WoW Subscription between 13th February 2022 until 13th August 2022.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "如果你在 2022 年 2 月 13 日至 2022 年 8 月 13 日期间开通 6 个月《魔兽世界》订阅即可获得。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			-- 2022 14th July until 15th January 2023
			q(65562, {	-- Tabard of Flame
				["altQuests"] = { 65561 },	-- Tabard of Flame (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					16739,	-- Caregiver Breel <Innkeeper>
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6741,	-- Innkeeper Norman <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					16618,	-- Innkeeper Velandra <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					19046,	-- Minalei (ALDOR)
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(23705, {	-- Tabard of Flame
						["description"] = createLocalizationString({
							readable = "Obtained if you set up a 6 Month WoW Subscription between 13th February 2022 until 13th August 2022 or a 12 Month WoW Subscription between 11th November 2022 until 15th January 2023.",
							constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_6",
							export = true,
							text = {
								en = "Obtained if you set up a 6 Month WoW Subscription between 13th February 2022 until 13th August 2022 or a 12 Month WoW Subscription between 11th November 2022 until 15th January 2023.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "如果你在 2022 年 2 月 13 日至 2022 年 8 月 13 日期间开通 6 个月《魔兽世界》订阅，或在 2022 年 11 月 11 日至 2023 年 1 月 15 日期间开通 12 个月《魔兽世界》订阅即可获得。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			-- #if CLASSIC_ANNIVERSARY
			-- 2026 March 17 through May 15
			q(96254, {	-- An Unexpected Delivery
				["altQuests"] = { 96253 },	-- An Unexpected Delivery (Innkeepers)
				["timeline"] = { ADDED_2_5_5, REMOVED_2_5_5_PHASE_2 },
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					16739,	-- Caregiver Breel <Innkeeper>
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6741,	-- Innkeeper Norman <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					16618,	-- Innkeeper Velandra <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					19046,	-- Minalei (ALDOR)
				},
				["groups"] = {
					i(273162, {	-- Unexpected Gift
						["timeline"] = { ADDED_2_5_5, REMOVED_2_5_5_PHASE_2 },
						["groups"] = {
							i(273150, {	-- Voidfeather Dragonhawk
								["timeline"] = { ADDED_2_5_5, REMOVED_2_5_5_PHASE_2 },
								["description"] = createLocalizationString({
									readable = "Earned by completing the introductory questline for Midnight in retail servers",
									constant = "EARNED_BY_COMPLETING_THE_INTRODUCTORY_QUESTLINE",
									export = true,
									text = {
										en = "Earned by completing the introductory questline for Midnight in retail servers",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "在正式服完成《午夜》的引导任务线获得",
										-- TODO: tw = "",
									},
								}),
									}),
								},
							}),
						}
					}),
		-- #endif
		},
	}),
	expansion(EXPANSION.WRATH, {
		["timeline"] = { ADDED_3_4_0 },
		["groups"] = {
			q(72523, {	-- Festering Emerald Drake [2022 11th November until 15th January 2023]
				["altQuests"] = { 72522 },	-- Festering Emerald Drake (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					28687,	-- Amisi Azuregaze
					29532,	-- Ajay Green
					31557,	-- Uda the Beast
					32413,	-- Isirami Fairwind
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(201699, {	-- Festering Emerald Drake
						["description"] = createLocalizationString({
							readable = "Obtained if you set up a 12 Month WoW Subscription between 11th November 2022 until 15th January 2023.",
							constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_4",
							export = true,
							text = {
								en = "Obtained if you set up a 12 Month WoW Subscription between 11th November 2022 until 15th January 2023.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "如果你在 2022 年 11 月 11 日至 2023 年 1 月 15 日期间开通 12 个月《魔兽世界》订阅即可获得。",
								-- TODO: tw = "",
							},
						}),
					}),
					-- Also part of 12 Month Sub. For Historys Sake
					-- i(23705),	-- Tabard of Flame
					-- i(200060),	-- Hopling
				},
			}),
			q(74941, {	-- Flurky [2023 17th January until 31st July 2023]
				["altQuests"] = { 74940 },	-- Flurky (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					28687,	-- Amisi Azuregaze
					29532,	-- Ajay Green
					31557,	-- Uda the Beast
					32413,	-- Isirami Fairwind
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(187794),	-- Flurky
				},
			}),
			q(75492, {	-- Glub [2023 17th January until 31st July 2023]
				["altQuests"] = { 75491 },	-- Glub (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					28687,	-- Amisi Azuregaze
					29532,	-- Ajay Green
					31557,	-- Uda the Beast
					32413,	-- Isirami Fairwind
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(204982, {	-- Glub
						-- Description is under the 6 Months Promo?
					}),
				},
			}),
			q(70863, {	-- Hoplet [2023 17th January until 31st July 2023]
				["altQuests"] = { 70862 },	-- Hoplet (Innkeepers)
				["qg"] = 17249,	-- Landro Longshot <The Black Flame>
				["coords"] = {
					-- #if AFTER CATA
					{ 42.6, 71.6, THE_CAPE_OF_STRANGLETHORN },
					-- #else
					{ 28.2, 75.8, STRANGLETHORN_VALE },
					-- #endif
				},
				["maps"] = {
					THE_EXODAR,
					IRONFORGE,
					STORMWIND_CITY,
					UNDERCITY,
					THUNDER_BLUFF,
					ORGRIMMAR,
					SILVERMOON_CITY,
					SHATTRATH_CITY,
				},
				["crs"] = {
					5111,	-- Innkeeper Firebrew <Innkeeper>
					6740,	-- Innkeeper Allison <Innkeeper>
					6746,	-- Innkeeper Pala <Innkeeper>
					6929,	-- Innkeeper Gryshka <Innkeeper>
					19232,	-- Innkeeper Haelthol <Innkeeper> (SCYRER)
					28687,	-- Amisi Azuregaze
					29532,	-- Ajay Green
					31557,	-- Uda the Beast
					32413,	-- Isirami Fairwind
				},
				["u"] = REMOVED_FROM_GAME,
				["groups"] = {
					i(200060, {	-- Hoplet
					-- Description is under the 12 Months Promo
					-- ["description"] = "Obtained if you set up a 12 Month WoW Subscription between 11th November 2022 until 15th January 2023 or a 6 Month WoW Subscription between 17th January 2023 until 31st July 2023.",
					}),
				},
			}),
			i(207097, {	-- Nightmarish Emerald Drake
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12 Month WoW Subscription after 27th October 2023.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_5",
					export = true,
					text = {
						en = "Obtained if you set up a 12 Month WoW Subscription after 27th October 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2023 年 10 月 27 日之后开通 12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			i(209877, {	-- Cypress
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6 Month WoW Subscription after 10th January 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_7",
					export = true,
					text = {
						en = "Obtained if you set up a 6 Month WoW Subscription after 10th January 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2024 年 1 月 10 日之后开通 6 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			mount(49290, {	-- Magic Rooster (TW Only)[2023 10th October until 8th January 2024]
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 3 Month WoW Subscription between 10th October 2022 until 8th January 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_3_MONTH_WOW",
					export = true,
					text = {
						en = "Obtained if you set up a 3 Month WoW Subscription between 10th October 2022 until 8th January 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2022 年 10 月 10 日至 2024 年 1 月 8 日期间开通 3 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			i(74269, {	-- Blazing Hippogryph (TW Only)[2024 8th January until 8th April 2024] (Unknown which exact dates)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 3 Month WoW Subscription between 8th January 2024 until 8th April 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_3_MONTH_WOW_2",
					export = true,
					text = {
						en = "Obtained if you set up a 3 Month WoW Subscription between 8th January 2024 until 8th April 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2024 年 1 月 8 日至 2024 年 4 月 8 日期间开通 3 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
		},
	}),
	expansion(EXPANSION.CATA, {
		["timeline"] = { ADDED_4_4_0 },
		["groups"] = {
			i(224002, {	-- Swoopy
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12 Month WoW Subscription after 9th July 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_6",
					export = true,
					text = {
						en = "Obtained if you set up a 12 Month WoW Subscription after 9th July 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2024 年 7 月 9 日之后开通 12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			mount(463045, {	-- Lava Drake
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12 Month WoW Subscription after 15th October 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_7",
					export = true,
					text = {
						en = "Obtained if you set up a 12 Month WoW Subscription after 15th October 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2024 年 10 月 15 日之后开通 12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			i(231312, {	-- Timbered Air Snakelet
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6/12 Month WoW Subscription after 31st January 2025.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_12_MONTH_WOW",
					export = true,
					text = {
						en = "Obtained if you set up a 6/12 Month WoW Subscription after 31st January 2025.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2025 年 1 月 31 日之后开通 6/12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
		},
	}),
	expansion(EXPANSION.MOP, {
		["timeline"] = { ADDED_5_5_0 },
		["groups"] = {
			pet(4850, {	-- Sa'bak's Blessed
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6/12 Month WoW Subscription after 15th July 2025.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_12_MONTH_WOW_2",
					export = true,
					text = {
						en = "Obtained if you set up a 6/12 Month WoW Subscription after 15th July 2025.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你在 2025 年 7 月 15 日之后开通 6/12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
			}),
		},
	}),
	-- #endif
}));
