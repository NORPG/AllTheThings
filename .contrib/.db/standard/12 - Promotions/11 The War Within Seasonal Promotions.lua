-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

THE_WAR_WITHIN_SEASONAL_PROMOTIONS = createHeader({
	readable = "The War Within Seasonal Promotions",
	icon = [[~_.asset("Expansion_TWW")]],
	text = {
		en = "The War Within Seasonal Promotions",
		-- TODO: de = "",
		es = "Promociones temporada The War Within",
		mx = "Promociones temporada The War Within",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		ru = "Промо The War Within",
		cn = "地心之战季节性促销",
		tw = "《地心之戰》季節性促銷",
	},
	description = {
		en = "These promotions happened during the time The War Within was the most recent expansion.\n\nThey are listed in the order of their first appearance.",
		es = "Estas promociones ocurrieron durante el tiempo en que The War Within fue la expansión más reciente.\n\nSe enumeran en el orden de su primera aparición.",
		mx = "Estas promociones ocurrieron durante el tiempo en que The War Within fue la expansión más reciente.\n\nSe listan en el orden de su primera aparición.",
		cn = "这些促销活动均发生在《地心之战》作为最新资料片的时期。\n\n以下按活动首次出现的时间顺序列出。",
	},
});
STEELSERIES = createHeader({
	readable = "SteelSeries",
	icon = 133015,
	text = {
		en = "SteelSeries",
		-- TODO: de = "",
		es = "SteelSeries",
		mx = "SteelSeries",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "赛睿",
		-- TODO: tw = "",
	},
	description = {
		en = "Promotion for SteelSeries World of Warcraft Limited Edition Collection.",
		es = "Promoción de la colección de edición limitada SteelSeries World of Warcraft.",
		mx = "Promoción de la colección de edición limitada SteelSeries World of Warcraft.",
		cn = "赛睿《魔兽世界》限量版系列促销活动。",
	},
});
RAZER = createHeader({
	readable = "Razer",
	icon = 132529,
	text = {
		en = "Razer",
		-- TODO: de = "",
		es = "Razer",
		mx = "Razer",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "雷蛇",
		-- TODO: tw = "",
	},
	description = {
		en = "Promotion for Razer Gaming Peripherals World of Warcraft Collection. Purchasing any item will award all three promotional codes.",
		es = "Promoción de periféricos Razer Gaming de la colección World of Warcraft. Al comprar cualquier artículo, recibirás los tres códigos promocionales.",
		mx = "Promoción de periféricos Razer Gaming de la colección World of Warcraft. Al comprar cualquier artículo, recibirás los tres códigos promocionales.",
		cn = "雷蛇《魔兽世界》系列游戏外设促销：购买任意一件，即可获赠全部三个促销兑换码。",
	},
});

