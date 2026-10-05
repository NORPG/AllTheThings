-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

-- #if AFTER 2.3.0
RECRUIT_A_FRIEND = createHeader({
	readable = "Recruit A Friend",
	icon = 236688,
	text = {
		en = [[~REFER_A_FRIEND]],
	},
});

root(ROOTS.Promotions, {
	-- Retired Rewards
	n(RECRUIT_A_FRIEND, bubbleDown({ ["u"] = REMOVED_FROM_GAME }, {
		ach(1436, {	-- Friends In High Places
			["timeline"] = { ADDED_3_0_2 },
		}),
		i(37719, {	-- Swift Zhevra (MOUNT!)
			["timeline"] = { ADDED_2_4_3 },
		}),

		ach(4832, {	-- Friends In Even Higher Places
			["timeline"] = { ADDED_4_0_1 },
		}),
		i(54860, {	-- X-53 Touring Rocket (MOUNT!)
			["timeline"] = { ADDED_3_3_3 },
		}),

		ach(8213, {	-- Friends In Places Higher Yet
			["timeline"] = { ADDED_5_0_4 },
		}),
		i(83086, {	-- Heart of the Nightwing (MOUNT!)
			["timeline"] = { ADDED_5_0_4 },
		}),

		ach(8794, {	-- Friends In Places Even Higher Than That
			["timeline"] = { ADDED_5_4_2 },
		}),
		i(106246, {	-- Emerald Hippogryph (MOUNT!)
			["timeline"] = { ADDED_5_4_2 },
		}),

		ach(9925, {	-- Friends In Places Yet Even Higher Than That
			["timeline"] = { ADDED_6_0_2 },
		}),
		i(118515, {	-- Cindermane Charger (MOUNT!)
			["timeline"] = { ADDED_6_0_2 },
		}),

		-- Chinese & Taiwan Servers only until 5.4.1
		ach(3636, {	-- Jade Tiger
			["description"] = createLocalizationString({
				readable = "Chinese & Taiwan Only",
				constant = "CHINESE_TAIWAN_ONLY",
				export = true,
				text = {
					en = "Chinese & Taiwan Only",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "仅限中文与台湾地区",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { ADDED_4_0_3 },
		}),
		i(46894, {	-- Jade Tiger (PET!)
			["description"] = createLocalizationString({
				readable = "Originally only available to the Chinese & Taiwan only, they have been added to the Recruit-A-Friend Program in 5.4.1.",
				constant = "ORIGINALLY_ONLY_AVAILABLE_TO_THE_CHINESE_TAIWAN",
				export = true,
				text = {
					en = "Originally only available to the Chinese & Taiwan only, they have been added to the Recruit-A-Friend Program in 5.4.1.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "最初仅限中国大陆和台湾地区玩家获得，它们已在 5.4.1 中加入战友招募计划。",
					-- TODO: tw = "",
				},
			}),
			["timeline"] = { CREATED_3_0_2, ADDED_4_0_3 },
		}),
		i(49664, {	-- Zipao Tiger (PET!)
			["description"] = "~L.ORIGINALLY_ONLY_AVAILABLE_TO_THE_CHINESE_TAIWAN",
			["timeline"] = { CREATED_3_0_2, ADDED_4_0_3 },
		}),
		i(34518, {	-- Golden Pig (PET!)
			["description"] = "~L.ORIGINALLY_ONLY_AVAILABLE_TO_THE_CHINESE_TAIWAN",
			["timeline"] = { ADDED_2_3_0 },
		}),
		i(34519, {	-- Silver Pig (PET!)
			["description"] = "~L.ORIGINALLY_ONLY_AVAILABLE_TO_THE_CHINESE_TAIWAN",
			["timeline"] = { ADDED_2_3_0 },
		}),

		-- Desert Path
		iensemble(173300, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 } }, {	-- Ensemble: Renowned Explorer's Attire
			["description"] = createLocalizationString({
				readable = "Available to any player who has unlocked the Recruit a Friend rewards before the refresh during patch 10.0.7.",
				constant = "AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
				export = true,
				text = {
					en = "Available to any player who has unlocked the Recruit a Friend rewards before the refresh during patch 10.0.7.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "任何在 10.0.7 补丁刷新之前解锁了战友招募奖励的玩家均可获得。",
					-- TODO: tw = "",
				},
			}),
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
		})),
		i(171363, {	-- Illusion: Stinging Sands (ILLUSION!)
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
		i(173299, {	-- Explorer's Jungle Hopper (MOUNT!)
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
		i(173297, {	-- Explorer's Dunetrekker (MOUNT!)
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
		i(173298, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 } }, {	-- Explorer's Certification
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["groups"] = { title(410) },	-- Renowned Explorer <Name>
		})),
		i(171333, {	-- Renowned Explorer's Rucksack
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
		i(171361, {	-- Renowned Explorer's Tabard
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
		i(173296, {	-- Rikki (PET!)
			["description"] = "~L.AVAILABLE_TO_ANY_PLAYER_WHO_HAS_UNLOCKED_THE",
			["timeline"] = { ADDED_8_2_5, REMOVED_10_0_7 },
		}),
	})),

	-- Current Rewards
	n(RECRUIT_A_FRIEND, bubbleDown({ ["u"] = REAL_MONEY }, {
		i(173301, {	-- Game Time
			["timeline"] = { ADDED_8_2_5 },
		}),
		i(204183, {	-- Volatile Self-Driving Toolbox (PET!)
			["timeline"] = { ADDED_10_0_7 },
		}),
		ach(17426, {	-- Toolbox Trouble
			["timeline"] = { ADDED_10_0_7 },
		}),
		i(204081, {	-- Shredderizing Glove (COSMETIC!)
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["timeline"] = { ADDED_10_0_7 },
		}),
		i(204082, {	-- Sappy Buddy (COSMETIC!)
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["timeline"] = { ADDED_10_0_7 },
		}),
		i(204086, {	-- S.C.A.N.N.E.R. Mk3 (COSMETIC!)
			["b"] = 1,	-- b for binding, to overcome Hide BoE items filter
			["timeline"] = { ADDED_10_0_7 },
		}),
		i(204091, {	-- Rocket Shredder 9001 (MOUNT!)
			["timeline"] = { ADDED_10_0_7 },
		}),
	})),
});
-- #endif
