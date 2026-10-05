-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

CACHE_OF_MADNESS = createHeader({	-- This is the header for the event boss Cache of Madness.
	readable = "Cache of Madness",
	icon = 441139,
	text = {
		en = "Cache of Madness",
		-- TODO: de = "",
		es = "El extremo de la locura",
		mx = "El extremo de la locura",
		fr = "L'antre de la Folie",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		ru = "Тайник Безумия",
		cn = "疯狂宝箱",
		-- TODO: tw = "",
	},
	description = {
		en =
			-- #if AFTER 10.0.7
			"Requires Archaeology to activate. Activate all 4 of the artifacts to spawn the boss. If the boss you want doesn't spawn, do NOT kill the one that did. Instead, zone out and wait for 30 minutes. Once you zone back, there will sometimes be a new boss waiting for you.",
			-- #else
			"Requires Archaeology (225+) to activate. Activate all 4 of the artifacts to spawn the boss. If the boss you want doesn't spawn, do NOT kill the one that did. Instead, zone out and wait for 30 minutes. Once you zone back, there will sometimes be a new boss waiting for you.",
			-- #endif
		cn =
			-- #if AFTER 10.0.7
			"需要考古学来激活。激活全部 4 件神器以召唤出首领。如果你想要的首领没有出现，请勿击杀已出现的首领。相反，离开该区域并等待 30 分钟。一旦你返回，有时会有新的首领等着你",
			-- #else
			"需要考古学技能（225+）来激活。激活全部 4 件神器以召唤出首领。若你期望的首领未出现，不要击杀已出现的首领。而是离开该区域，等待 30 分钟。再次进入后，有时会有新首领等着你",
			-- #endif
	},
});

local BLOODSCALP_COIN = 19706;
local GURUBASHI_COIN = 19701;
local HAKKARI_COIN = 19700;
local RAZZASHI_COIN = 19699;
local SANDFURY_COIN = 19704;
local SKULLSPLITTER_COIN = 19705;
local VILEBRANCH_COIN = 19702;
local WITHERBARK_COIN = 19703;
local ZULIAN_COIN = 19698;
local BLUE_HAKKARI_BIJOU = 203765;
local BRONZE_HAKKARI_BIJOU = 203766;
local GOLD_HAKKARI_BIJOU = 203767;
local GREEN_HAKKARI_BIJOU = 203768;
local ORANGE_HAKKARI_BIJOU = 203769;
local PURPLE_HAKKARI_BIJOU = 203770;
local RED_HAKKARI_BIJOU = 203771;
local SILVER_HAKKARI_BIJOU = 203772;
local YELLOW_HAKKARI_BIJOU = 203773;
local ZANDALAR_BARGAINING_TOKEN = 203914;

