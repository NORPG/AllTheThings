---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(NORTHREND, applyclassicphase(WRATH_PHASE_ONE, {
		m(CRYSTALSONG_FOREST, {
			["lore"] = "Crystalsong Forest is a tranquil forest in the center of Northrend, from which Dalaran floats above. Originally intended to be the site of the Argent Tournament, it is a peaceful zone with hardly any quests.",
			["icon"] = 236735,
			["groups"] = {
				n(ACHIEVEMENTS, {
					ach(1457),	-- Explore Crystalsong Forest
				}),
				battlepets({
					["sym"] = {{"select","speciesID",
						385,	-- Mouse (PET!)
						378,	-- Rabbit (PET!)
						379,	-- Squirrel (PET!)
					}},
				}),
				explorationHeader({
					exploration(4553),	-- Forlorn Woods
					visit_exploration(4554,{coord={73.0,57.4,CRYSTALSONG_FOREST}}),	-- Ruins of Shandaral
					exploration(4558),	-- Sunreaver's Command
					exploration(4555),	-- The Azure Front
					exploration(4552),	-- The Decrepit Flow
					visit_exploration(4549,{coord={9.40,35.2,CRYSTALSONG_FOREST}}),	-- The Great Tree
					visit_exploration(4550,{coord={48.4,56.7,CRYSTALSONG_FOREST}}),	-- The Mirror of Twilight
					visit_exploration(4551,{coord={19.4,27.8,CRYSTALSONG_FOREST}}),	-- The Twilight Rivulet
					exploration(4557),	-- The Unbound Thicket
					exploration(4556),	-- Violet Stand
					exploration(4559),	-- Windrunner's Overlook
				}),
				n(PROFESSIONS, {
					prof(COOKING, {
						i(43148, {	-- Crystalsong Carrot (QI!)
							["provider"] = { "o", 192828 },	-- Crystalsong Carrot
						}),
					}),
				}),
				n(FLIGHT_PATHS, {
					fp(337, {	-- Sunreaver's Command
						["cr"] = 30269,	-- Skymaster Baeric <Dragonhawk Master>
						["coord"] = { 78.4, 50.2, CRYSTALSONG_FOREST },
						["races"] = HORDE_ONLY,
					}),
					fp(336, {	-- Windrunner's Overlook
						["cr"] = 30271,	-- Galendror Whitewing <Hippogryph Master>
						["coord"] = { 72.0, 80.8, CRYSTALSONG_FOREST },
						["races"] = ALLIANCE_ONLY,
					}),
				}),
				petbattles({
					n(66636, {	-- Nearly Headless Jacob <Master Pet Tamer>
						["coord"] = { 50.2, 59.0, CRYSTALSONG_FOREST },
						["description"] = createLocalizationString({
							readable = "Jacob's pets are level 25 of the following consecutive pet classes:\n1. Undead - use Critter (powerful) or Aquatic (tanky) pet.\n2. Undead - see above.\n3. Undead - see above.\n\nFor credit towards 'An Awfully Big Adventure', battle with a composition of Elekk Plushie and two strong pets such as Biletoad (Tongue Lash/Cleansing Rain/Swarm of Flies) and Huge Toad (Tongue Lash/Healing Wave/Swarm of Flies).",
							constant = "JACOB_S_PETS_ARE_LEVEL_25_OF_THE_FOLLOWING",
							export = true,
							text = {
								en = "Jacob's pets are level 25 of the following consecutive pet classes:\n1. Undead - use Critter (powerful) or Aquatic (tanky) pet.\n2. Undead - see above.\n3. Undead - see above.\n\nFor credit towards 'An Awfully Big Adventure', battle with a composition of Elekk Plushie and two strong pets such as Biletoad (Tongue Lash/Cleansing Rain/Swarm of Flies) and Huge Toad (Tongue Lash/Healing Wave/Swarm of Flies).",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "Jacob 的宠物都是 25 级，且属于以下连续的宠物类型：\n1. 亡灵 - 使用小动物（高伤害）或水栖（耐打）宠物。\n2. 亡灵 - 参见上文。\n3. 亡灵 - 参见上文。\n\n要获得“一次了不起的大冒险”的进度，请使用雷象毛绒玩具和两只强力宠物组队作战，例如胆汁蟾蜍（舌鞭/净化之雨/蝇群）和巨型蟾蜍（舌鞭/治疗波/蝇群）。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { ADDED_5_0_4 },
						["petBattleLvl"] = 25,
						["groups"] = {
							q(31932, {	-- Nearly Headless Jacob
								["sourceAchievement"] = 6605,	-- Taming Northrend
								["timeline"] = { ADDED_5_0_4 },
								["isDaily"] = true,
							}),
						},
					}),
				}),
				n(SPECIAL, {
					applyclassicphase(WRATH_PHASE_TWO, i(45000, {	-- Winter Hyacinth
						["description"] = createLocalizationString({
							readable = "Can be found beneath the Ironwall Dam seperating Icecrown from Crystalsong Forest.",
							constant = "CAN_BE_FOUND_BENEATH_THE_IRONWALL_DAM",
							export = true,
							text = {
								en = "Can be found beneath the Ironwall Dam seperating Icecrown from Crystalsong Forest.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可在分隔冰冠冰川与晶歌森林的铁墙水坝下方找到。",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "o", 194213 },	-- Winter Hyacinth
						["coords"] = {
							{ 18.5, 15.7, CRYSTALSONG_FOREST },
							{ 71.0, 73.8, ICECROWN },
						},
						["_allowObjectProvider"] = true,
					})),
				}),
				n(ZONE_DROPS, {
					applyclassicphase(WRATH_PHASE_TWO, i(45005, {	-- Everburning Ember
						["coord"] = { 55.6, 75.0, CRYSTALSONG_FOREST },
						["cr"] = 33289,	-- Lord Everblaze
					})),
					applyclassicphase(WRATH_PHASE_TWO, i(45080, {	-- Large Femur
						["coord"] = { 37.6, 57.8, CRYSTALSONG_FOREST },
						["cr"] = 33499,	-- Skeletal Woodcutter
					})),
				}),
			},
		}),
	})),
});
