-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

DRAGONFLIGHT_SEASONAL_PROMOTIONS = createHeader({
	readable = "Dragonflight Seasonal Promotions",
	icon = [[~_.asset("Expansion_DF")]],
	text = {
		en = "Dragonflight Seasonal Promotions",
		-- TODO: de = "",
		es = "Promociones temporada Dragonflight",
		mx = "Promociones temporada Dragonflight",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		ru = "Промо Dragonflight",
		cn = "巨龙时代季节性促销",
		tw = "《巨龍崛起》季節性促銷",
	},
	description = {
		en = "These promotions happened during the time Dragonflight was the most recent expansion between 25th October 2022 & 24th July 2024.\n\nThey are listed in the order of their first appearance.",
		cn = "这些促销活动均发生在《巨龙时代》作为最新资料片的时期，时间为2022年10月25日至2024年7月24日。\n\n以下按活动首次出现的时间顺序列出。",
	},
});

root(ROOTS.Promotions, {
	n(DRAGONFLIGHT_SEASONAL_PROMOTIONS, {
		["timeline"] = { ADDED_10_0_0 },
		["groups"] = {
			-- "Pre" Season
			mount(315132, {	-- Gargantuan Grrloc (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12-Month WoW Subscription. Promotion valid through January 15, 2023.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW",
					export = true,
					text = {
						en = "Obtained if you set up a 12-Month WoW Subscription. Promotion valid through January 15, 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "设置 12 个月《魔兽世界》订阅即可获得。活动有效期至 2023 年 1 月 15 日。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_0_0 },
				["u"] = REMOVED_FROM_GAME,
			}),
			mount(381529, {	-- Telix the Stormhorn (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW",
				["timeline"] = { ADDED_10_0_0 },
				["u"] = REMOVED_FROM_GAME,
			}),
			i(34493, {	-- Dragon Kite (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 15th, 03:00 p.m. & November 18th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 15th, 03:00 p.m. & November 18th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11月15日 下午3:00 至 11月18日 晚上11:59（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_2,
					REMOVED_10_0_2_LAUNCH,	-- After November 17th, 11:59 p.m. PST
				},
			}),
			i(79771, {	-- Fel Drake (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 28th, 03:00 p.m. & December 1st, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_2",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 28th, 03:00 p.m. & December 1st, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11月28日 下午3:00 至 12月1日 晚上11:59（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					REMOVED_10_0_2_LAUNCH,	-- After December 1st 2022
				},
			}),
			i(190583, {	-- Ichabod (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between November 28th, 03:00 p.m. & December 12th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_BY_GIFTING_AN_ELIGIBLE_CREATOR_S",
					export = true,
					text = {
						en = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between November 28th, 03:00 p.m. & December 12th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 11 月 28 日下午 3:00 至 12 月 12 日晚上 11:59 期间，向符合条件的主播频道赠送两份 Twitch 订阅即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					REMOVED_10_0_2_LAUNCH,
				},
				-- #if BEFORE 10.0.2
				["u"] = REAL_MONEY,
				-- #endif
			}),
			i(70099, {	-- Cenarion Hatchling (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching the Race to World First streams with Drops enabled for at least 4 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_THE_RACE_TO_WORLD",
					export = true,
					text = {
						en = "Obtained through watching the Race to World First streams with Drops enabled for at least 4 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 12月9日 凌晨12:00 至 12月13日 下午2:59（太平洋标准时间）期间，观看开启了掉宝的世界首杀争夺战直播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					REMOVED_10_0_2_LAUNCH,
				},
			}),
			i(92724, {	-- Swift Windsteed (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching the Race to World First streams with Drops enabled for at least 8 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_THE_RACE_TO_WORLD_2",
					export = true,
					text = {
						en = "Obtained through watching the Race to World First streams with Drops enabled for at least 8 hours between December 9th, 12:00 a.m. & December 13th, 02:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 12月9日 凌晨12:00 至 12月13日 下午2:59（太平洋标准时间）期间，观看开启了掉宝的世界首杀争夺战直播至少 8 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_2_LAUNCH,
					REMOVED_10_0_2_LAUNCH,
				},
			}),
			-- Season 1
			i(49703, {	-- Perpetual Purple Firework (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 2 hours between December 13th, 03:00 p.m. & December 28th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 2 hours between December 13th, 03:00 p.m. & December 28th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 12 月 13 日下午 3:00 至 12 月 28 日晚上 11:59 期间，观看已启用掉宝的指定 Twitch 主播至少 2 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_2,
					REMOVED_10_0_2_LAUNCH,
				},
			}),
			i(203716, {	-- Thundering Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: DF Season 1\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 7th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Thundering Banner of the Aspects to use in-game!\nSign-ups close 27 January 2022 1PM PDT and The Proving Grounds are on 1 February 1PM PDT - 8 February (US) 1PM PDT.",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_DF_SEASON_1_THE",
					export = true,
					text = {
						en = "Mythic Dungeon International: DF Season 1\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 7th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Thundering Banner of the Aspects to use in-game!\nSign-ups close 27 January 2022 1PM PDT and The Proving Grounds are on 1 February 1PM PDT - 8 February (US) 1PM PDT.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：巨龙时代第 1 赛季\n\n史诗钥石地下城国际赛（MDI）迎来第 7 年的全球赛事，让最顶尖的史诗钥石地下城队伍展开竞速对决，一较高下。\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得专属的“守护巨龙的雷霆战旗”用于游戏内！\n报名将于 2022 年 1 月 27 日太平洋夏令时下午 1 点截止，试炼场将于 2 月 1 日太平洋夏令时下午 1 点至 2 月 8 日（美服）太平洋夏令时下午 1 点举行。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_0_5, REMOVED_10_0_7 },
			}),
			i(35227, {	-- Goblin Weather Machine - Prototype 01-B (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 1st, 10:00 a.m. & February 5th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_2",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 1st, 10:00 a.m. & February 5th, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 2 月 1 日上午 10:00 至 2 月 5 日晚上 11:59 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = {
					ADDED_10_0_5,
					REMOVED_10_0_5,
				},
			}),
			i(38301, {	-- D.I.S.C.O. (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 21st, 10:00 a.m. & April 2nd, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_3",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between February 21st, 10:00 a.m. & April 2nd, 11:59 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 2 月 21 日上午 10:00 至 4 月 2 日晚上 11:59 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_0_7 },
				["u"] = REMOVED_FROM_GAME,	-- 2nd April 2023
			}),
			i(203716, {	-- Thundering Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: DF Season 1\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 1 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFRaider.io/break-the-meta-2023/signups|r and complete 2 or more eligible timed keystones at level 15 or higher during BTM S1, and the Thundering Banner of the Aspects will be automatically added to your collection in-game within 30 days of the conclusion of the event.\n\nThe Event starts on April 18th for US, April 19th for EU & April 20th for KR/TW & lasts for 2 entire resets of your region.",
					constant = "BREAK_THE_META_DF_SEASON_1_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: DF Season 1\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 1 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFRaider.io/break-the-meta-2023/signups|r and complete 2 or more eligible timed keystones at level 15 or higher during BTM S1, and the Thundering Banner of the Aspects will be automatically added to your collection in-game within 30 days of the conclusion of the event.\n\nThe Event starts on April 18th for US, April 19th for EU & April 20th for KR/TW & lasts for 2 entire resets of your region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Break the Meta：巨龙时代第 1 赛季\n\nBreak the Meta 不是让队伍比拼谁的时间更快，而是聚焦于队伍使用第 1 赛季的非主流专精和职业尽可能冲高层钥石。\n\n在 |cFFFFFFFFRaider.io/break-the-meta-2023/signups|r 上注册参加活动，并在 BTM 第 1 赛季期间完成 2 个或更多符合条件的 15 层或更高限时钥石，守护巨龙的雷霆战旗将在活动结束后 30 天内自动加入你的游戏内收藏。\n\n活动于 4 月 18 日在美服、4 月 19 日在欧服、4 月 20 日在韩服/台服开始，持续你所在区域的两个完整重置周期。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_10_0_7,
					REMOVED_10_1_0,	-- Removed again on May 2nd 2023
				},
			}),
			-- Season 2
			i(54452, {	-- Ethereal Portal (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 2nd, 10:00 a.m. & May 9th, 9:59 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_4",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 2nd, 10:00 a.m. & May 9th, 9:59 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 5 月 2 日上午 10:00 至 5 月 9 日上午 9:59 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_1_0, REMOVED_10_1_0 },
			}),
			i(54069, {	-- Blazing Hippogryph (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 9th, 10:00 a.m. & May 17th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_5",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 9th, 10:00 a.m. & May 17th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 5 月 9 日上午 10:00 至 5 月 17 日上午 10:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_1_0, REMOVED_10_1_0 },
			}),
			i(208057, {	-- Smoldering Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "The Great Push returns in Dragonflight Season 2\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Smoldering Banner of the Aspects to use in-game!\nSign-ups close 30 Jun 2023 and The Proving Grounds are on 5-10 July (US).",
					constant = "THE_GREAT_PUSH_RETURNS_IN_DRAGONFLIGHT_SEASON_2",
					export = true,
					text = {
						en = "The Great Push returns in Dragonflight Season 2\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Smoldering Banner of the Aspects to use in-game!\nSign-ups close 30 Jun 2023 and The Proving Grounds are on 5-10 July (US).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "The Great Push 在《巨龙时代》第 2 赛季回归。\n\n与各队比拼击败对手用时的赛制不同，The Great Push 的重点是各队尽可能冲高层数，努力比对手生存得更久并夺得冠军！\n\n所有在时限内完成试炼场中两个地下城的报名队伍，都将获得专属的“万世熔炉的余烬战旗”以在游戏内使用！\n报名截止于 2023 年 6 月 30 日，试炼场时间为 7 月 5-10 日（美服）。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_5, REMOVED_10_1_5 },
			}),
			i(206167, {	-- Wonderous Wavewhisker (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6-Month WoW Subscription. Promotion valid through January 9, 2024.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW",
					export = true,
					text = {
						en = "Obtained if you set up a 6-Month WoW Subscription. Promotion valid through January 9, 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你开通 6 个月《魔兽世界》订阅即可获得。活动有效期至 2024 年 1 月 9 日。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_0, REMOVED_10_2_0 },
			}),
			i(32566, {	-- Picnic Basket (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between July 11th, 10:00 a.m. & July 18th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_6",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between July 11th, 10:00 a.m. & July 18th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 7 月 11 日上午 10:00 至 7 月 18 日上午 10:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_1_5 },
				["u"] = REMOVED_FROM_GAME,	-- 18th July 2023
			}),
			iensemble(190923, {	-- Ensemble: Dashing Buccaneer's Slops (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between September 5th, 10:00 a.m. & September 12th, 01:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_7",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between September 5th, 10:00 a.m. & September 12th, 01:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 9 月 5 日上午 10:00 至 9 月 12 日凌晨 1:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_5, REMOVED_10_1_5 },	-- Added 5th Sep, Removed 12th Sep
			}),
			i(208057, {	-- Smoldering Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: DF Season 2\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 2 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/break-the-meta-df-season-2/signups|r and complete at least 2 BTM-Eligible timed keystones at level +15 or higher during the Competition Period, and the Smoldering Banner of the Aspects will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on October 3rd for US, October 4th for EU & October 5th for KR/TW & lasts for 1 reset of your region.",
					constant = "BREAK_THE_META_DF_SEASON_2_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: DF Season 2\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 2 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/break-the-meta-df-season-2/signups|r and complete at least 2 BTM-Eligible timed keystones at level +15 or higher during the Competition Period, and the Smoldering Banner of the Aspects will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on October 3rd for US, October 4th for EU & October 5th for KR/TW & lasts for 1 reset of your region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Break the Meta：巨龙时代第 2 赛季\n\nBreak the Meta 不是让队伍比拼谁的时间更快，而是聚焦于队伍使用第 2 赛季的非主流专精和职业尽可能冲高层钥石。\n\n在 |cFFFFFFFFraider.io/break-the-meta-df-season-2/signups|r 上注册参加活动，并在比赛期间完成至少 2 个符合条件的 +15 层或更高限时钥石，守护巨龙的阴燃战旗将在活动结束后自动加入你的游戏内收藏。\n\n活动于 10 月 3 日在美服、10 月 4 日在欧服、10 月 5 日在韩服/台服开始，持续你所在区域的 1 个重置周期。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_7, REMOVED_10_1_7 },
			}),
			mount(419567, {	-- Ginormous Grrloc (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12-Month WoW Subscription.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_2",
					export = true,
					text = {
						en = "Obtained if you set up a 12-Month WoW Subscription.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你订阅 12 个月的《魔兽世界》，即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_1_7, REMOVED_11_0_2 },
			}),
			i(203727, {	-- Gleaming Moonbeast (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_2",
				["timeline"] = { ADDED_10_1_7, REMOVED_11_0_2 },
			}),
			-- Season 3
			pet(2623, {	-- Dottie (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between November 7th, 10:00 a.m. & November 14th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_8",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between November 7th, 10:00 a.m. & November 14th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11月7日 上午10:00 至 11月14日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的指定 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_0, REMOVED_10_2_0 },
			}),
			i(72575, {	-- White Riding Camel (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between November 14th, 10:00 a.m. & November 21st, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_9",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between November 14th, 10:00 a.m. & November 21st, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11月14日 上午10:00 至 11月21日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的指定 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_2_0, REMOVED_10_2_0 },
			}),
			i(211424, {	-- Dreaming Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: DF Season 3\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 8th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Dreaming Banner of the Aspects to use in-game!\nSign-ups close 29 January 2024 1PM PDT and The Proving Grounds are on 31st January 1PM PDT - 5 February (US) 1PM PDT.\n\nhttps://raider.io/events/mdi-dragonflight-season-3/info",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_DF_SEASON_3_THE",
					export = true,
					text = {
						en = "Mythic Dungeon International: DF Season 3\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 8th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Dreaming Banner of the Aspects to use in-game!\nSign-ups close 29 January 2024 1PM PDT and The Proving Grounds are on 31st January 1PM PDT - 5 February (US) 1PM PDT.\n\nhttps://raider.io/events/mdi-dragonflight-season-3/info",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：巨龙时代第 3 赛季\n\n史诗钥石地下城国际赛（MDI）迎来第 8 年的全球赛事，让最顶尖的史诗钥石地下城队伍展开竞速对决，一较高下。\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得专属的“守护巨龙的梦境战旗”用于游戏内！\n报名将于 2024 年 1 月 29 日太平洋夏令时下午 1 点截止，试炼场将于 1 月 31 日太平洋夏令时下午 1 点至 2 月 5 日（美服）太平洋夏令时下午 1 点举行。\n\nhttps://raider.io/events/mdi-dragonflight-season-3/info",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_5, REMOVED_10_2_5 },
			}),
			mount(418286, {	-- Auspicious Arborwyrm (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6-Month WoW Subscription.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_2",
					export = true,
					text = {
						en = "Obtained if you set up a 6-Month WoW Subscription.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "设置 6 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_0, REMOVED_11_2_0 },	-- Removed from Promotions with the next Promotion. Still purchaseable in the Shop
			}),
			i(67097, {	-- Grim Campfire (TOY!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between January 23, 10:00 a.m. & January 30, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_10",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between January 23, 10:00 a.m. & January 30, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 1 月 23 日上午 10:00 至 1 月 30 日上午 10:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_10_2_5, REMOVED_10_2_5 },
			}),
			pet(4437, {	-- Fathom (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between March 22, 10:00 a.m. & April 5, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_11",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between March 22, 10:00 a.m. & April 5, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 3 月 22 日上午 10:00 至 4 月 5 日上午 10:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_6, REMOVED_10_2_6 },
			}),
			i(211424, {	-- Dreaming Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: DF Season 3\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 3's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/break-the-meta-df-season-3/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +17|r or higher during the Competition Period, and the Dreaming Banner of the Aspects will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on April 3rd for US, April 4th for EU & April 5th for KR/TW & lasts for 2 resets of your region.",
					constant = "BREAK_THE_META_DF_SEASON_3_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: DF Season 3\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 3's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/break-the-meta-df-season-3/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +17|r or higher during the Competition Period, and the Dreaming Banner of the Aspects will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on April 3rd for US, April 4th for EU & April 5th for KR/TW & lasts for 2 resets of your region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Break the Meta：巨龙时代第 3 赛季\n\nBreak the Meta 不是让队伍比拼谁的时间更快，而是聚焦于队伍使用第 3 赛季的非主流专精和职业尽可能冲高层钥石。\n\n在 |cFFFFFFFFraider.io/break-the-meta-df-season-3/register|r 上注册参加活动，并在比赛期间完成至少 2 个符合条件的 |cFFFFFFFF+17 层|r 或更高限时钥石，守护巨龙的梦醒战旗将在活动结束后自动加入你的游戏内收藏。\n\n活动于 4 月 3 日在美服、4 月 4 日在欧服、4 月 5 日在韩服/台服开始，持续你所在区域的 2 个重置周期。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_6, REMOVED_10_2_6 },
			}),
			-- Season 4
			i(79744, {	-- Eye of the Legion (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 16, 10:00 a.m. & May 30, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_SELECT_TWITCH_12",
					export = true,
					text = {
						en = "Obtained through watching select Twitch Streamers with Drops enabled for at least 4 hours between May 16, 10:00 a.m. & May 30, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 5 月 16 日上午 10:00 至 5 月 30 日上午 10:00 期间，观看已启用掉宝的指定 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #ENDIF
				-- #ENDIF
				["timeline"] = { ADDED_MOP_REMIX, "removed 10.2.7.54904" },
			}),
			i(218128, {	-- Draconic Banner of the Aspects (TOY!)
				["description"] = createLocalizationString({
					readable = "The Great Push returns in Dragonflight Season 4\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Smoldering Banner of the Aspects to use in-game!\nSign-ups close 15 Jun 2024 and The Proving Grounds are on 19-24 June (US).",
					constant = "THE_GREAT_PUSH_RETURNS_IN_DRAGONFLIGHT_SEASON_4",
					export = true,
					text = {
						en = "The Great Push returns in Dragonflight Season 4\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Smoldering Banner of the Aspects to use in-game!\nSign-ups close 15 Jun 2024 and The Proving Grounds are on 19-24 June (US).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "The Great Push 在《巨龙时代》第 4 赛季回归。\n\n与各队比拼击败对手用时的赛制不同，The Great Push 的重点是各队尽可能冲高层数，努力比对手生存得更久并夺得冠军！\n\n所有在时限内完成试炼场中两个地下城的报名队伍，都将获得专属的“万世熔炉的余烬战旗”以在游戏内使用！\n报名截止于 2024 年 6 月 15 日，试炼场时间为 6 月 19-24 日（美服）。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_6_SEASON_FOUR, "removed 10.2.7.55142" },
			}),
			i(219450, {	-- Charming Courier (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_2",
				["timeline"] = { ADDED_10_2_6_SEASON_FOUR, REMOVED_11_2_0 },	-- Removed from Promotions with the next Promotion. Still purchaseable in the Shop
			}),
		},
	}),
});
