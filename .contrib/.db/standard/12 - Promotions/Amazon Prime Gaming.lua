-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

AMAZON_PRIME_GAMING = createHeader({
	readable = "Amazon Prime Gaming",
	icon = 136101,
	text = {
		en = "Amazon Prime Gaming",
		cn = "亚马逊 Prime Gaming",
	},
	description = {
		en = "Amazon Prime Gaming offers in-game content for World of Warcraft Retail. Depending on your country, Amazon Prime (which includes Gaming) costs between 4-16 $/€ per month with the occasional monthly free trial available.\n\nCreate a Twitch account & connect it with your Prime Account. Next connect your B.Net Account with your Twitch Account. Lastly claim your monthly reward under 'gaming.amazon.com/loot/wow'.\n\nAmazon Prime also comes with a free Twitch subscription which you can use to support AllTheThings.\n\nTwitch.tv/Crieve\nTwitch.tv/Goldenshacal",
		cn = "亚马逊 Prime Gaming 为《魔兽世界》正式服提供游戏内内容。根据你所在的国家 / 地区，包含 Prime Gaming 权益的亚马逊 Prime 会员每月费用在4–16美元 / 欧元 之间，偶尔也会提供月度免费试用。\n\n创建一个 Twitch 账号，并将其绑定你的亚马逊 Prime 账号。\n\n接下来将你的战网账号与 Twitch 账号绑定。\n\n最后前往 gaming.amazon.com/loot/wow 领取每月专属奖励。\n\n亚马逊 Prime 会员还附带免费的 Twitch 订阅资格，你可以用它来支持 AllTheThings。\n\n推荐主播：\n\nTwitch.tv/Crieve\nTwitch.tv/Goldenshacal",
	},
});

root(ROOTS.Promotions, {
	n(AMAZON_PRIME_GAMING, {
		["timeline"] = { ADDED_10_0_7, REMOVED_10_2_6 },
		["groups"] = {
			i(49282, {	-- Big Battle Bear (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from March 30th 2023 till April 27th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_MARCH_30TH_2023",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from March 30th 2023 till April 27th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 3 月 30 日至 2023 年 4 月 27 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_0_7, REMOVED_10_0_7 },
			}),
			i(54847, {	-- Lil' XT (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from April 27th 2023 till May 25th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_APRIL_27TH_2023",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from April 27th 2023 till May 25th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 4 月 27 日至 2023 年 5 月 25 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_0_7, REMOVED_10_1_0 },
			}),
			i(45037, {	-- Epic Purple Shirt
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from May 25th 2023 till June 29th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_MAY_25TH_2023",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from May 25th 2023 till June 29th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 5 月 25 日至 2023 年 6 月 29 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_0, REMOVED_10_1_0 },
			}),
			i(71718, {	-- Swift Shorestrider (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from June 29th 2023 till July 27th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_JUNE_29TH_2023",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from June 29th 2023 till July 27th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 6 月 29 日至 2023 年 7 月 27 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_0, REMOVED_10_1_5 },
			}),
			i(34519, {	-- Silver Pig (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from July 25th 2023 till August 24th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_JULY_25TH_2023",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from July 25th 2023 till August 24th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 7 月 25 日至 2023 年 8 月 24 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_5, REMOVED_10_1_5 },
			}),
			i(38312, {	-- Tabard of Brilliance
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from August 24th 2023 till September 28th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_AUGUST_24TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from August 24th 2023 till September 28th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 8 月 24 日至 2023 年 9 月 28 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_5, REMOVED_10_1_7 },
			}),
			i(49664, {	-- Zipao Tiger (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from September 26th 2023 till October 24th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_SEPTEMBER_26TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from September 26th 2023 till October 24th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 9 月 26 日至 2023 年 10 月 24 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_7, REMOVED_10_1_7 },
			}),
			i(95341, {	-- Armored Bloodwing (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from October 24th 2023 till November 28th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_OCTOBER_24TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from October 24th 2023 till November 28th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 10 月 24 日至 2023 年 11 月 28 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_1_7, REMOVED_10_2_0 },
			}),
			i(38313, {	-- Tabard of Fury
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from November 28th 2023 till December 26th 2023.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_NOVEMBER_28TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from November 28th 2023 till December 26th 2023.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 11 月 28 日至 2023 年 12 月 26 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_2_0, REMOVED_10_2_0 },
			}),
			i(92724, {	-- Swift Windsteed (MOUNT!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from December 26th 2023 till January 30th 2024.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_DECEMBER_26TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from December 26th 2023 till January 30th 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2023 年 12 月 26 日至 2024 年 1 月 30 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_2_0, REMOVED_10_2_5 },
			}),
			i(160588, {	-- Cap'n Crackers (PET!)
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from January 30th 2024 till February 27th 2024.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_JANUARY_30TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from January 30th 2024 till February 27th 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2024 年 1 月 30 日至 2024 年 2 月 27 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_2_5, REMOVED_10_2_5 },
			}),
			i(23709, {	-- Tabard of Frost 
				-- #if AFTER 10.0.2
				-- #if BEFORE 11.0.2
				["description"] = createLocalizationString({
					readable = "Amazon Prime Gaming reward from February 27th 2024 till March 26th 2024.",
					constant = "AMAZON_PRIME_GAMING_REWARD_FROM_FEBRUARY_27TH",
					export = true,
					text = {
						en = "Amazon Prime Gaming reward from February 27th 2024 till March 26th 2024.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "2024 年 2 月 27 日至 2024 年 3 月 26 日的 Amazon Prime Gaming 奖励。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_10_2_5, REMOVED_10_2_6 },
			}),
		},
	}),
});
