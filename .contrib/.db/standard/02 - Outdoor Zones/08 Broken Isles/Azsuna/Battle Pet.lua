---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(AZSUNA, {
			petbattle(filter(BATTLE_PETS, {
				["sym"] = {{"select","speciesID",
					396,	-- Dusk Spidering (PET!)
					1731,	-- Felspider (PET!)
					478,	-- Forest Moth (PET!)
					464,	-- Grey Moth (PET!)
					647,	-- Grizzly Squirrel (PET!)
					1583,	-- Kelp Scuttler (PET!)
					1587,	-- Royal Moth (PET!)
					1736,	-- Slithering Brownscale (PET!)
				}},
				["groups"] = {
					pet(1708),	-- Albatross Chick (PET!)
					pet(706),	-- Bandicoon (PET!)
					pet(1914),	-- Coastal Sandpiper (PET!)
					pet(1774, {	-- Eldritch Manafiend (PET!)
						["description"] = createLocalizationString({
							readable = "This pet can only spawn during the night between 6:30pm to 6:30am PST(US)/CEST(EU)/AEST(OCE).",
							constant = "THIS_PET_CAN_ONLY_SPAWN_DURING_THE_NIGHT",
							export = true,
							text = {
								en = "This pet can only spawn during the night between 6:30pm to 6:30am PST(US)/CEST(EU)/AEST(OCE).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此宠物只能在夜间刷新，时间为太平洋时间（美服）/中欧夏令时（欧服）/澳大利亚东部时间（大洋洲服）下午 6:30 至次日上午 6:30。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(1773, {	-- Erudite Manafiend (PET!)
						["description"] = createLocalizationString({
							readable = "This pet can only spawn during the day between 6:30am to 6:30pm PST(US)/CEST(EU)/AEST(OCE).",
							constant = "THIS_PET_CAN_ONLY_SPAWN_DURING_THE_DAY_BETWEEN",
							export = true,
							text = {
								en = "This pet can only spawn during the day between 6:30am to 6:30pm PST(US)/CEST(EU)/AEST(OCE).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此宠物只能在白天刷新，时间为太平洋时间（美服）/中欧夏令时（欧服）/澳大利亚东部时间（大洋洲服）上午 6:30 至下午 6:30。",
								-- TODO: tw = "",
							},
						}),
					}),
					pet(1709, {	-- Fledgling Kingfeather (PET!)
						["coord"] = { 44.4, 23.6, AZSUNA },
					}),
					pet(1710, {	-- Fledgling Oliveback (PET!)
						["coord"] = { 44.4, 23.6, AZSUNA },
					}),
					pet(699, {	-- Jumping Spider (PET!)
						["coord"] = { 48.4, 22.8, AZSUNA },
					}),
					pet(1728, {	-- Juvenile Scuttleback (PET!)
						["coords"] = {
							{ 61.8, 61.6, AZSUNA },
							{ 55.8, 59.0, AZSUNA },
							{ 31.2, 30.6, AZSUNA },
						},
					}),
					pet(1729),	-- Olivetail Hare (PET!)
					pet(743, {	-- Rapana Whelk (PET!)
						["coords"] = {
							{ 45.0, 56.2, AZSUNA },
							{ 50.2, 49.2, AZSUNA },
							{ 57.0, 59.0, AZSUNA },
						},
					}),
					pet(1935, {	-- Squirky (PET!)
						["description"] = createLocalizationString({
							readable = "Found at the given coord on Seabreak Isle.",
							constant = "FOUND_AT_THE_GIVEN_COORD_ON_SEABREAK_ISLE",
							export = true,
							text = {
								en = "Found at the given coord on Seabreak Isle.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于破海岛的指定坐标处。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 20.0, 21.8, AZSUNA },
						["timeline"] = { ADDED_7_1_0 },
					}),
					header(HEADERS.NPC, 115787, bubbleDownSelf({ ["timeline"] = { ADDED_7_1_0 } }, {	-- Bloodgazer Hatchling
						["description"] = createLocalizationString({
							readable = "1. Buy Azsunian Grapes from Nalysse Dawnsorrow in Azsuna.\n2. Kill Bloodgazer Matriarch.\n3. /target Orphaned Bloodgazer\n4. Feed Orphaned Bloodgazer Azsunian Grapes.\n5. Enjoy new Bloodgazer Hatchling! Do one quest each day for a mount!|r",
							constant = "1_BUY_AZSUNIAN_GRAPES_FROM_NALYSSE_DAWNSORROW",
							export = true,
							text = {
								en = "1. Buy Azsunian Grapes from Nalysse Dawnsorrow in Azsuna.\n2. Kill Bloodgazer Matriarch.\n3. /target Orphaned Bloodgazer\n4. Feed Orphaned Bloodgazer Azsunian Grapes.\n5. Enjoy new Bloodgazer Hatchling! Do one quest each day for a mount!|r",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "1. 在阿苏纳向娜莉丝·晨悲购买阿苏纳葡萄。\n2. 杀死血眼母鹰。\n3. /target 孤雏血眼鹰\n4. 用阿苏纳葡萄喂食孤雏血眼鹰。\n5. 享受新的血眼雏鹰！每天完成一个任务即可获得坐骑！|r",
								-- TODO: tw = "",
							},
						}),
						["crs"] = { 115741 },	-- Orphaned Bloodgazer
						["groups"] = {
							pet(1977),	-- Bloodgazer Hatchling (PET!)
							q(44998, {	-- Allies in Azsuna
								["sourceQuest"] = 44996,	-- Hunting Lesson: Erudite Manafiend
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45008, {	-- Bloodgazer Bonding
								["sourceQuest"] = 45006,	-- The Unfavorable Faction
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
								["groups"] = {
									i(142494),	-- Purple Blossom (TOY!)
								},
							}),
							q(45020, {	-- Bloodgazer Reunion
								["sourceQuest"] = 45018,	-- Bloodgazer Team Rumble
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
								["groups"] = {
									i(137577),	-- Predatory Bloodgazer (MOUNT!)
								},
							}),
							q(45018, {	-- Bloodgazer Team Rumble
								["sourceQuest"] = 45016,	-- Teamwork Lesson: Skorpyron
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45000, {	-- Bloodgazer Team Up
								["sourceQuest"] = 44998,	-- Allies in Azsuna
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45002, {	-- Dangerous Prey
								["sourceQuest"] = 45000,	-- Bloodgazer Team Up
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(44996, {	-- Hunting Lesson: Erudite Manafiend
								["sourceQuests"] = {
									44993,	-- The Smell of Blood Elves
									44991,	-- The Smell of Draenei
								},
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45014, {	-- Hunting Lesson: Felspider
								["sourceQuest"] = 45012,	-- Teamwork Lesson: Serpentrix
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45004, {	-- Hunting Lesson: Fledgling Kingfeather
								["sourceQuest"] = 45002,	-- Dangerous Prey
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45010, {	-- Hunting Lesson: Juvenile Scuttleback
								["sourceQuest"] = 45008,	-- Bloodgazer Bonding
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(44990, {	-- Raising Your Bloodgazer
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45012, {	-- Teamwork Lesson: Serpentrix
								["sourceQuest"] = 45010,	-- Hunting Lesson: Juvenile Scuttleback
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
							q(45016, {	-- Teamwork Lesson: Skorpyron
								["sourceQuest"] = 45014,	-- Hunting Lesson: Felspider
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
								["_drop"] = { "g" },	-- Drop Ultimate Battle-Training Stone
							}),
							q(44991, {	-- The Smell of Draenei
								["sourceQuest"] = 44990,	-- Raising Your Bloodgazer
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
								["races"] = ALLIANCE_ONLY,
							}),
							q(44993, {	-- The Smell of Blood Elves
								["sourceQuest"] = 44990,	-- Raising Your Bloodgazer
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
								["races"] = HORDE_ONLY,
							}),
							q(45006, {	-- The Unfavorable Faction
								["sourceQuest"] = 45004,	-- Hunting Lesson: Fledgling Kingfeather
								["provider"] = { "n", 115787 },	-- Bloodgazer Hatchling
							}),
						},
					})),
				},
			})),
		}),
	}),
});
