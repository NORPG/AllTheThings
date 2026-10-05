-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.LEGION, {
	header(HEADERS.Spell, 243025, bubbleDownSelf({ ["timeline"] = { ADDED_7_2_0 } }, {	-- Riddler's Mind-Worm
		["description"] = createLocalizationString({
			readable = "***'Show All Trackable Things' is required to see all the steps.***\n\nBelow is a detailed explanation on how to obtain the Riddler's Mind-Worm mount.\r\rNote: Progress on this will be reset each week, so do make sure to complete it in one reset.",
			constant = "SHOW_ALL_TRACKABLE_THINGS_IS_REQUIRED_TO_SEE",
			export = true,
			text = {
				en = "***'Show All Trackable Things' is required to see all the steps.***\n\nBelow is a detailed explanation on how to obtain the Riddler's Mind-Worm mount.\r\rNote: Progress on this will be reset each week, so do make sure to complete it in one reset.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须开启“显示所有可追踪事物”才能看到所有步骤。***\n\n以下是获得谜语人的灵蛇坐骑的详细说明。\n\n注意：该进度每周都会重置，所以请务必在一次重置内完成。",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = .7,
		["displayID"] = 74314,
		["groups"] = {
			o(148502, {	-- Step 1: Page 9
				["model"] = 305393,
				["questID"] = 45470,
				["coord"] = { 48.8, 42.1, LEGION_DALARAN },
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 1:|r We will begin in |cFFFFD700Dalaran|r. Head to the |cFFFFD700Legerdemain Lounge|r at |cFFFFFFFF48.80, 42.10|r. |cFFFFD700Page 9|r will be on the third shelf of the bookcase. Click this to continue. The page reads...\n\n|cFFFFFFFF...of sea, spirit and self...|r",
					constant = "CFFFFFFFFSTEP_1_R_WE_WILL_BEGIN_IN",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 1:|r We will begin in |cFFFFD700Dalaran|r. Head to the |cFFFFD700Legerdemain Lounge|r at |cFFFFFFFF48.80, 42.10|r. |cFFFFD700Page 9|r will be on the third shelf of the bookcase. Click this to continue. The page reads...\n\n|cFFFFFFFF...of sea, spirit and self...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 我们将从|cFFFFD700达拉然|r开始。前往|cFFFFFFFF48.80, 42.10|r的|cFFFFD700魔术旅馆|r。|cFFFFD700第 9 页|r会在书架的第三层。点击它以继续。页面上写着……\n\n|cFFFFFFFF……海洋、灵魂与自我……|r",
						-- TODO: tw = "",
					},
				}),
			}),
			o(209270, {	-- Step 2: Page 78
				["model"] = 305393,
				["questID"] = 47207,
				["coord"] = { 49.2, 34.0, DUSKWOOD },
				["sourceQuest"] = 45470,	-- Step 1: Page 9
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 2:|r This step will take us to |cFFFFD700Duskwood|r. Head to |cFFFFFFFF49.25, 34.01|r. |cFFFFD700Page 78|r is found on the table beside the moonwell. Click this to continue. The page reads...\n\n|cFFFFFFFF...first of the lords to fall...|r",
					constant = "CFFFFFFFFSTEP_2_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 2:|r This step will take us to |cFFFFD700Duskwood|r. Head to |cFFFFFFFF49.25, 34.01|r. |cFFFFD700Page 78|r is found on the table beside the moonwell. Click this to continue. The page reads...\n\n|cFFFFFFFF...first of the lords to fall...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 此步骤将带我们去|cFFFFD700暮色森林|r。前往|cFFFFFFFF49.25, 34.01|r。|cFFFFD700第 78 页|r在月井旁的桌子上。点击它以继续。页面上写着……\n\n|cFFFFFFFF……首位陨落的领主……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(245216, {	-- Step 3: Page 161
				["model"] = 305393,
				["questID"] = 47208,
				["coord"] = { 47.3, 78.1, MOUNT_HYJAL },	-- Firelands
				["sourceQuest"] = 47207,	-- Step 2: Page 78
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 3:|r This step will take us to |cFFFFD700Firelands|r. |cFFFFD700Page 161|r will be found on the left rear side of the |cFFFFD700Ragnaros|r platform. Click this to continue. The page reads...\n\n|cFFFFFFFF...the wind, the eye...|r",
					constant = "CFFFFFFFFSTEP_3_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 3:|r This step will take us to |cFFFFD700Firelands|r. |cFFFFD700Page 161|r will be found on the left rear side of the |cFFFFD700Ragnaros|r platform. Click this to continue. The page reads...\n\n|cFFFFFFFF...the wind, the eye...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 此步骤将带我们去|cFFFFD700火焰之地|r。|cFFFFD700第 161 页|r将在|cFFFFD700拉格纳罗斯|r平台的左后侧。点击它以继续。页面上写着……\n\n|cFFFFFFFF……风，眼睛……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(251564, {	-- Step 4: Page 655
				["model"] = 305393,
				["questID"] = 47209,
				["coord"] = { 70.4, 78.1, ULDUM },
				["sourceQuest"] = 47208,	-- Step 3: Page 161
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 4:|r This step will take us to |cFFFFD700Uldum|r. Head to |cFFFFFFFF70.44, 78.11|r. |cFFFFD700Page 655|r will be between the two small trees. Click this to continue. The page reads...\n\n|cFFFFFFFF...the plume, the tomb, a scarab moon...|r",
					constant = "CFFFFFFFFSTEP_4_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 4:|r This step will take us to |cFFFFD700Uldum|r. Head to |cFFFFFFFF70.44, 78.11|r. |cFFFFD700Page 655|r will be between the two small trees. Click this to continue. The page reads...\n\n|cFFFFFFFF...the plume, the tomb, a scarab moon...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 4 步：|r 此步骤将带我们去|cFFFFD700奥丹姆|r。前往|cFFFFFFFF70.44, 78.11|r。|cFFFFD700第 655 页|r将在两棵小树之间。点击它以继续。页面上写着……\n\n|cFFFFFFFF……羽毛，陵墓，圣甲虫之月……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(220821, {	-- Step 5: Page 845
				["model"] = 305393,
				["questID"] = 47210,
				["coord"] = { 72.4, 44.3, VALE_OF_ETERNAL_BLOSSOMS },	-- Siege of Orgrimmar
				["sourceQuest"] = 47209,	-- Step 4: Page 655
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 5:|r This step will take us to |cFFFFD700Siege of Orgrimmar|r. This does not spawn on LFR. Head to the |cFFFFD700Sha of Pride|r room. |cFFFFD700Page 845|r is found in the far back left corner of the room (southwest on the minimap). Click this to continue. The page reads...\n\n|cFFFFFFFF...in snow, sand, and stone...|r",
					constant = "CFFFFFFFFSTEP_5_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 5:|r This step will take us to |cFFFFD700Siege of Orgrimmar|r. This does not spawn on LFR. Head to the |cFFFFD700Sha of Pride|r room. |cFFFFD700Page 845|r is found in the far back left corner of the room (southwest on the minimap). Click this to continue. The page reads...\n\n|cFFFFFFFF...in snow, sand, and stone...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 5 步：|r 此步骤将带我们去|cFFFFD700决战奥格瑞玛|r。它不会在随机团队中刷新。前往|cFFFFD700傲之煞|r的房间。|cFFFFD700第 845 页|r位于房间最靠后的左角（小地图上的西南方）。点击它以继续。页面上写着……\n\n|cFFFFFFFF……在雪、沙与石中……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(220820, {	-- Step 6: Page 1127
				["model"] = 305393,
				["questID"] = 47211,
				["coords"] = {
					{ 22.9, 64.4, CAVERNS_OF_TIME },	-- Well of Eternity Entrance
					{ 64.7, 49.9, TANARIS },	-- Caverns of Time Entrance
				},
				["sourceQuest"] = 47210,	-- Step 5: Page 845
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 6:|r This step will take us to the |cFFFFD700Well of Eternity|r instance in |cFFFFD700Caverns of Time|r. Kill the first 2 bosses. Take the drake and when you are dropped off walk to the left to the stone stairs. |cFFFFD700Page 1127|r will be on the bottom stair next to a large stone divider. Click this to continue. The page reads...\n\n|cFFFFFFFF...behold the battle, unblinking...|r",
					constant = "CFFFFFFFFSTEP_6_R_THIS_STEP_WILL_TAKE_US_TO_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 6:|r This step will take us to the |cFFFFD700Well of Eternity|r instance in |cFFFFD700Caverns of Time|r. Kill the first 2 bosses. Take the drake and when you are dropped off walk to the left to the stone stairs. |cFFFFD700Page 1127|r will be on the bottom stair next to a large stone divider. Click this to continue. The page reads...\n\n|cFFFFFFFF...behold the battle, unblinking...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 6 步：|r 此步骤将带我们去|cFFFFD700时光之穴|r中的|cFFFFD700永恒之井|r副本。击杀前 2 名首领。骑上龙，被放下后向左走到石阶处。|cFFFFD700第 1127 页|r会在最下面一级台阶上，紧挨着一块大石块隔断。点击它以继续。页面上写着……\n\n|cFFFFFFFF……凝视战斗，一眨不眨……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(19023, {	-- Step 7: Page 2351
				["model"] = 305393,
				["questID"] = 47212,
				["coord"] = { 34.6, 50.9, KUN_LAI_SUMMIT },
				["sourceQuest"] = 47211,	-- Step 6: Page 1127
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 7:|r This step will take us to |cFFFFD700Kun-Lai Summit|r near the |cFFFFD700Shado-Pan Monastery|r. Head to |cFFFFFFFF34.61, 50.88|r. |cFFFFD700Page 2351|r will be between the statue's paws on the platform. Click this to continue. The page reads...\n\n|cFFFFFFFF...bejeweled watcher...|r",
					constant = "CFFFFFFFFSTEP_7_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 7:|r This step will take us to |cFFFFD700Kun-Lai Summit|r near the |cFFFFD700Shado-Pan Monastery|r. Head to |cFFFFFFFF34.61, 50.88|r. |cFFFFD700Page 2351|r will be between the statue's paws on the platform. Click this to continue. The page reads...\n\n|cFFFFFFFF...bejeweled watcher...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 7 步：|r 此步骤将带我们去|cFFFFD700影踪禅院|r附近的|cFFFFD700昆莱山|r。前往|cFFFFFFFF34.61, 50.88|r。|cFFFFD700第 2351 页|r将在平台上雕像的爪子之间。点击它以继续。页面上写着……\n\n|cFFFFFFFF……镶满珠宝的守望者……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(244678, {	-- Step 8: Page 5555
				["model"] = 305393,
				["questID"] = 47213,
				["coord"] = { 76.4, 53.6, ULDUM },
				["sourceQuest"] = 47212,	-- Step 7: Page 2351
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 8:|r This step will take us to |cFFFFD700Uldum|r. Head to |cFFFFFFFF76.45, 53.67|r. |cFFFFD700Page 5555|r will be on the platform slightly offcenter in front of the left foot of the statue. Click this to continue. The page reads...\n\n|cFFFFFFFF...ray of sunshine...|r",
					constant = "CFFFFFFFFSTEP_8_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 8:|r This step will take us to |cFFFFD700Uldum|r. Head to |cFFFFFFFF76.45, 53.67|r. |cFFFFD700Page 5555|r will be on the platform slightly offcenter in front of the left foot of the statue. Click this to continue. The page reads...\n\n|cFFFFFFFF...ray of sunshine...|r",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 8 步：|r 此步骤将带我们去|cFFFFD700奥丹姆|r。前往|cFFFFFFFF76.45, 53.67|r。|cFFFFD700第 5555 页|r将在雕像左脚前方略微偏离中心的平台上。点击它以继续。页面上写着……\n\n|cFFFFFFFF……一缕阳光……|r",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
			}),
			o(269830, {	-- Step 9: Gift of the Mind-Seekers
				["model"] = 942865,
				["questID"] = 47214,
				["coord"] = { 30.5, 27.5, WESTFALL },
				["sourceQuest"] = 47213,	-- Step 8: Page 5555
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 9:|r This step will take us to |cFFFFD700Westfall|r. Head to |cFFFFFFFF30.53, 27.56|r. |cFFFFD700Gift of the Mind-Seekers|r will be on the ground here in a broken boat. Click this to obtain your mount. Congratulations on getting the |cFFFFD700Riddler's Mind-Worm|r.\n\nWe would like to thank the |cFFFFD700Secret Finding Discord|r again for solving this puzzle.",
					constant = "CFFFFFFFFSTEP_9_R_THIS_STEP_WILL_TAKE_US_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 9:|r This step will take us to |cFFFFD700Westfall|r. Head to |cFFFFFFFF30.53, 27.56|r. |cFFFFD700Gift of the Mind-Seekers|r will be on the ground here in a broken boat. Click this to obtain your mount. Congratulations on getting the |cFFFFD700Riddler's Mind-Worm|r.\n\nWe would like to thank the |cFFFFD700Secret Finding Discord|r again for solving this puzzle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 9 步：|r 此步骤将带我们去|cFFFFD700西部荒野|r。前往|cFFFFFFFF30.53, 27.56|r。|cFFFFD700寻心者的礼物|r将在这里一艘破船中的地上。点击它以获得你的坐骑。恭喜你获得|cFFFFD700解谜者的心智之虫|r。\n\n我们想再次感谢|cFFFFD700秘密发现 Discord|r解开了这个谜题。",
						-- TODO: tw = "",
					},
				}),
				["isWeekly"] = true,
				["groups"] = { i(147835) },	-- Riddler's Mind Worm (MOUNT!)
			}),
		},
	})),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, {
	header(HEADERS.Spell, 243025, bubbleDownSelf({ ["timeline"] = { ADDED_7_2_0 } }, {	-- Riddler's Mind-Worm
		q(47215),	-- Tracking Quest (Looted Riddler's Mind Worm)
	})),
}));