root(ROOTS.Promotions, {
	n(THE_WAR_WITHIN_SEASONAL_PROMOTIONS, {
		["timeline"] = { ADDED_11_0_0 },
		["groups"] = {
			n(RAZER, sharedDataSelf({
				["timeline"] = { ADDED_11_0_7, "removed 11.1.5.60568" },
				["u"] = REAL_MONEY,
			}, {
				i(190539, {	-- Coral-Stalker Waveray (MOUNT!)
					["description"] = createLocalizationString({
						readable = "Acquired alongside the purchase of a 150$ Razer Naga V2 Pro mouse, 200$ Razer BlackWidow V4 Pro keyboard or $100 RAZER FIREFLY V2 PRO mousepad as part of the Razer Gaming Peripherals World of Warcraft Collection before 30th April 2025.",
						constant = "ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_150_RAZER",
						export = true,
						text = {
							en = "Acquired alongside the purchase of a 150$ Razer Naga V2 Pro mouse, 200$ Razer BlackWidow V4 Pro keyboard or $100 RAZER FIREFLY V2 PRO mousepad as part of the Razer Gaming Peripherals World of Warcraft Collection before 30th April 2025.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在 2025 年 4 月 30 日之前，作为雷蛇游戏外设《魔兽世界》系列的一部分，购买 150 美元的雷蛇 Naga V2 Pro 鼠标、200 美元的雷蛇 BlackWidow V4 Pro 键盘或 100 美元的雷蛇 FIREFLY V2 PRO 鼠标垫时附带获得。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(107951, {	-- Iron Skyreaver (MOUNT!)
					["description"] = "~L.ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_150_RAZER",
				}),
				i(232519, {	-- Razeshi B. (PET!)
					["description"] = "~L.ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_150_RAZER",
				}),
			}));
			n(STEELSERIES, sharedDataSelf({
				["timeline"] = { ADDED_11_0_2 },
				["u"] = REAL_MONEY,
			}, {
				i(112327, {	-- Grinning Reaver (MOUNT!)
					["description"] = createLocalizationString({
						readable = "Acquired alongside the purchase of a 200$ Arctis Nova 7 Headset as part of the World of Warcraft SteelSeries Limited Edition Collection.",
						constant = "ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_200_ARCTIS",
						export = true,
						text = {
							en = "Acquired alongside the purchase of a 200$ Arctis Nova 7 Headset as part of the World of Warcraft SteelSeries Limited Edition Collection.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "作为《魔兽世界》赛睿限定版系列的一部分，购买 200 美元的 Arctis Nova 7 耳机时附带获得。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(224576, {	-- Lil' Flameo (PET!)
					-- #if BEFORE 12.0.5.67314
					["description"] = createLocalizationString({
						readable = "Acquired alongside the purchase of a 160$ Aerox 9 Mouse as part of the World of Warcraft SteelSeries Limited Edition Collection.",
						constant = "ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_160_AEROX",
						export = true,
						text = {
							en = "Acquired alongside the purchase of a 160$ Aerox 9 Mouse as part of the World of Warcraft SteelSeries Limited Edition Collection.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "作为《魔兽世界》赛睿限定版系列的一部分，购买 160 美元的 Aerox 9 鼠标时附带获得。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
				}),
				i(224574, {	-- Savage Ebony Battle Turtle (MOUNT!)
					["description"] = createLocalizationString({
						readable = "Acquired alongside the purchase of a 80$ Artistan Keycap, 40$QcK XXL Mousepad, or a 40$ Alliance/Horde Booster Pack as part of the World of Warcraft SteelSeries Limited Edition Collection.",
						constant = "ACQUIRED_ALONGSIDE_THE_PURCHASE_OF_A_80",
						export = true,
						text = {
							en = "Acquired alongside the purchase of a 80$ Artistan Keycap, 40$QcK XXL Mousepad, or a 40$ Alliance/Horde Booster Pack as part of the World of Warcraft SteelSeries Limited Edition Collection.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "作为《魔兽世界》赛睿限定版系列的一部分，购买 80 美元的 Artisan 键帽、40 美元的 QcK XXL 鼠标垫或 40 美元的联盟/部落强化包时附带获得。",
							-- TODO: tw = "",
						},
					}),
				}),
			}));
			-- "Pre Season"
			i(93671, {	-- Ghastly Charger's Skull (MOUNT!)
				-- #if AFTER 11.0.2
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 26th, 03:00 p.m. & September 19th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_3",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 26th, 03:00 p.m. & September 19th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 8月26日 下午3:00 至 9月19日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_2 },
				["u"] = REMOVED_FROM_GAME,	-- 19th September 2024
			}),
			i(190609, {	-- Watcher of the Huntress (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between August 26th, 03:00 p.m. & September 26th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.\n\nSpecial Note: If you buy a sub for yourself and gift one more, that will also reward the pet!",
					constant = "OBTAINED_BY_GIFTING_AN_ELIGIBLE_CREATOR_S_2",
					export = true,
					text = {
						en = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between August 26th, 03:00 p.m. & September 26th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.\n\nSpecial Note: If you buy a sub for yourself and gift one more, that will also reward the pet!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 8 月 26 日下午 3:00 至 9 月 26 日上午 10:00 期间，向符合条件的主播频道赠送两份 Twitch 订阅即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。\n\n特别说明：如果你为自己购买一份订阅并额外赠送一份，同样可以获得该宠物！",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_2 },
				["u"] = REMOVED_FROM_GAME,	-- 26th September 2024
			}),
			-- Season 1
			i(232305, {	-- Forged Champion's Prestigious Banner (TOY!) (PVP)
				["description"] = createLocalizationString({
					readable = "Arena World Championship: TWW Season 1\n\nSign up on Raider.io for any of the 4 Cups, available until October 13th 2024, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments/AWC",
					constant = "ARENA_WORLD_CHAMPIONSHIP_TWW_SEASON_1_SIGN_UP",
					export = true,
					text = {
						en = "Arena World Championship: TWW Season 1\n\nSign up on Raider.io for any of the 4 Cups, available until October 13th 2024, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments/AWC",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "竞技场世界锦标赛：地心之战第 1 赛季\n\n在 Raider.io 上报名参加 4 场杯赛中的任意一场，报名截止至 2024 年 10 月 13 日，并至少参加两个比赛系列（五局三胜）\n\n无需获胜，更多详情与要求请访问：Raider.io/tournaments/AWC",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5, REMOVED_11_0_5 },
			}),
			i(232301, {	-- Tempered Banner of the Algari (TOY!)
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: TWW Season 1\n\nThe Mythic Dungeon International (MDI) returns with its global competitions, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Tempered Banner of the Algari to use in-game!\nSign-ups close 14 October 2024 1PM PDT and The Time Trials are on 16 October 1PM PDT - 21 October (US) 1PM PDT.",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_TWW_SEASON_1_THE",
					export = true,
					text = {
						en = "Mythic Dungeon International: TWW Season 1\n\nThe Mythic Dungeon International (MDI) returns with its global competitions, pitting the best Mythic Dungeon teams in a head-to-head race to the finish line.\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Tempered Banner of the Algari to use in-game!\nSign-ups close 14 October 2024 1PM PDT and The Time Trials are on 16 October 1PM PDT - 21 October (US) 1PM PDT.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：地心之战第 1 赛季\n\n史诗钥石地下城国际赛（MDI）迎来全球赛事，让最顶尖的史诗钥石地下城队伍展开竞速对决，一较高下。\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得专属的“阿加人的淬炼战旗”用于游戏内！\n报名将于 2024 年 10 月 14 日太平洋夏令时下午 1 点截止，计时赛将于 10 月 16 日太平洋夏令时下午 1 点至 10 月 21 日（美服）太平洋夏令时下午 1 点举行。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5, REMOVED_11_0_5 },
			}),
			i(228765, {	-- Gummi (PET!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in any retail store, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
					constant = "TROLLI_XBOX_PROMOTIONAL_ITEM_AVAILABLE_BETWEEN",
					export = true,
					text = {
						en = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in any retail store, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Trolli + Xbox 促销物品。活动时间为 9/1/24 - 2/28/25，在任意零售店购买 Trolli 糖果产品，拍下收据并上传至 trolli.com/xbox 作为凭证。审核通过后，你的邮箱会收到一个兑换码，可在 battle.net 或启动器中兑换。\n\n参与活动必须拥有美国地址和电话号码。\n\n该兑换码可在任何地区使用。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.1.0.59466" },
				["u"] = REAL_MONEY,
			}),
			i(228761, {	-- Classic Brick Tabard (COSMETIC!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Walgreens|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
					constant = "TROLLI_XBOX_PROMOTIONAL_ITEM_AVAILABLE_BETWEEN_2",
					export = true,
					text = {
						en = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Walgreens|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Trolli + Xbox 促销物品。活动时间为 9/1/24 - 2/28/25，在 |CFFFF0000Walgreens|r 购买 Trolli 糖果产品，拍下收据并上传至 trolli.com/xbox 作为凭证。审核通过后，你的邮箱会收到一个兑换码，可在 battle.net 或启动器中兑换。\n\n参与活动必须拥有美国地址和电话号码。\n\n该兑换码可在任何地区使用。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.1.0.59466" },
				["u"] = REAL_MONEY,
			}),
			i(228763, {	-- Classic Crimson Tabard (COSMETIC!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Circle K|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
					constant = "TROLLI_XBOX_PROMOTIONAL_ITEM_AVAILABLE_BETWEEN_3",
					export = true,
					text = {
						en = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Circle K|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Trolli + Xbox 促销物品。活动时间为 9/1/24 - 2/28/25，在 |CFFFF0000Circle K|r 购买 Trolli 糖果产品，拍下收据并上传至 trolli.com/xbox 作为凭证。审核通过后，你的邮箱会收到一个兑换码，可在 battle.net 或启动器中兑换。\n\n参与活动必须拥有美国地址和电话号码。\n\n该兑换码可在任何地区使用。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.1.0.59466" },
				["u"] = REAL_MONEY,
			}),
			i(228762, {	-- Classic Lively Tabard (COSMETIC!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Dollar General|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
					constant = "TROLLI_XBOX_PROMOTIONAL_ITEM_AVAILABLE_BETWEEN_4",
					export = true,
					text = {
						en = "Trolli + Xbox promotional item. Available between 9/1/24 - 2/28/25 by purchasing Trolli Candy products in |CFFFF0000Dollar General|r, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Once processed, you should receive a code to your email to redeem on battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Trolli + Xbox 促销物品。活动时间为 9/1/24 - 2/28/25，在 |CFFFF0000Dollar General|r 购买 Trolli 糖果产品，拍下收据并上传至 trolli.com/xbox 作为凭证。审核通过后，你的邮箱会收到一个兑换码，可在 battle.net 或启动器中兑换。\n\n参与活动必须拥有美国地址和电话号码。\n\n该兑换码可在任何地区使用。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.1.0.59466" },
				["u"] = REAL_MONEY,
			}),
			i(228764, {	-- Classic Sunny Tabard (COSMETIC!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Krogers promotional item. You have to earn points before Jan 8, 2025 and redeem before Feb 7, 2025. Can be redeemed for 1500 rewards points from pointsrewardsplus.com. With a referral link, just signing up will earn you enough points to redeem the tabard for free. Access the code from the account page and then redeem on battle.net or in the launcher.",
					constant = "KROGERS_PROMOTIONAL_ITEM_YOU_HAVE_TO_EARN",
					export = true,
					text = {
						en = "Krogers promotional item. You have to earn points before Jan 8, 2025 and redeem before Feb 7, 2025. Can be redeemed for 1500 rewards points from pointsrewardsplus.com. With a referral link, just signing up will earn you enough points to redeem the tabard for free. Access the code from the account page and then redeem on battle.net or in the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Kroger 促销物品。你必须在 2025 年 1 月 8 日前赚取积分，并在 2025 年 2 月 7 日前兑换。可用 pointsrewardsplus.com 的 1500 点奖励积分兑换。如果使用推荐链接，仅注册就能获得足够积分免费兑换这件战袍。在账户页面获取兑换码，然后在 Battle.net 或启动器中兑换。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_2, "removed 11.0.7.58238" },
				["u"] = REAL_MONEY,
			}),
			i(225250, {	-- Startouched Furline (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 12-Month WoW Subscription between Patch 11.0.2 & 11.2.7.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_3",
					export = true,
					text = {
						en = "Obtained if you set up a 12-Month WoW Subscription between Patch 11.0.2 & 11.2.7.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11.0.2 至 11.2.7 补丁期间设置 12 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_2, REMOVED_11_2_7 },
				["u"] = REAL_MONEY,
			}),
			i(228751, {	-- Gigantic Grrloc (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_3",
				["timeline"] = { ADDED_11_0_2, REMOVED_11_2_7 },
				["u"] = REAL_MONEY,
			}),
			i(72153, {	-- Sand Scarab (PET!)
				-- #if AFTER 11.0.2
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between October 22nd, 10:00 a.m. & November 5th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_4",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between October 22nd, 10:00 a.m. & November 5th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 10月22日 上午10:00 至 11月5日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REMOVED_FROM_GAME,	-- 5th November 2024
			}),
			i(228907, {	-- Bot Wrangler’s Belt (COSMETIC!)
				-- #if BEFORE 11.1.0
				["description"] = createLocalizationString({
					readable = "Available to redeem for 300 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
					constant = "AVAILABLE_TO_REDEEM_FOR_300_POINTS_AT",
					export = true,
					text = {
						en = "Available to redeem for 300 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在 2025 年 1 月 31 日之前在 DoritosDewRockstar.com 使用 300 点积分兑换。积分可通过输入在特别标记的激浪、多力多滋和 Rockstar 能量饮料产品上找到的代码获得。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(228909, {	-- Bot Wrangler’s Crimson Apron (COSMETIC!)
				-- #if BEFORE 11.1.0
				["description"] = "~L.AVAILABLE_TO_REDEEM_FOR_300_POINTS_AT",
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(228908, {	-- Bot Wrangler’s Violet Apron (COSMETIC!)
				-- #if BEFORE 11.1.0
				["description"] = "~L.AVAILABLE_TO_REDEEM_FOR_300_POINTS_AT",
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(228793, {	-- Chillbot 9000 (PET!)
				-- #if BEFORE 11.1.0
				["description"] = createLocalizationString({
					readable = "Available to redeem for 400 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
					constant = "AVAILABLE_TO_REDEEM_FOR_400_POINTS_AT",
					export = true,
					text = {
						en = "Available to redeem for 400 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在 2025 年 1 月 31 日之前在 DoritosDewRockstar.com 使用 400 点积分兑换。积分可通过输入在特别标记的激浪、多力多滋和 Rockstar 能量饮料产品上找到的代码获得。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(228790, {	-- Thrillbot 9000 (PET!)
				-- #if BEFORE 11.1.0
				["description"] = "~L.AVAILABLE_TO_REDEEM_FOR_400_POINTS_AT",
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(211087, {	-- Hateforged Blazecycle (MOUNT!)
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Available to redeem for 600 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
					constant = "AVAILABLE_TO_REDEEM_FOR_600_POINTS_AT",
					export = true,
					text = {
						en = "Available to redeem for 600 points at DoritosDewRockstar.com before Jan 31, 2025. Points can be earned from entering codes found in specially marked Mountain Dew, Doritos and Rockstar Energy Drink products.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在 2025 年 1 月 31 日前在 DoritosDewRockstar.com 兑换 600 积分。积分可通过输入印有特殊标记的激浪、多力多滋和摇滚星能量饮料产品上的代码获得。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(68385, {	-- Lil' Ragnaros (PET!)
				-- #if AFTER 11.0.2
				-- #if BEFORE 12.0.0
				["description"] = "~L.AVAILABLE_TO_REDEEM_FOR_400_POINTS_AT",
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_5, "removed 11.0.7.58867" },
				["u"] = REAL_MONEY,
			}),
			i(229366, {	-- Brrrgl (PET!)
				["description"] = createLocalizationString({
					readable = "Available with the purchase of an Ice Murloc Funko Pop from the Blizzard Gear Store to a US/UK mailing address. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "AVAILABLE_WITH_THE_PURCHASE_OF_AN_ICE_MURLOC",
					export = true,
					text = {
						en = "Available with the purchase of an Ice Murloc Funko Pop from the Blizzard Gear Store to a US/UK mailing address. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买冰鱼人 Funko Pop 并寄送至美国/英国邮寄地址即可获得。代码将通过电子邮件发送，可在 Battle.net 或战网客户端兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REAL_MONEY,
			}),
			i(223459, {	-- Blackrock Warsaber (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching the official Warcraft 30th Anniversary Direct on Tiktok for 3 Minutes or Twitch/YouTube for 20 minutes between November 13th, 10:00 a.m. & December 11th, 10:00 a.m. PST.\n\nTikTok has a bar along the bottom of the screen that indicates that Game Rewards are live and that you’re earning progress. Once you watched enough on Tiktok, you will receive a code that can be claimed on Battle.Net or on the Battle.Net App.\n\nOn Twitch you have to claim your Reward under Drops & Rewards after watching for 20 minutes.\n\nOn YouTube your account has to say 'connected' and will automatically sent out the rewards after 20 minutes.\n\nYour Twitch/YouTube Account has to be connected with your Battle.net Account.",
					constant = "OBTAINED_THROUGH_WATCHING_THE_OFFICIAL_WARCRAFT",
					export = true,
					text = {
						en = "Obtained through watching the official Warcraft 30th Anniversary Direct on Tiktok for 3 Minutes or Twitch/YouTube for 20 minutes between November 13th, 10:00 a.m. & December 11th, 10:00 a.m. PST.\n\nTikTok has a bar along the bottom of the screen that indicates that Game Rewards are live and that you’re earning progress. Once you watched enough on Tiktok, you will receive a code that can be claimed on Battle.Net or on the Battle.Net App.\n\nOn Twitch you have to claim your Reward under Drops & Rewards after watching for 20 minutes.\n\nOn YouTube your account has to say 'connected' and will automatically sent out the rewards after 20 minutes.\n\nYour Twitch/YouTube Account has to be connected with your Battle.net Account.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋时间 11 月 13 日上午 10:00 至 12 月 11 日上午 10:00 期间，在 TikTok 上观看 3 分钟，或在 Twitch/YouTube 上观看 20 分钟官方《魔兽争霸》30 周年直面会即可获得。\n\nTikTok 屏幕底部有一条进度条，显示游戏奖励活动正在进行以及你正在累积进度。在 TikTok 上观看足够时长后，你会收到一个兑换码，可在 Battle.Net 或 Battle.Net 应用上兑换。\n\n在 Twitch 上，观看 20 分钟后需要在“掉宝与奖励”中领取奖励。\n\n在 YouTube 上，你的账号必须显示为“已连接”，20 分钟后奖励会自动发放。\n\n你的 Twitch/YouTube 账号必须与你的 Battle.net 账号绑定。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REMOVED_FROM_GAME,	-- 11th December 2024
			}),
			i(223471, {	-- Kaldorei War Wolf (MOUNT!)
				["description"] = "~L.OBTAINED_THROUGH_WATCHING_THE_OFFICIAL_WARCRAFT",
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REMOVED_FROM_GAME,	-- 11th December 2024
			}),
			i(229368, {	-- Gill'el (PET!)
				["description"] = createLocalizationString({
					readable = "Available with the purchase of a Murloc Thrall plushie from the Blizzard Gear Store. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "AVAILABLE_WITH_THE_PURCHASE_OF_A_MURLOC_THRALL",
					export = true,
					text = {
						en = "Available with the purchase of a Murloc Thrall plushie from the Blizzard Gear Store. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买鱼人萨尔毛绒玩具即可获得。代码将通过电子邮件发送，可在 Battle.net 或战网客户端兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REAL_MONEY,
			}),
			i(232301, {	-- Tempered Banner of the Algari (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: TWW Season 1\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 1's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-1/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +5|r or higher during the Competition Period, and the Tempered Banner of the Algari will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on December 10th for US, December 11th for EU & December 12th for KR/TW & lasts for 1 week.",
					constant = "BREAK_THE_META_TWW_SEASON_1_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: TWW Season 1\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 1's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-1/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +5|r or higher during the Competition Period, and the Tempered Banner of the Algari will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on December 10th for US, December 11th for EU & December 12th for KR/TW & lasts for 1 week.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "打破常规：地心之战第 1 赛季\n\n与其他队伍比拼用时不同，打破常规关注的是队伍使用第 1 赛季的非主流专精和职业尽可能冲击高层钥石。\n\n在 |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-1/register|r 报名参加活动，并在比赛期间完成至少 2 次 |cFFFFFFFF+5 层|r 或更高层数的符合 BTM 资格的限时钥石，活动结束后，淬炼的阿加战旗将自动加入你的游戏内收藏。\n\n该活动美服于 12 月 10 日、欧服于 12 月 11 日、韩服/台服于 12 月 12 日开始，持续 1 周。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_5 },
				["u"] = REMOVED_FROM_GAME,	-- 19th December 2024
			}),
			i(95341, {	-- Armored Bloodwing (MOUNT!)
				-- #if AFTER 11.0.2
				-- #if BEFORE 12.0.0
				["description"] = createLocalizationString({
					readable = "Requires an NVIDIA 10+ Series Graphics Card or streaming through GeForce NOW (free tier is enough).\nLogin to the NVIDIA app, GeForce Experience or GeForce NOW then play a GeForce LAN Mission for 50 continuous minutes starting January 4th at 4:30 p.m. PST lasting until an unknown date.",
					constant = "REQUIRES_AN_NVIDIA_10_SERIES_GRAPHICS_CARD_OR",
					export = true,
					text = {
						en = "Requires an NVIDIA 10+ Series Graphics Card or streaming through GeForce NOW (free tier is enough).\nLogin to the NVIDIA app, GeForce Experience or GeForce NOW then play a GeForce LAN Mission for 50 continuous minutes starting January 4th at 4:30 p.m. PST lasting until an unknown date.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要 NVIDIA 10 系列及以上显卡，或通过 GeForce NOW 串流（免费档即可）。\n登录 NVIDIA 应用、GeForce Experience 或 GeForce NOW，然后从 1 月 4 日 PST 下午 4:30 起连续游玩 50 分钟的 GeForce LAN 任务，持续到未知日期。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				-- #endif
				["timeline"] = { ADDED_11_0_7, REMOVED_11_1_5 },
			}),
			i(233207, {	-- The Coward's Azure Target (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between January 14th, 10:00 a.m. & February 4th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_5",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between January 14th, 10:00 a.m. & February 4th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 1月14日 上午10:00 至 2月4日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_7, "removed 11.0.7.58911" },
			}),
			i(238261, {	-- Tock the Clocker Spaniel (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between February 25th, 10:00 a.m. & March 25th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_6",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between February 25th, 10:00 a.m. & March 25th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 2月25日 上午10:00 至 3月25日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_0, "removed 11.1.0.59679" },
			}),
			iensemble(229822, {	-- Arsenal: Golden Crests of the Kingdom (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Included as a code in the physical goodie bag given to attendees of 30th Anniversary Live events.",
					constant = "INCLUDED_AS_A_CODE_IN_THE_PHYSICAL_GOODIE_BAG",
					export = true,
					text = {
						en = "Included as a code in the physical goodie bag given to attendees of 30th Anniversary Live events.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "作为实体礼包中的兑换码，赠予参加 30 周年线下活动的到场者。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_0_7, "removed 11.1.5.60568" },
				["u"] = REAL_MONEY,
			}),
			-- Season 2
			i(232306, {	-- Prized Champion's Prestigious Banner (TOY!) (PVP)
				["description"] = createLocalizationString({
					readable = "Arena World Championship: TWW Season 2\n\nSign up on Raider.io for any of the 3 Cups, available until April 11th 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
					constant = "ARENA_WORLD_CHAMPIONSHIP_TWW_SEASON_2_SIGN_UP",
					export = true,
					text = {
						en = "Arena World Championship: TWW Season 2\n\nSign up on Raider.io for any of the 3 Cups, available until April 11th 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "竞技场世界锦标赛：地心之战第 2 赛季\n\n在 Raider.io 上报名参加 3 场杯赛中的任意一场，报名截止至 2025 年 4 月 11 日，并至少参加两个比赛系列（五局三胜）\n\n无需获胜，更多详情与要求请访问：Raider.io/tournaments",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_5, REMOVED_11_1_5 },
			}),
			i(232302, {	-- Prized Banner of the Algari (TOY!)
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: TWW Season 2\n\nThe Mythic Dungeon International (MDI) returns with its global competitions, pitting the best Mythic Dungeon teams on pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Prized Banner of the Algari to use in-game!\nSign-ups close 14 April 2025 3PM PDT and The Time Trials are on 16 April 1PM PDT - 21 April (US) 3PM PDT. For more details & requirements check out: Raider.io/tournaments",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_TWW_SEASON_2_THE",
					export = true,
					text = {
						en = "Mythic Dungeon International: TWW Season 2\n\nThe Mythic Dungeon International (MDI) returns with its global competitions, pitting the best Mythic Dungeon teams on pushing keys as high as they can, striving to out survive their competitors and be crowned the champion!\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive the exclusive Prized Banner of the Algari to use in-game!\nSign-ups close 14 April 2025 3PM PDT and The Time Trials are on 16 April 1PM PDT - 21 April (US) 3PM PDT. For more details & requirements check out: Raider.io/tournaments",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：地心之战第 2 赛季\n\n史诗钥石地下城国际赛（MDI）迎来全球赛事，让最顶尖的史诗钥石地下城队伍尽可能高地冲击钥石层数，力求比对手存活得更久，最终加冕冠军！\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得专属的“阿加人的珍贵战旗”用于游戏内！\n报名将于 2025 年 4 月 14 日太平洋夏令时下午 3 点截止，计时赛将于 4 月 16 日太平洋夏令时下午 1 点至 4 月 21 日（美服）太平洋夏令时下午 3 点举行。更多详情与要求请查看：Raider.io/tournaments",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_5, REMOVED_11_1_5 },
			}),
			i(238796, {	-- Thrrrdgl (PET!)
				["description"] = createLocalizationString({
					readable = "Included for free with any purchase from the World of Warcraft Bronze Murloc Collection on the Blizzard Gear Store. Available until March 31, 2025 while supplies last. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "INCLUDED_FOR_FREE_WITH_ANY_PURCHASE_FROM_THE",
					export = true,
					text = {
						en = "Included for free with any purchase from the World of Warcraft Bronze Murloc Collection on the Blizzard Gear Store. Available until March 31, 2025 while supplies last. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买《魔兽世界》青铜鱼人系列任意商品即可免费获赠。活动持续至 2025 年 3 月 31 日，售完即止。兑换码将通过电子邮件发送，可在 Battle.net 或启动器上兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_0, "removed 11.1.0.60037" },	-- Removed March 31, 2025
				["u"] = REAL_MONEY,
			}),
			i(212791, {	-- Beetriz (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between April 22nd, 10:00 a.m. & May 20th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_7",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between April 22nd, 10:00 a.m. & May 20th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 4月22日 上午10:00 至 5月20日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_5, "removed 11.1.5.60822" },	-- Removed May 20, 2025
			}),
			mount(1236262, {	-- Shaohao's Sage Serpent (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Finish the Pandaren Wandering Isle starting zone in |cFFfe040fMoP Classic|r until you arrive in Orgrimmar/Stormwind to receive this mount in Retail.\n\nPromotion starts on July 1st until July 30th.",
					constant = "FINISH_THE_PANDAREN_WANDERING_ISLE_STARTING",
					export = true,
					text = {
						en = "Finish the Pandaren Wandering Isle starting zone in |cFFfe040fMoP Classic|r until you arrive in Orgrimmar/Stormwind to receive this mount in Retail.\n\nPromotion starts on July 1st until July 30th.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在|cFFfe040f《熊猫人之谜》经典版|r中完成熊猫人迷踪岛起始区域，直到抵达奥格瑞玛/暴风城，即可在正式服获得此坐骑。\n\n活动从 7 月 1 日开始，持续到 7 月 30 日。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_7, "removed 11.1.7.61967" },	-- Removed July 30th, 2025
			}),
			i(232302, {	-- Prized Banner of the Algari (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: TWW Season 2\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 2's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-2/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +10|r or higher during the Competition Period, and the Tempered Banner of the Algari will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on June 24th for US, June 25th for EU & June 26th for CN/KR/TW & lasts for 1 week.",
					constant = "BREAK_THE_META_TWW_SEASON_2_INSTEAD_OF_TEAMS",
					export = true,
					text = {
						en = "Break the Meta: TWW Season 2\n\nInstead of teams fighting to beat their opponent's time, Break the Meta is focused on teams pushing keys as high as they can with Season 2's off-meta specs and classes.\n\nRegister for the event on |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-2/register|r and complete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +10|r or higher during the Competition Period, and the Tempered Banner of the Algari will be automatically added to your collection in-game after the conclusion of the event.\n\nThe Event starts on June 24th for US, June 25th for EU & June 26th for CN/KR/TW & lasts for 1 week.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "打破常规：地心之战第 2 赛季\n\n与其他队伍比拼用时不同，打破常规关注的是队伍使用第 2 赛季的非主流专精和职业尽可能冲击高层钥石。\n\n在 |cFFFFFFFFraider.io/events/break-the-meta-the-war-within-season-2/register|r 报名参加活动，并在比赛期间完成至少 2 次 |cFFFFFFFF+10 层|r 或更高层数的符合 BTM 资格的限时钥石，活动结束后，淬炼的阿加战旗将自动加入你的游戏内收藏。\n\n该活动美服于 6 月 24 日、欧服于 6 月 25 日、国服/韩服/台服于 6 月 26 日开始，持续 1 周。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_7, "removed 11.1.7.61609" },
			}),
			i(235987, {	-- Adorned Half Shell (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between July 14th, 10:00 a.m. & August 11th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_8",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between July 14th, 10:00 a.m. & August 11th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 7月14日 上午10:00 至 8月11日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_1_7, "removed 11.2.0.62493" },	-- Removed August 11, 2025
			}),
			i(246451, {	-- Shadefur Brewthief (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 5th, 10:00 a.m. & September 16th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_9",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 5th, 10:00 a.m. & September 16th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 8月5日 上午10:00 至 9月16日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_0, "removed 11.2.0.63163" },	-- Removed September 16, 2025
			}),
			-- Season 3
			i(232307, {	-- Astral Champion's Prestigious Banner (TOY!) (PVP)
				["description"] = createLocalizationString({
					readable = "Arena World Championship: TWW Season 3\n\nSign up on Raider.io for any of the 3 Cups, available until October 22nd 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
					constant = "ARENA_WORLD_CHAMPIONSHIP_TWW_SEASON_3_SIGN_UP",
					export = true,
					text = {
						en = "Arena World Championship: TWW Season 3\n\nSign up on Raider.io for any of the 3 Cups, available until October 22nd 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "竞技场世界锦标赛：地心之战第 3 赛季\n\n在 Raider.io 上报名参加 3 场杯赛中的任意一场，报名截止至 2025 年 10 月 22 日，并至少参加两个比赛系列（五局三胜）\n\n无需获胜，更多详情与要求请访问：Raider.io/tournaments",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_0, "removed 11.2.5.64154" },	-- Removed AFTER 11.2.5 Release
			}),
			i(232303, {	-- Unbound Banner of the Algari (TOY!) (PVE)
				-- #if BEFORE 11.2.5
				["description"] = createLocalizationString({
					readable = "Mythic Dungeon International: TWW Season 3\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive an exclusive Toy to use in-game!\n\nSign-ups close 30th September 2025 3PM PDT and The Time Trials are on 1st October 1PM PDT - 6th October (US) 3PM PDT. \nFor more details & requirements check out: Raider.io/tournaments",
					constant = "MYTHIC_DUNGEON_INTERNATIONAL_TWW_SEASON_3_ALL",
					export = true,
					text = {
						en = "Mythic Dungeon International: TWW Season 3\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive an exclusive Toy to use in-game!\n\nSign-ups close 30th September 2025 3PM PDT and The Time Trials are on 1st October 1PM PDT - 6th October (US) 3PM PDT. \nFor more details & requirements check out: Raider.io/tournaments",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "史诗钥石地下城国际赛：地心之战第 3 赛季\n\n所有报名参赛并在试炼场中限时完成这两座地下城的队伍，都将获得一个专属玩具用于游戏内！\n\n报名将于 2025 年 9 月 30 日太平洋夏令时下午 3 点截止，计时赛将于 10 月 1 日太平洋夏令时下午 1 点至 10 月 6 日（美服）太平洋夏令时下午 3 点举行。\n更多详情与要求请查看：Raider.io/tournaments",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["timeline"] = { ADDED_11_2_0, REMOVED_11_2_5 },	-- Removed BEFORE 11.2.5 Release
			}),
			i(246343, {	-- Scruffyhorn Fel Snooter (PET!)
				["description"] = createLocalizationString({
					readable = "Included for free with any purchase over $75 from the World of Warcraft Collection on the Blizzard Gear Store. Available from September 8-30, 2025. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "INCLUDED_FOR_FREE_WITH_ANY_PURCHASE_OVER_75",
					export = true,
					text = {
						en = "Included for free with any purchase over $75 from the World of Warcraft Collection on the Blizzard Gear Store. Available from September 8-30, 2025. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买《魔兽世界》系列任意满 75 美元的商品即可免费获赠。活动时间为 2025 年 9 月 8 日至 30 日。兑换码将通过电子邮件发送，可在 Battle.net 或启动器上兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_0, "removed 11.2.0.63305" },	-- Removed September 30, 2025
				["u"] = REAL_MONEY,
			}),
			i(257515, {	-- Lil' Coalee (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between October 1st, 10:00 a.m. & October 29th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_10",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between October 1st, 10:00 a.m. & October 29th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 10月1日 上午10:00 至 10月29日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_0, "removed 11.2.5.64154" },	-- Removed October 29th, 2025
			}),
			i(247848, {	-- Astral Aurochs (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_2",
				["timeline"] = { ADDED_11_2_5 },
				["u"] = REAL_MONEY,
			}),
			i(243194, {	-- Grandiose Grrloc (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_2",
				["timeline"] = { ADDED_11_2_5 },
				["u"] = REAL_MONEY,
			}),
			iensemble(242480, {	-- Ensemble: Violet Sweatsuit (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 11th, 10:00 a.m. & December 2nd, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_11",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between November 11th, 10:00 a.m. & December 2nd, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 11月11日 上午10:00 至 12月2日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_5, REMOVED_11_2_7 },	-- Removed December 2nd, 2025
			}),
			i(232303, {	-- Unbound Banner of the Algari (TOY!) (PVE)
				["description"] = createLocalizationString({
					readable = "Break the Meta: TWW Season 3\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +8|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on Nov 18th for US, Nov 19th for EU & Nov 20th for CN/KR/TW & lasts for 1 week.\nFor more details & requirements check out: Raider.io/events/break-the-meta-the-war-within-season-3/",
					constant = "BREAK_THE_META_TWW_SEASON_3_BREAK_THE_META_IS",
					export = true,
					text = {
						en = "Break the Meta: TWW Season 3\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +8|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on Nov 18th for US, Nov 19th for EU & Nov 20th for CN/KR/TW & lasts for 1 week.\nFor more details & requirements check out: Raider.io/events/break-the-meta-the-war-within-season-3/",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "打破常规：地心之战第 3 赛季\n\n打破常规关注的是队伍使用非主流专精和职业尽可能冲击高层钥石。\n\n完成至少 2 次 |cFFFFFFFF+8 层|r 或更高层数的符合 BTM 资格的限时钥石，即可获得一个专属玩具在游戏内使用！\n\n该活动美服于 11 月 18 日、欧服于 11 月 19 日、国服/韩服/台服于 11 月 20 日开始，持续 1 周。\n更多详情与要求请查看：Raider.io/events/break-the-meta-the-war-within-season-3/",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_5 },
				["u"] = REMOVED_FROM_GAME,	-- 27th November 2025
			}),
			i(257518, {	-- Lil' Ashlee (PET!)
				["description"] = createLocalizationString({
					readable = "Included for free with any purchase from the World of Warcraft Lil' Ashlee Collection on the Blizzard Gear Store. Available from November 21st through December 8th, 2025. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "INCLUDED_FOR_FREE_WITH_ANY_PURCHASE_FROM_THE_2",
					export = true,
					text = {
						en = "Included for free with any purchase from the World of Warcraft Lil' Ashlee Collection on the Blizzard Gear Store. Available from November 21st through December 8th, 2025. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买《魔兽世界》小艾希莉系列任意商品即可免费获赠。活动时间为 2025 年 11 月 21 日至 12 月 8 日。兑换码将通过电子邮件发送，可在 Battle.net 或启动器上兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_5, "removed 11.2.7.64772" },	-- Removed December 8th, 2025
				["u"] = REAL_MONEY,
			}),
			i(235343, {	-- Topsy Turvy Joker's Mask (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between December 2nd, 10:00 a.m. & December 30th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_12",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between December 2nd, 10:00 a.m. & December 30th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 12月2日 上午10:00 至 12月30日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_11_2_7, "removed 11.2.7.64978" },	-- Removed December 30th, 2025
			}),
			i(248681, {	-- Scorching Valor (MOUNT!)
				["description"] = "~L.OBTAINED_IF_YOU_SET_UP_A_12_MONTH_WOW_2",
				["timeline"] = { ADDED_11_2_7 },
				["u"] = REAL_MONEY,
			}),
		--	i(500001, {	-- The PVE/PVP Banner temporary item	-- TEMPLATE
		--		["sourceID"] = 500001,
		--	PVE	["description"] = "Mythic Dungeon International: TWW Season 3\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive an exclusive Toy to use in-game!\nSign-ups close 30th September 2025 3PM PDT and The Time Trials are on 1st October 1PM PDT - 6th October (US) 3PM PDT. For more details & requirements check out: Raider.io/tournaments",
		--	PVP	["description"] = "Arena World Championship: TWW Season 2\n\nSign up on Raider.io for any of the 3 Cups, available until April 11th 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
		--	BtM ["description"] = "Break the Meta: TWW Season 3\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +8|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on Nov 18th for US, Nov 19th for EU & Nov 20th for CN/KR/TW & lasts for 1 week.\nFor more details & requirements check out: Raider.io/events/break-the-meta-the-war-within-season-3/",
		--		["timeline"] = { ADDED_11_0_2 },
		--		["icon"] = 4731630,
		--		["name"] = "Tempered Banner of the Algari (TOY!) (PVE)"
		--	}),
		},
	}),
});
