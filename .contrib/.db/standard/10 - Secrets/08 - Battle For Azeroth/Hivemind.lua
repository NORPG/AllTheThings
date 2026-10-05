-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.BFA, {
	header(HEADERS.Item, 156798, bubbleDownSelf({ ["timeline"] = { ADDED_8_0_1 } }, {	-- The Hivemind
		["description"] = createLocalizationString({
			readable = "Below is a detailed explanation on how to obtain The Hivemind mount.\n\n***This secret requires you to have debug mode enabled to see the steps. To enable debug mode right click the ATT icon on the minimap, navigate to the general tab and check the \"|Cff15abffDebug Mode|r |cFFFFFFFF(Show Everything)|r\" box.***",
			constant = "BELOW_IS_A_DETAILED_EXPLANATION_ON_HOW_TO",
			export = true,
			text = {
				en = "Below is a detailed explanation on how to obtain The Hivemind mount.\n\n***This secret requires you to have debug mode enabled to see the steps. To enable debug mode right click the ATT icon on the minimap, navigate to the general tab and check the \"|Cff15abffDebug Mode|r |cFFFFFFFF(Show Everything)|r\" box.***",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "以下是如何获得蜂群思维坐骑的详细说明。\n\n***这个秘密需要你启用调试模式才能看到步骤。要启用调试模式，请右键点击小地图上的 ATT 图标，进入常规标签页，勾选“|Cff15abff调试模式|r |cFFFFFFFF（显示全部）|r”复选框。***",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = 1.1,
		["displayID"] = 88835,
		["groups"] = {
			o(13000000, {	-- Step 1: Purchase Talisman of True Treasure Tracking
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFSTEP 1:|r Purchase |cFFFFD700Talisman of True Treasure Tracking|r. This can be bought from |cFFFFD700Griftah|r in |cFFFFD700Shattrath City|r at |cFFFFFFFF65.6, 69.3|r for 35g\n",
					constant = "CFFFFFFFFSTEP_1_R_PURCHASE_CFFFFD700TALISMAN_OF",
					export = true,
					text = {
						en = "|cFFFFFFFFSTEP 1:|r Purchase |cFFFFD700Talisman of True Treasure Tracking|r. This can be bought from |cFFFFD700Griftah|r in |cFFFFD700Shattrath City|r at |cFFFFFFFF65.6, 69.3|r for 35g\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 购买|cFFFFD700真宝追踪护符|r。可在|cFFFFD700沙塔斯城|r的|cFFFFFFFF65.6, 69.3|r处从|cFFFFD700格里伏塔|r处以 35 金购买\n",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 65.6, 69.3, 594 },	-- Shattrath City
				["groups"] = { i(27944) },	-- Talisman of True Treasure Tracking
			}),
			o(13000001, {	-- Step 2: Equip Talisman
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFSTEP 2:|r You must wear the talisman to see/interact with many objects in this secret.",
					constant = "CFFFFFFFFSTEP_2_R_YOU_MUST_WEAR_THE_TALISMAN_TO",
					export = true,
					text = {
						en = "|cFFFFFFFFSTEP 2:|r You must wear the talisman to see/interact with many objects in this secret.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 你必须佩戴护符才能看到/互动这个秘密中的许多物体。",
						-- TODO: tw = "",
					},
				}),
			}),
			o(13000032, {	-- Step 3: Pick a Monocle (Or Don't!)
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFSTEP 3:|r Hivemind requires a five-man group. Four members must each collect a different monocle before the group can continue with the secret.",
					constant = "CFFFFFFFFSTEP_3_R_HIVEMIND_REQUIRES_A_FIVE_MAN",
					export = true,
					text = {
						en = "|cFFFFFFFFSTEP 3:|r Hivemind requires a five-man group. Four members must each collect a different monocle before the group can continue with the secret.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 蜂巢思维需要一支五人小队。四名成员必须各自收集一枚不同的单片眼镜，队伍才能继续这个秘密。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					header(HEADERS.Item, 156724,    {	-- Blue Crystal Monocle
						["icon"] = 133146,
						["name"] = "Blue Crystal Monocle",
						["description"] = createLocalizationString({
							readable = "Obtaining this monocle requires reading many letters spread around Azeroth.\n\n***You need to interact with all letters in the order listed to progress through the puzzle!***\n",
							constant = "OBTAINING_THIS_MONOCLE_REQUIRES_READING_MANY",
							export = true,
							text = {
								en = "Obtaining this monocle requires reading many letters spread around Azeroth.\n\n***You need to interact with all letters in the order listed to progress through the puzzle!***\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "获得这副单片眼镜需要阅读散落在艾泽拉斯各处的许多信件。\n\n***你必须按照列出的顺序与所有信件互动，才能推进这个谜题！***\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							o(280815, {	-- Letter 1: Shattrath City
								["model"] = 1661948,
								["questID"] = 40397,
								["coord"] = { 65.6, 69.3, SHATTRATH_CITY },	-- Shattrath City
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 1:|r The start of this puzzle is the |cFFFFD700Letter from Ms. Graham|r with a blue aura behind |cFFFFD700Griftah|r, which can be interacted with. Click it. The letter reads...\r\r|cFFFFFFFFThe key Factor in successul Wasp Ignition is a solid Ad campaign.|r\n",
									constant = "CFFFFFFFFLETTER_1_R_THE_START_OF_THIS_PUZZLE_IS",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 1:|r The start of this puzzle is the |cFFFFD700Letter from Ms. Graham|r with a blue aura behind |cFFFFD700Griftah|r, which can be interacted with. Click it. The letter reads...\r\r|cFFFFFFFFThe key Factor in successul Wasp Ignition is a solid Ad campaign.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 1：|r 这个谜题的起点是|cFFFFD700格雷厄姆女士的来信|r，位于|cFFFFD700格里伏塔|r身后、带有蓝色光晕，可以互动。点击它。信上写着……|cFFFFFFFF成功点燃黄蜂的关键因素是一场扎实的广告宣传。|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280836, {	-- Letter 2: Prepfoot Compound, Highmountain
								["model"] = 1661948,
								["questID"] = 40314,
								["coord"] = { 57.4, 27.9, HIGHMOUNTAIN },	-- Prepfoot Compound
								["sourceQuest"] = 40397,	-- Letter 1: Shattrath City
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 2:|r Go to |cFFFFFFFF57.4, 27.9|r in |cFFFFD700Highmountain|r. The |cFFFFD700Letter from Ms. Graham|r is located in one of the tents on the box next to the pumpkin. Click it. The letter reads...\n\n|cFFFFFFFFOf all of Gai's cures for Nature, the most liberating is Death.|r\n",
									constant = "CFFFFFFFFLETTER_2_R_GO_TO_CFFFFFFFF57_4_27_9_R",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 2:|r Go to |cFFFFFFFF57.4, 27.9|r in |cFFFFD700Highmountain|r. The |cFFFFD700Letter from Ms. Graham|r is located in one of the tents on the box next to the pumpkin. Click it. The letter reads...\n\n|cFFFFFFFFOf all of Gai's cures for Nature, the most liberating is Death.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 2：|r 前往|cFFFFD700至高岭|r的|cFFFFFFFF57.4, 27.9|r。|cFFFFD700格雷厄姆女士的来信|r位于其中一个帐篷里，放在南瓜旁的箱子上。点击它。信上写着……\n\n|cFFFFFFFF在盖伊为自然开出的所有解药中，最令人解脱的是死亡。|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280837, {	-- Letter 3: Karazhan (Old)
								["model"] = 1661948,
								["questID"] = 40404,
								["coord"] = { 47.4, 75.0, DEADWIND_PASS },	-- Karazhan
								["maps"] = {
									KARAZHAN,	-- Servant's Quarters
									351,	-- Upper Livery Stables
									352,	-- The Banquet Hall
									353,	-- The Guest Chambers
									354,	-- Opera Hall Balcony
									355,	-- Master's Terrace
									356,	-- Lower Broken Stair
									357,	-- Upper Broken Stair
									358,	-- The Menagerie
									359,	-- Guardian's Library
									360,	-- The Repository
									361,	-- Upper Library
									362,	-- The Celestial Watch
									363,	-- Gamesman's Hall
									364,	-- Medivh's Chambers
									365,	-- The Power Station
									366,	-- Netherspace
								},
								["sourceQuest"] = 40314,	-- Leter 2: Prepfoot Compound, Highmountain
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 3:|r Go to |cFFFFD700Karazhan (Old)|r in |cFFFFD700Deadwind Pass|r. The third letter is located in |cFFFFD700Medivh's Chambers|r, located after the Chess Event, in the staircase leading to Prince Malchezaar. The letter is on the chair Medivh used to write his scrolls and spells, literally the seat of the guardian. Click it. The letter reads...\n\n|cFFFFFFFFI sat Dumbfounded, watching As the most Subtle Rat reached for the cheese a third time in under an hour.|r\n",
									constant = "CFFFFFFFFLETTER_3_R_GO_TO_CFFFFD700KARAZHAN_OLD",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 3:|r Go to |cFFFFD700Karazhan (Old)|r in |cFFFFD700Deadwind Pass|r. The third letter is located in |cFFFFD700Medivh's Chambers|r, located after the Chess Event, in the staircase leading to Prince Malchezaar. The letter is on the chair Medivh used to write his scrolls and spells, literally the seat of the guardian. Click it. The letter reads...\n\n|cFFFFFFFFI sat Dumbfounded, watching As the most Subtle Rat reached for the cheese a third time in under an hour.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 3：|r 前往|cFFFFD700逆风小径|r的|cFFFFD700卡拉赞（旧）|r。第三封信位于|cFFFFD700麦迪文的房间|r，在国际象棋事件之后、通往玛克扎尔王子的楼梯上。信放在麦迪文用来书写卷轴和法术的椅子上，字面意义上就是守护者的座位。点击它。信上写着……\n\n|cFFFFFFFF我目瞪口呆地坐着，看着那只最狡猾的老鼠在一小时内第三次伸手去拿奶酪。|r\n",
										-- TODO: tw = "",
									},
								})
							}),
							o(280838, {	-- Letter 4: Razorfen Downs
								["model"] = 1661948,
								["questID"] = 40252,
								["coord"] = { 45.7, 24.0, THOUSAND_NEEDLES },	-- Razorfen Downs
								["sourceQuest"] = 40404,	-- Letter 3: Karazhan (Old)
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 4:|r Go to |cFFFFD700Razorfen Downs|r in |cFFFFD700Thousand Needles|r. The next |cFFFFD700Letter from Ms. Graham|r is located on a hay box behind the second-to-last boss, |cFFFFD700Death Speaker Blackthorn|r. will spawn on the table. Click it. The note reads...\r\r|cFFFFFFFFMs. Sin will accompany you down The longest Streets Of the underworld.|r\n",
									constant = "CFFFFFFFFLETTER_4_R_GO_TO_CFFFFD700RAZORFEN",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 4:|r Go to |cFFFFD700Razorfen Downs|r in |cFFFFD700Thousand Needles|r. The next |cFFFFD700Letter from Ms. Graham|r is located on a hay box behind the second-to-last boss, |cFFFFD700Death Speaker Blackthorn|r. will spawn on the table. Click it. The note reads...\r\r|cFFFFFFFFMs. Sin will accompany you down The longest Streets Of the underworld.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 4：|r 前往|cFFFFD700千针石林|r的|cFFFFD700剃刀高地|r。下一封|cFFFFD700格雷厄姆女士的来信|r位于倒数第二个首领|cFFFFD700亡语者布莱克松|r身后的干草箱上。会刷新在桌上。点击它。纸条上写着……|cFFFFFFFF辛女士将陪你走过冥界最漫长的街道。|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280842, {	-- Letter 5: Shrine of Aviana, Mount Hyjal
								["model"] = 1661948,
								["questID"] = 40293,
								["coord"] = { 44.3, 47.3, MOUNT_HYJAL },
								["sourceQuest"] = 40252,	-- Letter 4: Razorfen Downs
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 5:|r Go to |cFFFFFFFF44.3, 47.3|r in |cFFFFD700Mount Hyjal|r. The next |cFFFFD700Letter from Ms. Graham|r is on a table at the highest floor of the tree that serves as her shrine. Click it. The note reads...\r\r|cFFFFFFFFThe Elite champions will rule the World with the mightiest F.C.|r\n",
									constant = "CFFFFFFFFLETTER_5_R_GO_TO_CFFFFFFFF44_3_47_3_R",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 5:|r Go to |cFFFFFFFF44.3, 47.3|r in |cFFFFD700Mount Hyjal|r. The next |cFFFFD700Letter from Ms. Graham|r is on a table at the highest floor of the tree that serves as her shrine. Click it. The note reads...\r\r|cFFFFFFFFThe Elite champions will rule the World with the mightiest F.C.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 5：|r 前往|cFFFFD700海加尔山|r的|cFFFFFFFF44.3, 47.3|r。下一封|cFFFFD700格雷厄姆女士的来信|r位于作为她神龛的那棵树最高层的桌子上。点击它。纸条上写着……|cFFFFFFFF精英勇士将凭借最强的 F.C. 统治世界。|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280843, {	-- Letter 6: Ironwall Dam, Icecrown
								["model"] = 1661948,
								["questID"] = 40288,
								["coord"] = { 70.8, 73.3, ICECROWN },
								["sourceQuest"] = 40293,	-- Letter 5: Shrine of Aviana, Mount Hyjal
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 6:|r Go to |cFFFFFFFF70.8, 73.3|r in |cFFFFD700Icecrown|r. The next |cFFFFD700Letter from Ms. Graham|r is on top of a spike at the dam. Click it. The note reads...\r\r|cFFFFFFFFRe: Codex of mastering Sine waves.|r\n",
									constant = "CFFFFFFFFLETTER_6_R_GO_TO_CFFFFFFFF70_8_73_3_R",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 6:|r Go to |cFFFFFFFF70.8, 73.3|r in |cFFFFD700Icecrown|r. The next |cFFFFD700Letter from Ms. Graham|r is on top of a spike at the dam. Click it. The note reads...\r\r|cFFFFFFFFRe: Codex of mastering Sine waves.|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 6：|r 前往|cFFFFD700冰冠冰川|r的|cFFFFFFFF70.8, 73.3|r。下一封|cFFFFD700格雷厄姆女士的来信|r位于水坝上一根尖刺的顶端。点击它。纸条上写着……|cFFFFFFFF主题：精通正弦波的密码书。|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280844, {	-- Letter 7: Niuzao Temple, Townlong Steppes
								["model"] = 1661948,
								["questID"] = 50187,
								["coord"] = { 37.7, 63.0, TOWNLONG_STEPPES },
								["sourceQuest"] = 40288,	-- Letter 6: Ironwall Dam, Icecrown
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFLetter 7:|r Go to |cFFFFFFFF37.7, 63.0|r in |cFFFFD700Townlong Steppes|r. The final |cFFFFD700Letter from Ms. Graham|r is located near a bell on the back part of the temple. Click it. The note reads...\r\r|cFFFFFFFFMice look so sad when they have a Cleft lip.\n\nHoping you succeed,\n~Ana|r\n",
									constant = "CFFFFFFFFLETTER_7_R_GO_TO_CFFFFFFFF37_7_63_0_R",
									export = true,
									text = {
										en = "|cFFFFFFFFLetter 7:|r Go to |cFFFFFFFF37.7, 63.0|r in |cFFFFD700Townlong Steppes|r. The final |cFFFFD700Letter from Ms. Graham|r is located near a bell on the back part of the temple. Click it. The note reads...\r\r|cFFFFFFFFMice look so sad when they have a Cleft lip.\n\nHoping you succeed,\n~Ana|r\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF信件 7：|r 前往|cFFFFD700螳螂高原|r的|cFFFFFFFF37.7, 63.0|r。最后一封|cFFFFD700格雷厄姆女士的来信|r位于神殿后部一口钟的附近。点击它。纸条上写着……|cFFFFFFFF老鼠兔唇时看起来好悲伤。\n\n祝你好运，\n~安娜|r\n",
										-- TODO: tw = "",
									},
								}),
							}),
							o(280845, {	-- Gift from Ms. Graham
								["questID"] = 50181,
								["coord"] = { 27.6, 27.1, BOREAN_TUNDRA },
								["sourceQuest"] = 50187,	-- Letter 7: Niuzao Temple, Townlong Steppes
								["description"] = createLocalizationString({
									readable = "|cFFFFFFFFThe Gift:|r Go to |cFFFFFFFF27.6, 27.1|r in |cFFFFD700Coldarra, Borean Tundra|r. The |cFFFFFFFFBlue Crystal Monocle|r is in a container on the highest Nexus ring.\n",
									constant = "CFFFFFFFFTHE_GIFT_R_GO_TO_CFFFFFFFF27_6_27_1_R",
									export = true,
									text = {
										en = "|cFFFFFFFFThe Gift:|r Go to |cFFFFFFFF27.6, 27.1|r in |cFFFFD700Coldarra, Borean Tundra|r. The |cFFFFFFFFBlue Crystal Monocle|r is in a container on the highest Nexus ring.\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cFFFFFFFF礼物：|r 前往|cFFFFD700北风苔原考达拉|r的|cFFFFFFFF27.6, 27.1|r。|cFFFFFFFF蓝水晶单片眼镜|r位于魔枢最高环上的一个容器中。\n",
										-- TODO: tw = "",
									},
								}),
								["groups"] = { i(156724) },	-- Blue Crystal Monocle
							}),
						},
					}),
					header(HEADERS.Item, 156727,    {	-- Green Crystal Monocle
						["icon"] = 133146,
						["name"] = "Green Crystal Monocle",
						["description"] = createLocalizationString({
							readable = "Go to |cFFFFD700Skyreach|r in |cFFFFD700Spires of Arak|r. Behind the final boss of the instance, |cFFFFD700High Sage Viryx|r, you will find a console that you are able to interact with. Use the four glowing yellow balls to move the sun across the board (the north ball, for instance, makes the sun move up).\n\nThe directions and order in which you must move the sun are:\n\n|cFFFFFFFFRight -> Up -> Down -> Up -> Right -> Right -> Up -> Left -> Down -> Up -> Left -> Down|r\n\nLoot the chest that spawns to obtain the |cFFFFFFFFGreen Crystal Monocle|r\n",
							constant = "GO_TO_CFFFFD700SKYREACH_R_IN_CFFFFD700SPIRES_OF",
							export = true,
							text = {
								en = "Go to |cFFFFD700Skyreach|r in |cFFFFD700Spires of Arak|r. Behind the final boss of the instance, |cFFFFD700High Sage Viryx|r, you will find a console that you are able to interact with. Use the four glowing yellow balls to move the sun across the board (the north ball, for instance, makes the sun move up).\n\nThe directions and order in which you must move the sun are:\n\n|cFFFFFFFFRight -> Up -> Down -> Up -> Right -> Right -> Up -> Left -> Down -> Up -> Left -> Down|r\n\nLoot the chest that spawns to obtain the |cFFFFFFFFGreen Crystal Monocle|r\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "前往|cFFFFD700阿兰卡峰林|r的|cFFFFD700通天峰|r。在副本最终首领|cFFFFD700高阶贤者维里克斯|r身后，你会找到一个可以互动的控制台。使用四个发光的黄色圆球让太阳在棋盘上移动（例如，北侧的圆球会让太阳向上移动）。\n\n你必须移动太阳的方向和顺序如下：\n\n|cFFFFFFFF右 -> 上 -> 下 -> 上 -> 右 -> 右 -> 上 -> 左 -> 下 -> 上 -> 左 -> 下|r\n\n拾取生成的箱子即可获得|cFFFFFFFF绿色水晶单片镜|r\n",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 35.3, 33.6, SPIRES_OF_ARAK },	-- Skyreach
						["groups"] = {
							o(280883, {	-- Sun-Worn Chest
								["questID"] = 50185,
								["groups"] = { i(156727) },	-- Green Crystal Monocle
							}),
						},
					}),
					header(HEADERS.Item, 156725, {	-- Red Crystal Monocle
						["description"] = createLocalizationString({
							readable = "Fish NPCs across Vashj'ir sell sea-themed currencies which need to be exchanged between the various NPCs in order to obtain the currencies required to purchase the |cFFFFD700Red Crystal Monocle|r.\n\nThe currencies expire after a period of time so it is advised that you purchase the items in the order listed.\n",
							constant = "FISH_NPCS_ACROSS_VASHJ_IR_SELL_SEA_THEMED",
							export = true,
							text = {
								en = "Fish NPCs across Vashj'ir sell sea-themed currencies which need to be exchanged between the various NPCs in order to obtain the currencies required to purchase the |cFFFFD700Red Crystal Monocle|r.\n\nThe currencies expire after a period of time so it is advised that you purchase the items in the order listed.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "瓦斯琪尔各处的鱼人 NPC 出售海洋主题的货币，这些货币需要在各个 NPC 之间进行兑换，才能获得购买|cFFFFD700红色水晶单片眼镜|r所需的货币。\n\n这些货币会在一段时间后过期，因此建议按列出的顺序购买物品。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							o(13000002, {	-- Scintillating Murloc Skin Lotion
								["description"] = createLocalizationString({
									readable = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Scintillating Murloc Skin Lotion|r.\n",
									constant = "EXCHANGE_THE_FOLLOWING_ITEMS_WITH_THE_NPC_UNTIL",
									export = true,
									text = {
										en = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Scintillating Murloc Skin Lotion|r.\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "与 NPC 交换以下物品，直到你收到 5 份|cFFFFD700闪烁的鱼人护肤乳|r。\n",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									o(13000003, {	-- Glittergill Glitter
										["description"] = createLocalizationString({
											readable = "Exchange the following items with the NPC until you receive 50 |cFFFFD700Glittergill Glitter|r.\n",
											constant = "EXCHANGE_THE_FOLLOWING_ITEMS_WITH_THE_NPC_UNTIL_2",
											export = true,
											text = {
												en = "Exchange the following items with the NPC until you receive 50 |cFFFFD700Glittergill Glitter|r.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "与 NPC 交换以下物品，直到你收到 50 份|cFFFFD700闪鳃闪光|r。\n",
												-- TODO: tw = "",
											},
										}),
										["groups"] = {
											o(13000004, {	-- Step 1: Seashell
												["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 1:|r Purchase 500 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
													constant = "CFFFFFFFFSTEP_1_R_PURCHASE_500",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 1:|r Purchase 500 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 1 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF44.6, 20.2|r处从|cFFFFD700芬利·莫格顿爵士|r处购买 500 个|cFFFFD700贝壳|r。\n该 NPC 位于地表，在其中一个小岛上的瞭望塔顶。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000005, {	-- Step 2: Cavity-Free Great Shark Tooth
												["coord"] = { 39.9, 77.6, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 2:|r Purchase 100 |cFFFFD700Cavity-Free Great Shark Tooth|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
													constant = "CFFFFFFFFSTEP_2_R_PURCHASE_100_CFFFFD700CAVITY",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 2:|r Purchase 100 |cFFFFD700Cavity-Free Great Shark Tooth|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 2 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF39.9, 77.6|r处从|cFFFFD700易爆紫鳞|r处购买 100 个|cFFFFD700无蛀洞的大鲨鱼牙齿|r。\n该 NPC 在幽光峡谷海床附近游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000006, {	-- Step 3: Razoreel Larva
												["coord"] = { 54.3, 24.5, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 3:|r Purchase 50 |cFFFFD700Razoreel Larva|r from |cFFFFD700Manta Stargazer|r at |cFFFFFFFF54.3, 24.5|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is near the surface, hovering around Shimmering Grotto.\n",
													constant = "CFFFFFFFFSTEP_3_R_PURCHASE_50_CFFFFD700RAZOREEL",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 3:|r Purchase 50 |cFFFFD700Razoreel Larva|r from |cFFFFD700Manta Stargazer|r at |cFFFFFFFF54.3, 24.5|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is near the surface, hovering around Shimmering Grotto.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 3 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF54.3, 24.5|r处从|cFFFFD700蝠鲼观星者|r处购买 50 个|cFFFFD700剃刀鳗幼体|r。\n该 NPC 靠近水面，在闪光石窟周围盘旋。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000007, {	-- Step 4: Well-Fed Doctor Fish
												["coord"] = { 69.0, 47.8, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 4:|r Purchase 250 |cFFFFD700Well Fed Doctor Fish|r from |cFFFFD700Lil' Whaley|r at |cFFFFFFFF69.0, 47.86|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is close to the sea floor, next to the Ruins of Thelserai Temple.\n",
													constant = "CFFFFFFFFSTEP_4_R_PURCHASE_250_CFFFFD700WELL",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 4:|r Purchase 250 |cFFFFD700Well Fed Doctor Fish|r from |cFFFFD700Lil' Whaley|r at |cFFFFFFFF69.0, 47.86|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\nThe NPC is close to the sea floor, next to the Ruins of Thelserai Temple.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 4 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF69.0, 47.86|r处从|cFFFFD700小鲸鱼|r处购买 250 个|cFFFFD700吃饱的医生鱼|r。\n该 NPC 靠近海床，在瑟尔塞莱神庙废墟旁。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000008, {	-- Step 5: Freshly Molted Crab Skin
												["coord"] = { 65.9, 43.2, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 5:|r Purchase 10 |cFFFFD700Freshly Molted Crab Skin|r from |cFFFFD700Gloomy Bluefin|r at |cFFFFFFFF65.9, 43.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\nThe NPC is on the sea floor, swimming to the southwest of the Abyssal Breach.\n",
													constant = "CFFFFFFFFSTEP_5_R_PURCHASE_10_CFFFFD700FRESHLY",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 5:|r Purchase 10 |cFFFFD700Freshly Molted Crab Skin|r from |cFFFFD700Gloomy Bluefin|r at |cFFFFFFFF65.9, 43.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\nThe NPC is on the sea floor, swimming to the southwest of the Abyssal Breach.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 5 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF65.9, 43.2|r处从|cFFFFD700阴郁蓝鳍|r处购买 10 个|cFFFFD700刚蜕壳的蟹皮|r。\n该 NPC 在海床上，在深渊裂口西南方游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000009, {	-- Step 6: Glittergill Glitter
												["coord"] = { 60.3, 58.5, VASHJIR_KELPTHAR_FOREST },	-- Kelp'thar Forest, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 6:|r Purchase 50 |cFFFFD700Glittergill Glitter|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.3, 58.5|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
													constant = "CFFFFFFFFSTEP_6_R_PURCHASE_50",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 6:|r Purchase 50 |cFFFFD700Glittergill Glitter|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.3, 58.5|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 6 步：|r 在瓦丝琪尔|cFFFFD700凯尔普萨森林|r的|cFFFFFFFF60.3, 58.5|r处从|cFFFFD700老鱼息|r处购买 50 个|cFFFFD700闪鳃闪光|r。\n该 NPC 靠近水面，在啃噬者埋骨地的一些浮游生物附近。\n",
														-- TODO: tw = "",
													},
												}),
											}),
										},
									}),
									o(13000010, {	-- Symbiotic Plankton
										["description"] = createLocalizationString({
											readable = "Exchange the following items with the NPC until you receive 40 |cFFFFD700Symbiotic Plankton|r.\n",
											constant = "EXCHANGE_THE_FOLLOWING_ITEMS_WITH_THE_NPC_UNTIL_3",
											export = true,
											text = {
												en = "Exchange the following items with the NPC until you receive 40 |cFFFFD700Symbiotic Plankton|r.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "与 NPC 交换以下物品，直到你收到 40 份|cFFFFD700共生浮游生物|r。\n",
												-- TODO: tw = "",
											},
										}),
										["groups"] = {
											o(13000011, {	-- Step 1: Seashell
												["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 1:|r Purchase 80 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
													constant = "CFFFFFFFFSTEP_1_R_PURCHASE_80_CFFFFD700SEASHELL",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 1:|r Purchase 80 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 1 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF44.6, 20.2|r处从|cFFFFD700芬利·莫格顿爵士|r处购买 80 个|cFFFFD700贝壳|r。\n\n该 NPC 位于地表，在其中一个小岛上的瞭望塔顶。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000012, {	-- Step 2: Giant Giant Toenail Clipping
												["coord"] = { 65.9, 43.2, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 2:|r Purchase 2 |cFFFFD700Giant Giant Toenail Clipping|r from |cFFFFD700Gloomy Bluefin|r at |cFFFFFFFF65.9, 43.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is on the sea floor, swimming to the southwest of the Abyssal Breach.\n",
													constant = "CFFFFFFFFSTEP_2_R_PURCHASE_2_CFFFFD700GIANT",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 2:|r Purchase 2 |cFFFFD700Giant Giant Toenail Clipping|r from |cFFFFD700Gloomy Bluefin|r at |cFFFFFFFF65.9, 43.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is on the sea floor, swimming to the southwest of the Abyssal Breach.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 2 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF65.9, 43.2|r处从|cFFFFD700阴郁蓝鳍|r处购买 2 个|cFFFFD700巨型巨人的脚趾甲碎片|r。\n\n该 NPC 在海床上，在深渊裂口西南方游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000013, {	-- Step 3: Makrura Eye
												["coord"] = { 45.7, 17.3, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 3:|r Purchase 4 |cFFFFD700Makrura Eye|r from |cFFFFD700Little Carp|r at |cFFFFFFFF45.8, 17.0|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the sea floor, swimming around Deepfin Ridge.\n",
													constant = "CFFFFFFFFSTEP_3_R_PURCHASE_4_CFFFFD700MAKRURA",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 3:|r Purchase 4 |cFFFFD700Makrura Eye|r from |cFFFFD700Little Carp|r at |cFFFFFFFF45.8, 17.0|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the sea floor, swimming around Deepfin Ridge.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 3 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF45.8, 17.0|r处从|cFFFFD700小鲤鱼|r处购买 4 个|cFFFFD700龙虾人眼睛|r。\n\n该 NPC 靠近海床，在深鳍山脊周围游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000014, {	-- Step 4: Accidentally-Severed Seahorse Fin
												["coord"] = { 39.9, 77.6, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 4:|r Purchase 1 |cFFFFD700Accidentally-Severed Seahorse Fin|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
													constant = "CFFFFFFFFSTEP_4_R_PURCHASE_1",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 4:|r Purchase 1 |cFFFFD700Accidentally-Severed Seahorse Fin|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 4 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF39.9, 77.6|r处从|cFFFFD700易爆紫鳞|r处购买 1 个|cFFFFD700意外切断的海马鳍|r。\n\n该 NPC 在幽光峡谷海床附近游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000015, {	-- Step 5: Shiny Sea Serpent Scale
												["coord"] = { 53.8, 89.1, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 5:|r Purchase 3 |cFFFFD700Shiny Sea Serpent Scale|r from |cFFFFD700Crimson Angerfish|r at |cFFFFFFFF53.8, 89.1|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, swimming to the left of Biel'aran Ridge.\n",
													constant = "CFFFFFFFFSTEP_5_R_PURCHASE_3_CFFFFD700SHINY_SEA",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 5:|r Purchase 3 |cFFFFD700Shiny Sea Serpent Scale|r from |cFFFFD700Crimson Angerfish|r at |cFFFFFFFF53.8, 89.1|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, swimming to the left of Biel'aran Ridge.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 5 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF53.8, 89.1|r处从|cFFFFD700赤红怒鱼|r处购买 3 个|cFFFFD700闪亮的海蛇鳞片|r。\n\n该 NPC 靠近海床，在比尔亚兰山脊左侧游动。\n",
														-- TODO: tw = "",
													},
												}),
											}),
											o(13000016, {	-- Step 6: Symbiotic Plankton
												["coord"] = { 53.8, 23.4, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
												["description"] = createLocalizationString({
													readable = "|cFFFFFFFFStep 6:|r Purchase 40 |cFFFFD700Symbiotic Plankton|r from |cFFFFD700Manta Stargazer|r at |cFFFFFFFF53.8, 23.4|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is near the surface, hovering around Shimmering Grotto.\n\nYou only need 2 scales, the spare can be left to despawn.\n",
													constant = "CFFFFFFFFSTEP_6_R_PURCHASE_40",
													export = true,
													text = {
														en = "|cFFFFFFFFStep 6:|r Purchase 40 |cFFFFD700Symbiotic Plankton|r from |cFFFFD700Manta Stargazer|r at |cFFFFFFFF53.8, 23.4|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is near the surface, hovering around Shimmering Grotto.\n\nYou only need 2 scales, the spare can be left to despawn.\n",
														-- TODO: de = "",
														-- TODO: es = "",
														-- TODO: mx = "",
														-- TODO: fr = "",
														-- TODO: it = "",
														-- TODO: ko = "",
														-- TODO: pt = "",
														-- TODO: ru = "",
														cn = "|cFFFFFFFF第 6 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF53.8, 23.4|r处从|cFFFFD700蝠鲼观星者|r处购买 40 个|cFFFFD700共生浮游生物|r。\n\n该 NPC 靠近水面，在闪光石窟周围盘旋。\n\n你只需要 2 个鳞片，多余的可以放着让它消失。\n",
														-- TODO: tw = "",
													},
												}),
											}),
										},
									}),
									o(13000017, {	-- Scintillating Murloc Skin Lotion
										["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
										["description"] = createLocalizationString({
											readable = "Exchange the |cFFFFD700Glittergill Glitter|r and |cFFFFD700Symbiotic Plankton|r for 5 |cFFFFD700Scintillating Murloc Skin Lotion|r with |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
											constant = "EXCHANGE_THE_CFFFFD700GLITTERGILL_GLITTER_R_AND",
											export = true,
											text = {
												en = "Exchange the |cFFFFD700Glittergill Glitter|r and |cFFFFD700Symbiotic Plankton|r for 5 |cFFFFD700Scintillating Murloc Skin Lotion|r with |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "用|cFFFFD700闪鳃闪光|r和|cFFFFD700共生浮游生物|r，与位于瓦斯琪尔的|cFFFFD700闪光瀚海|r（|cFFFFFFFF44.6, 20.2|r）的|cFFFFD700芬利·莫格顿爵士|r交换 5 份|cFFFFD700闪烁的鱼人护肤乳|r。\n\n该 NPC 位于地表的一座小岛上，在一座瞭望塔的顶部。\n",
												-- TODO: tw = "",
											},
										}),
									}),
								},

							}),
							o(13000018, {	-- Potent Gastropod Gloop
								["description"] = createLocalizationString({
									readable = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Potent Gastropod Gloop|r.\n",
									constant = "EXCHANGE_THE_FOLLOWING_ITEMS_WITH_THE_NPC_UNTIL_4",
									export = true,
									text = {
										en = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Potent Gastropod Gloop|r.\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "与 NPC 交换以下物品，直到你收到 5 份|cFFFFD700强效腹足动物黏液|r。\n",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									o(13000019, {	-- Step 1: Seashell
										["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 1:|r Purchase 300 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
											constant = "CFFFFFFFFSTEP_1_R_PURCHASE_300",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 1:|r Purchase 300 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 1 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF44.6, 20.2|r处从|cFFFFD700芬利·莫格顿爵士|r处购买 300 个|cFFFFD700贝壳|r。\n\n该 NPC 位于地表，在其中一个小岛上的瞭望塔顶。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000020, {	-- Step 2: Vantus Black Squid Ink
										["coord"] = { 60.6, 60.0, VASHJIR_KELPTHAR_FOREST },	-- Kelp'thar Forest, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 2:|r Purchase 30 |cFFFFD700Vantus Black Squid Ink|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.6, 60.0|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\n\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
											constant = "CFFFFFFFFSTEP_2_R_PURCHASE_30_CFFFFD700VANTUS",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 2:|r Purchase 30 |cFFFFD700Vantus Black Squid Ink|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.6, 60.0|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\n\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 2 步：|r 在瓦丝琪尔|cFFFFD700凯尔普萨森林|r的|cFFFFFFFF60.6, 60.0|r处从|cFFFFD700老鱼息|r处购买 30 个|cFFFFD700万图斯黑鱿鱼墨|r。\n\n该 NPC 靠近水面，在啃噬者埋骨地的一些浮游生物附近。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000021, {	-- Step 3: Super Slick Eel Slime
										["coord"] = { 15.3, 83.5, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 3:|r Purchase 30 |cFFFFD700Super Slick Eel Slime|r from |cFFFFD700The Blackfish|r at |cFFFFFFFF15.3, 83.5|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the southwest corner of the Abandoned Reef.\n",
											constant = "CFFFFFFFFSTEP_3_R_PURCHASE_30_CFFFFD700SUPER",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 3:|r Purchase 30 |cFFFFD700Super Slick Eel Slime|r from |cFFFFD700The Blackfish|r at |cFFFFFFFF15.3, 83.5|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the southwest corner of the Abandoned Reef.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 3 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF15.3, 83.5|r处从|cFFFFD700黑鱼|r处购买 30 个|cFFFFD700超滑鳗鱼黏液|r。\n\n该 NPC 在废弃礁石的西南角附近。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000022, {	-- Step 4: Rock-Encrusted Whelk Shell
										["coord"] = { 39.9, 77.6, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 4:|r Purchase 3 |cFFFFD700Rock-Encrusted Whelk Shell|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
											constant = "CFFFFFFFFSTEP_4_R_PURCHASE_3_CFFFFD700ROCK",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 4:|r Purchase 3 |cFFFFD700Rock-Encrusted Whelk Shell|r from |cFFFFD700Volatile Violetscale|r at |cFFFFFFFF39.9, 77.6|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is swimming around near the sea floor of the Underlight Canyon.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 4 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF39.9, 77.6|r处从|cFFFFD700易爆紫鳞|r处购买 3 个|cFFFFD700覆岩海螺壳|r。\n\n该 NPC 在幽光峡谷海床附近游动。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000023, {	-- Step 5: Potent Gastropod Gloop
										["coord"] = { 45.8, 17.0, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 5:|r Purchase 5 |cFFFFD700Potent Gastropod Gloop|r from |cFFFFD700Little Carp|r at |cFFFFFFFF45.8, 17.0|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the sea floor, swimming around Deepfin Ridge.\n",
											constant = "CFFFFFFFFSTEP_5_R_PURCHASE_5_CFFFFD700POTENT",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 5:|r Purchase 5 |cFFFFD700Potent Gastropod Gloop|r from |cFFFFD700Little Carp|r at |cFFFFFFFF45.8, 17.0|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the sea floor, swimming around Deepfin Ridge.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 5 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF45.8, 17.0|r处从|cFFFFD700小鲤鱼|r处购买 5 个|cFFFFD700强效腹足动物黏液|r。\n\n该 NPC 靠近海床，在深鳍山脊周围游动。\n",
												-- TODO: tw = "",
											},
										}),
									}),
								},
							}),
							o(13000024, {	-- Captured Cavitation Bubble
								["description"] = createLocalizationString({
									readable = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Captured Cavitation Bubble|r.\n",
									constant = "EXCHANGE_THE_FOLLOWING_ITEMS_WITH_THE_NPC_UNTIL_5",
									export = true,
									text = {
										en = "Exchange the following items with the NPC until you receive 5 |cFFFFD700Captured Cavitation Bubble|r.\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "与 NPC 交换以下物品，直到你收到 5 份|cFFFFD700捕获的气蚀气泡|r。\n",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									o(13000025, {	-- Step 1: Seashell
										["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 1:|r Purchase 1500 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
											constant = "CFFFFFFFFSTEP_1_R_PURCHASE_1500",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 1:|r Purchase 1500 |cFFFFD700Seashell|r from |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 1 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF44.6, 20.2|r处从|cFFFFD700芬利·莫格顿爵士|r处购买 1500 个|cFFFFD700贝壳|r。\n\n该 NPC 位于地表，在其中一个小岛上的瞭望塔顶。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000026, {	-- Step 2: Very Pretty Coral
										["coord"] = { 69.8, 46.6, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 2:|r Purchase 300 |cFFFFD700Very Pretty Coral|r from |cFFFFD700Lil' Whaley|r at |cFFFFFFFF69.8, 46.6|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, next to the Ruins of Thelserai Temple.\n",
											constant = "CFFFFFFFFSTEP_2_R_PURCHASE_300_CFFFFD700VERY",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 2:|r Purchase 300 |cFFFFD700Very Pretty Coral|r from |cFFFFD700Lil' Whaley|r at |cFFFFFFFF69.8, 46.6|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, next to the Ruins of Thelserai Temple.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 2 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF69.8, 46.6|r处从|cFFFFD700小鲸鱼|r处购买 300 个|cFFFFD700非常漂亮的珊瑚|r。\n\n该 NPC 靠近海床，在瑟尔塞莱神庙废墟旁。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000027, {	-- Step 3: Iridescent Shimmerray Skin
										["coord"] = { 60.6, 60.0, VASHJIR_KELPTHAR_FOREST },	-- Kelp'thar Forest, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 3:|r Purchase 100 |cFFFFD700Iridescent Shimmerray Skin|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.6, 60.0|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\n\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
											constant = "CFFFFFFFFSTEP_3_R_PURCHASE_100",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 3:|r Purchase 100 |cFFFFD700Iridescent Shimmerray Skin|r from |cFFFFD700Ol' Fishbreath|r at |cFFFFFFFF60.6, 60.0|r in |cFFFFD700Kelp'thar Forest|r, Vashj'ir.\n\nThe NPC is close to the surface, around some plankton in Gnaws' Boneyard.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 3 步：|r 在瓦丝琪尔|cFFFFD700凯尔普萨森林|r的|cFFFFFFFF60.6, 60.0|r处从|cFFFFD700老鱼息|r处购买 100 个|cFFFFD700虹彩闪鳐皮|r。\n\n该 NPC 靠近水面，在啃噬者埋骨地的一些浮游生物附近。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000028, {	-- Step 4: Luxurous Luxscale Scale
										["coord"] = { 53.8, 88.4, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 4:|r Purchase 20 |cFFFFD700Luxurous Luxscale Scale|r from |cFFFFD700Crimson Angerfish|r at |cFFFFFFFF53.8, 88.4|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, swimming to the left of Biel'aran Ridge.\n",
											constant = "CFFFFFFFFSTEP_4_R_PURCHASE_20_CFFFFD700LUXUROUS",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 4:|r Purchase 20 |cFFFFD700Luxurous Luxscale Scale|r from |cFFFFD700Crimson Angerfish|r at |cFFFFFFFF53.8, 88.4|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir.\n\nThe NPC is close to the sea floor, swimming to the left of Biel'aran Ridge.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 4 步：|r 在瓦丝琪尔|cFFFFD700闪光瀚海|r的|cFFFFFFFF53.8, 88.4|r处从|cFFFFD700赤红怒鱼|r处购买 20 个|cFFFFD700奢华的勒克斯鳞片|r。\n\n该 NPC 靠近海床，在比尔亚兰山脊左侧游动。\n",
												-- TODO: tw = "",
											},
										}),
									}),
									o(13000029, {	-- Step 5: Captured Cavitation Bubble
										["coord"] = { 16.0, 82.2, VASHJIR_ABYSSAL_DEPTHS },	-- Abyssal Depths, Vashj'ir
										["description"] = createLocalizationString({
											readable = "|cFFFFFFFFStep 5:|r Purchase 5 |cFFFFD700Captured Cavitation Bubble|r from |cFFFFD700The Blackfish|r at |cFFFFFFFF16.0, 82.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the southwest corner of the Abandoned Reef.\n",
											constant = "CFFFFFFFFSTEP_5_R_PURCHASE_5_CFFFFD700CAPTURED",
											export = true,
											text = {
												en = "|cFFFFFFFFStep 5:|r Purchase 5 |cFFFFD700Captured Cavitation Bubble|r from |cFFFFD700The Blackfish|r at |cFFFFFFFF16.0, 82.2|r in |cFFFFD700Abyssal Depths|r, Vashj'ir.\n\nThe NPC is near the southwest corner of the Abandoned Reef.\n",
												-- TODO: de = "",
												-- TODO: es = "",
												-- TODO: mx = "",
												-- TODO: fr = "",
												-- TODO: it = "",
												-- TODO: ko = "",
												-- TODO: pt = "",
												-- TODO: ru = "",
												cn = "|cFFFFFFFF第 5 步：|r 在瓦丝琪尔|cFFFFD700深渊之地|r的|cFFFFFFFF16.0, 82.2|r处从|cFFFFD700黑鱼|r处购买 5 个|cFFFFD700捕获的空化气泡|r。\n\n该 NPC 在废弃礁石的西南角附近。\n",
												-- TODO: tw = "",
											},
										}),
									}),
								},
							}),
							o(13000030, {	-- Buy the Red Crystal Monocle
								["coord"] = { 44.6, 20.2, VASHJIR_SHIMMERING_EXPANSE },	-- Shimmering Expanse, Vashj'ir
								["description"] = createLocalizationString({
									readable = "Exchange the 3 items with |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir for the |cFFFFD700Red Crystal Monocle|r.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
									constant = "EXCHANGE_THE_3_ITEMS_WITH_CFFFFD700SIR_FINLEY",
									export = true,
									text = {
										en = "Exchange the 3 items with |cFFFFD700Sir Finley Mrrgglton|r at |cFFFFFFFF44.6, 20.2|r in |cFFFFD700Shimmering Expanse|r, Vashj'ir for the |cFFFFD700Red Crystal Monocle|r.\n\nThe NPC is at surface level on one of the islets, atop a watchtower.\n",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "用这 3 件物品与位于瓦斯琪尔的|cFFFFD700闪光瀚海|r（|cFFFFFFFF44.6, 20.2|r）的|cFFFFD700芬利·莫格顿爵士|r交换|cFFFFD700红色水晶单片眼镜|r。\n\n该 NPC 位于地表的一座小岛上，在一座瞭望塔的顶部。\n",
										-- TODO: tw = "",
									},
								}),
								["groups"] = { i(156725) },	-- Red Crystal Monocle
							}),
						},
					}),
					header(HEADERS.Item, 156726, {	-- Yellow Crystal Monocle
						["icon"] = 133146,
						["name"] = "Yellow Crystal Monocle",
						["description"] = createLocalizationString({
							readable = "Go to |cFFFFD700Halls of Origination|r in |cFFFFD700Uldum|r. After the first boss in Halls of Origination, there is a large room with an elevator. While wearing the |cFFFFD700Talisman of True Treasure Tracking|r, you can click a Stellar Refraction Device that spawns colorful constellations in the room below the elevator.\n\nTo access the puzzle, head north from the elevator and there will be an open way with a staircase to the floor below.\n\nYour objective here is to transform all constellations to the same color. To do this, there are three special refractors that change their colors when clicked on.\n\n|cFFFFD700The Hivemind HoO Puzzle Helper|r addon is recommended to complete this step, as it simply requires you to input the current colors of the constellations, then gives you directions on how to click the refractors to solve it.\n\nWhen all constellations have the same color, a chest will spawn on top of the Stellar Refraction Device containing the |cFFFFFFFFYellow Crystal Monocle|r.\n\n|cFFCC33FFBe careful to not accidentally click the Refraction Device when looting the monocle, as this will restart the puzzle and despawn the chest|r.\n",
							constant = "GO_TO_CFFFFD700HALLS_OF_ORIGINATION_R_IN",
							export = true,
							text = {
								en = "Go to |cFFFFD700Halls of Origination|r in |cFFFFD700Uldum|r. After the first boss in Halls of Origination, there is a large room with an elevator. While wearing the |cFFFFD700Talisman of True Treasure Tracking|r, you can click a Stellar Refraction Device that spawns colorful constellations in the room below the elevator.\n\nTo access the puzzle, head north from the elevator and there will be an open way with a staircase to the floor below.\n\nYour objective here is to transform all constellations to the same color. To do this, there are three special refractors that change their colors when clicked on.\n\n|cFFFFD700The Hivemind HoO Puzzle Helper|r addon is recommended to complete this step, as it simply requires you to input the current colors of the constellations, then gives you directions on how to click the refractors to solve it.\n\nWhen all constellations have the same color, a chest will spawn on top of the Stellar Refraction Device containing the |cFFFFFFFFYellow Crystal Monocle|r.\n\n|cFFCC33FFBe careful to not accidentally click the Refraction Device when looting the monocle, as this will restart the puzzle and despawn the chest|r.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "前往|cFFFFD700奥丹姆|r的|cFFFFD700起源大厅|r。在起源大厅的第一个首领之后，有一个带升降梯的大房间。佩戴|cFFFFD700真宝追踪护符|r时，你可以点击星光折射装置，它会在升降梯下方的房间里生成色彩斑斓的星座。\n\n要进入谜题，从升降梯向北走，那里有一条开阔的通道，有楼梯通往下一层。\n\n你在这里的目标是将所有星座都变成同一种颜色。为此，有三个特殊的折射器，点击它们会改变颜色。\n\n建议使用|cFFFFD700The Hivemind HoO Puzzle Helper|r插件来完成这一步，它只需要你输入星座当前的颜色，然后就会给出点击折射器解开谜题的方向。\n\n当所有星座颜色相同时，星光折射装置顶部会生成一个箱子，里面装有|cFFFFFFFF黄色水晶单片镜|r。\n\n|cFFCC33FF拾取单片镜时小心不要误点折射装置，否则谜题会重新开始，箱子也会消失|r。\n",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "i", 27944 },	-- Talisman of True Treasure Tracking
						["groups"] = {
							o(280886, {	-- Star-Touched Chest
								["questID"] = 50183,
								["groups"] = { i(156726) },	-- Yellow Crystal Monocle
							}),
						};
					});
				},
			}),
			o(13000033, {	-- Step 4: Suramar Beams
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFSTEP 3:|r Hivemind requires a five-man group. Four members must each collect a different monocle before the group can continue with the secret. You must be in a party and have the same warmode. Four party members with different monocles must go to four different withered in suramar while one stay in Dalaran",
					constant = "CFFFFFFFFSTEP_3_R_HIVEMIND_REQUIRES_A_FIVE_MAN_2",
					export = true,
					text = {
						en = "|cFFFFFFFFSTEP 3:|r Hivemind requires a five-man group. Four members must each collect a different monocle before the group can continue with the secret. You must be in a party and have the same warmode. Four party members with different monocles must go to four different withered in suramar while one stay in Dalaran",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 蜂巢思维需要一支五人小队。四名成员必须各自收集一枚不同的单片眼镜，队伍才能继续这个秘密。你必须处于小队中并且拥有相同的战争模式。四名持有不同单片眼镜的小队成员必须前往苏拉玛的四个不同枯法者处，同时一人留在达拉然",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					n(132595, {	-- Rikei
						["description"] = createLocalizationString({
							readable = "Red Monocle",
							constant = "RED_MONOCLE",
							export = true,
							text = {
								en = "Red Monocle",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "红色单片眼镜",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 71.8, 62.5, SURAMAR },
						["provider"] = { "i", 156725 },	-- Red Crystal Monocle
					}),
					n(132596, {	-- Blom'an
						["description"] = createLocalizationString({
							readable = "Blue Monocle",
							constant = "BLUE_MONOCLE",
							export = true,
							text = {
								en = "Blue Monocle",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "蓝色单片眼镜",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 71.8, 62.5, SURAMAR },
						["provider"] = { "i", 156724 },	-- Blue Crystal Monocle
					}),
					n(132597, {	-- Giluzui
						["description"] = createLocalizationString({
							readable = "Green Monocle",
							constant = "GREEN_MONOCLE",
							export = true,
							text = {
								en = "Green Monocle",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "绿色单片眼镜",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 71.8, 62.5, SURAMAR },
						["provider"] = { "i", 156727 },	-- Green Crystal Monocle
					}),
					n(132598, {	-- Yorilan
						["description"] = createLocalizationString({
							readable = "Yellow Monocle",
							constant = "YELLOW_MONOCLE",
							export = true,
							text = {
								en = "Yellow Monocle",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "黄色单片眼镜",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 71.8, 62.5, SURAMAR },
						["provider"] = { "i", 156726 },	-- Yellow Crystal Monocle
					}),
					o(280903, {	-- Lost Cat Toy
						["description"] = createLocalizationString({
							readable = "The person in Dalaran have to pick up this Toy and will take random damage while doing so. It's important that this TOTAL(Damage+Absorbs+Overkill) damage is recorded.",
							constant = "THE_PERSON_IN_DALARAN_HAVE_TO_PICK_UP_THIS_TOY",
							export = true,
							text = {
								en = "The person in Dalaran have to pick up this Toy and will take random damage while doing so. It's important that this TOTAL(Damage+Absorbs+Overkill) damage is recorded.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "达拉然的那个人必须拾取这个玩具，并在过程中受到随机伤害。重要的是要记录下这个总伤害（伤害+吸收+过量伤害）。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			o(13000034, {	-- Step 5: Cat Code
				["description"] = createLocalizationString({
					readable = "The damage the person took from taking the cat toy is the code. Each cat represent a one order of magnitude in the following order: Mrs. Fluffymuffins > Shadow > Mew > Ash > Bella and each pet counts as one.",
					constant = "THE_DAMAGE_THE_PERSON_TOOK_FROM_TAKING_THE_CAT",
					export = true,
					text = {
						en = "The damage the person took from taking the cat toy is the code. Each cat represent a one order of magnitude in the following order: Mrs. Fluffymuffins > Shadow > Mew > Ash > Bella and each pet counts as one.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这个人拿走猫咪玩具时受到的伤害就是密码。每只猫代表一个数量级，顺序如下：蓬松松饼太太 > 暗影 > 喵呜 > 灰烬 > 贝拉，每只宠物计为一。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					n(132599, {	-- Lady Chaton
						["coord"] = { 50.0, 69.0, 762 },
					}),
				},
			}),
			o(13000035, {	-- Step 6: Jumping Puzzle
				["description"] = createLocalizationString({
					readable = "There multiple solutions to this puzzle. One of them is: First F is jumping onto the platform at the center, Directions: F = forward, L = left, R = right, B = back.\n1 FF\n2 FLF\n1 F\n3 FFRR\n4 FL\n5 F\n2 L\n4 F\n2 L\n4 LF\n2 FL\n3 B\n5 FRRR\n3 F\n5 F\n1 RF\n3 BFR\n1 FL\n4 F\n2 BF\n5 F\n2 BF\n5 R\n3 F\n1 FR\n2 FR\n4 F\n2 LF\n4 F\n1 RF\n3 L\n4 F\n3 FF\n5 F\n1 L\n4 R\n5 L\n2 F\n4 F\n5 FF\n1 F\n3 L\n5 RF\n4 F\n1 R\n5 L\n1 F\n2 F\n3 Jump off! (leave vehicle and fall, only this person!).\n3 START AT FAR LEFT PLATFORM (Jump onto it).\n3 F\n2 F\n3 FFF\n2 B\n4 R\n5 F\n2 FRF\n3 FFFF",
					constant = "THERE_MULTIPLE_SOLUTIONS_TO_THIS_PUZZLE_ONE_OF",
					export = true,
					text = {
						en = "There multiple solutions to this puzzle. One of them is: First F is jumping onto the platform at the center, Directions: F = forward, L = left, R = right, B = back.\n1 FF\n2 FLF\n1 F\n3 FFRR\n4 FL\n5 F\n2 L\n4 F\n2 L\n4 LF\n2 FL\n3 B\n5 FRRR\n3 F\n5 F\n1 RF\n3 BFR\n1 FL\n4 F\n2 BF\n5 F\n2 BF\n5 R\n3 F\n1 FR\n2 FR\n4 F\n2 LF\n4 F\n1 RF\n3 L\n4 F\n3 FF\n5 F\n1 L\n4 R\n5 L\n2 F\n4 F\n5 FF\n1 F\n3 L\n5 RF\n4 F\n1 R\n5 L\n1 F\n2 F\n3 Jump off! (leave vehicle and fall, only this person!).\n3 START AT FAR LEFT PLATFORM (Jump onto it).\n3 F\n2 F\n3 FFF\n2 B\n4 R\n5 F\n2 FRF\n3 FFFF",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这个谜题有多种解法。其中一种是：第一个 F 是跳到中央平台上。方向：F = 前进，L = 左，R = 右，B = 后退。\n1 FF\n2 FLF\n1 F\n3 FFRR\n4 FL\n5 F\n2 L\n4 F\n2 L\n4 LF\n2 FL\n3 B\n5 FRRR\n3 F\n5 F\n1 RF\n3 BFR\n1 FL\n4 F\n2 BF\n5 F\n2 BF\n5 R\n3 F\n1 FR\n2 FR\n4 F\n2 LF\n4 F\n1 RF\n3 L\n4 F\n3 FF\n5 F\n1 L\n4 R\n5 L\n2 F\n4 F\n5 FF\n1 F\n3 L\n5 RF\n4 F\n1 R\n5 L\n1 F\n2 F\n3 跳下去！（离开载具并坠落，只有这个人！）。\n3 从最左侧的平台开始（跳上去）。\n3 F\n2 F\n3 FFF\n2 B\n4 R\n5 F\n2 FRF\n3 FFFF",
						-- TODO: tw = "",
					},
				}),
			}),
			o(13000036, {	-- Step 7: Arcane Lava
				["description"] = createLocalizationString({
					readable = "First identify the 5 people in your group who can cross with whom;\nPerson A = can make it across with any duo or make it across with 1 specific trio\nPerson B = can make it across with person A in a duo or the specific trio\nSo the specific trio will be Person A, B, and either (C, D, or E) and you'll have to do some trial and error to identify who the last person is.Person C, D, E = can all can make it across with person A in a duo BUT like I said, 1 of these people will also be the last person in the specific trio (once you've identified them, just call them person C, from there person D and E don't matter)\n1. Person A, B, and C get on and go across.\n2. Person C gets off on other side, A and B go back across.\n3. Person B gets off at the start and A and D go back.\n4. Person D gets off on other side and person A and C come back to start.\n5. Person B gets on with person A and C and they travel back to the finish.\n6. Person C gets off at finish, person A and B go back to start.\n7. Person B gets off, person E gets on with person A.\n8. Person E gets off at finish, person A and C go back to the start.\n9. Person B gets on with A and C and go to finish.",
					constant = "FIRST_IDENTIFY_THE_5_PEOPLE_IN_YOUR_GROUP_WHO",
					export = true,
					text = {
						en = "First identify the 5 people in your group who can cross with whom;\nPerson A = can make it across with any duo or make it across with 1 specific trio\nPerson B = can make it across with person A in a duo or the specific trio\nSo the specific trio will be Person A, B, and either (C, D, or E) and you'll have to do some trial and error to identify who the last person is.Person C, D, E = can all can make it across with person A in a duo BUT like I said, 1 of these people will also be the last person in the specific trio (once you've identified them, just call them person C, from there person D and E don't matter)\n1. Person A, B, and C get on and go across.\n2. Person C gets off on other side, A and B go back across.\n3. Person B gets off at the start and A and D go back.\n4. Person D gets off on other side and person A and C come back to start.\n5. Person B gets on with person A and C and they travel back to the finish.\n6. Person C gets off at finish, person A and B go back to start.\n7. Person B gets off, person E gets on with person A.\n8. Person E gets off at finish, person A and C go back to the start.\n9. Person B gets on with A and C and go to finish.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "首先确定队伍中哪 5 个人可以和谁一起过河；\n人员 A = 可以与任意两人组合一起过河，或与 1 个特定的三人组合一起过河\n人员 B = 可以与人员 A 组成两人组合过河，或加入该特定三人组合\n因此这个特定三人组合将是人员 A、B，再加上（C、D 或 E）中的一人，你需要反复尝试才能确定最后这个人是谁。人员 C、D、E = 都可以与人员 A 组成两人组合过河，但正如我所说，其中 1 人同时也会是这个特定三人组合的最后一人（一旦确定了是谁，就称其为人员 C，此后人员 D 和 E 就无所谓了）\n1. 人员 A、B 和 C 上船过河。\n2. 人员 C 在对岸下船，A 和 B 划回去。\n3. 人员 B 在起点下船，A 和 D 划回去。\n4. 人员 D 在对岸下船，人员 A 和 C 回到起点。\n5. 人员 B 与人员 A 和 C 一起上船，他们一起划向终点。\n6. 人员 C 在终点下船，人员 A 和 B 回到起点。\n7. 人员 B 下船，人员 E 与人员 A 一起上船。\n8. 人员 E 在终点下船，人员 A 和 C 回到起点。\n9. 人员 B 与 A 和 C 一起上船，前往终点。",
						-- TODO: tw = "",
					},
				}),
			}),
			o(13000037, {	-- Step 8: Hivemind
				["description"] = createLocalizationString({
					readable = "Each player needs to take one position each around the circle.",
					constant = "EACH_PLAYER_NEEDS_TO_TAKE_ONE_POSITION_EACH",
					export = true,
					text = {
						en = "Each player needs to take one position each around the circle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "每个玩家都需要在圆圈周围各占一个位置。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = { i(156798) },	-- The Hivemind (MOUNT!)
			}),
		},
	})),
}));
