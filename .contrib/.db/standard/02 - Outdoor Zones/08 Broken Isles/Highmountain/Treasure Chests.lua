---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(HIGHMOUNTAIN, {
			n(TREASURES, {
				i(131811, {	-- Rocfeather Skyhorn Kite (TOY!)
					["cost"] = {
						{ "i", 131809, 1 },	-- Gleaming Roc Feather
						{ "i", 131927, 1 },	-- Shimmering Roc Feather
						{ "i", 131926, 1 },	-- Delicate Roc Feather
						{ "i", 131810, 1 },	-- Derelict Skyhorn Kite
					},
				}),
				o(243798, {	-- A Steamy Jewelry Box
					["questID"] = 39531,
					["coord"] = { 63.5, 59.3, 750 },
					["groups"] = {
						i(141322),	-- Shiny Silver Necklace
					},
				}),
				n(95958, {	-- Floating Treasure
					["description"] = createLocalizationString({
						readable = "Can be found floating down the river.",
						constant = "CAN_BE_FOUND_FLOATING_DOWN_THE_RIVER",
						export = true,
						text = {
							en = "Can be found floating down the river.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "可发现其顺流漂浮而下。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 39494,
					["coord"] = { 39.2, 47.8, HIGHMOUNTAIN },
				}),
				o(243698, {	-- Glimmering Treasure Chest
					["questID"] = 39471,
					["coord"] = { 51.2, 53.0, HIGHMOUNTAIN },
				}),
				o(245536, {	-- Glimmering Treasure Chest
					["questID"] = 40482,
					["coord"] = { 46.7, 28.1, HIGHMOUNTAIN },
				}),
				o(245537, {	-- Glimmering Treasure Chest
					["questID"] = 40483,
					["coord"] = { 54.2, 41.6, HIGHMOUNTAIN },
				}),
				o(245530, {	-- Glimmering Treasure Chest
					["description"] = createLocalizationString({
						readable = "Inside Lifespring Cavern. Cave entrance is at |cFFFFFFFF38.3, 61.2|r.",
						constant = "INSIDE_LIFESPRING_CAVERN_CAVE_ENTRANCE_IS_AT",
						export = true,
						text = {
							en = "Inside Lifespring Cavern. Cave entrance is at |cFFFFFFFF38.3, 61.2|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在生命之泉洞穴内。洞穴入口位于 |cFFFFFFFF38.3, 61.2|r。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 40476,
					["coord"] = { 52.9, 23.3, 655 },	-- Lifespring Lower Cavern
				}),
				o(251124, {	-- Glimmering Treasure Chest
					["description"] = createLocalizationString({
						readable = "On a ledge inside Neltharion's Vault. Use a teleporter or flying mount to reach it, then click the brazier. The chest will spawn after waves of enemies are defeated.",
						constant = "ON_A_LEDGE_INSIDE_NELTHARION_S_VAULT_USE_A",
						export = true,
						text = {
							en = "On a ledge inside Neltharion's Vault. Use a teleporter or flying mount to reach it, then click the brazier. The chest will spawn after waves of enemies are defeated.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在奈萨里奥宝库内的一处岩架上。使用传送器或飞行坐骑到达，然后点击火盆。击败数波敌人后宝箱会刷新。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 39606,
					["coord"] = { 59.6, 40.9, 657 },	-- Path of Huln
				}),
				o(257290, {	-- Highmountain Clan Chest
					["description"] = createLocalizationString({
						readable = "These repeatable chests spawn all over the map in Highmountain.",
						constant = "THESE_REPEATABLE_CHESTS_SPAWN_ALL_OVER_THE_MAP_2",
						export = true,
						text = {
							en = "These repeatable chests spawn all over the map in Highmountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这些可重复开启的箱子会在至高岭的地图各处刷新。",
							-- TODO: tw = "",
						},
					})
				}),
				o(245525, {	-- Small Treasure Chest
					["questID"] = 40472,
					["coord"] = { 50.6, 75.4, 750 },
				}),
				o(245529, {	-- Small Treasure Chest
					["questID"] = 40475,
					["coord"] = { 32.3, 41.8, 750 },
				}),
				o(245534, {	-- Small Treasure Chest
					["questID"] = 40480,
					["coord"] = { 42.5, 35.0, HIGHMOUNTAIN },
				}),
				o(245535, {	-- Small Treasure Chest
					["questID"] = 40481,
					["coord"] = { 45.5, 34.6, HIGHMOUNTAIN },
				}),
				o(245538, {	-- Small Treasure Chest
					["questID"] = 40484,
					["coord"] = { 53.4, 43.5, HIGHMOUNTAIN },
				}),
				o(245541, {	-- Small Treasure Chest
					["questID"] = 40487,
					["coord"] = { 55.1, 49.7, HIGHMOUNTAIN },
				}),
				o(245545, {	-- Small Treasure Chest
					["questID"] = 40491,
					["coord"] = { 13.7, 55.3, 750 },
				}),
				o(245547, {	-- Small Treasure Chest
					["questID"] = 40493,
					["coord"] = { 53.0, 52.2, HIGHMOUNTAIN },
				}),
				o(245551, {	-- Small Treasure Chest
					["questID"] = 40497,
					["coord"] = { 50.2, 38.6, HIGHMOUNTAIN },
				}),
				o(245554, {	-- Small Treasure Chest
					["questID"] = 40499,
					["coord"] = { 53.1, 39.5, HIGHMOUNTAIN },
				}),
				o(245555, {	-- Small Treasure Chest
					["questID"] = 40500,
					["coord"] = { 53.4, 48.7, HIGHMOUNTAIN },
				}),
				o(245580, {	-- Small Treasure Chest
					["questID"] = 40506,
					["coord"] = { 50.8, 35.0, HIGHMOUNTAIN },
				}),
				o(245581, {	-- Small Treasure Chest
					["questID"] = 40507,
					["coord"] = { 46.8, 40.1, HIGHMOUNTAIN },
				}),
				o(245601, {	-- Small Treasure Chest
					["questID"] = 40508,
					["coord"] = { 60.5, 54.7, 657 },	-- Path of Huln
				}),
				o(245603, {	-- Small Treasure Chest
					["questID"] = 40510,
					["coord"] = { 43.7, 72.7, HIGHMOUNTAIN },
				}),
				o(255828, {	-- Small Treasure Chest
					["description"] = "~L.IN_AN_UNDERWATER_CAVE",
					["questID"] = 44279,
					["coord"] = { 45.2, 27.4, HIGHMOUNTAIN },
				}),
				o(255829, {	-- Small Treasure Chest
					["questID"] = 44280,
					["coord"] = { 46.4, 21.6, HIGHMOUNTAIN },
				}),
				o(244429, {	-- Totally Safe Treasure Chest
					["coord"] = { 52.3, 51.4, HIGHMOUNTAIN },
					["groups"] = {
						n(97102, {	-- Ram'Pag <The Treasure Worm>
							["questID"] = 40610,
							["groups"] = {
								o(244446, {	-- Actually Safe Treasure Chest
									["questID"] = 39766,
									["isDaily"] = true,
								}),
							},
						}),
					},
				}),
				o(243688, {	-- Treasure Chest
					["questID"] = 39466,
					["coord"] = { 49.6, 37.7, HIGHMOUNTAIN },
					["groups"] = { i(131927) },	-- Shimmering Roc Feather
				}),
				o(265526, {	-- Treasure Chest
					["coord"] = { 39.0, 54.5, HIGHMOUNTAIN },
					["questID"] = 44731,
				}),
				o(250541, {	-- Treasure Chest
					["coord"] = { 52.5, 66.5, HIGHMOUNTAIN },
					["questID"] = 42453,
				}),
				o(243773, {	-- Treasure Chest
					["questID"] = 39503,
					["coord"] = { 47.6, 44.0, HIGHMOUNTAIN },
					["groups"] = { i(131926) },	-- Delicate Roc Feather
				}),
				o(245548, {	-- Treasure Chest
					["description"] = createLocalizationString({
						readable = "Inside Mucksnout Den. Cave entrance is at |cFFFFFFFF41.6, 46.9|r.",
						constant = "INSIDE_MUCKSNOUT_DEN_CAVE_ENTRANCE_IS_AT",
						export = true,
						text = {
							en = "Inside Mucksnout Den. Cave entrance is at |cFFFFFFFF41.6, 46.9|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在泥鼻窝穴内。洞穴入口位于 |cFFFFFFFF41.6, 46.9|r。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 40494,
					["coord"] = { 60.7, 25.2, 654 },	-- Mucksnout Den
				}),
				o(244494, {	-- Treasure Chest
					["questID"] = 39812,
					["coord"] = { 39.5, 57.4, HIGHMOUNTAIN },
				}),
				o(244519, {	-- Treasure Chest
					["questID"] = 39824,
					["coord"] = { 53.5, 51.0, HIGHMOUNTAIN },
					["groups"] = { i(131810) },	-- Derelict Skyhorn Kite
				}),
				o(245524, {	-- Treasure Chest
					["questID"] = 40471,
					["coord"] = { 63.0, 67.9, 652 },
				}),
				o(245527, {	-- Treasure Chest
					["questID"] = 40473,
					["coord"] = { 39.3, 76.3, HIGHMOUNTAIN },
					["description"] = createLocalizationString({
						readable = "There is a phasing issue with this chest- you have to stand behind the totem on the right side of the chest and click from the rock. It's a bit tricky. If your zone is Riverbend, the chest will disappear- you want Highmountain.",
						constant = "THERE_IS_A_PHASING_ISSUE_WITH_THIS_CHEST_YOU",
						export = true,
						text = {
							en = "There is a phasing issue with this chest- you have to stand behind the totem on the right side of the chest and click from the rock. It's a bit tricky. If your zone is Riverbend, the chest will disappear- you want Highmountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这个箱子存在相位问题——你必须站在箱子右侧图腾的后面，从岩石上点击。有点棘手。如果你的区域是河湾，箱子会消失——你需要的是至高岭。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(245528, {	-- Treasure Chest
					["questID"] = 40474,
					["coord"] = { 39.4, 62.3, HIGHMOUNTAIN },
				}),
				o(245531, {	-- Treasure Chest
					["questID"] = 40477,
					["coord"] = { 37.3, 33.8, HIGHMOUNTAIN },
				}),
				o(245532, {	-- Treasure Chest
					["questID"] = 40478,
					["coord"] = { 36.1, 72.4, 659 },
				}),
				o(245533, {	-- Treasure Chest
					["questID"] = 40479,
					["coord"] = { 42.2, 27.3, HIGHMOUNTAIN },
				}),
				o(245542, {	-- Treasure Chest
					["questID"] = 40488,
					["coord"] = { 36.6, 62.1, HIGHMOUNTAIN },
				}),
				o(245550, {	-- Treasure Chest
					["questID"] = 40496,
					["coord"] = { 51.0, 36.5, HIGHMOUNTAIN },
				}),
				o(245553, {	-- Treasure Chest
					["questID"] = 40498,
					["coord"] = { 51.0, 38.8, HIGHMOUNTAIN },
				}),
				o(245579, {	-- Treasure Chest
					["questID"] = 40505,
					["coord"] = { 52.0, 32.4, HIGHMOUNTAIN },
				}),
				o(245602, {	-- Treasure Chest
					["questID"] = 40509,
					["coord"] = { 40.3, 50.0, 657 },	-- Path of Huln
				}),
				o(245543, {	-- Treasure Chest
					["description"] = createLocalizationString({
						readable = "On the upper level of Bitestone Enclave, all the way at the back. Cave entrance is at |cFFFFFFFF41, 73|r.",
						constant = "ON_THE_UPPER_LEVEL_OF_BITESTONE_ENCLAVE_ALL_THE",
						export = true,
						text = {
							en = "On the upper level of Bitestone Enclave, all the way at the back. Cave entrance is at |cFFFFFFFF41, 73|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在石咬飞地的最上层，一直走到最里面。洞穴入口位于 |cFFFFFFFF41, 73|r。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 40489,
					["coord"] = { 85.2, 38.2, 651 },	-- Bitestone Enclave
				}),
				o(257978, {	-- Treasure Chest
					["questID"] = 44352,
					["coord"] = { 32.2, 38.4, 750 },
					["description"] = createLocalizationString({
						readable = "In an underwater cave. Entrance is below the boat with another treasure on it.",
						constant = "IN_AN_UNDERWATER_CAVE_ENTRANCE_IS_BELOW_THE",
						export = true,
						text = {
							en = "In an underwater cave. Entrance is below the boat with another treasure on it.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在水下洞穴中。入口位于那艘上面放着另一件宝藏的船下方。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(253994, {	-- Seemingly Unguarded Treasure
					["coord"] = { 52.7, 58.3, HIGHMOUNTAIN },
				}),
			}),
		}),
	}),
});

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3 } }, {
	m(BROKEN_ISLES, {
		m(HIGHMOUNTAIN, {
			n(TREASURES, {
				q(40601),	-- 7.0 Highmountain - Vignette - Pinerock Basin - Highmountain Beastmaster See Treasure (JLW) - looting treasure after Arru
				q(40389),	-- creating Rocfeather Skyhorn Kite
			}),
		}),
	}),
})));
