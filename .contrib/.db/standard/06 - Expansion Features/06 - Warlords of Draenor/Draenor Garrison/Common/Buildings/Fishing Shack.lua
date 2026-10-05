-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

local NATS_LUCKY_COIN = 117397;

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.WOD, {
	n(GARRISONS, sharedData({["maps"] = { LUNARFALL, FROSTWALL } },	{
		n(BUILDINGS, {
			garrisonBuilding(135, {	-- Fishing Shack (rank 1: 64, rank 2: 134, rank 3: 135)
				["requireSkill"] = FISHING,
				["groups"] = {
					n(QUESTS, {
						container(112623, {	-- Pack of Fishing Supplies
							["description"] = createLocalizationString({
								readable = "Rewarded by the current Fishing Daily Quest from the Fishing Shack.",
								constant = "REWARDED_BY_THE_CURRENT_FISHING_DAILY_QUEST",
								export = true,
								text = {
									en = "Rewarded by the current Fishing Daily Quest from the Fishing Shack.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "由渔夫小屋当前的钓鱼日常任务奖励。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								-- Only excluding 'Bag of Shiny Things' content since this container also provides those drops
								i(34834),	-- Recipe: Captain Rumsey's Lager (RECIPE!)
							},
						}),
						q(36611, {	-- A True Draenor Angler
							["sourceQuests"] = { 36870, 36612 },	-- Luring Nat (A, H)
							["qg"] = 85984,	-- Nat Pagle
							["requireSkill"] = FISHING,
						}),
						q(36517, {	-- Abyssal Gulper Eel
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
						}),
						q(35075, {	-- Abyssal Gulper Eel
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
						}),
						q(36802, {	-- Abyssal Gulper Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116818, 1 } },	-- Abyssal Gulper Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(36616, {	-- An Angler on Our Team
							["sourceQuest"] = 36611,	-- A True Draenor Angler
							["qg"] = 85984,	-- Nat Pagle
							["requireSkill"] = FISHING,
							["groups"] = { follower(202) },	-- Nat Pagle
						}),
						q(36515, {	-- Blackwater Whiptail
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(35074, {	-- Blackwater Whiptail
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(36803, {	-- Blackwater Whiptail Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116817, 1 } },	-- Blackwater Whiptail Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(36804, {	-- Blind Lake Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116820, 1 } },	-- Blind Lake Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(36514, {	-- Blind Lake Sturgeon
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(35073, {	-- Blind Lake Sturgeon
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(36513, {	-- Fat Sleeper
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(35072, {	-- Fat Sleeper
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(36805, {	-- Fat Sleeper Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116821, 1 } },	-- Fat Sleeper Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(39283, bubbleDownSelf({ ["timeline"] = { ADDED_6_2_0 } }, {	-- Felmouth Frenzy Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 127994, 1 } },	-- Felmouth Frenzy Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						})),
						q(36608, {	-- Finding Nat Pagle
							["sourceQuests"] = { 36612, 36870 },	-- Luring Nat (both faction versions)
							["qgs"] = {
								79917,	-- Rak'jin
								85708,	-- Segumi
							},
						}),
						q(36510, {	-- Fire Ammonite
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(35066, {	-- Fire Ammonite
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(36800, {	-- Fire Ammonite Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116819, 1 } },	-- Fire Ammonite Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(36511, {	-- Jawless Skulker
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 54.4, 13.9, LUNARFALL },
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(35071, {	-- Jawless Skulker
							["sourceQuest"] = 36132,	-- Anglin' In Our Garrison
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.0, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
							["isDaily"] = true,
							["groups"] = { i(112623) },	-- Pack of Fishing Supplies
						}),
						q(36806, {	-- Jawless Skulker Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 116822, 1 } },	-- Jawless Skulker Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						}),
						q(34194, {	-- Looking For Help
							["sourceQuest"] = 36592,	-- Bigger is Better
							["qg"] = 77733,	-- Ron Ashton
							["coord"] = { 53.9, 13.4, LUNARFALL },	-- lvl 2 garrison
							["requireSkill"] = FISHING,
							["races"] = ALLIANCE_ONLY,
						}),
						q(34758, {	-- Looking For Help
							["qg"] = 79892,	-- Mak'jin
							["coord"] = { 38.1, 72.2, FROSTWALL },
							["requireSkill"] = FISHING,
							["races"] = HORDE_ONLY,
						}),
						q(36870, {	-- Luring Nat
							["description"] = createLocalizationString({
								readable = "Requires upgrading your Fishing Shack to level 3 and having at least 100 Draenor Fishing skill (items/buffs included).",
								constant = "REQUIRES_UPGRADING_YOUR_FISHING_SHACK_TO_LEVEL",
								export = true,
								text = {
									en = "Requires upgrading your Fishing Shack to level 3 and having at least 100 Draenor Fishing skill (items/buffs included).",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "需要将渔夫小屋升级到 3 级，并且拥有至少 100 点德拉诺钓鱼技能（包含物品/增益）。",
									-- TODO: tw = "",
								},
							}),
							["qg"] = 85708,	-- Segumi
							["races"] = ALLIANCE_ONLY,
						}),
						q(36612, {	-- Luring Nat
							["description"] = "~L.REQUIRES_UPGRADING_YOUR_FISHING_SHACK_TO_LEVEL",
							["qg"] = 79971,	-- Rak'jin
							["races"] = HORDE_ONLY,
						}),
						q(38406, bubbleDownSelf({ ["timeline"] = { ADDED_6_1_0 } }, {	-- Sea Scorpion Lunker
							["qg"] = 85984,	-- Nat Pagle
							["coords"] = {
								{ 38.8, 73.0, FROSTWALL },
								{ 53.8, 15.2, LUNARFALL },
							},
							["cost"] = { { "i", 122696, 1 } },	-- Sea Scorpion Lunker
							["requireSkill"] = FISHING,
							["repeatable"] = true,
							["groups"] = { i(NATS_LUCKY_COIN) },
						})),
					}),
					n(RARES, {
						i(116158, {	-- Lunarfall Carp
							["races"] = ALLIANCE_ONLY,
							["groups"] = {
								n(85715, {	-- Lunarfall Cavedweller
									i(34828),	-- Antique Silver Cufflinks
									i(34826),	-- Gold Wedding Band
									i(118380, {	-- Hightfish Cap
										["collectible"] = false,
										["u"] = UNLEARNABLE,
									}),
									i(34827),	-- Noble's Monocle
									i(34829),	-- Ornate Drinking Stein
									i(23720),	-- Riding Turtle (MOUNT!)
									i(46109),	-- Sea Turtle (MOUNT!)
									i(44983),	-- Strand Crawler (PET!)
									i(118393, {	-- Tentacled Hat
										["collectible"] = false,
										["u"] = UNLEARNABLE,
									}),
									i(67410),	-- Very Unlucky Rock
								}),
							},
						}),
						i(112633, {	-- Frostdeep Minnow
							["races"] = HORDE_ONLY,
							["groups"] = {
								n(81171, {	-- Frostdeep Cavedweller
									i(34828),	-- Antique Silver Cufflinks
									i(34826),	-- Gold Wedding Band
									i(118380, {	-- Hightfish Cap
										["collectible"] = false,
										["u"] = UNLEARNABLE,
									}),
									i(34827),	-- Noble's Monocle
									i(34829),	-- Ornate Drinking Stein
									i(23720),	-- Riding Turtle (MOUNT!)
									i(46109),	-- Sea Turtle (MOUNT!)
									i(44983),	-- Strand Crawler (PET!)
									i(118393, {	-- Tentacled Hat
										["collectible"] = false,
										["u"] = UNLEARNABLE,
									}),
									i(67410),	-- Very Unlucky Rock
								}),
							},
						}),
					}),
					n(REWARDS, {
						i(NATS_LUCKY_COIN, {
							["description"] = createLocalizationString({
								readable = "Received from turning in Lunkers at Nat Paggle in your Garrison.\nLunkers can be fished anywhere in WoD, except in your Garrison, if your Fishing Shack is at Rank3.\n\nFishing in pools is more efficient than fishing in open water.",
								constant = "RECEIVED_FROM_TURNING_IN_LUNKERS_AT_NAT_PAGGLE",
								export = true,
								text = {
									en = "Received from turning in Lunkers at Nat Paggle in your Garrison.\nLunkers can be fished anywhere in WoD, except in your Garrison, if your Fishing Shack is at Rank3.\n\nFishing in pools is more efficient than fishing in open water.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在你的要塞中向纳特·帕格上交巨型淡水鱼获得。\n如果你的钓鱼小屋达到 3 级，巨型淡水鱼可以在德拉诺的任何地方钓到，除了你的要塞内。\n\n在渔点钓鱼比在开阔水域钓鱼效率更高。",
									-- TODO: tw = "",
								},
							}),
						}),
					}),
					n(VENDORS, {
						n(85984, {	-- Nat Pagle <Master Fisherman>
							i(168416),	-- Angler's Water Striders
							i(116825, {	-- Savage Fishing Pole
								["cost"] = { { "i", NATS_LUCKY_COIN, 25 } },
							}),
							i(116826, {	-- Draenic Fishing Pole
								["cost"] = { { "i", NATS_LUCKY_COIN, 25 } },
							}),
							i(117404, {	-- Land Shark (PET!)
								["cost"] = { { "i", NATS_LUCKY_COIN, 50 } },
							}),
							i(117401),	-- Nat's Draenic Fishing Journal
							i(117405, {	-- Nat's Drinking Hat
								["cost"] = { { "i", NATS_LUCKY_COIN, 25 } },
							}),
							i(86596, {	-- Nat's Fishing Chair (TOY!)
								["minReputation"] = { FACTION_NAT_PAGLE, 6 },	-- Nat Pagle, Best Friend.
							}),
							i(87791, {	-- Crimson Water Strider (MOUNT!)
								["cost"] = { { "i", NATS_LUCKY_COIN, 100 } },
							}),
							i(114919, {	-- Sea Calf (PET!)
								["cost"] = { { "i", NATS_LUCKY_COIN, 50 } },
							}),
						}),
					}),
				},
			}),
		}),
	})),
}));
