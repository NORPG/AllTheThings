---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_AZURE_SPAN, {
		n(TREASURES, {
			o(381713, {	-- A Solid Foundation
				["coord"] = { 8.0, 45.6, THE_AZURE_SPAN },
			}),
			o(381715, {	-- Attention: Immediate Evacuation
				["coord"] = { 66.4, 61.1, THE_AZURE_SPAN },
			}),
			o(383625, {	-- Case of Fresh Gleamfish
				["coord"] = { 45.6, 54.8, THE_AZURE_SPAN },
				["groups"] = {
					i(200949),	-- Case of Fresh Gleamfish
				},
			}),
			o(381362, {	-- Chunk of Sculpture
				["coord"] = { 60.1, 60.1, THE_AZURE_SPAN },
				["description"] = createLocalizationString({
					readable = "Behind the dragon statue next to the mountain.",
					constant = "BEHIND_THE_DRAGON_STATUE_NEXT_TO_THE_MOUNTAIN",
					export = true,
					text = {
						en = "Behind the dragon statue next to the mountain.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在山旁的龙雕像后面。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(199895),	-- Chunk of Sculpture
				},
			}),
			o(381356, {	-- Coldwashed Dragonclaw
				["coord"] = { 47.1, 38.9, THE_AZURE_SPAN },
				["description"] = "~L.UNDERWATER",
				["groups"] = {
					i(199843),	-- Coldwashed Dragonclaw
				},
			}),
			o(376583, {	-- Decay Covered Chest
				["coords"] = {
					{ 9.7, 29.1, THE_AZURE_SPAN },
					{ 9.9, 32.5, THE_AZURE_SPAN },
					{ 10.5, 31.2, THE_AZURE_SPAN },
					{ 11.6, 34.2, THE_AZURE_SPAN },
					{ 12.0, 36.8, THE_AZURE_SPAN },
					{ 12.2, 35.2, THE_AZURE_SPAN },
					{ 12.4, 22.0, THE_AZURE_SPAN },
					{ 12.8, 34.1, THE_AZURE_SPAN },
					{ 13.8, 38.2, THE_AZURE_SPAN },
					{ 13.8, 39.4, THE_AZURE_SPAN },
					{ 14.4, 20.5, THE_AZURE_SPAN },
					{ 14.4, 21.8, THE_AZURE_SPAN },
					{ 14.9, 31.0, THE_AZURE_SPAN },
					{ 16.1, 35.2, THE_AZURE_SPAN },
					{ 16.2, 38.9, THE_AZURE_SPAN },
					{ 16.5, 34.3, THE_AZURE_SPAN },
					{ 17.1, 38.3, THE_AZURE_SPAN },
					{ 17.9, 36.0, THE_AZURE_SPAN },
					{ 18.1, 34.8, THE_AZURE_SPAN },
					{ 18.4, 36.7, THE_AZURE_SPAN },
					{ 18.4, 38.4, THE_AZURE_SPAN },
					{ 21.4, 40.4, THE_AZURE_SPAN },
					{ 21.4, 42.4, THE_AZURE_SPAN },
					{ 21.5, 42.3, THE_AZURE_SPAN },
					{ 23.2, 43.7, THE_AZURE_SPAN },
					{ 24.5, 40.2, THE_AZURE_SPAN },
					{ 24.9, 42.3, THE_AZURE_SPAN },
					{ 34.2, 34.0, THE_AZURE_SPAN },
					{ 34.6, 45.4, THE_AZURE_SPAN },
					{ 34.9, 31.9, THE_AZURE_SPAN },
					{ 35.4, 48.0, THE_AZURE_SPAN },
					{ 35.6, 34.1, THE_AZURE_SPAN },
					{ 35.9, 46.6, THE_AZURE_SPAN },
					{ 58.2, 41.4, THE_AZURE_SPAN },
					{ 58.4, 42.7, THE_AZURE_SPAN },
					{ 55.4, 30.7, THALDRASZUS },
					{ 55.9, 32.1, THALDRASZUS },
					{ 56.9, 29.3, THALDRASZUS },
				},
				["groups"] = {
					i(201368, {	-- Brackenhide Hollow Barbslinger
						["description"] = createLocalizationString({
							readable = "Drops from Gnoll Creatures or Decay Covered Chests around Bracken Hollow.",
							constant = "DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
							export = true,
							text = {
								en = "Drops from Gnoll Creatures or Decay Covered Chests around Bracken Hollow.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "由蕨皮谷周围的豺狼人生物或覆满腐朽的宝箱掉落。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(201363, {	-- Brackenhide Hollow Maul
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
					i(201365, {	-- Brackenhide Gnoll Guard
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
					i(201370, {	-- Brackenhide Skullcracker
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
					i(201369, {	-- Hollow Greatwood Pestilence
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
					i(201367, {	-- Hollow Hunter's Sticker
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
					i(194312, {	-- Pattern: Gnoll Tent (RECIPE!)
						["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
					}),
				},
			}),
			o(381110, {	-- Forgotten Jewel Box
				["coord"] = { 45.1, 59.3, THE_AZURE_SPAN },
				["questID"] = 70603,
				["cost"] = { { "i", 199065, 1 } },	-- 1x Sorrowful Letter
				["groups"] = {
					i(201927),	-- Gleaming Arcanocrystal (TOY!)
				},
			}),
			o(381510, {	-- Flying Fish Bones
				["coord"] = { 12.5, 50.0, THE_AZURE_SPAN },
				["groups"] = {
					i(200075),	-- Flying Fish Bones
				},
			}),
			o(381158, {	-- Gnoll Fiend Flail
				["coord"] = { 54.0, 43.8, THE_AZURE_SPAN },
				["questID"] = 70604,
				["cost"] = { { "i", 199066, 1 } },	-- 1x Letter of Caution
				["groups"] = {
					i(202692),	-- Gnoll Fiend Flail
				},
			}),
			o(381511, {	-- Harpoon Head
				["description"] = createLocalizationString({
					readable = "On the anvil in the Tuskaar area.",
					constant = "ON_THE_ANVIL_IN_THE_TUSKAAR_AREA",
					export = true,
					text = {
						en = "On the anvil in the Tuskaar area.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在塔斯卡尔区域的铁砧上。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 12.9, 48.7, THE_AZURE_SPAN },
				["groups"] = {
					i(200076),	-- Harpoon Head
				},
			}),
			o(381711, {	-- Im'bunata's Blessing
				["coord"] = { 56.7, 70.4, THE_AZURE_SPAN },
			}),
			o(381160, {	-- Lost Compass
				["coord"] = { 74.9, 55.0, THE_AZURE_SPAN },
				["questID"] = 70606,
				["groups"] = {
					i(202711),	-- Lost Compass (TOY!)
				},
			}),
			o(381513, {	-- Old Pickaxe
				["description"] = createLocalizationString({
					readable = "Visible when reaching 50 Fishing Skill (including Equipment Bonuses).",
					constant = "VISIBLE_WHEN_REACHING_50_FISHING_SKILL",
					export = true,
					text = {
						en = "Visible when reaching 50 Fishing Skill (including Equipment Bonuses).",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "达到 50 点钓鱼技能（包括装备加成）时可见。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 18.9, 24.3, THE_AZURE_SPAN },
				["groups"] = {
					i(200078),	-- Pickaxe Blade
				},
			}),
			n(195373, {	-- Pepper Hammer
				["description"] = createLocalizationString({
					readable = "Use nearby Stick and Tree Sap to lure the bird.",
					constant = "USE_NEARBY_STICK_AND_TREE_SAP_TO_LURE_THE_BIRD",
					export = true,
					text = {
						en = "Use nearby Stick and Tree Sap to lure the bird.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用附近的树枝和树液来引诱这只鸟。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 26.5, 46.3, THE_AZURE_SPAN },
				["questID"] = 70441,
				["groups"] = {
					i(193834),	-- Blackfeather Nester (PET!)
				},
			}),
			o(380843, {	-- Rubber Fish
				["coord"] = { 54.6, 29.3, THE_AZURE_SPAN },
				["questID"] = 70380,
				["groups"] = {
					i(202712),	-- Rubber Fish
				},
			}),
			o(383660, {	-- Salt Crystal
				["description"] = createLocalizationString({
					readable = "In a cave.",
					constant = "IN_A_CAVE_2",
					export = true,
					text = {
						en = "In a cave.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 11.6, 41.0, THE_AZURE_SPAN },
				["groups"] = {
					i(201033),	-- Magical Salt Crystal
				},
			}),
			o(381157, {	-- Sapphire Gem Cluster
				["coord"] = { 49.0, 25.0, THE_AZURE_SPAN },
				["questID"] = 70605,
				["cost"] = { { "i", 199067, 1 } },	-- 1x Precious Plans
				["groups"] = {
					i(200866),	-- Glimmering Malygite Cluster
					i(194649),	-- Design: Jeweled Sapphire Whelpling (RECIPE!)
				},
			}),
			o(380533, {	-- Snow Covered Scroll
				["coord"] = { 58.0, 42.0, THE_AZURE_SPAN },
				["questID"] = 70237,
				["groups"] = {
					i(198103),	-- Recipe: Snow in a Cone (RECIPE!)
				},
			}),
			o(381353, {	-- Stone Dragontooth
				["coord"] = { 69.2, 47.6, THE_AZURE_SPAN },
				["description"] = createLocalizationString({
					readable = "Next to the dragon statue on the ground.",
					constant = "NEXT_TO_THE_DRAGON_STATUE_ON_THE_GROUND",
					export = true,
					text = {
						en = "Next to the dragon statue on the ground.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在地面上的巨龙雕像旁边。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(199842),	-- Stone Dragontooth
				},
			}),
			o(381718, {	-- The Vow
				["coord"] = { 60.3, 49.7, THE_AZURE_SPAN },
			}),
			o(376582, {	-- Tuskarr Chest
				["coords"] = {
					{ 7.2, 45.1, THE_AZURE_SPAN },
					{ 8.4, 40.7, THE_AZURE_SPAN },
					{ 9.4, 37.9, THE_AZURE_SPAN },
					{ 45.1, 52.1, THE_AZURE_SPAN },
					{ 45.8, 56.1, THE_AZURE_SPAN },
					{ 46.9, 54.2, THE_AZURE_SPAN },
					{ 55.7, 68.7, THE_AZURE_SPAN },
					{ 56.5, 65.7, THE_AZURE_SPAN },
					{ 56.9, 67.9, THE_AZURE_SPAN },
					{ 57.6, 69.7, THE_AZURE_SPAN },
					{ 58.8, 68.4, THE_AZURE_SPAN },
					{ 58.9, 54.8, THE_AZURE_SPAN },
					{ 59.0, 66.7, THE_AZURE_SPAN },
					{ 59.2, 56.5, THE_AZURE_SPAN },
					{ 60.5, 59.0, THE_AZURE_SPAN },
				},
				["groups"] = {
					i(201373),	-- Imbu Net Cutter
					i(201372),	-- Imbu Tuskarr Axe
					i(201376),	-- Imbu Tuskarr Mace
					i(201375),	-- Imbu Warrior's Club
					i(201378),	-- Tuskarr Angler's Crossbow
					i(201377),	-- Tuskarr Elder's Staff
					i(201374),	-- Tuskarr Fishing Pike
				},
			}),
			o(421740, {	-- Tuskarr Pepe
				["coord"] = { 12.99, 48.59, THE_AZURE_SPAN },
				["timeline"] = { ADDED_10_2_5 },
				["groups"] = { i(213207) },	-- A Tiny Ear Warmer (Pepe!)
			}),
			o(381722, {	-- Vakthros Maintenance
				["coord"] = { 77.4, 31.1, THE_AZURE_SPAN },
			}),
			o(381354, {	-- Wrapped Gold Band
				["coord"] = { 47.3, 24.6, THE_AZURE_SPAN },
				["description"] = createLocalizationString({
					readable = "Underneath the back left foot of the dragon statue.",
					constant = "UNDERNEATH_THE_BACK_LEFT_FOOT_OF_THE_DRAGON",
					export = true,
					text = {
						en = "Underneath the back left foot of the dragon statue.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在巨龙雕像左后脚的下方。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(199840),	-- Wrapped Gold Band
				},
			}),
		}),
	}),
})));
