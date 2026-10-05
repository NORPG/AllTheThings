-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

DISCORD_PROMOTION = createHeader({
	readable = "Discord Promotion",
	icon = 133014,
	text = {
		en = "Discord Promotion",
		-- TODO: de = "",
		es = "Promoción de Discord",
		mx = "Promoción de Discord",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "Discord 推广",
		tw = "Discord推廣",
	},
	description = {
		en = "Discord Quest promotions.",
		cn = "Discord 任务促销活动。",
	},
});

root(ROOTS.Promotions, n(DISCORD_PROMOTION, {
	["timeline"] = { ADDED_11_0_2 },
	["groups"] = {
		i(233053, {	-- Crown of the Violet Rose (COSMETIC!)
			["description"] = createLocalizationString({
				readable = "Quest is only available with an US IP. Codes are useable worldwide.\n\nIn the bottom left of your Discord Server list, click Discover & there click on the Quests tab to start the Quest for the Reward.\n\nStream World of Warcraft in Discord to a friend for 15 minutes.\n\nOnce you're in a Direct Message, Groupchat, or Server, simply choose 'Go Live' to stream World of Warcraft for 15 minutes - you'll have a progress bar that indicates how close you are to earning your transmog.\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.' From there, it's a quick copy and paste until the Crown of the Violet Rose is yours!\n\nPromotion is available from December 2nd, 2024 until December 9th, 2024 (11:59PM UTC).",
				constant = "QUEST_IS_ONLY_AVAILABLE_WITH_AN_US_IP_CODES_ARE",
				export = true,
				text = {
					en = "Quest is only available with an US IP. Codes are useable worldwide.\n\nIn the bottom left of your Discord Server list, click Discover & there click on the Quests tab to start the Quest for the Reward.\n\nStream World of Warcraft in Discord to a friend for 15 minutes.\n\nOnce you're in a Direct Message, Groupchat, or Server, simply choose 'Go Live' to stream World of Warcraft for 15 minutes - you'll have a progress bar that indicates how close you are to earning your transmog.\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.' From there, it's a quick copy and paste until the Crown of the Violet Rose is yours!\n\nPromotion is available from December 2nd, 2024 until December 9th, 2024 (11:59PM UTC).",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "该任务仅限美国 IP 可用。兑换码可在全球使用。\n\n在你的 Discord 服务器列表左下角点击“发现”，然后点击“任务”标签即可开始任务以获取奖励。\n\n在 Discord 中向好友直播《魔兽世界》15 分钟。\n\n进入私信、群聊或服务器后，只需选择“开始直播”直播《魔兽世界》15 分钟——你会看到一个进度条，显示你距离获得幻化还有多远。\n完成任务后，你会收到一个可兑换的兑换码——前往 Battle.net 客户端，点击右上角的个人资料，然后选择“兑换码”。接下来只需复制粘贴，紫玫瑰之冠就是你的了！\n\n活动时间为 2024 年 12 月 2 日至 2024 年 12 月 9 日（UTC 23:59）。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { "added 11.0.5.57689", "removed 11.0.5.57689" },
		}),
		i(228758, {	-- Parrlok (PET!)
			-- #if BEFORE 12.0.5.67314
			["description"] = createLocalizationString({
				readable = "In the bottom left of your Discord Server list, click Discover & there click on the Quests tab to start the Quest for the Reward.\n\nStream World of Warcraft in Discord to a friend for 15 minutes.\n\nOnce you're in a Direct Message, Groupchat, or Server, simply choose 'Go Live' to stream World of Warcraft for 15 minutes - you'll have a progress bar that indicates how close you are to earning your pet.\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.' From there, it's a quick copy and paste until Parrlok Parrlok is yours!\n\nPromotion is available from August 23rd, 2024 until September 8th, 2024 (11:59PM UTC).",
				constant = "IN_THE_BOTTOM_LEFT_OF_YOUR_DISCORD_SERVER_LIST",
				export = true,
				text = {
					en = "In the bottom left of your Discord Server list, click Discover & there click on the Quests tab to start the Quest for the Reward.\n\nStream World of Warcraft in Discord to a friend for 15 minutes.\n\nOnce you're in a Direct Message, Groupchat, or Server, simply choose 'Go Live' to stream World of Warcraft for 15 minutes - you'll have a progress bar that indicates how close you are to earning your pet.\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.' From there, it's a quick copy and paste until Parrlok Parrlok is yours!\n\nPromotion is available from August 23rd, 2024 until September 8th, 2024 (11:59PM UTC).",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在你的 Discord 服务器列表左下角点击“发现”，然后点击“任务”标签页，即可开始任务以获取奖励。\n\n在 Discord 中向好友直播《魔兽世界》15 分钟。\n\n进入私信、群聊或服务器后，只需选择“开始直播”来直播《魔兽世界》15 分钟——你会看到一个进度条，显示你离获得宠物还有多远。\n完成任务后，你会获得一个兑换码——前往 Battle.net 启动器，点击右上角的个人资料，然后选择“兑换码”。接下来只需快速复制粘贴，帕洛克帕洛克就归你了！\n\n活动时间为 2024 年 8 月 23 日至 2024 年 9 月 8 日（UTC 晚上 11:59）。",
					-- TODO: tw = "",
				},
			}),
			-- #endif
			["timeline"] = { ADDED_11_0_2, "removed 11.0.2.56513" },	-- 8th September 2024
		}),
		i(250292, {	-- Piping Hot Portable Bakery (COSMETIC!)
			["description"] = createLocalizationString({
				readable = "At the top of your Direct messages tab on Discord, click the Quests tab to start the Quest for the Reward.\n\nPlay the game for 15 minutes with Discord running.\n\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.'\n\nPromotion is available from January 27th, 2026 until February 2nd, 2026 (11:59PM UTC).",
				constant = "AT_THE_TOP_OF_YOUR_DIRECT_MESSAGES_TAB_ON",
				export = true,
				text = {
					en = "At the top of your Direct messages tab on Discord, click the Quests tab to start the Quest for the Reward.\n\nPlay the game for 15 minutes with Discord running.\n\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.'\n\nPromotion is available from January 27th, 2026 until February 2nd, 2026 (11:59PM UTC).",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在 Discord 私信标签页的顶部，点击任务标签页开始获取奖励的任务。\n\n在运行 Discord 的情况下玩 15 分钟游戏。\n\n完成任务后，你会获得一个可兑换的代码——打开 Battle.net 客户端，点击右上角的个人资料，然后选择“兑换代码”。\n\n促销活动时间为 2026 年 1 月 27 日至 2026 年 2 月 2 日（UTC 晚上 11:59）。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_12_0_0, "removed 12.0.0.65655" },
		}),
		i(264366, {	-- Razeshi C. (PET!)
			["description"] = createLocalizationString({
				readable = "At the top of your Direct messages tab on Discord, click the Quests tab to start the Quest for the Reward.\n\nPlay the game for 15 minutes with Discord running.\n\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.'\n\nPromotion is available from March 2nd, 2026 until March 16th, 2026.",
				constant = "AT_THE_TOP_OF_YOUR_DIRECT_MESSAGES_TAB_ON_2",
				export = true,
				text = {
					en = "At the top of your Direct messages tab on Discord, click the Quests tab to start the Quest for the Reward.\n\nPlay the game for 15 minutes with Discord running.\n\nUpon completion of the quest, you'll be given a code to redeem - head to the Battle.net launcher, click your profile in the top right, and choose 'Redeem Code.'\n\nPromotion is available from March 2nd, 2026 until March 16th, 2026.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在 Discord 私信标签页的顶部，点击任务标签页开始获取奖励的任务。\n\n在运行 Discord 的情况下玩 15 分钟游戏。\n\n完成任务后，你会获得一个可兑换的代码——打开 Battle.net 客户端，点击右上角的个人资料，然后选择“兑换代码”。\n\n促销活动时间为 2026 年 3 月 2 日至 2026 年 3 月 16 日。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { "added 12.0.1.66198", "removed 12.0.1.66384" },
		}),
	},
}));