root(ROOTS.Instances, expansion(EXPANSION.CATA, bubbleDown({ ["timeline"] = ADDED_4_1_0 }, {
	applyclassicphase(CATA_PHASE_RISE_OF_THE_ZANDALARI, inst(76, {	-- Zul'Gurub
		["mapID"] = ZULGURUB,
		["coord"] = { 72.0, 32.9, NORTHERN_STRANGLETHORN },	-- Zul'Gurub
		["_drop"] = { "isRaid" },	-- prevent merging isRaid from Classic version
		["groups"] = {
			d(DIFFICULTY.DUNGEON.HEROIC, {
				header(HEADERS.Achievement, 17366, bubbleDown({ ["timeline"] = { ADDED_10_0_7 } }, {	-- Relics of a Fallen Empire
					["description"] = createLocalizationString({
						readable = "To unlock the Zul'Gurub content of patch 10.0.7:\n\n1. Kill any two bosses to spawn Jin'do the Godbreaker. Cache of Madness does not count.\n\n2. Head to the Altar of the Light, and enter the ground floor using either side entrance.\n\n3. Look for a gong by the southern entrance. On the ground in front of it lies a Shattered Hakkari Bijou. Loot it.\n\n4. Go upstairs towards Jin'do the Godbreaker, and kill at least one Gurubashi Spirit Warrior on your way. (You will need it for the encounter!)\n\n5. Pull Jin'do the Godbreaker and burst him down until Phase 2 begins. (This phase begins even if you oneshot him.)\n\n6. Walk back downstairs and inside the ground floor where you found the Shattered Hakkari Bijou, and a Fragmented Hakkari Bijou lays in its place. Loot it.\n\n7. Finish the boss encounter above by pulling a Gurubashi Spirit up to Hakkari's Chains, and wait until they break the chain protection with their ability 'Body Slam'. Then you can 'kill' the chains, and kill Jin'do.\n\n8. Combine the Shattered Hakkari Bijou with the Fragmented Hakkari Bijou, and accept the quest 'Restored Hakkari Bijou'.\n\n9. Travel to Dazar'alor in Zandalar. |CFFFF0000Beware Alliance players, this is a Horde city!|r You can get here using the ship service from Echo Isles in Durotar. From the Port of Zuldazar, fly eastwards to the south-facing building entrances. Above the transmogrifier shop is the Yojamba Exchange, where you can turn in the quest at Rin'wosho the Trader.\n\n10. Zul'Gurub is now unlocked for your account, and the vendor Rin'Wosho with his wares can now be found at the beginning of the dungeon.\n\n11. Protip: Start the Gurubashi Tribute farm as early as possible as it is a decent source for coins. See the header for Brazier of Madness for more information.",
						constant = "TO_UNLOCK_THE_ZUL_GURUB_CONTENT_OF_PATCH_10_0_7",
						export = true,
						text = {
							en = "To unlock the Zul'Gurub content of patch 10.0.7:\n\n1. Kill any two bosses to spawn Jin'do the Godbreaker. Cache of Madness does not count.\n\n2. Head to the Altar of the Light, and enter the ground floor using either side entrance.\n\n3. Look for a gong by the southern entrance. On the ground in front of it lies a Shattered Hakkari Bijou. Loot it.\n\n4. Go upstairs towards Jin'do the Godbreaker, and kill at least one Gurubashi Spirit Warrior on your way. (You will need it for the encounter!)\n\n5. Pull Jin'do the Godbreaker and burst him down until Phase 2 begins. (This phase begins even if you oneshot him.)\n\n6. Walk back downstairs and inside the ground floor where you found the Shattered Hakkari Bijou, and a Fragmented Hakkari Bijou lays in its place. Loot it.\n\n7. Finish the boss encounter above by pulling a Gurubashi Spirit up to Hakkari's Chains, and wait until they break the chain protection with their ability 'Body Slam'. Then you can 'kill' the chains, and kill Jin'do.\n\n8. Combine the Shattered Hakkari Bijou with the Fragmented Hakkari Bijou, and accept the quest 'Restored Hakkari Bijou'.\n\n9. Travel to Dazar'alor in Zandalar. |CFFFF0000Beware Alliance players, this is a Horde city!|r You can get here using the ship service from Echo Isles in Durotar. From the Port of Zuldazar, fly eastwards to the south-facing building entrances. Above the transmogrifier shop is the Yojamba Exchange, where you can turn in the quest at Rin'wosho the Trader.\n\n10. Zul'Gurub is now unlocked for your account, and the vendor Rin'Wosho with his wares can now be found at the beginning of the dungeon.\n\n11. Protip: Start the Gurubashi Tribute farm as early as possible as it is a decent source for coins. See the header for Brazier of Madness for more information.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "要解锁 10.0.7 补丁的祖尔格拉布内容：\n\n1. 击杀任意两个首领以刷新破神者金度。疯狂之匣不计入。\n\n2. 前往圣光祭坛，从任一侧入口进入底层。\n\n3. 在南侧入口旁寻找一面锣。它前面的地上放着一枚破碎的哈卡莱护符。拾取它。\n\n4. 上楼前往破神者金度，途中至少击杀一名古拉巴什灵魂战士。（遭遇战会需要它！）\n\n5. 拉来破神者金度并集火输出，直到第 2 阶段开始。（即使你一击秒杀他，此阶段也会开始。）\n\n6. 走回楼下，进入你找到破碎的哈卡莱护符的底层，那里会出现一枚碎裂的哈卡莱护符。拾取它。\n\n7. 通过把一名古拉巴什灵魂拉到哈卡之链处来结束上方的首领遭遇战，并等待它们用技能“猛击”打破锁链保护。之后你就可以“击杀”锁链，并杀死金度。\n\n8. 将破碎的哈卡莱护符与碎裂的哈卡莱护符组合，并接受任务“复原的哈卡莱护符”。\n\n9. 前往赞达拉的达萨罗。|CFFFF0000联盟玩家小心，这是一座部落城市！|r 你可以从杜隆塔尔的回音群岛乘坐船只来到这里。从祖达萨港向东飞向朝南的建筑入口。幻化店上方就是约詹巴交易所，你可以在那里向商人林沃索交付任务。\n\n10. 现在你的账号已解锁祖尔格拉布，商人林沃索及其货物可以在副本入口处找到。\n\n11. 小提示：尽早开始刷古拉巴什贡品，因为它是硬币的不错来源。更多信息请参见疯狂火盆的标题说明。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						n(ACHIEVEMENTS, {
							ach(17367, {	-- Deadliest Cache
								crit(58126, {	-- Jostled Gurubashi Cache
									["provider"] = { "i", 203743 },	-- Jostled Gurubashi Cache
								}),
								crit(58125, {	-- Waterlogged Gurubashi Cache
									["provider"] = { "i", 203742 },	-- Waterlogged Gurubashi Cache
								}),
							}),
							ach(17366, {	-- Relics of a Fallen Empire
								["sourceQuest"] = 74576,	-- Restored Hakkari Bijou
								["timeline"] = { ADDED_10_0_7 },
							}),
						}),
						header(HEADERS.Item, 203757, {	-- Brazier of Madness
							["description"] = createLocalizationString({
								readable = "To get started farming Gurubashi Tributes for recipes:\n\n1. Go to the site of the boss Cache of Madness.\n\n2. By the eastern wall is an altar. Here hangs Tablet of Madness, which teaches Alchemists with 300 skill points in classic alchemy how to create Gurubashi Mojo Madness.\n\n3. On the left side of the altar is an interactable brazier, which gives you the toy Brazier of Madness.\n\n4. The four main bosses Venoxis, Mandokir, Kilnara and Zanzil have piles of skull near them. Use the toy Brazier of Madness near one of these piles, and consume a Gurubashi Mojo Madness. This will transform you to a troll for one hour, and make you able to interact with the different piles of skulls to offer bijous for Gurubashi Tributes. The transformation will make you friendly to the mobs in the dungeon, so this should be done after killing the bosses.\n\n5. The different piles requires different bijous, and rewards 1-2 recipes and/or 3-7 coins. For more information see the header for Gurubashi Tribute.",
								constant = "TO_GET_STARTED_FARMING_GURUBASHI_TRIBUTES_FOR",
								export = true,
								text = {
									en = "To get started farming Gurubashi Tributes for recipes:\n\n1. Go to the site of the boss Cache of Madness.\n\n2. By the eastern wall is an altar. Here hangs Tablet of Madness, which teaches Alchemists with 300 skill points in classic alchemy how to create Gurubashi Mojo Madness.\n\n3. On the left side of the altar is an interactable brazier, which gives you the toy Brazier of Madness.\n\n4. The four main bosses Venoxis, Mandokir, Kilnara and Zanzil have piles of skull near them. Use the toy Brazier of Madness near one of these piles, and consume a Gurubashi Mojo Madness. This will transform you to a troll for one hour, and make you able to interact with the different piles of skulls to offer bijous for Gurubashi Tributes. The transformation will make you friendly to the mobs in the dungeon, so this should be done after killing the bosses.\n\n5. The different piles requires different bijous, and rewards 1-2 recipes and/or 3-7 coins. For more information see the header for Gurubashi Tribute.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "要开始为配方刷取古拉巴什贡品：\n\n1. 前往首领“疯狂之匣”所在的位置。\n\n2. 东墙边有一座祭坛。这里挂着疯狂石板，它能让经典旧世炼金技能点达到 300 的炼金师学会制作古拉巴什妖术疯狂。\n\n3. 祭坛左侧有一个可互动的火盆，它会给予你玩具“疯狂火盆”。\n\n4. 四位主要首领维诺克西斯、曼多基尔、基尔娜拉和赞吉尔附近都有成堆的头骨。在其中一个头骨堆旁使用玩具“疯狂火盆”，并喝下古拉巴什妖术疯狂。这会把你变成巨魔一小时，并使你能够与不同的头骨堆互动，献上护符以换取古拉巴什贡品。变身会让你与地下城中的怪物变为友好，所以应在击杀首领后再进行。\n\n5. 不同的头骨堆需要不同的护符，并奖励 1-2 个配方和/或 3-7 枚硬币。更多信息请参见古拉巴什贡品的标题说明。",
									-- TODO: tw = "",
								},
							}),
							["cost"] = {
								{ "i", BLUE_HAKKARI_BIJOU, 1 },
								{ "i", BRONZE_HAKKARI_BIJOU, 1 },
								{ "i", GOLD_HAKKARI_BIJOU, 1 },
								{ "i", GREEN_HAKKARI_BIJOU, 1 },
								{ "i", ORANGE_HAKKARI_BIJOU, 1 },
								{ "i", PURPLE_HAKKARI_BIJOU, 1 },
								{ "i", RED_HAKKARI_BIJOU, 1 },
								{ "i", SILVER_HAKKARI_BIJOU, 1 },
								{ "i", YELLOW_HAKKARI_BIJOU, 1 },
							},
							["groups"] = {
								i(203959, {	-- Gurubashi Tribute
									["description"] = createLocalizationString({
										readable = "Venoxis' available offerings: 2x Silver Bijou / 3x Green Bijou / 3x Gold Bijou. Coords: 51.5, 55.8 Behind the Boss\n\nMandokir's available offerings: 2x Bronze Bijou / 3x Red Bijou / 3x Gold Bijou. Coords: 60.8, 80.9 Right side of Boss\n\nKilnara's available offerings: 2x Orange Bijou / 3x Yellow Bijou / 3x Gold Bijou. Coords: 47.5, 22.1 Behind Boss at the wall\n\nZanzil's available offerings: 2x Purple Bijou / 3x Blue Bijou / 3x Gold Bijou. Coords: 30.4, 19.9 North side of the Boss room, at the left wall.",
										constant = "VENOXIS_AVAILABLE_OFFERINGS_2X_SILVER_BIJOU_3X",
										export = true,
										text = {
											en = "Venoxis' available offerings: 2x Silver Bijou / 3x Green Bijou / 3x Gold Bijou. Coords: 51.5, 55.8 Behind the Boss\n\nMandokir's available offerings: 2x Bronze Bijou / 3x Red Bijou / 3x Gold Bijou. Coords: 60.8, 80.9 Right side of Boss\n\nKilnara's available offerings: 2x Orange Bijou / 3x Yellow Bijou / 3x Gold Bijou. Coords: 47.5, 22.1 Behind Boss at the wall\n\nZanzil's available offerings: 2x Purple Bijou / 3x Blue Bijou / 3x Gold Bijou. Coords: 30.4, 19.9 North side of the Boss room, at the left wall.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "维诺克西斯可用的祭品：2x 银色宝石 / 3x 绿色宝石 / 3x 金色宝石。坐标：51.5, 55.8 首领身后\n\n曼多基尔可用的祭品：2x 青铜宝石 / 3x 红色宝石 / 3x 金色宝石。坐标：60.8, 80.9 首领右侧\n\n基尔娜拉可用的祭品：2x 橙色宝石 / 3x 黄色宝石 / 3x 金色宝石。坐标：47.5, 22.1 首领身后墙边\n\n赞吉尔可用的祭品：2x 紫色宝石 / 3x 蓝色宝石 / 3x 金色宝石。坐标：30.4, 19.9 首领房间北侧，左侧墙边。",
											-- TODO: tw = "",
										},
									}),
									["groups"] = {
										-- Epic
										i(203838),	-- Ancient Formula: Mindslave's Reach (RECIPE!)
										i(203847),	-- Ancient Pattern: Gurubashis Grasp (RECIPE!)
										i(203833),	-- Ancient Plans: Bloodherald (RECIPE!)
										i(203834),	-- Ancient Plans: Bloodlords Reaver (RECIPE!)
										i(203831),	-- Ancient Plans: Gurubashi Crusher (RECIPE!)
										i(203829),	-- Ancient Plans: Gurubashi Hexxer (RECIPE!)
										i(203826),	-- Ancient Plans: Venomfang (RECIPE!)
										i(203861),	-- Ancient Plans: Venomreaver (RECIPE!)
										i(203836),	-- Ancient Plans: Warblades of the Hakkari Reborn (RECIPE!)
										i(203840),	-- Ancient Technique: Judgment of the Gurubashi (RECIPE!)
										-- Blue
										i(203842),	-- Ancient Pattern: Animist's Footwraps (RECIPE!)
										i(203843),	-- Ancient Pattern: Animists Legguards (RECIPE!)
										i(203848),	-- Ancient Pattern: Bloodlords Embrace (RECIPE!)
										i(203968),	-- Ancient Pattern: Cord of Shriveled Heads (RECIPE!)
										i(203844),	-- Ancient Pattern: Gloves of the Tormentor (RECIPE!)
										i(203849),	-- Ancient Pattern: Gurubashi Tigerhide Cloak (RECIPE!)
										i(203850),	-- Ancient Pattern: Gurubashi Headdress (RECIPE!)
										i(203845),	-- Ancient Pattern: Junglefury Gauntlets (RECIPE!)
										i(203846),	-- Ancient Pattern: Junglefury Leggings (RECIPE!)
										i(203851),	-- Ancient Pattern: Ritualistic Legwarmers (RECIPE!)
										i(203835),	-- Ancient Plans: Fiery Vengeance (RECIPE!)
										i(203825),	-- Ancient Plans: Gurubashi Carver (RECIPE!)
										i(203828),	-- Ancient Plans: Gurubashi Grinder (RECIPE!)
										i(203824),	-- Ancient Plans: Gurubashi Headplate (RECIPE!)
										i(203827),	-- Ancient Plans: Gurubashi Poker (RECIPE!)
										i(203837),	-- Ancient Plans: Gurubashi Slicer (RECIPE!)
										i(203832),	-- Ancient Plans: Pitchfork of Mojo Madness (RECIPE!)
										i(203830),	-- Ancient Plans: Sceptre of Hexing (RECIPE!)
										i(203841),	-- Ancient Technique: Gurubashi Ceremonial Staff (RECIPE!)
										i(203839),	-- Ancient Technique: Gurubashi Hoodoo Stick (RECIPE!)
									},
								}),
							},
						}),
						n(COMMON_BOSS_DROPS, {
							["description"] = createLocalizationString({
								readable = "Can drop from High Priest Venoxis, Bloodlord Mandokir, High Priestess Kilnara, Zanzil, and Jin'do the Godbreaker after completing the quest 'Restored Hakkari Bijou'.",
								constant = "CAN_DROP_FROM_HIGH_PRIEST_VENOXIS_BLOODLORD",
								export = true,
								text = {
									en = "Can drop from High Priest Venoxis, Bloodlord Mandokir, High Priestess Kilnara, Zanzil, and Jin'do the Godbreaker after completing the quest 'Restored Hakkari Bijou'.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "完成“修复的哈卡莱宝石”任务后，可从高阶祭司温诺希斯、血领主曼多基尔、高阶祭司基尔娜拉、赞吉尔和破神者金度身上掉落。",
									-- TODO: tw = "",
								},
							}),
							-- Danny Donkey: Description above replaces crs below as otherwise the 10.0.7 common boss drops will appear under the respective bosses for all players after 10.0.7, even those who have not unlocked 'Relics of a Fallen Empire'.
							-- ["crs"] = {
								-- 52155,	-- High Priest Venoxis
								-- 52151,	-- Bloodlord Mandokir
								-- 52059,	-- High Priestess Kilnara
								-- 52053,	-- Zanzil
								-- 52148,	-- Jin'do the Godbreaker
							-- },
							["groups"] = sharedData({ ["modID"] = 0 }, {
								i(203842),	-- Ancient Pattern: Animist's Footwraps (RECIPE!)
								i(203843),	-- Ancient Pattern: Animists Legguards (RECIPE!)
								i(203848),	-- Ancient Pattern: Bloodlords Embrace (RECIPE!)
								i(203968),	-- Ancient Pattern: Cord of Shriveled Heads (RECIPE!)
								i(203844),	-- Ancient Pattern: Gloves of the Tormentor (RECIPE!)
								i(203849),	-- Ancient Pattern: Gurubashi Tigerhide Cloak (RECIPE!)
								i(203850),	-- Ancient Pattern: Gurubashi Headdress (RECIPE!)
								i(203845),	-- Ancient Pattern: Junglefury Gauntlets (RECIPE!)
								i(203846),	-- Ancient Pattern: Junglefury Leggings (RECIPE!)
								i(203851),	-- Ancient Pattern: Ritualistic Legwarmers (RECIPE!)
								i(203835),	-- Ancient Plans: Fiery Bengeance (RECIPE!)
								i(203825),	-- Ancient Plans: Gurubashi Carver (RECIPE!)
								i(203828),	-- Ancient Plans: Gurubashi Grinder (RECIPE!)
								i(203824),	-- Ancient Plans: Gurubashi Headplate (RECIPE!)
								i(203827),	-- Ancient Plans: Gurubashi Poker (RECIPE!)
								i(203837),	-- Ancient Plans: Gurubashi Slicer (RECIPE!)
								i(203832),	-- Ancient Plans: Pitchfork of Mojo Madness (RECIPE!)
								i(203830),	-- Ancient Plans: Sceptre of Hexing (RECIPE!)
								i(203841),	-- Ancient Technique: Gurubashi Ceremonial Staff (RECIPE!)
								i(203839),	-- Ancient Technique: Gurubashi Hoodoo Stick (RECIPE!)
								i(203774, {	-- Big Bag o' Bijous
								--[[["sym"] = {{"select","itemID",
										BLUE_HAKKARI_BIJOU,
										BRONZE_HAKKARI_BIJOU,
										GOLD_HAKKARI_BIJOU,
										GREEN_HAKKARI_BIJOU,
										ORANGE_HAKKARI_BIJOU,
										PURPLE_HAKKARI_BIJOU,
										RED_HAKKARI_BIJOU,
										SILVER_HAKKARI_BIJOU,
										YELLOW_HAKKARI_BIJOU,
									}},
								--]]
								}),
								i(BLUE_HAKKARI_BIJOU),
								i(BRONZE_HAKKARI_BIJOU),
								i(GOLD_HAKKARI_BIJOU),
								i(GREEN_HAKKARI_BIJOU),
								i(ORANGE_HAKKARI_BIJOU),
								i(PURPLE_HAKKARI_BIJOU),
								i(RED_HAKKARI_BIJOU),
								i(SILVER_HAKKARI_BIJOU),
								i(YELLOW_HAKKARI_BIJOU),
							}),
						}),
						n(PROFESSIONS, {
							prof(FISHING, bubbleDown({ ["modID"] = 0, }, {
								q(74579, {	-- Daily Zul'Gurub Cache
									["name"] = "Daily Zul'Gurub Cache",
									["isDaily"] = true,
								}),
								i(BLOODSCALP_COIN),
								i(GURUBASHI_COIN),
								i(203743, {	-- Jostled Gurubashi Cache
									["description"] = createLocalizationString({
										readable = "You can fish only 1 out of the 2 caches per day. Requires the Mudskunk Aroma Buff which you randomly receive near the water.",
										constant = "YOU_CAN_FISH_ONLY_1_OUT_OF_THE_2_CACHES_PER_DAY",
										export = true,
										text = {
											en = "You can fish only 1 out of the 2 caches per day. Requires the Mudskunk Aroma Buff which you randomly receive near the water.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "每天你只能从 2 个藏匿处中钓取 1 个。需要泥臭鱼香气增益，你会在水域附近随机获得它。",
											-- TODO: tw = "",
										},
									}),
									["sym"] = {{"select","itemID",
										-- Items
										19945,	-- Lizardscale Eyepatch
										19947,	-- Nat Pagle's Broken Reel
										19944,	-- Nat Pagle's Fish Terminator
										19946,	-- Tigule's Harpoon
										22739,	-- Tome of Polymorph Turtle (CI!)
									}},
								}),
								i(HAKKARI_COIN),
								i(203912, {	-- Penny Pouch o' Paragons
									["sym"] = {{"select","itemID",
										-- Items
										19945,	-- Lizardscale Eyepatch
										19947,	-- Nat Pagle's Broken Reel
										19944,	-- Nat Pagle's Fish Terminator
										19946,	-- Tigule's Harpoon
										22739,	-- Tome of Polymorph Turtle (CI!)
									}},
								}),
								i(RAZZASHI_COIN),
								i(SANDFURY_COIN),
								i(SKULLSPLITTER_COIN),
								i(VILEBRANCH_COIN),
								i(203742, {	-- Waterlogged Gurubashi Cache
									["description"] = "~L.YOU_CAN_FISH_ONLY_1_OUT_OF_THE_2_CACHES_PER_DAY",
									["groups"] = {
										i(19945),	-- Lizardscale Eyepatch
										i(19947),	-- Nat Pagle's Broken Reel
										i(19944),	-- Nat Pagle's Fish Terminator
										i(19946),	-- Tigule's Harpoon
										i(22739),	-- Tome of Polymorph Turtle (CI!)
									},
								}),
								i(WITHERBARK_COIN),
								i(ZULIAN_COIN),
							})),
							prof(SKINNING, {
								i(19767, {	-- Primal Bat Leather
									["description"] = createLocalizationString({
										readable = "Ancient Bats can be found on the following locations in Zul'Gurub:\n* Pack of 2 by crossroads between the first two bridges.\n* Pack of 2 behind a tree just north down the path from the mentioned crossroad.\n* Pack of 3 between a wall and a hut on the eastern side of the second bridge.\n* Pack of 3 in the southwestern corner of Mandokir's Domain.\n* Pack of 2 in the northeastern corner of Mandokir's Domain.",
										constant = "ANCIENT_BATS_CAN_BE_FOUND_ON_THE_FOLLOWING",
										export = true,
										text = {
											en = "Ancient Bats can be found on the following locations in Zul'Gurub:\n* Pack of 2 by crossroads between the first two bridges.\n* Pack of 2 behind a tree just north down the path from the mentioned crossroad.\n* Pack of 3 between a wall and a hut on the eastern side of the second bridge.\n* Pack of 3 in the southwestern corner of Mandokir's Domain.\n* Pack of 2 in the northeastern corner of Mandokir's Domain.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "上古蝙蝠可以在祖尔格拉布的以下位置找到：\n* 前两座桥之间的十字路口旁，2 只一群。\n* 从上述十字路口沿路向北不远处的一棵树后，2 只一群。\n* 第二座桥东侧一堵墙和一间小屋之间，3 只一群。\n* 曼多基尔领地的西南角，3 只一群。\n* 曼多基尔领地的东北角，2 只一群。",
											-- TODO: tw = "",
										},
									}),
									["cr"] = 202341,	-- Ancient Bat
								}),
								i(19768, {	-- Primal Tiger Leather
									["description"] = createLocalizationString({
										readable = "Ancient Tigers can be found on the following locations in Zul'Gurub:\n* Pack of 2 west of the stairs by Mortaxx.\n* Pack of 2 east of the stairs by Mortaxx.\n* Pack of 3 east of the inn.\n* Pack of 3 northwest of the inn.\n* Pack of 3 outside of the eastern outer wall of Temple of Bethekk.",
										constant = "ANCIENT_TIGERS_CAN_BE_FOUND_ON_THE_FOLLOWING",
										export = true,
										text = {
											en = "Ancient Tigers can be found on the following locations in Zul'Gurub:\n* Pack of 2 west of the stairs by Mortaxx.\n* Pack of 2 east of the stairs by Mortaxx.\n* Pack of 3 east of the inn.\n* Pack of 3 northwest of the inn.\n* Pack of 3 outside of the eastern outer wall of Temple of Bethekk.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "上古猛虎可以在祖尔格拉布的以下位置找到：\n* 莫塔克斯旁楼梯的西侧，2 只一群。\n* 莫塔克斯旁楼梯的东侧，2 只一群。\n* 旅店东侧，3 只一群。\n* 旅店西北方，3 只一群。\n* 贝瑟克神庙东侧外墙外，3 只一群。",
											-- TODO: tw = "",
										},
									}),
									["cr"] = 202339,	-- Ancient Tiger
								}),
							}),
						}),
						n(QUESTS, {
							q(74696, {	-- Gurubashi, Vilebranch, and Witherbark Coins
								["qg"] = 143138,	-- Rin'wosho the Trader
								["cost"] = {
									{ "i", GURUBASHI_COIN, 1 },
									{ "i", VILEBRANCH_COIN, 1 },
									{ "i", WITHERBARK_COIN, 1 },
								},
								["repeatable"] = true,
								["groups"] = {
									i(ZANDALAR_BARGAINING_TOKEN),
								},
							}),
							q(74576, {	-- Restored Hakkari Bijou
								["description"] = createLocalizationString({
									readable = " Collect both, combine them & deliver them to Rin'wosho in Zandalar at 55.0 86.8",
									constant = "COLLECT_BOTH_COMBINE_THEM_DELIVER_THEM_TO_RIN",
									export = true,
									text = {
										en = " Collect both, combine them & deliver them to Rin'wosho in Zandalar at 55.0 86.8",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = " 收集两者，将它们组合起来，然后交给赞达拉的林沃肖，坐标 55.0 86.8",
										-- TODO: tw = "",
									},
								}),
								["provider"] = { "i", 203737 },	-- Restored Hakkari Bijou
								["coord"] = { 55.0, 86.8, DAZARALOR },
							}),
							q(74697, {	-- Sandfury, Skullsplitter, and Bloodscalp Coins
								["qg"] = 143138,	-- Rin'wosho the Trader
								["cost"] = {
									{ "i", BLOODSCALP_COIN, 1 },
									{ "i", SANDFURY_COIN, 1 },
									{ "i", SKULLSPLITTER_COIN, 1 },
								},
								["repeatable"] = true,
								["groups"] = {
									i(ZANDALAR_BARGAINING_TOKEN),
								},
							}),
							q(74695, {	-- Zulian, Razzashi, and Hakkari Coins
								["qg"] = 143138,	-- Rin'wosho the Trader
								["cost"] = {
									{ "i", HAKKARI_COIN, 1 },
									{ "i", RAZZASHI_COIN, 1 },
									{ "i", ZULIAN_COIN, 1 },
								},
								["repeatable"] = true,
								["groups"] = {
									i(ZANDALAR_BARGAINING_TOKEN),
								},
							}),
						}),
						n(TREASURES, {
							o(387496, {	-- Brazier of Madness
								["description"] = createLocalizationString({
									readable = "Can be looted near the Cache of Madness event, to the left of the altar at 61.2, 45.6.",
									constant = "CAN_BE_LOOTED_NEAR_THE_CACHE_OF_MADNESS_EVENT",
									export = true,
									text = {
										en = "Can be looted near the Cache of Madness event, to the left of the altar at 61.2, 45.6.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "可在疯狂之匣事件附近，即祭坛左侧 61.2, 45.6 处拾取。",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									i(203757),	-- Brazier of Madness (TOY!)
								},
							}),
							o(386669, {	-- Fragmented Hakkari Bijou
								["description"] = createLocalizationString({
									readable = "The first Bijou named 'Fragmented Hakkari Bijou' is near the gong in the middle of the pyramid at roughly 48.6, 42.3.",
									constant = "THE_FIRST_BIJOU_NAMED_FRAGMENTED_HAKKARI_BIJOU",
									export = true,
									text = {
										en = "The first Bijou named 'Fragmented Hakkari Bijou' is near the gong in the middle of the pyramid at roughly 48.6, 42.3.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "第一件名为“碎裂的哈卡莱宝石”的宝石位于金字塔中央的铜锣附近，大约在 48.6, 42.3。",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									i(203736),	-- Fragmented Hakkari Bijou
								},
							}),
							i(203737, {	-- Restored Hakkari Bijou
								["cost"] = {
									{ "i", 203736, 1 },	-- Fragmented Hakkari Bijou
									{ "i", 203735, 1 },	-- Shattered Hakkari Bijou
								},
							}),
							o(386668, {	-- Shattered Hakkari Bijou
								["description"] = createLocalizationString({
									readable = "The second Bijou named 'Shattered Hakkari Bijou' is at the same spot, but during phase 2 of the Jin'do Boss Encounter. In the middle of the pyramid at roughly 48.6, 42.3 ",
									constant = "THE_SECOND_BIJOU_NAMED_SHATTERED_HAKKARI_BIJOU",
									export = true,
									text = {
										en = "The second Bijou named 'Shattered Hakkari Bijou' is at the same spot, but during phase 2 of the Jin'do Boss Encounter. In the middle of the pyramid at roughly 48.6, 42.3 ",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "第二件名为“破碎的哈卡莱宝石”的宝石在同一位置，但要在金度首领战的第二阶段。位于金字塔中央，大约在 48.6, 42.3 ",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									i(203735),	-- Shattered Hakkari Bijou
								},
							}),
							o(180368, {	-- Tablet of Madness
								["description"] = createLocalizationString({
									readable = "Can be looted near the Cache of Madness event, above the altar at 61.2, 45.6.\nAlchemists with 300 classic skill can interact with the Tablet of Madness to learn the recipe.",
									constant = "CAN_BE_LOOTED_NEAR_THE_CACHE_OF_MADNESS_EVENT_2",
									export = true,
									text = {
										en = "Can be looted near the Cache of Madness event, above the altar at 61.2, 45.6.\nAlchemists with 300 classic skill can interact with the Tablet of Madness to learn the recipe.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "可在疯狂之匣事件附近，即祭坛上方 61.2, 45.6 处拾取。\n拥有 300 点经典技能等级的炼金师可以与疯狂石板互动来学习该配方。",
										-- TODO: tw = "",
									},
								}),
								["requireSkill"] = ALCHEMY,
								["groups"] = {
									recipe(24266),	-- Gurubashi Mojo Madness
								},
							}),
						}),
						n(VENDORS, {
							n(143138, {	-- Rin'wosho the Trader <Zandalar Supplies & Repair>
								["sourceAchievement"] = 17366,	-- Relics of a Fallen Empire
								["coord"] = { 55.0, 86.8, DAZARALOR },
								["groups"] = {
									cl(DRUID, {
										iensemble(203974, {	-- Ensemble: Zandalar Haruspec
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", ORANGE_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(HUNTER, {
										iensemble(203975, {	-- Ensemble: Zandalar Predator
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", GREEN_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(MAGE, {
										iensemble(203976, {	-- Ensemble: Zandalar Illusionist
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", RED_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(PALADIN, {
										iensemble(203977, {	-- Ensemble: Zandalar Freethinker
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", GOLD_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(PRIEST, {
										iensemble(203978, {	-- Ensemble: Zandalar Confessor
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", SILVER_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(ROGUE, {
										iensemble(203979, {	-- Ensemble: Zandalar Madcap
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", YELLOW_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(SHAMAN, {
										iensemble(203980, {	-- Ensemble: Zandalar Augur
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", BLUE_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(WARLOCK, {
										iensemble(203981, {	-- Ensemble: Zandalar Demoniac
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", PURPLE_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									cl(WARRIOR, {
										iensemble(203982, {	-- Ensemble: Zandalar Vindicator
											["cost"] = {
												{ "i", ZANDALAR_BARGAINING_TOKEN, 4 },
												{ "i", BRONZE_HAKKARI_BIJOU, 6 },
											},
										}),
									}),
									iensemble(203983, {	-- Ensemble: Bloodtinged Cloth
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", BLUE_HAKKARI_BIJOU, 4 },
										},
									}),
									iensemble(203984, {	-- Ensemble: Blooddrenched Leather
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", YELLOW_HAKKARI_BIJOU, 4 },
										},
									}),
									iensemble(203985, {	-- Ensemble: Bloodstained Mail
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", GREEN_HAKKARI_BIJOU, 4 },
										},
									}),
									iensemble(203986, {	-- Ensemble: Bloodsoaked Plate
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", RED_HAKKARI_BIJOU, 4 },
										},
									}),
									i(20757, {	-- Formula: Brilliant Mana Oil (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", GOLD_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20756, {	-- Formula: Brilliant Wizard Oil (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", GOLD_HAKKARI_BIJOU, 5 },
										},
									}),
									i(19772, {	-- Pattern: Blood Tiger Breastplate (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", ORANGE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19773, {	-- Pattern: Blood Tiger Shoulders (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", ORANGE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19766, {	-- Pattern: Bloodvine Boots (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 3 },
											{ "i", PURPLE_HAKKARI_BIJOU, 7 },
										},
									}),
									i(19765, {	-- Pattern: Bloodvine Leggings (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 3 },
											{ "i", PURPLE_HAKKARI_BIJOU, 7 },
										},
									}),
									i(19764, {	-- Pattern: Bloodvine Vest (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 3 },
											{ "i", PURPLE_HAKKARI_BIJOU, 7 },
										},
									}),
									i(19771, {	-- Pattern: Primal Batskin Bracers (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", ORANGE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19770, {	-- Pattern: Primal Batskin Gloves (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", ORANGE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19769, {	-- Pattern: Primal Batskin Jerkin (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", ORANGE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19776, {	-- Plans: Bloodsoul Breastplate (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", BRONZE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19778, {	-- Plans: Bloodsoul Gauntlets (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", BRONZE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19777, {	-- Plans: Bloodsoul Shoulders (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 7 },
											{ "i", BRONZE_HAKKARI_BIJOU, 3 },
										},
									}),
									i(19779, {	-- Plans: Darksoul Breastplate (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", BRONZE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(19780, {	-- Plans: Darksoul Leggings (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 7 },
											{ "i", BRONZE_HAKKARI_BIJOU, 3 },
										},
									}),
									i(19781, {	-- Plans: Darksoul Shoulders (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 6 },
											{ "i", BRONZE_HAKKARI_BIJOU, 4 },
										},
									}),
									i(20012, {	-- Recipe: Greater Dreamless Sleep Potion (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", SILVER_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20013, {	-- Recipe: Living Action Potion (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", SILVER_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20011, {	-- Recipe: Mageblood Elixir[2.1.0+] (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", SILVER_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20014, {	-- Recipe: Mighty Troll's Blood Elixir (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", SILVER_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20000, {	-- Schematic: Bloodvine Goggles (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", GOLD_HAKKARI_BIJOU, 5 },
										},
									}),
									i(20001, {	-- Schematic: Bloodvine Lens (RECIPE!)
										["cost"] = {
											{ "i", ZANDALAR_BARGAINING_TOKEN, 5 },
											{ "i", GOLD_HAKKARI_BIJOU, 5 },
										},
									}),
								},
							}),
						}),
						n(ZONE_DROPS, bubbleDown({ ["modID"] = 0, }, {
							i(BLUE_HAKKARI_BIJOU),
							i(BRONZE_HAKKARI_BIJOU),
							i(GOLD_HAKKARI_BIJOU),
							i(GREEN_HAKKARI_BIJOU),
							i(ORANGE_HAKKARI_BIJOU),
							i(PURPLE_HAKKARI_BIJOU),
							i(RED_HAKKARI_BIJOU),
							i(SILVER_HAKKARI_BIJOU),
							i(YELLOW_HAKKARI_BIJOU),
							i(BLOODSCALP_COIN),
							i(GURUBASHI_COIN),
							i(HAKKARI_COIN),
							i(203912, {	-- Penny Pouch o' Paragons
								["sym"] = {{"select","itemID",
									-- Items
									19945,	-- Lizardscale Eyepatch
									19947,	-- Nat Pagle's Broken Reel
									19944,	-- Nat Pagle's Fish Terminator
									19946,	-- Tigule's Harpoon
									22739,	-- Tome of Polymorph Turtle (CI!)
								}},
							}),
							i(19943),	-- Massive Mojo
							i(RAZZASHI_COIN),
							i(SANDFURY_COIN),
							i(SKULLSPLITTER_COIN),
							i(VILEBRANCH_COIN),
							i(WITHERBARK_COIN),
							i(ZULIAN_COIN),
						})),
					},
				})),
				n(ACHIEVEMENTS, {
					ach(5744, {	-- Gurubashi Headhunter
						crit(16808, {	-- Gub
							["_npcs"] = { 52440 },	-- Gub
						}),
						crit(16809, {	-- Mortaxx
							["_npcs"] = { 52438 },	-- Mortaxx
						}),
						crit(16810, {	-- Kaulema
							["_npcs"] = { 52422 },	-- Kaulema
						}),
						crit(16811, {	-- Mor'Lek
							["_npcs"] = { 52405 },	-- Mor'Lek
						}),
						crit(16812, {	-- Hive Queen
							["_npcs"] = { 52442 },	-- Florawing Hive Queen
						}),
						crit(16813, {	-- Lost Offspring
							["_npcs"] = { 52418 },	-- Lost Offspring of Gahz'ranka
						}),
						crit(16814, {	-- Gurubashi Master Chef
							["_npcs"] = { 52392 },	-- Gurubashi Master Chef
						}),
						crit(17022, {	-- Tor-Tun
							["_npcs"] = { 52414 },	-- Tor-Tun
						}),
					}),
				}),
				n(QUESTS, {
					q(29155, {	-- A Shiny Reward
						["sourceQuests"] = {
							29153,	-- Booty Bay's Interests
							29154,	-- Booty Bay's Interests
						},
						["qgs"] = {
							2496,	-- Baron Revilgaz
							53151,	-- Overseer Blingbang
						},
						["races"] = ALLIANCE_ONLY,
						["groups"] = {
							i(69262, {	-- Black Ice
								["timeline"] = { REMOVED_7_0_3 },
							}),
							i(133997, {	-- Black Ice (TOY!)
								["timeline"] = { ADDED_7_0_3 },
							}),
							i(69863),	-- Golden Necklace
							i(69865),	-- Gem-Studded Bracelets
							i(69864),	-- Tarnished Crown
						},
					}),
					q(29253, {	-- A Shiny Reward
						["sourceQuests"] = {
							29251,	-- Booty Bay's Interests
							29252,	-- Booty Bay's Interests
						},
						["qgs"] = {
							2496,	-- Baron Revilgaz
							53151,	-- Overseer Blingbang
						},
						["races"] = HORDE_ONLY,
						["groups"] = {
							i(69262, {	-- Black Ice
								["timeline"] = { REMOVED_7_0_3 },
							}),
							i(133997, {	-- Black Ice (TOY!)
								["timeline"] = { ADDED_7_0_3 },
							}),
							i(69863),	-- Golden Necklace
							i(69865),	-- Gem-Studded Bracelets
							i(69864),	-- Tarnished Crown
						},
					}),
					q(29208, {	-- An Old Friend
						["sourceQuests"] = {
							26775,	-- Be Raptor [Alliance]
							26362,	-- Be Raptor [Horde]
						},
						["qg"] = 52877,	-- Lashtail Hatchling
						["groups"] = {
							i(69251, {	-- Lashtail Hatchling (PET!)
								["timeline"] = { ADDED_4_1_0 },
							}),
						},
					}),
					q(29154, {	-- Booty Bay's Interests
						["qg"] = 53151,	-- Overseer Blingblang
						["races"] = ALLIANCE_ONLY,
					}),
					q(29252, {	-- Booty Bay's Interests
						["qg"] = 53151,	-- Overseer Blingblang
						["races"] = HORDE_ONLY,
					}),
					q(29241, {	-- Break the Godbreaker
						["qg"] = 53024,	-- Bloodslayer Zala
					}),
					q(29175, {	-- Break Their Spirits
						["qg"] = 53023,	-- Bloodslayer T'ara
					}),
					q(29242, {	-- Putting a Price on Priceless
						["qg"] = 53043,	-- Briney Boltcutter
					}),
					q(29173, {	-- Secondary Targets
						["qg"] = 53023,	-- Bloodslayer T'ara
					}),
					q(29172, {	-- The Beasts Within
						["qg"] = 53023,	-- Bloodslayer T'ara
					}),
					q(29262, {	-- Zul'Gurub Voodoo
						["description"] = createLocalizationString({
							readable = "You need 425 Archaeology and a Troll Tablet to activate the \"Call of the Raptor\" buff which summons raptor hatchlings to attack your enemies.",
							constant = "YOU_NEED_425_ARCHAEOLOGY_AND_A_TROLL_TABLET_TO",
							export = true,
							text = {
								en = "You need 425 Archaeology and a Troll Tablet to activate the \"Call of the Raptor\" buff which summons raptor hatchlings to attack your enemies.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你需要 425 点考古学技能和一个巨魔石板，才能激活“迅猛龙之唤”增益，它会召唤迅猛龙幼崽攻击你的敌人。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "o", 208550 },	-- Voodoo Pile
						["isDaily"] = true,
					}),
				}),
				n(ZONE_DROPS, {
					i(69802),	-- Band of the Gurubashi Berserker
					i(69803),	-- Gurubashi Punisher
					i(69800),	-- Spiritguard Drape
					i(69796),	-- Spiritcaller Cloak
				}),
				n(52442, {	-- Florawing Hive Queen (unique mob)
					["questID"] = 53809,	-- KillID
					["isDaily"] = true,
					["groups"] = {
						i(69817),	-- Hive Queen's Honeycomb
					},
				}),
				n(52440, {	-- Gub (unique mob)
					i(69823),	-- Gub's Catch
				}),
				n(52418, {	-- Lost Offspring of Gahz'ranka (elite mob)
					i(70719),	-- Water-Filled Gills
				}),
				n(52414),	-- Tor-Tun (unique mob)
				e(175, {	-- High Priest Venoxis
					["crs"] = { 52155 },	-- High Priest Venoxis
					["groups"] = {
						ach(5743),	-- It's Not Easy Being Green
						i(69600),	-- Belt of Slithering Serpents
						i(69603),	-- Breastplate of Serenity
						i(69604),	-- Coils of Hate
						i(69601),	-- Serpentine Leggings
						i(69602),	-- Signet of Venoxis
					},
				}),
				n(52422, {	-- Kaulema (unique mob)
					i(69818),	-- Giant Sack
				}),
				e(176, {	-- Bloodlord Mandokir
					["crs"] = { 52151 },	-- Bloodlord Mandokir
					["groups"] = {
						ach(5762),	-- Ohganot So Fast!
						i(68823),	-- Armored Razzashi Raptor (MOUNT!)
						i(69605),	-- Amulet of the Watcher
						i(69609),	-- Bloodlord's Protector
						i(69608),	-- Deathcharged Wristguards
						i(69606),	-- Hakkari Loa Drape
						i(69607),	-- Touch of Discord
					},
				}),
				n(52405, {	-- Mor'Lek (unique mob)
					i(69818),	-- Giant Sack
				}),
				n(CACHE_OF_MADNESS, {
					--[[ encounter IDs if we're ever able to use an array for them:
						177,	-- Gri'lek
						178,	-- Hazza'rah
						179,	-- Renataki
						180,	-- Wushoolay
					--]]
					["crs"] = {
						-- These artifacts are used to summon the boss.
						52446,	-- Ancient Dwarven Artifact
						52450,	-- Ancient Elven Artifact
						52454,	-- Ancient Fossil
						52452,	-- Ancient Troll Artifact
					},
					["groups"] = {
						n(DROPS, {
							["crs"] = {
								52258,	-- Gri'lek
								52271,	-- Hazza'rah
								52269,	-- Renataki
								52286,	-- Wushoolay
							},
							["groups"] = {
								i(69630),	-- Handguards of the Tormented
								i(69632),	-- Lost Bag of Whammies
								i(69633),	-- Plunderer's Gauntlets
								i(69631),	-- Zulian Voodoo Stick
							},
						}),
						n(52258, {	-- Gri'lek
							i(69635),	-- Amulet of Protection
							i(69634),	-- Fasc's Preserved Boots
						}),
						n(52271, {	-- Hazza'rah
							i(69637),	-- Gurubashi Destroyer
							i(69636),	-- Thekal's Claws
						}),
						n(52269, {	-- Renataki
							i(69638),	-- Arlokk's Claws
							i(69639),	-- Renataki's Soul Slicer
						}),
						n(52286, {	-- Wushoolay
							i(69640),	-- Kilt of Forgotten Rites
							i(69641),	-- Troll Skull Chestplate
						}),
					},
				}),
				n(52438, {	-- Mortaxx (unique mob)
					-- i(52722),	-- Maelstrom Crystal
				}),
				n(52392, {	-- Gurubashi Master Chef (unique mob)
					i(69822),	-- Master Chef's Groceries
				}),
				e(181, {	-- High Priestess Kilnara
					["crs"] = { 52059 },	-- High Priestess Kilnara
					["groups"] = {
						ach(5765),	-- Here, Kitty Kitty...
						i(68824),	-- Swift Zulian Panther (MOUNT!)
						i(69610),	-- Arlokk's Signet
						i(69612),	-- Claw-Fringe Mantle
						i(69613),	-- Leggings of the Pride
						i(69614),	-- Roaring Mask of Bethekk
						i(69611),	-- Sash of Anguish
						n(53088, {	-- Temple Rat
							["description"] = createLocalizationString({
								readable = "Loot the rats and throw them to the awake Pride of Bethekk during the boss fight for the achievement 'Here, Kitty Kitty...'. Only one rat per cat counts.\n\nThe Temple Rat in the room adjacent to the boss room can be looted through the wall when it wanders close enough.",
								constant = "LOOT_THE_RATS_AND_THROW_THEM_TO_THE_AWAKE_PRIDE",
								export = true,
								text = {
									en = "Loot the rats and throw them to the awake Pride of Bethekk during the boss fight for the achievement 'Here, Kitty Kitty...'. Only one rat per cat counts.\n\nThe Temple Rat in the room adjacent to the boss room can be looted through the wall when it wanders close enough.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在与首领战斗时拾取老鼠，把它们扔给清醒的贝瑟克的兽群，以完成成就“来，小猫咪……”。每只猫只计算一只老鼠。\n\n与首领房间相邻的房间里的神庙老鼠在游荡得足够近时，可以隔着墙拾取。",
									-- TODO: tw = "",
								},
							}),
						}),
					},
				}),
				e(184, {	-- Zanzil
					["crs"] = { 52053 },	-- Zanzil
					["groups"] = {
						i(69619),	-- Bone Plate Handguards
						i(69617),	-- Plumed Medicine Helm
						i(69616),	-- Spiritbinder Spaulders
						i(69615),	-- Zombie Walker Legguards
						i(69618),	-- Zulian Slicer
					},
				}),
				e(185, {	-- Jin'do the Godbreaker
					["crs"] = { 52148 },	-- Jin'do the Godbreaker
					["groups"] = {
						ach(5768),	-- Heroic: Zul'Gurub
						ach(5770),	-- Heroic: Zul'Gurub Guild Run
						ach(5759),	-- Spirit Twister
						i(69628),	-- Jeklik's Smasher
						i(69626),	-- Jin'do's Verdict
						i(69624),	-- Legacy of Arlokk
						i(69625),	-- Mandokir's Tribute
						i(69629),	-- Shield of the Blood God
						i(69622),	-- The Hexxer's Mask
						i(69620),	-- Twinblade of the Hakkari
						i(69621),	-- Twinblade of the Hakkari
						i(69623),	-- Vestments of the Soulflayer
						i(69627),	-- Zulian Ward
						h(i(122215, {	-- Music Roll: Zul'Gurub Voodoo
							["timeline"] = { ADDED_6_1_0 },
						})),
						n(52167, {	-- Gurubashi Spirit Warrior
							["description"] = createLocalizationString({
								readable = "|CFFFF0000At least one MUST be killed prior to Jin'do the Godbreaker encounter Phase 2 start, otherwise fight will be impossible.|r\n\nIn Phase 2 their spirits will spawn and they must be pulled up to Hakkar's chains in order to break them with their ability 'Body Slam'.",
								constant = "CFFFF0000AT_LEAST_ONE_MUST_BE_KILLED_PRIOR_TO",
								export = true,
								text = {
									en = "|CFFFF0000At least one MUST be killed prior to Jin'do the Godbreaker encounter Phase 2 start, otherwise fight will be impossible.|r\n\nIn Phase 2 their spirits will spawn and they must be pulled up to Hakkar's chains in order to break them with their ability 'Body Slam'.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "|CFFFF0000在碎神者金度战斗第 2 阶段开始前，必须至少击杀其中一位，否则战斗将无法进行。|r\n\n在第 2 阶段，他们的灵魂会刷新，必须把它们拉到哈卡的锁链旁，用它们的技能“泰山压顶”将其击碎。",
									-- TODO: tw = "",
								},
							}),
						}),
					},
				}),
			}),
		},
	})),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_2 } }, {
	inst(76, {
		["_drop"] = { "isRaid" },	-- prevent merging isRaid from Classic version
		["groups"] = {
			q(35411),	-- Zul'Gurub Reward Quest - Heroic completion
			q(35412),	-- Zul'Gurub Bonus Objective Reward Quest - kill Cache of Madness
		},
	}),
})));
