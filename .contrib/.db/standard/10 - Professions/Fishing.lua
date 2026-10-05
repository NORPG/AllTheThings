root(ROOTS.Professions, prof(FISHING, bubbleDownSelf({ ["requireSkill"] = FISHING }, {
	n(ACHIEVEMENTS, {
		applyclassicphase(WRATH_PHASE_ONE, ach(1516, {	-- Accomplished Angler
			-- Meta Achievement
			["sym"] = {{"meta_achievement",
				1561,		-- 1000 Fish
				1243,		-- Fish Don't Leave Footprints
				130,		-- Grand Master Fisherman / Northrend Fisherman
				306,		-- Master Angler of Azeroth
				726,		-- Mr. Pinchy's Magical Crawdad Box
				1517,		-- Northrend Angler
				905,		-- Old Man Barlowned
				878,		-- One That Didn't Get Away
				1225,		-- Outland Angler
				2096,		-- The Coin Master
				150,		-- The Fishing Diplomat
				144,		-- The Lurker Above
				153,		-- The Old Gnome and the Sea
				1257,		-- The Scavenger
			}},
			["timeline"] = { ADDED_3_0_3 },
			["groups"] = {
				title(51),	-- Salty <Name>
			},
		})),
		ach(1556, {	-- 25 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 25,
		}),
		ach(1557, {	-- 50 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 50,
		}),
		ach(1558, {	-- 100 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 100,
		}),
		ach(1559, {	-- 250 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 250,
		}),
		ach(1560, {	-- 500 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 500,
		}),
		ach(1561, {	-- 1000 Fish
			["timeline"] = { ADDED_3_0_2 },
			["rank"] = 1000,
		}),
		ach(1243, {	-- Fish Don't Leave Footprints
			-- #if BEFORE WRATH
			["timeline"] = { ADDED_2_3_0 },
			["spellID"] = 43308,	-- Find Fish
			-- #else
			["timeline"] = { ADDED_3_0_2 },
			-- #endif
		}),
		ach(878, {	-- One That Didn't Get Away (automated)
			-- #IF ANYCLASSIC
			["providers"] = {
				{ "i", 6295 },	-- 15 Pound Mud Snapper
				{ "i", 13913 },	-- 22 Pound Lobster
				{ "i", 13905 },	-- 29 Pound Salmon
				{ "i", 6364 },	-- 32 Pound Catfish
				{ "i", 13887 },	-- 52 Pound Redgill
				{ "i", 13880 },	-- 68 Pound Grouper
				{ "i", 13917 },	-- 103 Pound Mightfish
				-- #if AFTER WRATH
				{ "i", 44703 },	-- Dark Herring
				-- #endif
				{ "i", 19808 },	-- Rockhide Strongfish
				{ "i", 6360 },	-- Steelscale Crushfish
			},
			-- #ENDIF
			["timeline"] = { ADDED_3_0_2 },	-- NOTE: Players didn't actually get credit for this... Sigh.
		}),
		ach(5478, {	-- The Limnologist
			-- ["sym"] = {{ "achievement_criteria" }},
			["timeline"] = { ADDED_4_0_3_LAUNCH },
		}),
		ach(5479, {	-- The Oceanographer
			-- ["sym"] = {{ "achievement_criteria" }},
			["timeline"] = { ADDED_4_0_3_LAUNCH },
		}),
		ach(153, {	-- The Old Gnome and the Sea
			["timeline"] = { ADDED_3_0_2 },
			["_noautomation"] = true,
		}),
		ach(1257, bubbleDownSelf({ ["timeline"] = { ADDED_3_0_2 }, }, {	-- The Scavenger
			crit(3873, {	-- Bloodsail Wreckage
				["provider"] = { "o", 180901 },	-- Bloodsail Wreckage
				["maps"] = {
					-- #if AFTER CATA
					THE_CAPE_OF_STRANGLETHORN,
					NORTHERN_STRANGLETHORN,
					-- #else
					STRANGLETHORN_VALE,
					-- #endif
				},
			}),
			crit(3876, {	-- Floating Wreckage
				["provider"] = { "o", 180751 },	-- Floating Wreckage
				["maps"] = {
					-- #if AFTER CATA
					BLASTED_LANDS,
					EASTERN_PLAGUELANDS,
					SWAMP_OF_SORROWS,
					TANARIS,
					THOUSAND_NEEDLES,
					-- #else
					AZSHARA,
					FERALAS,
					TANARIS,
					-- #endif
				},
			}),
			crit(3874, {	-- Schooner Wreckage
				["provider"] = { "o", 180662 },	-- Schooner Wreckage
				["maps"] = {
					-- #if AFTER CATA
					ARATHI_HIGHLANDS,
					ASHENVALE,
					-- #endif
					HILLSBRAD_FOOTHILLS,
					STONETALON_MOUNTAINS,
					WETLANDS,
				},
			}),
			crit(3872, {	-- Steam Pump Flotsam
				["provider"] = { "o", 182952 },	-- Steam Pump Flotsam
				["maps"] = { ZANGARMARSH },
			}),
			crit(3875, {	-- Waterlogged Wreckage
				["provider"] = { "o", 180685 },	-- Waterlogged Wreckage
				["maps"] = {
					-- #if AFTER CATA
					DESOLACE,
					DUSTWALLOW_MARSH,
					FERALAS,
					WESTERN_PLAGUELANDS,
					-- #else
					ALTERAC_MOUNTAINS,
					ARATHI_HIGHLANDS,
					DESOLACE,
					DUSTWALLOW_MARSH,
					STRANGLETHORN_VALE,
					-- #endif
				},
			}),
		})),
		applyclassicphase(WRATH_PHASE_ONE, ach(3218, {	-- Turtles All the Way Down
			["provider"] = { "i", 46109 },	-- Sea Turtle
			["timeline"] = { ADDED_3_0_3 },
		})),
	}),
	expansion(EXPANSION.CLASSIC, {
		ach(126, {	-- Journeyman Fisherman
			-- #if NOT ANYCLASSIC
			["timeline"] = { ADDED_3_0_2 },
			-- #endif
		}),
		ach(127, {	-- Expert Fisherman
			-- #if NOT ANYCLASSIC
			["timeline"] = { ADDED_3_0_2 },
			-- #endif
		}),
		ach(128, {	-- Artisan Fisherman
			-- #if NOT ANYCLASSIC
			["timeline"] = { ADDED_3_0_2 },
			-- #endif
		}),
		ach(150, {	-- The Fishing Diplomat
			["timeline"] = { ADDED_3_0_2 },
			["maps"] = { ORGRIMMAR, STORMWIND_CITY },
		}),
	}),
	applyclassicphase(TBC_PHASE_ONE, expansion(EXPANSION.TBC, {
		["timeline"] = {
			-- #if NOT ANYCLASSIC
			ADDED_3_0_2,
			-- #else
			ADDED_2_0_5,
			-- #endif
		},
		["groups"] = {
			ach(129),	-- Master Fisherman / Outland Fisherman
			ach(1225, {	-- Outland Angler
				["maps"] = { NAGRAND, TEROKKAR_FOREST, ZANGARMARSH },
				["timeline"] = { ADDED_3_0_2 },
			}),
		},
	})),
	expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, bubbleDownSelf({ ["timeline"] = { ADDED_3_0_3 } }, {
		ach(130),	-- Grand Master Fisherman
		ach(1517, {	-- Northrend Angler
			["maps"] = { BOREAN_TUNDRA, DRAGONBLIGHT, HOWLING_FJORD, GRIZZLY_HILLS, CRYSTALSONG_FOREST, SHOLAZAR_BASIN },
		}),
	}))),
	expansion(EXPANSION.CATA, bubbleDownSelf({ ["timeline"] = { ADDED_4_0_3_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(4917),	-- Cataclysmic Fisherman
			ach(5851, {	-- Gone Fishin' (A)
				["timeline"] = { ADDED_4_2_0 },
				-- #if BEFORE 5.0.4
				["races"] = ALLIANCE_ONLY,
				-- #endif
				["sym"] = {{"meta_achievement",
					5848,	-- Fish or Cut Bait: Darnassus
					5847,	-- Fish or Cut Bait: Ironforge
					5476,	-- Fish or Cut Bait: Stormwind
					-- #if AFTER 5.0.4
					5477,	-- Fish or Cut Bait: Orgrimmar
					5850,	-- Fish or Cut Bait: Undercity
					5849,	-- Fish or Cut Bait: Thunder Bluff
					-- #endif
				}},
			}),
			-- #if BEFORE 5.0.4
			ach(5852, {	-- Gone Fishin' (H)
				["timeline"] = { ADDED_4_2_0, REMOVED_5_0_4 },
				["races"] = HORDE_ONLY,
				["sym"] = {{"meta_achievement",
					5850,	-- Fish or Cut Bait: Undercity
					5849,	-- Fish or Cut Bait: Thunder Bluff
					5477,	-- Fish or Cut Bait: Orgrimmar
				}},
			}),
			-- #endif
		}),
		container(67414, {	-- Bag of Shiny Things
			["description"] = "~L.FISHING_DAILY_QUEST_REWARD",
			["timeline"] = { ADDED_4_0_1 },
			["provider"] = { "i", 112623 },	-- Pack of Fishing Supplies
			["groups"] = {
				i(44983),	-- Strand Crawler (PET!)
				i(33820),	-- Weather-Beaten Fishing Hat
				i(45991),	-- Bone Fishing Pole
				i(45992),	-- Jeweled Fishing Pole
				i(67410),	-- Very Unlucky Rock
				i(67388),	-- String of Alligator Teeth
			},
		}),
	})),
	expansion(EXPANSION.MOP, bubbleDownSelf({ ["timeline"] = { ADDED_5_0_4 } }, {
		n(ACHIEVEMENTS, {
			ach(6839),	-- Zen Master Fisherman
			ach(7611, {	-- Pandarian Angler
				["sym"] = {{ "achievement_criteria" }},
			}),
		}),
		n(QUESTS, {
			applyclassicphase(MOP_PHASE_ESCALATION, i(97981, {	-- Impeccably Sharp Tooth (QI!)
				["timeline"] = { ADDED_5_3_0, REMOVED_7_0_3_LAUNCH },
				-- Wouter NOTE: in MoP Classic, this started dropping in Phase 2 (Landfall) already
				-- #if BEFORE 5.5.3
				["description"] = "~L.THIS_IS_NOT_SUPPOSED_TO_BE_IN_THE_GAME_UNTIL",
				-- #elseif BEFORE LEGION
				["description"] = createLocalizationString({
					readable = "Drops from fishing pools in Pandaria.",
					constant = "DROPS_FROM_FISHING_POOLS_IN_PANDARIA",
					export = true,
					text = {
						en = "Drops from fishing pools in Pandaria.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "由潘达利亚的鱼群掉落。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
			})),
		}),
	})),
	expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_3_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(9503),	-- Draenor Fisherman
			ach(9462),	-- Draenor Angler
			ach(9456),	-- Abyssal Gulper Eel Angler
			ach(9457),	-- Blackwater Whiptail Angler
			ach(9458),	-- Blind Lake Sturgeon Angler
			ach(9547, {	-- Everything Is Awesome!
				["cost"] = {{"i", 118414, 20}},	-- 20x Awesomefish
			}),
			ach(9459),	-- Fat Sleeper Angler
			ach(9455),	-- Fire Ammonite Angler
			ach(9460),	-- Jawless Skulker Angler
			ach(9461),	-- Sea Scorpion Angler
		}),
	})),
	expansion(EXPANSION.LEGION, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(10594),	-- Legion Fisherman
			ach(10595, {	-- A Cast Above the Rest
				["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
			}),
			ach(10596, {	-- Bigger Fish to Fry
				["_noautomation"] = true,
				["groups"] = {
					crit(29912, {	-- Ancient Black Barracuda
						["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
						["provider"] = { "i", 133742 },
					}),
					crit(29909, {	-- Ancient Highmountain Salmon
						["maps"] = { HIGHMOUNTAIN },
						["provider"] = { "i", 133733 },
					}),
					crit(29921, {	-- Ancient Mossgill
						["maps"] = { VALSHARAH },
						["provider"] = { "i", 133730 },
					}),
					crit(29910, {	-- Axefish
						["maps"] = { AZSUNA },
						["provider"] = { "i", 133740 },
					}),
					crit(29908, {	-- Coldriver Carp
						["maps"] = { HIGHMOUNTAIN },
						["provider"] = { "i", 133732 },
					}),
					crit(29905, {	-- Ghostly Queenfish
						["maps"] = { AZSUNA },
						["provider"] = { "i", 133727 },
					}),
					crit(29914, {	-- Graybelly Lobster
						["maps"] = { STORMHEIM },
						["provider"] = { "i", 133735 },
					}),
					crit(29903, {	-- Leyshimmer Blenny
						["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
						["provider"] = { "i", 133725 },
					}),
					crit(29916, {	-- Magic-Eater Frog
						["maps"] = { SURAMAR },
						["provider"] = { "i", 133737 },
					}),
					crit(29907, {	-- Mountain Puffer
						["maps"] = { HIGHMOUNTAIN },
						["provider"] = { "i", 133731 },
					}),
					crit(29904, {	-- Nar'thalas Hermit
						["maps"] = { AZSUNA },
						["provider"] = { "i", 133726 },
					}),
					crit(29913, {	-- Oodelfjisk
						["maps"] = { STORMHEIM },
						["provider"] = { "i", 133734 },
					}),
					crit(29911, {	-- Seabottom Squid
						["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
						["provider"] = { "i", 133741 },
					}),
					crit(29918, {	-- Tainted Runescale Koi
						["maps"] = { SURAMAR },
						["provider"] = { "i", 133739 },
					}),
					crit(29915, {	-- Thundering Stormray
						["maps"] = { STORMHEIM },
						["provider"] = { "i", 133736 },
					}),
					crit(29917, {	-- Seerspine Puffer
						["maps"] = { SURAMAR },
						["provider"] = { "i", 133738 },
					}),
					crit(29919, {	-- Terrorfin
						["maps"] = { VALSHARAH },
						["provider"] = { "i", 133728 },
					}),
					crit(29920, {	-- Thorned Flounder
						["maps"] = { VALSHARAH },
						["provider"] = { "i", 133729 },
					}),
				},
			}),
			ach(11725, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_0 } }, {	-- Fisherfriend of the Isles
				["description"] = createLocalizationString({
					readable = "The Fishing Masters are on a daily rotation, so only one is up at a time. The order is:\n\n1. Sha'leth\n2. Impus\n3. Ilyssia of the Waters\n4. Keeper Raynae\n5. Akule Riverhorn\n6. Corbyn\n\nMake sure you're close enough to the Fishing Master to get the |cFFFFD700Something's Fishy|r buff, or you won't be able to fish up the items (the buff may not show up until you dismount).\n\nThe quickest way to reach Best Friend is to fish in a group.\n",
					constant = "THE_FISHING_MASTERS_ARE_ON_A_DAILY_ROTATION_SO",
					export = true,
					text = {
						en = "The Fishing Masters are on a daily rotation, so only one is up at a time. The order is:\n\n1. Sha'leth\n2. Impus\n3. Ilyssia of the Waters\n4. Keeper Raynae\n5. Akule Riverhorn\n6. Corbyn\n\nMake sure you're close enough to the Fishing Master to get the |cFFFFD700Something's Fishy|r buff, or you won't be able to fish up the items (the buff may not show up until you dismount).\n\nThe quickest way to reach Best Friend is to fish in a group.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "钓鱼大师们按每日轮换，因此同一时间只有一位在场。顺序为：\n\n1. 沙蕾丝\n2. 因普斯\n3. 水之伊莉西娅\n4. 守护者蕾娜伊\n5. 阿库勒·里弗霍恩\n6. 科尔宾\n\n确保你离钓鱼大师足够近以获得|cFFFFD700有鱼腥味|r增益，否则你无法钓起物品（该增益可能要在你下坐骑后才会显示）。\n\n达到挚友最快的方式是组队钓鱼。\n",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(152583),	-- Underlight Emerald (CI!)
					crit(36343, {	-- Ilyssia of the Waters
						["_npcs"] = { 120266 },
					}),
					crit(36344, {	-- Corbyn
						["_npcs"] = { 120458 },
					}),
					crit(36345, {	-- Akule Riverhorn
						["_npcs"] = { 120457 },
					}),
					crit(36346, {	-- Impus
						["_npcs"] = { 120460 },
					}),
					crit(36347, {	-- Sha'leth
						["_npcs"] = { 120459 },
					}),
					crit(36348, {	-- Keeper Raynae
						["_npcs"] = { 120456 },
					}),
				},
			})),
			ach(10598),	-- Fishing 'Round the Isles (automated)
			ach(10597),	-- Legion Aquaculture
		}),
		filter(MISC, {
			i(133715, {	-- Ancient Vrykul Ring
				["description"] = createLocalizationString({
					readable = "This item will give you a buff that will allow you to see and fish from Oodelfjisk schools.",
					constant = "THIS_ITEM_WILL_GIVE_YOU_A_BUFF_THAT_WILL_ALLOW",
					export = true,
					text = {
						en = "This item will give you a buff that will allow you to see and fish from Oodelfjisk schools.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会给你一个增益，让你能看到并垂钓乌德尔菲斯克鱼群。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { STORMHEIM },
				["groups"] = {
					i(133734),	-- Oodelfjisk
					i(139661),	-- Oodelfjisk [AP]
				},
			}),
			i(133724, {	-- Decayed Whale Blubber
				["description"] = createLocalizationString({
					readable = "Using the item will place a whale blob in front of you, as the item describes. Cast your line, and shortly after a silithid wasp will fly down and hover over the whale blubber. Click on the fly to add Ravenous Fly to your inventory.",
					constant = "USING_THE_ITEM_WILL_PLACE_A_WHALE_BLOB_IN_FRONT",
					export = true,
					text = {
						en = "Using the item will place a whale blob in front of you, as the item describes. Cast your line, and shortly after a silithid wasp will fly down and hover over the whale blubber. Click on the fly to add Ravenous Fly to your inventory.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用该物品会按物品描述所说，在你面前放置一堆鲸鱼血肉。抛出你的鱼线，不久后一只异种虫黄蜂会飞下来，悬停在鲸脂上方。点击这只飞虫即可将贪婪的苍蝇加入你的背包。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
				["groups"] = {
					i(133795, {	-- Ravenous Fly
						["description"] = createLocalizationString({
							readable = "You must be in |cffffffffThe Great Sea|r when you use this item to catch the respective rare fish.",
							constant = "YOU_MUST_BE_IN_CFFFFFFFFTHE_GREAT_SEA_R_WHEN",
							export = true,
							text = {
								en = "You must be in |cffffffffThe Great Sea|r when you use this item to catch the respective rare fish.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你使用此物品捕捉相应的稀有鱼类时，你必须身处 |cffffffff无尽之海|r 中。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(133742),	-- Ancient Black Barracuda
							i(139669),	-- Ancient Black Barracuda [AP]
						},
					}),
				}
			}),
			i(133720, {	-- Demonic Detritus
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Tainted Runescale Koi in Suramar.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Tainted Runescale Koi in Suramar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在苏拉玛钓到稀有鱼被污染的符鳞锦鲤。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { SURAMAR },
				["groups"] = {
					i(133739),	-- Tainted Runescale Koi
					i(139666),	-- Tainted Runescale Koi [AP]
				},
			}),
			i(133708, {	-- Drowned Thistleleaf
				["description"] = createLocalizationString({
					readable = "This item will summon a Drowned Thistleleaf, which grants the buff Blessing of the Thistleleaf, increasing your chance to fish up Thorned Flounder.",
					constant = "THIS_ITEM_WILL_SUMMON_A_DROWNED_THISTLELEAF",
					export = true,
					text = {
						en = "This item will summon a Drowned Thistleleaf, which grants the buff Blessing of the Thistleleaf, increasing your chance to fish up Thorned Flounder.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会召唤一个溺亡蓟叶，它会给予蓟叶的祝福增益，提高你钓到荆棘比目鱼的几率。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { VALSHARAH },
				["groups"] = {
					i(133729),	-- Thorned Flounder
					i(139656),	-- Thorned Flounder [AP]
				},
			}),
			i(133717, {	-- Enchanted Lure
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Magic-Eater Frog in Suramar.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_2",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Magic-Eater Frog in Suramar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在苏拉玛钓到稀有鱼食魔蛙。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { SURAMAR },
				["groups"] = {
					i(133737),	-- Magic-Eater Frog
					i(139664),	-- Magic-Eater Frog [AP]
				},
			}),
			i(133712, {	-- Frost Worm
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Coldriver Carp in Highmountain.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_3",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Coldriver Carp in Highmountain.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在至高岭钓到稀有鱼冷河鲤鱼。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { HIGHMOUNTAIN },
				["groups"] = {
					i(133732),	-- Coldriver Carp
					i(139659),	-- Coldriver Carp [AP]
				},
			}),
			i(133709, {	-- Funky Sea Snail
				["description"] = createLocalizationString({
					readable = "When the short buff expires, this item will disappear from your inventory and a Bitestone Fishbrul will spawn. Kill it for the lure.",
					constant = "WHEN_THE_SHORT_BUFF_EXPIRES_THIS_ITEM_WILL",
					export = true,
					text = {
						en = "When the short buff expires, this item will disappear from your inventory and a Bitestone Fishbrul will spawn. Kill it for the lure.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当短时增益结束后，此物品会从你的背包中消失，并刷新一只咬石鱼人。击杀它可以获得诱饵。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { HIGHMOUNTAIN },
				["groups"] = {
					n(102347, {	-- Bitestone Fishbrul
						i(133710, {	-- Salmon Lure
							["description"] = createLocalizationString({
								readable = "This item will allow you to catch the rare fish Ancient Highmountain Salmon in Highmountain.",
								constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_4",
								export = true,
								text = {
									en = "This item will allow you to catch the rare fish Ancient Highmountain Salmon in Highmountain.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此物品可以让你在至高岭钓到稀有鱼远古至高岭鲑鱼。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								i(133733),	-- Ancient Highmountain Salmon
								i(139660),	-- Ancient Highmountain Salmon [AP]
							},
						}),
					}),
				},
			}),
			i(133721, {	-- Message in a Bottle
				["description"] = createLocalizationString({
					readable = "I hope that someone gets my...\nI hope that someone gets my...\nMESSAGE IN A BOOOOTTTLE, yeah.",
					constant = "I_HOPE_THAT_SOMEONE_GETS_MY_I_HOPE_THAT_SOMEONE",
					export = true,
					text = {
						en = "I hope that someone gets my...\nI hope that someone gets my...\nMESSAGE IN A BOOOOTTTLE, yeah.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "我希望有人收到我的……\n我希望有人收到我的……\n漂流瓶中的讯息，耶。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
				["groups"] = {
					i(133722, {	-- Axefish Lure
						["description"] = "~L.YOU_MUST_BE_IN_CFFFFFFFFTHE_GREAT_SEA_R_WHEN",
						["groups"] = {
							i(133740),	-- Axefish
							i(139667),	-- Axefish [AP]
						},
					}),
				},
			}),
			i(133713, {	-- Moosehorn Hook
				["description"] = createLocalizationString({
					readable = "An important note - if you use this item with another bait active (or vice versa) the new buff WILL REPLACE the previous one. As such, it's best to wait until your bait buff expires before using this item. This does not apply to Arcane Lure, which can be used concurrently with any other bait/lure.",
					constant = "AN_IMPORTANT_NOTE_IF_YOU_USE_THIS_ITEM_WITH",
					export = true,
					text = {
						en = "An important note - if you use this item with another bait active (or vice versa) the new buff WILL REPLACE the previous one. As such, it's best to wait until your bait buff expires before using this item. This does not apply to Arcane Lure, which can be used concurrently with any other bait/lure.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "重要提示——如果你在另一种鱼饵激活时使用此物品（或反过来），新的增益会替换掉之前的那个。因此，最好等到你的鱼饵增益消失后再使用此物品。这不适用于奥术诱饵，它可以与任何其他鱼饵/诱饵同时使用。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { STORMHEIM },
				["groups"] = {
					i(133714, {	-- Silverscale Minnow
						["description"] = createLocalizationString({
							readable = "This item will allow you to catch the rare fish Thundering Stormray in Stormheim.",
							constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_5",
							export = true,
							text = {
								en = "This item will allow you to catch the rare fish Thundering Stormray in Stormheim.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此物品可以让你在风暴峡湾钓到稀有鱼雷霆风暴鳐。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(133736),	-- Thundering Stormray
							i(139663),	-- Thundering Stormray [AP]
						},
					}),
				},
			}),
			i(133707, {	-- Nightmare Nightcrawler
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Terrorfin in Val'sharah.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_6",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Terrorfin in Val'sharah.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在瓦尔莎拉钓到稀有鱼恐鳍。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { VALSHARAH },
				["groups"] = {
					i(133728),	-- Terrorfin
					i(139655),	-- Terrorfin [AP]
				},
			}),
			i(133703, {	-- Pearlescent Conch
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Nar'thalas Hermit in Azsuna.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_7",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Nar'thalas Hermit in Azsuna.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在阿苏纳钓到稀有鱼纳萨拉斯隐士。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA },
				["groups"] = {
					i(133726),	-- Nar'thalas Hermit
					i(139653),	-- Nar'thalas Hermit [AP]
				},
			}),
			i(133705, {	-- Rotten Fishbone
				["description"] = createLocalizationString({
					readable = "This item will attract a Lorlathil Druid that will cast The Cat's Meow buff on you, increasing your chance to fish up Ancient Mossgill.",
					constant = "THIS_ITEM_WILL_ATTRACT_A_LORLATHIL_DRUID_THAT",
					export = true,
					text = {
						en = "This item will attract a Lorlathil Druid that will cast The Cat's Meow buff on you, increasing your chance to fish up Ancient Mossgill.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会吸引一名洛拉希尔德鲁伊，它会对你施放“猫的叫声”增益，提高你钓到远古苔鳃的几率。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { VALSHARAH },
				["groups"] = {
					n(102349, {	-- Lorlathil Druid
						i(133730),	-- Ancient Mossgill
						i(139657),	-- Ancient Mossgill [AP]
					}),
				},
			}),
			i(133704, {	-- Rusty Queenfish Brooch
				["description"] = createLocalizationString({
					readable = "This item will give you a buff that will allow you to see and fish from Ghostly Queenfish schools.",
					constant = "THIS_ITEM_WILL_GIVE_YOU_A_BUFF_THAT_WILL_ALLOW_2",
					export = true,
					text = {
						en = "This item will give you a buff that will allow you to see and fish from Ghostly Queenfish schools.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会给你一个增益，让你能看到并垂钓幽灵皇后鱼群。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA },
				["groups"] = {
					i(133727),	-- Ghostly Queenfish
					i(139654),	-- Ghostly Queenfish [AP]
				},
			}),
			i(133701, {	-- Skrog Toenail
				["description"] = createLocalizationString({
					readable = "Upon expiration of the Skrog Toenail buff, a Murloc mob will appear. Kill it for the lure.",
					constant = "UPON_EXPIRATION_OF_THE_SKROG_TOENAIL_BUFF_A",
					export = true,
					text = {
						en = "Upon expiration of the Skrog Toenail buff, a Murloc mob will appear. Kill it for the lure.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当斯克罗格脚趾甲增益效果消失后，会出现一只鱼人怪物。击杀它以获得诱饵。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA },
				["groups"] = {
					n(102338, {	-- Salteye Skrog-Hunter
						i(133702, {	-- Aromatic Murloc Slime
							["description"] = createLocalizationString({
								readable = "This item will allow you to catch the rare fish Leyshimmer Blenny in Azsuna.",
								constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_8",
								export = true,
								text = {
									en = "This item will allow you to catch the rare fish Leyshimmer Blenny in Azsuna.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此物品可以让你在阿苏纳钓到稀有鱼魔光鳚。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								i(133725),	-- Leyshimmer Blenny
								i(139652),	-- Leyshimmer Blenny [AP]
							},
						}),
					}),
				},
			}),
			i(133719, {	-- Sleeping Murloc
				["description"] = createLocalizationString({
					readable = "Using this item will awaken a Confused Seerspine Murloc, which will run around briefly and drop some Seerspine Puffers (as well as other fish) nearby. Run over the fish to pick them up.\n\nIf you use this item on top of a pillar, the murloc won't have anywhere to run and it will be easier to pick up all the fish it drops.\n",
					constant = "USING_THIS_ITEM_WILL_AWAKEN_A_CONFUSED",
					export = true,
					text = {
						en = "Using this item will awaken a Confused Seerspine Murloc, which will run around briefly and drop some Seerspine Puffers (as well as other fish) nearby. Run over the fish to pick them up.\n\nIf you use this item on top of a pillar, the murloc won't have anywhere to run and it will be easier to pick up all the fish it drops.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用此物品会唤醒一只困惑的杉脊鱼人，它会短暂地四处跑动，并在附近掉落一些杉脊河豚（以及其他鱼类）。跑过去踩在鱼上即可拾取。\n\n如果你在柱子顶端使用此物品，鱼人无处可跑，拾取它掉落的所有鱼会更容易。\n",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { SURAMAR },
				["groups"] = {
					n(102350, {	-- Confused Seerspine Murloc
						i(133738),	-- Seerspine Puffer
						i(139665),	-- Seerspine Puffer [AP]
					}),
				},
			}),
			i(133716, {	-- Soggy Drakescale
				["description"] = createLocalizationString({
					readable = "This item will allow you to catch the rare fish Graybelly Lobster in Stormheim.",
					constant = "THIS_ITEM_WILL_ALLOW_YOU_TO_CATCH_THE_RARE_FISH_9",
					export = true,
					text = {
						en = "This item will allow you to catch the rare fish Graybelly Lobster in Stormheim.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品可以让你在风暴峡湾钓到稀有鱼灰腹龙虾。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { STORMHEIM },
				["groups"] = {
					i(133735),	-- Graybelly Lobster
					i(139662),	-- Graybelly Lobster [AP]
				},
			}),
			i(133723, {	-- Stunned, Angry Shark
				["description"] = createLocalizationString({
					readable = "This item will spawn a Landlocked Shark, which will drop 7-9 Seabottom Squid when killed. Note that this item only has a 1-minute duration in your bags, and it will disappear if you don't use it by then!\n\nYou must be in |cffffffffThe Great Sea|r to catch this.",
					constant = "THIS_ITEM_WILL_SPAWN_A_LANDLOCKED_SHARK_WHICH",
					export = true,
					text = {
						en = "This item will spawn a Landlocked Shark, which will drop 7-9 Seabottom Squid when killed. Note that this item only has a 1-minute duration in your bags, and it will disappear if you don't use it by then!\n\nYou must be in |cffffffffThe Great Sea|r to catch this.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会生成一条陆行鲨，击杀它后会掉落 7-9 只海底鱿鱼。注意，此物品在你背包中只有 1 分钟的持续时间，如果届时没有使用，它就会消失！\n\n你必须在|cffffffff无尽之海|r中才能钓到它。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { AZSUNA, VALSHARAH, HIGHMOUNTAIN, STORMHEIM, BROKEN_SHORE, SURAMAR, BROKEN_ISLES },
				["groups"] = {
					n(102359, {	-- Landlocked Shark
						i(133741),	-- Seabottom Squid
						i(139668),	-- Seabottom Squid [AP]
					}),
				},
			}),
			i(133711, {	-- Swollen Murloc Egg
				["description"] = createLocalizationString({
					readable = "This item will spawn a Swamprock Tadpole that grants the Blessing of the Murlocs buff, increasing your chance to fish up Mountain Puffer.",
					constant = "THIS_ITEM_WILL_SPAWN_A_SWAMPROCK_TADPOLE_THAT",
					export = true,
					text = {
						en = "This item will spawn a Swamprock Tadpole that grants the Blessing of the Murlocs buff, increasing your chance to fish up Mountain Puffer.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此物品会生成一只沼岩蝌蚪，它会给予鱼人的祝福增益，提高你钓到山地河豚的几率。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { HIGHMOUNTAIN },
				["groups"] = {
					n(102339, {	-- Swamprock Tadpole
						["description"] = createLocalizationString({
							readable = "Casts the Blessing of the Murlocs buff on you, increasing your chance to fish up Mountain Puffer.",
							constant = "CASTS_THE_BLESSING_OF_THE_MURLOCS_BUFF_ON_YOU",
							export = true,
							text = {
								en = "Casts the Blessing of the Murlocs buff on you, increasing your chance to fish up Mountain Puffer.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "为你施放鱼人的祝福增益，提高你钓到山地河豚的几率。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(133731),	-- Mountain Puffer
							i(139658),	-- Mountain Puffer [AP]
						},
					}),
				},
			}),
		}),
		n(QUESTS, {
			q(40960, {	-- Luminous Pearl
				["provider"] = { "i", 133887 },	-- Luminous Pearl
			}),
			q(40961, {	-- The Dalaran Fountain
				["sourceQuest"] = 40960,	-- Luminous Pearl
				["qg"] = 90417,	-- Archmage Khadgar
				["coord"] = { 28.8, 48.6, LEGION_DALARAN },
			}),
			q(41010, {	-- Fish Frenzy
				["description"] = createLocalizationString({
					readable = "If you can't find Nat Pagle to give you this quest, going into the bank just south of the fountain seems to force him to spawn right on you.",
					constant = "IF_YOU_CAN_T_FIND_NAT_PAGLE_TO_GIVE_YOU_THIS",
					export = true,
					text = {
						en = "If you can't find Nat Pagle to give you this quest, going into the bank just south of the fountain seems to force him to spawn right on you.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果你找不到纳特·帕格来给你这个任务，进入喷泉正南方的银行似乎会让他直接刷新在你身上。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuest"] = 40961,	-- The Dalaran Fountain
				["qg"] = 102639,	-- Nat Pagle
				["maps"] = { LEGION_DALARAN },	-- TODO replace with coord?
				["groups"] = {
					artifact(841),	-- Base Skin
				},
			}),
		}),
	})),
	expansion(EXPANSION.BFA, bubbleDownSelf({ ["timeline"] = { ADDED_8_0_1_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(12753, {	-- Kul Tiran Fisherman [A]
				["races"] = ALLIANCE_ONLY,
			}),
			ach(12754, {	-- Zandalari Fisherman [H]
				["races"] = HORDE_ONLY,
			}),
			ach(12757),	-- Angling for Battle
			ach(12990),	-- Catchin' Some Rays
			ach(12756),	-- Fish Me In the Moonlight
			ach(12755, {	-- Scent of the Sea
				["cost"] = {{"i", 160711, 100}},	-- 100x Aromatic Fish Oil
			}),
			ach(13502, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {	-- Secret Fish and Where to Find Them
				["description"] = createLocalizationString({
					readable = "First, acquire the Secret Fish Goggles from Danielle Anglers in Mechagon.\n\nWhen you use the goggles, you gain a 1-hour buff that allows you to see Secret Fish, which appear in bubbles around your character. When you see one, approach it and click on it, and you'll get a fish. That fish will be a BfA, or zone-relevant common fish, or one of the requirements for this achievement (assuming you fulfill the requirements for each fish).",
					constant = "FIRST_ACQUIRE_THE_SECRET_FISH_GOGGLES_FROM",
					export = true,
					text = {
						en = "First, acquire the Secret Fish Goggles from Danielle Anglers in Mechagon.\n\nWhen you use the goggles, you gain a 1-hour buff that allows you to see Secret Fish, which appear in bubbles around your character. When you see one, approach it and click on it, and you'll get a fish. That fish will be a BfA, or zone-relevant common fish, or one of the requirements for this achievement (assuming you fulfill the requirements for each fish).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "首先，在麦卡贡从丹妮尔·垂钓者处获得秘密鱼护目镜。\n\n使用护目镜时，你会获得一个持续 1 小时的增益效果，可以让你看到秘密鱼，它们会以气泡的形式出现在你的角色周围。看到一条时，靠近并点击它，你就会得到一条鱼。这条鱼会是争霸艾泽拉斯或与该区域相关的普通鱼，或是此成就所需条件之一（前提是你满足每种鱼的条件）。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 167698 },	-- Secret Fish Goggles
				["groups"] = {
					i(168016),	-- Hyper-Compressed Ocean (TOY!)
					crit(44803, {	-- Ancient Mana Fin
						["itemID"] = 167708,	-- Ancient Mana Fin
						["description"] = createLocalizationString({
							readable = "Found in Suramar City Harbor.",
							constant = "FOUND_IN_SURAMAR_CITY_HARBOR",
							export = true,
							text = {
								en = "Found in Suramar City Harbor.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于苏拉玛城港口。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44804, {	-- Barbed Fjord Fin
						["itemID"] = 167710,	-- Barbed Fjord Fin
						["description"] = createLocalizationString({
							readable = "Found in Howling Fjord.",
							constant = "FOUND_IN_HOWLING_FJORD",
							export = true,
							text = {
								en = "Found in Howling Fjord.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于嚎风峡湾。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44805, {	-- Camouflaged Snark
						["itemID"] = 167717,	-- Camouflaged Snark
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere at any time.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
							export = true,
							text = {
								en = "Can be caught anywhere at any time.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在任何时间任何地点钓到。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44806, {	-- Collectable Saltfin
						["itemID"] = 167718,	-- Collectable Saltfin
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44807, {	-- Dead Fel Bone
						["itemID"] = 167711,	-- Dead Fel Bone
						["description"] = createLocalizationString({
							readable = "Found in Krokuun and the Antoran Wastes on Argus.",
							constant = "FOUND_IN_KROKUUN_AND_THE_ANTORAN_WASTES_ON",
							export = true,
							text = {
								en = "Found in Krokuun and the Antoran Wastes on Argus.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于阿古斯的克罗库恩和安托兰废土。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44821, {	-- Deadeye Wally
						["itemID"] = 167727,	-- Deadeye Wally
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere, but only while you're dead.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_BUT_ONLY_WHILE_YOU_RE",
							export = true,
							text = {
								en = "Can be caught anywhere, but only while you're dead.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在任何地点钓到，但只有在你处于死亡状态时。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44808, {	-- Deceptive Maw
						["itemID"] = 167729,	-- Deceptive Maw
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44809, {	-- Drowned Goldfish
						["itemID"] = 167709,	-- Drowned Goldfish
						["description"] = createLocalizationString({
							readable = "Found at around |cffffffff46, 50|r, at the Drowned Lands in Stormsong Valley.",
							constant = "FOUND_AT_AROUND_CFFFFFFFF46_50_R_AT_THE_DROWNED",
							export = true,
							text = {
								en = "Found at around |cffffffff46, 50|r, at the Drowned Lands in Stormsong Valley.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于斯托颂谷地溺亡之地的|cffffffff46, 50|r附近。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 46.0, 50.0, STORMSONG_VALLEY },
					}),
					crit(44810, {	-- Elusive Moonfish
						["itemID"] = 167715,	-- Elusive Moonfish
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere at night, from 9:30pm to 8am.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_AT_NIGHT_FROM_9_30PM_TO",
							export = true,
							text = {
								en = "Can be caught anywhere at night, from 9:30pm to 8am.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在夜间任何地方钓到，时间为 9:30pm 至 8am。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44811, {	-- Golden Sunsoaker
						["itemID"] = 167719,	-- Golden Sunsoaker
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere during the day, from 8am to 9:30pm.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_DURING_THE_DAY_FROM_8AM",
							export = true,
							text = {
								en = "Can be caught anywhere during the day, from 8am to 9:30pm.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在白天任何地方钓到，时间为 8am 至 9:30pm。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44812, {	-- Inconspicuous Catfish
						["itemID"] = 167730,	-- Inconspicuous Catfish
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44813, {	-- Invisible Smelt
						["itemID"] = 167721,	-- Invisible Smelt
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44815, {	-- Jade Story Fish
						["itemID"] = 167706,	-- Jade Story Fish
						["description"] = createLocalizationString({
							readable = "Found in the Jade Forest.",
							constant = "FOUND_IN_THE_JADE_FOREST",
							export = true,
							text = {
								en = "Found in the Jade Forest.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于翡翠林。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44816, {	-- Kirin Tor Clown
						["itemID"] = 167707,	-- Kirin Tor Clown
						["description"] = createLocalizationString({
							readable = "Found in Dalaran (Broken Isles or Northrend).",
							constant = "FOUND_IN_DALARAN_BROKEN_ISLES_OR_NORTHREND",
							export = true,
							text = {
								en = "Found in Dalaran (Broken Isles or Northrend).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于达拉然（破碎群岛或诺森德）。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44817, {	-- Mechanized Mackerel
						["itemID"] = 167705,	-- Mechanized Mackerel
						["description"] = createLocalizationString({
							readable = "Found in Mechagon.",
							constant = "FOUND_IN_MECHAGON",
							export = true,
							text = {
								en = "Found in Mechagon.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于麦卡贡。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44814, {	-- Prisoner Fish
						["itemID"] = 167722,	-- Prisoner Fish
						["description"] = createLocalizationString({
							readable = "Found in Tol Barad (PvP area).",
							constant = "FOUND_IN_TOL_BARAD_PVP_AREA",
							export = true,
							text = {
								en = "Found in Tol Barad (PvP area).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于托尔巴拉德（PvP 区域）。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44818, {	-- Queen's Delight
						["itemID"] = 167728,	-- Queen's Delight
						["description"] = createLocalizationString({
							readable = "Found in Nazjatar.",
							constant = "FOUND_IN_NAZJATAR",
							export = true,
							text = {
								en = "Found in Nazjatar.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于纳沙塔尔。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44819, {	-- Quiet Floater
						["itemID"] = 167726,	-- Quiet Floater
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_BUT_ONLY_WHILE_YOU_RE",
					}),
					crit(44820, {	-- Rotted Blood Cod
						["itemID"] = 167712,	-- Rotted Blood Cod
						["description"] = createLocalizationString({
							readable = "Found in Zul'Nazman, Nazmir (the area surrounding Uldir).",
							constant = "FOUND_IN_ZUL_NAZMAN_NAZMIR_THE_AREA_SURROUNDING",
							export = true,
							text = {
								en = "Found in Zul'Nazman, Nazmir (the area surrounding Uldir).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于纳兹米尔的祖尔纳兹曼（奥迪尔周边区域）。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44822, {	-- Thunderous Flounder
						["itemID"] = 167723,	-- Thunderous Flounder
						["description"] = createLocalizationString({
							readable = "Found on the Isle of Thunder.",
							constant = "FOUND_ON_THE_ISLE_OF_THUNDER",
							export = true,
							text = {
								en = "Found on the Isle of Thunder.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于雷神岛。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(44828, {	-- Tortollan Tank Dweller
						["itemID"] = 167724,	-- Tortollan Tank Dweller
						["description"] = createLocalizationString({
							readable = "Found in Anyport, Drustvar, inside the Tortollan inn named 'The Drunk Tank.'",
							constant = "FOUND_IN_ANYPORT_DRUSTVAR_INSIDE_THE_TORTOLLAN",
							export = true,
							text = {
								en = "Found in Anyport, Drustvar, inside the Tortollan inn named 'The Drunk Tank.'",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于德鲁斯瓦的任意港，始祖龟旅店“醉汉收容所”内。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 19.6, 42.8, DRUSTVAR },
					}),
					crit(44823, {	-- Travelling Goby
						["itemID"] = 167714,	-- Travelling Goby
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44824, {	-- Unseen Mimmic
						["itemID"] = 167716,	-- Unseen Mimmic
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(44825, {	-- Spiritual Salmon
						["itemID"] = 167725,	-- Spiritual Salmon
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_BUT_ONLY_WHILE_YOU_RE",
					}),
					crit(44826, {	-- Veiled Ghost
						["itemID"] = 167713,	-- Veiled Ghost
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_BUT_ONLY_WHILE_YOU_RE",
					}),
					crit(44827, {	-- Very Tiny Whale
						["itemID"] = 167720,	-- Very Tiny Whale
						["description"] = "~L.CAN_BE_CAUGHT_ANYWHERE_AT_ANY_TIME",
					}),
					crit(45754, {	-- Green Roughy
						["itemID"] = 169884,	-- Green Roughy
						["description"] = createLocalizationString({
							readable = "Can be caught anywhere, but requires the |cffffffff[Painted Green]|r buff from Mechagon. Head over to the painting station at |cffffffff63, 42|r and get the buff.",
							constant = "CAN_BE_CAUGHT_ANYWHERE_BUT_REQUIRES_THE",
							export = true,
							text = {
								en = "Can be caught anywhere, but requires the |cffffffff[Painted Green]|r buff from Mechagon. Head over to the painting station at |cffffffff63, 42|r and get the buff.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在任何地方钓到，但需要麦卡贡的|cffffffff[涂成绿色]|r增益。前往|cffffffff63, 42|r处的涂装站获取该增益。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 63.0, 42.0, MECHAGON },
					}),
					crit(45755, {	-- Displaced Scrapfin
						["itemID"] = 169870,	-- Displaced Scrapfin
						["description"] = createLocalizationString({
							readable = "Can be caught in Alternate Mechagon. Wait for Chromie to give you the quest 'The Other Place', or craft a Personal Time Displacer from Mechagon Tinkering.",
							constant = "CAN_BE_CAUGHT_IN_ALTERNATE_MECHAGON_WAIT_FOR",
							export = true,
							text = {
								en = "Can be caught in Alternate Mechagon. Wait for Chromie to give you the quest 'The Other Place', or craft a Personal Time Displacer from Mechagon Tinkering.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在另一个麦卡贡钓到。等待克罗米给你任务“另一个地方”，或用麦卡贡发明制作一个个人时间位移器。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(45952, {	-- Thin Air Flounder
						["itemID"] = 169897,	-- Thin Air Flounder
						["description"] = createLocalizationString({
							readable = "Found at Neverest Pinnacle atop Kun-Lai Summit.",
							constant = "FOUND_AT_NEVEREST_PINNACLE_ATOP_KUN_LAI_SUMMIT",
							export = true,
							text = {
								en = "Found at Neverest Pinnacle atop Kun-Lai Summit.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于昆莱山山顶的永望峰顶。",
								-- TODO: tw = "",
							},
						}),
					}),
					crit(45953, {	-- Well Lurker
						["itemID"] = 169898,	-- Well Lurker
						["description"] = createLocalizationString({
							readable = "Found in Mount Hyjal, in the lake under Nordrassil.",
							constant = "FOUND_IN_MOUNT_HYJAL_IN_THE_LAKE_UNDER",
							export = true,
							text = {
								en = "Found in Mount Hyjal, in the lake under Nordrassil.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于海加尔山，诺达希尔下方的湖中。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			})),
		}),
		container(168016, {	-- Hyper-Compressed Ocean (TOY!)
			["crs"] = { 152121 },	-- Hyper-Compressed Ocean NPC
			["timeline"] = { ADDED_8_2_0 },
			-- Confirmed Drops
			["sym"] = {{"select","itemID",
				7187,	-- VanCleef's Boots
				139408,	-- Deck Sandals
				139407,	-- Diver's Chain Boots
				139405,	-- Kul'Tiras Marine Issue Boots
				139406,	-- Sea Dog Boots
			}},
			["groups"] = {
				i(7188, {	-- Stormwind Guard Shield
					["timeline"] = { ADDED_8_2_0 },
				}),
			},
		}),
	})),
	expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(14333),	-- Shadowlands Fisherman
		}),
	})),
	expansion(EXPANSION.DF, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(16632),	-- Dragon Isles Fisherman
			ach(17207, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {	-- Discombobberlated
				["provider"] = { "i", 136377 },	-- Oversized Bobber
				["groups"] = {
					i(202207),	-- Reusable Oversized Bobber (TOY!)
				},
			})),
		}),
		n(QUESTS, {
			q(72252, {	-- Dragon Isles Fishing [A]
				["description"] = createLocalizationString({
					readable = "This quest can only be picked up PRIOR to learning Dragon Isles Fishing. You must not have any items in your profession equipment slot.",
					constant = "THIS_QUEST_CAN_ONLY_BE_PICKED_UP_PRIOR_TO_6",
					export = true,
					text = {
						en = "This quest can only be picked up PRIOR to learning Dragon Isles Fishing. You must not have any items in your profession equipment slot.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此任务只能在学会巨龙群岛钓鱼之前接取。你的专业技能装备栏中不能有任何物品。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 67700 },	-- To the Dragon Isles! [A]
				["provider"] = { "n", 191150 },	-- Danielle Anglers
				["coord"] = { 81.3, 31.3, THE_WAKING_SHORES },
				["races"] = ALLIANCE_ONLY,
				["lockCriteria"] = { 1, "spellID", 366253 },	-- Dragon Isles Fishing
			}),
			q(72253, {	-- Dragon Isles Fishing [H]
				["description"] = "~L.THIS_QUEST_CAN_ONLY_BE_PICKED_UP_PRIOR_TO_6",
				["sourceQuests"] = { 65444 },	-- To the Dragon Isles! [H]
				["provider"] = { "n", 190524 },	-- Mora Cloudwalker <Fishing Trainer>
				["coord"] = { 81.0, 29.0, THE_WAKING_SHORES },
				["races"] = HORDE_ONLY,
				["lockCriteria"] = { 1, "spellID", 366253 },	-- Dragon Isles Fishing
			}),
			q(72729, {	-- The Great Swog
				["provider"] = { "i", 202105 },	-- Rusted Coin of the Isles
			}),
		}),
	})),
	expansion(EXPANSION.TWW, bubbleDownSelf({ ["timeline"] = { ADDED_11_0_2 } }, {
		n(ACHIEVEMENTS, {
			ach(40494, {	-- 10 Algari Anglerthread
				["cost"] = {{"i", 225770, 10}},	-- 10x Algari Anglerthread
			}),
			ach(40495, {	-- 20 Algari Anglerthread
				["cost"] = {{"i", 225770, 20}},	-- 20x Algari Anglerthread
			}),
			ach(40497, {	-- 30 Algari Anglerthread
				["cost"] = {{"i", 225770, 30}},	-- 30x Algari Anglerthread
			}),
			ach(40499, {	-- 40 Algari Anglerthread
				["cost"] = {{"i", 225770, 40}},	-- 40x Algari Anglerthread
			}),
			ach(40502, {	-- 50 Algari Anglerthread
				["cost"] = {{"i", 225770, 50}},	-- 50x Algari Anglerthread
			}),
			ach(40496, {	-- 60 Algari Anglerthread
				["cost"] = {{"i", 225770, 60}},	-- 60x Algari Anglerthread
			}),
			ach(40498, {	-- 70 Algari Anglerthread
				["cost"] = {{"i", 225770, 70}},	-- 70x Algari Anglerthread
			}),
			ach(40500, {	-- 80 Algari Anglerthread
				["cost"] = {{"i", 225770, 80}},	-- 80x Algari Anglerthread
			}),
			ach(40503, {	-- 90 Algari Anglerthread
				["cost"] = {{"i", 225770, 90}},	-- 90x Algari Anglerthread
			}),
			ach(40501, {	-- 100 Algari Anglerthread
				["cost"] = {{"i", 225770, 100}},	-- 100x Algari Anglerthread
			}),
			ach(40476, {	-- 10 Algari Seekerthread
				["cost"] = {{"i", 225771, 10}},	-- 10x Algari Seekerthread
			}),
			ach(40480, {	-- 20 Algari Seekerthread
				["cost"] = {{"i", 225771, 20}},	-- 20x Algari Seekerthread
			}),
			ach(40484, {	-- 30 Algari Seekerthread
				["cost"] = {{"i", 225771, 30}},	-- 30x Algari Seekerthread
			}),
			ach(40485, {	-- 40 Algari Seekerthread
				["cost"] = {{"i", 225771, 40}},	-- 40x Algari Seekerthread
			}),
			ach(40487, {	-- 50 Algari Seekerthread
				["cost"] = {{"i", 225771, 50}},	-- 50x Algari Seekerthread
			}),
			ach(40488, {	-- 60 Algari Seekerthread
				["cost"] = {{"i", 225771, 60}},	-- 60x Algari Seekerthread
			}),
			ach(40489, {	-- 70 Algari Seekerthread
				["cost"] = {{"i", 225771, 70}},	-- 70x Algari Seekerthread
			}),
			ach(40490, {	-- 80 Algari Seekerthread
				["cost"] = {{"i", 225771, 80}},	-- 80x Algari Seekerthread
			}),
			ach(40491, {	-- 90 Algari Seekerthread
				["cost"] = {{"i", 225771, 90}},	-- 90x Algari Seekerthread
			}),
			ach(40492, {	-- 100 Algari Seekerthread
				["cost"] = {{"i", 225771, 100}},	-- 100x Algari Seekerthread
			}),
			ach(19415, {	-- Algari Fisherman
				["cost"] = {{"i", 224752, 20}},	-- 20x Soaked Journal Entry
			}),
		}),
		filter(MISC, {
			i(226392, {	-- Careless Dasher's Treasure
				currency(3055),
			}),
			i(225768),	-- Crusty Darkmoon Card
		}),
	})),
	expansion(EXPANSION.MID, bubbleDownSelf({ ["timeline"] = { ADDED_12_0_1_LAUNCH } }, {
		n(ACHIEVEMENTS, {
			ach(42797, {	-- Fishing at Midnight
				["cost"] = {
					{ "i", 262649, 30 },	-- 30x An Angler's Deep Dive
					{ "i", 262787, 30 },	-- 30x Dredged Journal Entry
					{ "i", 254875, 3 },	-- 3x Muck-Covered Writings
				},
				["timeline"] = { ADDED_12_0_1_LAUNCH },
				["groups"] = { i(264002) },	-- Midnight Fisher's Shop Sign (DECOR!)
			}),
			ach(63510, bubbleDownSelf({ ["timeline"] = { ADDED_12_1_0 } }, {	-- The Briny Best
				["groups"] = {
					title(779),	-- Briny <Name>
				},
			})),
		}),
		filter(RECIPES, {
			i(244791),	-- Recipe: Amani Angler's Ward
			i(244817),	-- Recipe: Blood Hunter Lure
			i(244816),	-- Recipe: Lucky Loa Lure
			i(244815),	-- Recipe: Ominous Octopus Lure
		}),
		n(TREASURES, {
			o(540505, {	-- Patient Treasure
				["description"] = createLocalizationString({
					readable = "Has a chance to spawn nearby while fishing.",
					constant = "HAS_A_CHANCE_TO_SPAWN_NEARBY_WHILE_FISHING",
					export = true,
					text = {
						en = "Has a chance to spawn nearby while fishing.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "钓鱼时有几率在附近刷新。",
						-- TODO: tw = "",
					},
				}),
				["maps"] = { MAP.MIDNIGHT.QUELTHALAS },
			}),
		}),
	})),
})));
