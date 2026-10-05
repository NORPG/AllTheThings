---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_1_0 } }, {
	m(KORTHIA, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(179769, {	-- Consumption
				["description"] = createLocalizationString({
					readable = "Only gives daily kill and achievement credit when it is in Rare or Rare Elite form.\n\nWhen it spawns, there is a zonewide announcement: |cFFf73f3fMawsworn Ruiner yells: Soon it shall feed off the Maw Walkers!|r",
					constant = "ONLY_GIVES_DAILY_KILL_AND_ACHIEVEMENT_CREDIT",
					export = true,
					text = {
						en = "Only gives daily kill and achievement credit when it is in Rare or Rare Elite form.\n\nWhen it spawns, there is a zonewide announcement: |cFFf73f3fMawsworn Ruiner yells: Soon it shall feed off the Maw Walkers!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅当它处于稀有或稀有精英形态时才给予每日击杀和成就进度。\n\n刷新时会有全区域公告：|cFFf73f3f冥誓毁灭者喊道：很快它就能以噬渊行者们为食了！|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					179755,	-- Consumption (Rare, non-Elite version)
					179768,	-- Consumption (Rare Elite version)
				},
				["coord"] = { 51.1, 41.7, KORTHIA },
				["questID"] = 64243,
				["groups"] = {
					i(187402),	-- All-Consuming Loop
					i(187245),	-- Death-Enveloped Spires
					i(187246),	-- Death-Enveloped Pauldrons
					i(187247),	-- Death-Enveloped Shoulder Spikes
				},
			}),
			n(179913, {	-- Deadsoul Hatcher
				["description"] = createLocalizationString({
					readable = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Deadsoul Hatcher breaks into Korthia from the Rift!|r",
					constant = "REQUIRES_SOMEONE_TO_ENTER_THE_RIFT_AND_CLICK",
					export = true,
					text = {
						en = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Deadsoul Hatcher breaks into Korthia from the Rift!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要有人进入裂隙并点击该稀有怪，此时它会将玩家拉出到刻希亚的普通位面。\n\n当该稀有怪转移到刻希亚的普通位面后，会有全区域公告：|cFFff8040死魂孵化者从裂隙闯入刻希亚！|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 59.2, 52.0, KORTHIA },
				["questID"] = 64285,
				["groups"] = {
					i(187401),	-- Band of the Shaded Rift
					i(187396),	-- Girdle of the Deadsoul
				},
			}),
			n(177903, {	-- Dominated Protector
				["coord"] = { 51.9, 20.9, KORTHIA },
				["questID"] = 63830,
				["groups"] = {
					i(187390),	-- Dominated Protector's Helm
				},
			}),
			n(180014, {	-- Escaped Wilderling
				["description"] = createLocalizationString({
					readable = "Requires a |cFFA330C9Night Fae|r to start.\n\nWhen it spawns, there is a zonewide announcement: |cFFff8040Escaped Wilderling roars defiantly in the distance.|r",
					constant = "REQUIRES_A_CFFA330C9NIGHT_FAE_R_TO_START_WHEN",
					export = true,
					text = {
						en = "Requires a |cFFA330C9Night Fae|r to start.\n\nWhen it spawns, there is a zonewide announcement: |cFFff8040Escaped Wilderling roars defiantly in the distance.|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一名|cFFA330C9法夜|r成员才能开始。\n\n它刷新时会有全区域公告：|cFFff8040逃脱的荒野幼兽在远处发出挑衅的咆哮。|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 180009 },	-- Alluring Drum
				["coord"] = { 33.1, 39.5, KORTHIA },
				["questID"] = 64320,
				["groups"] = {
					i(187423),	-- Legend of the Animaswell
					i(187278, {	-- Talon-Pierced Mawsworn Lockbox
						i(187395),	-- Reinforced Stygian Spaulders
					}),
					i(187281),	-- Wilderling Saddle
				},
			}),
			n(180042, {	-- Fleshwing
				["description"] = createLocalizationString({
					readable = "Help Cadaverous, Dregs, and Lurik burn necromancers' corpses until they summon the rare.\n\nRequires a |cFF40bf40Necrolord|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fCadaverous yells: Search every crevice for the necromancers' corpses!|r",
					constant = "HELP_CADAVEROUS_DREGS_AND_LURIK_BURN",
					export = true,
					text = {
						en = "Help Cadaverous, Dregs, and Lurik burn necromancers' corpses until they summon the rare.\n\nRequires a |cFF40bf40Necrolord|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fCadaverous yells: Search every crevice for the necromancers' corpses!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "帮助卡达维罗斯、泥仆和卢里克焚烧死灵法师的尸体，直到他们召唤出稀有怪。\n\n需要一名|cFF40bf40通灵领主|r来开始。事件开始时会有全区域公告：|cFFf73f3f卡达维罗斯喊道：搜遍每个缝隙，找出死灵法师的尸体！|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					180079,	-- Cadaverous
					180064,	-- Corpse Heap
					180057,	-- Restless Necromancer
				},
				["coord"] = { 59.7, 43.3, KORTHIA },
				["questID"] = 64349,
				["groups"] = {
					i(187424),	-- Legend of the Animaswell
					i(187372),	-- Miasma Filtering Headpiece
					i(187181, bubbleDownSelf({ ["customCollect"] = "SL_COV_NEC" }, {	-- Small Corpsefly Egg
						i(187182, {	-- Hatching Corpsefly Egg
							i(186489),	-- Lord of the Corpseflies (MOUNT!)
						}),
					})),
				},
			}),
			n(179472, {	-- Konthrogz the Obliterator
				["description"] = createLocalizationString({
					readable = "Can spawn next to other rares when they die. Defeat the adds that emerge from the portal, and eventually the rare will appear.\n\nWhen the portal spawns, there is a zonewide announcement: |cFFff8040A massive devourer tears an opening into Korthia.|r",
					constant = "CAN_SPAWN_NEXT_TO_OTHER_RARES_WHEN_THEY_DIE",
					export = true,
					text = {
						en = "Can spawn next to other rares when they die. Defeat the adds that emerge from the portal, and eventually the rare will appear.\n\nWhen the portal spawns, there is a zonewide announcement: |cFFff8040A massive devourer tears an opening into Korthia.|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "其他稀有怪死亡时可能在其旁边刷新。击败从传送门中涌出的增援，稀有怪最终就会出现。\n\n传送门刷新时会有全区域公告：|cFFff8040一个巨大的吞噬者撕开了通往刻希亚的裂口。|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 179464 },	-- Devouring Tear
				["questID"] = 64246,
				["groups"] = {
					i(187375),	-- Bound Worldeater Tendrils
					i(187384),	-- Konthrogz's Scaled Handguards
					i(187183),	-- Rampaging Mauler (MOUNT!)
					i(187397),	-- Vambraces of the In-Between
					i(187378),	-- Visage of the Obliterator
				},
			}),
			n(179108, {	-- Kroke the Tormented
				["description"] = createLocalizationString({
					readable = "Kill |cFF883325Tormented Demolishers|r for a chance to spawn Kroke.\n\nIf the two on the surface are not up, there is a third Demolisher inside the cave in the bottom-left room.\n\nWhen it spawns, there is a zonewide announcement: |cFFff8040Kroke the Tormented roars triumphantly.|r",
					constant = "KILL_CFF883325TORMENTED_DEMOLISHERS_R_FOR_A",
					export = true,
					text = {
						en = "Kill |cFF883325Tormented Demolishers|r for a chance to spawn Kroke.\n\nIf the two on the surface are not up, there is a third Demolisher inside the cave in the bottom-left room.\n\nWhen it spawns, there is a zonewide announcement: |cFFff8040Kroke the Tormented roars triumphantly.|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀|cFF883325饱受折磨的破坏者|r，有几率刷出克罗克。\n\n如果地表的两只没有刷新，洞穴内左下角的房间里还有第三只破坏者。\n\n它刷新时会有一条全区域公告：|cFFff8040饱受折磨的克罗克发出胜利的咆哮。|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 179029 },	-- Tormented Demolisher
				["coords"] = {
					{ 59.8, 37.5, KORTHIA },
					{ 63.0, 35.8, KORTHIA },
				},
				["questID"] = 64428,
				["groups"] = {
					i(187248),	-- Kroke's Gleaming Spaulders
					i(187250),	-- Kroke's Wingspiked Pauldrons
					i(187394),	-- Tormented Giant's Legplates
				},
			}),
			n(179684, {	-- Malbog
				["description"] = createLocalizationString({
					readable = "Speak to Caretaker Kah-Kay at Keeper's Respite to enlist the help of Kah-Bear. Follow the footprints all the way to your prey, and summon it by clicking on the |cFFFFFFFFFleshy Remains|r.",
					constant = "SPEAK_TO_CARETAKER_KAH_KAY_AT_KEEPER_S_RESPITE",
					export = true,
					text = {
						en = "Speak to Caretaker Kah-Kay at Keeper's Respite to enlist the help of Kah-Bear. Follow the footprints all the way to your prey, and summon it by clicking on the |cFFFFFFFFFleshy Remains|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在守护者的憩息处与看护者卡凯交谈，以取得卡熊的帮助。沿着脚印一路追踪到你的猎物，然后点击 |cFFFFFFFF血肉残骸|r 将其召唤出来。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 179729 },	-- Caretaker Kah-Kay
				["coords"] = {
					{ 60.6, 23.1, KORTHIA },
					{ 44.3, 29.5, KORTHIA },
				},
				["provider"] = { "o", 369181 },	-- Fleshy Remains
				["questID"] = 64233,
				["groups"] = {
					i(186645),	-- Crimson Shardhide (MOUNT!)
					i(187377),	-- Malbog's Paws
				},
			}),
			n(179931, {	-- Relic Breaker Krelva
				["description"] = createLocalizationString({
					readable = "Use the grapple points to access the rare and chase her as she evades you.\n\nWhen the rare has been pulled, there is a zonewide announcement: |cFFff4040Relic Breaker Krelva yells: Not now, fool!  I am searching for something...|r",
					constant = "USE_THE_GRAPPLE_POINTS_TO_ACCESS_THE_RARE_AND",
					export = true,
					text = {
						en = "Use the grapple points to access the rare and chase her as she evades you.\n\nWhen the rare has been pulled, there is a zonewide announcement: |cFFff4040Relic Breaker Krelva yells: Not now, fool!  I am searching for something...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用抓钩点接近这只稀有生物，并在她躲避你时追赶她。\n\n当该稀有生物被拉到后，会出现一条全区公告：|cFFff4040遗物破坏者克雷尔瓦喊道：现在不行，蠢货！我正在寻找某样东西……|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 22.8, 42.6, KORTHIA },
				["questID"] = 64291,
				["groups"] = {
					i(187403),	-- Relic Breaker's Drape
				},
			}),
			n(180160, {	-- Reliwik the Defiant
				["description"] = createLocalizationString({
					readable = "Click the |cFFFFFFFFUncorrupted Razorwing Egg|r to draw the attention of the rare.",
					constant = "CLICK_THE_CFFFFFFFFUNCORRUPTED_RAZORWING_EGG_R",
					export = true,
					text = {
						en = "Click the |cFFFFFFFFUncorrupted Razorwing Egg|r to draw the attention of the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击|cFFFFFFFF未被腐蚀的剃刀翼蛋|r以吸引该稀有怪的注意。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "o", 369435 },	-- Uncorrupted Razorwing Egg
				["coord"] = { 56.3, 66.2, KORTHIA },
				["questID"] = 64455,
				["groups"] = {
					i(187388),	-- Barbed Scale Cinch
					i(186652),	-- Garnet Razorwing (MOUNT!)
				},
			}),
			n(179608, {	-- Screaming Shade
				["description"] = createLocalizationString({
					readable = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Screaming Shade breaks into Korthia from the Rift!|r",
					constant = "REQUIRES_SOMEONE_TO_ENTER_THE_RIFT_AND_CLICK_2",
					export = true,
					text = {
						en = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Screaming Shade breaks into Korthia from the Rift!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要有人进入裂隙并点击该稀有怪，此时它会将玩家拉出到刻希亚的普通位面。\n\n当该稀有怪转移到刻希亚的普通位面后，会有全区域公告：|cFFff8040尖啸暗影从裂隙闯入刻希亚！|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 44.6, 42.9, KORTHIA },
				["questID"] = 64263,
				["groups"] = {
					i(187400),	-- Mantle of Screaming Shadows
					i(187362),	-- Stinging Shadow Screamer
				},
			}),
			n(179911, {	-- Silent Soulstalker
				["description"] = createLocalizationString({
					readable = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Silent Soulstalker breaks into Korthia from the Rift!|r",
					constant = "REQUIRES_SOMEONE_TO_ENTER_THE_RIFT_AND_CLICK_3",
					export = true,
					text = {
						en = "Requires someone to enter the Rift and click the rare, at which point it will pull the player out into the normal phase of Korthia.\n\nWhen the rare has shifted into the normal Korthia phase, there is a zonewide announcement: |cFFff8040Silent Soulstalker breaks into Korthia from the Rift!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要有人进入裂隙并点击该稀有怪，此时它会将玩家拉出到刻希亚的普通位面。\n\n当该稀有怪转移到刻希亚的普通位面后，会有全区域公告：|cFFff8040寂默的猎魂者从裂隙闯入刻希亚！|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 57.5, 70.2, KORTHIA },
				["questID"] = 64284,
				["groups"] = {
					i(187381),	-- Rift-Touched Bindings
					i(187383),	-- Silent Soulstalker Sabatons
				},
			}),
			n(179985, {	-- Stygian Stonecrusher
				["description"] = createLocalizationString({
					readable = "Speak to Drippy, and then defend the NPCs as they repair the Broken Gatecrasher.\n\nRequires a |cFFfe040fVenthyr|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fDrippy yells: For Sinfall!|r",
					constant = "SPEAK_TO_DRIPPY_AND_THEN_DEFEND_THE_NPCS_AS",
					export = true,
					text = {
						en = "Speak to Drippy, and then defend the NPCs as they repair the Broken Gatecrasher.\n\nRequires a |cFFfe040fVenthyr|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fDrippy yells: For Sinfall!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与滴滴交谈，然后在 NPC 修理损坏的破门者时保护他们。\n\n需要一位 |cFFfe040f温西尔|r 才能开始。事件开始时会有全区域公告：|cFFf73f3f滴滴大喊：为了堕罪堡！|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					179974,	-- Drippy
					179969,	-- Broken Gatecrasher [Vignette]
				},
				["coord"] = { 46.3, 79.7, KORTHIA },
				["questID"] = 64313,
				["groups"] = {
					i(187283),	-- Gravewing Crystal
					i(187428),	-- Legend of the Animaswell
					i(187386),	-- Stygian Crystal Studded Legguards
				},
			}),
			n(179760, {	-- Towering Exterminator
				["description"] = createLocalizationString({
					readable = "Can spawn next to other rares when they die. Defeat the adds that emerge from the portal, and eventually the rare will appear.\n\nWhen the portal spawns, there is a zonewide announcement: |cFFff8040A powerful mawsworn opens a portal into Korthia.|r",
					constant = "CAN_SPAWN_NEXT_TO_OTHER_RARES_WHEN_THEY_DIE_2",
					export = true,
					text = {
						en = "Can spawn next to other rares when they die. Defeat the adds that emerge from the portal, and eventually the rare will appear.\n\nWhen the portal spawns, there is a zonewide announcement: |cFFff8040A powerful mawsworn opens a portal into Korthia.|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "其他稀有怪死亡时可能在其旁边刷新。击败从传送门中涌出的增援，稀有怪最终就会出现。\n\n传送门刷新时会有全区域公告：|cFFff8040一个强大的渊誓者打开了通往刻希亚的传送门。|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					179759,	-- Mawsworn Portal [Vignette]
				},
				["questID"] = 64245,
				["groups"] = {
					i(187035),	-- Cold Burden of the Damned
					i(187242),	-- Exterminator's Crest of the Damned
					i(187382),	-- Mawsworn Exterminator's Hauberk
					i(187376),	-- Mawsworn Lieutenant's Treads
					i(187392),	-- Sabatons of the Towering Construct
					i(187373),	-- Soul-Enveloping Leggings
					i(187241),	-- Watchful Eye of the Damned
				},
			}),
			n(180162, {	-- Ve'rayn
				["description"] = createLocalizationString({
					readable = "Click on the |cFFFFFFFFPlanted Veilstaff|r and answer Ve'rayn's questions. Eventually, she will attack.",
					constant = "CLICK_ON_THE_CFFFFFFFFPLANTED_VEILSTAFF_R_AND",
					export = true,
					text = {
						en = "Click on the |cFFFFFFFFPlanted Veilstaff|r and answer Ve'rayn's questions. Eventually, she will attack.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击|cFFFFFFFF插在地上的面纱法杖|r并回答维拉恩的问题。最终她会发起攻击。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 32.5, 43.0, KORTHIA },
					{ 43.3, 57.7, KORTHIA },	-- cave entrance
					{ 43.5, 67.5, KORTHIA },
					{ 49.0, 29.0, KORTHIA },
					{ 61.4, 57.8, KORTHIA },
				},
				["questID"] = 64457,
				["groups"] = {
					i(187404),	-- Cartel Ve Amulet
					i(187264),	-- Ve'rayn's Head
					i(187369),	-- Ve'rayn's Formal Robes
				},
			}),
			n(180032, {	-- Wild Worldcracker
				["description"] = createLocalizationString({
					readable = "Escort Popo as she helps all her friends, and eventually she will summon the rare. She patrols from east to west.\n\nRequires a |cFF516bfeKyrian|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fPopo yells: Help is on the way, friends!|r",
					constant = "ESCORT_POPO_AS_SHE_HELPS_ALL_HER_FRIENDS_AND",
					export = true,
					text = {
						en = "Escort Popo as she helps all her friends, and eventually she will summon the rare. She patrols from east to west.\n\nRequires a |cFF516bfeKyrian|r to start. When the event begins, there is a zonewide announcement: |cFFf73f3fPopo yells: Help is on the way, friends!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "护送波波，帮她帮助她所有的朋友，最终她会召唤出稀有生物。她自东向西巡逻。\n\n需要一名|cFF516bfe格里恩|r才能开始。事件开始时会有区域公告：|cFFf73f3f波波喊道：朋友们，援助马上就到！|r",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 180028 },	-- Popo
				["coords"] = {
					{ 56.8, 32.6, KORTHIA },	-- start
					{ 46.9, 35.1, KORTHIA },	-- end
				},
				["questID"] = 64338,
				["groups"] = {
					i(187380),	-- Devourer Hide Belt
					i(187282),	-- Intact Aquilon Core
					i(187426),	-- Legend of the Animaswell
					i(187176),	-- Vesper of Harmony (TOY!)
				},
			}),
			n(179859, {	-- Xyraxz the Unknowable
				["description"] = createLocalizationString({
					readable = "Requires someone with Tier 3 Archivist's Codex reputation to repair the teleportation pad.\n\nOnce repaired, there is a zonewide announcement: |cFFff8040[Name] has repaired the ancient teleporter to the Chamber of Wisdom!|r",
					constant = "REQUIRES_SOMEONE_WITH_TIER_3_ARCHIVIST_S_CODEX",
					export = true,
					text = {
						en = "Requires someone with Tier 3 Archivist's Codex reputation to repair the teleportation pad.\n\nOnce repaired, there is a zonewide announcement: |cFFff8040[Name] has repaired the ancient teleporter to the Chamber of Wisdom!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一名档案员法典声望达到 3 级的玩家来修复传送台。\n\n修复后会有全区域公告：|cFFff8040[Name] 已修复通往智慧之厅的远古传送器！|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 45.0, 35.5, KORTHIA },
				["questID"] = 64278,
				["cost"] = { { "i", 186718, 1 } },	-- Teleporter Repair Kit
				["groups"] = {
					i(187104),	-- Obelisk of Dark Tidings
					i(187387),	-- Pauldrons of the Unknown Beyond
					i(187368),	-- Xyraxz's Controlling Rod
				},
			}),
			n(179802, {	-- Yarxhov the Pillager
				["description"] = createLocalizationString({
					readable = "Requires someone with Tier 3 Archivist's Codex reputation to repair the teleportation pad.\n\nOnce repaired, there is a zonewide announcement: |cFFff8040[Name] has repaired the ancient teleporter to the Chamber of Knowledge!|r",
					constant = "REQUIRES_SOMEONE_WITH_TIER_3_ARCHIVIST_S_CODEX_2",
					export = true,
					text = {
						en = "Requires someone with Tier 3 Archivist's Codex reputation to repair the teleportation pad.\n\nOnce repaired, there is a zonewide announcement: |cFFff8040[Name] has repaired the ancient teleporter to the Chamber of Knowledge!|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要一名档案员法典声望达到 3 级的玩家来修复传送台。\n\n修复后会有全区域公告：|cFFff8040[Name] 已修复通往知识之厅的远古传送器！|r",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 39.3, 52.4, KORTHIA },
				["questID"] = 64257,
				["cost"] = { { "i", 186718, 1 } },	-- Teleporter Repair Kit
				["groups"] = {
					i(187103),	-- Everliving Statuette
					i(187366),	-- Fallen Vault Guardian's Spire
					i(187391),	-- Yarxhov's Rib-Cage
				},
			}),
			n(177336, {	-- Zelnithop
				["description"] = "~L.AT_THE_BOTTOM_OF_THE_CAVE",
				["coord"] = { 30.2, 54.9, KORTHIA },
				["questID"] = 64442,
				["groups"] = {
					i(186542),	-- Korthian Specimen (PET!)
					i(187371),	-- Velvet Gromit Handwraps
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_1_0 } }, {
	m(SHADOWLANDS, {
		m(KORTHIA, {
			n(RARES, {
				q(64572),	-- i think this is a daily lockout for receiving a Soultwining Crescent from a rare (also triggers on treasures)
				q(64699, name(HEADERS.Item, 187327)),	-- popped when looting 48-research item Encrypted Korthian Journal from Fleshwing
				q(64703),	-- popped when looting 48-research item Half-Completed Runeforge Pattern from Xyraxz
			}),
		}),
	}),
})));
