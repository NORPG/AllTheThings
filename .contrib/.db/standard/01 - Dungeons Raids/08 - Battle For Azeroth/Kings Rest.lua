-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

local InRetailSeason
-- #IF AFTER 12.1
InRetailSeason = {	-- MID S2
	DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS,
	DIFFICULTY.DUNGEON.MYTHIC,
}
-- #ENDIF

root(ROOTS.Instances, expansion(EXPANSION.BFA, bubbleDown({ ["timeline"] = { ADDED_8_0_1_LAUNCH } }, {
	inst(1041, {	-- Kings' Rest
		InRetailSeason=InRetailSeason,
		["coord"] = { 37.6, 39.4, ZULDAZAR },
		["maps"] = {
			1004,	-- Kings' Rest
		},
		["lvl"] = 120,
		["groups"] = {
			n(WORLD_QUESTS, {
				q(51502, {	-- King's Rest: Kingsguard
					["isWorldQuest"] = true,
					["lvl"] = 120,
				}),
				q(51501, {	-- King's Rest: Malfunction Junction
					["isWorldQuest"] = true,
					["lvl"] = 120,
				}),
				q(51500, {	-- King's Rest: The Weaponmaster Walks Again
					["isWorldQuest"] = true,
					["lvl"] = 120,
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS, {
				e(2165, {	-- The Golden Serpent
					["crs"] = { 135322 },	-- The Golden Serpent
					["groups"] = {
						i(159137),	-- Gilded Serpent's Tooth
						i(159413),	-- Gauntlets of the Avian Sentinel
						i(159369),	-- Belt of the Consecrateed Tomb
						i(159313),	-- Breechees of the Sacred Hall
						i(159234),	-- Down-Lined Breeches
						i(159412),	-- Auric Puddle Stompers
						i(159304),	-- Goldfeather Boots
						i(159617),	-- Lustrous Golden Plumage
						i(168168, {	-- Gilded Plume
							["sourceQuest"] = 49882,	-- A Test of Quills (might require actually learning Recipe 256301)
						}),
					},
				}),
				e(2171, {	-- Mchimba the Embalmer
					["crs"] = { 134993 },	-- Mchimba the Embalmer
					["groups"] = {
						i(159642),	-- Royal Purifier's Spaade
						i(159667),	-- Vessel of Last Rites
						i(159409),	-- Embalmer's Steadying Bracers
						i(159312),	-- Desiccator's Blessed Gloves
						i(160213),	-- Sepulchral Construct's Gloves
						i(159459),	-- Ritual Binder's Ring
						i(159618),	-- Mchimba's Ritual Bandages
					},
				}),
				e(2170, {	-- The Council of Tribes
					["crs"] = {
						135470,	-- Aka'ali  the Conqueror
						135475,	-- Kula the Butcher
						135472,	-- Zanazal the Wise
					},
					["groups"] = {
						i(160216),	-- Crackling Jade Kilij
						i(159136),	-- Jeweled Dagger of Subjugation
						i(159643),	-- Crossbow of Forgotten Majesty
						i(159288),	-- Cloak of the Restless Tribes
						i(159300),	-- Kula's Butchering Wristwraps
						i(159418),	-- Girdle of Pestilent Purification
						i(159371),	-- Boots of the Headlong Conqueror
						i(159243),	-- Sandals of Wise Voodoo
					},
				}),
				e(2172, {	-- Dazar, The First King
					["crs"] = { 136160 },	-- King Dazar <The First>
					["groups"] = {
						ach(12848),	-- Kings' Rest
						i(159644),	-- Geti'ikku, Cut of Death
						i(159645),	-- Headcracker of Supplication
						i(159236),	-- Headdress of the First Empire
						i(159422),	-- Helm of the Raptor King
						i(158344),	-- Mantle of Ceremonial Ascension
						i(159423),	-- Pauldrons of the Great Unifier
						i(159368),	-- Spaulders of Prime Emperor
						i(158355),	-- Loa-Blessed Chestguard
						i(159303),	-- Vest of Reverent Adoration
						i(159301),	-- Primal Dinomancer's Belt
						i(168129),	-- Essence of the Troll Dynasty
						i(273649, {	["timeline"] = { ADDED_12_1_0 } }),	-- Stormbound Emblem of Dazar
						i(278245, {	["timeline"] = { ADDED_12_1_0 } }),	-- Royal Attendant's Coffin (DECOR!)
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MYTHIC, {
				["difficulties"] = { DIFFICULTY.DUNGEON.KEYSTONE, DIFFICULTY.DUNGEON.MYTHIC },
				["groups"] = {
					ach(12722, {	-- It Belongs in a Mausoleum!
						crit(41269, {	-- First trinket found
							["description"] = createLocalizationString({
								readable = "The first trinket is in the first room, on the pedestal in the center of the room.",
								constant = "THE_FIRST_TRINKET_IS_IN_THE_FIRST_ROOM_ON_THE",
								export = true,
								text = {
									en = "The first trinket is in the first room, on the pedestal in the center of the room.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "第一件饰品在第一个房间里，位于房间中央的基座上。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(41270, {	-- Second trinket found
							["description"] = createLocalizationString({
								readable = "The trinket is located on the inside of the stairwell that leads up to the closed door in the room that is next to the pedestal for the rejected serpent followers.",
								constant = "THE_TRINKET_IS_LOCATED_ON_THE_INSIDE_OF_THE",
								export = true,
								text = {
									en = "The trinket is located on the inside of the stairwell that leads up to the closed door in the room that is next to the pedestal for the rejected serpent followers.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "这件饰品位于通往紧闭房门的楼梯井内侧，那个房间紧邻被遗弃的蛇类追随者的基座。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(41271, {	-- Third trinket found
							["description"] = createLocalizationString({
								readable = "At 44.2 / 32.6, the brute slams the ground and knocks you up. The trinket is on the ledge.",
								constant = "AT_44_2_32_6_THE_BRUTE_SLAMS_THE_GROUND_AND",
								export = true,
								text = {
									en = "At 44.2 / 32.6, the brute slams the ground and knocks you up. The trinket is on the ledge.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在 44.2 / 32.6 处，蛮兵猛击地面并将你击飞。饰品在岩架上。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(41272, {	-- Fourth trinket found
							["description"] = createLocalizationString({
								readable = "It is on the right pillar after coming down the stairs to the final boss.",
								constant = "IT_IS_ON_THE_RIGHT_PILLAR_AFTER_COMING_DOWN_THE",
								export = true,
								text = {
									en = "It is on the right pillar after coming down the stairs to the final boss.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在走下通往最终首领的楼梯后，位于右侧的柱子上。",
									-- TODO: tw = "",
								},
							}),
						}),
					}),
					e(2171, {	-- Mchimba the Embalmer
						["crs"] = { 134993 },	-- Mchimba the Embalmer
						["groups"] = {
							ach(12721),	-- Wrap God
						},
					}),
					e(2172, {	-- Dazar, The First King
						["crs"] = { 136160 },	-- King Dazar <The First>
						["groups"] = {
							ach(12848),	-- Kings' Rest
							ach(13008),	-- Kings' Rest Guild Run
							ach(12723, {	-- How to Keep a Mummy
								["description"] = createLocalizationString({
									readable = "On the final boss, there are two sarcophagi with 2 greenish stones in front of them. Simply pull the boss and have 1 party member stand on each stone. Lights will start filling up around the bottom. When they are full, it locks in and the rightmost sarcophagus will begin to shake. Simply kill the boss at this point and Miimii is yours!",
									constant = "ON_THE_FINAL_BOSS_THERE_ARE_TWO_SARCOPHAGI_WITH",
									export = true,
									text = {
										en = "On the final boss, there are two sarcophagi with 2 greenish stones in front of them. Simply pull the boss and have 1 party member stand on each stone. Lights will start filling up around the bottom. When they are full, it locks in and the rightmost sarcophagus will begin to shake. Simply kill the boss at this point and Miimii is yours!",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "在最终首领处，有两个石棺，前方各有 2 块发绿的石头。只需开怪并让 1 名队员站在每块石头上。底部周围的光会开始充能。充满后就会锁定，最右侧的石棺会开始晃动。此时只需击杀首领，咪咪就归你了！",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									i(161214),	-- Miimii (PET!)
								},
							}),
							i(159921),	-- Tomb Stalker (MOUNT!)
						},
					}),
				},
			}),
		},
	}),
})));
