-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

local GRATEFUL_CURRENCY = currency(GRATEFUL);
local REGURGITATED_KYRIAN_WINGS = i(182749);	-- Regurgitated Kyrian Wings
local AEGIS_OF_SALVATION = i(184365);	-- Aegis of Salvation
local WINGFLAYTER_THE_CRUEL = n(167078, {	-- Wingflayer the Cruel
	["description"] = createLocalizationString({
		readable = " Only a member of the |cFF516bfeKyrian Covenant|r who has channeled anima to Temple of Courage can click the bell.",
		constant = "ONLY_A_MEMBER_OF_THE_CFF516BFEKYRIAN_COVENANT_R",
		export = true,
		text = {
			en = " Only a member of the |cFF516bfeKyrian Covenant|r who has channeled anima to Temple of Courage can click the bell.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = " 仅限已向勇气神殿输送过心能的 |cFF516bfe基瑞安盟约|r 成员点击此钟。",
			-- TODO: tw = "",
		},
	}),
	["coord"] = { 41.8, 55.4, BASTION },
	["questID"] = 60314,
	["isDaily"] = true,
	["groups"] = {
		REGURGITATED_KYRIAN_WINGS,
	},
});
local ORSTUS_AND_SOTIROS = n(156340, {	-- Larionrider Orstus
	["description"] = createLocalizationString({
		readable = "Take the anima gateway and click the Black Bell. Only a member of the |cFF516bfeKyrian Covenant|r who has channeled anima to Citadel of Loyalty can click the bell.",
		constant = "TAKE_THE_ANIMA_GATEWAY_AND_CLICK_THE_BLACK_BELL",
		export = true,
		text = {
			en = "Take the anima gateway and click the Black Bell. Only a member of the |cFF516bfeKyrian Covenant|r who has channeled anima to Citadel of Loyalty can click the bell.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "使用心能传送门并点击黑色钟。只有向忠诚堡垒输送过心能的 |cFF516bfe格里恩盟约|r 成员才能点击这口钟。",
			-- TODO: tw = "",
		},
	}),
	["crs"] = { 156339 },	-- Eliminator Sotiros
	["coord"] = { 24.5, 22.7, BASTION },
	["questID"] = 61634,
	["isDaily"] = true,
	["groups"] = {
		i(184401, {	-- Larion Pouncer (PET!)
			["description"] = createLocalizationString({
				readable = "To be eligible to receive the pet, your Anima Conductor must be upgraded to Rank 3.",
				constant = "TO_BE_ELIGIBLE_TO_RECEIVE_THE_PET_YOUR_ANIMA",
				export = true,
				text = {
					en = "To be eligible to receive the pet, your Anima Conductor must be upgraded to Rank 3.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "要获得领取该宠物的资格，你的心能导流器必须升级到 3 级。",
					-- TODO: tw = "",
				},
			}),
		}),
		AEGIS_OF_SALVATION,
	},
});

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.SL, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH }, ["customCollect"] = "SL_COV_KYR" }, {
	n(KYRIAN, {
		n(SANCTUM_UPGRADES, {
			["icon"] = 3641395,
			["groups"] = {
				n(ANIMA_CONDUCTOR, {
					["icon"] = 3854014,
					["groups"] = sharedData({ ["icon"] = 3854014 }, {
						n(REWARDS, {
							["groups"] = {
								currency(GRATEFUL, {
									["customCollect"] = IGNORED_VALUE,
									["description"] = createLocalizationString({
										readable = "Grateful Offerings can be collected once you have unlocked the Anima Conductor in for your covenant.\n Once unlocked, you can loot them from Covenant Callings (higher Conductor => more Offerings), Patterns Within Patterns Weekly Quest in Zereth Morthis and from special rares & treasures, based on the channeling of your Anima Conductor.",
										constant = "GRATEFUL_OFFERINGS_CAN_BE_COLLECTED_ONCE_YOU",
										export = true,
										text = {
											en = "Grateful Offerings can be collected once you have unlocked the Anima Conductor in for your covenant.\n Once unlocked, you can loot them from Covenant Callings (higher Conductor => more Offerings), Patterns Within Patterns Weekly Quest in Zereth Morthis and from special rares & treasures, based on the channeling of your Anima Conductor.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "一旦你在盟约中解锁了心能导体，就可以收集感激之礼。\n 解锁后，你可以从盟约召唤（导体等级越高 => 感激之礼越多）、扎雷殁提斯的“模式中的模式”周常任务，以及根据心能导体引导的特殊稀有生物和宝藏中拾取它们。",
											-- TODO: tw = "",
										},
									}),
								}),
							},
						}),
						n(TIER_ONE, {
							n(QUESTS, {
								q(57901, {	-- All That Remains
									["provider"] = { "n", 167745 },	-- Haephus
									["coord"] = { 42.6, 53.1, ARCHONS_RISE },
								}),
								q(57903, {	-- Power in the Sky
									["sourceQuests"] = { 57901 },	-- All That Remains
									["provider"] = { "n", 158773 },	-- Capheus
									["coord"] = { 37.9, 67.5, ARCHONS_RISE },
								}),
							}),
							n(RARES, {
								WINGFLAYTER_THE_CRUEL,
							}),
							n(TREASURES, {
								o(356818, {	-- Penitence of Purity
									["description"] = createLocalizationString({
										readable = "Requires channeling anima to the Temple of Purity.",
										constant = "REQUIRES_CHANNELING_ANIMA_TO_THE_TEMPLE_OF",
										export = true,
										text = {
											en = "Requires channeling anima to the Temple of Purity.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要向纯洁神殿引导心能。",
											-- TODO: tw = "",
										},
									}),
									["isDaily"] = true,
									["questID"] = 61688,
									["coord"] = { 60.2, 78.2, BASTION },
									["groups"] = {
										i(180762),	-- Phalynx of Humility (MOUNT!)
										i(184296),	-- Purity's Edge Greatblade
									},
								}),
							}),
						}),
						n(TIER_TWO, {
							n(QUESTS, {
								q(61179, {	-- Forge Ahead
									["provider"] = { "n", 158773 },	-- Capheus
									["coords"] = {
										{ 38.2, 67.8, ARCHONS_RISE },
										{ 64.2, 20.0, BASTION },
									},
								}),
							}),
							n(QUESTS, sharedData({ ["isDaily"] = true }, {
								q(61193, {	-- A Light Touch
									["provider"] = { "n", 171671 },	-- Kofi
									["coord"] = { 50.3, 21.4, BASTION },
									["groups"] = {
										i(180897),	-- Firstborne's Light (QI!)
									},
								}),
								q(61209, {	-- A Somber Melody
									["provider"] = { "n", 171677 },	-- Forgelite Selene
									["coord"] = { 50.2, 21.3, BASTION },
									["groups"] = {
										i(180990),	-- Eonian Lyre (QI!)
									},
								}),
								q(61199, {	-- Arms Day
									["provider"] = { "n", 171671 },	-- Kofi
									["coord"] = { 50.3, 21.4, BASTION },
									["groups"] = {
										i(180946),	-- Blessed Armament (QI!)
									},
								}),
								q(61146, {	-- Manifesting Power
									["provider"] = { "n", 171677 },	-- Forgelite Selene
									["coord"] = { 50.2, 21.3, BASTION },
								}),
								q(61182, {	-- Pollen Your Weight
									["provider"] = { "n", 171671 },	-- Kofi
									["coord"] = { 50.3, 21.4, BASTION },
									["groups"] = {
										i(180851),	-- Twirlpetal Pollen (QI!)
									},
								}),
								q(61166, {	-- Reduce, Reuse, Recycle
									["provider"] = { "n", 171671 },	-- Kofi
									["coord"] = { 50.3, 21.4, BASTION },
									["groups"] = {
										i(180830),	-- Resonant Alloy (QI!)
									},
								}),
								q(61159, {	-- Signs of Demise
									["provider"] = { "n", 171676 },	-- Galakamos
									["coord"] = { 50.4, 21.2, BASTION },
									["groups"] = {
										i(180816),	-- Forsworn Insignia (QI!)
									},
								}),
								q(61157, {	-- Straight to the Point
									["provider"] = { "n", 171676 },	-- Galakamos
									["coord"] = { 50.4, 21.2, BASTION },
								}),
								q(61196, {	-- The Secret Ingredient
									["provider"] = { "n", 171677 },	-- Forgelite Selene
									["coord"] = { 50.2, 21.3, BASTION },
								}),
								q(61156, {	-- Where There's a Quill...
									["provider"] = { "n", 171676 },	-- Galakamos
									["coord"] = { 50.4, 21.2, BASTION },
									["groups"] = {
										i(180796),	-- Shimmerflight Quill (QI!)
									},
								}),
							})),
							n(WORLD_QUESTS, {
								q(62280, {	-- Limbo
									["coord"] = { 64.8, 45.7, BASTION },
									["isWorldQuest"] = true,
								}),
							}),
						}),
						n(TIER_THREE, {
							n(RARES, {
								ORSTUS_AND_SOTIROS,
							}),
						}),
					}),
				}),
			},
		}),
	}),
})));

for _,t in ipairs({WINGFLAYTER_THE_CRUEL,ORSTUS_AND_SOTIROS,GRATEFUL_CURRENCY,REGURGITATED_KYRIAN_WINGS,AEGIS_OF_SALVATION}) do
	t.customCollect = nil;
end

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	n(KYRIAN,  bubbleDown({ ["customCollect"] = "SL_COV_KYR" }, {
		n(SANCTUM_UPGRADES, {
			n(ANIMA_CONDUCTOR, {
				q(61268),	-- Triggered from buff received from Kyrian Conductor Tier 3
				q(61267),	-- Triggered from buff received from Kyrian Conductor Tier 3
				q(61266),	-- Triggered from buff received from Kyrian Conductor Tier 3
			}),
		}),
	})),
})));
