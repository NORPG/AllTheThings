-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.BFA, {
	header(HEADERS.Spell, 311289, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_5 } }, {	-- Jenafur
		["description"] = createLocalizationString({
			readable = "***Debug Mode is required to see all the steps.***\n",
			constant = "DEBUG_MODE_IS_REQUIRED_TO_SEE_ALL_THE_STEPS",
			export = true,
			text = {
				en = "***Debug Mode is required to see all the steps.***\n",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须启用调试模式才能看到所有步骤。***\n",
				-- TODO: tw = "",
			},
		}),
		["displayID"] = 81387,
		["groups"] = {
			hqt(58076, {	-- Step 1: Speak to Amara
				["name"] = "|cFFFFFFFFStep 1:|r Speak to Amara",
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 1:|r Speak with |cFFFFD700Amara Lunastar|r and follow her dialogue about her cat.\n",
					constant = "CFFFFFFFFSTEP_1_R_SPEAK_WITH_CFFFFD700AMARA",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 1:|r Speak with |cFFFFD700Amara Lunastar|r and follow her dialogue about her cat.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 1 步：|r 与|cFFFFD700阿玛拉·月星|r交谈，并跟随她关于她的猫的对话。\n",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "n", 159799 },	-- Amara Lunastar
				["coord"] = { 17.4, 49.3, ASHENVALE },
			}),
			hqt(58098, {	-- Step 2: Empty Dish
				["name"] = "|cFFFFFFFFStep 2:|r Empty Dish",
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 2:|r Go inside the house in Elwynn Forest to find the |cFFFFD700Empty Dish|r.\n",
					constant = "CFFFFFFFFSTEP_2_R_GO_INSIDE_THE_HOUSE_IN_ELWYNN",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 2:|r Go inside the house in Elwynn Forest to find the |cFFFFD700Empty Dish|r.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 2 步：|r 进入艾尔文森林的那栋房子，找到|cFFFFD700空盘子|r。\n",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "o", 339211 },	-- Empty Dish
				["sourceQuest"] = 58076,	-- Step 1: Speak to Amara
				["coord"] = { 44.2, 53.0, ELWYNN_FOREST },
				["lockCriteria"] = { 1, "questID", 58099 },	-- Amara's Wish
				["DisablePartySync"] = true,
			}),
			hqt(58099, {	-- Amara's Wish
				["name"] = "|cFFFFFFFFStep 3:|r Amara's Wish",
				["description"] = createLocalizationString({
					readable = "|cFFFFFFFFStep 3:|r This step requires collecting various meats throughout |cffffd200Return to Karazhan|r and placing them in the Opera Hall to mimic a section of the Amara's Wish sheet music.\n\n|cffde1c1cOnce the items are picked up, you have 5 minutes to place them into the puzzle. Once placed, they despawn after 5 minutes and 20 seconds. Because of these time limits, it may be wise to ensure you have cleared the trash in the dungeon and have acquainted yourself with the locations of all the meats you need to pick up.\n\nTurn on Debug Mode to see descriptions for the locations of each meat and how to place them in the correct order!|r\n\nYou will need to collect items from Moroes' room as well as the hallways near Maiden of Virtue, and then take the items back to the audience area of the Opera Hall to place them.\n",
					constant = "CFFFFFFFFSTEP_3_R_THIS_STEP_REQUIRES_COLLECTING",
					export = true,
					text = {
						en = "|cFFFFFFFFStep 3:|r This step requires collecting various meats throughout |cffffd200Return to Karazhan|r and placing them in the Opera Hall to mimic a section of the Amara's Wish sheet music.\n\n|cffde1c1cOnce the items are picked up, you have 5 minutes to place them into the puzzle. Once placed, they despawn after 5 minutes and 20 seconds. Because of these time limits, it may be wise to ensure you have cleared the trash in the dungeon and have acquainted yourself with the locations of all the meats you need to pick up.\n\nTurn on Debug Mode to see descriptions for the locations of each meat and how to place them in the correct order!|r\n\nYou will need to collect items from Moroes' room as well as the hallways near Maiden of Virtue, and then take the items back to the audience area of the Opera Hall to place them.\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "|cFFFFFFFF第 3 步：|r 此步骤需要在|cffffd200重返卡拉赞|r中收集各种肉类，并把它们放到歌剧厅中，以模仿《阿玛拉的愿望》乐谱的一个段落。\n\n|cffde1c1c一旦拾取这些物品，你只有 5 分钟时间把它们放进谜题中。放置后，它们会在 5 分 20 秒后消失。由于这些时间限制，最好先确保你已经清完地下城中的小怪，并熟悉所有需要拾取的肉类的位置。\n\n开启调试模式即可查看每种肉类位置的描述以及如何按正确顺序放置它们！|r\n\n你需要从莫罗斯的房间以及贞洁圣女附近的长廊收集物品，然后把它们带回歌剧厅的观众区进行放置。\n",
						-- TODO: tw = "",
					},
				}),
				["providers"] = {
					{ "n", 160374 },	-- Fishy Bits
					{ "n", 160370 },	-- Marbled Steak
					{ "n", 160371 },	-- Juicy Drumstick
					{ "n", 160373 },	-- Meaty Morsel
					{ "n", 160372 },	-- Slathered Rib
				},
				["cost"] = {
					{ "i", 173787, 2 },	-- Fishy Bits
					{ "i", 173780, 2 },	-- Marbled Steak
					{ "i", 173783, 2 },	-- Juicy Drumstick
					{ "i", 173779, 1 },	-- Meaty Morsel
					{ "i", 173777, 1 },	-- Slathered Rib
				},
				["sourceQuest"] = 58098,	-- Step 2: Empty Dish
				["coord"] = { 46.7, 70.1, DEADWIND_PASS },	-- Return to Karazhan entrance
				["groups"] = {
					n(160374, {	-- Fishy Bits (2)
						["description"] = createLocalizationString({
							readable = "Two are required.\n\n|cFFFFFFFF1.|r The first Fishy Bits can be found in the hallway prior to Maiden of Virtue. Near the middle of hall on the left side, there is a doorway flanked by two lion statues. The Fishy Bits are just past the lion statues and before the left-hand bust directly after them, against the wall.\n\n|cFFFFFFFF2.|r The second Fishy Bits can be found in Moroes' room, very close to the boss's platform. It's between the bottom right corner of the platform and the upper left corner of the small right-hand table.\n",
							constant = "TWO_ARE_REQUIRED_CFFFFFFFF1_R_THE_FIRST_FISHY",
							export = true,
							text = {
								en = "Two are required.\n\n|cFFFFFFFF1.|r The first Fishy Bits can be found in the hallway prior to Maiden of Virtue. Near the middle of hall on the left side, there is a doorway flanked by two lion statues. The Fishy Bits are just past the lion statues and before the left-hand bust directly after them, against the wall.\n\n|cFFFFFFFF2.|r The second Fishy Bits can be found in Moroes' room, very close to the boss's platform. It's between the bottom right corner of the platform and the upper left corner of the small right-hand table.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要两份。\n\n|cFFFFFFFF1.|r 第一份腥鱼碎块可在贞洁圣女之前的走廊里找到。走廊中段靠左侧有一道门，两侧各有一尊狮子雕像。腥鱼碎块就在狮子雕像之后、紧随其后的左侧半身像之前，靠墙的位置。\n\n|cFFFFFFFF2.|r 第二份腥鱼碎块可在莫罗斯的房间中找到，非常靠近首领的平台。它位于平台右下角与右侧小桌左上角之间。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(173787) },	-- Fishy Bits
					}),
					n(160370, {	-- Marbled Steak (2)
						["description"] = createLocalizationString({
							readable = "Two are required.\n\n|cFFFFFFFF1.|r Progress through the dungeon, killing the Opera boss, and head towards Maiden of Virtue. When you exit the Opera Hall, in the area before you turn towards Maiden, there is a wide hallway with two rugs, one red and one purple. The first Marbled Steak can be found on the right-hand edge of the purple rug.\n\n|cFFFFFFFF2.|r The second Marbled Steak is just before Maiden of Virtue in the last little room off to the left of the hallway. The Marbled Steak is in the upper-left corner of the antechamber, behind what looks like a very large, high-backed chair.\n",
							constant = "TWO_ARE_REQUIRED_CFFFFFFFF1_R_PROGRESS_THROUGH",
							export = true,
							text = {
								en = "Two are required.\n\n|cFFFFFFFF1.|r Progress through the dungeon, killing the Opera boss, and head towards Maiden of Virtue. When you exit the Opera Hall, in the area before you turn towards Maiden, there is a wide hallway with two rugs, one red and one purple. The first Marbled Steak can be found on the right-hand edge of the purple rug.\n\n|cFFFFFFFF2.|r The second Marbled Steak is just before Maiden of Virtue in the last little room off to the left of the hallway. The Marbled Steak is in the upper-left corner of the antechamber, behind what looks like a very large, high-backed chair.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要两份。\n\n|cFFFFFFFF1.|r 沿副本一路推进，击杀歌剧首领，然后前往贞洁圣女。离开歌剧院后，在你转向贞洁圣女之前的区域，有一条宽走廊，铺着两块地毯，一块红色、一块紫色。第一份大理石牛排就在紫色地毯的右侧边缘。\n\n|cFFFFFFFF2.|r 第二份大理石牛排就在贞洁圣女之前，走廊左侧最后一间小屋里。大理石牛排在前厅的左上角，在一把看似很大的高背椅后面。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(173780) },	-- Marbled Steak
					}),
					n(160371, {	-- Juicy Drumstick (2)
						["description"] = createLocalizationString({
							readable = "Two are required.\n\n|cFFFFFFFF1.|r The first Juicy Drumstick can be found close to the second Marbled Steak, in the last room before Maiden of Virtue. Head all the way into the room, and you will see the Juicy Drumstick on an ottoman in front of another high-backed chair. It's next to a tall candelabra and a portrait of a woman.\n\n|cFFFFFFFF2.|r The second Juicy Drumstick can be found in Moroes' room, in front of the boss's platform. It's closer to the small left-hand table, near the bottom edge of the big black and gold carpet.\n",
							constant = "TWO_ARE_REQUIRED_CFFFFFFFF1_R_THE_FIRST_JUICY",
							export = true,
							text = {
								en = "Two are required.\n\n|cFFFFFFFF1.|r The first Juicy Drumstick can be found close to the second Marbled Steak, in the last room before Maiden of Virtue. Head all the way into the room, and you will see the Juicy Drumstick on an ottoman in front of another high-backed chair. It's next to a tall candelabra and a portrait of a woman.\n\n|cFFFFFFFF2.|r The second Juicy Drumstick can be found in Moroes' room, in front of the boss's platform. It's closer to the small left-hand table, near the bottom edge of the big black and gold carpet.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要两份。\n\n|cFFFFFFFF1.|r 第一份多汁鸡腿可在贞洁圣女前的最后一个房间中找到，靠近第二份大理石牛排。一直走进房间，你会看到多汁鸡腿在另一把高背椅前的脚凳上，旁边是一座高高的烛台和一幅女人画像。\n\n|cFFFFFFFF2.|r 第二份多汁鸡腿可在莫罗斯的房间中找到，位于首领平台前方。它更靠近左侧的小桌，在黑色与金色大地毯的下边缘附近。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(173783) },	-- Juicy Drumstick
					}),
					n(160373, {	-- Meaty Morsel
						["description"] = createLocalizationString({
							readable = "Can be found about halfway down the hallway prior to Maiden of Vigilance. There is a section on the right-hand side with a rectangular table and three chairs between two bookshelves, all covered in cobwebs. The Meaty Morsel is on a tiny round table between the first bookshelf and chair.\n",
							constant = "CAN_BE_FOUND_ABOUT_HALFWAY_DOWN_THE_HALLWAY",
							export = true,
							text = {
								en = "Can be found about halfway down the hallway prior to Maiden of Vigilance. There is a section on the right-hand side with a rectangular table and three chairs between two bookshelves, all covered in cobwebs. The Meaty Morsel is on a tiny round table between the first bookshelf and chair.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在通往警戒圣女的走廊中段找到。右侧有一处区域，两个书架之间摆着一张长方形桌子和三把椅子，全都布满蛛网。肉块就在第一个书架和椅子之间的一张小圆桌上。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(173779) },	-- Meaty Morsel
					}),
					n(160372, {	-- Slathered Rib
						["description"] = createLocalizationString({
							readable = "Can be found in Moroes' room, on the right side of the long table. There are a couple on the table, but the easiest one to spot is on a gold platter sitting between a large roast pig and fish.\n",
							constant = "CAN_BE_FOUND_IN_MOROES_ROOM_ON_THE_RIGHT_SIDE",
							export = true,
							text = {
								en = "Can be found in Moroes' room, on the right side of the long table. There are a couple on the table, but the easiest one to spot is on a gold platter sitting between a large roast pig and fish.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在莫罗斯房间内长桌的右侧找到。桌上有几个，但最容易发现的那个就在一个大烤猪和鱼之间的金盘上。\n",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(173777) },	-- Slathered Rib
					}),
					o(9999921, {	-- Placement
						["description"] = createLocalizationString({
							readable = "After you have all the meats collected, head back to the audience area of the Opera Hall. To orient yourself in the room, you want to have your back to the stage.\n\nYou will be placing each meat relative to two very tiny piles of kibble on the left side of the room (again, while faced away from the stage). You will probably need to zoom in to see them. Each tile on the floor represents a box in a 12-by-12 grid.\n\n|cff413f43 00|r = Empty cell\n|cff4db62c 00|r = Pile of Kibble\n|cffeea016 00|r = Fishy Bits\n|cffeee116 00|r = Juicy Drumstick\n|cff16ceee 00|r = Meaty Morsel\n|cffce16ee 00|r = Marbled Steak\n|cff9e5ced 00|r = Slathered Rib\n\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00|r|cffeee116 00|r|cff413f43 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00|r|cff9e5ced 00|r|cff413f43 00|r|cffeea016 00|r|cff413f43 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00|r|cff16ceee 00|r|cff413f43 00 00 00 00 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00|r|cffeea016 00|r|cff413f43 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00|r|cffeee116 00|r|cff413f43 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n\nIf you have placed all the meats properly, Jenafur will spawn as soon as you finish. You can use |cFFFFFFFF/tar Jenafur|r to find her in the room, and then all you have to do is walk over and pet her for her to be added to your collection.\n",
							constant = "AFTER_YOU_HAVE_ALL_THE_MEATS_COLLECTED_HEAD",
							export = true,
							text = {
								en = "After you have all the meats collected, head back to the audience area of the Opera Hall. To orient yourself in the room, you want to have your back to the stage.\n\nYou will be placing each meat relative to two very tiny piles of kibble on the left side of the room (again, while faced away from the stage). You will probably need to zoom in to see them. Each tile on the floor represents a box in a 12-by-12 grid.\n\n|cff413f43 00|r = Empty cell\n|cff4db62c 00|r = Pile of Kibble\n|cffeea016 00|r = Fishy Bits\n|cffeee116 00|r = Juicy Drumstick\n|cff16ceee 00|r = Meaty Morsel\n|cffce16ee 00|r = Marbled Steak\n|cff9e5ced 00|r = Slathered Rib\n\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00|r|cffeee116 00|r|cff413f43 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00|r|cff9e5ced 00|r|cff413f43 00|r|cffeea016 00|r|cff413f43 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00|r|cff16ceee 00|r|cff413f43 00 00 00 00 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00|r|cffeea016 00|r|cff413f43 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00|r|cffeee116 00|r|cff413f43 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n\nIf you have placed all the meats properly, Jenafur will spawn as soon as you finish. You can use |cFFFFFFFF/tar Jenafur|r to find her in the room, and then all you have to do is walk over and pet her for her to be added to your collection.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "收集齐所有肉类后，回到歌剧院观众区。为了在房间里确定方位，你要背对舞台。\n\n你将参照房间左侧两小堆猫粮来放置每种肉（同样要背对舞台）。你可能需要放大视角才能看到它们。地板上的每个格子代表 12×12 网格中的一个方格。\n\n|cff413f43 00|r = 空格\n|cff4db62c 00|r = 一堆猫粮\n|cffeea016 00|r = 鱼肉碎\n|cffeee116 00|r = 多汁鸡腿\n|cff16ceee 00|r = 肉块\n|cffce16ee 00|r = 雪花牛排\n|cff9e5ced 00|r = 涂满酱汁的肋排\n\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00|r|cffeee116 00|r|cff413f43 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00|r|cff9e5ced 00|r|cff413f43 00|r|cffeea016 00|r|cff413f43 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00|r|cff16ceee 00|r|cff413f43 00 00 00 00 00 00|r\n|cff413f43 00|r|cff4db62c 00|r|cff413f43 00 00|r|cffeea016 00|r|cff413f43 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00|r|cffce16ee 00|r|cff413f43 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00|r|cffeee116 00|r|cff413f43 00 00 00 00 00 00 00 00 00|r\n|cff413f43 00 00 00 00 00 00 00 00 00 00 00 00|r\n\n如果你把所有肉都放置正确，詹娜芙会在你完成的瞬间生成。你可以使用 |cFFFFFFFF/tar Jenafur|r 在房间里找到她，然后你只需要走过去抚摸她，她就会被加入你的收藏。\n",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(2795),	-- Jenafur (PET!)
				},
			}),
		},
	})),
}));
