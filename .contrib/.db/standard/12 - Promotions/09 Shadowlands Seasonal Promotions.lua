-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

SHADOWLANDS_SEASONAL_PROMOTIONS = createHeader({
	readable = "Shadowlands Seasonal Promotions",
	icon = [[~_.asset("Expansion_SL")]],
	text = {
		en = "Shadowlands Seasonal Promotions",
		-- TODO: de = "",
		es = "Promociones temporada Shadowlands",
		mx = "Promociones temporada Shadowlands",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		ru = "Промо Shadowlands",
		cn = "暗影国度季节性促销",
		tw = "《暗影之境》季節性促銷",
	},
	description = {
		en = "These promotions happened during the time Shadowlands was the most recent content between 13th October 2020 & 25th October 2022.\n\nThey are listed in the order of their first appearance.",
		cn = "这些促销活动均发生在《暗影国度》作为最新内容的时期，时间为2020年10月13日至2022年10月25日。\n\n以下按活动首次出现的时间顺序列出。",
	},
});

root(ROOTS.Promotions, {
	n(SHADOWLANDS_SEASONAL_PROMOTIONS, {
		["timeline"] = { ADDED_9_0_5 },
		["groups"] = {
			-- SEASON 1
			mount(348162, {	-- Wandering Ancient (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Granted to players by logging in on character of at least level 20.",
					constant = "GRANTED_TO_PLAYERS_BY_LOGGING_IN_ON_CHARACTER",
					export = true,
					text = {
						en = "Granted to players by logging in on character of at least level 20.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用至少 20 级的角色登录游戏即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_9_0_5, REMOVED_10_0_0 },
			}),
			-- SEASON 2
			i(187834, {		-- Tormented Banner of the Opportune (TOY!)
				["description"] = createLocalizationString({
					readable = "The Great Push: SL Season 2\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Tormented Banner of the Opportune to use in-game!\nSign-ups close 29 Nov 2021 and The Proving Grounds are on 3-5 Dec (US).",
					constant = "THE_GREAT_PUSH_SL_SEASON_2_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "The Great Push: SL Season 2\n\nInstead of teams fighting to beat their opponent's time, The Great Push is focused on teams pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Tormented Banner of the Opportune to use in-game!\nSign-ups close 29 Nov 2021 and The Proving Grounds are on 3-5 Dec (US).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "The Great Push：暗影国度第 2 赛季\n\n与各队比拼击败对手用时的赛制不同，The Great Push 的重点是各队尽可能冲高层数，努力比对手生存得更久并夺得冠军！\n\n所有在时限内完成试炼场中两个地下城的报名队伍，都将获得专属的“良机者的折磨战旗”以在游戏内使用！\n报名截止于 2021 年 11 月 29 日，试炼场时间为 12 月 3-5 日（美服）。",
						-- TODO: tw = "",
					},
				}),
				["u"] = REMOVED_FROM_GAME,
			}),
			-- SEASON 3
			i(187957, {		-- Encrypted Banner of the Opportune (TOY!)
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: SL Season 3\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 6th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Encrypted Banner of the Opportune to use in-game!\nSign-ups close 28 March 2022 and The Proving Grounds are on 30 March - 5 April (US).",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_SL_SEASON_3_THE",
					export = true,
					text = {
						en = "Mythic Dungeon International: SL Season 3\n\nThe Mythic Dungeon International (MDI) returns with its global competitions for its 6th year, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Encrypted Banner of the Opportune to use in-game!\nSign-ups close 28 March 2022 and The Proving Grounds are on 30 March - 5 April (US).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：暗影国度第 3 赛季\n\n史诗钥石地下城国际赛（MDI）迎来第 6 年的全球赛事，让最顶尖的史诗钥石地下城队伍展开竞速对决，一较高下。\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得专属的“机遇者的加密战旗”用于游戏内！\n报名将于 2022 年 3 月 28 日截止，试炼场将于 3 月 30 日至 4 月 5 日（美服）举行。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_9_2_0,
					REMOVED_9_2_0,	-- 8th April 2022, 1 day after the event ended.
				},
			}),
			i(95474, {	-- Jewel of the Firelord (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through Prime Gaming from June 29th 2022 till July 26th 2022.",
					constant = "OBTAINED_THROUGH_PRIME_GAMING_FROM_JUNE_29TH",
					export = true,
					text = {
						en = "Obtained through Prime Gaming from June 29th 2022 till July 26th 2022.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2022 年 6 月 29 日至 2022 年 7 月 26 日的 Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_9_2_5,
					REMOVED_9_2_7,	-- 2nd August 2022, 6 days after the event ended
				},
			}),
			-- SEASON 4
			ach(15594, {	-- Fearless Spectator
				["description"] = createLocalizationString({
					readable = "Granted to players who watch MDI Global Finals, AWC Grand Finals or AWC Cross-Region Tournament for 2 total hours in July 2022. You have to link your Battle.net account to your YouTube account and watch eligible streams.",
					constant = "GRANTED_TO_PLAYERS_WHO_WATCH_MDI_GLOBAL_FINALS",
					export = true,
					text = {
						en = "Granted to players who watch MDI Global Finals, AWC Grand Finals or AWC Cross-Region Tournament for 2 total hours in July 2022. You have to link your Battle.net account to your YouTube account and watch eligible streams.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 2022 年 7 月期间累计观看 MDI 全球总决赛、AWC 总决赛或 AWC 跨区域锦标赛满 2 小时的玩家可获得。你必须将 Battle.net 账号与 YouTube 账号关联并观看符合条件的直播。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = { title(459) },	-- Fearless Spectator <Name>
				["timeline"] = {
					ADDED_9_2_5,
					REMOVED_9_2_7,	-- 2nd August 2022, 7 days after the event ended
				},
			}),
			i(97213, {	-- Hood of Hungering Darkness (COSMETIC!)
				-- ["description"] = "Obtained through Prime Gaming from July 27th 2022 till August 23rd 2022.",
				["timeline"] = { ADDED_9_2_5 },
				["u"] = REMOVED_FROM_GAME,	-- Removed again on August 24th 2022
			}),
			i(187958, {		-- Shrouded Banner of the Opportune (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: SL Season 4\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 4 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFRaider.io/break-the-meta-2022|r and complete 2 or more eligible timed keystones at level 15 or higher during BTM S4, and the Shrouded Banner of the Opportune will be automatically added to your collection in-game within 30 days of the conclusion of the event.\n\nThe Event starts on October 4th for US, October 5th for EU & October 6th for KR/TW & lasts for the entire reset of your region.\n\nThis was previously available through The Great Push: SL Season 4.",
					constant = "BREAK_THE_META_SL_SEASON_4_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: SL Season 4\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season's 4 off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFRaider.io/break-the-meta-2022|r and complete 2 or more eligible timed keystones at level 15 or higher during BTM S4, and the Shrouded Banner of the Opportune will be automatically added to your collection in-game within 30 days of the conclusion of the event.\n\nThe Event starts on October 4th for US, October 5th for EU & October 6th for KR/TW & lasts for the entire reset of your region.\n\nThis was previously available through The Great Push: SL Season 4.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Break the Meta：暗影界第 4 赛季\n\nBreak the Meta 不是让队伍比拼谁的时间更快，而是聚焦于队伍使用第 4 赛季的非主流专精和职业尽可能冲高层钥石。\n\n在 |cFFFFFFFFRaider.io/break-the-meta-2022|r 上注册参加活动，并在 BTM 第 4 赛季期间完成 2 个或更多符合条件的 15 层或更高限时钥石，应时者的隐秘战旗将在活动结束后 30 天内自动加入你的游戏内收藏。\n\n活动于 10 月 4 日在美服、10 月 5 日在欧服、10 月 6 日在韩服/台服开始，持续你所在区域的整个重置周期。\n\n此物品此前可通过 The Great Push：暗影界第 4 赛季获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_9_2_7,	-- 23rd September 2022, 11 days before the event started.
					REMOVED_10_0_0,	-- 16th August 2022, 1 day after the event ended.
				},
				["u"] = REMOVED_FROM_GAME,	-- Removed again on October 12th 2022
			}),
			i(95475, {	-- Crown of Eternal Winter (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through Prime Gaming from August 24th 2022 till September 20th 2022.",
					constant = "OBTAINED_THROUGH_PRIME_GAMING_FROM_AUGUST_24TH",
					export = true,
					text = {
						en = "Obtained through Prime Gaming from August 24th 2022 till September 20th 2022.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2022 年 8 月 24 日至 2022 年 9 月 20 日的 Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = {
					ADDED_9_2_7,
					REMOVED_9_2_7,	-- 23 September 2022, 3 days after the event ended.
				},
			}),
			mount(386452, {	-- Frostbrood Proto-Wyrm (MOUNT!)
				["description"] = createLocalizationString({
					readable = "In order to unlock the Frostbrood Proto-Wyrm you have finish the Death Knight starting zone in |cFFfe040fWotLK Classic|r. The very first Death Knight you make is completely free of restrictions, so even if you've never played Classic before, you can create a Death Knight starting at level 55.",
					constant = "IN_ORDER_TO_UNLOCK_THE_FROSTBROOD_PROTO_WYRM",
					export = true,
					text = {
						en = "In order to unlock the Frostbrood Proto-Wyrm you have finish the Death Knight starting zone in |cFFfe040fWotLK Classic|r. The very first Death Knight you make is completely free of restrictions, so even if you've never played Classic before, you can create a Death Knight starting at level 55.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要解锁霜巢始祖龙，你必须在|cFFfe040f巫妖王之怒经典版|r中完成死亡骑士新手区。你创建的第一个死亡骑士完全不受限制，所以即使你从未玩过经典版，也可以从 55 级开始创建死亡骑士。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_9_2_7, REMOVED_10_0_2_LAUNCH },
			}),
		},
	}),
});
