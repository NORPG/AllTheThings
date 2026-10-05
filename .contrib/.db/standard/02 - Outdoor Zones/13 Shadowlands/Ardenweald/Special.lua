---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(ARDENWEALD, {
		n(SPECIAL, {
			i(182599, {	-- Bucket of Clean Water
				["cost"] = { { "i", 182620, 1 } },	-- 1x Empty Water Bucket
			}),
			i(180652, {	-- Fae Dreamcatcher
				["description"] = createLocalizationString({
					readable = "Used to dispel the barrier at |cFFFFFFFF36.1, 65.2|r.",
					constant = "USED_TO_DISPEL_THE_BARRIER_AT_CFFFFFFFF36_1_65",
					export = true,
					text = {
						en = "Used to dispel the barrier at |cFFFFFFFF36.1, 65.2|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "用于驱散 |cFFFFFFFF36.1, 65.2|r 处的屏障。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = {
					{ "i", 180656, 1 },	-- Enchanted Bough
					{ "i", 180654, 1 },	-- Fae Ornament
					{ "i", 180655, 1 },	-- Raw Dream Fibers
				},
			}),
			n(171206, {	-- Playful Vulpin
				["description"] = createLocalizationString({
					readable = "You need to find the Playful Vulpin five times and use the following emotes.\n\n 1. Playful Vulpin begins to dig curiously. |cFFFFFFFF/curious|r\n 2. Playful Vulpin wanders around unable to sit still. |cFFFFFFFF/sit|r\n 3. Playful Vulpin sings all alone. |cFFFFFFFF/sing|r\n 4. Playful Vulpin dances with joy. |cFFFFFFFF/dance|r\n 5. Playful Vulpin sits down lonely and sad. |cFFFFFFFF/pet|r\n\nIt only counts if the Playful Vulpin reacts to your emote and runs away.",
					constant = "YOU_NEED_TO_FIND_THE_PLAYFUL_VULPIN_FIVE_TIMES",
					export = true,
					text = {
						en = "You need to find the Playful Vulpin five times and use the following emotes.\n\n 1. Playful Vulpin begins to dig curiously. |cFFFFFFFF/curious|r\n 2. Playful Vulpin wanders around unable to sit still. |cFFFFFFFF/sit|r\n 3. Playful Vulpin sings all alone. |cFFFFFFFF/sing|r\n 4. Playful Vulpin dances with joy. |cFFFFFFFF/dance|r\n 5. Playful Vulpin sits down lonely and sad. |cFFFFFFFF/pet|r\n\nIt only counts if the Playful Vulpin reacts to your emote and runs away.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你需要找到顽皮的狐灵五次，并使用以下表情。\n\n 1. 顽皮的狐灵开始好奇地挖掘。|cFFFFFFFF/curious|r\n 2. 顽皮的狐灵四处游荡，坐立不安。|cFFFFFFFF/sit|r\n 3. 顽皮的狐灵独自歌唱。|cFFFFFFFF/sing|r\n 4. 顽皮的狐灵欢快地跳舞。|cFFFFFFFF/dance|r\n 5. 顽皮的狐灵孤独而悲伤地坐下。|cFFFFFFFF/pet|r\n\n只有当顽皮的狐灵对你的表情作出反应并跑开时才会计数。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 32.0, 43.2, ARDENWEALD },
					{ 33.0, 43.9, ARDENWEALD },
					{ 34.1, 44.9, ARDENWEALD },
					{ 36.1, 49.6, ARDENWEALD },
					{ 40.7, 27.4, ARDENWEALD },
					{ 40.8, 51.4, ARDENWEALD },
					{ 41.2, 49.7, ARDENWEALD },
					{ 43.0, 64.9, ARDENWEALD },
					{ 44.1, 66.6, ARDENWEALD },
					{ 46.4, 66.5, ARDENWEALD },
					{ 48.5, 59.1, ARDENWEALD },
					{ 50.9, 54.6, ARDENWEALD },
					{ 63.2, 26.1, ARDENWEALD },
					{ 64.3, 29.5, ARDENWEALD },
					{ 64.9, 22.9, ARDENWEALD },
					{ 66.4, 31.1, ARDENWEALD },
					{ 67.1, 28.8, ARDENWEALD },
					{ 67.8, 32.0, ARDENWEALD },
					{ 69.1, 30.0, ARDENWEALD },
					{ 70.4, 29.7, ARDENWEALD },
					{ 72.3, 31.4, ARDENWEALD },
				},
				["questID"] = 61086,
				["groups"] = {
					q(61080, {	-- /curious
						["name"] = "/curious",
					}),
					q(61081, {	-- /sit
						["name"] = "/sit",
					}),
					q(61084, {	-- /sing
						["name"] = "/sing",
					}),
					q(61085, {	-- /dance
						["name"] = "/dance",
					}),
					q(61078, {	-- /pet
						["name"] = "/pet",
					}),
					i(180645),	-- Dodger (PET!)
				},
			}),
			header(HEADERS.NPC, 168135, {	-- Night Mare
				["description"] = createLocalizationString({
					readable = "Enable Debug Mode to view all the steps.\n\nYou will need at least 2 |cFFFFFFFFGoblin Gliders|r and 10 |cff16bf0dLightless Silk|r. (I encountered a bug where, until I had more than 10 cloth in my bags, I could not progress to the next step, so you may want to bring a few extra.)\n\nYou will also need to have completed the 'Trouble at the Gormling Corral' and 'Tricky Spriggans' criteria of the |cffffff00Sojourner of Ardenweald|r achievement. You must also fight a 62 rare elite, so bringing a couple friends along is a good idea.",
					constant = "ENABLE_DEBUG_MODE_TO_VIEW_ALL_THE_STEPS_YOU",
					export = true,
					text = {
						en = "Enable Debug Mode to view all the steps.\n\nYou will need at least 2 |cFFFFFFFFGoblin Gliders|r and 10 |cff16bf0dLightless Silk|r. (I encountered a bug where, until I had more than 10 cloth in my bags, I could not progress to the next step, so you may want to bring a few extra.)\n\nYou will also need to have completed the 'Trouble at the Gormling Corral' and 'Tricky Spriggans' criteria of the |cffffff00Sojourner of Ardenweald|r achievement. You must also fight a 62 rare elite, so bringing a couple friends along is a good idea.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "启用调试模式以查看所有步骤。\n\n你至少需要 2 个|cFFFFFFFF地精滑翔器|r和 10 份|cff16bf0d暗光丝绸|r。（我遇到过一个 bug：在背包中的布料超过 10 份之前，我无法进入下一步，所以你可能想多带一些。）\n\n你还需要完成|cffffff00炽蓝仙野的旅居者|r成就中的“戈姆幼体围栏的麻烦”和“狡猾的斯普里根”条件。你还必须与一个 62 级的稀有精英战斗，所以带上几个朋友是个好主意。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(181243, {	-- Broken Soulweb
						["description"] = createLocalizationString({
							readable = "Go to |cFFFFFFFF18.0, 62.0|r. You will have to go through a couple areas with lots of elite mobs, but if you don't get dismounted you can avoid having to fight almost all of them.\n\nUse your first |cFFFFFFFFGoblin Glider|r to fly a short distance to a wide root that goes up and to the left.\n\nWalk along the root system until you get to |cFFFFFFFF19.0, 63.4|r.\n\nUse your second |cFFFFFFFFGoblin Glider|r to fly to the circular platform to the northeast. When you land, there will be a cart to your right, at |cFFFFFFFF19.7, 63.5|r. Behind it is an object called Cracked Soulweb, which contains the |cFFFFFFFFBroken Soulweb|r item.",
							constant = "GO_TO_CFFFFFFFF18_0_62_0_R_YOU_WILL_HAVE_TO_GO",
							export = true,
							text = {
								en = "Go to |cFFFFFFFF18.0, 62.0|r. You will have to go through a couple areas with lots of elite mobs, but if you don't get dismounted you can avoid having to fight almost all of them.\n\nUse your first |cFFFFFFFFGoblin Glider|r to fly a short distance to a wide root that goes up and to the left.\n\nWalk along the root system until you get to |cFFFFFFFF19.0, 63.4|r.\n\nUse your second |cFFFFFFFFGoblin Glider|r to fly to the circular platform to the northeast. When you land, there will be a cart to your right, at |cFFFFFFFF19.7, 63.5|r. Behind it is an object called Cracked Soulweb, which contains the |cFFFFFFFFBroken Soulweb|r item.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "前往|cFFFFFFFF18.0, 62.0|r。你必须穿过几个有大量精英怪的区域，但只要不被击落坐骑，就可以避免与几乎所有这些怪物战斗。\n\n使用你的第一个|cFFFFFFFF地精滑翔器|r飞行一小段距离，落在一根向左上方延伸的粗大树根上。\n\n沿着根系前行，直到到达|cFFFFFFFF19.0, 63.4|r。\n\n使用你的第二个|cFFFFFFFF地精滑翔器|r飞向东北方的圆形平台。着陆后，你的右边会有一辆推车，位于|cFFFFFFFF19.7, 63.5|r。它后面有一个名为破裂的灵魂之网的物体，其中包含|cFFFFFFFF破损的灵魂之网|r物品。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(181242, {	-- Repaired Soulweb
						["description"] = createLocalizationString({
							readable = "Take the |cFFFFFFFFBroken Soulweb|r to Elder Gwenna in Glitterfall Basin. Give her 10 |cff16bf0dLightless Silk|r and she will repair the |cFFFFFFFFBroken Soulweb|r.",
							constant = "TAKE_THE_CFFFFFFFFBROKEN_SOULWEB_R_TO_ELDER",
							export = true,
							text = {
								en = "Take the |cFFFFFFFFBroken Soulweb|r to Elder Gwenna in Glitterfall Basin. Give her 10 |cff16bf0dLightless Silk|r and she will repair the |cFFFFFFFFBroken Soulweb|r.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "把 |cFFFFFFFF破损的灵魂之网|r 交给闪落盆地的长者格温娜。给她 10 个 |cff16bf0d无光丝绸|r，她就会修复 |cFFFFFFFF破损的灵魂之网|r。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = {
							59656,	-- Well, Tell the Lady
							57871,	-- Outplayed
						},
						["coord"] = { 50.4, 33.0, ARDENWEALD },
						["cost"] = { { "i", 173204, 10 } },	-- 10x Lightless Silk
						["crs"] = { 165704 },	-- Elder Gwenna
					}),
					i(178675, {	-- Dream Catcher
						["description"] = createLocalizationString({
							readable = "Take the |cff16bf0dRepaired Soulweb|r to Ysera.\n\nMembers of the |cFFA330C9Night Fae Covenant|r can speak to Ysera inside the Heart of the Forest. Members of other covenants can speak to one of the Elite Queensguard at |cFFFFFFFF47.8, 53.2|r, and Ysera will come out to upgrade the item.\n\nI encountered a bug where Ysera did not upgrade my green item to blue with her first cast. It took about a minute for the Queensguard NPCs to be interactable again, and the second time I spoke to Ysera she did upgrade my item.",
							constant = "TAKE_THE_CFF16BF0DREPAIRED_SOULWEB_R_TO_YSERA",
							export = true,
							text = {
								en = "Take the |cff16bf0dRepaired Soulweb|r to Ysera.\n\nMembers of the |cFFA330C9Night Fae Covenant|r can speak to Ysera inside the Heart of the Forest. Members of other covenants can speak to one of the Elite Queensguard at |cFFFFFFFF47.8, 53.2|r, and Ysera will come out to upgrade the item.\n\nI encountered a bug where Ysera did not upgrade my green item to blue with her first cast. It took about a minute for the Queensguard NPCs to be interactable again, and the second time I spoke to Ysera she did upgrade my item.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "把 |cff16bf0d修复的灵魂之网|r 交给伊瑟拉。\n\n|cFFA330C9法夜盟约|r 的成员可以在森林之心中与伊瑟拉交谈。其他盟约的成员可以与 |cFFFFFFFF47.8, 53.2|r 处的一名精英女王卫队成员交谈，伊瑟拉会出来升级该物品。\n\n我遇到过一个 bug：伊瑟拉第一次施法时没有把我的绿色物品升级为蓝色。大约一分钟后女王卫队的 NPC 才能再次互动，我第二次与伊瑟拉交谈时，她才升级了我的物品。",
								-- TODO: tw = "",
							},
						}),
					}),
					n(168135, {	-- Night Mare
						["description"] = createLocalizationString({
							readable = "Take the |cff045ab3Dream Catcher|r behind Hibernal Hollow and use it at |cFFFFFFFF62.5, 51.6|r to phase to the Night Mare's realm.",
							constant = "TAKE_THE_CFF045AB3DREAM_CATCHER_R_BEHIND",
							export = true,
							text = {
								en = "Take the |cff045ab3Dream Catcher|r behind Hibernal Hollow and use it at |cFFFFFFFF62.5, 51.6|r to phase to the Night Mare's realm.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在凛冬谷后方取得 |cff045ab3捕梦网|r，并在 |cFFFFFFFF62.5, 51.6|r 处使用，以转入梦魇领域的相位。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 62.5, 51.6, ARDENWEALD },
						["questID"] = 60306,
						["isDaily"] = true,
						["groups"] = {
							i(180728),	-- Swift Gloomhoof (MOUNT!)
						},
					}),
				},
			}),
			n(171699, {	-- Shimmermist Runner
				["description"] = createLocalizationString({
					readable = "To complete the maze correctly, follow the blue lanterns at every step.\n\n1. Enter Mistveil Tangle through the Oaken Assembly at |cFFFFFFFF31.0, 54.5|r. Two blue lanterns hang on either side of a vine arch.\n\n2. Head down the hill and turn left at |cFFFFFFFF29.6, 56.3|r. Again, two blue lanterns hang on either side of a vine arch.\n\n3. Turn right at |cFFFFFFFF29.8, 57.8|r. A single blue lamp hangs from the vine arch.\n\n4. Turn left at |cFFFFFFFF29.2, 58.5|r. A single blue lamp is on the ground.\n\n5. Immediately turn right through the arch at |cFFFFFFFF28.9, 58.8|r. A single blue lamp hangs on the left side.\n\n6. Go through the arch at |cFFFFFFFF28.1, 58.1|r. A single blue lamp is on the ground on the right side of the arch.\n\n7. Go straight to the area on the map where the Tame Gladerunner treasure is displayed. If you've done the maze correctly Shizgher will not fade out of view. Defeat him, and then click on the Shimmermist Runner to collect it.",
					constant = "TO_COMPLETE_THE_MAZE_CORRECTLY_FOLLOW_THE_BLUE",
					export = true,
					text = {
						en = "To complete the maze correctly, follow the blue lanterns at every step.\n\n1. Enter Mistveil Tangle through the Oaken Assembly at |cFFFFFFFF31.0, 54.5|r. Two blue lanterns hang on either side of a vine arch.\n\n2. Head down the hill and turn left at |cFFFFFFFF29.6, 56.3|r. Again, two blue lanterns hang on either side of a vine arch.\n\n3. Turn right at |cFFFFFFFF29.8, 57.8|r. A single blue lamp hangs from the vine arch.\n\n4. Turn left at |cFFFFFFFF29.2, 58.5|r. A single blue lamp is on the ground.\n\n5. Immediately turn right through the arch at |cFFFFFFFF28.9, 58.8|r. A single blue lamp hangs on the left side.\n\n6. Go through the arch at |cFFFFFFFF28.1, 58.1|r. A single blue lamp is on the ground on the right side of the arch.\n\n7. Go straight to the area on the map where the Tame Gladerunner treasure is displayed. If you've done the maze correctly Shizgher will not fade out of view. Defeat him, and then click on the Shimmermist Runner to collect it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要正确走完迷宫，请在每一步都跟随蓝色灯笼。\n\n1. 从 |cFFFFFFFF31.0, 54.5|r 的橡木集会进入雾纱迷宫。藤蔓拱门两侧各挂着一盏蓝色灯笼。\n\n2. 下山坡，在 |cFFFFFFFF29.6, 56.3|r 处左转。藤蔓拱门两侧同样各挂着一盏蓝色灯笼。\n\n3. 在 |cFFFFFFFF29.8, 57.8|r 处右转。藤蔓拱门上挂着一盏蓝色灯。\n\n4. 在 |cFFFFFFFF29.2, 58.5|r 处左转。地上有一盏蓝色灯。\n\n5. 立即右转，穿过 |cFFFFFFFF28.9, 58.8|r 处的拱门。左侧挂着一盏蓝色灯。\n\n6. 穿过 |cFFFFFFFF28.1, 58.1|r 处的拱门。拱门右侧的地上有一盏蓝色灯。\n\n7. 径直前往地图上显示“驯服林奔者”宝藏的区域。如果你正确走完了迷宫，希兹格尔不会从视野中消失。击败他，然后点击微光雾行者将其收集。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 171767 },	-- Shizgher
				["coords"] = {
					{  31.0, 54.5, ARDENWEALD },	-- start
					{  29.6, 56.3, ARDENWEALD },	-- 1
					{  29.8, 57.8, ARDENWEALD },	-- 2
					{  29.2, 58.5, ARDENWEALD },	-- 3
					{  28.9, 58.8, ARDENWEALD },	-- 4
					{  28.1, 58.1, ARDENWEALD },	-- 5
					{  27.5, 57.8, ARDENWEALD },	-- 6
				},
				["questID"] = 61192,
				["groups"] = { i(180727) },	-- Shimmermist Runner (MOUNT!)
			}),
			n(181694, bubbleDownSelf({ ["timeline"] = { ADDED_9_1_5 } }, {	-- Lost Soul (Cat)
				["description"] = createLocalizationString({
					readable = "This soul is found in the crotch of one of the six super trees in Ardenweald. Target and use /soothe on the Lost Soul to receive the quest.",
					constant = "THIS_SOUL_IS_FOUND_IN_THE_CROTCH_OF_ONE_OF_THE",
					export = true,
					text = {
						en = "This soul is found in the crotch of one of the six super trees in Ardenweald. Target and use /soothe on the Lost Soul to receive the quest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此灵魂位于炽蓝仙野六棵超级树中某一棵的树杈处。选中迷失的灵魂并使用 /安抚 即可获得任务。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 37.6, 36.3, ARDENWEALD },
					{ 51.2, 31.0, ARDENWEALD },
					{ 51.8, 69.2, ARDENWEALD },
					{ 60.0, 55.1, ARDENWEALD },
					{ 65.1, 36.5, ARDENWEALD },
					{ 69.9, 27.3, ARDENWEALD },
				},
				["groups"] = {
					i(187819),	-- Cat Soul (SS!)
				},
			})),
		}),
	}),
})));
