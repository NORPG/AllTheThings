---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(INVASION_PIRATE, {
			["description"] = "~L.EVERY_WEEK_A_FACTION_INVADES_THE_ISLAND_THE",
			["groups"] = {
				petbattle(filter(BATTLE_PETS, {
					pet(4710, {	-- Pillaged Parrot
						["description"] = createLocalizationString({
							readable = "Only spawns during Pirate invasion week.",
							constant = "ONLY_SPAWNS_DURING_PIRATE_INVASION_WEEK",
							export = true,
							text = {
								en = "Only spawns during Pirate invasion week.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "仅在海盗入侵周刷新。",
								-- TODO: tw = "",
							},
						}),
					}),
				})),
				n(QUESTS, {
					q(83753, {	-- Cannon Karma
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 227818 },	-- Skaggit
						["coord"] = { 69.3, 43.4, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o(499551,{	-- Blacksteel Cannonballs
								["coord"] = { 47.8, 64.8, SIREN_ISLE },
								["groups"] = {
									i(226133),	-- Blacksteel Cannonball (QI!)
								},
							}),
						},
					}),
					q(84001, {	-- Cart Blanche
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 232730 },	-- Machinist Kromleg
						["coord"] = { 48.5, 53.0, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o(456665, {	-- Ore Sample
								i(226853),	-- Ore Sample (QI!)
							}),
						},
					}),
					q(84619, {	-- Ooker Dooker Literature Club
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 229716 },	-- Stellin Verasa
						["coord"] = { 71.0, 39.6, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							i(231812),	-- Hozen Poetry (QI!)
							n(232825, {	-- First Mate Dat-Dat
								i(231809),	-- First Mate Dat-Dat's Key (QI!)
							}),
							o(477098, {	-- Bilge Rat Trunk
								["coords"] = {
									{ 53.7, 88.8, SIREN_ISLE },
									{ 54.9, 83.7, SIREN_ISLE },
								},
								["groups"] = { i(231786) },	-- Ookler's Diary (QI!)
							}),
							o(477366, {	-- Dat-Dat's Book Stash
								["coord"] = { 60.6, 97.6, SIREN_ISLE },
								["groups"] = { i(231802) },	-- Ashvane Co. Survey Report (QI!)
							}),
							o(477612, {	-- Siren Isle Manifest
								["coords"] = {
									{ 55.2, 93.1, SIREN_ISLE },
									{ 68.3, 94.3, SIREN_ISLE },
								},
								["groups"] = { i(231813) },	-- Siren Isle Manifest (QI!)
							}),
							o(477248, {	-- Songs of the Siren
								["coord"] = { 62.8, 97.2, SIREN_ISLE },
								["groups"] = { i(231788) },	-- Songs of the Siren (QI!)
							}),
						},
					}),
					q(84299, {	-- Pirate Plunder
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 227818 },	-- Skaggit
						["coord"] = { 69.3, 43.4, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							o(456869, {	-- Kaja'Cola Stash
								["coords"] = {
									{ 56.9, 85.5, SIREN_ISLE },
									{ 64.6, 63.8, SIREN_ISLE },
								},
								["groups"] = { i(227453) },	-- Kaja'Cola Stash (QI!)
							}),
							o(457143, {	-- Kaja'Cola Can
								["coords"] = {
									{ 49.3, 63.2, SIREN_ISLE },
									{ 51.9, 72.9, SIREN_ISLE },
									{ 56.5, 71.1, SIREN_ISLE },
									{ 64.5, 72.4, SIREN_ISLE },
									{ 65.9, 59.0, SIREN_ISLE },
									{ 69.3, 58.9, SIREN_ISLE },
								},
								["groups"] = { i(227670) },	-- Kaja'Cola Can (QI!)
							}),
						},
					}),
					q(83827, {	-- Silence the Song
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 232753 },	-- Regald Hornfyre
						["coord"] = { 45.2, 67.7, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							i(226261),	-- Sonic Scrambler (QI!)
						},
					}),
				}),
				pickpocketing({
					i(234232, {	-- Technique: Glyph of the Ashvane Pistol Shot (RECIPE!)
						["description"] = createLocalizationString({
							readable = "Can be pickpocketed from Pirates.",
							constant = "CAN_BE_PICKPOCKETED_FROM_PIRATES",
							export = true,
							text = {
								en = "Can be pickpocketed from Pirates.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可从海盗身上偷窃获得。",
								-- TODO: tw = "",
							},
						}),
					}),
				}),
				n(RARES, sharedData({
					["isDaily"] = true,
				},{
					n(228583, {	-- Chef Chum Platter
						-- pirates
						["coord"] = { 66.4, 85.5, SIREN_ISLE },
						["questID"] = 84800,
					}),
					n(228580, {	-- Plank-Master Bluebelly
						-- pirates
						["coord"] = { 59.7, 87.8, SIREN_ISLE },
						["questID"] = 84799,
					}),
				})),
				n(TREASURES, {
					o(464233, {	-- Bilge Rat Supply Chest
						-- Pirates
						["description"] = createLocalizationString({
							readable = "Key drops from First Mate Shellshock\n/att n:228582",
							constant = "KEY_DROPS_FROM_FIRST_MATE_SHELLSHOCK_ATT_N",
							export = true,
							text = {
								en = "Key drops from First Mate Shellshock\n/att n:228582",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "钥匙由大副碎贝掉落\n/att n:228582",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 62.4, 90.8, SIREN_ISLE },
						["questID"] = 84529,
						["cost"] = { { "i", 228621, 1 } },	-- Bilge Rat Supply Key
						["isWeekly"] = true,
					}),
				}),
				n(WORLD_QUESTS, {
					["sourceQuests"] = {
						TWW_ACCOUNT_CAMPAIGN_QUEST,
						84725,	-- The Circlet Calls
					},
					["groups"] = bubbleDownFiltered({ ["isWorldQuest"] = true, },FILTERFUNC_questID,{
						q(84851, {	-- Tides of Greed
							["groups"] = {
								i(228646, {	-- Legendary Skipper's Citrine
									["description"] = "~L.ONLY_COUNTS_FOR_THE_ACHIEVEMENT_WHEN_LOOTED",
								}),
							},
						}),
					}),
				}),
				n(ZONE_DROPS, {
					i(233500, {	-- Crimson Snapdragon Treat (CI!)
						["description"] = createLocalizationString({
							readable = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Pirates.",
							constant = "YOU_MUST_HAVE_THE_PRISMATIC_SNAPDRAGON_MOUNT_2",
							export = true,
							text = {
								en = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Pirates.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你必须先拥有棱彩龙蜥坐骑，此物品才会掉落。\n\n可以从海盗身上拾取。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(166358, {	-- Proper Parrot (PET!)
						["description"] = createLocalizationString({
							readable = "Can be looted from Pirates.",
							constant = "CAN_BE_LOOTED_FROM_PIRATES",
							export = true,
							text = {
								en = "Can be looted from Pirates.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可从海盗身上拾取。",
								-- TODO: tw = "",
							},
						}),
						["crs"] = {
							229190,	-- Bert and Benny
							229171,	-- Bicephalic Bill
							228583,	-- Chef Chum Platter
							229189,	-- Finny Four-Eyes
							228582,	-- First Mate Shellshock
							228580,	-- Plank-Master Bluebelly
							227644,	-- Spare-Head Ed
							229169,	-- Timmy Two-Tongue
							229168,	-- Twin-Dome Doug
						}
					}),
					n(228582, {	-- First Mate Shellshock
						["coords"] = {
							{ 60.2, 69.6, SIREN_ISLE, },
							{ 61.2, 71.8, SIREN_ISLE, },
						},
						["groups"] = {
							i(228621),	-- Bilge Rat Supply Key
						},
					}),
				}),
			},
		}),
	}),
}));
