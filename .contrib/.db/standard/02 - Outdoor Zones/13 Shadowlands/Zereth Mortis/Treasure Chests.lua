---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_2_0 } }, {
	m(ZERETH_MORTIS, {
		n(TREASURES, {
			i(189707, {	-- Pocopoc's Bronze and Gold Body
				["questID"] = 65471,
			}),
			i(189708, {	-- Pocopoc's Beryllium and Silver Body
				["questID"] = 65472,
			}),
			i(189712, {	-- Pocopoc's Silver and Beryllium Components
				["questID"] = 65477,
			}),
			o(375408, {	-- Architect's Reserve
				["description"] = createLocalizationString({
					readable = "Only available after unlocking Protoform Synthesis: Mount.",
					constant = "ONLY_AVAILABLE_AFTER_UNLOCKING_PROTOFORM",
					export = true,
					text = {
						en = "Only available after unlocking Protoform Synthesis: Mount.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在解锁原生体合成：坐骑后可用。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 61.2, 37.2, ZERETH_MORTIS },
				["questID"] = 65520,
				["sourceQuest"] = 65427,	-- A New Architect
				["groups"] = {
					i(187833, {	-- Dapper Pocopoc
						["questID"] = 65528,
					}),
				},
			}),
			o(375496, {	-- Bushel of Progenitor Produce
				["description"] = createLocalizationString({
					readable = "Kill Nascent Servitor(182368) until you have 5 buffs then you can open the door.",
					constant = "KILL_NASCENT_SERVITOR_182368_UNTIL_YOU_HAVE_5",
					export = true,
					text = {
						en = "Kill Nascent Servitor(182368) until you have 5 buffs then you can open the door.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀初生的仆从(182368)直到你拥有 5 层增益，然后你就可以打开那扇门。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 47.5, 95.2, ZERETH_MORTIS },
				["questID"] = 65573,
				["groups"] = {
					i(190853),	-- Bushel of Mysterious Fruit (TOY!)
					i(189451, {	-- Chef Pocopoc
						["questID"] = 65524,
					}),
				},
			}),
			o(375188, {	-- Camber Alcove Arrangement
				["description"] = createLocalizationString({
					readable = "Requires Sopranian Understanding and Chapter 6.",
					constant = "REQUIRES_SOPRANIAN_UNDERSTANDING_AND_CHAPTER_6_2",
					export = true,
					text = {
						en = "Requires Sopranian Understanding and Chapter 6.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要索普拉尼之悟和第六章。",
						-- TODO: tw = "",
					},
				}),
				["coord"] =	{ 47.68, 34.48, ZERETH_MORTIS },
				["questID"] = 65343,
				["sym"] = {{"select","objectID",375746}},	-- Protoform Schematic
			}),
			o(375382, {	-- Crushed Supply Crate
				["description"] = createLocalizationString({
					readable = "To open it you need to pick up a Jiro Hammer(189768). Ontop of the rock there is a repair tool that you can use to trade with the nearby Jiros(Hiu Fi 185151) for a Jiro Hammer.",
					constant = "TO_OPEN_IT_YOU_NEED_TO_PICK_UP_A_JIRO_HAMMER",
					export = true,
					text = {
						en = "To open it you need to pick up a Jiro Hammer(189768). Ontop of the rock there is a repair tool that you can use to trade with the nearby Jiros(Hiu Fi 185151) for a Jiro Hammer.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要打开它，你需要拾取一把吉罗锤（189768）。岩石上方有一个修理工具，你可以用它向附近的吉罗族 Hiu Fi（185151）换取一把吉罗锤。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 56.8, 64.2, ZERETH_MORTIS },
				["questID"] = 65489,
			}),
			o(370140, {	-- Damaged Jiro Stash
				["description"] = createLocalizationString({
					readable = "Jumping puzzle.",
					constant = "JUMPING_PUZZLE",
					export = true,
					text = {
						en = "Jumping puzzle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 38.2, 37.2, ZERETH_MORTIS },
				["questID"] = 64667,
				["groups"] = {
					i(190637),	-- Percussive Maintenance Instrument
				},
			}),
			o(375354, {	-- Domination Cache
				["description"] = createLocalizationString({
					readable = "The mob Mawsworn Inquisitor has a 1-2% drop chance for the key.",
					constant = "THE_MOB_MAWSWORN_INQUISITOR_HAS_A_1_2_DROP",
					export = true,
					text = {
						en = "The mob Mawsworn Inquisitor has a 1-2% drop chance for the key.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "怪物渊誓审判官掉落这把钥匙的几率为 1-2%。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 60.0, 18.0, ZERETH_MORTIS },
				["questID"] = 65465,
				["cost"] = { { "i", 189704, 1 } },	-- 1x Dominance Key
				["groups"] = {
					i(189863),	-- Spatial Opener
					i(190638),	-- Tormented Mawsteel Greatsword
				},
			}),
			o(375191, {	-- Dormant Alcove Arrangement
				["description"] = createLocalizationString({
					readable = "Requires Altonian Understanding and Chapter 6. Accessible with flying or via the Quintus Locus and dropping down.",
					constant = "REQUIRES_ALTONIAN_UNDERSTANDING_AND_CHAPTER_6",
					export = true,
					text = {
						en = "Requires Altonian Understanding and Chapter 6. Accessible with flying or via the Quintus Locus and dropping down.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要阿尔托尼安理解和第 6 章。可以通过飞行抵达，或经由昆图斯节点跳下抵达。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 51.03, 32.48, ZERETH_MORTIS },
				["questID"] = 65346,
				["groups"] = sharedData({
					["sourceQuest"] = 65346,	-- Dormant Alcove Arrangement
					["cost"] = { { "i", 189863, 1 } },	-- 1x Spatial Opener
					["sharedDescription"] = "Gather 60 Cosmic energy and go to Interior Locus then use Arcae Locus.",
					["crs"] = {
						184329,	-- Locus Shift (Gravid Repose)
						184485,	-- Locus Shift (Interior)
					},
				},{
					-- Sands
					o(375397, {	-- Glinting Sand Pile
						["coord"] = { 45.1, 36.0, 2029 },	-- Gravid Repose
						["questID"] = 65495,
					}),
					o(375399, {	-- Humming Sand Pile
						["coord"] = { 44.3, 36.7, 2029 },	-- Gravid Repose
						["questID"] = 65497,
					}),
					o(375396, {	-- Lumpy Sand Pile
						["coord"] = { 44.8, 36.9, 2029 },	-- Gravid Repose
						["questID"] = 65494,
					}),
					o(375400, {	-- Misshapen Sand Pile
						["coord"] = { 44.6, 35.7, 2029 },	-- Gravid Repose
						["questID"] = 65498,
					}),
					o(375398, {	-- Shifting Sand Pile
						["coord"] = { 43.7, 37.1, 2029 },	-- Gravid Repose
						["questID"] = 65496,
					}),
					o(375401, {	-- Sparkling Sand Pile
						["coord"] = { 43.9, 36.5, 2029 },	-- Gravid Repose
						["questID"] = 65499,
						["groups"] = {
							i(190374),	-- Gemstone of Prismatic Brilliance
						},
					}),
					o(375402, {	-- Ticking Sand Pile
						["coord"] = { 43.8, 37.6, 2029 },	-- Gravid Repose
						["questID"] = 65500,
					}),
				}),
			}),
			o(375413, {	-- Drowned Broker Supplies
				["description"] = createLocalizationString({
					readable = "Need to have completed Dealic Understanding. At 34.5, 70.5 there is a Coreless Aurelid(185282), use Popopoc to on it to get the chest.",
					constant = "NEED_TO_HAVE_COMPLETED_DEALIC_UNDERSTANDING_AT",
					export = true,
					text = {
						en = "Need to have completed Dealic Understanding. At 34.5, 70.5 there is a Coreless Aurelid(185282), use Popopoc to on it to get the chest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要完成迪力克的理解。在 34.5, 70.5 处有一只无心伞翼虫(185282)，对它使用波波波克即可获得宝箱。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 34.8, 69.9, ZERETH_MORTIS },
				["questID"] = 65523,
				["groups"] = {
					i(190059, {	-- Pirate Pocopoc
						["questID"] = 65526,
					}),
				},
			}),
			o(375376, {	-- Fallen Vault
				["description"] = createLocalizationString({
					readable = "Use the Fogotten Translocator nearby to teleport up.",
					constant = "USE_THE_FOGOTTEN_TRANSLOCATOR_NEARBY_TO",
					export = true,
					text = {
						en = "Use the Fogotten Translocator nearby to teleport up.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用附近的被遗忘的传送器传送上去。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 51.6, 9.9, ZERETH_MORTIS },
				["questID"] = 65487,
				["groups"] = {
					i(189863),	-- Spatial Opener
				},
			}),
			o(375405, {	-- Filched Artifact
				["description"] = createLocalizationString({
					readable = "Jumping Puzzle, ontop of the tree ring.",
					constant = "JUMPING_PUZZLE_ONTOP_OF_THE_TREE_RING",
					export = true,
					text = {
						en = "Jumping Puzzle, ontop of the tree ring.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题，在环形树的顶部。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 49.8, 87.3, ZERETH_MORTIS },
				["questID"] = 65503,
				["groups"] = {
					i(189863),	-- Spatial Opener
				},
			}),
			o(373561, {	-- Forgotten Proto-Vault
				["description"] = createLocalizationString({
					readable = "This chest only spawn during WQ Frog'it (65089).",
					constant = "THIS_CHEST_ONLY_SPAWN_DURING_WQ_FROG_IT_65089",
					export = true,
					text = {
						en = "This chest only spawn during WQ Frog'it (65089).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此宝箱只在世界任务弗罗吉特（65089）期间刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 67.0, 69.4, ZERETH_MORTIS },
				["questID"] = 65178,
				["groups"] = {
					i(189469),	-- Schematic: Prototype Leaper
				},
			}),
			o(375192, {	-- Fulgore Alcove Arrangement
				["description"] = createLocalizationString({
					readable = "Requires Aealic Understanding and Chapter 6.",
					constant = "REQUIRES_AEALIC_UNDERSTANDING_AND_CHAPTER_6_2",
					export = true,
					text = {
						en = "Requires Aealic Understanding and Chapter 6.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要埃阿利克理解和第 6 章。",
						-- TODO: tw = "",
					},
				}),
				["coord"] =	{ 47.85, 30.38, ZERETH_MORTIS },
				["questID"] = 65347,
				["groups"] = {
					o(375902, {	-- Torn Ethereal Drape
						["description"] = createLocalizationString({
							readable = "Gather 60 Cosmic energy and go to Interior Locus then use Arcae Locus. Take out Pocopoc, activate & ride an orb until it reaches the treasure.",
							constant = "GATHER_60_COSMIC_ENERGY_AND_GO_TO_INTERIOR",
							export = true,
							text = {
								en = "Gather 60 Cosmic energy and go to Interior Locus then use Arcae Locus. Take out Pocopoc, activate & ride an orb until it reaches the treasure.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "收集 60 点宇宙能量，前往内部核心，然后使用秘古核心。放出波可波可，激活并骑乘一颗宝珠，直到它抵达宝藏。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 46.7, 39.3, 2029 },	-- Gravid Repose
						["questID"] = 65643,
						["sourceQuest"] = 65347,	-- Fulgore Alcove Arrangement
						["crs"] = {
							184329,	-- Locus Shift (Gravid Repose)
							184485,	-- Locus Shift (Interior)
						},
						["groups"] = {
							i(188054),	-- Antecedent Drape
						},
					}),
				},
			}),
			o(375369, {	-- Gnawed Valise
				["description"] = createLocalizationString({
					readable = "Jumping Puzzle, Start on the top of the nearby vault. On the big rock.",
					constant = "JUMPING_PUZZLE_START_ON_THE_TOP_OF_THE_NEARBY",
					export = true,
					text = {
						en = "Jumping Puzzle, Start on the top of the nearby vault. On the big rock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题，从附近宝库的顶部开始。就在那块大岩石上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 39.0, 73.2, ZERETH_MORTIS },
				["questID"] = 65480,
			}),
			o(375484, {	-- Grateful Boon
				["description"] = createLocalizationString({
					readable = "Pet all the creatures in the area. The creature will sit down after being petted. The Jiro will yell when you are done.",
					constant = "PET_ALL_THE_CREATURES_IN_THE_AREA_THE_CREATURE",
					export = true,
					text = {
						en = "Pet all the creatures in the area. The creature will sit down after being petted. The Jiro will yell when you are done.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "抚摸该区域内的所有生物。被抚摸后它们会坐下。全部完成后基罗会喊话。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 37.2, 78.2, ZERETH_MORTIS },
				["questID"] = 65545,
				["groups"] = {
					i(189478),	-- Schematic: Adorned Vombata
				},
			}),
			o(373543, {	-- Library Vault
				["description"] = createLocalizationString({
					readable = "There are tablets around the Cave. The correct one is located in the back at 57.9 78.9.",
					constant = "THERE_ARE_TABLETS_AROUND_THE_CAVE_THE_CORRECT",
					export = true,
					text = {
						en = "There are tablets around the Cave. The correct one is located in the back at 57.9 78.9.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "洞穴周围有几块石板。正确的那块位于最里面，坐标 57.9 78.9。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 58.9, 77.0, ZERETH_MORTIS },
				["questID"] = 65173,
				["groups"] = {
					i(189447),	-- Schematic: Viperid Menace
				},
			}),
			o(375272, {	-- Mawsworn Cache
				["coord"] = { 60.6, 30.8, ZERETH_MORTIS },
				["questID"] = 65441,
			}),
			o(375411, {	-- Mistaken Ovoid
				["description"] = createLocalizationString({
					readable = "Inside the cave. Need to collect 5xLost Ovoids around Zereth Mortis.",
					constant = "INSIDE_THE_CAVE_NEED_TO_COLLECT_5XLOST_OVOIDS",
					export = true,
					text = {
						en = "Inside the cave. Need to collect 5xLost Ovoids around Zereth Mortis.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴内。需要在扎雷殁提斯各处收集 5 个失落的卵形物。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 53.6, 72.2, ZERETH_MORTIS },
				["questID"] = 65522,
				["cost"] = { { "i", 190239, 5 } },	-- 5x Lost Ovoid
				["groups"] = {
					i(189435),	-- Schematic: Multichicken
				},
			}),
			o(375422, {	-- Overgrown Protofruit
				["description"] = createLocalizationString({
					readable = "Jump from the ledge above the flight path to the rock.",
					constant = "JUMP_FROM_THE_LEDGE_ABOVE_THE_FLIGHT_PATH_TO",
					export = true,
					text = {
						en = "Jump from the ledge above the flight path to the rock.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从飞行点上方平台跳到岩石上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 35.2, 44.1, ZERETH_MORTIS },
				["questID"] = 65536,
				["groups"] = {
					i(190953),	-- Protofruit Flesh
				},
			}),
			o(375423, {	-- Offering to the First Ones
				["coord"] = { 34.8, 56.1, ZERETH_MORTIS },
				["questID"] = 65537,
				["groups"] = {
					i(190339),	-- Enlightened Offering
				},
			}),
			o(375481, {	-- Pilfered Curio
				["description"] = createLocalizationString({
					readable = "You need flying/teleport to get here, ontop of the pillar.",
					constant = "YOU_NEED_FLYING_TELEPORT_TO_GET_HERE_ONTOP_OF",
					export = true,
					text = {
						en = "You need flying/teleport to get here, ontop of the pillar.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你需要飞行或传送才能到达这里，就在柱子的顶端。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 60.8, 42.9, ZERETH_MORTIS },
				["questID"] = 65542,
				["groups"] = {
					i(190098, {	-- Pepepec
						["questID"] = 65538,
					}),
				},
			}),
			o(375485, {	-- Protoflora Harvester
				["description"] = createLocalizationString({
					readable = "Jumping Puzzle. Go around to get ontop of the rock behind the treasure and jump down.",
					constant = "JUMPING_PUZZLE_GO_AROUND_TO_GET_ONTOP_OF_THE",
					export = true,
					text = {
						en = "Jumping Puzzle. Go around to get ontop of the rock behind the treasure and jump down.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题。绕过去爬到宝藏后方的岩石顶部，然后跳下来。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.8, 71.4, ZERETH_MORTIS },
				["questID"] = 65546,
				["groups"] = {
					i(190952),	-- Protoflora Harvester
				},
			}),
			o(375478, {	-- Protomineral Extractor
				["description"] = createLocalizationString({
					readable = "Use the cosmic system to get to the top and use some form of glide/teleport/flying.",
					constant = "USE_THE_COSMIC_SYSTEM_TO_GET_TO_THE_TOP_AND_USE",
					export = true,
					text = {
						en = "Use the cosmic system to get to the top and use some form of glide/teleport/flying.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用宇宙系统到达顶部，并使用某种滑翔/传送/飞行手段。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 46.6, 31.0, ZERETH_MORTIS },
				["questID"] = 65540,
				["groups"] = {
					i(190942),	-- Protomineral Extractor
				},
			}),
			o(375189, {	-- Repertory Alcove Arrangement
				["description"] = createLocalizationString({
					readable = "Requires Aealic Understanding and Chapter 6. Inside the Terrestrial Cache cave, on the side of the left wall after you enter.",
					constant = "REQUIRES_AEALIC_UNDERSTANDING_AND_CHAPTER_6_3",
					export = true,
					text = {
						en = "Requires Aealic Understanding and Chapter 6. Inside the Terrestrial Cache cave, on the side of the left wall after you enter.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要埃阿利克理解和第 6 章。在大地宝库洞穴内，进入后左侧墙壁上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] =	{ 49.62, 30.92, ZERETH_MORTIS },
				["questID"] = 65344,
				["groups"] = {
					n(185261, {	-- Requisites Originator
						["description"] = createLocalizationString({
							readable = "Gather 60 Cosmic energy and go to Interior Locus then use Repertory Locus.",
							constant = "GATHER_60_COSMIC_ENERGY_AND_GO_TO_INTERIOR_2",
							export = true,
							text = {
								en = "Gather 60 Cosmic energy and go to Interior Locus then use Repertory Locus.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "收集 60 点宇宙能量，前往内部核心，然后使用藏品核心。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 65344 },	-- Repertory Alcove Arrangement
						["crs"] = {
							184329,	-- Locus Shift (Gravid Repose)
							184485,	-- Locus Shift (Interior)
						},
						["coord"] = { 31.3, 65.0, 2029 },	-- Gravid Repose
						["questID"] = 65532,	-- Fourth Option?
						["isWeekly"] = true,
						["groups"] = {
							i(189179, {	-- Unalloyed Bronze Ingot
								["description"] = createLocalizationString({
									readable = "Select 4th option, 'Restore Genesis Potencies'.",
									constant = "SELECT_4TH_OPTION_RESTORE_GENESIS_POTENCIES",
									export = true,
									text = {
										en = "Select 4th option, 'Restore Genesis Potencies'.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "选择第 4 个选项“恢复创世潜能”。",
										-- TODO: tw = "",
									},
								}),
							}),
						},
					}),
				},
			}),
			o(375493, {	-- Ripened Protopear
				["description"] = createLocalizationString({
					readable = "Available inside the Blooming Foundary (63.2, 73.1) during Glimmercanes Questline (Need Sopranian Understanding). You need to collect 5 Pollen Cloud buffs (Green Clouds).",
					constant = "AVAILABLE_INSIDE_THE_BLOOMING_FOUNDARY_63_2_73",
					export = true,
					text = {
						en = "Available inside the Blooming Foundary (63.2, 73.1) during Glimmercanes Questline (Need Sopranian Understanding). You need to collect 5 Pollen Cloud buffs (Green Clouds).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可在微光藤任务线期间于繁花铸造厂内（63.2，73.1）获得（需要索普拉尼安的理解）。你需要收集 5 层花粉云增益（绿色云朵）。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 65.4, 47.1, 2027 },
				["questID"] = 65566,
				["groups"] = {
					i(190058, {	-- Peaceful Pocopoc
						["questID"] = 65525,
					}),
				},
			}),
			o(375190, {	-- Rondure Alcove Arrangement
				["description"] = createLocalizationString({
					readable = "Requires Aealic Understanding and Chapter 6.\nLeft of an upwards stone ramp, in a small alcove.",
					constant = "REQUIRES_AEALIC_UNDERSTANDING_AND_CHAPTER_6_4",
					export = true,
					text = {
						en = "Requires Aealic Understanding and Chapter 6.\nLeft of an upwards stone ramp, in a small alcove.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要埃阿利克理解和第 6 章。\n在一段向上的石制坡道左侧的一个小壁龛中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] =	{ 50.46, 27.61, ZERETH_MORTIS },
				["questID"] = 65345,
				["sym"] = {{"select","objectID",375270}},	-- Protoform Schematic
				["groups"] = {
					o(375494, {	-- Rondure Cache
						["coord"] = { 43.0, 40.0, 2029 },	-- Gravid Repose
						["sourceQuest"] = 65345,	-- Rondure Alcove Arrangement
						["questID"] = 65567,
						["isDaily"] = true,
						["sym"] = {{"select","itemID",190096}},	-- Pocobold
					}),
				},
			}),
			o(375281, {	-- Stolen Relic
				["description"] = createLocalizationString({
					readable = "Jumping Puzzle.",
					constant = "JUMPING_PUZZLE_2",
					export = true,
					text = {
						en = "Jumping Puzzle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 37.9, 65.2, ZERETH_MORTIS },
				["questID"] = 65447,
			}),
			o(375483, {	-- Stolen Scroll
				["description"] = createLocalizationString({
					readable = "Jumping Puzzle, climb ontop of the slumbering vault in Haven.",
					constant = "JUMPING_PUZZLE_CLIMB_ONTOP_OF_THE_SLUMBERING",
					export = true,
					text = {
						en = "Jumping Puzzle, climb ontop of the slumbering vault in Haven.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "跳跃谜题，爬上避风港中沉眠宝库的顶部。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 34.0, 67.6, ZERETH_MORTIS },
				["questID"] = 65543,
				["groups"] = {
					i(189863),	-- Spatial Opener
					i(190941),	-- Teachings of the Elders
				},
			}),
			o(369757, {	-- Submerged Chest
				["description"] = createLocalizationString({
					readable = "Bring Orb at 59,4, 76,8 to the pump.",
					constant = "BRING_ORB_AT_59_4_76_8_TO_THE_PUMP",
					export = true,
					text = {
						en = "Bring Orb at 59,4, 76,8 to the pump.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "把 59,4、76,8 处的宝珠带到水泵处。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 58.8, 73.1, ZERETH_MORTIS },
				["questID"] = 64545,
				["groups"] = {
					i(190061, {	-- Admiral Pocopoc
						["questID"] = 65529,
					}),
					i(189863),	-- Spatial Opener
				},
			}),
			o(374976, {	-- Symphonic Vault
				["description"] = createLocalizationString({
					readable = "The Broken Automa next to chest will give you sound queues, press the remaning 4 Broken Consonoles in the correct order. With your back against the entrance:\nTOP RIGHT\nDOWN LEFT\nDOWN RIGHT\nTOP LEFT.",
					constant = "THE_BROKEN_AUTOMA_NEXT_TO_CHEST_WILL_GIVE_YOU",
					export = true,
					text = {
						en = "The Broken Automa next to chest will give you sound queues, press the remaning 4 Broken Consonoles in the correct order. With your back against the entrance:\nTOP RIGHT\nDOWN LEFT\nDOWN RIGHT\nTOP LEFT.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "宝箱旁破碎的自动体会计时发声，按正确顺序按下剩余 4 个破碎辅音柱。背对入口时：\n右上\n左下\n右下\n左上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.7, 63.0, ZERETH_MORTIS },
				["questID"] = 65270,
				["groups"] = {
					i(189863),	-- Spatial Opener
				},
			}),
			o(375492, {	-- Syntactic Vault
				["description"] = createLocalizationString({
					readable = "Inside a cave. Now you need to touch 6 glowing things on columns with symbols all over the island. Each action give buff. Need to stack 6 (touch same amount of pylons) times and then touch glowing thing. Coords:\n77.0, 58.9\n77.0, 60.3\n78.1, 53.3\n76.8, 46.6\n81.2, 50.4\n80.9, 56.2",
					constant = "INSIDE_A_CAVE_NOW_YOU_NEED_TO_TOUCH_6_GLOWING",
					export = true,
					text = {
						en = "Inside a cave. Now you need to touch 6 glowing things on columns with symbols all over the island. Each action give buff. Need to stack 6 (touch same amount of pylons) times and then touch glowing thing. Coords:\n77.0, 58.9\n77.0, 60.3\n78.1, 53.3\n76.8, 46.6\n81.2, 50.4\n80.9, 56.2",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在一个洞穴内。现在你需要触摸岛上各处带有符号的柱子上的 6 个发光物体。每次操作都会给予增益。需要叠加 6 次（触摸相同数量的能量塔）然后触摸发光物体。坐标：\n77.0, 58.9\n77.0, 60.3\n78.1, 53.3\n76.8, 46.6\n81.2, 50.4\n80.9, 56.2",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 77.5, 58.2, ZERETH_MORTIS },
					{ 77.0, 58.9, ZERETH_MORTIS },
					{ 77.0, 60.3, ZERETH_MORTIS },
					{ 78.1, 53.3, ZERETH_MORTIS },
					{ 76.8, 46.6, ZERETH_MORTIS },
					{ 81.2, 50.4, ZERETH_MORTIS },
					{ 80.9, 56.2, ZERETH_MORTIS },
				},
				["questID"] = 65565,
				["groups"] = {
					i(190457),	-- Protopological Cube (TOY!)
				},
			}),
			o(373548, {	-- Template Archive
				["description"] = createLocalizationString({
					readable = "Found inside of Nexus of Actualization. Push Orb in the room before",
					constant = "FOUND_INSIDE_OF_NEXUS_OF_ACTUALIZATION_PUSH_ORB",
					export = true,
					text = {
						en = "Found inside of Nexus of Actualization. Push Orb in the room before",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于实现枢纽内。在之前的房间推动宝珠",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 51.6, 86.6, ZERETH_MORTIS },
				["questID"] = 65175,
				["groups"] = {
					i(190060, {	-- Adventurous Pocopoc
						["questID"] = 65527,
					}),
				},
			}),
			o(375495, {	-- Undulating Foliage
				["description"] = createLocalizationString({
					readable = "There is four runes that needs to be activated to activate the teleporter.",
					constant = "THERE_IS_FOUR_RUNES_THAT_NEEDS_TO_BE_ACTIVATED",
					export = true,
					text = {
						en = "There is four runes that needs to be activated to activate the teleporter.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "共有四个符文需要激活，才能启动传送器。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.0, 80.0, ZERETH_MORTIS },
				["questID"] = 65572,
				["groups"] = {
					n(185390, {	-- Teleporter Lock
						["coord"] = { 51.0, 82.1, ZERETH_MORTIS },
						["questID"] = 65589,
					}),
					n(185391, {	-- Teleporter Lock
						["coord"] = { 52.5, 83.4, ZERETH_MORTIS },
						["questID"] = 65590,
					}),
					n(185392, {	-- Teleporter Lock
						["coord"] = { 53.2, 80.9, ZERETH_MORTIS },
						["questID"] = 65591,
					}),
					n(185393, {	-- Teleporter Lock
						["description"] = createLocalizationString({
							readable = "This lock is outside of the Wards, next to the console that opens the door.",
							constant = "THIS_LOCK_IS_OUTSIDE_OF_THE_WARDS_NEXT_TO_THE",
							export = true,
							text = {
								en = "This lock is outside of the Wards, next to the console that opens the door.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "这个锁位于结界之外，就在开门的控制台旁边。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 50.0, 76.2, ZERETH_MORTIS },
						["questID"] = 65592,
					}),
					i(189863),	-- Spatial Opener
					i(190926),	-- Infested Automa Core (TOY!)
				},
			}),
		}),
		n(TREASURES, sharedData({ ["repeatable"] = true }, {
			o(375362, {	-- Avian Nest
				["coords"] = {
					{ 40.5, 56.6, ZERETH_MORTIS },
					{ 40.6, 59.7, ZERETH_MORTIS },
					{ 51.1, 64.5, ZERETH_MORTIS },
					{ 54.5, 58.8, ZERETH_MORTIS },
					{ 54.8, 58.3, ZERETH_MORTIS },
					{ 48.2, 66.5, ZERETH_MORTIS },
					{ 48.2, 42.8, ZERETH_MORTIS },
					{ 48.4, 59.5, ZERETH_MORTIS },
					{ 66.0, 42.8, ZERETH_MORTIS },
					{ 68.5, 36.1, ZERETH_MORTIS },
					{ 62.0, 42.0, ZERETH_MORTIS },
					{ 60.3, 71.6, ZERETH_MORTIS },
					{ 59.1, 64.7, ZERETH_MORTIS },
					{ 60.3, 71.7, ZERETH_MORTIS },
					{ 36.4, 50.2, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189148),	-- Poultrid Lattice
				},
			}),
			o(375950, {	-- Bauble of Pure Innovation
				["coord"] = { 34.5, 49.7, ZERETH_MORTIS },
				["groups"] = {
					i(189171),	-- Bauble of Pure Innovation
				},
			}),
			o(375974, {	-- Crystallized Echo of the First Song
				["description"] = createLocalizationString({
					readable = "Spawns in multple places.",
					constant = "SPAWNS_IN_MULTPLE_PLACES",
					export = true,
					text = {
						en = "Spawns in multple places.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在多个地点刷新。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 77.5, 59.0, ZERETH_MORTIS },
					{ 77.4, 45.4, ZERETH_MORTIS },
					{ 77.6, 60.4, ZERETH_MORTIS },
					{ 58.7, 89.8, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189172),	-- Crystallized Echo of the First Song
					i(189441),	-- Schematic: Resonant Echo
				},
			}),
			o(375290, {	-- Cypher-Bound Chest
				["coords"] = {
					{ 59.5, 64.7, ZERETH_MORTIS },
					{ 53.1, 63.8, ZERETH_MORTIS },
					{ 52.2, 61.8, ZERETH_MORTIS },
					{ 34.7, 68.9, ZERETH_MORTIS },
					{ 44.7, 22.4, ZERETH_MORTIS },
					{ 46.6, 8.7, ZERETH_MORTIS },
					{ 47.8, 66.9, ZERETH_MORTIS },
					{ 49.0, 65.3, ZERETH_MORTIS },
					{ 55.5, 55.5, ZERETH_MORTIS },
					{ 51.8, 72.0, ZERETH_MORTIS },
					{ 48.3, 79.8, ZERETH_MORTIS },
					{ 54.3, 84.2, ZERETH_MORTIS },
					{ 59.4, 82.7, ZERETH_MORTIS },
					{ 58.8, 20.8, ZERETH_MORTIS },
					{ 59.2, 19.3, ZERETH_MORTIS },
					{ 58.5, 20.3, ZERETH_MORTIS },
					{ 63.0, 19.6, ZERETH_MORTIS },
					{ 63.2, 19.6, ZERETH_MORTIS },
					{ 29.3, 51.8, ZERETH_MORTIS },
					{ 35.4, 51.7, ZERETH_MORTIS },
					{ 51.1, 65.3, ZERETH_MORTIS },
					{ 42.7, 76.4, ZERETH_MORTIS },
					{ 39.8, 56.4, ZERETH_MORTIS },
					{ 44.8, 50.8, ZERETH_MORTIS },
					{ 54.2, 76.3, ZERETH_MORTIS },
					{ 53.1, 71.3, ZERETH_MORTIS },
					{ 59.4, 25.0, ZERETH_MORTIS },
					{ 59.9, 34.0, ZERETH_MORTIS },
					{ 59.6, 32.4, ZERETH_MORTIS },
					{ 36.2, 38.4, ZERETH_MORTIS },
					{ 43.6, 86.7, ZERETH_MORTIS },
					{ 34.6, 68.8, ZERETH_MORTIS },
					{ 59.4, 24.9, ZERETH_MORTIS },
					{ 74.5, 60.6, ZERETH_MORTIS },
					{ 54.0, 72.6, ZERETH_MORTIS },
					{ 39.5, 41.4, ZERETH_MORTIS },
					{ 59.9, 61.1, ZERETH_MORTIS },
					{ 53.2, 85.6, ZERETH_MORTIS },
					{ 50.0, 76.7, ZERETH_MORTIS },
					{ 37.9, 32.5, ZERETH_MORTIS },
					{ 58.7, 20.8, ZERETH_MORTIS },
					{ 52.9, 58.6, ZERETH_MORTIS },
					{ 47.0, 45.3, ZERETH_MORTIS },
					{ 49.0, 65.3, ZERETH_MORTIS },
					{ 51.0, 65.3, ZERETH_MORTIS },
					{ 71.1, 28.7, ZERETH_MORTIS },
					{ 42.6, 76.5, ZERETH_MORTIS },
				},
				["groups"] = {
					i(190740),	-- Automa Integration
					i(190739),	-- Provis Wax
				},
			}),
			o(375373, {	-- Discarded Automa Scrap
				["coords"] = {
					{ 39.6, 77.7, ZERETH_MORTIS },
					{ 40.1, 69.4, ZERETH_MORTIS },
					{ 40.6, 70.0, ZERETH_MORTIS },
					{ 41.2, 72.9, ZERETH_MORTIS },
					{ 43.6, 83.3, ZERETH_MORTIS },
					{ 49.7, 75.9, ZERETH_MORTIS },
					{ 50.6, 93.1, ZERETH_MORTIS },
					{ 51.1, 46.9, ZERETH_MORTIS },
					{ 53.9, 88.6, ZERETH_MORTIS },
					{ 54.8, 46.7, ZERETH_MORTIS },
					{ 57.7, 43.6, ZERETH_MORTIS },
					{ 59.0, 60.9, ZERETH_MORTIS },
					{ 59.9, 51.2, ZERETH_MORTIS },
					{ 62.1, 74.9, ZERETH_MORTIS },
					{ 63.9, 72.3, ZERETH_MORTIS },
					{ 67.5, 40.3, ZERETH_MORTIS },
					{ 70.0, 34.2, ZERETH_MORTIS },
					{ 50.2, 76.4, 2028 },	-- Locrian Esper
					{ 50.4, 73.6, 2028 },	-- Locrian Esper
					{ 79.2, 74.8, 2028 },	-- Locrian Esper
				},
				["groups"] = {
					i(189717, {	-- Pocopoc's Shielded Core
						["questID"] = 65483,
					}),
					i(189718, {	-- Pocopoc's Upgraded Core
						["questID"] = 65484,
					}),
				},
			}),
			o(375530, {	-- Forgotten Treasure Vault
				["coords"] = {
					{ 80.5, 45.6, ZERETH_MORTIS },
					{ 55.7, 52.5, ZERETH_MORTIS },
					{ 46.4, 95.8, ZERETH_MORTIS },
					{ 37.8, 56.9, ZERETH_MORTIS },
					{ 36.6, 43.9, ZERETH_MORTIS },
				},
			}),
			o(375915, {	-- Glimmer of Serenity
				["description"] = createLocalizationString({
					readable = "Multiple spawn places. Usually on top of an orb.",
					constant = "MULTIPLE_SPAWN_PLACES_USUALLY_ON_TOP_OF_AN_ORB",
					export = true,
					text = {
						en = "Multiple spawn places. Usually on top of an orb.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "多个刷新地点。通常在法球上方。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 50.0, 11.0, ZERETH_MORTIS },
					{ 46.9, 11.2, ZERETH_MORTIS },
					{ 64.7, 63.4, ZERETH_MORTIS },
					{ 51.2, 28.3, ZERETH_MORTIS },
					{ 50.7, 89.0, ZERETH_MORTIS },
					{ 67.1, 15.9, ZERETH_MORTIS },
					{ 43.0, 35.5, ZERETH_MORTIS },
					{ 60.4, 25.3, ZERETH_MORTIS },
					{ 52.9, 80.7, ZERETH_MORTIS },
					{ 50.2, 32.2, ZERETH_MORTIS },
					{ 67.0, 16.0, ZERETH_MORTIS },
					{ 32.8, 39.3, ZERETH_MORTIS },
					{ 66.3, 27.2, ZERETH_MORTIS },
					{ 37.7, 29.1, ZERETH_MORTIS },
					{ 61.5, 18.3, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189168),	-- Glimmer of Serenity
				},
			}),
			o(375538, {	-- Lost Ovoid
				["coords"] = {
					{ 34.31, 66.55, ZERETH_MORTIS },
					{ 34.52, 49.69, ZERETH_MORTIS },
					{ 35.15, 49.02, ZERETH_MORTIS },
					{ 35.97, 46.22, ZERETH_MORTIS },
					{ 43.22, 84.88, ZERETH_MORTIS },
					{ 46.69, 63.00, ZERETH_MORTIS },
					{ 48.14, 73.55, ZERETH_MORTIS },
					{ 49.18, 71.53, ZERETH_MORTIS },
					{ 50.80, 70.81, ZERETH_MORTIS },
					{ 52.43, 73.64, ZERETH_MORTIS },
					{ 53.60, 72.60, ZERETH_MORTIS },
					{ 53.83, 64.88, ZERETH_MORTIS },
					{ 55.19, 76.85, ZERETH_MORTIS },
					{ 55.98, 68.78, ZERETH_MORTIS },
					{ 60.84, 75.94, ZERETH_MORTIS },
					{ 61.07, 65.15, ZERETH_MORTIS },
				},
				["questID"] = 65624,
				["groups"] = {
					i(190239),	-- Lost Ovoid
				},
			}),
			o(375363, {	-- Mawsworn Supply Chest
				["coords"] = {
					{ 46.1, 24.1, ZERETH_MORTIS },
					{ 46.4, 5.1, ZERETH_MORTIS },
					{ 46.6, 26.8, ZERETH_MORTIS },
					{ 46.8, 12.3, ZERETH_MORTIS },
					{ 48.8, 42.4, ZERETH_MORTIS },
					{ 50.2, 44.6, ZERETH_MORTIS },
					{ 57.6, 23.0, ZERETH_MORTIS },
					{ 58.4, 40.3, ZERETH_MORTIS },
					{ 60.1, 32.3, ZERETH_MORTIS },
					{ 60.9, 19.7, ZERETH_MORTIS },
					{ 61.0, 16.5, ZERETH_MORTIS },
					{ 63.3, 21.0, ZERETH_MORTIS },
					{ 66.6, 32.1, ZERETH_MORTIS },
					{ 67.6, 29.5, ZERETH_MORTIS },
				},
				["groups"] = {
					i(190766),	-- Colossal Wraithbound Mawrat (MOUNT!)
				},
			}),
			o(373579, {	-- Prying Eye Discovery
				["coords"] = {
					{ 35.2, 43.7, ZERETH_MORTIS },
					{ 34.3, 44.3, ZERETH_MORTIS },
					{ 48.0, 66.3, ZERETH_MORTIS },
					{ 51.8, 77.8, ZERETH_MORTIS },
				},
				["questID"] = 65184,
				["groups"] = {
					i(189711, {	-- Pocopoc's Gold and Ruby Components
						["questID"] = 65476,
					}),
					i(190096, {	-- Pocobold
						["questID"] = 65534,
					}),
				},
			}),
			o(375403, {	-- Pulp-Covered Relic
				["description"] = createLocalizationString({
					readable = "Talk to this chest multiple times and kill add waves.",
					constant = "TALK_TO_THIS_CHEST_MULTIPLE_TIMES_AND_KILL_ADD",
					export = true,
					text = {
						en = "Talk to this chest multiple times and kill add waves.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "多次与这个箱子对话，并击杀一波波的小怪。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					185502,	-- Pulp-Covered Relic
					185265,	-- Pulp-Covered Relic
				},
				["coords"] = {
					{ 42.0, 34.2, ZERETH_MORTIS },
					{ 42.0, 34.2, ZERETH_MORTIS },
					{ 50.4, 41.2, ZERETH_MORTIS },
					{ 52.8, 45.8, ZERETH_MORTIS },
					{ 53.4, 25.8, ZERETH_MORTIS },
					{ 64.4, 63.4, ZERETH_MORTIS },
				},
				["questID"] = 65501,
				["groups"] = {
					i(189474),	-- Schematic: Buzz
				},
			}),
			o(375404, {	-- Sandworn Chest
				["description"] = createLocalizationString({
					readable = "Key fragements drops in the area from mobs Sandworn Chest Key Fragment(190198)",
					constant = "KEY_FRAGEMENTS_DROPS_IN_THE_AREA_FROM_MOBS",
					export = true,
					text = {
						en = "Key fragements drops in the area from mobs Sandworn Chest Key Fragment(190198)",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "钥匙碎片由区域内的怪物掉落 沙蚀宝箱钥匙碎片(190198)",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 60.0, 25.8, ZERETH_MORTIS },
					{ 60.9, 37.9, ZERETH_MORTIS },
					{ 61.4, 17.6, ZERETH_MORTIS },
					{ 63.2, 26.0, ZERETH_MORTIS },
					{ 64.8, 33.7, ZERETH_MORTIS },
					{ 66.0, 26.9, ZERETH_MORTIS },
				},
				["questID"] = 65611,
				["cost"] = { { "i", 190197, 1 } },	-- 1x Sandworn Chest Key
				["groups"] = {
					i(190189),	-- Sandworn Relic
					i(190734),	-- Makaris's Satchel of Mines (TOY!)
					i(189713, {	-- Pocopoc's Copper and Cobalt Components
						["questID"] = 65478,
					}),
					i(189714, {	-- Pocopoc's Platinum and Emerald Components
						["questID"] = 65479,
					}),
				},
			}),
			o(376041, {	-- Shrouded Cypher Cache
				["description"] = createLocalizationString({
					readable = "Needs a piece with the ability to discover hidden caches equipped to see.",
					constant = "NEEDS_A_PIECE_WITH_THE_ABILITY_TO_DISCOVER",
					export = true,
					text = {
						en = "Needs a piece with the ability to discover hidden caches equipped to see.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要装备一件具有发现隐藏宝箱能力的物品才能看见。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 34.1, 70.5, ZERETH_MORTIS },
					{ 36.3, 48.1, ZERETH_MORTIS },
					{ 41.9, 34.2, ZERETH_MORTIS },
					{ 60.9, 69.4, ZERETH_MORTIS },
					{ 29.4, 49.3, ZERETH_MORTIS },
					{ 66.5, 25.1, ZERETH_MORTIS },
					{ 63.7, 41.2, ZERETH_MORTIS },
					{ 61.3, 15.5, ZERETH_MORTIS },
					{ 69.5, 34.4, ZERETH_MORTIS },
					{ 42.8, 52.9, ZERETH_MORTIS },
					{ 44.5, 71.4, ZERETH_MORTIS },
					{ 53.0, 92.2, ZERETH_MORTIS },
					{ 43.9, 84.3, ZERETH_MORTIS },
					{ 40.3, 62.6, ZERETH_MORTIS },
					{ 54.3, 49.7, ZERETH_MORTIS },
					{ 49.0, 30.5, ZERETH_MORTIS },
					{ 50.8, 4.7, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189983),	-- Gormit Soul
				},
			}),
			o(375366, {	-- Tarachnid Eggs
				["coords"] = {
					{ 61.4, 38.3, ZERETH_MORTIS },
					{ 53.6, 35.9, ZERETH_MORTIS },
					{ 55.3, 32.9, ZERETH_MORTIS },
					{ 56.3, 27.3, ZERETH_MORTIS },
				},
				["groups"] = {
					i(189158),	-- Glimmer of Cunning
				},
			}),
		})),
		n(TREASURES, sharedData({ ["isWeekly"] = true }, {
			o(373568, {	-- Provis Cache
				["description"] = createLocalizationString({
					readable = "Use Firim's Spare Forge-tap to gain 15xEphemera Strands(187728) to get Ephemera Orb(187787), not guaranteed.",
					constant = "USE_FIRIM_S_SPARE_FORGE_TAP_TO_GAIN_15XEPHEMERA",
					export = true,
					text = {
						en = "Use Firim's Spare Forge-tap to gain 15xEphemera Strands(187728) to get Ephemera Orb(187787), not guaranteed.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用菲里姆的备用熔炉开关获得 15 个瞬息之线(187728)以获得瞬息宝珠(187787)，并非必定获得。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 42.0, 51.9, ZERETH_MORTIS },
				["questID"] = 65183,
				["cost"] = { { "i", 188231, 1 } },	-- 1x Provis Cache Key
				["groups"] = {
					i(189710, {	-- Pocopoc's Ruby and Platinum Body
						["questID"] = 65474,
					}),
				},
			}),
		})),
	}),
})));
