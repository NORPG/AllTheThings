-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.LEGION, {
	header(HEADERS.Spell, 247402, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_0 } }, {	-- Lucid Nightmare
		["description"] = createLocalizationString({
			readable = "***Quest tracking enabled is required to see all the steps.***",
			constant = "QUEST_TRACKING_ENABLED_IS_REQUIRED_TO_SEE_ALL_2",
			export = true,
			text = {
				en = "***Quest tracking enabled is required to see all the steps.***",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须开启任务追踪才能看到所有步骤。***",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = .8,
		["displayID"] = 78092,
		["groups"] = {
			o(270855, {	-- Step 1: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47826,
				["coord"] = { 50.6, 54.1, LEGION_DALARAN },
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 1:|r Go to |cFFFFFFFF50.6, 54.1|r in Broken Isles Dalaran. On the second floor of |cFFFFD700Curiosities & Moore|r you will see a table with three chairs. An |cFFFFD700Inconspicuous Note|r will be on the table. Click it. The note reads...\n\n|cFFFFFFFFIt begins in the 2104059.|r\n|cFFFFFFFFWith a most pleasing sign.|r\n|cFFFFFFFF(These letters will not always rhyme.)|r\n",
					constant = "CFFFFFFFFSTEP_1_R_GO_TO_CFFFFFFFF50_6_54_1_R_IN",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 1:|r Go to |cFFFFFFFF50.6, 54.1|r in Broken Isles Dalaran. On the second floor of |cFFFFD700Curiosities & Moore|r you will see a table with three chairs. An |cFFFFD700Inconspicuous Note|r will be on the table. Click it. The note reads...\n\n|cFFFFFFFFIt begins in the 2104059.|r\n|cFFFFFFFFWith a most pleasing sign.|r\n|cFFFFFFFF(These letters will not always rhyme.)|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 前往破碎群岛达拉然的|cFFFFFFFF50.6, 54.1|r。在|cFFFFD700奇珍异宝|r的二楼，你会看到一张配有三把椅子的桌子。桌上会有一张|cFFFFD700不起眼的纸条|r。点击它。纸条上写着……\n\n|cFFFFFFFF它始于 2104059。|r\n|cFFFFFFFF带着一个最令人愉悦的记号。|r\n|cFFFFFFFF（这些字母并不总是押韵。）|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272039, {	-- Step 2: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47837,
				["coord"] = { 41.5, 17.9, THE_STORM_PEAKS },	-- Ulduar
				["sourceQuest"] = 47826,	-- Step 1: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 2:|r This step requires visiting |cFFFFD700Ulduar|r. Head to |cFFFFD700XT-002 Deconstructor's|r room. Go to the trash pile in the upper-left corner of the map. You will see a broken body with blue legs on the ground. Look directly above it and you will see a head with a |cFFFFD700Rusty Lever|r. Click the lever to activate the lights in the middle of the Scrapyard. Click each light in the pattern below.\n\n0 = OFF     |cffcc33ff1|r = ON\n\n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n\nOnce you have turned on all the necessary lights, the next |cFFFFD700Inconspicuous Note|r will spawn in the middle. Click it. The note reads...\n\n|cFFFFFFFF1000 years imprisoned.|r\n|cFFFFFFFFSurely it wears on the mind.|r\n",
					constant = "CFFFFFFFFSTEP_2_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 2:|r This step requires visiting |cFFFFD700Ulduar|r. Head to |cFFFFD700XT-002 Deconstructor's|r room. Go to the trash pile in the upper-left corner of the map. You will see a broken body with blue legs on the ground. Look directly above it and you will see a head with a |cFFFFD700Rusty Lever|r. Click the lever to activate the lights in the middle of the Scrapyard. Click each light in the pattern below.\n\n0 = OFF     |cffcc33ff1|r = ON\n\n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n\nOnce you have turned on all the necessary lights, the next |cFFFFD700Inconspicuous Note|r will spawn in the middle. Click it. The note reads...\n\n|cFFFFFFFF1000 years imprisoned.|r\n|cFFFFFFFFSurely it wears on the mind.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 此步骤需要前往|cFFFFD700奥杜尔|r。前往|cFFFFD700XT-002 拆解者|r的房间。走到地图左上角的垃圾堆。你会看到地上有一具蓝色腿的破损躯体。直视其上方，你会看到一个头部，上面有一根|cFFFFD700生锈的拉杆|r。点击拉杆以激活废料场中央的灯。按下面的图案点击每一盏灯。\n\n0 = 关     |cffcc33ff1|r = 开\n\n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n|cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r \n0 0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 \n0 0 |cffcc33ff1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1|r 0 0 \n0 0 0 |cffcc33ff1 1 1|r 0 |cffcc33ff1 1 1 1 1 1|r 0 |cffcc33ff1 1 1|r 0 0 0 \n0 0 0 0 |cffcc33ff1|r 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 |cffcc33ff1|r 0 0 0 0 \n0 0 0 0 0 0 0 |cffcc33ff1 1 1 1 1 1|r 0 0 0 0 0 0 0 \n\n当你点亮所有必要的灯后，下一张|cFFFFD700不起眼的纸条|r会在中央刷新。点击它。纸条上写着……\n\n|cFFFFFFFF被囚禁 1000 年。|r\n|cFFFFFFFF想必早已侵蚀心智。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272046, {	-- Step 3: Mind Larva
				["model"] = 202390,
				["questID"] = 47840,
				["coord"] = { 46.76, 7.53, AHNQIRAJ_THE_FALLEN_KINGDOM },	-- Temple of Ahn'Qiraj
				["sourceQuest"] = 47837,	-- Step 2: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 3:|r This step requires visiting |cFFFFD700Temple of Ahn'Qiraj|r. Go all the way through the instance, past |cFFFFD700C'thun|r's room into the room with three vendors. Once you see the three vendors, go up the stairs and you will see a table that has a glowing |cFFFFD700Mind Larva|r on it. Click the |cFFFFD700Mind Larva|r to activate a game similar to the |cFFFFD700Jewelcraft|r toy.\n\n|cffcc33ffTips: Hit Alt+Z to hide your interface and then scroll into first-person view. You can also use the right mouse button to turn your character around for easier viewing.|r\n\nYou need to play until you can line up five brains horizontally or vertically, or until you reach an unknown point cap. Just keep playing, and you'll eventually trigger it.|r\n",
					constant = "CFFFFFFFFSTEP_3_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 3:|r This step requires visiting |cFFFFD700Temple of Ahn'Qiraj|r. Go all the way through the instance, past |cFFFFD700C'thun|r's room into the room with three vendors. Once you see the three vendors, go up the stairs and you will see a table that has a glowing |cFFFFD700Mind Larva|r on it. Click the |cFFFFD700Mind Larva|r to activate a game similar to the |cFFFFD700Jewelcraft|r toy.\n\n|cffcc33ffTips: Hit Alt+Z to hide your interface and then scroll into first-person view. You can also use the right mouse button to turn your character around for easier viewing.|r\n\nYou need to play until you can line up five brains horizontally or vertically, or until you reach an unknown point cap. Just keep playing, and you'll eventually trigger it.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 此步骤需要前往|cFFFFD700安其拉神殿|r。一路穿过副本，经过|cFFFFD700克苏恩|r的房间，进入有三个商人的房间。看到三个商人后，走上楼梯，你会看到一张桌子，上面有一个发光的|cFFFFD700心灵幼虫|r。点击|cFFFFD700心灵幼虫|r以激活一个类似|cFFFFD700珠宝加工|r玩具的游戏。\n\n|cffcc33ff提示：按 Alt+Z 隐藏界面，然后滚动进入第一人称视角。你也可以用鼠标右键转动角色以便更好地观察。|r\n\n你需要一直玩到能在水平或垂直方向连成五个脑子的直线，或达到某个未知的分数上限。继续玩下去，你最终会触发它。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272061, {	-- Step 4: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47841,
				["coord"] = { 58.2, 25.5, DEEPHOLM },
				["sourceQuest"] = 47840,	-- Step 3: Mind Larva
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 4:|r The next |cFFFFD700Inconspicuous Note|r will spawn on the table. Click it. The note reads...\r\r|cFFFFFFFFDeeper than deep.|r\r|cFFFFFFFFAwaits your seat.|r\n",
					constant = "CFFFFFFFFSTEP_4_R_THE_NEXT",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 4:|r The next |cFFFFD700Inconspicuous Note|r will spawn on the table. Click it. The note reads...\r\r|cFFFFFFFFDeeper than deep.|r\r|cFFFFFFFFAwaits your seat.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 4 步：|r 下一张|cFFFFD700不起眼的纸条|r会在桌上刷新。点击它。纸条上写着……|cFFFFFFFF比深处更深。|r|cFFFFFFFF等待着你的座位。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272163, {	-- Step 5: Strange Skull
				["model"] = 985300,
				["questID"] = 47849,
				["coords"] = {
					{ 63.7, 22.6, DEEPHOLM },
					{ 58.3, 25.6, DEEPHOLM },
				},
				["sourceQuest"] = 47841,	-- Step 4: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 5:|r First, obtain a |cFFFFD700Shadoweave Mask|r. |cffcc33ffNote: You will need the actual item; it cannot be transmogged on your character.|r\n\nThis step requires visiting Deepholm. Take the |cFFFFD700Therazane's Throne|r portal if it is available; otherwise, fly to |cFFFFFFFF58.3, 25.6|r and you will see a cave opening to |cFFFFD700Crumbling Depths|r.\n\nOnce you are in the cave, mount up and go past the |cFFFFD700Colossal Gyreworm|r into the next section of the cavern. Go to the big grey rock in the center of the room at |cFFFFFFFF63.7, 22.6|r and you will see a |cFFFFD700Dark Fissure|r. Click it. Once you click it, a warning will pop up, saying: \n\n|cffcc33ff'WARNING: you are about to fall into a dark fissure. You may not be able to climb back out again. Are you very sure you want to do this?'|r\n\nOnce inside the fissure, you will see a chair. Go behind the chair and click on the |cFFFFD700Dingy Plaque|r. The plaque reads... \r\r|cFFFFFFFFSupremacy?|r\r|cFFFFFFFFGet...|r\r|cFFFFFFFFShirk...|r\r|cFFFFFFFF...eke...|r\r\rThis will spawn a |cFFFFD700Strange Skull|r on the seat of the chair. Equip the Shadoweave Mask and interact with the |cFFFFD700Strange Skull|r and you will see a purple explosion.|r\n",
					constant = "CFFFFFFFFSTEP_5_R_FIRST_OBTAIN_A",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 5:|r First, obtain a |cFFFFD700Shadoweave Mask|r. |cffcc33ffNote: You will need the actual item; it cannot be transmogged on your character.|r\n\nThis step requires visiting Deepholm. Take the |cFFFFD700Therazane's Throne|r portal if it is available; otherwise, fly to |cFFFFFFFF58.3, 25.6|r and you will see a cave opening to |cFFFFD700Crumbling Depths|r.\n\nOnce you are in the cave, mount up and go past the |cFFFFD700Colossal Gyreworm|r into the next section of the cavern. Go to the big grey rock in the center of the room at |cFFFFFFFF63.7, 22.6|r and you will see a |cFFFFD700Dark Fissure|r. Click it. Once you click it, a warning will pop up, saying: \n\n|cffcc33ff'WARNING: you are about to fall into a dark fissure. You may not be able to climb back out again. Are you very sure you want to do this?'|r\n\nOnce inside the fissure, you will see a chair. Go behind the chair and click on the |cFFFFD700Dingy Plaque|r. The plaque reads... \r\r|cFFFFFFFFSupremacy?|r\r|cFFFFFFFFGet...|r\r|cFFFFFFFFShirk...|r\r|cFFFFFFFF...eke...|r\r\rThis will spawn a |cFFFFD700Strange Skull|r on the seat of the chair. Equip the Shadoweave Mask and interact with the |cFFFFD700Strange Skull|r and you will see a purple explosion.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 5 步：|r 首先，获得一个|cFFFFD700暗影编织面罩|r。|cffcc33ff注意：你需要实体物品，无法通过角色幻化来满足条件。|r\n\n此步骤需要前往深岩之洲。如果|cFFFFD700瑟拉赞恩的王座|r传送门可用，就走传送门；否则飞到|cFFFFFFFF58.3, 25.6|r，你会看到一个通往|cFFFFD700崩裂深渊|r的洞口。\n\n进入洞穴后，上坐骑，经过|cFFFFD700巨型旋岩虫|r进入洞穴的下一个区域。前往房间中央|cFFFFFFFF63.7, 22.6|r处的大灰色岩石，你会看到一个|cFFFFD700黑暗裂隙|r。点击它。点击后会弹出一个警告，写着：\n\n|cffcc33ff“警告：你即将掉入一个黑暗裂隙。你可能无法再爬出来。你确定要这样做吗？”|r\n\n进入裂隙后，你会看到一把椅子。走到椅子后面，点击|cFFFFD700阴暗的牌匾|r。牌匾上写着……|cFFFFFFFF霸权？|r|cFFFFFFFF得到……|r|cFFFFFFFF逃避……|r|cFFFFFFFF……苟活……|r\n\n这会在椅子的座位上刷新一个|cFFFFD700奇怪的头骨|r。装备暗影编织面罩并与|cFFFFD700奇怪的头骨|r互动，你会看到一次紫色爆炸。|r\n",
						-- TODO: tw = "",
					},
				}),
				["cost"] = { { "i", 10025, 1 } },	-- Shadoweave Mask
			}),
			o(272165, {	-- Step 6: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47850,
				["coord"] = { 66.5, 36.0, VALSHARAH },
				["sourceQuest"] = 47849,	-- Step 5: Strange Skull
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 6:|r The next |cFFFFD700Inconspicuous Note|r spawns in front of the chair. Click it. The note reads...\r\r|cFFFFFFFFWhere the shaded delegate may appear.|r\n",
					constant = "CFFFFFFFFSTEP_6_R_THE_NEXT",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 6:|r The next |cFFFFD700Inconspicuous Note|r spawns in front of the chair. Click it. The note reads...\r\r|cFFFFFFFFWhere the shaded delegate may appear.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 6 步：|r 下一张|cFFFFD700不起眼的纸条|r会在椅子前方刷新。点击它。纸条上写着……|cFFFFFFFF在有阴影的代表可能出现的地方。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272172, {	-- Step 7: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47852,
				["coord"] = { 30.11, 74.64, NEW_TINKERTOWN_LOWER },	-- Gnomeregan
				["sourceQuest"] = 47850,	-- Step 6: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 7:|r This step requires visiting |cFFFFD700Gnomeregan|r. \n\nNote: Horde players can easily get to Gnomeregan by taking the zeppelin from Orgrimmar and using the teleporter at Grom'gol Base Camp. Players of either faction who have done the Gnomeregan pet battle dungeon can be teleported there directly by speaking to |cff006812Manapoof|r in Broken Isles Dalaran or their BfA capital city.\n\nOnce inside the instance, go straight and jump down into the |cFFFFD700Hall of Gears|r. From here, take the winding hallway towards the |cFFFFD700Launch Bay|r. About halfway between the |cFFFFD700Launch Bay|r and |cff863325Crowd-Pummeler 9-60|r, there will be a plaque on the wall called |cFFFFD700Instructions|r and a set of 10 |cFFFFD700Numerical Consoles|r. Click the Instructions. They read:\n\n|cFFFFFFFF0111011 00100 10010110 1010|r\n|cFFFFFFFF11110111 01100 01111111 01000|r\n|cFFFFFFFF01101011100101 1010010110 10111101|r\n|cFFFFFFFF11001 00111111 10010 01001001|r\n|cFFFFFFFF10000 011010010110100111010110|r\n|cFFFFFFFF01011011 11110 11110001 11111|r\n|cFFFFFFFF11100000 00010 11111111 01000|r\n|cFFFFFFFF10110111 10101 01111111 00001|r\n|cFFFFFFFF10101110 11111 00110000 01000|r\n|cFFFFFFFF101101010010101110010110|r\n\n|cFFFFFFFF180|r\n\n|cFFFFFFFF+1111111111|r\n\nSetting the consoles to |cFFFFFFFF1222176597|r will cause the fifth |cFFFFD700Inconspicuous Note|r to spawn.\n\n|cffcc33ffNote: You can use the following scripts as macros for 'up' and 'down,' respectively:|r\n|cffcc33ff/script SelectGossipOption(1)|r\n|cffcc33ff/script SelectGossipOption(2)|r\n\nClick it. The note reads...\n\n|cFFFFFFFFGames and toys are left behind.|r\n|cFFFFFFFFWhen you awaken screaming.|r\n",
					constant = "CFFFFFFFFSTEP_7_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 7:|r This step requires visiting |cFFFFD700Gnomeregan|r. \n\nNote: Horde players can easily get to Gnomeregan by taking the zeppelin from Orgrimmar and using the teleporter at Grom'gol Base Camp. Players of either faction who have done the Gnomeregan pet battle dungeon can be teleported there directly by speaking to |cff006812Manapoof|r in Broken Isles Dalaran or their BfA capital city.\n\nOnce inside the instance, go straight and jump down into the |cFFFFD700Hall of Gears|r. From here, take the winding hallway towards the |cFFFFD700Launch Bay|r. About halfway between the |cFFFFD700Launch Bay|r and |cff863325Crowd-Pummeler 9-60|r, there will be a plaque on the wall called |cFFFFD700Instructions|r and a set of 10 |cFFFFD700Numerical Consoles|r. Click the Instructions. They read:\n\n|cFFFFFFFF0111011 00100 10010110 1010|r\n|cFFFFFFFF11110111 01100 01111111 01000|r\n|cFFFFFFFF01101011100101 1010010110 10111101|r\n|cFFFFFFFF11001 00111111 10010 01001001|r\n|cFFFFFFFF10000 011010010110100111010110|r\n|cFFFFFFFF01011011 11110 11110001 11111|r\n|cFFFFFFFF11100000 00010 11111111 01000|r\n|cFFFFFFFF10110111 10101 01111111 00001|r\n|cFFFFFFFF10101110 11111 00110000 01000|r\n|cFFFFFFFF101101010010101110010110|r\n\n|cFFFFFFFF180|r\n\n|cFFFFFFFF+1111111111|r\n\nSetting the consoles to |cFFFFFFFF1222176597|r will cause the fifth |cFFFFD700Inconspicuous Note|r to spawn.\n\n|cffcc33ffNote: You can use the following scripts as macros for 'up' and 'down,' respectively:|r\n|cffcc33ff/script SelectGossipOption(1)|r\n|cffcc33ff/script SelectGossipOption(2)|r\n\nClick it. The note reads...\n\n|cFFFFFFFFGames and toys are left behind.|r\n|cFFFFFFFFWhen you awaken screaming.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 7 步：|r 此步骤需要前往|cFFFFD700诺莫瑞根|r。\n\n注意：部落玩家可以从奥格瑞玛乘坐飞艇，并使用格罗姆高营地的传送器轻松抵达诺莫瑞根。完成过诺莫瑞根宠物对战地下城的任意阵营玩家，都可以通过与破碎群岛达拉然或争霸艾泽拉斯主城中的|cff006812马纳波夫|r交谈直接传送过去。\n\n进入副本后，直走并跳入|cFFFFD700齿轮大厅|r。从这里沿蜿蜒的走廊前往|cFFFFD700发射台|r。在|cFFFFD700发射台|r和|cff863325人群痛击者 9-60|r之间大约一半的位置，墙上会有一块名为|cFFFFD700说明|r的牌匾，以及一组 10 个|cFFFFD700数字控制台|r。点击说明。上面写着：\n\n|cFFFFFFFF0111011 00100 10010110 1010|r\n|cFFFFFFFF11110111 01100 01111111 01000|r\n|cFFFFFFFF01101011100101 1010010110 10111101|r\n|cFFFFFFFF11001 00111111 10010 01001001|r\n|cFFFFFFFF10000 011010010110100111010110|r\n|cFFFFFFFF01011011 11110 11110001 11111|r\n|cFFFFFFFF11100000 00010 11111111 01000|r\n|cFFFFFFFF10110111 10101 01111111 00001|r\n|cFFFFFFFF10101110 11111 00110000 01000|r\n|cFFFFFFFF101101010010101110010110|r\n\n|cFFFFFFFF180|r\n\n|cFFFFFFFF+1111111111|r\n\n将控制台设置为|cFFFFFFFF1222176597|r将导致第五张|cFFFFD700不起眼的纸条|r刷新。\n\n|cffcc33ff注意：你可以分别使用以下脚本作为“上”和“下”的宏：|r\n|cffcc33ff/script SelectGossipOption(1)|r\n|cffcc33ff/script SelectGossipOption(2)|r\n\n点击它。纸条上写着……\n\n|cFFFFFFFF游戏和玩具被遗留在身后。|r\n|cFFFFFFFF当你尖叫着醒来时。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272181, {	-- Step 8: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47863,
				["coord"] = { 66.0, 36.5, VALSHARAH },
				["sourceQuest"] = 47852,	-- Step 7: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 8:|r This step requires visiting |cFFFFD700Val'sharah|r. Head to |cFFFFFFFF66.0, 36.5|r. Inside the house next to |cff863325Wraithtalon|r is a |cFFFFD700Nightmare Tumor|r. Click it to start the next puzzle.\n\n|cffcc33ffTips: Hit Alt+Z to hide your interface and then scroll into first-person view. You can also use the right mouse button to turn your character around for easier viewing.|r\n\nThis puzzle is similar to |cFFFFD700Blingtron's Circuit Design Tutorial|r or the ley line puzzles in |cFFFFD700Nazjatar|r.\n\nThe object of the puzzle is to untangle all of the lines so that none cross each other and turn blue. Once you complete it, another |cFFFFD700Inconspicuous Note|r will appear. Click it. The note reads...\r\r|cFFFFFFFFWhat you seek is buried within.|r\n",
					constant = "CFFFFFFFFSTEP_8_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 8:|r This step requires visiting |cFFFFD700Val'sharah|r. Head to |cFFFFFFFF66.0, 36.5|r. Inside the house next to |cff863325Wraithtalon|r is a |cFFFFD700Nightmare Tumor|r. Click it to start the next puzzle.\n\n|cffcc33ffTips: Hit Alt+Z to hide your interface and then scroll into first-person view. You can also use the right mouse button to turn your character around for easier viewing.|r\n\nThis puzzle is similar to |cFFFFD700Blingtron's Circuit Design Tutorial|r or the ley line puzzles in |cFFFFD700Nazjatar|r.\n\nThe object of the puzzle is to untangle all of the lines so that none cross each other and turn blue. Once you complete it, another |cFFFFD700Inconspicuous Note|r will appear. Click it. The note reads...\r\r|cFFFFFFFFWhat you seek is buried within.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 8 步：|r 此步骤需要前往|cFFFFD700瓦尔莎拉|r。前往|cFFFFFFFF66.0, 36.5|r。在|cff863325幽灵之爪|r旁边的房子内有一个|cFFFFD700梦魇肿瘤|r。点击它以开始下一个谜题。\n\n|cffcc33ff提示：按 Alt+Z 隐藏界面，然后滚动进入第一人称视角。你也可以用鼠标右键转动角色以便更好地观察。|r\n\n这个谜题类似于|cFFFFD700布林顿的电路设计教程|r或|cFFFFD700纳沙塔尔|r的魔网谜题。\n\n谜题的目标是把所有线条理清，使它们互不交叉并变成蓝色。完成后，会出现另一张|cFFFFD700不起眼的纸条|r。点击它。纸条上写着……|cFFFFFFFF你所寻找的东西就埋藏其中。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272220, {	-- Step 9: Inconspicuous Note
				["model"] = 1661948,
				["questID"] = 47881,
				["coord"] = { 53.4, 49.0, KUN_LAI_SUMMIT },
				["sourceQuest"] = 47863,	-- Step 8: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 9:|r This step requires visiting |cFFFFD700Kun-Lai Summit|r. Head to |cFFFFFFFF53.4, 49.0|r. This is the entrance to the |cFFFFD700Tomb of Secrets|r. At the very back of the tomb, there will be an |cFFFFD700Urn|r at the base of a tall Mogu statue. Click it.\r\r|cffcc33ffWARNING: You are about to consume the ashes of an evil sorcerer. There is no way to tell what will happen. Are you VERY sure you want to do this?|r\n\nYou will be teleported to the |cFFFFD700Endless Halls|r where you will have to figure a way out. \r\r1. (Optional) Download the addon |cFFFFFFFFLucid Nightmare Helper|r, which will help you with the endless maze by generating a map of the rooms as you go and letting you notate special things in each one.\n2. Each room in the Endless Halls is identical, but some doorways will be blocked by stones. \r3. Each room has an altar in the middle. The runes spawn on the altar and the orbs spawn on the torches to either side. \r4. Most rooms will have unlit torches and no rune. \r5. The goal is to find a colored orb and then take the orb to the corresponding rune. \r6. The colors are |cFFFFD700Red, Blue, Green, Yellow, and Purple|r. \r\r|cffcc33ffNotes:|r\n|cffcc33ff1. Do not try this close to server reset. It could easily take a couple of hours to complete.\n|cffcc33ff2.If you are struggling with the maze and want to reset it, you need to leave the area for one hour.|r\n\nOnce you match all the orbs and runes, walk through any doorway. In the next room, there will be another |cFFFFD700Inconspicuous Note|r on an altar. Click it. After you read it, turn around and walk up the stairs to exit the maze. The note reads...\n\n|cFFFFFFFFThe way is now open.|r\n|cFFFFFFFFTo the greatest secret never told.|r\n|cFFFFFFFFA fitting end to your journey.|r\n",
					constant = "CFFFFFFFFSTEP_9_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 9:|r This step requires visiting |cFFFFD700Kun-Lai Summit|r. Head to |cFFFFFFFF53.4, 49.0|r. This is the entrance to the |cFFFFD700Tomb of Secrets|r. At the very back of the tomb, there will be an |cFFFFD700Urn|r at the base of a tall Mogu statue. Click it.\r\r|cffcc33ffWARNING: You are about to consume the ashes of an evil sorcerer. There is no way to tell what will happen. Are you VERY sure you want to do this?|r\n\nYou will be teleported to the |cFFFFD700Endless Halls|r where you will have to figure a way out. \r\r1. (Optional) Download the addon |cFFFFFFFFLucid Nightmare Helper|r, which will help you with the endless maze by generating a map of the rooms as you go and letting you notate special things in each one.\n2. Each room in the Endless Halls is identical, but some doorways will be blocked by stones. \r3. Each room has an altar in the middle. The runes spawn on the altar and the orbs spawn on the torches to either side. \r4. Most rooms will have unlit torches and no rune. \r5. The goal is to find a colored orb and then take the orb to the corresponding rune. \r6. The colors are |cFFFFD700Red, Blue, Green, Yellow, and Purple|r. \r\r|cffcc33ffNotes:|r\n|cffcc33ff1. Do not try this close to server reset. It could easily take a couple of hours to complete.\n|cffcc33ff2.If you are struggling with the maze and want to reset it, you need to leave the area for one hour.|r\n\nOnce you match all the orbs and runes, walk through any doorway. In the next room, there will be another |cFFFFD700Inconspicuous Note|r on an altar. Click it. After you read it, turn around and walk up the stairs to exit the maze. The note reads...\n\n|cFFFFFFFFThe way is now open.|r\n|cFFFFFFFFTo the greatest secret never told.|r\n|cFFFFFFFFA fitting end to your journey.|r\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 9 步：|r 此步骤需要前往|cFFFFD700昆莱山|r。前往|cFFFFFFFF53.4, 49.0|r。这是|cFFFFD700秘密之墓|r的入口。在墓穴最深处，一座高大的魔古雕像基座处会有一个|cFFFFD700骨灰瓮|r。点击它。|cffcc33ff警告：你即将吞下一位邪恶巫师的骨灰。无法预知会发生什么。你非常确定要这样做吗？|r\n\n你将被传送到|cFFFFD700无尽大厅|r，必须想办法出去。 1.（可选）下载插件|cFFFFFFFF清醒梦魇助手|r，它会随着你的前进生成房间地图，并让你标记每个房间中的特殊事物，从而帮助你应对无尽迷宫。\n2. 无尽大厅中的每个房间都完全相同，但有些门口会被石头堵住。 3. 每个房间中央都有一个祭坛。符文刷新在祭坛上，宝珠刷新在两侧的火把上。 4. 大多数房间会有未点燃的火把，也没有符文。 5. 目标是找到一颗有色宝珠，然后把宝珠带到对应颜色的符文处。 6. 颜色为|cFFFFD700红、蓝、绿、黄和紫|r。 \n\n|cffcc33ff注意：|r\n|cffcc33ff1. 不要在服务器重置前尝试。完成它很可能需要几个小时。\n|cffcc33ff2. 如果你在迷宫中遇到困难并想重置它，你需要离开该区域一小时。|r\n\n当你把所有宝珠和符文都配对后，穿过任意一个门口。在下一个房间中，祭坛上会有另一张|cFFFFD700不起眼的纸条|r。点击它。读完后，转身走上楼梯离开迷宫。纸条上写着……\n\n|cFFFFFFFF道路现已开启。|r\n|cFFFFFFFF通往从未被告知的伟大秘密。|r\n|cFFFFFFFF你旅程的完美结局。|r\n",
						-- TODO: tw = "",
					},
				}),
			}),
			o(272270, {	-- Step 10: Puzzler's Desire
				["model"] = 942865,
				["questID"] = 47885,
				["coord"] = { 39.8, 73.6, DEADWIND_PASS },
				["sourceQuest"] = 47881,	-- Step 9: Inconspicuous Note
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 10:|r This step requires visiting |cFFFFD700Deadwind Pass|r. Head to |cFFFFFFFF39.8, 73.6|r, the entrance to the Forgotten Crypt.\n\nOnce inside, head down the stairs into the |cFFFFD700Well of the Forgotten|r. Head into the |cFFFFD700Pauper's Walk|r hallway and follow it into the |cFFFFD700Forgotten Crypt.|r\n\nTake a right and then another right back into |cFFFFD700Pauper's Walk|r, then take a right at the Y and walk down the spiral, back into the |cFFFFD700Forgotten Crypt|r.\nTake a left and another left into the |cFFFFD700Tomb of the Unrepentant.|r\nOpen the gate and fall down the hole to the right (just drop down one level, not two). Walk into |cFFFFD700The Pit of Criminals|r, and |cFFFFD700Puzzler's Desire|r is on top of the bone pile.\n\n|cffcc33ffNote: If you are on the Warlock Affiction artifact quest and can't see the Puzzler's Desire, then you will have to abandon the quest to solve the phasing issue.\n\nCongratulations on your mount!|r\n\nWe would like to thank the |cFFFFD700Secret Finding Discord|r for solving yet another puzzle.\n",
					constant = "CFFFFFFFFSTEP_10_R_THIS_STEP_REQUIRES_VISITING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 10:|r This step requires visiting |cFFFFD700Deadwind Pass|r. Head to |cFFFFFFFF39.8, 73.6|r, the entrance to the Forgotten Crypt.\n\nOnce inside, head down the stairs into the |cFFFFD700Well of the Forgotten|r. Head into the |cFFFFD700Pauper's Walk|r hallway and follow it into the |cFFFFD700Forgotten Crypt.|r\n\nTake a right and then another right back into |cFFFFD700Pauper's Walk|r, then take a right at the Y and walk down the spiral, back into the |cFFFFD700Forgotten Crypt|r.\nTake a left and another left into the |cFFFFD700Tomb of the Unrepentant.|r\nOpen the gate and fall down the hole to the right (just drop down one level, not two). Walk into |cFFFFD700The Pit of Criminals|r, and |cFFFFD700Puzzler's Desire|r is on top of the bone pile.\n\n|cffcc33ffNote: If you are on the Warlock Affiction artifact quest and can't see the Puzzler's Desire, then you will have to abandon the quest to solve the phasing issue.\n\nCongratulations on your mount!|r\n\nWe would like to thank the |cFFFFD700Secret Finding Discord|r for solving yet another puzzle.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 10 步：|r 此步骤需要前往|cFFFFD700逆风小径|r。前往|cFFFFFFFF39.8, 73.6|r，即遗忘墓穴的入口。\n\n进入后，沿楼梯向下进入|cFFFFD700遗忘之井|r。走进|cFFFFD700贫民之路|r走廊，沿路进入|cFFFFD700遗忘墓穴|r。\n\n向右转，再向右转回到|cFFFFD700贫民之路|r，然后在 Y 字路口向右转，沿螺旋向下走，回到|cFFFFD700遗忘墓穴|r。\n向左转，再向左转进入|cFFFFD700不悔者之墓|r。\n打开大门，从右侧的洞跳下去（只下降一层，不是两层）。走进|cFFFFD700罪犯之坑|r，|cFFFFD700解谜者的渴望|r就在骨堆上面。\n\n|cffcc33ff注意：如果你正在进行术士痛苦神器任务，并且看不到解谜者的渴望，那么你必须放弃该任务以解决相位问题。\n\n恭喜你获得坐骑！|r\n\n我们想感谢|cFFFFD700秘密发现 Discord|r解开了又一个谜题。\n",
						-- TODO: tw = "",
					},
				}),
				["groups"] = { i(151623) },	-- Lucid Nightmare (MOUNT!)
			}),
		},
	})),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, {
	header(HEADERS.Spell, 247402, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_0 } }, {	-- Lucid Nightmare
		q(47866),	-- Triggers after Step 8 of Lucid Nightmare secret hunt
	})),
}));
