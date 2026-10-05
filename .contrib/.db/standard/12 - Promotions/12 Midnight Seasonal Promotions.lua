-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

MIDNIGHT_SEASONAL_PROMOTIONS = createHeader({
	readable = "Midnight Seasonal Promotions",
	icon = [[~_.asset("Expansion_MN")]],
	text = {
		en = "Midnight Seasonal Promotions",
		-- TODO: de = "",
		es = "Promociones temporada Midnight",
		mx = "Promociones temporada Midnight",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		ru = "Промо Midnight",
		cn = "至暗之夜季节性促销",
		tw = "《至暗之夜》季節性促銷",
	},
	description = {
		en = "These promotions happened during the time Midnight was the most recent expansion.\n\nThey are listed in the order of their first appearance.",
		es = "Estas promociones tuvieron lugar durante el tiempo en que Midnight era la expansión más reciente.\n\nSe enumeran en el orden en que aparecieron por primera vez.",
		mx = "Estas promociones sucedieron durante el tiempo en que Midnight era la expansión más reciente.\n\nSe listan en el orden en que aparecieron por primera vez.",
		cn = "这些促销活动均发生在《至暗之夜》作为最新资料片的时期。以下按活动首次出现的时间顺序列出。",
	},
});
RAZER = createHeader({
	readable = "Razer Giveaway",
	icon = 132529,
	text = {
		en = "Razer",
		cn = "雷蛇",
	},
	description = {
		en = "Razer x World of Warcraft Mount Giveaway. Starts on January 21 2025 at 10:00AM PST and ends on January 31, 2026 at 11:59PM PST. No purchase necessary.",
		es = "Sorteo de montura Razer x World of Warcraft. Comienza el 21 de enero de 2025 a las 10:00 a. m. PST y finaliza el 31 de enero de 2026 a las 11:59 p. m. PST. No es necesario realizar ninguna compra.",
		mx = "Sorteo de montura Razer x World of Warcraft. Comienza el 21 de enero de 2025 a las 10:00 a. m. PST y finaliza el 31 de enero de 2026 a las 11:59 p. m. PST. No es necesario comprar nada.",
		cn = "雷蛇 ×《魔兽世界》坐骑抽奖活动，活动时间：2025年1月21日太平洋时间上午10:00至2026年1月31日太平洋时间晚上11:59，无需购买即可参与。",
	},
});
FANTA = createHeader({
	readable = "Fanta Giveaway",
	icon = 4672182,
	text = {
		en = "Fanta",
		cn = "芬达",
	},
	description = {
		en = "Go to https://www.coca-cola.com/us/en/offerings/fanta/wanta-fanta/come-get-it, play a short game and get 1 reward per week. Sweepstakes starts on April 1, 2026 and ends at 11:59 pm ET on July 30, 2026 or once all rewards have been claimed, whichever occurs first. 2392 of each reward available per week. Resets at 12:00 am ET weekly. No purchase necessary.",
		es = "Visita https://www.coca-cola.com/us/en/offerings/fanta/wanta-fanta/come-get-it, juega un mini juego y consigue 1 premio por semana. El sorteo comienza el 1 de abril de 2026 y finaliza a las 23:59 (hora del este) del 30 de julio de 2026 o cuando se hayan reclamado todos los premios, lo que ocurra primero. Hay 2392 premios de cada tipo disponibles por semana. Se reinicia semanalmente a las 00:00 (ET). No es necesario realizar ninguna compra.",
		mx = "Visita https://www.coca-cola.com/us/en/offerings/fanta/wanta-fanta/come-get-it, juega un minijuego y consigue 1 premio por semana. El sorteo empieza el 1 de abril de 2026 y acaba a las 23:59 (hora del este) del 30 de julio de 2026 o cuando se hayan reclamado todos los premios, lo que ocurra primero. Hay 2392 premios de cada tipo disponibles por semana. Se reinicia semanalmente a las 00:00 (ET). No es necesario realizar ninguna compra.",
		cn = "前往 https://www.coca-cola.com/us/en/offerings/fanta/wanta-fanta/come-get-it，玩一个小游戏，每周可获得1份奖励。抽奖活动自2026年4月1日开始，至2026年7月30日美国东部时间晚上11:59结束，或直至所有奖励被领取完毕，以先到者为准。每周每种奖励提供2392份。每周在美国东部时间凌晨12:00重置。无需购买。",
	},
});

