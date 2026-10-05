-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.DF, {
	header(HEADERS.Spell, 376873, bubbleDownSelf({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {	-- Otto
		["description"] = createLocalizationString({
			readable = "***Debugg Mode enabled is required to see all the steps. Fishing is required for this Secret!***\n\nYou need to buy an Immaculate Bag of Swog Treasures to get the Aquatic Shades, which costs 1 Gold Coin of the Isles. If you're unlucky, this means fishing up a total of 75 Copper Coins of the Isles to trade up!",
			constant = "DEBUGG_MODE_ENABLED_IS_REQUIRED_TO_SEE_ALL_THE_2",
			export = true,
			text = {
				en = "***Debugg Mode enabled is required to see all the steps. Fishing is required for this Secret!***\n\nYou need to buy an Immaculate Bag of Swog Treasures to get the Aquatic Shades, which costs 1 Gold Coin of the Isles. If you're unlucky, this means fishing up a total of 75 Copper Coins of the Isles to trade up!",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "***必须启用调试模式才能看到所有步骤。该秘密需要钓鱼！***\n\n你需要购买一尘不染的斯沃格宝藏袋来获得水栖墨镜，它需要花费 1 枚群岛金币。如果你运气不好，这意味着总共要钓上 75 枚群岛铜币来兑换！",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = .8,
		["displayID"] = 102074,
		["cost"] = { { "i", 202042, 1 } },	-- 1x Aquatic Shades (TOY!)
		["groups"] = {
			hqt(72676, {	-- Step 1: Dance, Dance 'Til You're Dead
				["name"] = "Step 1: Dance, Dance 'Til You're Dead",
				["description"] = createLocalizationString({
					readable = "Head to The Bubble Bath Dive Bar, off the coast of The Waking Shores. While wearing the Aquatic Shades, find an empty dance floor and walk onto it; you'll receive the debuff Dance Dance 'Til You're Dead. Stay on the dance floor until this debuff wears off.",
					constant = "HEAD_TO_THE_BUBBLE_BATH_DIVE_BAR_OFF_THE_COAST",
					export = true,
					text = {
						en = "Head to The Bubble Bath Dive Bar, off the coast of The Waking Shores. While wearing the Aquatic Shades, find an empty dance floor and walk onto it; you'll receive the debuff Dance Dance 'Til You're Dead. Stay on the dance floor until this debuff wears off.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "前往觉醒海岸海岸外的泡泡浴潜水酒吧。戴上水栖墨镜后，找到一块空着的舞池并走上去；你会获得“跳舞跳到死”减益。留在舞池上直到该减益消失。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 19.6, 36.5, THE_WAKING_SHORES },
			}),
			o(385001, {	-- Step 2: Empty Fish Barrel
				["description"] = createLocalizationString({
					readable = "Once you wake up from your dance hangover, loot the Empty Fish Barrel. It's directly in front of you.",
					constant = "ONCE_YOU_WAKE_UP_FROM_YOUR_DANCE_HANGOVER_LOOT",
					export = true,
					text = {
						en = "Once you wake up from your dance hangover, loot the Empty Fish Barrel. It's directly in front of you.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从跳舞宿醉中醒来后，拾取空鱼桶。它就在你正前方。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 72676 },	-- Step 1: Dance, Dance 'Til You're Dead
				["coord"] = { 20.0, 40.0, THE_WAKING_SHORES },
				["groups"] = {
					i(202061),	-- Empty Fish Barrel
				},
			}),
			i(202061, {	-- Step 3: Fill the Barrel
				["name"] = "Step 3: Fill the Barrel",
				["description"] = createLocalizationString({
					readable = "Time to go fishing! You'll need to fill up the barrel with various fish from around The Dragon Isles.",
					constant = "TIME_TO_GO_FISHING_YOU_LL_NEED_TO_FILL_UP_THE",
					export = true,
					text = {
						en = "Time to go fishing! You'll need to fill up the barrel with various fish from around The Dragon Isles.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "钓鱼时间到！你需要用龙群岛各地的各种鱼把木桶装满。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 72676 },	-- Step 1: Dance, Dance 'Til You're Dead
				["requireSkill"] = FISHING,
				["cost"] = { { "i", 202072, 100 } },	-- 100x Frigid Floe Fish
				["groups"] = {
					i(202072, {	-- Frigid Floe Fish
						["description"] = createLocalizationString({
							readable = "You'll need 100 of these fish. They can be found in open waters in the Azure Span. After using them with the barrel, you'll receive a Half-Filled Fish Barrel.",
							constant = "YOU_LL_NEED_100_OF_THESE_FISH_THEY_CAN_BE_FOUND",
							export = true,
							text = {
								en = "You'll need 100 of these fish. They can be found in open waters in the Azure Span. After using them with the barrel, you'll receive a Half-Filled Fish Barrel.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你需要 100 条这种鱼。它们可以在碧蓝林海的开放水域中找到。与木桶一起使用后，你会获得一个半满的鱼桶。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 12.4, 50.0, THE_AZURE_SPAN },
					}),
				},
			}),
			i(202066, {	-- Step 4: Keep Filling the Barrel
				["name"] = "Step 4: Keep Filling the Barrel",
				["description"] = createLocalizationString({
					readable = "Now that your barrel is half full, the fishing gets harder. You're looking for lava fish now.",
					constant = "NOW_THAT_YOUR_BARREL_IS_HALF_FULL_THE_FISHING",
					export = true,
					text = {
						en = "Now that your barrel is half full, the fishing gets harder. You're looking for lava fish now.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "现在你的木桶已经装了一半，钓鱼变得更难了。你现在要找的是熔岩鱼。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 72676 },	-- Step 1: Dance, Dance 'Til You're Dead
				["requireSkill"] = FISHING,
				["cost"] = { { "i", 202073, 25 } },	-- 25x Calamitous Carp
				["groups"] = {
					i(202073, {	-- Calamitous Carp
						["description"] = createLocalizationString({
							readable = "You'll need 25 of these fish. Keep in mind, they're rarer drops, so this will take longer than the Frigid Floe Fish.",
							constant = "YOU_LL_NEED_25_OF_THESE_FISH_KEEP_IN_MIND_THEY",
							export = true,
							text = {
								en = "You'll need 25 of these fish. Keep in mind, they're rarer drops, so this will take longer than the Frigid Floe Fish.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你需要 25 条这种鱼。请记住，它们是比较稀有的掉落，所以这会比极寒浮冰鱼花费更长时间。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 35.8, 64.6, THE_WAKING_SHORES },
					}),
				},
			}),
			hqt(72808, {	-- Step 5: One Last Fish
				["name"] = "Step 5: One Last Fish",
				["description"] = createLocalizationString({
					readable = "Only one fish to go! Top it off with an epic fish from Algeth'ar Academy.",
					constant = "ONLY_ONE_FISH_TO_GO_TOP_IT_OFF_WITH_AN_EPIC",
					export = true,
					text = {
						en = "Only one fish to go! Top it off with an epic fish from Algeth'ar Academy.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "只差一条鱼了！用一条来自艾杰斯亚学院的史诗鱼来凑齐吧。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 72676 },	-- Step 1: Dance, Dance 'Til You're Dead
				["cost"] = { { "i", 202074, 1 } },	-- 1x Kingfin, the Wise Whiskerfish
				["requireSkill"] = FISHING,
				["groups"] = {
					i(202074, {	-- Kingfin, the Wise Whiskerfish
						["description"] = createLocalizationString({
							readable = "Just one! But it'll take a while. Having good Perception on your Profession gear may help.",
							constant = "JUST_ONE_BUT_IT_LL_TAKE_A_WHILE_HAVING_GOOD",
							export = true,
							text = {
								en = "Just one! But it'll take a while. Having good Perception on your Profession gear may help.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "只要一个！但这需要一些时间。专业装备上有较高的感知属性可能会有帮助。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 56.0, 44.5, THALDRASZUS },
					}),
					i(202068),	-- Brimming Fish Barrel
				},
			}),
			i(202069, {	-- Step 6: Back to the Beginning
				["name"] = "Step 6: Back to the Beginning",
				["description"] = createLocalizationString({
					readable = "Head back to where you originally picked up the empty barrel, and place the Overflowing Fish Barrel on the ground.",
					constant = "HEAD_BACK_TO_WHERE_YOU_ORIGINALLY_PICKED_UP_THE",
					export = true,
					text = {
						en = "Head back to where you originally picked up the empty barrel, and place the Overflowing Fish Barrel on the ground.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "回到你最初拾取空桶的地方，把溢出的鱼桶放在地上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 20.0, 40.0, THE_WAKING_SHORES },
			}),
			hqt(72738, {	-- Step 7: The Way to an Otto's Heart
				["name"] = "Step 7: The Way to an Otto's Heart",
				["sourceQuests"] = { 72808 },	-- Step 5: One Last Fish
				["provider"] = { "n", 199563 },	-- Otto
				["coord"] = { 20.0, 40.0, THE_WAKING_SHORES },
				["groups"] = {
					i(198870),	-- Otto (Mount!!)
				},
			}),
		},
	})),
}));
