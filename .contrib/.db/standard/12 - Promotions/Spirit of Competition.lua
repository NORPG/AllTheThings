-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

-- #if NOT CLASSIC_ANNIVERSARY
SPIRIT_OF_COMPETITION = createHeader({
	readable = "Spirit of Competition",
	icon = 133278,
	text = {
		-- #if AFTER MOP
		en = [[~C_PetJournal.GetPetInfoBySpeciesID(179)]],
		-- #else
		en = "Spirit of Competition",
		-- TODO: de = "",
		es = "Espíritu de competición",
		mx = "Espíritu de competición",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "竞争之魂",
		-- TODO: tw = "",
		-- #endif
	},
	description = {
		en = "This is a Battlegrounds-based event that coincides with the beginning of the Summer Olympic games. The only time this was celebrated was in 2008 to correspond to the Beijing Olympics, and although there appeared to be the intention to repeat this event, it never returned.",
		-- TODO: de = "",
		es = "Este es un evento basado en Campos de batalla que coincide con el inicio de los Juegos Olímpicos de Verano. La única vez que se celebró fue en 2008 para coincidir con los Juegos Olímpicos de Pekín, y aunque parecía haber intención de repetirlo, nunca regresó.",
		mx = "Este es un evento basado en Campos de batalla que coincide con el inicio de los Juegos Olímpicos de Verano. La única vez que se celebró fue en 2008 para coincidir con los Juegos Olímpicos de Pekín, y aunque parecía haber intención de repetirlo, nunca regresó.",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "这是一个以战场为基础的活动，与夏季奥运会的开始同时进行。唯一一次庆祝是在2008年，以配合北京奥运会，虽然似乎有意图重复这个活动，但它从未回归。",
		-- TODO: tw = "",
	},
});

root(ROOTS.Promotions, n(SPIRIT_OF_COMPETITION, bubbleDownSelf({ ["timeline"] = { ADDED_2_4_3, REMOVED_3_0_2 } }, {
	ach(1637, {	-- Spirit of Competition
		["provider"] = { "i", 37297 },	-- Spirit of Competition
	}),
	i(37297, {	-- Spirit of Competition (PET!)
		["description"] = createLocalizationString({
			readable = "Win a battleground during the Spirit of Competition event to get this.",
			constant = "WIN_A_BATTLEGROUND_DURING_THE_SPIRIT_OF",
			export = true,
			text = {
				en = "Win a battleground during the Spirit of Competition event to get this.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "在竞争之魂活动期间赢得一场战场即可获得此物品。",
				-- TODO: tw = "",
			},
		}),
	}),
	ach(1636, {	-- Competitor's Tabard
		["provider"] = { "i", 36941 },	-- Competitor's Tabard
	}),
	i(36941, {	-- Competitor's Tabard
		["description"] = createLocalizationString({
			readable = "Participate in a battleground during the Spirit of Competition event to get this.",
			constant = "PARTICIPATE_IN_A_BATTLEGROUND_DURING_THE_SPIRIT",
			export = true,
			text = {
				en = "Participate in a battleground during the Spirit of Competition event to get this.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "在竞争之魂活动期间参加一场战场即可获得。",
				-- TODO: tw = "",
			},
		}),
		["OnUpdate"] = [[function(t)
			if _.IsQuestFlaggedCompleted(12187) then
				if not _.Settings.AccountWide.Quests then
					t.u = ]] .. REMOVED_FROM_GAME .. [[;
				else
					t.u = nil;
				end
			end
		end]],
	}),
	cnONLY(i(37298, {	-- Essence of Competition (PET!) (China Only)
		["description"] = createLocalizationString({
			readable = "Only available on Chinese realms.\n\nThroughout each day of the event in China, the code is mailed to 500 random players. Only players who have achieved various in-game milestones during the event are eligible for a chance to receive the code. Some milestones include having an Arena rating of 1650+, increasing reputation for certain Outland factions from less than revered to exalted, or raising a crafting profession from 350 or less to 375.",
			constant = "ONLY_AVAILABLE_ON_CHINESE_REALMS_THROUGHOUT",
			export = true,
			text = {
				en = "Only available on Chinese realms.\n\nThroughout each day of the event in China, the code is mailed to 500 random players. Only players who have achieved various in-game milestones during the event are eligible for a chance to receive the code. Some milestones include having an Arena rating of 1650+, increasing reputation for certain Outland factions from less than revered to exalted, or raising a crafting profession from 350 or less to 375.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "仅在国服可用。\n\n在国服活动期间的每一天，兑换码都会通过邮件发送给 500 名随机玩家。只有在活动期间达成各种游戏内里程碑的玩家才有机会获得兑换码。部分里程碑包括：竞技场评分达到 1650 以上、将某些外域阵营的声望从低于崇敬提升至崇拜，或将一项制造专业的技能从 350 或以下提升到 375。",
				-- TODO: tw = "",
			},
		}),
	})),
})));
-- #endif
