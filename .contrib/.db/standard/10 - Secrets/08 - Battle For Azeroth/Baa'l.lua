-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.BFA, {
	header(HEADERS.Spell, 277461, bubbleDownSelf({ ["timeline"] = { ADDED_8_0_1_LAUNCH } }, {	-- Baa'l
		["description"] = createLocalizationString({
			readable = "***Quest tracking enabled is required to see all the steps.*** \n\n***Before you can complete the last step of Baa'l, an upgraded Uuna is required, so it is recommended that you complete that secret first.***\n\nOther things you may want to have on hand for this secret:\n-Goblin Gliders (if you don't have flying)\n-Invisibility potions\n-Underlight Angler or potions to increase your swim speed\n",
			constant = "QUEST_TRACKING_ENABLED_IS_REQUIRED_TO_SEE_ALL_3",
			export = true,
			text = {
				en = "***Quest tracking enabled is required to see all the steps.*** \n\n***Before you can complete the last step of Baa'l, an upgraded Uuna is required, so it is recommended that you complete that secret first.***\n\nOther things you may want to have on hand for this secret:\n-Goblin Gliders (if you don't have flying)\n-Invisibility potions\n-Underlight Angler or potions to increase your swim speed\n",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须开启任务追踪才能看到所有步骤。*** \n\n***在完成 Baa'l 的最后一步之前，需要一只升级过的乌娜，因此建议先完成那个秘密。***\n\n你可能还想为这个秘密准备以下物品：\n-地精滑翔器（如果你没有飞行）\n-隐形药水\n-幽光钓竿或提高游泳速度的药水\n",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = 1.1,
		["displayID"] = 80456,
		["groups"] = {
			o(293849, {	-- Step 1: Conspicious Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 1:|r Head to Nazmir. The note is high up on the side of the temple in the middle of the zone. If you don't have flying, you can access the top of the temple via a bridge that starts at |cFFFFFFFF46.3, 53.9|r.\n\nThe note reads: \"Begin at the beginning\"\n",
					constant = "CFFFFFFFFSTEP_1_R_HEAD_TO_NAZMIR_THE_NOTE_IS",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 1:|r Head to Nazmir. The note is high up on the side of the temple in the middle of the zone. If you don't have flying, you can access the top of the temple via a bridge that starts at |cFFFFFFFF46.3, 53.9|r.\n\nThe note reads: \"Begin at the beginning\"\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 前往纳兹米尔。纸条在该区域中部神殿侧面的高处。如果你没有飞行能力，可以通过一座从|cFFFFFFFF46.3, 53.9|r开始的桥到达神殿顶部。\n\n纸条上写着：“从开头开始”\n",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 52819,
				["coord"] = { 51.8, 59.0, NAZMIR },
			}),
			o(293837, {	-- Step 2: First Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 2:|r Head to Broken Shore. At the coordinates provided, there is a small stone table with various non-interactable objects — some candles, parchment, a quill, a purple crystal ball, and some scattered grey pebbles. One of the pebbles is pale, almost the same color as the table, and it's the only thing on the table you can interact with. You may need to zoom in to see it.\n\nThe text reads: \"<An ordinary pebble, unremarkable in every way.>\"\n",
					constant = "CFFFFFFFFSTEP_2_R_HEAD_TO_BROKEN_SHORE_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 2:|r Head to Broken Shore. At the coordinates provided, there is a small stone table with various non-interactable objects — some candles, parchment, a quill, a purple crystal ball, and some scattered grey pebbles. One of the pebbles is pale, almost the same color as the table, and it's the only thing on the table you can interact with. You may need to zoom in to see it.\n\nThe text reads: \"<An ordinary pebble, unremarkable in every way.>\"\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 前往破碎海滩。在所给坐标处，有一张小石桌，上面摆着各种无法互动的物件——几支蜡烛、羊皮纸、一支羽毛笔、一个紫色水晶球，还有一些散落的灰色小石子。其中一颗小石子颜色苍白，几乎和桌子同色，而且它是桌上唯一可以互动的东西。你可能需要放大才能看到它。\n\n上面写着：“<一颗普通的石子，毫无特别之处。>”\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52819 },	-- Step 1: Conspicuous Note
				["coord"] = { 37.5, 71.6, BROKEN_SHORE },
				["questID"] = 52809,
			}),
			o(293838, {	-- Step 3: Second Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 3:|r Head to Boralus. At the coordinates provided, there is a raised piece of dock with a horse, an NPC named Chance Cogswaddle, and a mechanical contraption called a Homing Copter. Hop down from the dock and go underneath it — there's a net that looks like it will block your path, but you can walk through it.\n\nWalk forward once you're underneath the dock and you'll pass through a sheet of seaweed and descend into a cave. The pebble you're looking for is tiny and pale and located close to the middle of the cave, around |cFFFFFFFF44.7, 38.5|r.\n\nThere's no text when you click on this one, but if you shift+click anywhere in the ATT mini or main list this step should get checked off your to-do list.\n",
					constant = "CFFFFFFFFSTEP_3_R_HEAD_TO_BORALUS_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 3:|r Head to Boralus. At the coordinates provided, there is a raised piece of dock with a horse, an NPC named Chance Cogswaddle, and a mechanical contraption called a Homing Copter. Hop down from the dock and go underneath it — there's a net that looks like it will block your path, but you can walk through it.\n\nWalk forward once you're underneath the dock and you'll pass through a sheet of seaweed and descend into a cave. The pebble you're looking for is tiny and pale and located close to the middle of the cave, around |cFFFFFFFF44.7, 38.5|r.\n\nThere's no text when you click on this one, but if you shift+click anywhere in the ATT mini or main list this step should get checked off your to-do list.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 前往伯拉勒斯。在所给坐标处，有一段抬高的码头，上面有一匹马、一个名叫钱斯·科格斯沃德的 NPC，还有一个叫做归航直升机的机械装置。从码头跳下去，走到码头下方——那里有一张看起来会挡住你去路的网，但你可以穿过去。\n\n走到码头下方后向前走，你会穿过一层海草并下到一个洞穴。你要找的小石子很小、颜色苍白，位于洞穴中部附近，大约在|cFFFFFFFF44.7, 38.5|r。\n\n点击这一颗时没有文字提示，但如果你在 ATT 迷你列表或主列表的任意位置按住 Shift 点击，此步骤就会从你的待办列表中勾掉。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52809 },	-- Step 3: Second Ordinary Pebble
				["coords"] = {
					{ 49.7, 40.0, BORALUS },	-- Entrance
					{ 47.7, 38.5, BORALUS },	-- Ordinary Pebble
				},
				["questID"] = 52810,
			}),
			o(293839, {	-- Step 4: Third Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 4:|r Head to Zuldazar. The next pebble is hidden in a cave behind Atal'dazar (not inside the instance itself). You can get there without flying, but it's tricky and will probably require a Goblin Glider — if you haven't unlocked flying, you can find video guides online showing you how to navigate to the correct area. If you do have flying, simply fly to the coordinates provided, and once you get there you'll see the tops of a couple trees on the side of the mountain. Underneath the trees you'll find a cave entrance.\n\nRun into the cave, and on the left-hand side you'll see a root growing up against the cave wall. The pebble is right next to it, around |cFFFFFFFF31.9, 35.3.|r\n\nAgain, there's no text when you click on it, so shift+click anywhere in an ATT list to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_4_R_HEAD_TO_ZULDAZAR_THE_NEXT",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 4:|r Head to Zuldazar. The next pebble is hidden in a cave behind Atal'dazar (not inside the instance itself). You can get there without flying, but it's tricky and will probably require a Goblin Glider — if you haven't unlocked flying, you can find video guides online showing you how to navigate to the correct area. If you do have flying, simply fly to the coordinates provided, and once you get there you'll see the tops of a couple trees on the side of the mountain. Underneath the trees you'll find a cave entrance.\n\nRun into the cave, and on the left-hand side you'll see a root growing up against the cave wall. The pebble is right next to it, around |cFFFFFFFF31.9, 35.3.|r\n\nAgain, there's no text when you click on it, so shift+click anywhere in an ATT list to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 4 步：|r 前往祖达萨。下一颗小石子藏在阿塔达萨后方的洞穴里（不是副本内部）。你可以在没有飞行的情况下到达那里，但很棘手，很可能需要地精滑翔器——如果你还没有解锁飞行，可以在网上找到视频指南，教你如何前往正确的区域。如果你有飞行能力，直接飞到所给坐标即可，到达后你会看到山腰上几棵树的树冠。在树下你会发现一个洞穴入口。\n\n跑进洞穴，在左侧你会看到一条根须贴着洞壁生长。小石子就在它旁边，大约在|cFFFFFFFF31.9, 35.3|r。\n\n同样，点击它时没有文字提示，所以在 ATT 列表的任意位置按住 Shift 点击即可刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52810 },	-- Step 3: Second Ordinary Pebble
				["coords"] = {
					{ 31.5, 36.0, ZULDAZAR },	-- Entrance
					{ 31.9, 35.3, ZULDAZAR },	-- Ordinary Pebble
				},
				["questID"] = 52818,
			}),
			o(293840, {	-- Step 5: Fourth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 5:|r Head to Drustvar. At the coordinates provided, there is a cave entrance hidden behind a narrow waterfall. If you don't have flying, you'll have to fall or glide down to it from the cliffs above.\n\nHead all the way to the back of the cave. The pebble is hidden inside the skull on the effigy, behind the left eye socket (the right-hand side when you're facing the effigy).\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_5_R_HEAD_TO_DRUSTVAR_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 5:|r Head to Drustvar. At the coordinates provided, there is a cave entrance hidden behind a narrow waterfall. If you don't have flying, you'll have to fall or glide down to it from the cliffs above.\n\nHead all the way to the back of the cave. The pebble is hidden inside the skull on the effigy, behind the left eye socket (the right-hand side when you're facing the effigy).\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 5 步：|r 前往德鲁斯瓦。在所给坐标处，有一个藏在狭窄瀑布后面的洞穴入口。如果你没有飞行能力，就得从上方悬崖坠落或滑翔下去。\n\n一路走到洞穴最深处。小石子藏在雕像头骨内部，在左眼窝后面（面朝雕像时的右侧）。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52818 },	-- Step 4: Third Ordinary Pebble
				["coords"] = {
					{ 35.0, 54.9, DRUSTVAR },	-- Entrance
					{ 36.3, 53.8, DRUSTVAR },	-- Effigy/Ordinary Pebble
				},
				["questID"] = 52817,
			}),
			o(293841, {	-- Step 6: Fifth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 6:|r Head to Vol'dun. At the coordinates provided, there is a very skinny, tall tree sticking out of the rocks. If you have enemy nameplates enabled, you'll see a |ccccc3333Clatterback|r nearby.\n\nYou can sort of fall down behind the tree into the Clatterback's cave. If you're lucky (or careful) he may not attack you, but you might want to use an invisibility potion to protect yourself, because he hits like a truck.\n\nThe pebble is close to the mouth of the cave, hidden behind a small rock, around |cFFFFFFFF63.0, 21.6|r.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_6_R_HEAD_TO_VOL_DUN_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 6:|r Head to Vol'dun. At the coordinates provided, there is a very skinny, tall tree sticking out of the rocks. If you have enemy nameplates enabled, you'll see a |ccccc3333Clatterback|r nearby.\n\nYou can sort of fall down behind the tree into the Clatterback's cave. If you're lucky (or careful) he may not attack you, but you might want to use an invisibility potion to protect yourself, because he hits like a truck.\n\nThe pebble is close to the mouth of the cave, hidden behind a small rock, around |cFFFFFFFF63.0, 21.6|r.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 6 步：|r 前往沃顿。在所给坐标处，有一棵从岩石中伸出的非常细高的树。如果你开启了敌方姓名板，你会看到附近有一只|ccccc3333咔嗒背|r。\n\n你大概可以从树后掉进咔嗒背的洞穴。如果你运气好（或者够小心），它可能不会攻击你，但你可能还是想用隐形药水保护自己，因为它打人像卡车一样疼。\n\n小石子靠近洞口，藏在一块小岩石后面，大约在|cFFFFFFFF63.0, 21.6|r。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52817 },	-- Step 5 Fourth Ordinary Pebble
				["coords"] = {
					{ 63.2, 21.3, VOLDUN },	-- Entrance
					{ 63.0, 21.6, VOLDUN },	-- Ordinary Pebble
				},
				["questID"] = 52816,
			}),
			o(293842, {	-- Step 7: Sixth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 7:|r Head to Stormsong Valley. At the coordinates provided, there is a cave entrance obscured by some trees. There are some pirates inside, so fight your way to the middle of the cave and you'll find a wheelbarrow housing the next pebble around |cFFFFFFFF67.9, 13.0|r.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_7_R_HEAD_TO_STORMSONG_VALLEY_AT",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 7:|r Head to Stormsong Valley. At the coordinates provided, there is a cave entrance obscured by some trees. There are some pirates inside, so fight your way to the middle of the cave and you'll find a wheelbarrow housing the next pebble around |cFFFFFFFF67.9, 13.0|r.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 7 步：|r 前往斯托颂谷地。在所给坐标处，有一个被一些树木遮挡的洞穴入口。里面有一些海盗，所以一路打到洞穴中部，你会在|cFFFFFFFF67.9, 13.0|r附近找到一辆装着下一颗小石子的独轮车。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52816 },	-- Step 6: Fifth Ordinary Pebble
				["coords"] = {
					{ 68.3, 10.5, STORMSONG_VALLEY },	-- Entrance
					{ 67.9, 13.0, STORMSONG_VALLEY },	-- Ordinary Pebble
				},
				["questID"] = 52815,
			}),
			o(293843, {	-- Step 8: Seventh Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 8:|r Head to Nazmir. There are two coordinates provided, although you may only be able to see one on your map when you start. Head to the southern coordinate and then fly north, into fatigue waters, to the northern coordinate.\n\nUse Underlight Angler or a potion to increase your swim speed, and swim down until you get to a shipwreck. The back of the ship is made of stained glass. In the middle of the glass is a skull with a semicircle of pebbles underneath it. The one you can interact with is the second from the left.\n\n  Shift-click to refresh your collection.",
					constant = "CFFFFFFFFSTEP_8_R_HEAD_TO_NAZMIR_THERE_ARE_TWO",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 8:|r Head to Nazmir. There are two coordinates provided, although you may only be able to see one on your map when you start. Head to the southern coordinate and then fly north, into fatigue waters, to the northern coordinate.\n\nUse Underlight Angler or a potion to increase your swim speed, and swim down until you get to a shipwreck. The back of the ship is made of stained glass. In the middle of the glass is a skull with a semicircle of pebbles underneath it. The one you can interact with is the second from the left.\n\n  Shift-click to refresh your collection.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 8 步：|r 前往纳兹米尔。给出了两个坐标，不过你一开始可能只能在地图上看到一个。前往南边的坐标，然后向北飞入疲劳水域，到达北边的坐标。\n\n使用幽光鱼竿或药水提高游泳速度，向下游直到抵达一艘沉船。船尾是彩色玻璃做的。玻璃中央是一个头骨，其下方呈半圆形排列着一些小石子。可以互动的是左起第二颗。\n\n  按住 Shift 点击以刷新你的收藏。",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52815 },	-- Step 7: Sixth Ordinary Pebble
				["coords"] = {
					{ 39.8, 4.0, NAZMIR },	-- Starting location
					{ 54.5, 7.3, ZANDALAR },	-- Ordinary Pebble
				},
				["questID"] = 52814,
			}),
			o(293844, {	-- Step 9: Eighth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 9:|r Head to Boralus. At the coordinates provided, there is a large tree in the hedge maze. Behind it is the entrance to a cellar.\n\nOn the left side of the cellar, you'll see two crates stacked up with two barrels stacked to their left and a small chest on their right. The pebble is hidden behind the barrel, around |cFFFFFFFF37.2, 79.8|r.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_9_R_HEAD_TO_BORALUS_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 9:|r Head to Boralus. At the coordinates provided, there is a large tree in the hedge maze. Behind it is the entrance to a cellar.\n\nOn the left side of the cellar, you'll see two crates stacked up with two barrels stacked to their left and a small chest on their right. The pebble is hidden behind the barrel, around |cFFFFFFFF37.2, 79.8|r.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 9 步：|r 前往伯拉勒斯。在所给坐标处，树篱迷宫中有一棵大树。它后面是一个地窖的入口。\n\n在地窖左侧，你会看到两个叠放的板条箱，左边叠着两个桶，右边有一个小箱子。小石子就藏在桶后面，大约在|cFFFFFFFF37.2, 79.8|r。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52814 },	-- Step 8: Seventh Ordinary Pebble
				["coords"] = {
					{ 37.5, 80.3, BORALUS },	-- Entrance
					{ 37.2, 79.8, BORALUS },	-- Ordinary Pebble
				},
				["questID"] = 52813,
			}),
			o(293845, {	-- Step 10: Ninth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 10:|r Head to Drustvar. At the coordinates provided is a cave on the side of a small island (if you don't have flying, you'll have to fall/glide from up above). Don't go into the cave, but hop up on the large rock at the entrance.\n\nThe pebble is on top of the rock, partially obscured by vines. It's hard to see, so you'll probably have to zoom in a bit and jiggle your camera around a little to find it.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_10_R_HEAD_TO_DRUSTVAR_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 10:|r Head to Drustvar. At the coordinates provided is a cave on the side of a small island (if you don't have flying, you'll have to fall/glide from up above). Don't go into the cave, but hop up on the large rock at the entrance.\n\nThe pebble is on top of the rock, partially obscured by vines. It's hard to see, so you'll probably have to zoom in a bit and jiggle your camera around a little to find it.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 10 步：|r 前往德鲁斯瓦。在所给坐标处，一座小岛的一侧有一个洞穴（如果你没有飞行能力，就得从上方坠落或滑翔下去）。不要进入洞穴，而是跳到入口处的大石头上。\n\n小石子就在岩石顶上，部分被藤蔓遮挡。它很难看清，你大概需要放大一点并稍微转动镜头才能找到它。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52813 },	-- Step 9: Eighth Ordinary Pebble
				["coord"] = { 17.2, 6.5, DRUSTVAR },	-- Ordinary Pebble
				["questID"] = 52812,
			}),
			o(293846, {	-- Step 11: Tenth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 11:|r Head to Tiragarde Sound. At the coordinates provided, there's a well-hidden cave entrance in the ground. The cave is full of |ccccc3333Clatterbacks|r, but this time they're hidden underground and will jump out at you — if you don't have invisibility potions, be prepared to die.\n\nAgain, the pebble here is very hard to see. It's hidden between a rock and a pile of gore around |cFFFFFFFF74.3, 70.9|r, and it's covered in blood so it doesn't look as pale and bright as the previous pebbles.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_11_R_HEAD_TO_TIRAGARDE_SOUND_AT",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 11:|r Head to Tiragarde Sound. At the coordinates provided, there's a well-hidden cave entrance in the ground. The cave is full of |ccccc3333Clatterbacks|r, but this time they're hidden underground and will jump out at you — if you don't have invisibility potions, be prepared to die.\n\nAgain, the pebble here is very hard to see. It's hidden between a rock and a pile of gore around |cFFFFFFFF74.3, 70.9|r, and it's covered in blood so it doesn't look as pale and bright as the previous pebbles.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 11 步：|r 前往提拉加德海峡。在所给坐标处，地面上有一个非常隐蔽的洞穴入口。洞穴里满是|ccccc3333咔嗒背|r，但这次它们藏在地下，会突然跳出来攻击你——如果你没有隐形药水，就做好送死的准备吧。\n\n同样，这里的小石子非常难看清。它藏在|cFFFFFFFF74.3, 70.9|r附近的一块岩石和一堆血肉之间，而且沾满了血，所以看起来不像之前的小石子那样苍白明亮。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 52812 },	-- Step 10: Ningth Ordinary Pebble
				["coords"] = {
					{ 75.4, 70.7, TIRAGARDE_SOUND },	-- Entrance
					{ 74.3, 70.9, TIRAGARDE_SOUND },	-- Ordinary Pebble
				},
				["questID"] = 53632,
			}),
			o(303018, {	-- Step 12: Eleventh Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 12:|r The next pebble is also in Tiragarde Sound. At the coordinates provided, there is a cave hidden behind a waterfall. At the back right-hand side of the cave, there is a pillar with a couple of scrolls pinned to it.\n\nThe pebble is very well hidden, underneath the scroll that is unfurled over the ground. It's around |cFFFFFFFF79.7, 18.0|r, and you have to be standing practically on top of it with your camera tilted very far back in order to see it.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_12_R_THE_NEXT_PEBBLE_IS_ALSO_IN",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 12:|r The next pebble is also in Tiragarde Sound. At the coordinates provided, there is a cave hidden behind a waterfall. At the back right-hand side of the cave, there is a pillar with a couple of scrolls pinned to it.\n\nThe pebble is very well hidden, underneath the scroll that is unfurled over the ground. It's around |cFFFFFFFF79.7, 18.0|r, and you have to be standing practically on top of it with your camera tilted very far back in order to see it.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 12 步：|r 下一颗小石子也在提拉加德海峡。在所给坐标处，有一个藏在瀑布后面的洞穴。在洞穴的右后方，有一根柱子，上面钉着几卷卷轴。\n\n小石子藏得非常隐蔽，就在地上摊开的那卷卷轴下面。它大约在|cFFFFFFFF79.7, 18.0|r，你必须几乎站在它上面，并且把镜头向后仰得非常低才能看到它。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 53632 },	-- Step 11: Tenth Ordinary Pebble
				["coords"] = {
					{ 80.2, 19.2, TIRAGARDE_SOUND },	-- Entrance
					{ 79.7, 18.0, TIRAGARDE_SOUND },	-- Ordinary Pebble
				},
				["questID"] = 53633,
			}),
			o(303017, {	-- Step 13: Twelfth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 13:|r Head to Boralus. At the coordinates provided, there is a well hidden underwater cave. Its entrance is covered in a layer of seaweed that you can swim through. Head to the little island inside the cave, and on the right you'll see stalagmites on either side of some red kelp.\n\nThe pebble is hidden underneath the kelp around |cFFFFFFFF59.7, 41.8|r, and it's another one where you have to really play with your camera angle to find it.\n\nShift+click to refresh your collection.\n",
					constant = "CFFFFFFFFSTEP_13_R_HEAD_TO_BORALUS_AT_THE",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 13:|r Head to Boralus. At the coordinates provided, there is a well hidden underwater cave. Its entrance is covered in a layer of seaweed that you can swim through. Head to the little island inside the cave, and on the right you'll see stalagmites on either side of some red kelp.\n\nThe pebble is hidden underneath the kelp around |cFFFFFFFF59.7, 41.8|r, and it's another one where you have to really play with your camera angle to find it.\n\nShift+click to refresh your collection.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 13 步：|r 前往伯拉勒斯。在所给坐标处，有一个非常隐蔽的水下洞穴。它的入口被一层可以游过去的海草覆盖。前往洞穴内的小岛，在右侧你会看到红色海带两侧各有石笋。\n\n小石子藏在海带下方大约|cFFFFFFFF59.7, 41.8|r处，这又是一个你必须真正摆弄镜头角度才能找到的位置。\n\n按住 Shift 点击以刷新你的收藏。\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 53633 },	-- Step 12: Eleventh Ordinary Pebble
				["coords"] = {
					{ 10.0, 82.7, BORALUS },	-- Entrance
					{ 59.7, 41.8, TIRAGARDE_SOUND },	-- Ordinary Pebble
				},
				["questID"] = 53634,
			}),
			o(303016, {	-- Step 14: Thirteenth Ordinary Pebble
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 14:|r Head to the very northernmost point in Vol'dun. There will be three waypoints on your map, which you may have to zoom out to the continent map to see — south, central, and north.\n\nStart from the southern waypoint, fly to the central waypoint to reset your fatigue, and then head to the final waypoint to find an underwater cave. Again, Underlight Angler or other swim speed increases are probably necessary.\n\nYou can swim into the cave to reset your fatigue again, but the pebble is right inside the entrance. Swim down to the bottom and it's next to a rock and what looks like a small shard of rock, around |cFFFFFFFF55.8, -10.0|r.\n\nThe stone reads:\n\"<Something is carved into the stone.>\n\nHeckler of the Murkiest Thugs, sheathe \nyour\nBat and remove the Keg Cork, Wot?\"\n",
					constant = "CFFFFFFFFSTEP_14_R_HEAD_TO_THE_VERY",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 14:|r Head to the very northernmost point in Vol'dun. There will be three waypoints on your map, which you may have to zoom out to the continent map to see — south, central, and north.\n\nStart from the southern waypoint, fly to the central waypoint to reset your fatigue, and then head to the final waypoint to find an underwater cave. Again, Underlight Angler or other swim speed increases are probably necessary.\n\nYou can swim into the cave to reset your fatigue again, but the pebble is right inside the entrance. Swim down to the bottom and it's next to a rock and what looks like a small shard of rock, around |cFFFFFFFF55.8, -10.0|r.\n\nThe stone reads:\n\"<Something is carved into the stone.>\n\nHeckler of the Murkiest Thugs, sheathe \nyour\nBat and remove the Keg Cork, Wot?\"\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 14 步：|r 前往沃顿最北端的端点。你的地图上会有三个路径点，你可能需要缩小到大陆地图才能看到——南部、中部和北部。\n\n从南部的路径点出发，飞到中部路径点以重置疲劳，然后前往最后一个路径点寻找一个水下洞穴。同样，幽光鱼竿或其他提高游泳速度的手段很可能是必需的。\n\n你可以游进洞穴再次重置疲劳，但小石子就在入口里面。向下游到底部，它在一块岩石和一块看起来像小石片的东西旁边，大约在|cFFFFFFFF55.8, -10.0|r。\n\n石头上写着：\n“<石头上刻着什么东西。>\n\n最阴暗暴徒的嘲弄者，收起\n你的\n球棒并拔掉酒桶塞，咋样？”\n",
						-- TODO: tw = "",
					},
				}),
				["modelScale"] = 0.5,
				["sourceQuests"] = { 53634 },	-- Step 13: Twelfth Ordinary Pebble
				["coords"] = {
					{ 45.9, 3.7, ZANDALAR },	-- Starting Point
					{ 47.7, -3.0, ZANDALAR },	-- Fatigue Reset Zone
					{ 55.7, -10.2, ZANDALAR },	-- Underwater Cave
				},
				["questID"] = 52827,
			}),
			n(141909, {	-- Baa'l
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 15:|r Head to Frostfire Ridge. You'll find Baa'l at the coordinates provided, in a volcano, just chilling, like you do.\n\nSummon your empowered Uuna to weaken him, and then attack!  Dragonkin pets are a wise choice, but he's very easy to beat post-Uuna Reckoning regardless.\n\nEnjoy your new pet!  Hail Satan!\n",
					constant = "CFFFFFFFFSTEP_15_R_HEAD_TO_FROSTFIRE_RIDGE_YOU",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 15:|r Head to Frostfire Ridge. You'll find Baa'l at the coordinates provided, in a volcano, just chilling, like you do.\n\nSummon your empowered Uuna to weaken him, and then attack!  Dragonkin pets are a wise choice, but he's very easy to beat post-Uuna Reckoning regardless.\n\nEnjoy your new pet!  Hail Satan!\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 15 步：|r 前往霜火岭。你会在所给坐标处的一座火山里找到巴尔，它就那么待着，跟你一样。\n\n召唤你强化过的乌娜来削弱它，然后发起攻击！龙类宠物是明智之选，但即便在乌娜清算之后，它也非常容易击败。\n\n享受你的新宠物吧！撒旦万岁！\n",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 52827 },	-- Step 14: Thirteenth Ordinary Pebble
				["coord"] = { 62.3, 22.9, FROSTFIRE_RIDGE },
				["questID"] = 52828,
				["groups"] = { i(162578) },	-- Baa'ls Darksign (PET!)
			}),
		},
	})),
}));
