---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_2_0 } }, {
	m(ZERETH_MORTIS, {
		petbattle(filter(BATTLE_PETS, {
			pet(3216, {	-- Ambystan Snapper (PET!)
				["coords"] = {
					{ 35.0, 56.0, ZERETH_MORTIS },
					{ 35.4, 44.2, ZERETH_MORTIS },
					{ 39.2, 33.8, ZERETH_MORTIS },
					{ 39.2, 71.4, ZERETH_MORTIS },
					{ 45.4, 65.0, ZERETH_MORTIS },
					{ 48.0, 73.8, ZERETH_MORTIS },
				},
			}),
			pet(3217, {	-- Aurelid Floater (PET!)
				["description"] = createLocalizationString({
					readable = "Only spawns at these coords, & can be non-combat. Kill and wait for respawns if needed.",
					constant = "ONLY_SPAWNS_AT_THESE_COORDS_CAN_BE_NON_COMBAT",
					export = true,
					text = {
						en = "Only spawns at these coords, & can be non-combat. Kill and wait for respawns if needed.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在这些坐标处刷新，且可能处于非战斗状态。如有需要，击杀并等待重新刷新。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 57.4, 82.3, ZERETH_MORTIS },
					{ 52.4, 75.1, ZERETH_MORTIS },
					{ 64.5, 68.8, ZERETH_MORTIS },
					{ 35.6, 72.1, ZERETH_MORTIS },
				},
			}),
			pet(3212),	-- Bloodsucker Vespoid (PET!)
			pet(3173),	-- Bufonid Croaker (PET!)
			pet(3206, {	-- Emerald Scarabid (PET!)
				["description"] = createLocalizationString({
					readable = "Found in the sand-covered parts of the zone.",
					constant = "FOUND_IN_THE_SAND_COVERED_PARTS_OF_THE_ZONE",
					export = true,
					text = {
						en = "Found in the sand-covered parts of the zone.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "位于该区域被沙覆盖的部分。",
						-- TODO: tw = "",
					},
				}),
			}),
			n(183349, {	-- Agitated Poultrid
				["description"] = createLocalizationString({
					readable = "This npc can spawn around Zereth Mortis where Wild Poultrids are. Do /chicken to start a pet battle.",
					constant = "THIS_NPC_CAN_SPAWN_AROUND_ZERETH_MORTIS_WHERE",
					export = true,
					text = {
						en = "This npc can spawn around Zereth Mortis where Wild Poultrids are. Do /chicken to start a pet battle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此 NPC 会在扎雷殁提斯有野生幼禽出没的地方刷新。输入 /chicken 即可开始宠物对战。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 183286 },	-- Enraged Poultrid
				["coords"] = {
					{ 44.0, 92.0, ZERETH_MORTIS },
					{ 48.0, 81.0, ZERETH_MORTIS },
					{ 31.3, 55.3, ZERETH_MORTIS },
					{ 39.6, 55.5, ZERETH_MORTIS },
					{ 48.7, 95.6, ZERETH_MORTIS },
				},
				["groups"] = {
					pet(3218),	-- Enraged Poultrid (PET!)
				},
			}),
			pet(3210),	-- Green Viperid (PET!)
			pet(3209),	-- King Viperid (PET!)
			pet(3215, {	-- Mawtouched Geomental (PET!)
				["description"] = createLocalizationString({
					readable = "Requires eating a Questionable Mawshroom from Korthia to see.",
					constant = "REQUIRES_EATING_A_QUESTIONABLE_MAWSHROOM_FROM",
					export = true,
					text = {
						en = "Requires eating a Questionable Mawshroom from Korthia to see.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要吃下刻希亚的一个可疑的噬渊蘑菇才能看到。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "i", 187244 },	-- Questionable Mawshroom
				["coords"] = {
					{ 61.4, 73.6, ZERETH_MORTIS },
					{ 61.8, 67.6, ZERETH_MORTIS },
					{ 64.2, 71.0, ZERETH_MORTIS },
				},
			}),
			pet(3205),	-- Metallic Scarabid (PET!)
			pet(3214),	-- Momma Vombata (PET!)
			pet(3219),	-- Predatory Gastropod (PET!)
			pet(3196),	-- Proto Avian Fledgling (PET!)
			pet(3208),	-- Red Viperid (PET!)
			pet(3200,{	-- Scarlet Proto Avian (PET!)
				["description"] = createLocalizationString({
					readable = "Rare spawn of Proto-Avian Fledgling. Best chances are killing critters around the Genesis Vestibule. Good luck!",
					constant = "RARE_SPAWN_OF_PROTO_AVIAN_FLEDGLING_BEST",
					export = true,
					text = {
						en = "Rare spawn of Proto-Avian Fledgling. Best chances are killing critters around the Genesis Vestibule. Good luck!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "原鸟雏鸟的稀有刷新。最佳机会是在创世前厅周围击杀小动物。祝你好运！",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 30.0, 54.0, ZERETH_MORTIS },
			}),
			pet(3203),	-- Tarachnid Ambusher (PET!)
			pet(3202),	-- Tarachnid Stalker (PET!)
			pet(3191),	-- Timid Leporid (PET!)
			pet(3180, {	-- Venomous Bufonid (PET!)
				["coords"] = {
					{ 36.6, 70.6, ZERETH_MORTIS },
					{ 44.8, 58.6, ZERETH_MORTIS },
					{ 47.6, 85.8, ZERETH_MORTIS },
					{ 50.6, 74.6, ZERETH_MORTIS },
					{ 58.2, 82.2, ZERETH_MORTIS },
					{ 60.2, 72.2, ZERETH_MORTIS },
					{ 76.8, 45.4, ZERETH_MORTIS },
					{ 77.2, 51.8, ZERETH_MORTIS },
					{ 77.6, 58.8, ZERETH_MORTIS },
					{ 81.0, 46.0, ZERETH_MORTIS },
				},
			}),
			pet(3190),	-- Vicious Leporid (PET!)
			pet(3213),	-- Vombata Pup (PET!)
		})),
	}),
})));