root(ROOTS.Promotions, {
	n(MIDNIGHT_SEASONAL_PROMOTIONS, {
		["timeline"] = { ADDED_12_0_0 },
		["groups"] = {
			-- "Pre Season"
			i(263301, {	-- Cuddly Green Grrgle (DECOR!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between January 20th, 10:00 a.m. & February 17th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_13",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between January 20th, 10:00 a.m. & February 17th, 10:00 a.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 1月20日 上午10:00 至 2月17日 上午10:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "removed 12.0.1.65899" },	-- Removed February 17th, 2026
			}),
			i(264241, {	-- Crimson Bow Tie (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Available to players in the UK and EU from a QR code scan of applicable Pringles cans or from the UK/EU Pringles website. \nThe battle.net code can be redeemed in any region but the website is region locked.\n\nVisit pringles.eu/0pzaiz ON A MOBILE DEVICE to sign up; players outside of EU can use a VPN to do this.\nThe promotion runs between January 20th through May 5th, 2026.",
					constant = "AVAILABLE_TO_PLAYERS_IN_THE_UK_AND_EU_FROM_A_QR",
					export = true,
					text = {
						en = "Available to players in the UK and EU from a QR code scan of applicable Pringles cans or from the UK/EU Pringles website. \nThe battle.net code can be redeemed in any region but the website is region locked.\n\nVisit pringles.eu/0pzaiz ON A MOBILE DEVICE to sign up; players outside of EU can use a VPN to do this.\nThe promotion runs between January 20th through May 5th, 2026.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "英国和欧盟的玩家可通过扫描适用的品客薯片罐上的二维码，或通过英国/欧盟品客网站获得。\nBattle.net 兑换码可在任何地区兑换，但网站有地区限制。\n\n请使用移动设备访问 pringles.eu/0pzaiz 进行注册；欧盟以外的玩家可以使用 VPN 完成。\n该促销活动时间为 2026 年 1 月 20 日至 5 月 5 日。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "removed 12.0.5.67314" },
			}),
			n(RAZER, sharedDataSelf({
				["timeline"] = { "removed 12.0.0.65655" },
			}, {
				i(190539),	-- Coral-Stalker Waveray (MOUNT!)
				i(107951),	-- Iron Skyreaver (MOUNT!)
				i(232519),	-- Razeshi B. (PET!)
			}));
			ach(62387, {	-- It's Nearly Midnight
				["description"] = createLocalizationString({
					readable = "Obtained by logging in to an account with an active subscription before the release of Midnight on March 2nd, 2026.",
					constant = "OBTAINED_BY_LOGGING_IN_TO_AN_ACCOUNT_WITH_AN",
					export = true,
					text = {
						en = "Obtained by logging in to an account with an active subscription before the release of Midnight on March 2nd, 2026.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 2026 年 3 月 2 日《午夜》上线之前，登录拥有有效订阅的账号即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "removed 12.0.1.66198" },
				["groups"] = { i(260785) },	-- The Dark Portal (DECOR!)
			}),
			i(264396, {	-- Naturally Elegant Doormat (DECOR!)
				["description"] = createLocalizationString({
					readable = "Visit |cFFFFD700zillow.com/warcraft|r\n\nFind the Doormat on the page\n\nClick on 'Claim Loot!' and authorize the Account connection.",
					constant = "VISIT_CFFFFD700ZILLOW_COM_WARCRAFT_R_FIND_THE",
					export = true,
					text = {
						en = "Visit |cFFFFD700zillow.com/warcraft|r\n\nFind the Doormat on the page\n\nClick on 'Claim Loot!' and authorize the Account connection.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "拜访 |cFFFFD700zillow.com/warcraft|r\n\n在页面上找到门垫\n\n点击“Claim Loot!”并授权账号连接。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.0.1.65899", "removed 12.1.0.99999" },	-- TODO: Timeline out. Available through September 30, 2026.
			}),
			i(264397, {	-- Simply Adorned Vase and Flowers (DECOR!)
				["description"] = createLocalizationString({
					readable = "Visit |cFFFFD700zillow.com/warcraft|r\n\nClick on 'Explore Homes'\n\nFlip between Alliance and Horde until you see 'Greener's Plant Nursery' advertisement\n\nClick on 'Free Sample' and authorize the Account connection.",
					constant = "VISIT_CFFFFD700ZILLOW_COM_WARCRAFT_R_CLICK_ON",
					export = true,
					text = {
						en = "Visit |cFFFFD700zillow.com/warcraft|r\n\nClick on 'Explore Homes'\n\nFlip between Alliance and Horde until you see 'Greener's Plant Nursery' advertisement\n\nClick on 'Free Sample' and authorize the Account connection.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "拜访 |cFFFFD700zillow.com/warcraft|r\n\n点击“Explore Homes”\n\n在联盟与部落之间来回切换，直到看到“Greener's Plant Nursery”的广告\n\n点击“Free Sample”并授权账号连接。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.0.1.65899", "removed 12.1.0.99999" },	-- TODO: Timeline out. Available through September 30, 2026.
			}),
			ach(62400, {	-- Craft Your World
				["description"] = createLocalizationString({
					readable = "Open Options\n\nGo to Gameplay -> Social\n\nCheck Connect to Pinterest\n\nSign in through the in-game browser and authorize the connection.\n\nNote: If any sort of Parental Controls have been set up on your account, this will not be visible in the Options menu unless they are fully removed via Battle Net support ticket.",
					constant = "OPEN_OPTIONS_GO_TO_GAMEPLAY_SOCIAL_CHECK",
					export = true,
					text = {
						en = "Open Options\n\nGo to Gameplay -> Social\n\nCheck Connect to Pinterest\n\nSign in through the in-game browser and authorize the connection.\n\nNote: If any sort of Parental Controls have been set up on your account, this will not be visible in the Options menu unless they are fully removed via Battle Net support ticket.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "打开选项\n\n进入游戏 -> 社交\n\n勾选连接到 Pinterest\n\n通过游戏内浏览器登录并授权连接。\n\n注意：如果你的账号设置了任何形式的家长控制，在通过战网客服工单完全移除之前，它不会显示在选项菜单中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.0.1.66017" },
				["groups"] = { i(268695) },	-- Pin-o-Matic Camera (TOY!)
			}),
			i(263298, {	-- Cuddly Alliance Blue Grrgle (DECOR!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between February 26th, 10:00 a.m. & March 24th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_14",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between February 26th, 10:00 a.m. & March 24th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 2 月 26 日上午 10:00 至 3 月 24 日上午 10:00 期间，观看已启用掉宝的 Twitch 主播至少 4 小时即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH, "removed 12.0.1.66562" },
			}),
			i(263299, {	-- Cuddly Horde Red Grrgle (DECOR!)
				["description"] = "~L.OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_14",
				["timeline"] = { ADDED_12_0_1_LAUNCH, "removed 12.0.1.66562" },
			}),
			i(252194, {	-- Fishmonger May (PET!)
				["description"] = createLocalizationString({
					readable = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between February 26th, 03:00 p.m. & March 26th, 03:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.\n\nSpecial Note: If you buy a sub for yourself and gift one more, that will also reward the pet!",
					constant = "OBTAINED_BY_GIFTING_AN_ELIGIBLE_CREATOR_S_3",
					export = true,
					text = {
						en = "Obtained by gifting an eligible creator's channel two Twitch subscriptions between February 26th, 03:00 p.m. & March 26th, 03:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.\n\nSpecial Note: If you buy a sub for yourself and gift one more, that will also reward the pet!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在太平洋夏令时 2 月 26 日下午 3:00 至 3 月 26 日凌晨 3:00 期间，向符合条件的主播频道赠送两份 Twitch 订阅即可获得。\n\n你的 Twitch 账号必须与你的 Battle.net 账号绑定，并且你必须在 Twitch 上兑换该掉宝，之后才会作为礼物出现在游戏内的收藏中。\n\n特别说明：如果你为自己购买一份订阅并额外赠送一份，同样可以获得该宠物！",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH, "removed 12.0.1.66562" },
			}),
			i(260360, {	-- Gummi the Glow Wyrm (PET!)
				["description"] = createLocalizationString({
					readable = "Trolli + Xbox promotional item. Available between March 1st 2026 - September 30th 2026 by purchasing Trolli Gummi Pop products in any retail store, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Sometime later you should receive a code to your email to redeem on Battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
					constant = "TROLLI_XBOX_PROMOTIONAL_ITEM_AVAILABLE_BETWEEN_5",
					export = true,
					text = {
						en = "Trolli + Xbox promotional item. Available between March 1st 2026 - September 30th 2026 by purchasing Trolli Gummi Pop products in any retail store, photoing your receipt and uploading it as confirmation to trolli.com/xbox. Sometime later you should receive a code to your email to redeem on Battle.net or in the launcher.\n\nYou must have a U.S. address and phone number to participate.\n\nThe code is usable in any region.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Trolli + Xbox 促销物品。活动时间为 2026 年 3 月 1 日 - 2026 年 9 月 30 日，在任意零售店购买 Trolli Gummi Pop 产品，拍下收据并上传至 trolli.com/xbox 作为凭证。过一段时间后，你的邮箱会收到一个兑换码，可在 Battle.net 或启动器中兑换。\n\n参与活动必须拥有美国地址和电话号码。\n\n该兑换码可在任何地区使用。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.0.1.66192", "removed 12.1.0.69933" },	--  Removed September 30, 2026.
				["u"] = REAL_MONEY,
			}),
			-- Season 1
			i(246917, {	-- Thunder-ridged Elekk (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Available from the pringleswow.de promotion in a limited quantity to the first 3000 players who scanned a QR code found around cities in Germany.",
					constant = "AVAILABLE_FROM_THE_PRINGLESWOW_DE_PROMOTION_IN",
					export = true,
					text = {
						en = "Available from the pringleswow.de promotion in a limited quantity to the first 3000 players who scanned a QR code found around cities in Germany.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "来自 pringleswow.de 促销活动，限量提供给前 3000 名扫描德国各城市中二维码的玩家。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH, REMOVED_12_0_1_LAUNCH },
			}),
			iensemble(229822, {	-- Arsenal: Golden Crests of the Kingdom (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Included as a code when ordering the World of Warcraft The Lich King 7-Inch Deluxe Figure (McFarlane Elite Edition #9)",
					constant = "INCLUDED_AS_A_CODE_WHEN_ORDERING_THE_WORLD_OF",
					export = true,
					text = {
						en = "Included as a code when ordering the World of Warcraft The Lich King 7-Inch Deluxe Figure (McFarlane Elite Edition #9)",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "订购《魔兽世界》巫妖王 7 英寸豪华手办（麦克法兰精英版 #9）时附带的兑换码",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH, "removed 12.0.5.67165" },
				["u"] = REAL_MONEY,
			}),
			i(265545, {	-- Cuddly Void Grrgle (DECOR!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between March 26th, 3:00 p.m. & April 23rd, 3:00 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_15",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between March 26th, 3:00 p.m. & April 23rd, 3:00 p.m. PST.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 3月26日 下午3:00 至 4月23日 下午3:00（太平洋标准时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH, "removed 12.0.5.67165" },	-- Removed April 23rd, 2026
			}),
			i(264283, {	-- Backboard and Hoop Playset (DECOR!)
				["description"] = createLocalizationString({
					readable = "Available from the Pinterest Craft Your World promotion. Enter password 'Horde Board' at craftyourworldpromo.com to receive a code to the email you provided.",
					constant = "AVAILABLE_FROM_THE_PINTEREST_CRAFT_YOUR_WORLD",
					export = true,
					text = {
						en = "Available from the Pinterest Craft Your World promotion. Enter password 'Horde Board' at craftyourworldpromo.com to receive a code to the email you provided.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "来自 Pinterest“Craft Your World”促销活动。在 craftyourworldpromo.com 输入密码“Horde Board”，即可通过你提供的邮箱收到兑换码。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH },	-- Its removal was announced for 6 April 2026 at 11:59pm (BST) but it is still active and working (last check 17/8/26)
			}),
			i(264282, {	-- Bluebird's Golden Cage (DECOR!)
				["description"] = createLocalizationString({
					readable = "Available from the Pinterest Craft Your World promotion. Enter password 'Azeroth Inspiration' at craftyourworldpromo.com to receive a code to the email you provided.",
					constant = "AVAILABLE_FROM_THE_PINTEREST_CRAFT_YOUR_WORLD_2",
					export = true,
					text = {
						en = "Available from the Pinterest Craft Your World promotion. Enter password 'Azeroth Inspiration' at craftyourworldpromo.com to receive a code to the email you provided.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "来自 Pinterest“Craft Your World”促销活动。在 craftyourworldpromo.com 输入密码“Azeroth Inspiration”，即可通过你提供的邮箱收到兑换码。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH },	-- Its removal was announced for 6 April 2026 at 11:59pm (BST) but it is still active and working (last check 17/8/26)
			}),
			i(264281, {	-- Preserved Gift of Gilneas (DECOR!)
				["description"] = createLocalizationString({
					readable = "Available from the Pinterest Craft Your World promotion. Enter password 'Kalimdor Collage' at craftyourworldpromo.com to receive a code to the email you provided.",
					constant = "AVAILABLE_FROM_THE_PINTEREST_CRAFT_YOUR_WORLD_3",
					export = true,
					text = {
						en = "Available from the Pinterest Craft Your World promotion. Enter password 'Kalimdor Collage' at craftyourworldpromo.com to receive a code to the email you provided.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "来自 Pinterest“Craft Your World”促销活动。在 craftyourworldpromo.com 输入密码“Kalimdor Collage”，即可通过你提供的邮箱收到兑换码。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_LAUNCH },	-- Its removal was announced for 6 April 2026 at 11:59pm (BST) but it is still active and working (last check 17/8/26)
			}),
			i(262660, {	-- Egg Farmer's Backpack (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Available in a limited quantity from ign.com/rewards/claim-a-code-to-get-world-of-warcraft-in-game-content, you'll receive a code to redeem on Battle.net.",
					constant = "AVAILABLE_IN_A_LIMITED_QUANTITY_FROM_IGN_COM",
					export = true,
					text = {
						en = "Available in a limited quantity from ign.com/rewards/claim-a-code-to-get-world-of-warcraft-in-game-content, you'll receive a code to redeem on Battle.net.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可从 ign.com/rewards/claim-a-code-to-get-world-of-warcraft-in-game-content 限量获取，你将收到一个可在 Battle.net 兑换的代码。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_1_SEASONSTART, REMOVED_12_0_1_SEASONSTART },
			}),
			n(FANTA, sharedDataSelf({
				["timeline"] = { "added 12.0.1.66709", "removed 12.0.7.68887" },
			}, {
				i(262438),	-- Fantastical Goblin Waveshredder (MOUNT!)
				i(264278),	-- Sturdy Portable Ice Chest (DECOR!)
				i(263383),	-- Corked Bottle of Liquid Mystery (DECOR!)
				i(264279),	-- Tall Corked Bottle of Liquid Mystery (DECOR!)
				i(264280),	-- Short Corked Bottle of Liquid Mystery (DECOR!)
			}));
			i(262881, {	-- Lil' Staropod (PET!)
				["description"] = createLocalizationString({
					readable = "Offer valid from April 13, 2026 (12pm ET) to May 15, 2026 (12pm ET). During the offer period, complete a purchase of eligible World of Warcraft items through the Blizzard Gear Store and receive a digital code.",
					constant = "OFFER_VALID_FROM_APRIL_13_2026_12PM_ET_TO_MAY",
					export = true,
					text = {
						en = "Offer valid from April 13, 2026 (12pm ET) to May 15, 2026 (12pm ET). During the offer period, complete a purchase of eligible World of Warcraft items through the Blizzard Gear Store and receive a digital code.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "优惠有效期为 2026 年 4 月 13 日（美东时间中午 12 点）至 2026 年 5 月 15 日（美东时间中午 12 点）。在优惠期间，通过暴雪周边商城购买符合资格的《魔兽世界》商品即可获得一个数字兑换码。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.0.1.66838", "removed 12.0.5.67451" },
				["u"] = REAL_MONEY,
			}),
			i(265394, {	-- Cuddly Pearl Grrgle (DECOR!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between April 23rd, 3:00 p.m. & May 21st, 3:00 p.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_16",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between April 23rd, 3:00 p.m. & May 21st, 3:00 p.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 4月23日 下午3:00 至 5月21日 下午3:00（太平洋夏令时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_5, "removed 12.0.5.67602" },
			}),
			i(272339, {	-- Umbral Champion's Illustrious Banner (TOY!)
				-- ["description"] = "",	-- TODO
				["timeline"] = { ADDED_12_0_5, REMOVED_12_0_5 },
			}),
			i(265389, {	-- Cuddly Cotton Candy Grrgle (DECOR!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between June 16th, 10:00 a.m. & July 14th, 10:00 p.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_17",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between June 16th, 10:00 a.m. & July 14th, 10:00 p.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 6月16日 上午10:00 至 7月14日 晚上10:00（太平洋夏令时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_7, "removed 12.0.7.68453" },	-- Removed July 15th
			}),
			i(273655, {	-- Sunflare Driftmoth (MOUNT!)
				["description"] = createLocalizationString({
					readable = "Obtained if you set up a 6-Month WoW Subscription since Patch 12.0.7.",
					constant = "OBTAINED_IF_YOU_SET_UP_A_6_MONTH_WOW_3",
					export = true,
					text = {
						en = "Obtained if you set up a 6-Month WoW Subscription since Patch 12.0.7.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你自 12.0.7 补丁起开通 6 个月《魔兽世界》订阅即可获得。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_7 },
				["u"] = REAL_MONEY,
			}),
			i(272339, {	-- Umbral Champion's Illustrious Banner (TOY!)
				["description"] = createLocalizationString({
					readable = "Break the Meta: Midnight Season 1\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +10|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on July 14th at 8:00 AM PDT and lasts for 1 week.\nFor more details & requirements check out: raider.io/events/break-the-meta-midnight-season-1/event-info-rules",
					constant = "BREAK_THE_META_MIDNIGHT_SEASON_1_BREAK_THE_META",
					export = true,
					text = {
						en = "Break the Meta: Midnight Season 1\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +10|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on July 14th at 8:00 AM PDT and lasts for 1 week.\nFor more details & requirements check out: raider.io/events/break-the-meta-midnight-season-1/event-info-rules",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "Break the Meta：午夜第 1 赛季\n\nBreak the Meta 聚焦于各支队伍使用非主流专精和职业尽可能冲高层钥石。\n\n完成至少 2 个符合条件的 BTM 限时钥石，等级为 |cFFFFFFFF+10 层|r 或更高，即可获得一个专属玩具在游戏内使用！\n\n活动于太平洋夏令时 7 月 14 日上午 8:00 开始，持续 1 周。\n更多详情与要求请访问：raider.io/events/break-the-meta-midnight-season-1/event-info-rules",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_0_7, "removed 12.0.7.68453" },	-- Removed July 21st
			}),
			iensemble(257974, {	-- Ensemble: Sorcerer's Grassy Garb (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 11th, 10:00 a.m. & September 8th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
					constant = "OBTAINED_THROUGH_WATCHING_TWITCH_STREAMERS_WITH_18",
					export = true,
					text = {
						en = "Obtained through watching Twitch Streamers with Drops enabled for at least 4 hours between August 11th, 10:00 a.m. & September 8th, 10:00 a.m. PDT.\n\nYour Twitch account has to be connected with your Battle.net Account & you have to redeem the drop on Twitch before receiving it in your in-game collection as gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 8月11日 上午10:00 至 9月8日 上午10:00（太平洋夏令时间）期间，观看开启了掉宝的 Twitch 主播至少 4 小时获得。\n\n你的 Twitch 账号必须与战网账号绑定，并且必须先在 Twitch 上领取掉宝，之后它才会作为礼物发放到你的游戏内收藏中。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_1_0, "removed 12.1.0.69587" },
			}),
			-- Season 2
			i(250293, {	-- Red Hot Portable Bakery (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "McDonald's UK exclusive promotion. Available from 25th August 2026 until 28th September 2026.\n\nItem is redeemable for 1500 points in the McDonald's UK app. You can get 1000 points for the registration, then 1 point per 1p spent.",
					constant = "MCDONALD_S_UK_EXCLUSIVE_PROMOTION_AVAILABLE",
					export = true,
					text = {
						en = "McDonald's UK exclusive promotion. Available from 25th August 2026 until 28th September 2026.\n\nItem is redeemable for 1500 points in the McDonald's UK app. You can get 1000 points for the registration, then 1 point per 1p spent.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "麦当劳英国独家推广活动。2026 年 8 月 25 日至 2026 年 9 月 28 日期间可获取。\n\n该物品可在麦当劳英国 App 中用 1500 积分兑换。注册可获得 1000 积分，之后每消费 1 便士获得 1 积分。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { "added 12.1.0.69465", "removed 12.1.0.99999" },	-- Removed 28th September 2026
				["u"] = REAL_MONEY,
			}),
			i(251038, {	-- Emerrrgl (PET!)
				["description"] = createLocalizationString({
					readable = "Available with the purchase of an Emrrrgl Murloc Funko Pop from the Blizzard Gear Store to a US/UK mailing address. The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "AVAILABLE_WITH_THE_PURCHASE_OF_AN_EMRRRGL",
					export = true,
					text = {
						en = "Available with the purchase of an Emrrrgl Murloc Funko Pop from the Blizzard Gear Store to a US/UK mailing address. The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在暴雪商城购买 Emrrrgl 鱼人 Funko Pop 并寄送至美国/英国邮寄地址即可获得。代码将通过电子邮件发送，可在 Battle.net 或战网客户端兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_1_0 },
				["u"] = REAL_MONEY,
			}),
			i(262840, {	-- Grassy Dunecloth Belt (COSMETIC!)
				["description"] = createLocalizationString({
					readable = "Available with the purchase of anything from the Grassy Dunecloth Transmog Collection on the Blizzard Gear Store between Sept. 28, 2026 (12pm ET) and Oct. 12, 2026 (12pm ET). The code will be emailed and can be redeemed on Battle.net or the launcher.",
					constant = "AVAILABLE_WITH_THE_PURCHASE_OF_ANYTHING_FROM",
					export = true,
					text = {
						en = "Available with the purchase of anything from the Grassy Dunecloth Transmog Collection on the Blizzard Gear Store between Sept. 28, 2026 (12pm ET) and Oct. 12, 2026 (12pm ET). The code will be emailed and can be redeemed on Battle.net or the launcher.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 2026 年 9 月 28 日（美东时间中午 12 点）至 2026 年 10 月 12 日（美东时间中午 12 点）期间，在暴雪商城购买“Grassy Dunecloth 幻化合集”中的任意商品即可获得。代码将通过电子邮件发送，并可在 Battle.net 或启动器上兑换。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_12_1_0, "removed 12.1.0.99999" },	-- Removed 12th October 2026
				["u"] = REAL_MONEY,
			}),
			i(262822, {	-- Grassy Dunecloth Skirt (COSMETIC!)
				["description"] = "~L.AVAILABLE_WITH_THE_PURCHASE_OF_ANYTHING_FROM",
				["timeline"] = { ADDED_12_1_0, "removed 12.1.0.99999" },	-- Removed 12th October 2026
				["u"] = REAL_MONEY,
			}),
			i(262859, {	-- Grassy Dunecloth Vest (COSMETIC!)
				["description"] = "~L.AVAILABLE_WITH_THE_PURCHASE_OF_ANYTHING_FROM",
				["timeline"] = { ADDED_12_1_0, "removed 12.1.0.99999" },	-- Removed 12th October 2026
				["u"] = REAL_MONEY,
			}),
			-- Season 3

		--	i(500001, {	-- The PVE/PVP Banner temporary item	-- TEMPLATE
		--		["sourceID"] = 500001,
				-- #if BEFORE 11.2.5
		--	PVE	["description"] = "Mythic Dungeon International: TWW Season 3\n\nAll registered teams that complete under time the two dungeons within the Proving Grounds will receive an exclusive Toy to use in-game!\nSign-ups close 30th September 2025 3PM PDT and The Time Trials are on 1st October 1PM PDT - 6th October (US) 3PM PDT. For more details & requirements check out: Raider.io/tournaments",
				-- #endif
		--	PVP	["description"] = "Arena World Championship: TWW Season 2\n\nSign up on Raider.io for any of the 3 Cups, available until April 11th 2025, and play in at least two game series (best of 5)\n\nWinning not required, for more details & requirements check out: Raider.io/tournaments",
		--	BtM ["description"] = "Break the Meta: TWW Season 3\n\nBreak the Meta is focused on teams pushing keys as high as they can with off-meta specs and classes.\n\nComplete at least 2 BTM-Eligible timed keystones at |cFFFFFFFFlevel +8|r or higher will receive an exclusive Toy to use in-game!.\n\nThe Event starts on Nov 18th for US, Nov 19th for EU & Nov 20th for CN/KR/TW & lasts for 1 week.\nFor more details & requirements check out: Raider.io/events/break-the-meta-the-war-within-season-3/",
		--		["timeline"] = { ADDED_11_0_2 },
		--		["icon"] = 4731630,
		--		["name"] = "Tempered Banner of the Algari (TOY!) (PVE)"
		--	}),
		},
	}),
});
