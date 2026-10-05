-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.LEGION, {
	header(HEADERS.NPC, 111573, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {	-- Kosumoth the Hungering
		["description"] = createLocalizationString({
			readable = "***Quest tracking enabled is required to see all the steps.***\n\nThis will show you how to unlock |cFFFFD700Kosumoth the Hungering|r, which has a world quest that awards the |cFFFFD700Hungering Claw|r pet or the |cFFFFD700Fathom Dweller|r mount.",
			constant = "QUEST_TRACKING_ENABLED_IS_REQUIRED_TO_SEE_ALL",
			export = true,
			text = {
				en = "***Quest tracking enabled is required to see all the steps.***\n\nThis will show you how to unlock |cFFFFD700Kosumoth the Hungering|r, which has a world quest that awards the |cFFFFD700Hungering Claw|r pet or the |cFFFFD700Fathom Dweller|r mount.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须开启任务追踪才能看到所有步骤。***\n\n这里会告诉你如何解锁|cFFFFD700饥饿的科苏莫斯|r，它有一个世界任务，奖励|cFFFFD700饥饿之爪|r宠物或|cFFFFD700深潜者|r坐骑。",
				-- TODO: tw = "",
			},
		}),
		["displayID"] = 71850,
		["groups"] = {
			n(TREASURES, {
				n(102695, {	-- Drak'thul
					["questID"] = 43715,	-- Step 1: Drak'thul
					["coord"] = { 37.2, 71.8, BROKEN_SHORE },
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 1:|r Head to |cFFFFFFFF37.2, 71.8|r. Speak with |cFFFFD700Drak'thul|r and choose option 1. \n\n|cffcc33ffThe demons are taking over this island, you may want to leave.|r \n\nChoose option 1 again. \n\n|cffcc33ffYou must know much. Will you help us defeat them?|r \n\nHe tells you to go away.",
						constant = "CFFFFFFFFSTEP_1_R_HEAD_TO_CFFFFFFFF37_2_71_8_R",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 1:|r Head to |cFFFFFFFF37.2, 71.8|r. Speak with |cFFFFD700Drak'thul|r and choose option 1. \n\n|cffcc33ffThe demons are taking over this island, you may want to leave.|r \n\nChoose option 1 again. \n\n|cffcc33ffYou must know much. Will you help us defeat them?|r \n\nHe tells you to go away.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 1 步：|r 前往|cFFFFFFFF37.2, 71.8|r。与|cFFFFD700达克苏尔|r交谈并选择选项 1。\n\n|cffcc33ff恶魔正在占领这座岛，你也许该离开。|r\n\n再次选择选项 1。\n\n|cffcc33ff你一定知道很多。你愿意帮我们击败他们吗？|r\n\n他让你走开。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252412, {	-- Step 2: Mound of Dirt
					["model"] = 658558,
					["modelScale"] = .5,
					["questID"] = 43729,
					["coords"] = {
						{ 58.5, 54.0, BROKEN_SHORE },
						{ 57.4, 55.9, BROKEN_SHORE },
					},
					["sourceQuest"] = 43715,	-- Step 1: Drak'thul
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep :2|r Head to the |cFFFFD700Feldust Cavern|r at |cFFFFFFFF58.56, 53.99|r. Walk inside to |cFFFFFFFF57.45, 55.95|r and click the |cFFFFD700Mound of Dirt|r to loot the |cFFFFD700Weathered Relic|r\n\nHead back to |cFFFFFFFF37.17, 71.82|r. Speak with |cFFFFD700Drak'thul|r and choose option 1. \n\n|cffcc33ffDo you recognize this relic?|r \n\nSpeak to him again and choose option 1. \n\n|cffcc33ffTell me of these whispers.|r\n\nSpeak to him again and choose option 1.\n\n|cffcc33ffDrak'thul?|r.\n\nSpeak to him again and choose option 1. \n\n|cffcc33ffYou are yourself again. What happened?|r \n\nSpeak to him again and he will tell you to go away",
						constant = "CFFFFFFFFSTEP_2_R_HEAD_TO_THE_CFFFFD700FELDUST",
						export = true,
						text = {
							en = "|cFFFFFFFFStep :2|r Head to the |cFFFFD700Feldust Cavern|r at |cFFFFFFFF58.56, 53.99|r. Walk inside to |cFFFFFFFF57.45, 55.95|r and click the |cFFFFD700Mound of Dirt|r to loot the |cFFFFD700Weathered Relic|r\n\nHead back to |cFFFFFFFF37.17, 71.82|r. Speak with |cFFFFD700Drak'thul|r and choose option 1. \n\n|cffcc33ffDo you recognize this relic?|r \n\nSpeak to him again and choose option 1. \n\n|cffcc33ffTell me of these whispers.|r\n\nSpeak to him again and choose option 1.\n\n|cffcc33ffDrak'thul?|r.\n\nSpeak to him again and choose option 1. \n\n|cffcc33ffYou are yourself again. What happened?|r \n\nSpeak to him again and he will tell you to go away",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 2 步：|r 前往|cFFFFFFFF58.56, 53.99|r的|cFFFFD700邪尘洞穴|r。进入后走到|cFFFFFFFF57.45, 55.95|r，点击|cFFFFD700土堆|r以拾取|cFFFFD700风化的遗物|r\n\n返回|cFFFFFFFF37.17, 71.82|r。与|cFFFFD700达克苏尔|r交谈并选择选项 1。\n\n|cffcc33ff你认得这件遗物吗？|r\n\n再次与他交谈并选择选项 1。\n\n|cffcc33ff跟我说说这些低语。|r\n\n再次与他交谈并选择选项 1。\n\n|cffcc33ff达克苏尔？|r。\n\n再次与他交谈并选择选项 1。\n\n|cffcc33ff你又恢复正常了。发生了什么？|r\n\n再次与他交谈，他会让你走开",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252557, {	-- Step 3: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43730,
					["coord"] = { 37.9, 37.4, AZSUNA },
					["sourceQuest"] = 43729,	-- Step 2: Mound of Dirt
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 3:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF37.96, 37.41|r, walk down into the cave and click on the purple |cFFFFD700Hungering Orb|r in the fountain.",
						constant = "CFFFFFFFFSTEP_3_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 3:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF37.96, 37.41|r, walk down into the cave and click on the purple |cFFFFD700Hungering Orb|r in the fountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 3 步：|r 此步骤将把你送往|cFFFFD700阿苏纳|r。前往|cFFFFFFFF37.96, 37.41|r，走进洞穴，点击喷泉中紫色的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252558, {	-- Step 4: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43731,
					["coord"] = { 32.9, 75.9, STORMHEIM },
					["sourceQuest"] = 43730,	-- Step 3: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 4:|r This step will send you to |cFFFFD700Stormheim|r. Head to |cFFFFFFFF32.92, 75.90|r, walk into the cave and make sure to avoid the |cFFFFD700Kangaxx|r. Click on the |cFFFFD700Hungering Orb|r at the back of the cave in the sack of scrolls.",
						constant = "CFFFFFFFFSTEP_4_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 4:|r This step will send you to |cFFFFD700Stormheim|r. Head to |cFFFFFFFF32.92, 75.90|r, walk into the cave and make sure to avoid the |cFFFFD700Kangaxx|r. Click on the |cFFFFD700Hungering Orb|r at the back of the cave in the sack of scrolls.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 4 步：|r 此步骤将把你送往|cFFFFD700风暴峡湾|r。前往|cFFFFFFFF32.92, 75.90|r，走进洞穴并务必避开|cFFFFD700坎加克斯|r。点击洞穴深处、一卷卷轴堆中的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252559, {	-- Step 5: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43732,
					["coord"] = { 41.5, 81.1, VALSHARAH },
					["sourceQuest"] = 43731,	-- Step 4: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 5:|r This step will send you to Val'sharah|r. Head to |cFFFFFFFF41.51, 84.18|r, walk into the cave and take a left to see a table with a note on it. Turn left and walk over the rocks, turn back right and kill the |cFFFFD700Arcane Servitor|r. Click the |cFFFFD700Hungering Orb|r sitting on the ground between two sleeping pads.",
						constant = "CFFFFFFFFSTEP_5_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 5:|r This step will send you to Val'sharah|r. Head to |cFFFFFFFF41.51, 84.18|r, walk into the cave and take a left to see a table with a note on it. Turn left and walk over the rocks, turn back right and kill the |cFFFFD700Arcane Servitor|r. Click the |cFFFFD700Hungering Orb|r sitting on the ground between two sleeping pads.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 5 步：|r 此步骤将把你送往瓦尔莎拉|r。前往|cFFFFFFFF41.51, 84.18|r，走进洞穴后向左转，会看到一张放着纸条的桌子。向左转，从岩石上走过去，再向右转回来，击杀|cFFFFD700奥术仆从|r。点击位于两个睡垫之间地上的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252560, {	-- Step 6: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43733,
					["coord"] = { 29.2, 78.5, BROKEN_SHORE },
					["sourceQuest"] = 43732,	-- Step 5: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 6:|r This step will send you to |cFFFFD700The Great Sea|r near |cFFFFD700Broken Shore|r. Head to |cFFFFFFFF29.16, 78.57|r, swim down and the cave is under the rock ledge. Walk forward avoiding the steam explosions and click on the |cFFFFD700Hungering Orb|r sitting under a leanto in some leaves.\n\n|cffcc33ffNote: Be careful not to die to fatigue, fatigue will stop once in the cave.|r",
						constant = "CFFFFFFFFSTEP_6_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 6:|r This step will send you to |cFFFFD700The Great Sea|r near |cFFFFD700Broken Shore|r. Head to |cFFFFFFFF29.16, 78.57|r, swim down and the cave is under the rock ledge. Walk forward avoiding the steam explosions and click on the |cFFFFD700Hungering Orb|r sitting under a leanto in some leaves.\n\n|cffcc33ffNote: Be careful not to die to fatigue, fatigue will stop once in the cave.|r",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 6 步：|r 此步骤将把你送往|cFFFFD700破碎海滩|r附近的|cFFFFD700无尽之海|r。前往|cFFFFFFFF29.16, 78.57|r，向下游，洞穴就在岩架下方。向前走，避开蒸汽爆炸，点击树叶中一个棚子下方的|cFFFFD700饥饿之球|r。\n\n|cffcc33ff注意：小心不要因疲劳而死亡，进入洞穴后疲劳就会停止。|r",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252561, {	-- Step 7: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43734,
					["coord"] = { 59.3, 13.1, AZSUNA },
					["sourceQuest"] = 43733,	-- Step 6: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 7:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF59.37, 13.13|r, walk down into the cave and click on the |cFFFFD700Hungering Orb|r that is wrapped in stone beside a broken table.",
						constant = "CFFFFFFFFSTEP_7_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 7:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF59.37, 13.13|r, walk down into the cave and click on the |cFFFFD700Hungering Orb|r that is wrapped in stone beside a broken table.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 7 步：|r 此步骤将把你送往|cFFFFD700阿苏纳|r。前往|cFFFFFFFF59.37, 13.13|r，走进洞穴，点击一张破桌子旁被石头包裹的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252562, {	-- Step 8: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43735,
					["coord"] = { 67.3, 14.7, BROKEN_ISLES },
					["sourceQuest"] = 43734,	-- Step 7: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 8:|r This step will send you to |cFFFFD700The Great Sea|r near |cFFFFD700Stormheim|r. Head to the |cFFFFD700Shield's Rest|r flight point. Fly northwest until you see a broken statue with a large axe in the water named |cFFFFD700Sotnar's Rest|r. Swim down where the hand comes out of the water between the 2 jutting  stones and you should see a |cFFFFD700Toothless Great White|r. Swim down beneath the shark and turn into the opening then swim up into the cave. Avoid the steam explosions and click on the |cFFFFD700Hungering Orb|r.",
						constant = "CFFFFFFFFSTEP_8_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 8:|r This step will send you to |cFFFFD700The Great Sea|r near |cFFFFD700Stormheim|r. Head to the |cFFFFD700Shield's Rest|r flight point. Fly northwest until you see a broken statue with a large axe in the water named |cFFFFD700Sotnar's Rest|r. Swim down where the hand comes out of the water between the 2 jutting  stones and you should see a |cFFFFD700Toothless Great White|r. Swim down beneath the shark and turn into the opening then swim up into the cave. Avoid the steam explosions and click on the |cFFFFD700Hungering Orb|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 8 步：|r 此步骤将把你送往|cFFFFD700风暴峡湾|r附近的|cFFFFD700无尽之海|r。前往|cFFFFD700盾憩|r飞行点。向西北飞，直到你在水中看到一座破碎的雕像，上面插着一把巨斧，名为|cFFFFD700索特纳之息|r。在手从 2 块突出的岩石之间伸出水面的地方向下游，你应该会看到一条|cFFFFD700无齿大白鲨|r。游到鲨鱼下方，转入开口处，再向上游进洞穴。避开蒸汽爆炸，点击|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252563, {	-- Step 9: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43736,
					["coord"] = { 55.8, 38.4, HIGHMOUNTAIN },
					["sourceQuest"] = 43735,	-- Step 8: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 9:|r This step will send you to |cFFFFD700Highmountain|r. Head to |cFFFFFFFF55.84, 38.47|r. This cave is to the right of the main cave here through the bushes. Click on the |cFFFFD700Hungering Orb|r that is under the dead animal skull on the ground.",
						constant = "CFFFFFFFFSTEP_9_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 9:|r This step will send you to |cFFFFD700Highmountain|r. Head to |cFFFFFFFF55.84, 38.47|r. This cave is to the right of the main cave here through the bushes. Click on the |cFFFFD700Hungering Orb|r that is under the dead animal skull on the ground.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 9 步：|r 此步骤将把你送往|cFFFFD700至高岭|r。前往|cFFFFFFFF55.84, 38.47|r。这个洞穴位于此处主洞穴的右侧，穿过灌木丛即可到达。点击地上死去的动物头骨下方的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252564, {	-- Step 10: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43737,
					["coord"] = { 54.0, 26.1, AZSUNA },
					["sourceQuest"] = 43736,	-- Step 9: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 10:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF54.02, 26.18|r, walk down into the cave and click the |cFFFFD700Hungering Orb|r that is under the plant next to the second pillar.",
						constant = "CFFFFFFFFSTEP_10_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 10:|r This step will send you to |cFFFFD700Azsuna|r. Head to |cFFFFFFFF54.02, 26.18|r, walk down into the cave and click the |cFFFFD700Hungering Orb|r that is under the plant next to the second pillar.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 10 步：|r 此步骤将把你送往|cFFFFD700阿苏纳|r。前往|cFFFFFFFF54.02, 26.18|r，走进洞穴，点击第二根柱子旁植物下方的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252565, {	-- Step 11: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43760,
					["coord"] = { 79.5, 89.3, EYE_OF_AZSHARA },
					["sourceQuest"] = 43737,	-- Step 10: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 11:|r This step will send you to |cFFFFD700Eye of Azshara|r, the zone. Head to |cFFFFFFFF79.52, 89.31|r. Swim down to find a wrecked ship, you can swim into the ship between the anchor and the rock throught the seaweed. Swim up and to the platform above and through the hole on right side. Now swim through the seaweed hole on left and down. Turn around and swim under the beam then through the seaweed to the left. Click the  |cFFFFD700Hungering Orb|r that is on the right side in the water.",
						constant = "CFFFFFFFFSTEP_11_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 11:|r This step will send you to |cFFFFD700Eye of Azshara|r, the zone. Head to |cFFFFFFFF79.52, 89.31|r. Swim down to find a wrecked ship, you can swim into the ship between the anchor and the rock throught the seaweed. Swim up and to the platform above and through the hole on right side. Now swim through the seaweed hole on left and down. Turn around and swim under the beam then through the seaweed to the left. Click the  |cFFFFD700Hungering Orb|r that is on the right side in the water.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 11 步：|r 此步骤将把你送往|cFFFFD700艾萨拉之眼|r区域。前往|cFFFFFFFF79.52, 89.31|r。向下游找到一艘沉船，你可以从锚和岩石之间穿过海草游进船里。向上游到上方的平台，从右侧的洞穿过去。然后从左边的海草洞向下游。转身，从横梁下方游过，再穿过左侧的海草。点击水中右侧的|cFFFFD700饥饿之球|r。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252434, {	-- Step 12: Hungering Orb
					["model"] = 249664,
					["modelScale"] = 2,
					["questID"] = 43761,
					["coord"] = { 37.1, 71.8, BROKEN_SHORE },
					["sourceQuest"] = 43760,	-- Step 11: Hungering Orb
					["description"] = createLocalizationString({
						readable = "|cFFFFFFFFStep 12:|r This step will send you to |cFFFFD700Broken Shore|r. Head to |cFFFFFFFF37.17, 71.82|r. Click the |cFFFFD700Hungering Orb|r that is on the stone table near |cFFFFD700Drak'Thul|r",
						constant = "CFFFFFFFFSTEP_12_R_THIS_STEP_WILL_SEND_YOU_TO",
						export = true,
						text = {
							en = "|cFFFFFFFFStep 12:|r This step will send you to |cFFFFD700Broken Shore|r. Head to |cFFFFFFFF37.17, 71.82|r. Click the |cFFFFD700Hungering Orb|r that is on the stone table near |cFFFFD700Drak'Thul|r",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFFFFF第 12 步：|r 此步骤将把你送往|cFFFFD700破碎海滩|r。前往|cFFFFFFFF37.17, 71.82|r。点击|cFFFFD700达克苏尔|r附近石桌上的|cFFFFD700饥饿之球|r",
							-- TODO: tw = "",
						},
					}),
				}),
			}),
			n(RARES, {
				n(111573, {	-- Kosumoth the Hungering
					["maps"] = { EYE_OF_AZSHARA },
					["questID"] = 45479,
					["groups"] = {
						q(43798, {	-- DANGER: Kosumoth the Hungering
							["sourceQuest"] = 43761,	-- Step 12: Hungering Orb
							["repeatable"] = true,
							["groups"] = {
								i(140261),	-- Hungering Claw (PET!)
								i(138201),	-- Fathom Dweller (MOUNT!)
							},
						}),
					},
				}),
			}),
		},
	})),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, {
	header(HEADERS.NPC, 111573, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {	-- Kosumoth the Hungering
		q(43725),	-- Flag 2 triggers on repeated dialogue from Drak'thul during Step 2.
		q(43727),	-- Flag 3 triggers on repeated dialogue from Drak'thul during Step 2.
		q(43728),	-- Flag 4 triggers on repeated dialogue from Drak'thul during Step 2.
		q(91076, { ["timeline"] = { ADDED_LEGION_REMIX, REMOVED_LEGION_REMIX_END } }),	-- Obtain final orb within Legion Remix, unlocks Fathom Dweller at Infinite Bazaar
	})),
}));
