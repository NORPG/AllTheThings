---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_AZURE_SPAN, {
		n(SPECIAL, {
			n(195353, {	-- Breezebiter
				["description"] = createLocalizationString({
					readable = "Spawns near a cave, then patrols the area. Not considered a rare.",
					constant = "SPAWNS_NEAR_A_CAVE_THEN_PATROLS_THE_AREA_NOT",
					export = true,
					text = {
						en = "Spawns near a cave, then patrols the area. Not considered a rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴附近刷新，然后在周围巡逻。不被视为稀有。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 29.8, 46.2, THE_AZURE_SPAN },	-- spawn
					-- some path points
					{ 25.8, 46.7, THE_AZURE_SPAN },
					{ 26.3, 44.9, THE_AZURE_SPAN },
					{ 27.7, 44.4, THE_AZURE_SPAN },
					{ 27.9, 48.1, THE_AZURE_SPAN },
				},
				["groups"] = {
					i(201440),	-- Liberated Slyvern (MOUNT!)
				},
			}),
			n(196165, {	-- Gethdazr
				["description"] = createLocalizationString({
					readable = "Spawns as part of an event involving The Blubberwall that starts by blowing the Great Horn of Imbu at the northern waypoint. The horn will become clickable after killing the Enraged Air Elemental & you have to support the NPC's, spawning east of the horn, otherwise they will die & the event fails.",
					constant = "SPAWNS_AS_PART_OF_AN_EVENT_INVOLVING_THE",
					export = true,
					text = {
						en = "Spawns as part of an event involving The Blubberwall that starts by blowing the Great Horn of Imbu at the northern waypoint. The horn will become clickable after killing the Enraged Air Elemental & you have to support the NPC's, spawning east of the horn, otherwise they will die & the event fails.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "作为与鲸脂之墙相关的事件的一部分刷新。该事件通过在北部路径点吹响因布巨角开启。击杀狂怒的空气元素后号角才会变为可点击，你还得保护从号角东侧出现的 NPC，否则他们会死亡，事件也会失败。",
						-- TODO: tw = "",
					},
				}),
				-- check wording
				["coords"] = {
					{ 58.9, 66.9, THE_AZURE_SPAN },	-- Event Start
					{ 56.6, 70.8, THE_AZURE_SPAN },	-- Rare
				},
				["questID"] = 74446,
				["isDaily"] = true,
				["groups"] = {
					i(200086),	-- Khaz'gorite-Infused Resin (IF!)
				},
			}),
			n(196900, {	-- Lost Elemental
				["description"] = createLocalizationString({
					readable = "Patrols the area and is not considered a rare.",
					constant = "PATROLS_THE_AREA_AND_IS_NOT_CONSIDERED_A_RARE",
					export = true,
					text = {
						en = "Patrols the area and is not considered a rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在该区域巡逻，且不被视为稀有。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 75.6, 24.2, THE_AZURE_SPAN },
				["groups"] = {
					i(200528),	-- Glowing Arcane Jewel
				},
			}),
			n(196768, {	-- Primal Bear Cub
				["description"] = createLocalizationString({
					readable = "Give 3x Hornswog Hunk and a Honey Snack to Primal Bear Cub while wearing the title Honorary Dryad (from Thalendra [192522]) will give you this pet.",
					constant = "GIVE_3X_HORNSWOG_HUNK_AND_A_HONEY_SNACK_TO",
					export = true,
					text = {
						en = "Give 3x Hornswog Hunk and a Honey Snack to Primal Bear Cub while wearing the title Honorary Dryad (from Thalendra [192522]) will give you this pet.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在佩戴头衔“荣誉树妖”（来自萨兰德拉 [192522]）的情况下，将 3 个角蛙肉块和一份蜜糖点心交给原始熊崽，即可获得这只宠物。",
						-- TODO: tw = "",
					},
				}),
				["sourceQuests"] = { 67606 },	-- A Dryadic Remedy
				["coord"] = { 67.4, 18.4, THE_AZURE_SPAN },
				["groups"] = {
					i(201838, {	-- Snowclaw Cub (PET!)
						["cost"] = {
							{ "i", 197744, 3 },	-- 3x Hornswog Hunk
							{ "i", 198356, 1 },	-- 1x Honey Snack
						},
					}),
				},
			}),
			n(190892, {	-- Zon'Wogi
				["description"] = createLocalizationString({
					readable = "Give 20x Flash Frozen Meat, 20x Tuskarr Jerky and 20x Gnolan's House Special to Zon'Wogi to get the mount.",
					constant = "GIVE_20X_FLASH_FROZEN_MEAT_20X_TUSKARR_JERKY",
					export = true,
					text = {
						en = "Give 20x Flash Frozen Meat, 20x Tuskarr Jerky and 20x Gnolan's House Special to Zon'Wogi to get the mount.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "将 20 个速冻肉、20 个海象人肉干和 20 个格诺兰的招牌菜交给宗沃吉即可获得坐骑。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 19.0, 24.0, THE_AZURE_SPAN },
				["questID"] = 72278,
				["groups"] = {
					i(201454, {	-- Temperamental Skyclaw (MOUNT!)
						["cost"] = {
							{ "i", 201422, 20 },	-- 20x Flash Frozen Meat
							{ "i", 201421, 20 },	-- 20x Tuskarr Jerky
							{ "i", 201420, 20 },	-- 20x Gnolan's House Special
						},
					}),
				},
			}),
		}),
	}),
})));
