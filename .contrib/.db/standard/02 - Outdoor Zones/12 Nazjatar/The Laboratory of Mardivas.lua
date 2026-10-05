---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(NAZJATAR, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	q(55121, {	-- The Laboratory of Mardivas
		["description"] = createLocalizationString({
			readable = "For this weekly quest, combine reagents scavenged from Nazjatar (|cFF0070ddStrange Mineralized Water|r, |cFF0070ddStrange Oceanic Sediment|r, and |cFF0070ddStrange Volcanic Rock|r) to create various elemental amalgamations.\n\nKill each one to fulfill the requirements for |cFFFFFF00Periodic Destruction|r, part of the |cFFFFFF00Undersea Usurper|r achievement, or target specific ones to collect their unique drops!\n\nHover over the name of the mob you want to summon for a description that outlines which Arcanocrystals to activate.",
			constant = "FOR_THIS_WEEKLY_QUEST_COMBINE_REAGENTS",
			export = true,
			text = {
				en = "For this weekly quest, combine reagents scavenged from Nazjatar (|cFF0070ddStrange Mineralized Water|r, |cFF0070ddStrange Oceanic Sediment|r, and |cFF0070ddStrange Volcanic Rock|r) to create various elemental amalgamations.\n\nKill each one to fulfill the requirements for |cFFFFFF00Periodic Destruction|r, part of the |cFFFFFF00Undersea Usurper|r achievement, or target specific ones to collect their unique drops!\n\nHover over the name of the mob you want to summon for a description that outlines which Arcanocrystals to activate.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "在这个周常任务中，将取自纳沙塔尔的材料（|cFF0070dd奇异的矿化水|r、|cFF0070dd奇异的海洋沉积物|r和|cFF0070dd奇异的火山岩|r）组合起来，制造出各种元素融合体。\n\n击杀每一个融合体即可满足|cFFFFFF00周期性毁灭|r的要求，这是|cFFFFFF00海底篡位者|r成就的一部分；也可以专门针对特定的融合体，收集它们的独特掉落！\n\n将鼠标悬停在你想召唤的怪物名称上，即可看到说明，了解需要激活哪些奥术水晶。",
				-- TODO: tw = "",
			},
		}),
		["icon"] = 132774,	-- Strange Mineralized Water
		["sourceQuests"] = { 57086 },	-- Legacy of the Mad Mage
		["provider"] = { "o", 322533 },	-- Mardivas's Tome of the Elements
		["coord"] = { 60.7, 32.4, NAZJATAR },
		["isWeekly"] = true,
		["groups"] = {
			currency(1721),	-- Prismatic Manapearl x5
			n(155139, {	-- Arcane Amalgamation
				["description"] = createLocalizationString({
					readable = "Activate no crystals.",
					constant = "ACTIVATE_NO_CRYSTALS",
					export = true,
					text = {
						en = "Activate no crystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "不激活任何水晶。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = { i(170477) },	-- Mardivas's Universally Lauded Tote
			}),
			n(150926, {	-- Burning Amalgamation
				["description"] = createLocalizationString({
					readable = "Activate Lesser Pyroclasmic (Red) Arcanocrystal.",
					constant = "ACTIVATE_LESSER_PYROCLASMIC_RED_ARCANOCRYSTAL",
					export = true,
					text = {
						en = "Activate Lesser Pyroclasmic (Red) Arcanocrystal.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级烈焰（红色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["cr"] = 154991,	-- Lesser Pyroclasmic Arcanocrystal
				["cost"] = { { "i", 169333, 1 } },	-- Strange Volcanic Rock
				["groups"] = { i(170126) },	-- Igneous Longbow
			}),
			n(150862, {	-- Dusty Amalgamation
				["description"] = createLocalizationString({
					readable = "Activate Lesser Lithic (Yellow) Arcanocrystal.",
					constant = "ACTIVATE_LESSER_LITHIC_YELLOW_ARCANOCRYSTAL",
					export = true,
					text = {
						en = "Activate Lesser Lithic (Yellow) Arcanocrystal.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级岩石（黄色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["cr"] = 155009,	-- Lesser Lithic Arcanocrystal
				["cost"] = { { "i", 169334, 1 } },	-- Strange Oceanic Sediment
				["groups"] = { i(170383) },	-- Coralspine Bulwark
			}),
			n(150864, {	-- Herald of Salgos
				["description"] = createLocalizationString({
					readable = "Activate Lesser Lithic (Yellow) and Greater Lithic (Yellow) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_LITHIC_YELLOW_AND_GREATER",
					export = true,
					text = {
						en = "Activate Lesser Lithic (Yellow) and Greater Lithic (Yellow) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级岩石（黄色）和强效岩石（黄色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					155009,	-- Lesser Lithic Arcanocrystal
					155031,	-- Greater Lithic Arcanocrystal
				},
				["cost"] = { { "i", 169334, 2 } },	-- Strange Oceanic Sediment
				["groups"] = { i(170125) },	-- Behemoth Claw of the Abyss
			}),
			n(150928, {	-- Moghiea
				["description"] = createLocalizationString({
					readable = "Activate Lesser Pyroclasmic (Red) and Greater Lithic (Yellow) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_PYROCLASMIC_RED_AND_GREATER",
					export = true,
					text = {
						en = "Activate Lesser Pyroclasmic (Red) and Greater Lithic (Yellow) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级烈焰（红色）和强效岩石（黄色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154991,	-- Lesser Pyroclasmic Arcanocrystal
					155031,	-- Greater Lithic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169333, 1 },	-- Strange Volcanic Rock
					{ "i", 169334, 1 },	-- Strange Oceanic Sediment
				},
				["groups"] = { i(170128) },	-- Majestic Shirakess Greatstaff
			}),
			n(151157, {	-- Omus
				["description"] = createLocalizationString({
					readable = "Activate Lesser Benthic (Blue) and Greater Pyroclasmic (Red) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_BENTHIC_BLUE_AND_GREATER",
					export = true,
					text = {
						en = "Activate Lesser Benthic (Blue) and Greater Pyroclasmic (Red) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级底栖（蓝色）和强效烈焰（红色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154970,	-- Lesser Benthic Arcanocrystal
					155025,	-- Greater Pyroclasmic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169332, 1 },	-- Strange Mineralized Water
					{ "i", 169333, 1 },	-- Strange Volcanic Rock
				},
				["groups"] = {
					i(170132),	-- Slicer of Omus
					i(170166),	-- Technique: Glyph of Steaming Fury (RECIPE!)
				},
			}),
			n(150856, {	-- Osgen <Shifter of Tides>
				["description"] = createLocalizationString({
					readable = "Activate Lesser Benthic (Blue) and Greater Benthic (Blue) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_BENTHIC_BLUE_AND_GREATER_2",
					export = true,
					text = {
						en = "Activate Lesser Benthic (Blue) and Greater Benthic (Blue) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级底栖（蓝色）和强效底栖（蓝色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154970,	-- Lesser Benthic Arcanocrystal
					154979,	-- Greater Benthic Arcanocrystal
				},
				["cost"] = { { "i", 169332, 2 } },	-- Strange Mineralized Water
				["groups"] = { i(170130) },	-- Glaive of Swells
			}),
			n(151154, {	-- Salgos the Eternal
				["description"] = createLocalizationString({
					readable = "Activate Lesser Lithic (Yellow) and Greater Pyroclasmic (Red) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_LITHIC_YELLOW_AND_GREATER_2",
					export = true,
					text = {
						en = "Activate Lesser Lithic (Yellow) and Greater Pyroclasmic (Red) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级岩石（黄色）和强效烈焰（红色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					155009,	-- Lesser Lithic Arcanocrystal
					155025,	-- Greater Pyroclasmic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169334, 1 },	-- Strange Oceanic Sediment
					{ "i", 169333, 1 },	-- Strange Volcanic Rock
				},
				["groups"] = { i(170129) },	-- Salgos' Volatile Basher
			}),
			n(150863, {	-- Spawn of Salgos
				["description"] = createLocalizationString({
					readable = "Activate Lesser Lithic (Yellow) and Greater Benthic (Blue) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_LITHIC_YELLOW_AND_GREATER_3",
					export = true,
					text = {
						en = "Activate Lesser Lithic (Yellow) and Greater Benthic (Blue) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级岩石（黄色）和强效底栖（蓝色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					155009,	-- Lesser Lithic Arcanocrystal
					154979,	-- Greater Benthic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169334, 1 },	-- Strange Oceanic Sediment
					{ "i", 169332, 1 },	-- Strange Mineralized Water
				},
				["groups"] = { i(170124) },	-- Coral-Sharpened Greatsword
			}),
			n(151155, {	-- Ungormath <The Malevolent>
				["description"] = createLocalizationString({
					readable = "Activate Lesser Pyroclasmic (Red) and Greater Pyroclasmic (Red) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_PYROCLASMIC_RED_AND_GREATER_2",
					export = true,
					text = {
						en = "Activate Lesser Pyroclasmic (Red) and Greater Pyroclasmic (Red) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级烈焰（红色）和强效烈焰（红色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154991,	-- Lesser Pyroclasmic Arcanocrystal
					155025,	-- Greater Pyroclasmic Arcanocrystal
				},
				["cost"] = { { "i", 169333, 2 } },	-- Strange Volcanic Rock
				["groups"] = { i(170131) },	-- Tidal Wand of Malevolence
			}),
			n(150846, {	-- Watery Amalgamation
				["description"] = createLocalizationString({
					readable = "Activate Lesser Benthic (Blue) Arcanocrystal.",
					constant = "ACTIVATE_LESSER_BENTHIC_BLUE_ARCANOCRYSTAL",
					export = true,
					text = {
						en = "Activate Lesser Benthic (Blue) Arcanocrystal.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级底栖（蓝色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["cr"] = 154970,	-- Lesser Benthic Arcanocrystal
				["cost"] = { { "i", 169332, 1 } },	-- Strange Mineralized Water
				["groups"] = { i(170138) },	-- Scroll of Violent Tides
			}),
			n(150927, {	-- Xue <The Cinder>
				["description"] = createLocalizationString({
					readable = "Activate Lesser Pyroclasmic (Red) and Greater Benthic (Blue) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_PYROCLASMIC_RED_AND_GREATER_3",
					export = true,
					text = {
						en = "Activate Lesser Pyroclasmic (Red) and Greater Benthic (Blue) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级烈焰（红色）和强效底栖（蓝色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154991,	-- Lesser Pyroclasmic Arcanocrystal
					154979,	-- Greater Benthic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169333, 1 },	-- Strange Volcanic Rock
					{ "i", 169332, 1 },	-- Strange Mineralized Water
				},
				["groups"] = {
					i(170127),	-- Pyroclastic Halberd
					i(170166),	-- Technique: Glyph of Steaming Fury (RECIPE!)
				},
			}),
			n(150848, {	-- Zomera
				["description"] = createLocalizationString({
					readable = "Activate Lesser Benthic (Blue) and Greater Lithic (Yellow) Arcanocrystals.",
					constant = "ACTIVATE_LESSER_BENTHIC_BLUE_AND_GREATER_LITHIC",
					export = true,
					text = {
						en = "Activate Lesser Benthic (Blue) and Greater Lithic (Yellow) Arcanocrystals.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "激活次级底栖（蓝色）和强效岩石（黄色）奥术水晶。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					154970,	-- Lesser Benthic Arcanocrystal
					155031,	-- Greater Lithic Arcanocrystal
				},
				["cost"] = {
					{ "i", 169334, 1 },	-- Strange Oceanic Sediment
					{ "i", 169332, 1 },	-- Strange Mineralized Water
				},
				["groups"] = { i(170137) },	-- Azerite-Infused Crystal Flayer
			}),
		},
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.BFA, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	m(NAZJATAR, {
		n(RARES, {
			q(55202),	-- Elemental Essence Amalgamator Selection	-- Needs confirmation
			q(55198),	-- Small Water
			-- q(56478),	-- Greater Benthic (Blue) ?? maybe
			q(56428),	-- Summoned Arcane Amalgamation
			q(55144),	-- Summoned Dusty Amalgamation
			q(55205),	-- Summoned Moghiea
			q(55206),	-- Summoned Ungormath
			q(55203),	-- Summoned Salgos, the Eternal
			q(55201),	-- Summoned Spawn of Salgos
			q(55204),	-- Summoned Xue
			q(55199),	-- Summoned Zomera
			q(55200),	-- Summoned Omus
			q(55143),	-- Killed Watery Amalgamation (first time)
			q(56477),	-- Killed Watery Amalgamation (first time)
			q(56720),	-- Killed Watery Amalgamation (first time)
			q(56476),	-- Killed Arcane Amalgamation
			q(56892),	-- Killed Arcane Amalgamation, Burning Amalgamation, Herald of Salgos, Moghiea, Salgos the Eternal, Spawn of Salgos, Xue, and Zomera
			q(56724),	-- Triggered when killing Arcane Amalgamation in mardivas' lab. Probably used to disable something else in the room
			q(55145),	-- Killed Burning Amalgamation
			q(56481),	-- Killed Burning Amalgamation
			q(56725),	-- Killed Burning Amalgamation
			q(56891),	-- Killed Burning Amalgamation, Moghiea, Salgos the Eternal, Spawn of Salgos, and Xue
			q(56485),	-- Killed Dusty Amalgamation
			q(56730),	-- First kill of Dusty Amalgamation
			q(56488),	-- Killed Herald of Salgos
			q(56733),	-- First kill of Herald of Salgos
			q(56484),	-- Killed Moghiea
			q(56728),	-- killed Moghiea (first time)
			q(56479),	-- Killed Omus
			q(56722),	-- Killed Omus
			q(56483),	-- Killed Ungormath
			q(56487),	-- Killed Salgos, the Eternal
			q(56732),	-- Killed Salgos, the Eternal
			q(56486),	-- Killed Spawn of Salgos
			q(56731),	-- Killed Spawn of Salgos
			q(56482),	-- Killed Xue
			q(56726),	-- Killed Xue
			q(56480),	-- Killed Zomera
			q(56723),	-- Killed Zomera
			q(56721),	-- Killed Osgen
			q(56478),	-- Killed Osgen (first time)
			q(56727),	-- Killed Ungormath
		}),
	}),
})));
