-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

MISCELLANEOUS_PROMOTIONS = createHeader({
	readable = "Miscellaneous",
	icon = 135999,
	text = {
		en = [[~AUCTION_CATEGORY_MISCELLANEOUS]],
	},
	description = {
		en = "This section is for miscellaneous promotions that took place in the real world or something to do with account management.",
		cn = "本板块用于收录现实中开展的各类杂项促销活动，以及与账号管理相关的内容。",
	},
});

root(ROOTS.Promotions, n(MISCELLANEOUS_PROMOTIONS, bubbleDown({ ["u"] = REMOVED_FROM_GAME }, {
	i(19160, {	-- Contest Winner's Tabard [TODO: Move to PVP?]
		["description"] = createLocalizationString({
			readable = "This tabard was given to the people on each servers with the most honorable kills before the introduction of the original honor system.",
			constant = "THIS_TABARD_WAS_GIVEN_TO_THE_PEOPLE_ON_EACH",
			export = true,
			text = {
				en = "This tabard was given to the people on each servers with the most honorable kills before the introduction of the original honor system.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "在最初的荣誉系统推出之前，此战袍会发放给每个服务器荣誉击杀数最高的玩家。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_1_11_1 },
	}),
	un(REAL_MONEY, i(49646, {	-- Core Hound Pup (PET!)
		["description"] = createLocalizationString({
			readable = "Granted to players that attach an authenticator to their account.",
			constant = "GRANTED_TO_PLAYERS_THAT_ATTACH_AN_AUTHENTICATOR",
			export = true,
			text = {
				en = "Granted to players that attach an authenticator to their account.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "为账号绑定了安全令的玩家授予。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = {
			-- #if ANYCLASSIC
			CREATED_3_3_0,
			-- #else
			ADDED_3_3_0,
			-- #endif
		},
	})),
	i(48527, {	-- Onyx Panther (PET!)
		["description"] = createLocalizationString({
			readable = "Reward from a Korean-exclusive World Event that mailed you this pet.",
			constant = "REWARD_FROM_A_KOREAN_EXCLUSIVE_WORLD_EVENT_THAT",
			export = true,
			text = {
				en = "Reward from a Korean-exclusive World Event that mailed you this pet.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "韩国专属世界活动的奖励，该活动会通过邮件将这只宠物发送给你。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { CREATED_3_0_2, ADDED_4_0_3 },
		["groups"] = {
			ach(3896, {	-- Onyx Panther
				["timeline"] = { ADDED_4_0_3 },
			}),
		},
	}),
	i(32498, {	-- Lucky (PET!)
		["description"] = createLocalizationString({
			readable = "Reward from the 2007 Korean Worldwide Invitational (Korea Only)",
			constant = "REWARD_FROM_THE_2007_KOREAN_WORLDWIDE",
			export = true,
			text = {
				en = "Reward from the 2007 Korean Worldwide Invitational (Korea Only)",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "2007 年韩国全球邀请赛的奖励（仅限韩国）",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_2_1_0 },
	}),
	i(103632, {	-- Lucky Box of Greatness
		["description"] = createLocalizationString({
			readable = "Reward from the Azeroth Academy Mentor Recruitment Promotion (China Only)",
			constant = "REWARD_FROM_THE_AZEROTH_ACADEMY_MENTOR",
			export = true,
			text = {
				en = "Reward from the Azeroth Academy Mentor Recruitment Promotion (China Only)",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "艾泽拉斯学院导师招募推广活动的奖励（仅限中国）",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_5_4_0 },
		["groups"] = {
			i(103630),	-- Riding Turtle (MOUNT!)
			i(103629),	-- Lucky Satchel
			i(103631),	-- Lucky Path of Cenarius
		},
	}),
	ach(3618, {	-- Murkimus the Gladiator
		["timeline"] = { ADDED_3_1_2 },
	}),
	i(45180, {	-- Murkimus the Gladiator [Murkimus' Little Spear] (PET!)
		["description"] = createLocalizationString({
			readable = "This was obtained by participating in at least 200 arena matches in the 2009 Arena Tournament, or at least 50 matches on the same team in the years after that.",
			constant = "THIS_WAS_OBTAINED_BY_PARTICIPATING_IN_AT_LEAST",
			export = true,
			text = {
				en = "This was obtained by participating in at least 200 arena matches in the 2009 Arena Tournament, or at least 50 matches on the same team in the years after that.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "这是通过参加 2009 年竞技场锦标赛中至少 200 场比赛，或在此后几年中在同一队伍中至少参加 50 场比赛获得的。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_3_1_2 },
	}),
	i(46892, {	-- Murkimus the Gladiator [Murkimus' Tiny Spear] (PET!)
		["description"] = createLocalizationString({
			readable = "This was a reward for the 2011 arena tournament, requirements were to participate in 50 games in your current 3v3 team when the tournament closed",
			constant = "THIS_WAS_A_REWARD_FOR_THE_2011_ARENA_TOURNAMENT",
			export = true,
			text = {
				en = "This was a reward for the 2011 arena tournament, requirements were to participate in 50 games in your current 3v3 team when the tournament closed",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "这是 2011 年竞技场锦标赛的奖励，要求是在锦标赛结束时在当前 3v3 队伍中参加过 50 场比赛",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_4_2_0 },
	}),
	i(100870, {	-- Murkimus the Gladiator [Murkimus' Tyrannical Spear] (PET!)
		["description"] = createLocalizationString({
			readable = "This was a reward for the 2013 arena tournament, requirements were to participate in 50 games in your current 3v3 team when the tournament closed",
			constant = "THIS_WAS_A_REWARD_FOR_THE_2013_ARENA_TOURNAMENT",
			export = true,
			text = {
				en = "This was a reward for the 2013 arena tournament, requirements were to participate in 50 games in your current 3v3 team when the tournament closed",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "这是 2013 年竞技场锦标赛的奖励，要求是在锦标赛结束时在当前 3v3 队伍中参加过 50 场比赛",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_5_2_0 },
	}),
	i(20651, {	-- Murki (PET!)
		["description"] = createLocalizationString({
			readable = "Reward from a Korean Promotional Event (Korea Only)",
			constant = "REWARD_FROM_A_KOREAN_PROMOTIONAL_EVENT_KOREA",
			export = true,
			text = {
				en = "Reward from a Korean Promotional Event (Korea Only)",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "韩国推广活动的奖励（仅限韩国）",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { "created 1.13.0", ADDED_2_1_0 },
	}),
	i(22114, {	-- Gurky (PET!)
		["description"] = createLocalizationString({
			readable = "Offered as a fan website gift around Christmas 2006, in Europe. (EU Only)",
			constant = "OFFERED_AS_A_FAN_WEBSITE_GIFT_AROUND_CHRISTMAS",
			export = true,
			text = {
				en = "Offered as a fan website gift around Christmas 2006, in Europe. (EU Only)",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "2006 年圣诞节前后作为粉丝网站礼物在欧洲发放。（仅限欧服）",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { "created 1.13.0", ADDED_2_0_3 },
	}),
	ach(12454, {	-- Salute to Starcraft
		["timeline"] = { ADDED_7_3_5 },
	}),
	i(90953, {	-- Spectral Cub (PET!)
		["description"] = createLocalizationString({
			readable = "Reward from the Battle.net World Championship in Shanghai 2012 (China Only)",
			constant = "REWARD_FROM_THE_BATTLE_NET_WORLD_CHAMPIONSHIP",
			export = true,
			text = {
				en = "Reward from the Battle.net World Championship in Shanghai 2012 (China Only)",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "2012 年上海 Battle.net 世界锦标赛的奖励（仅限中国）",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_5_0_4 },
	}),
	i(76755, {	-- Tyrael's Charger (MOUNT!)
		-- #if BEFORE DF
		["description"] = createLocalizationString({
			readable = "Reward from the Diablo III Annual Pass promotion. Additionally, it was available on the Taiwan store.",
			constant = "REWARD_FROM_THE_DIABLO_III_ANNUAL_PASS",
			export = true,
			text = {
				en = "Reward from the Diablo III Annual Pass promotion. Additionally, it was available on the Taiwan store.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "《暗黑破坏神 III》年卡推广活动的奖励。此外，它曾在台湾商店上架。",
				-- TODO: tw = "",
			},
		}),
		-- #endif
		["timeline"] = { ADDED_4_3_0, REMOVED_4_3_2 },
	}),
	ach(414, {	-- Tyrael's Hilt
		["timeline"] = { ADDED_3_0_2 },
	}),
	i(39656, {	-- Mini Tyrael (PET!)
		["description"] = createLocalizationString({
			readable = "Reward from the 2008 Worldwide Invitational in Paris.",
			constant = "REWARD_FROM_THE_2008_WORLDWIDE_INVITATIONAL_IN",
			export = true,
			text = {
				en = "Reward from the 2008 Worldwide Invitational in Paris.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "2008 年巴黎全球邀请赛的奖励。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_2_4_2 },
	}),
	i(41133, {	-- Mr. Chilly (PET!)
		["description"] = createLocalizationString({
			readable = "This was awarded to players when they linked their original WoW account to a Battle.Net Tag. No longer available as all accounts now require Battle.Net Tag initially, unless you have access to an unattached account.",
			constant = "THIS_WAS_AWARDED_TO_PLAYERS_WHEN_THEY_LINKED",
			export = true,
			text = {
				en = "This was awarded to players when they linked their original WoW account to a Battle.Net Tag. No longer available as all accounts now require Battle.Net Tag initially, unless you have access to an unattached account.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "这是在玩家将原有魔兽世界账号与战网昵称绑定时的奖励。现已无法获得，因为所有账号现在一开始就要求绑定战网昵称，除非你能访问一个未绑定的账号。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_3_2_2 },
	}),
	ach(9496, {	-- Warlord's Deathwheel
		["timeline"] = { ADDED_6_0_2 },
		["groups"] = {
			crit(25887, {
				["provider"] = { "i", 116788 },
				["_noautomation"] = true,
			}),
			crit(27433, {
				["provider"] = { "i", 116788 },
				["_noautomation"] = true,
			}),
		},
	}),
	i(116788, {	-- Warlord's Deathwheel (MOUNT!)
		["description"] = createLocalizationString({
			readable = "Azeroth Choppers promotional mount. You had to have logged in on a Horde character between the 24th of July and the 30th of September 2014 in order for your account to receive this mount.",
			constant = "AZEROTH_CHOPPERS_PROMOTIONAL_MOUNT_YOU_HAD_TO",
			export = true,
			text = {
				en = "Azeroth Choppers promotional mount. You had to have logged in on a Horde character between the 24th of July and the 30th of September 2014 in order for your account to receive this mount.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "Azeroth Choppers 促销坐骑。你必须在 2014 年 7 月 24 日至 9 月 30 日期间用部落角色登录过，你的账号才能获得此坐骑。",
				-- TODO: tw = "",
			},
		}),
		["timeline"] = { ADDED_6_0_2 },
	}),
})));
