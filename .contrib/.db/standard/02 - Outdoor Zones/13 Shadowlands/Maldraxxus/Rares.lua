---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(MALDRAXXUS, {
		n(RARES, {
			n(157226, {	-- Pool of Mixed Monstrosities
				["description"] = createLocalizationString({
					readable = "The rare that is summoned is determined by the combination of Miscible Ooze (yellow), Mephitic Goo (blue), and Viscous Oil (red) thrown into the pool.",
					constant = "THE_RARE_THAT_IS_SUMMONED_IS_DETERMINED_BY_THE",
					export = true,
					text = {
						en = "The rare that is summoned is determined by the combination of Miscible Ooze (yellow), Mephitic Goo (blue), and Viscous Oil (red) thrown into the pool.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "被召唤出的稀有生物取决于投入池中的可混合软泥（黄色）、毒气黏液（蓝色）和黏稠油脂（红色）的组合。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 58.6, 74.2, MALDRAXXUS },
				["modelScale"] = 2,
				["groups"] = sharedData({ ["isDaily"] = true }, {
					n(157310, {	-- Boneslurp
						["description"] = createLocalizationString({
							readable = "Requires an equal majority of Blue & Yellow slime.",
							constant = "REQUIRES_AN_EQUAL_MAJORITY_OF_BLUE_YELLOW_SLIME",
							export = true,
							text = {
								en = "Requires an equal majority of Blue & Yellow slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要数量相等且占多数的蓝色与黄色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61722,
						["groups"] = {
							i(184185),	-- Grunge-Caked Collarbone
						},
					}),
					n(157311, {	-- Burnblister
						["description"] = createLocalizationString({
							readable = "Requires an equal majority of Red & Yellow slime.",
							constant = "REQUIRES_AN_EQUAL_MAJORITY_OF_RED_YELLOW_SLIME",
							export = true,
							text = {
								en = "Requires an equal majority of Red & Yellow slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要数量相等且占多数的红色与黄色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61723,
						["groups"] = {
							i(184175),	-- Bone-Blistering Wand
						},
					}),
					n(157308, {	-- Corrupted Sediment
						["description"] = createLocalizationString({
							readable = "Requires a majority of Blue slime.",
							constant = "REQUIRES_A_MAJORITY_OF_BLUE_SLIME",
							export = true,
							text = {
								en = "Requires a majority of Blue slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要多数为蓝色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61719,
						["groups"] = {
							i(184302),	-- Residue-Coated Muck Waders
						},
					}),
					n(157307, {	-- Gelloh
						["description"] = createLocalizationString({
							readable = "Requires a majority of Yellow slime.",
							constant = "REQUIRES_A_MAJORITY_OF_YELLOW_SLIME",
							export = true,
							text = {
								en = "Requires a majority of Yellow slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要多数为黄色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61721,
						["groups"] = {
							i(182287),	-- Eternally Preserved Scarab
							i(183516),	-- Stained Bloodfused Mantle
						},
					}),
					n(157312, {	-- Oily Invertebrate
						["description"] = createLocalizationString({
							readable = "Requires an equal portion of Red, Blue, & Yellow slime.",
							constant = "REQUIRES_AN_EQUAL_PORTION_OF_RED_BLUE_YELLOW",
							export = true,
							text = {
								en = "Requires an equal portion of Red, Blue, & Yellow slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要等量的红色、蓝色和黄色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61724,
						["groups"] = {
							i(184300),	-- Fused Spineguard
							i(181270),	-- Invertebrate Oil (PET!)
							i(184155),	-- Recovered Containment Pack
						},
					}),
					n(157294, {	-- Pulsing Leech
						["description"] = createLocalizationString({
							readable = "Requires a majority of Red slime.",
							constant = "REQUIRES_A_MAJORITY_OF_RED_SLIME",
							export = true,
							text = {
								en = "Requires a majority of Red slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要多数为红色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61718,
						["groups"] = {
							i(184279),	-- Siphoning Blood-Drinker
						},
					}),
					n(157309, {	-- Violet Mistake
						["description"] = createLocalizationString({
							readable = "Requires an equal majority of Red & Blue slime.",
							constant = "REQUIRES_AN_EQUAL_MAJORITY_OF_RED_BLUE_SLIME",
							export = true,
							text = {
								en = "Requires an equal majority of Red & Blue slime.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要数量相等且占多数的红色与蓝色软泥。",
								-- TODO: tw = "",
							},
						}),
						["questID"] = 61720,
						["groups"] = {
							i(182079),	-- Hulking Deathroc (MOUNT!)
							i(184301),	-- Twenty-Loop Violet Girdle
						},
					}),

				}),
			}),
			header(HEADERS.Achievement, 14372, {	-- Theater of Pain
				["description"] = createLocalizationString({
					readable = "These mobs all spawn in the Theater of Pain, a free-for-all arena in the middle of Maldraxxus.",
					constant = "THESE_MOBS_ALL_SPAWN_IN_THE_THEATER_OF_PAIN_A",
					export = true,
					text = {
						en = "These mobs all spawn in the Theater of Pain, a free-for-all arena in the middle of Maldraxxus.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这些怪物都刷新在苦痛剧场，那是玛卓克萨斯中部的一座混战竞技场。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 62786,	-- seems to trigger on first ToP rare killed each day
				["isDaily"] = true,
				["groups"] = {
					n(COMMON_BOSS_DROPS, {
						["crs"] = {
							162873,	-- Azmogal
							162875,	-- Devmorta
							162880,	-- Mistress Dyrax
							168147,	-- Sabriel the Bonecleaver
							162874,	-- Ti'or
							162853,	-- Unbreakable Urtz
							162872,	-- Xantuth the Blighted
						},
						["groups"] = {
							i(184062),	-- Battle-Bound Warhound (MOUNT!)
						},
					}),
					n(162873),	-- Azmogal
					n(162875),	-- Devmorta
					n(162880),	-- Mistress Dyrax
					n(162874),	-- Ti'or
					n(162853),	-- Unbreakable Urtz
					n(162872),	-- Xantuth the Blighted
				},
			}),
		}),
		n(RARES, sharedData({ ["isDaily"] = true }, {
			n(162727, {	-- Bubbleblood
				["coord"] = { 52.2, 35.1, MALDRAXXUS },
				["questID"] = 58870,
				["groups"] = {
					i(184476),	-- Regenerating Slime Vial (TOY!)
					i(184290),	-- Blood-Dyed Bonesaw
					i(184154),	-- Grungy Containment Pack
				},
			}),
			n(159105, {	-- Collector Kash
				["coord"] = { 49.8, 24.6, MALDRAXXUS },
				["questID"] = 58005,
				["groups"] = {
					i(184188),	-- Collector's Corpse Gambrel
					i(183692, {	-- Jagged Bonesaw (CI!)
						["description"] = createLocalizationString({
							readable = "This may drop for any character on your account once the toy 'Acolyte's Guise' has been learned by a Necrolord character.",
							constant = "THIS_MAY_DROP_FOR_ANY_CHARACTER_ON_YOUR_ACCOUNT",
							export = true,
							text = {
								en = "This may drop for any character on your account once the toy 'Acolyte's Guise' has been learned by a Necrolord character.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当一名通灵领主角色学会玩具“侍僧伪装”后，此物品可能为你账号上的任意角色掉落。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(183833),	-- Kash's Bag of Junk
					i(184181),	-- Kash's Favored Hook
					i(184189),	-- Stained Fleshgorer
					i(181797),	-- Strange Cloth
					i(184182),	-- Strengthened Abomination Hook
				},
			}),
			n(157058, {	-- Corspecutter Moroc
				["coord"] = { 26.6, 27.2, MALDRAXXUS },
				["questID"] = 58335,
				["groups"] = {
					i(184177),	-- Grotesque Goring Pick
					i(183833),	-- Kash's Bag of Junk
					i(184176),	-- Moroc's Boneslicing Warglaive
					i(181797),	-- Strange Cloth
				},
			}),
			n(162711, {	-- Deadly Dapperling
				["coord"] = { 76.8, 57.0, MALDRAXXUS },
				["questID"] = 58868,
				["groups"] = {
					i(181263),	-- Shy Melvin (PET!)
					i(184280),	-- Dapper Threads
					i(184224),	-- Dapperling Seeds
					i(POLISHED_PET_CHARM),
				},
			}),
			n(162797, {	-- Deepscar <Pit Hound>
				["coords"] = {
					{ 46.8, 45.6, MALDRAXXUS },
					{ 54.0, 45.6, MALDRAXXUS },
					{ 48.2, 51.6, MALDRAXXUS },
				},
				["questID"] = 58878,
				["groups"] = {
					i(182191),	-- Slobber-Soaked Chew Toy
				},
			}),
			n(162669, {	-- Devour'us
				["coord"] = { 45.6, 28.4, MALDRAXXUS },
				["questID"] = 58835,
				["groups"] = {
					i(184178),	-- Worldrending Claymore
				},
			}),
			n(162588, {	-- Gristlebeak
				["description"] = createLocalizationString({
					readable = "Kill the Unusual Eggs and Gristled Hatchlings to lure Gristlebeak.",
					constant = "KILL_THE_UNUSUAL_EGGS_AND_GRISTLED_HATCHLINGS",
					export = true,
					text = {
						en = "Kill the Unusual Eggs and Gristled Hatchlings to lure Gristlebeak.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀不寻常的蛋和软骨幼雏，以引出软骨喙。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					168258,	-- Gristled Hatchling
					162761,	-- Unusual Egg
				},
				["coord"] = { 57.6, 51.6, MALDRAXXUS },
				["questID"] = 58837,
				["groups"] = {
					i(182196),	-- Arbalest of the Colossal Predator
				},
			}),
			n(161105, {	-- Indomitable Schmitd
				["coord"] = { 39.8, 43.4, MALDRAXXUS },
				["questID"] = 58332,
				["groups"] = {
					i(182192),	-- Knee-Obstructing Legguards
					i(174070),	-- Indomitable Hide
				},
			}),
			n(174108, {	-- Necromantic Anomaly
				["coord"] = { 73.0, 29.2, MALDRAXXUS },
				["questID"] = 62369,
				["groups"] = {
					i(184174),	-- Clasp of Death
					i(181810, {	-- Phylactery of the Dead Conniver
						["customCollect"] = "SL_COV_NEC",	-- Necrolord
					}),
				},
			}),
			n(162690, {	-- Nerissa Heartless
				["coord"] = { 65.8, 36.0, MALDRAXXUS },
				["questID"] = 58851,
				["groups"] = {
					i(182084),	-- Gorespine (MOUNT!)
					i(184179),	-- Lichborn Commander's Boneblade
					i(174076),	-- Necromantic Oil
				},
			}),
			n(162767, {	-- Pesticide
				["coord"] = { 53.8, 61.0, MALDRAXXUS },
				["questID"] = 58875,
				["groups"] = {
					i(182205),	-- Scarab-Shell Faceguard
				},
			}),

			n(159753, {	-- Ravenomous
				["description"] = createLocalizationString({
					readable = "Crush Boneweave Spiderlings in the area for a chance to spawn the rare. After flying around for a little while, it will land and be attackable.",
					constant = "CRUSH_BONEWEAVE_SPIDERLINGS_IN_THE_AREA_FOR_A",
					export = true,
					text = {
						en = "Crush Boneweave Spiderlings in the area for a chance to spawn the rare. After flying around for a little while, it will land and be attackable.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在该区域踩死骨织蜘蛛幼体，有几率刷新该稀有怪物。它会先盘旋一会儿，然后落地并可供攻击。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 54.0, 18.4, MALDRAXXUS },
				["crs"] = { 159901 },	-- Boneweave Spiderling
				["questID"] = 58004,
				["groups"] = {
					i(181283),	-- Foulwing Buzzer (PET!)
					i(184184),	-- Ravenomous's Acid-Tipped Stinger
				},
			}),
			n(158406, {	-- Scunner
				["coord"] = { 62.1, 75.8, MALDRAXXUS },
				["questID"] = 58006,
				["groups"] = {
					i(181267),	-- Writhing Spine (PET!)
					i(183833),	-- Kash's Bag of Junk
					i(184287),	-- Scum-Caked Epaulets
					i(181797),	-- Strange Cloth
				},
			}),
			n(159886, {	-- Sister Chelicerae
				["description"] = createLocalizationString({
					readable = "Destroy the Intricate Webbing and defeat waves of Chelicerae's Children.",
					constant = "DESTROY_THE_INTRICATE_WEBBING_AND_DEFEAT_WAVES",
					export = true,
					text = {
						en = "Destroy the Intricate Webbing and defeat waves of Chelicerae's Children.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "摧毁精巧蛛网，并击败一波波螯肢之嗣。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					159895,	-- Chelicerae's Children
					159885,	-- Intricate Webbing
				},
				["coord"] = { 55.5, 23.6, MALDRAXXUS },
				["questID"] = 58003,
				["groups"] = {
					i(181172),	-- Boneweave Hatchling (PET!)
					i(184289),	-- Spindlefang Spellblade
				},
			}),
			n(162528, {	-- Smorgas the Feaster
				["description"] = createLocalizationString({
					readable = "Click the |cFFFFFFFFBloody Lump|r for a chance to spawn the rare. Clicking the object will aggro all the Peaceful Bloodlice in the area.",
					constant = "CLICK_THE_CFFFFFFFFBLOODY_LUMP_R_FOR_A_CHANCE",
					export = true,
					text = {
						en = "Click the |cFFFFFFFFBloody Lump|r for a chance to spawn the rare. Clicking the object will aggro all the Peaceful Bloodlice in the area.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击|cFFFFFFFF血淋淋的肉块|r有几率刷新该稀有怪。点击该物体将使区域内所有和平的血虱变为敌对。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 42.5, 53.4, MALDRAXXUS },
				["questID"] = 58768,
				["groups"] = {
					i(181265),	-- Corpselouse Larva (PET!)
					i(181266),	-- Feasting Larva (PET!)
					i(184299),	-- Goresoaked Carapace
					i(184038, {	-- Trained Corpselice
						["description"] = createLocalizationString({
							readable = "This will only drop for Necrolords that have built the rank 4 Abomination table.",
							constant = "THIS_WILL_ONLY_DROP_FOR_NECROLORDS_THAT_HAVE",
							export = true,
							text = {
								en = "This will only drop for Necrolords that have built the rank 4 Abomination table.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "它只会对已建造 4 级憎恶台的通灵领主掉落。",
								-- TODO: tw = "",
							},
						}),
						["customCollect"] = "SL_COV_NEC",	-- Necrolord
					}),
				},
			}),
			n(162586, {	-- Tahonta
				["coord"] = { 44.6, 52.0, MALDRAXXUS },
				["questID"] = 58783,
				["description"] = createLocalizationString({
					readable = "You must be a Necrolord & have the Abomination building construct \"Neena\" with you otherwise the |cFFFFFFFFBonehoof Tauralus Mount|r can't drop. It's not required to use the extra action button to loot Tahonta.",
					constant = "YOU_MUST_BE_A_NECROLORD_HAVE_THE_ABOMINATION",
					export = true,
					text = {
						en = "You must be a Necrolord & have the Abomination building construct \"Neena\" with you otherwise the |cFFFFFFFFBonehoof Tauralus Mount|r can't drop. It's not required to use the extra action button to loot Tahonta.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你必须是通灵领主，并带着憎恶建筑构造体“妮娜”，否则|cFFFFFFFF骨蹄塔乌勒斯坐骑|r不会掉落。拾取塔洪塔时不需要使用额外动作按钮。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(182075, {	-- Bonehoof Tauralus (MOUNT!)
						["description"] = createLocalizationString({
							readable = "You must be a Necrolord & have the Abomination building construct \"Neena\" with you for this mount to have a chance of dropping. It's not required to use the extra action button to loot Tahonta.",
							constant = "YOU_MUST_BE_A_NECROLORD_HAVE_THE_ABOMINATION_2",
							export = true,
							text = {
								en = "You must be a Necrolord & have the Abomination building construct \"Neena\" with you for this mount to have a chance of dropping. It's not required to use the extra action button to loot Tahonta.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你必须是通灵领主，并带着憎恶建筑构造体“妮娜”，这只坐骑才有几率掉落。拾取塔洪塔时不需要使用额外动作按钮。",
								-- TODO: tw = "",
							},
						}),
						["customCollect"] = "SL_COV_NEC",	-- Necrolord
					}),
					i(182190),	-- Tauralus Hide Collar
				},
			}),
			n(160059, {	-- Taskmaster Xox <Master Taskmaster>
				["description"] = createLocalizationString({
					readable = "Kill non-rare taskmasters (Bloata, Joyless, and Mortis) and Xox has a chance to spawn in their place.",
					constant = "KILL_NON_RARE_TASKMASTERS_BLOATA_JOYLESS_AND",
					export = true,
					text = {
						en = "Kill non-rare taskmasters (Bloata, Joyless, and Mortis) and Xox has a chance to spawn in their place.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀非稀有的工头（布洛塔、乔伊莱斯和莫蒂斯），克索克斯有几率代替它们刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					160204,	-- Taskmaster Bloata
					160230,	-- Taskmaster Joyless
					160226,	-- Taskmaster Mortis
				},
				["coord"] = { 50.7, 20.1, MALDRAXXUS },
				["questID"] = 58091,
				["groups"] = {
					i(184193),	-- Callus-Forged Hook
					i(184186),	-- Flesh-Fishing Hook
					i(184192),	-- Pristine Alabaster Gorer
					i(184187),	-- Taskmaster's Tenderizer
				},
			}),

			n(162180, {	-- Thread Mistress Leeda
				["description"] = createLocalizationString({
					readable = "Kill the Razorthread Weavers in Leeda's room, and there is a chance that she will spawn in their place.",
					constant = "KILL_THE_RAZORTHREAD_WEAVERS_IN_LEEDA_S_ROOM",
					export = true,
					text = {
						en = "Kill the Razorthread Weavers in Leeda's room, and there is a chance that she will spawn in their place.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀莉达房间里的剃刀丝织网者，她就有几率代替它们刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 162220 },	-- Razorthread Weaver
				["coord"] = { 24.0, 43.1, MALDRAXXUS },
				["questID"] = 58678,
				["groups"] = {
					i(184180),	-- Leeda's Unrefined Mask
				},
			}),
			n(162819, {	-- Warbringer Mal'Korak
				["crs"] = { 162818 },	-- Wartusk
				["coord"] = { 34.4, 79.4, MALDRAXXUS },
				["questID"] = 58889,
				["groups"] = {
					i(182085),	-- Blisterback Bloodtusk (MOUNT!)
					i(184288),	-- Ruthless Warlord's Barrier
				},
			}),
			n(157125, {	-- Zargox the Reborn
				["description"] = createLocalizationString({
					readable = "Get an |cFFFFFFFFAni-Matter Orb|r from Synder Sixfold at |cFFFFFFFF26.3, 42.7|r (either while doing the weekly quest |cFF349cffAni-Matter Animator|r, or speak to Synder afterward to get another orb from him). Use it to reanimate soldiers near the rare's spawnpoint until a yellow dot appears on your minimap, indicating that Zargox is available to summon.",
					constant = "GET_AN_CFFFFFFFFANI_MATTER_ORB_R_FROM_SYNDER",
					export = true,
					text = {
						en = "Get an |cFFFFFFFFAni-Matter Orb|r from Synder Sixfold at |cFFFFFFFF26.3, 42.7|r (either while doing the weekly quest |cFF349cffAni-Matter Animator|r, or speak to Synder afterward to get another orb from him). Use it to reanimate soldiers near the rare's spawnpoint until a yellow dot appears on your minimap, indicating that Zargox is available to summon.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从位于|cFFFFFFFF26.3, 42.7|r的辛德·六倍处获得一个|cFFFFFFFF反物质宝珠|r（可以在完成周常任务|cFF349cff反物质活化者|r时获得，也可以之后与他交谈再拿一个宝珠）。用它复活稀有怪刷新点附近的士兵，直到你的小地图上出现一个黄点，表示扎尔戈克斯可以被召唤了。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 157124 },	-- Bone Mass
				["coord"] = { 29.0, 51.6, MALDRAXXUS },
				["questID"] = 59290,
				["groups"] = {
					i(183690, {	-- Ashen Ink (CI!)
						["description"] = "~L.THIS_MAY_DROP_FOR_ANY_CHARACTER_ON_YOUR_ACCOUNT",
					}),
					i(184285),	-- Boneclutched Shackles
					i(181804, {	-- Trophy of the Reborn Bonelord
						["customCollect"] = { "SL_COV_NEC" },	-- Necrolord
					}),
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(SHADOWLANDS, {
		m(MALDRAXXUS, {
			n(RARES, {
				q(62805),	-- Pulsing Leech secondary quest
				q(61989),	-- Deadly Dapperling secondary quest
				q(61987),	-- Deepscar secondary kill
				q(61991),	-- Gristlebeak secondary kill
				q(61988),	-- Indomitable Schmitd secondary quest
				q(61992),	-- Pesticide secondary quest
				q(61986),	-- Tahonta secondary quest
			}),
		}),
	}),
})));
