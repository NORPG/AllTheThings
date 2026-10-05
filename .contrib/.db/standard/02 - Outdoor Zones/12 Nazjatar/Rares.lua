---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(NAZJATAR, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	n(RARES, {
		n(COMMON_BOSS_DROPS, {
			pvp(i(168802, {	-- Nazjatar Battle Commendation
				["description"] = createLocalizationString({
					readable = "Drops from Rares while in Warmode and from the zone Battle.",
					constant = "DROPS_FROM_RARES_WHILE_IN_WARMODE_AND_FROM_THE",
					export = true,
					text = {
						en = "Drops from Rares while in Warmode and from the zone Battle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在战争模式下由稀有生物掉落，也可通过区域战斗获得。",
						-- TODO: tw = "",
					},
				}),
			})),
			i(168081),	-- Brinestone Pickaxe
			i(167077),	-- Scrying Stone
		}),
		n(152415, {	-- Alga the Eyeless
			["questID"] = 56279,
			["isDaily"] = true,
			["coord"] = { 52.4, 41.9, NAZJATAR },
			["groups"] = {
				i(170189, {	-- Blind Eye
					["description"] = createLocalizationString({
						readable = "Turn it in to |cFFFFD700Gloomseeker Yarga|r (cave entrance at 38.6, 58.3) for a hefty sum of gold.",
						constant = "TURN_IT_IN_TO_CFFFFD700GLOOMSEEKER_YARGA_R_CAVE",
						export = true,
						text = {
							en = "Turn it in to |cFFFFD700Gloomseeker Yarga|r (cave entrance at 38.6, 58.3) for a hefty sum of gold.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "交给 |cFFFFD700寻暗者亚尔加|r（洞穴入口位于 38.6, 58.3），可获得一大笔金币。",
							-- TODO: tw = "",
						},
					}),
				}),
			},
		}),
		n(152416, {	-- Allseer Oma'kil
			["questID"] = 56280,
			["coords"] = {
				{ 65.4, 36.5, NAZJATAR },
				{ 70.7, 34.2, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(167786),	-- Germinating Seed
			},
		}),
		n(152794, {	-- Amethyst Spireshell
			["description"] = createLocalizationString({
				readable = "This rare can spawn pretty much anywhere throughout the zone.",
				constant = "THIS_RARE_CAN_SPAWN_PRETTY_MUCH_ANYWHERE",
				export = true,
				text = {
					en = "This rare can spawn pretty much anywhere throughout the zone.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "此稀有怪几乎可以在该区域的任何地方刷新。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56268,
			["isDaily"] = true,
			["coords"] = {
				{ 36.8, 27.7, NAZJATAR },	-- cave entrance, putting it here instead of the actual coordinate because it's easy to mistakenly go to the top level above the cave
				{ 55.0, 29.1, NAZJATAR },
				{ 57.5, 51.1, NAZJATAR },
				{ 58.8, 48.2, NAZJATAR },
				{ 60.6, 33.9, NAZJATAR },
				{ 72.2, 36.2, NAZJATAR },
			},
			["groups"] = {
				i(169363),	-- Amethyst Softshell (PET!)
				i(170172),	-- Brightspine Shell
			},
		}),
		n(152566, {	-- Anemonar
			["description"] = createLocalizationString({
				readable = "Kill a |cFFFFD700Colossal Sky Ray|r on top of Anemonar to activate him. |cFFDD3333Before you start kiting make sure any followers are deactivated by right-clicking the buff to dismiss.",
				constant = "KILL_A_CFFFFD700COLOSSAL_SKY_RAY_R_ON_TOP_OF",
				export = true,
				text = {
					en = "Kill a |cFFFFD700Colossal Sky Ray|r on top of Anemonar to activate him. |cFFDD3333Before you start kiting make sure any followers are deactivated by right-clicking the buff to dismiss.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在海葵纳尔上方击杀一只|cFFFFD700巨型天空鳐|r来激活他。|cFFDD3333开始风筝之前，请确保通过右键点击增益来解散并停用所有追随者。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56281,
			["isDaily"] = true,
			["coord"] = { 58.6, 53.2, NAZJATAR },
			["sym"] = {{"select","itemID",
				170184,	-- Ancient Reefwalker Bark
				170183,	-- Reefwalker Bark
			}},
		}),
		n(150191, {	-- Avarius
			["questID"] = 55584,
			["isDaily"] = true,
			["coord"] = { 36.9, 11.2, NAZJATAR },
			["crs"] = { 150248 },	-- Brinestone Deposit
			["description"] = createLocalizationString({
				readable = "First complete the white item version of Brinestone Pickaxe (/att quest:55531), which can drop from any rare or treasure in Nazjatar.\n\nAfter you completed 'What Will It Mine?', you are now eligible to loot the green quality Brinestone Pickaxe from Chitterspine Encroachers around Avarius' location.\n\nOnce you obtained the green quality Brinestone Pickaxe, you can interact with the stone at the Rare's Location to start the summoning ritual.\n\nYou have to collect 5 different colored shards, which are mined from nearby untrackable Brinestone Deposits & put the correct shard into each pillar.\n\nThere are 7 Deposits, within max. 50-60 yards of the event, that can be mined without the mining profession & have 1 minute respawn timer.\n\nThe mining recipes are not bound to a daily lockout & can be farmed.\n\nRespawn timer of the Event is roughly 20 minutes.",
				constant = "FIRST_COMPLETE_THE_WHITE_ITEM_VERSION_OF",
				export = true,
				text = {
					en = "First complete the white item version of Brinestone Pickaxe (/att quest:55531), which can drop from any rare or treasure in Nazjatar.\n\nAfter you completed 'What Will It Mine?', you are now eligible to loot the green quality Brinestone Pickaxe from Chitterspine Encroachers around Avarius' location.\n\nOnce you obtained the green quality Brinestone Pickaxe, you can interact with the stone at the Rare's Location to start the summoning ritual.\n\nYou have to collect 5 different colored shards, which are mined from nearby untrackable Brinestone Deposits & put the correct shard into each pillar.\n\nThere are 7 Deposits, within max. 50-60 yards of the event, that can be mined without the mining profession & have 1 minute respawn timer.\n\nThe mining recipes are not bound to a daily lockout & can be farmed.\n\nRespawn timer of the Event is roughly 20 minutes.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "首先完成白色物品版本的盐石鹤嘴锄（/att quest:55531），它可以从纳沙塔尔的任何稀有生物或宝藏中掉落。\n\n完成“它能挖出什么？”后，你现在可以从阿瓦里乌斯位置附近的颤脊噬食者身上拾取绿色品质的盐石鹤嘴锄。\n\n获得绿色品质的盐石鹤嘴锄后，你可以与该稀有生物所在地的石头互动，开始召唤仪式。\n\n你必须收集 5 种不同颜色的碎片，它们从附近无法追踪的盐石矿脉中开采获得，并将正确的碎片放入每根柱子中。\n\n事件周围最多 50-60 码范围内有 7 处矿脉，无需采矿业即可开采，且刷新时间为 1 分钟。\n\n这些采矿配方不受每日锁定限制，可以反复刷取。\n\n事件的刷新时间约为 20 分钟。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(169373),	-- Brinestone Algan (PET!)
				i(169612),	-- Recipe: Osmenite Deposit [Rank 2] (RECIPE!)
				i(169613),	-- Recipe: Osmenite Seam [Rank 2] (RECIPE!)
			},
		}),
		n(152361, {	-- Banescale the Packfather
			["description"] = createLocalizationString({
				readable = "There is a chance for Banescale to spawn after |cFFCC4D38Siltstalker the Packmother|r is killed.",
				constant = "THERE_IS_A_CHANCE_FOR_BANESCALE_TO_SPAWN_AFTER",
				export = true,
				text = {
					en = "There is a chance for Banescale to spawn after |cFFCC4D38Siltstalker the Packmother|r is killed.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "击杀 |cFFCC4D38族群之母淤泥追猎者|r 后有几率刷新灾鳞。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56282,	-- also triggered 56601, not sure which is first kill ID
			["isDaily"] = true,
			["coord"] = { 73.4, 54.0, NAZJATAR },
			["groups"] = {
				i(170177),	-- Exposed Fish
				i(170179),	-- Snapdragon Scent Gland
			},
		}),
		n(152712, {	-- Blindlight (Verified: Pr3vention)
			["questID"] = 56269,
			["isDaily"] = true,
			["coords"] = {
				{ 37.4, 82.6, NAZJATAR },	-- mob
				{ 39.8, 77.2, NAZJATAR },	-- cave entrance
			},
			["groups"] = {
				i(169372),	-- Necrofin Tadpole (PET!)
				i(170191, {	-- Skeletal Hand
					["description"] = createLocalizationString({
						readable = "Turn it in to |cFFFFD700Gloomseeker Yarga|r for a hefty sum of gold.",
						constant = "TURN_IT_IN_TO_CFFFFD700GLOOMSEEKER_YARGA_R_FOR",
						export = true,
						text = {
							en = "Turn it in to |cFFFFD700Gloomseeker Yarga|r for a hefty sum of gold.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "将其交还给|cFFFFD700寻暗者亚尔加|r以换取一大笔金币。",
							-- TODO: tw = "",
						},
					}),
					-- didn't trigger quest completion!
				}),
			},
		}),
		n(149653, {	-- Carnivorous Lasher
			["questID"] = 55366,
			["coord"] = { 54.7, 41.7, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(169375),	-- Coral Lashling (PET!)
				i(169611),	-- Recipe: Zin'anthid [Rank 2]
			},
		}),
		n(152464, {	-- Caverndark Terror
			["questID"] = 56283,
			["coord"] = { 42.3, 13.2, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(169356),	-- Caverndark Nightmare (PET!)
			},
		}),
		n(152556, {	-- Chasm-Haunter
			["questID"] = 56270,
			["coord"] = { 49.2, 88.8, NAZJATAR },
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Inside a hidden underwater cave beneath the waterfall.",
				constant = "INSIDE_A_HIDDEN_UNDERWATER_CAVE_BENEATH_THE",
				export = true,
				text = {
					en = "Inside a hidden underwater cave beneath the waterfall.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在瀑布下方的隐蔽水下洞穴内。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(170167),	-- Eel Filet
			},
		}),
		n(152756, {	-- Daggertooth Terror
			["questID"] = 56271,
			["coords"] = {
				{ 26.3, 29.0, NAZJATAR },
				{ 39.4, 72.0, NAZJATAR },
				{ 39.7, 27.9, NAZJATAR },
				{ 39.0, 59.3, NAZJATAR },
				{ 40.2, 81.5, NAZJATAR },
				{ 45.9, 70.9, NAZJATAR },
				{ 48.6, 19.7, NAZJATAR },
				{ 70.1, 42.1, NAZJATAR },
				{ 70.5, 33.5, NAZJATAR },
				{ 71.0, 33.1, NAZJATAR },
				{ 71.9, 28.1, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(169361),	-- Daggertooth Frenzy (PET!)
			},
		}),
		n(152291, {	-- Deepglider
			["questID"] = 56272,
			["isDaily"] = true,
			["coords"] = {
				{ 52.9, 53.5, NAZJATAR },
				{ 56.4, 43.5, NAZJATAR },
			},
			["groups"] = {
				i(170176),	-- Fathom Ray Wing
			},
		}),
		n(152414, {	-- Elder Unu
			["questID"] = 56284,
			["coords"] = {
				{ 64.3, 34.7, NAZJATAR },
				{ 65.6, 32.6, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(170188),	-- Barnacled Bag of Goods
			},
		}),
		n(152555, {	-- Elderspawn Nalaada
			["questID"] = 56285,
			["coord"] = { 52.1, 75.4, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(170167),	-- Eel Filet
				i(169359),	-- Spawn of Nalaada (PET!)
			},
		}),
		n(152553, {	-- Garnetscale
			["questID"] = 56273,
			["coords"] = {
				{ 31.6, 35.5, NAZJATAR },
				{ 36.2, 44.9, NAZJATAR },
				{ 36.6, 40.1, NAZJATAR },
				{ 37.1, 47.5, NAZJATAR },
				{ 37.3, 40.3, NAZJATAR },
				{ 39.0, 57.0, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(170180),	-- Razorshell
			},
		}),
		n(152448, {	-- Iridescent Glimmershell
			["description"] = createLocalizationString({
				readable = "This rare shares spawns with |cFFe6b300Glimmershell Hulks|r.",
				constant = "THIS_RARE_SHARES_SPAWNS_WITH",
				export = true,
				text = {
					en = "This rare shares spawns with |cFFe6b300Glimmershell Hulks|r.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "此稀有怪与 |cFFe6b300微光壳蛮兵|r 共享刷新。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56286,
			["coords"] = {
				{ 40.6, 49.0, NAZJATAR },
				{ 42.6, 47.2, NAZJATAR },
				{ 43.6, 54.2, NAZJATAR },
				{ 45.3, 56.2, NAZJATAR },
				{ 45.6, 55.8, NAZJATAR },
				{ 47.0, 51.6, NAZJATAR },
				{ 47.2, 55.4, NAZJATAR },
				{ 49.4, 51.4, NAZJATAR },
				{ 56.1, 56.3, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(169352),	-- Pearlescent Glimmershell (PET!)
			},
		}),
		n(152567, {	-- Kelpwillow
			["questID"] = 56287,
			["coord"] = { 50.2, 69.6, NAZJATAR },
			["crs"] = {
				154725,	-- Muck Slug
			},
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Use a |cFFFFD700Prismatic Crystal|r to charm a |cFFFFD700Muck Slug|r and bring it to Kelpwillow to activate him.",
				constant = "USE_A_CFFFFD700PRISMATIC_CRYSTAL_R_TO_CHARM_A",
				export = true,
				text = {
					en = "Use a |cFFFFD700Prismatic Crystal|r to charm a |cFFFFD700Muck Slug|r and bring it to Kelpwillow to activate him.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "使用 |cFFFFD700棱光水晶|r 魅惑一只 |cFFFFD700淤泥蛞蝓|r，并把它带给海藻柳以激活他。",
					-- TODO: tw = "",
				},
			}),
			["cost"] = { { "i", 167893, 1 } },	-- Prismatic Crystal
			["sym"] = {{"select","itemID",
				170184,	-- Ancient Reefwalker Bark
				170183,	-- Reefwalker Bark
			}},
		}),
		n(152323, {	-- King Gakula
			["description"] = createLocalizationString({
				readable = "Whenever a player shoos a |cFF00991aBloodfin Tadpole|r, it fills an invisible progress bar for Gakula's spawn. He will yell a total of four times, spawning with the last one.\n\nGakula's yells:\n1. |cFFff4040Mgrlgl? Gmrgurgl?|r\n2. |cFFff4040Murrrglurg? Murgglugrg!|r\n3. |cFFff4040Mrrglgl! Murgglagk!|r\n4. |cFFff4040Gak! Mugllglgll Gak!|r",
				constant = "WHENEVER_A_PLAYER_SHOOS_A_CFF00991ABLOODFIN",
				export = true,
				text = {
					en = "Whenever a player shoos a |cFF00991aBloodfin Tadpole|r, it fills an invisible progress bar for Gakula's spawn. He will yell a total of four times, spawning with the last one.\n\nGakula's yells:\n1. |cFFff4040Mgrlgl? Gmrgurgl?|r\n2. |cFFff4040Murrrglurg? Murgglugrg!|r\n3. |cFFff4040Mrrglgl! Murgglagk!|r\n4. |cFFff4040Gak! Mugllglgll Gak!|r",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每当玩家驱赶一只|cFF00991a血鳍蝌蚪|r时，都会为加库拉的刷新填充一个隐藏的进度条。他总共会喊叫四次，并在最后一次时刷新。\n\n加库拉的喊叫：\n1. |cFFff4040Mgrlgl? Gmrgurgl?|r\n2. |cFFff4040Murrrglurg? Murgglugrg!|r\n3. |cFFff4040Mrrglgl! Murgglagk!|r\n4. |cFFff4040Gak! Mugllglgll Gak!|r",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 55671,
			["isDaily"] = true,
			["coord"] = { 28.8, 29.0, NAZJATAR },
			["groups"] = {
				i(170190, {	-- Mardivas' Bag of Containing
					i(169332),	-- Strange Mineralized Water
					i(169334),	-- Strange Oceanic Sediment
					i(169333),	-- Strange Volcanic Rock
				}),
				i(169371),	-- Murgle (PET!)
			},
		}),
		n(152549, {	-- Lost Algan	-- not identified with an Elite/Vignette indicator, but drops very important currency once per day
			["questID"] = 56916,	-- triggered upon looting. can also trigger 55427 and 57082 upon looting. possible separate manapearl + benthic trigger?
			-- 55427 & 56916 = manapearls only
			-- 57082 = benthic only
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Wanders around Nazjatar. This mob doesn't have a vignette star that appears on the map and isn't technically a rare, but has a chance to drop Prismatic Manapearls and Benthic gear.",
				constant = "WANDERS_AROUND_NAZJATAR_THIS_MOB_DOESN_T_HAVE_A",
				export = true,
				text = {
					en = "Wanders around Nazjatar. This mob doesn't have a vignette star that appears on the map and isn't technically a rare, but has a chance to drop Prismatic Manapearls and Benthic gear.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在纳沙塔尔四处游荡。这个怪物没有会出现在地图上的稀有标记星，严格来说也不算稀有，但有机会掉落棱彩魔力珍珠和底栖装备。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				currency(1721),	-- Prismatic Manapearl
			},
		}),
		n(144644, {	-- Mirecrawler
			["questID"] = 56274,
			["coords"] = {
				{ 27.1, 28.3, NAZJATAR },
				{ 36.9, 13.2, NAZJATAR },
				{ 58.2, 26.7, NAZJATAR },
				{ 61.0, 31.7, NAZJATAR },
				{ 62.5, 15.3, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(170172),	-- Brightspine Shell
				i(169366),	-- Wriggler (PET!)
			},
		}),
		n(152465, {	-- Needlespine
			["questID"] = 56275,
			["isDaily"] = true,
			["coords"] = {
				{ 39.6, 28.1, NAZJATAR },
				{ 46.0, 25.2, NAZJATAR },
				{ 47.0, 30.6, NAZJATAR },
				{ 48.7, 26.2, NAZJATAR },
				{ 50.2, 19.1, NAZJATAR },
				{ 56.1, 11.0, NAZJATAR },	-- cave entrance, putting this instead of actual coord because it's very close and kind of hard to find without the entrance
				{ 57.0, 20.8, NAZJATAR },
				{ 70.6, 24.7, NAZJATAR },
			},
			["groups"] = {
				i(169355),	-- Chitterspine Needler (PET!)
				i(170171),	-- Giant Crab Leg
			},
		}),
		n(152397, {	-- Oronu
			["questID"] = 56288,	-- TODO: verify id
			["coord"] = { 78.2, 25.0, NAZJATAR },
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Summon a |cFFFFD700Drowned Hatchling|r battle pet to activate. You can purchase the pet from |cFFFFD700Feylana the Handler|r for 40 Prismatic Manapearls.",
				constant = "SUMMON_A_CFFFFD700DROWNED_HATCHLING_R_BATTLE",
				export = true,
				text = {
					en = "Summon a |cFFFFD700Drowned Hatchling|r battle pet to activate. You can purchase the pet from |cFFFFD700Feylana the Handler|r for 40 Prismatic Manapearls.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "召唤 |cFFFFD700溺亡的雏龙|r 战斗宠物来激活。你可以用 40 个棱彩魔力珍珠向 |cFFFFD700驯养者菲拉娜|r 购买该宠物。",
					-- TODO: tw = "",
				},
			}),
			["sym"] = {{"select","itemID",
				170184,	-- Ancient Reefwalker Bark
				170183,	-- Reefwalker Bark
			}},
		}),
		n(152681, {	-- Prince Typhonus
			["questID"] = 56289,
			["coord"] = { 43.2, 88.0, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(169367),	-- Seafury (PET!)
				i(170193),	-- Sea Totem
			},
		}),
		n(152682, {	-- Prince Vortran
			["questID"] = 56290,
			["coord"] = { 43.0, 75.6, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(169368),	-- Stormwrath (PET!)
			},
		}),
		n(150583, {	-- Rockweed Shambler
			["questID"] = 56291,
			["isDaily"] = true,
			["coords"] = {
				{ 37.6, 39.8, NAZJATAR },
				{ 38.8, 85.4, NAZJATAR },
				{ 45.6, 64.8, NAZJATAR },
				{ 69.5, 33.2, NAZJATAR },
				{ 76.4, 24.4, NAZJATAR },
			},
			["groups"] = {
				i(169374),	-- Budding Algan (PET!)
			},
		}),
		n(151870, {	-- Sandcastle
			["description"] = createLocalizationString({
				readable = "There is a chance for Sandcastle to spawn when you are using a Scrying Stone to find treasures in Nazjatar.",
				constant = "THERE_IS_A_CHANCE_FOR_SANDCASTLE_TO_SPAWN_WHEN",
				export = true,
				text = {
					en = "There is a chance for Sandcastle to spawn when you are using a Scrying Stone to find treasures in Nazjatar.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "当你在纳沙塔尔使用占卜石寻找宝藏时，有几率刷新沙堡。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56276,	-- 57191 and 57192 triggered around the time sandcastle
			["isDaily"] = true,
			["groups"] = {
				i(169369),	-- Sandkeep (PET!)
			},
		}),
		n(152795, {	-- Sandclaw Stoneshell (Verified: Pr3vention)
			["description"] = createLocalizationString({
				readable = "Spawns in numerous places throughout the zone, mostly to the east of the Coral Forest.",
				constant = "SPAWNS_IN_NUMEROUS_PLACES_THROUGHOUT_THE_ZONE",
				export = true,
				text = {
					en = "Spawns in numerous places throughout the zone, mostly to the east of the Coral Forest.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在该区域的许多地点刷新，大多位于珊瑚森林以东。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56277,
			["isDaily"] = true,
			["coords"] = {
				{ 62.4, 39.6, NAZJATAR },
				{ 63.7, 48.3, NAZJATAR },
				{ 64.3, 54.9, NAZJATAR },
				{ 81.2, 39.8, NAZJATAR },
			},
			["groups"] = {
				i(170171),	-- Giant Crab Leg
				i(169350),	-- Glittering Diamondshell (PET!)
			},
		}),
		n(152548, {	-- Scale Matriarch Gratinax
			["description"] = createLocalizationString({
				readable = "All three Scale Matriarchs share a spawn timer.",
				constant = "ALL_THREE_SCALE_MATRIARCHS_SHARE_A_SPAWN_TIMER",
				export = true,
				text = {
					en = "All three Scale Matriarchs share a spawn timer.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "三位鳞片女族长共享同一个刷新计时。",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56292,
			["isDaily"] = true,
			["coord"] = { 35.6, 41.2, NAZJATAR },
			["sym"] = {{"select","itemID",
				170185,	-- Intact Naga Skeleton
			}},
			["groups"] = {
				i(169370),	-- Scalebrood Hydra (PET!)
			},
		}),
		n(152545, {	-- Scale Matriarch Vynara (Verified: Pr3vention)
			["description"] = "~L.ALL_THREE_SCALE_MATRIARCHS_SHARE_A_SPAWN_TIMER",
			["questID"] = 56293,
			["coord"] = { 27.2, 37.1, NAZJATAR },
			["isDaily"] = true,
			["sym"] = {{"select","itemID",
				170185,	-- Intact Naga Skeleton
			}},
			["groups"] = {
				i(169370),	-- Scalebrood Hydra (PET!)
			},
		}),
		n(152542, {	-- Scale Matriarch Zodia
			["description"] = "~L.ALL_THREE_SCALE_MATRIARCHS_SHARE_A_SPAWN_TIMER",
			["questID"] = 56294,
			["coord"] = { 28.6, 46.6, NAZJATAR },
			["isDaily"] = true,
			["sym"] = {{"select","itemID",
				170185,	-- Intact Naga Skeleton
			}},
			["groups"] = {
				i(169370),	-- Scalebrood Hydra (PET!)
			},
		}),
		n(152552, {	-- Shassera
			["description"] = createLocalizationString({
				readable = "The rare flies back and forth above the water at the back of the cave.",
				constant = "THE_RARE_FLIES_BACK_AND_FORTH_ABOVE_THE_WATER",
				export = true,
				text = {
					en = "The rare flies back and forth above the water at the back of the cave.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "这只稀有生物在洞穴后方水面上来回飞行。",
					-- TODO: tw = "",
				},
			}),
			["isDaily"] = true,
			["questID"] = 56295,
			["coord"] = { 63.0, 12.0, NAZJATAR },
			["groups"] = {
				i(170167),	-- Eel Filet
				i(170187),	-- Shadescale (TOY!)
			},
		}),
		n(153658, {	-- Shiz'narasz the Consumer (verified: Pr3vention)
			["questID"] = 56296,
			["isDaily"] = true,
			["coords"] = {
				{ 38.9, 9.40, NAZJATAR },
				{ 41.3, 15.9, NAZJATAR },
			},
			["groups"] = {
				i(170181),	-- Tidal Guard
				i(170182),	-- Voltscale Shield
			},
		}),
		n(152359, {	-- Siltstalker the Packmother
			["questID"] = 56297,
			["coord"] = { 71.6, 54.8, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(170179),	-- Snapdragon Scent Gland
			},
		}),
		n(152290, {	-- Soundless
			["questID"] = 56298,
			["coords"] = {
				{ 54.6, 41.2, NAZJATAR },
				{ 54.6, 50.6, NAZJATAR },
				{ 57.8, 53.2, NAZJATAR },
				{ 59.8, 49.0, NAZJATAR },
				{ 62.6, 59.6, NAZJATAR },
				{ 64.8, 52.0, NAZJATAR },
			},
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "On top of the coral reef. Requires Flying.",
				constant = "ON_TOP_OF_THE_CORAL_REEF_REQUIRES_FLYING",
				export = true,
				text = {
					en = "On top of the coral reef. Requires Flying.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在珊瑚礁顶部。需要飞行。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(169163),	-- Silent Glider (MOUNT!)
				i(170176),	-- Fathom Ray Wing
			},
		}),
		n(153898, {	-- Tidelord Aquatus
			["questID"] = 56122,
			["isDaily"] = true,
			["coord"] = { 62.4, 29.6, NAZJATAR },
			["groups"] = {
				i(170193),	-- Sea Totem
				i(170502),	-- Waterlogged Toolbox
			},
		}),
		n(153928, {	-- Tidelord Dispersius
			["questID"] = 56123,
			["coord"] = { 58.0, 26.5, NAZJATAR },
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Kill the |cFFFFD700Azsh'ari Invoker|r that is channeling an orb above the water pool.",
				constant = "KILL_THE_CFFFFD700AZSH_ARI_INVOKER_R_THAT_IS",
				export = true,
				text = {
					en = "Kill the |cFFFFD700Azsh'ari Invoker|r that is channeling an orb above the water pool.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "击杀正在水池上方引导法球的|cFFFFD700艾萨里祈唤者|r。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(170193),	-- Sea Totem
				i(170502),	-- Waterlogged Toolbox
			},
		}),
		n(154148, {	-- Tidemistress Leth'sindra
			["questID"] = 56106,
			["coord"] = { 65.9, 22.9, NAZJATAR },
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Clusters of purple, void-tinged sacs grow around the area where the rare spawns. Look for ones you can interact with called |cFFFFD700Undisturbed Specimens|r — 5 of these need to be popped to spawn the rare, but they don't all have to be destroyed by one person.",
				constant = "CLUSTERS_OF_PURPLE_VOID_TINGED_SACS_GROW_AROUND",
				export = true,
				text = {
					en = "Clusters of purple, void-tinged sacs grow around the area where the rare spawns. Look for ones you can interact with called |cFFFFD700Undisturbed Specimens|r — 5 of these need to be popped to spawn the rare, but they don't all have to be destroyed by one person.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在稀有怪刷新的区域周围生长着一簇簇紫色、带有虚空气息的囊袋。寻找可以互动、名为|cFFFFD700未受干扰的标本|r的那些——需要打破其中 5 个才能刷新该稀有怪，但它们不必都由同一个人摧毁。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(170196),	-- Shirakess Warning Sign (TOY!)
			},
		}),
		n(152360, {	-- Toxigore the Alpha
			["questID"] = 56278,
			["coords"] = {
				{ 64.8, 46.4, NAZJATAR },
				{ 65.5, 50.4, NAZJATAR },
			},
			["isDaily"] = true,
			["groups"] = {
				i(170178),	-- Alpha Fin
				i(170177),	-- Exposed Fish
			},
		}),
		n(152568, {	-- Urduu
			["questID"] = 56299,	-- triggered 56584 the first time i killed it, 56299 both times i killed it, and 57140 the second time i killed it — slumber
			["coords"] = {
				{ 31.3, 29.4, NAZJATAR },
				{ 30.3, 35.9, NAZJATAR },
			},
			["isDaily"] = true,
			["description"] = createLocalizationString({
				readable = "Kill a |cFFFFD700Staghorn Reefwalker|r on top of Urduu to activate him. |cFFDD3333Before you start kiting make sure any followers are deactivated by right-clicking the buff to dismiss.",
				constant = "KILL_A_CFFFFD700STAGHORN_REEFWALKER_R_ON_TOP_OF",
				export = true,
				text = {
					en = "Kill a |cFFFFD700Staghorn Reefwalker|r on top of Urduu to activate him. |cFFDD3333Before you start kiting make sure any followers are deactivated by right-clicking the buff to dismiss.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在乌尔杜上方击杀一只|cFFFFD700鹿角礁行者|r来激活他。|cFFDD3333开始风筝之前，请确保通过右键点击增益来解散并停用所有追随者。",
					-- TODO: tw = "",
				},
			}),
			["sym"] = {{"select","itemID",
				170184,	-- Ancient Reefwalker Bark
				170183,	-- Reefwalker Bark
			}},
		}),
		n(151719, {	-- Voice in the Deeps
			["description"] = createLocalizationString({
				readable = "When the rare is available, you can see its nameplate while hovering over the rocks inside the small building at the coordinates listed.\n\nWhen you're sure it's up, find a |cFF1EFF00Molted Shell|r on the ground and ride it into the rocks to break them. The rare will immediately attack, so be ready to click off the buff!",
				constant = "WHEN_THE_RARE_IS_AVAILABLE_YOU_CAN_SEE_ITS",
				export = true,
				text = {
					en = "When the rare is available, you can see its nameplate while hovering over the rocks inside the small building at the coordinates listed.\n\nWhen you're sure it's up, find a |cFF1EFF00Molted Shell|r on the ground and ride it into the rocks to break them. The rare will immediately attack, so be ready to click off the buff!",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "当稀有刷新时，在所列坐标处的小建筑内悬停在岩石上即可看到它的姓名板。\n\n当你确定它已刷新后，在地面寻找一个|cFF1EFF00蜕壳|r，骑上它撞向岩石将其击碎。稀有会立刻攻击你，所以要准备好点掉增益！",
					-- TODO: tw = "",
				},
			}),
			["questID"] = 56300,	-- also 56583
			["coord"] = { 67.5, 34.6, NAZJATAR },
			["isDaily"] = true,
			["groups"] = {
				i(170186),	-- Abyss Pearl
			},
		}),
		n(150468, {	-- Vor'koth
			["questID"] = 55603,
			["isDaily"] = true,
			["coord"] = { 48.1, 24.3, NAZJATAR },
			["description"] = createLocalizationString({
				readable = "Throw chum into Eel Infested Waters multiple times. He will spawn after ~8 throws.",
				constant = "THROW_CHUM_INTO_EEL_INFESTED_WATERS_MULTIPLE",
				export = true,
				text = {
					en = "Throw chum into Eel Infested Waters multiple times. He will spawn after ~8 throws.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "多次将诱饵投入鳗鱼横行的水域。大约投掷 8 次后它就会刷新。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(169376),	-- Skittering Eel (PET!)
				i(170181),	-- Tidal Guard
				i(170066),	-- Skinning Technique: Dredged Leather [Rank 2] (RECIPE!)
				i(170067),	-- Skinning Technique: Cragscale [Rank 2] (RECIPE!)
			},
		}),
		n(151166, {	-- Wayward Algan	-- not identified with an Elite/Vignette indicator, but drops very important currency
			["description"] = "~L.WANDERS_AROUND_NAZJATAR_THIS_MOB_DOESN_T_HAVE_A",
			["questID"] = 56915,	-- triggered when looting manapearls; triggered 57083 when looting benthic gear
			["isDaily"] = true,
			["groups"] = {
				currency(1721),	-- Prismatic Manapearl
			},
		}),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.BFA, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	m(NAZJATAR, {
		n(RARES, {
			-- Naga Commanders
			q(56882),	-- Commander Minezra
			q(56895),	-- Incantatrix Vazina
			q(56894),	-- Shadowbinder Athissa
			q(56890),	-- Theurgist Nitara
			q(56893),	-- Warlord Zalzjar
			--
			q(56582),	-- killing King Gakula in Warmode
			q(56601),	-- Banescale the Packfather in Warmode
			q(56884),	-- First time killing Avarius (as miner?)
			q(56883, {["isDaily"]=true}),	-- using Brimstone Pickaxe to start Avarius
			-- q(56885, {["isDaily"]=true}),	-- throwing Chum into the water to summon Vor'koth
			q(56886, {["isDaily"]=true}),	-- after killing Vor'koth after throwing the Chum
			q(56604),	-- Alga the Eyeless first kill
			q(56603),	-- Allseer Oma'kil first kill
			q(56602),	-- Anemonar first kill
			q(56615),	-- Amethyst Spireshell first kill
			q(56614),	-- Blightlight first kill
			q(56887),	-- Carnivorous Lasher first kill
			q(56888),	-- Carnivorous lasher kill
			q(57188),	-- Carnivorous Lasher, Germinating Seafly buff (drops herbs)
			q(57187),	-- Carnivorous Lasher Golden Seafly buff (drops gold)
			q(57186),	-- Carnivorous Lasher, Radiant Seafly buff (drops Azerite)
			q(56600),	-- Caverndark Terror first kill
			q(56613),	-- Chasm Haunter first kill
			q(56612),	-- Daggertooth Terror first kill
			q(56611),	-- Deepglider first kill
			q(56599),	-- Elder Unu first kill
			q(56598),	-- Elderspawn Nalaada first kill
			q(56610),	-- Garnetscale first kill
			q(56597),	-- Iridescent Glimmershell first kill
			q(57260),	-- Iridescent Glimmershell looted with WM on
			q(56596),	-- Kelpwillow first kill
			q(57082),	-- Lost Algan Benthic loot
			q(56609),	-- Mirecrawler first kill
			q(56608),	-- Needlespine first kill
			q(56595),	-- Oronu first kill
			q(56594),	-- Prince Typhonus first kill
			q(56593),	-- Prince Vortran first kill
			-- q(56287),	-- Reefwalker first kill
			q(56592),	-- Rockweed Shambler first kill
			q(56917),	-- Rockweed Shambler additional loot (Benthic/Manapearls)
			q(56606),	-- Sandclaw Stonoeshell first kill
			q(57142),	-- looting Giant Crab Leg + Brinestone Pickaxe from Sandclaw Stoneshell
			q(56591),	-- Scale Matriarch Gratinax first kill
			q(56590),	-- Scale Matriarch Vynara first kill
			q(56589),	-- Scale Matriarch Zodia first kill
			q(56588),	-- Shassera first kill
			q(56587),	-- Shiz'narasz the Consumer first kill
			q(56586),	-- Silstalker the Packmother first kill
			q(56585),	-- Soundless first kill
			q(56619),	-- Tidelord Dispersius first kill
			q(56620),	-- Tidemistress Leth'sindra first kill
			q(56605),	-- Toxigore the Alpha first kill
			q(56584),	-- Urduu first kill
			q(56583),	-- Voice in the Deeps first kill
			q(57083),	-- Wayward Algan Benthic loot
			q(57096),	-- reported as triggering upon snapping a photo to collect Fabious
		}),
	}),
})));
