---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(REVENDRETH, {
		n(SPECIAL, {
			n(181660, bubbleDownSelf({ ["timeline"] = { ADDED_9_1_5 } }, {	-- Lost Soul (Chicken)
				["description"] = createLocalizationString({
					readable = "Gather the |cFFFFFFFFSpectral Feed|r, located at |cFFFFFFFF63.75, 61.69|r in Revendreth. This has roughly a 60 minute respawn, and is lootable by others shortly after being looted by one player.\nAfter, head to the Lost Soul located at 63.18, 42.76 in Revendreth. Use |cFFFFFFFF/chicken|r on the soul, then use the |cFFFFFFFFSpectral Feed|r from your Bag.\nThe soul may have multiple spawn points, or a separate respawn timer than the Feed, it is unknown. However, you can only see the Soul when you have the Feed in your bags.",
					constant = "GATHER_THE_CFFFFFFFFSPECTRAL_FEED_R_LOCATED_AT",
					export = true,
					text = {
						en = "Gather the |cFFFFFFFFSpectral Feed|r, located at |cFFFFFFFF63.75, 61.69|r in Revendreth. This has roughly a 60 minute respawn, and is lootable by others shortly after being looted by one player.\nAfter, head to the Lost Soul located at 63.18, 42.76 in Revendreth. Use |cFFFFFFFF/chicken|r on the soul, then use the |cFFFFFFFFSpectral Feed|r from your Bag.\nThe soul may have multiple spawn points, or a separate respawn timer than the Feed, it is unknown. However, you can only see the Soul when you have the Feed in your bags.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "收集|cFFFFFFFF幽灵饲料|r，位于雷文德斯的|cFFFFFFFF63.75, 61.69|r。它的刷新时间大约为 60 分钟，并且在一名玩家拾取后不久其他玩家仍可拾取。\n之后，前往雷文德斯 63.18, 42.76 处的迷失的灵魂。对灵魂使用|cFFFFFFFF/chicken|r，然后从背包中使用|cFFFFFFFF幽灵饲料|r。\n灵魂可能有多个刷新点，或者与饲料有不同的刷新计时，目前尚不清楚。不过，只有当你的背包中拥有饲料时，你才能看到这个灵魂。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 63.18, 42.76, REVENDRETH },
				["cost"] = { { "i", 187811, 1 } },	-- Spectral Feed
				["groups"] = {
					i(187813),	-- Chicken Soul
				},
			})),
			header(HEADERS.Item, 182614, sharedDataSelf({	-- Sinrunner Blanchy
				["lockCriteria"] = { 1, "spellID", 339588 },
				["DisablePartySync"] = true,
			}, {
				["description"] = createLocalizationString({
					readable = "Enable quest tracking to see all the steps.\n\nTo get Blanchy's Reins, you must interact with Dead Blanchy once a day for 6 days. On each day, you must have a specific item. You can gather all the items in advance. You will need to visit Revendreth, Westfall, and take a detour to either Ardenweald or Bastion.\n\nBlanchy spawns around |cFFFFFFFF63.1, 43.1|r in Revendreth. Similar to the Friendly Alpaca in Uldum, anyone can interact with Blanchy for a small window, roughly 5 minutes, and then she will despawn for 1 to 2 hours.",
					constant = "ENABLE_QUEST_TRACKING_TO_SEE_ALL_THE_STEPS_TO",
					export = true,
					text = {
						en = "Enable quest tracking to see all the steps.\n\nTo get Blanchy's Reins, you must interact with Dead Blanchy once a day for 6 days. On each day, you must have a specific item. You can gather all the items in advance. You will need to visit Revendreth, Westfall, and take a detour to either Ardenweald or Bastion.\n\nBlanchy spawns around |cFFFFFFFF63.1, 43.1|r in Revendreth. Similar to the Friendly Alpaca in Uldum, anyone can interact with Blanchy for a small window, roughly 5 minutes, and then she will despawn for 1 to 2 hours.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "启用任务追踪以查看所有步骤。\n\n要获得布兰奇的缰绳，你必须每天与死去的布兰奇互动一次，持续 6 天。每天你都需要持有特定物品。你可以提前收集好所有物品。你需要前往雷文德斯、西部荒野，并绕道前往炽蓝仙野或晋升堡垒。\n\n布兰奇在雷文德斯|cFFFFFFFF63.1, 43.1|r附近刷新。与奥丹姆的友善羊驼类似，任何人都可以在一个很短的时间窗口内与布兰奇互动，大约 5 分钟，之后她就会消失 1 到 2 小时。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 173468 },	-- Dead Blanchy
				["coord"] = { 63.1, 43.1, REVENDRETH },
				["questID"] = 62107,
				["isDaily"] = true,
				["groups"] = {
					header(HEADERS.Item, 182581, {	-- Handful of Oats
						["description"] = createLocalizationString({
							readable = "Day 1: Collect 8 |cFFFFFFFFHandfuls of Oats|r. They can be found in |cFFFFFFFFSacks of Oats|r in any of the farmland in the northern half of Westfall — Jansen Stead, Furlbrow's Pumpkin Farm, Saldean's Farm, and the Molsen Farm.\n\nThese can likely be found in more locations than are provided. Check by fences, around the bases of trees, and near carts. They do not sparkle, so they can be difficult to spot.",
							constant = "DAY_1_COLLECT_8_CFFFFFFFFHANDFULS_OF_OATS_R",
							export = true,
							text = {
								en = "Day 1: Collect 8 |cFFFFFFFFHandfuls of Oats|r. They can be found in |cFFFFFFFFSacks of Oats|r in any of the farmland in the northern half of Westfall — Jansen Stead, Furlbrow's Pumpkin Farm, Saldean's Farm, and the Molsen Farm.\n\nThese can likely be found in more locations than are provided. Check by fences, around the bases of trees, and near carts. They do not sparkle, so they can be difficult to spot.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 1 天：收集 8 个|cFFFFFFFF一把燕麦|r。它们可以在西部荒野北半部任意农田的|cFFFFFFFF燕麦袋|r中找到——詹森农庄、弗尔布罗的南瓜农场、萨尔丁农场和莫尔森农场。\n\n它们可能出现在比所列更多的位置。检查栅栏旁、树根周围和货车附近。它们不会闪光，因此较难发现。",
								-- TODO: tw = "",
							},
						}),
						["coords"] = {
							{ 43.1, 37.3, WESTFALL },
							{ 44.9, 35.3, WESTFALL },
							{ 45.8, 39.0, WESTFALL },
							{ 46.4, 36.8, WESTFALL },
							{ 48.8, 20.8, WESTFALL },
							{ 50.3, 18.5, WESTFALL },
							{ 51.2, 21.8, WESTFALL },
							{ 51.2, 39.2, WESTFALL },
							{ 51.5, 31.9, WESTFALL },
							{ 51.8, 19.4, WESTFALL },
							{ 52.2, 30.6, WESTFALL },
							{ 52.2, 33.3, WESTFALL },
							{ 52.6, 34.3, WESTFALL },
							{ 53.3, 29.1, WESTFALL },
							{ 53.5, 35.1, WESTFALL },
							{ 53.9, 36.4, WESTFALL },
							{ 55.8, 30.9, WESTFALL },
							{ 56.4, 33.8, WESTFALL },
							{ 56.6, 18.5, WESTFALL },
							{ 56.8, 20.7, WESTFALL },
							{ 57.5, 17.4, WESTFALL },
							{ 58.5, 15.9, WESTFALL },
							{ 59.2, 18.9, WESTFALL },
						},
						["questID"] = 62038,
						["cost"] = { { "i", 182581, 8 } },	-- 8x Handful of Oats
					}),
					header(HEADERS.Item, 182585, {	-- Grooming Brush
						["description"] = createLocalizationString({
							readable = "Day 2: Borrow 1 |cFFFFFFFFGrooming Brush|r from Snickersnee in Darkhaven.",
							constant = "DAY_2_BORROW_1_CFFFFFFFFGROOMING_BRUSH_R_FROM",
							export = true,
							text = {
								en = "Day 2: Borrow 1 |cFFFFFFFFGrooming Brush|r from Snickersnee in Darkhaven.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 2 天：从暗湾的斯尼克斯尼那里借 1 把|cFFFFFFFF梳理刷|r。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 62038 },	-- Handful of Oats
						["coord"] = { 63.4, 61.8, REVENDRETH },
						["questID"] = 62042,
						["cost"] = { { "i", 182581, 1 } },	-- 1x Grooming Brush
					}),
					header(HEADERS.Item, 182595, {	-- Sturdy Horseshoe
						["description"] = createLocalizationString({
							readable = "Day 3: Collect 4 |cFFFFFFFFSturdy Horseshoes|r. They can be found scattered around roads in Revendreth. Unlike the Sacks of Oats, these sparkle.",
							constant = "DAY_3_COLLECT_4_CFFFFFFFFSTURDY_HORSESHOES_R",
							export = true,
							text = {
								en = "Day 3: Collect 4 |cFFFFFFFFSturdy Horseshoes|r. They can be found scattered around roads in Revendreth. Unlike the Sacks of Oats, these sparkle.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 3 天：收集 4 只|cFFFFFFFF坚固马蹄铁|r。它们散落在雷文德斯的道路周围。与燕麦袋不同，它们会闪光。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 62042 },	-- Grooming Brush
						["coords"] = {
							{ 61.2, 69.4, REVENDRETH },
							{ 63.2, 65.7, REVENDRETH },
							{ 64.2, 58.4, REVENDRETH },
							{ 65.1, 74.1, REVENDRETH },
							{ 68.1, 68.8, REVENDRETH },
							{ 70.3, 59.0, REVENDRETH },
							{ 74.5, 57.8, REVENDRETH },
						},
						["questID"] = 62047,
						["cost"] = { { "i", 182595, 1 } },	-- 4x Sturdy Horseshoe
					}),
					header(HEADERS.Item, 182599, {	-- Bucket of Clean Water
						["description"] = createLocalizationString({
							readable = "Day 4: Pick up the |cFFFFFFFFEmpty Water Bucket|r in Revendreth, and fill it in either Bastion or Ardenweald.",
							constant = "DAY_4_PICK_UP_THE_CFFFFFFFFEMPTY_WATER_BUCKET_R",
							export = true,
							text = {
								en = "Day 4: Pick up the |cFFFFFFFFEmpty Water Bucket|r in Revendreth, and fill it in either Bastion or Ardenweald.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 4 天：在雷文德斯拾取|cFFFFFFFF空水桶|r，并在晋升堡垒或炽蓝仙野将其装满。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 62047 },	-- Sturdy Horseshoe
						["coord"] = { 63.2, 61.5, REVENDRETH },
						["questID"] = 62049,
						["cost"] = { { "i", 182599, 1 } },	-- 1x Bucket of Clean Water
					}),
					header(HEADERS.Item, 182597, {	-- Comfortable Saddle Blanket
						["description"] = createLocalizationString({
							readable = "Day 5: Purchase 1 |cFFFFFFFFComfortable Saddle Blanket|r from Ta'tru in Revendreth.\n\nNOTE: This item has a varying cost depending on the week!",
							constant = "DAY_5_PURCHASE_1_CFFFFFFFFCOMFORTABLE_SADDLE",
							export = true,
							text = {
								en = "Day 5: Purchase 1 |cFFFFFFFFComfortable Saddle Blanket|r from Ta'tru in Revendreth.\n\nNOTE: This item has a varying cost depending on the week!",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 5 天：在雷文德斯从塔特鲁处购买 1 条|cFFFFFFFF舒适的鞍毯|r。\n\n注意：该物品的价格每周都会变化！",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 62049 },	-- Bucket of Clean Water
						["coord"] = { 51.1, 78.8, REVENDRETH },
						["questID"] = 62048,
						["cost"] = { { "i", 182597, 1 } },	-- 1x Comfortable Saddle Blanket
					}),
					header(HEADERS.Item, 179271, {	-- Dredhollow Apple
						["description"] = createLocalizationString({
							readable = "Day 6: Purchase 3 |cFFFFFFFFDredhollow Apples|r from either Mims or Slabchop in Revendreth.",
							constant = "DAY_6_PURCHASE_3_CFFFFFFFFDREDHOLLOW_APPLES_R",
							export = true,
							text = {
								en = "Day 6: Purchase 3 |cFFFFFFFFDredhollow Apples|r from either Mims or Slabchop in Revendreth.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "第 6 天：在雷文德斯从米姆斯或剁肉佬处购买 3 个|cFFFFFFFF泥谷苹果|r。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 62048 },	-- Comfortable Saddle Blanket
						["coord"] = { 40.8, 46.6, REVENDRETH },	-- Mims <Innkeeper>
						["questID"] = 62050,
						["cost"] = { { "i", 179271, 3 } },	-- 3x Dredhollow Apple
					}),
					i(182614, {	-- Sinrunner Blanchy (MOUNT!)
						["sourceQuests"] = { 62050 },	-- Dredhollow Apple
					}),
				},
			})),
			o(370469, bubbleDownSelf({ ["timeline"] = { ADDED_9_1_5 } }, {	-- Spectral Feed
				["coord"] = { 63.75, 61.69, REVENDRETH },
				["groups"] = {
					i(187811),	-- Spectral Feed
				},
			})),
		}),
	}),
})));
