-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.LEGION, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	inst(767, {	-- Neltharion's Lair
		["mapID"] = 731,
		["coord"] = { 49.5, 68.5, HIGHMOUNTAIN },
		["lvl"] = 98,
		["groups"] = {
			n(ACHIEVEMENTS, {
				ach(10996, {	-- Got to Ketchum All
					["description"] = createLocalizationString({
						readable = "As soon as you jump into the hole at the start of the dungeon, follow the cliff's path near |cFFFFD700Spiritwalker Ebonhorn|r to a hidden grotto and buy a |cFFFFD700Ketchum Tablet|r from the |cFFFFD700Mushroom Merchant|r.",
						constant = "AS_SOON_AS_YOU_JUMP_INTO_THE_HOLE_AT_THE_START",
						export = true,
						text = {
							en = "As soon as you jump into the hole at the start of the dungeon, follow the cliff's path near |cFFFFD700Spiritwalker Ebonhorn|r to a hidden grotto and buy a |cFFFFD700Ketchum Tablet|r from the |cFFFFD700Mushroom Merchant|r.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "刚跳进副本入口处的洞后，沿着 |cFFFFD700灵魂行者黑角|r 附近的崖壁小径走到一处隐蔽的洞穴，从 |cFFFFD700蘑菇商人|r 处购买 |cFFFFD700凯彻姆石板|r。",
							-- TODO: tw = "",
						},
					}),
					["crs"] = { 111746	},	-- Mushroom Merchant
					["provider"] = { "i", 140212 },	-- Ketchum Tablet
					["groups"] = {
						crit(31787, {	-- Sparky's imprint collected
							["provider"] = { "n", 111882 },	-- Sparky
							["description"] = createLocalizationString({
								readable = "Dive right where the barrel ride ends and find a pathway to a somewhat hidden cave where the snail is located at.",
								constant = "DIVE_RIGHT_WHERE_THE_BARREL_RIDE_ENDS_AND_FIND",
								export = true,
								text = {
									en = "Dive right where the barrel ride ends and find a pathway to a somewhat hidden cave where the snail is located at.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在木桶之旅结束处向右下潜，找到一条通往隐蔽洞穴的路径，蜗牛就在那里。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(31790, {	-- Turbax's imprint collected
							["provider"] = { "n", 105742 },	-- Turbax
							["description"] = createLocalizationString({
								readable = "Racing around a stone pillar after killing Ularogg Cragshaper.",
								constant = "RACING_AROUND_A_STONE_PILLAR_AFTER_KILLING",
								export = true,
								text = {
									en = "Racing around a stone pillar after killing Ularogg Cragshaper.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "击杀乌拉罗格·塑岩者后围绕石柱竞速。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(31791, {	-- Whipsnap's imprint collected
							["provider"] = { "n", 105743 },	-- Whipsnap
							["description"] = "~L.RACING_AROUND_A_STONE_PILLAR_AFTER_KILLING",
						}),
						crit(31792, {	-- Blaze's imprint collected
							["provider"] = { "n", 105744 },	-- Blaze
							["description"] = "~L.RACING_AROUND_A_STONE_PILLAR_AFTER_KILLING",
						}),
						crit(31793, {	-- Slinky's imprint collected
							["provider"] = { "n", 111861 },	-- Slinky
							["description"] = createLocalizationString({
								readable = "Follow the long westward path before Ularogg Cragshaper to a cave. He is usually along the cave's back wall.",
								constant = "FOLLOW_THE_LONG_WESTWARD_PATH_BEFORE_ULAROGG",
								export = true,
								text = {
									en = "Follow the long westward path before Ularogg Cragshaper to a cave. He is usually along the cave's back wall.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在乌拉罗格·塑山之前沿着向西的长路走到一个洞穴。他通常待在洞穴的后壁附近。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(31794, {	-- Sticky's imprint collected
							["provider"] = { "n", 111864 },	-- Sticky
							["description"] = createLocalizationString({
								readable = "Directly after the previous 3 snails. Go into the water with the basalisks and go along the river to the back where there is a cave and more basalisks. Kill all of them and have some one use an ability on Sticky. He is up on top of the cave just chilling out. Once someone attacks him he falls down and you can smack him and claim your achievement.",
								constant = "DIRECTLY_AFTER_THE_PREVIOUS_3_SNAILS_GO_INTO",
								export = true,
								text = {
									en = "Directly after the previous 3 snails. Go into the water with the basalisks and go along the river to the back where there is a cave and more basalisks. Kill all of them and have some one use an ability on Sticky. He is up on top of the cave just chilling out. Once someone attacks him he falls down and you can smack him and claim your achievement.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "就在前 3 只蜗牛之后。和石化蜥蜴一起进入水中，沿河走到尽头，那里有一个洞穴和更多石化蜥蜴。把它们全部杀死，然后让某人对着黏黏使用一个技能。他就在洞穴顶上悠闲待着。一旦有人攻击他，他就会掉下来，你就可以揍他并拿到成就。",
									-- TODO: tw = "",
								},
							}),
						}),
						crit(32888, {	-- Scaly's Imprint Collected
							["provider"] = { "n", 113204 },	-- Scaly
							["description"] = createLocalizationString({
								readable = "After first boss Rokmora, before entering a barrel, use the macro: /tar Scaly and then apply a target icon to him. It sits on a Mushroom on the left river bank and while riding in the barrel, you need to throw the fish at it while riding the barrel to make it fall into the water and come along with you.",
								constant = "AFTER_FIRST_BOSS_ROKMORA_BEFORE_ENTERING_A",
								export = true,
								text = {
									en = "After first boss Rokmora, before entering a barrel, use the macro: /tar Scaly and then apply a target icon to him. It sits on a Mushroom on the left river bank and while riding in the barrel, you need to throw the fish at it while riding the barrel to make it fall into the water and come along with you.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "击败第一个首领罗克莫拉后，在进入木桶之前，使用宏：/tar Scaly，然后给他标记一个目标图标。它停在左岸的一朵蘑菇上，乘坐木桶时，你需要在木桶里把鱼扔向它，让它掉进水里并跟着你走。",
									-- TODO: tw = "",
								},
							}),
						}),
						i(256913, {	-- Tauren Jeweler's Roller (DECOR!)
							["timeline"] = { ADDED_11_2_7 },
						}),
					},
				}),
			}),
			n(QUESTS, {
				q(42454, {	-- The Hammer of Khaz'goroth
					["sourceQuest"] = 39781,	-- Neltharion's Lair: Death to the Underking
					["provider"] = { "o", 250548 },	-- Hammer of Khaz'goroth
					["qi"] = 137649,	-- The Hammer of Khaz'goroth (QI!)
					["groups"] = {
						i(141010),	-- Earthguard Gauntlets
						i(141009),	-- Earthguard Gloves
						i(141008),	-- Earthguard Grips
						i(141007),	-- Earthguard Handwraps
					},
				}),
			}),
			n(VENDORS, {
				n(111746, {	-- Mushroom Merchant
					i(140212),	-- Ketchum Tablet
				}),
			}),
			n(WORLD_QUESTS, {
				q(41866, {	-- Neltharion's Lair: Blighted Bat
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(41864, {	-- Neltharion's Lair: Crystalline Crusher
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(41865, {	-- Neltharion's Lair: Mother of Stone
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(41211, {	-- Neltharion's Lair: Neltharion's Treasure
					["isWorldQuest"] = true,
				}),
				q(41857, {	-- Neltharion's Lair: Stonedark Slaves
					["isWorldQuest"] = true,
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS, {
				cr(91003, e(1662, {	-- Rokmora
					i(205973, {	-- Rod of Crystalline Energies
						["timeline"] = { ADDED_11_0_2 },
					}),
				})),
				cr(91004, e(1665, {	-- Ularogg Cragshaper
				})),
				cr(91005, e(1673, {	-- Naraxas
					i(205974, {	-- Monstrous Gluttony
						["timeline"] = { ADDED_11_0_2 },
					}),
				})),
				cr(91007, e(1687, {	-- Dargrul
					ach(10795),	-- Neltharion's Lair
					i(139466),	-- Bindings of the Windlord (rogue artifact appearance)
					i(137912),	-- Pattern: Battlebound Treads [Rank 3] (RECIPE!)
					i(205975, {	-- Hate-Sculpted Magma
						["timeline"] = { ADDED_11_0_2 },
					}),
					i(245451, {	-- Thunder Totem Brazier (DECOR!)
						["timeline"] = { ADDED_11_2_7 },
					}),
				})),
			}),
			n(MYTHIC_PLUS, sharedDataSelf({ ["timeline"] = { ADDED_10_1_0, REMOVED_10_2_0 } }, {
				i(205975),	-- Hate-Sculpted Magma
				i(205974),	-- Monstrous Gluttony
				i(205973),	-- Rod of Crystalline Energies
			})),
			d(DIFFICULTY.DUNGEON.NORMAL, {
				cr(91003, e(1662, {	-- Rokmora
					i(134481),	-- Boulderbuckle Strap
					i(137337),	-- Deepfurrow Bracers
					i(139095),	-- Greystone Belt
					i(139105),	-- Rivermane Sandals
					i(134427),	-- Riverride Legwraps
					i(137338),	-- Shard of Rokmora
					i(139121),	-- Skyhorn Mantle
					i(139130),	-- Sunfrost Wristwraps
					i(134491),	-- Understone Gorget
					i(137336),	-- Vest of Rupturing Diamonds
					i(137340),	-- Crystalline Energies
					i(137339),	-- Quivering Blightshard Husk
				})),
				cr(91004, e(1665, {	-- Ularogg Cragshaper
					i(134164),	-- Bitestone Wristwraps
					i(137341),	-- Cragshaper's Fitted Hood
					i(134443),	-- Gravelworn Handguards
					i(134530),	-- Loop of Vitriolic Intent
					i(137342),	-- Rock Solid Legplates
					i(134141),	-- Rockbound Sabatons
					i(134177),	-- Roggthread Mantle
					i(134152),	-- Steelgazer Hide Hood
					i(137344),	-- Talisman of the Cragshaper
					i(137354),	-- Tunic of Screaming Earth
					i(137347),	-- Fragment of Loathing
					i(137346),	-- Murmuring Idol
				})),
				cr(91005, e(1673, {	-- Naraxas
					i(134524),	-- Band of the Wyrm Matron
					i(137348),	-- Gauntlets of Innumerable Barbs
					i(137349),	-- Naraxas' Spiked Tongue
					i(134416),	-- Offal Galoshes
					i(134408),	-- Putrid Carapace
					i(134511),	-- Subterranean Horror Faceguard
					i(134458),	-- Wristbands of Rousing Violence
					i(137350),	-- Monstrous Gluttony
					i(137351),	-- Noxious Entrails
				})),
				cr(91007, e(1687, {	-- Dargrul
					i(134166),	-- Bitestone Boots
					i(134495),	-- Chain of the Underking
					i(137353),	-- Charskin Legguards
					i(134474),	-- Faultline Leggings
					i(134420),	-- Gloves of the Mountain Conquest
					i(137357),	-- Mark of Dargrul
					i(134470),	-- Mountain Throne Coif
					i(134135),	-- Rockbound Chestguard
					i(134171),	-- Roggthread Cord
					i(137355),	-- Rumblestone Guantlets
					i(134455),	-- Sinister Ashfall Cord
					i(134154),	-- Steelgazer Hide Mantle
					i(134517),	-- Tremorguard Pauldrons
					i(137352),	-- Tunic of Smoldering Ire
					i(137358),	-- Hate-Sculpted Magma
					i(137359),	-- Pebble of Ages
				})),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS, {
				cr(91007, e(1687, {	-- Dargrul
					ach(10796),	-- Heroic: Neltharion's Lair
					i(137854),	-- Design: Intrepid Necklace of Prophecy [Rank 3] (RECIPE!)
					i(137864),	-- Design: Shadowruby Band [Rank 2] (RECIPE!)
					i(127928),	-- Recipe: Unbending Potion [Rank 2] (RECIPE!)
				})),
			}),
			d(DIFFICULTY.DUNGEON.HEROIC, {
				["lvl"] = 110,
				["groups"] = {
					cr(91003, e(1662, {	-- Rokmora
						i(134481),	-- Boulderbuckle Strap
						i(137337),	-- Deepfurrow Bracers
						i(139095),	-- Greystone Belt
						i(139105),	-- Rivermane Sandals
						i(134427),	-- Riverride Legwraps
						i(137338),	-- Shard of Rokmora
						i(139121),	-- Skyhorn Mantle
						i(139130),	-- Sunfrost Wristwraps
						i(134491),	-- Understone Gorget
						i(137336),	-- Vest of Rupturing Diamonds
						i(137340),	-- Crystalline Energies
						i(137339),	-- Quivering Blightshard Husk
					})),
					cr(91004, e(1665, {	-- Ularogg Cragshaper
						i(134164),	-- Bitestone Wristwraps
						i(137341),	-- Cragshaper's Fitted Hood
						i(134443),	-- Gravelworn Handguards
						i(134530),	-- Loop of Vitriolic Intent
						i(137342),	-- Rock Solid Legplates
						i(134141),	-- Rockbound Sabatons
						i(134177),	-- Roggthread Mantle
						i(134152),	-- Steelgazer Hide Hood
						i(137344),	-- Talisman of the Cragshaper
						i(137354),	-- Tunic of Screaming Earth
						i(137347),	-- Fragment of Loathing
						i(137346),	-- Murmuring Idol
					})),
					cr(91005, e(1673, {	-- Naraxas
						i(134524),	-- Band of the Wyrm Matron
						i(137348),	-- Gauntlets of Innumerable Barbs
						i(137349),	-- Naraxas' Spiked Tongue
						i(134416),	-- Offal Galoshes
						i(134408),	-- Putrid Carapace
						i(134511),	-- Subterranean Horror Faceguard
						i(134458),	-- Wristbands of Rousing Violence
						i(137350),	-- Monstrous Gluttony
						i(137351),	-- Noxious Entrails
					})),
					cr(91007, e(1687, {	-- Dargrul
						i(134166),	-- Bitestone Boots
						i(134495),	-- Chain of the Underking
						i(137353),	-- Charskin Legguards
						i(134474),	-- Faultline Leggings
						i(134420),	-- Gloves of the Mountain Conquest
						i(137357),	-- Mark of Dargrul
						i(134470),	-- Mountain Throne Coif
						i(134135),	-- Rockbound Chestguard
						i(134171),	-- Roggthread Cord
						i(137355),	-- Rumblestone Guantlets
						i(134455),	-- Sinister Ashfall Cord
						i(134154),	-- Steelgazer Hide Mantle
						i(134517),	-- Tremorguard Pauldrons
						i(137352),	-- Tunic of Smoldering Ire
						i(137358),	-- Hate-Sculpted Magma
						i(137359),	-- Pebble of Ages
					})),
				},
			}),
			d(DIFFICULTY.DUNGEON.MYTHIC, {
				["ItemAppearanceModifierID"] = 0,
				["lvl"] = 110,
				["groups"] = {
					cr(91003, e(1662, {	-- Rokmora
						i(134481),	-- Boulderbuckle Strap
						i(137337),	-- Deepfurrow Bracers
						i(139095),	-- Greystone Belt
						i(139105),	-- Rivermane Sandals
						i(134427),	-- Riverride Legwraps
						i(137338),	-- Shard of Rokmora
						i(139121),	-- Skyhorn Mantle
						i(139130),	-- Sunfrost Wristwraps
						i(134491),	-- Understone Gorget
						i(137336),	-- Vest of Rupturing Diamonds
						i(137340),	-- Crystalline Energies
						i(137339),	-- Quivering Blightshard Husk
					})),
					cr(91004, e(1665, {	-- Ularogg Cragshaper
						i(134164),	-- Bitestone Wristwraps
						i(137341),	-- Cragshaper's Fitted Hood
						i(134443),	-- Gravelworn Handguards
						i(134530),	-- Loop of Vitriolic Intent
						i(137342),	-- Rock Solid Legplates
						i(134141),	-- Rockbound Sabatons
						i(134177),	-- Roggthread Mantle
						i(134152),	-- Steelgazer Hide Hood
						i(137344),	-- Talisman of the Cragshaper
						i(137354),	-- Tunic of Screaming Earth
						i(137347),	-- Fragment of Loathing
						i(137346),	-- Murmuring Idol
					})),
					cr(91005, e(1673, {	-- Naraxas
						ach(10875, {	-- Can't Eat Just One
							["crs"] = { 101075 },	-- Wormspeaker Devout
						}),
						i(134524),	-- Band of the Wyrm Matron
						i(137348),	-- Gauntlets of Innumerable Barbs
						i(137349),	-- Naraxas' Spiked Tongue
						i(134416),	-- Offal Galoshes
						i(134408),	-- Putrid Carapace
						i(134511),	-- Subterranean Horror Faceguard
						i(134458),	-- Wristbands of Rousing Violence
						i(137350),	-- Monstrous Gluttony
						i(137351),	-- Noxious Entrails
					})),
					cr(91007, e(1687, {	-- Dargrul
						ach(10797),	-- Mythic: Neltharion's Lair
						ach(10859),	-- Mythic: Neltharion's Lair Guild Run
						i(134166),	-- Bitestone Boots
						i(134495),	-- Chain of the Underking
						i(137353),	-- Charskin Legguards
						i(134474),	-- Faultline Leggings
						i(134420),	-- Gloves of the Mountain Conquest
						i(137357),	-- Mark of Dargrul
						i(134470),	-- Mountain Throne Coif
						i(134135),	-- Rockbound Chestguard
						i(134171),	-- Roggthread Cord
						i(137355),	-- Rumblestone Guantlets
						i(134455),	-- Sinister Ashfall Cord
						i(134154),	-- Steelgazer Hide Mantle
						i(134517),	-- Tremorguard Pauldrons
						i(137352),	-- Tunic of Smoldering Ire
						i(137358),	-- Hate-Sculpted Magma
						i(137359),	-- Pebble of Ages
					})),
				},
			}),
		},
	}),
})));
