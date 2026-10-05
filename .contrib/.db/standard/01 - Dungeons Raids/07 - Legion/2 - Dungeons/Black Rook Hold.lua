-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.LEGION, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	inst(740, {	-- Black Rook Hold
		["coord"] = { 38.4, 50.8, VALSHARAH },
		["maps"] = { 751, 752, 753, 754, 755, 756 },
		["groups"] = {
			n(ACHIEVEMENTS, {
				ach(10709, {	-- You Used to Scrawl Me In Your Fel Tome (automated)
					["description"] = createLocalizationString({
						readable = "These spawn on any difficulty, but you'll only get one per run, making this achievement a six-run minimum.",
						constant = "THESE_SPAWN_ON_ANY_DIFFICULTY_BUT_YOU_LL_ONLY",
						export = true,
						text = {
							en = "These spawn on any difficulty, but you'll only get one per run, making this achievement a six-run minimum.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这些在任何难度下都会刷新，但每次副本只能获得一个，因此这个成就最少需要跑六次。",
							-- TODO: tw = "",
						},
					}),
				}),
			}),
			n(TREASURES, {
				o(252385, {	-- Torn Page
					["description"] = createLocalizationString({
						readable = "Found in the Chamber of War Room immediately after the Amalgam of Souls fight, on a desk by the southern part of the room.",
						constant = "FOUND_IN_THE_CHAMBER_OF_WAR_ROOM_IMMEDIATELY",
						export = true,
						text = {
							en = "Found in the Chamber of War Room immediately after the Amalgam of Souls fight, on a desk by the southern part of the room.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于战争议事厅，就在击败灵魂融合体之后，房间南侧的一张桌子上。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252386, {	-- Worn-Edged Page
					["description"] = createLocalizationString({
						readable = "Found in the Grand Hall, to the left of the broken staircase, by the bookshelves.",
						constant = "FOUND_IN_THE_GRAND_HALL_TO_THE_LEFT_OF_THE",
						export = true,
						text = {
							en = "Found in the Grand Hall, to the left of the broken staircase, by the bookshelves.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于大厅，破损楼梯的左侧，书架旁。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252387, {	-- Dog-Eared Page
					["description"] = createLocalizationString({
						readable = "Found in the Grand Hall, it's in the hallway connecting to the stairwell that takes you to Illysanna Ravencrest, tucked in the back on a desk.",
						constant = "FOUND_IN_THE_GRAND_HALL_IT_S_IN_THE_HALLWAY",
						export = true,
						text = {
							en = "Found in the Grand Hall, it's in the hallway connecting to the stairwell that takes you to Illysanna Ravencrest, tucked in the back on a desk.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于大厅，在通往伊莉萨娜·拉文凯斯所在楼梯间的走廊里，塞在尽头的桌子上。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252388, {	-- Singed Page
					["description"] = createLocalizationString({
						readable = "Found in Ravenshold, the room filled with Wyrmtongue Trickster, on a table by three bookshelves and two weapon racks.",
						constant = "FOUND_IN_RAVENSHOLD_THE_ROOM_FILLED_WITH",
						export = true,
						text = {
							en = "Found in Ravenshold, the room filled with Wyrmtongue Trickster, on a table by three bookshelves and two weapon racks.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于渡鸦堡，那个满是虫语欺诈者的房间里，在三排书架和两个武器架旁的桌子上。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252390, {	-- Ink-Splattered Page
					["description"] = createLocalizationString({
						readable = "Found in Rook's Rise, in the small round room connected to the stairs leading to Lord Ravencrest's Chamber after defeating Smashspite the Hateful.",
						constant = "FOUND_IN_ROOK_S_RISE_IN_THE_SMALL_ROUND_ROOM",
						export = true,
						text = {
							en = "Found in Rook's Rise, in the small round room connected to the stairs leading to Lord Ravencrest's Chamber after defeating Smashspite the Hateful.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于黑鸦高地，在击败憎恨碎击者之后，通往拉文凯斯领主房间的楼梯旁的小圆形房间里。",
							-- TODO: tw = "",
						},
					}),
				}),
				o(252391, {	-- Hastily-Scrawled Page
					["description"] = createLocalizationString({
						readable = "Found in Lord Ravencrest's Chamber on the desk, at the end of the instance.",
						constant = "FOUND_IN_LORD_RAVENCREST_S_CHAMBER_ON_THE_DESK",
						export = true,
						text = {
							en = "Found in Lord Ravencrest's Chamber on the desk, at the end of the instance.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "位于副本尽头的拉文凯斯领主房间内的桌子上。",
							-- TODO: tw = "",
						},
					}),
				}),
			}),
			n(WORLD_QUESTS, {
				q(43711, {	-- Black Rook Hold: ... With Fire!
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(43712, {	-- Black Rook Hold: The Mad Arcanist
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(43642, {	-- Black Rook Hold: The Sorrow
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(43762, {	-- Black Rook Hold: Traitor's Demise
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
				q(43714, {	-- Black Rook Hold: Worst of the Worst
					["isWorldQuest"] = true,
					["lvl"] = 110,
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS, {
				e(1518, {	-- Amalgam of Souls
					["creatureID"] = 98542,	-- Amalgam of Souls
					["groups"] = {
						i(211513, {	-- Howling Echoes
							["timeline"] = { ADDED_11_0_2 },
						}),
					},
				}),
				e(1653, {	-- Illysanna Ravencrest
					["creatureID"] = 98696,	-- Illysanna Ravencrest
					["groups"] = {
						i(211470, {	-- Ravencrest's Wrath
							["timeline"] = { ADDED_11_0_2 },
						}),
					},
				}),
				e(1672, {	-- Lord Kur'talos Ravencrest
					["crs"] = {
						98970,	-- Dantalionax
						98965,	-- Kur'talos Ravencrest
					},
					["groups"] = {
						ach(10804),	-- Black Rook Hold
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS, {
				e(1672, {	-- Lord Kur'talos Ravencrest
					["crs"] = {
						98970,	-- Dantalionax
						98965,	-- Kur'talos Ravencrest
					},
					["groups"] = {
						ach(10805),	-- Heroic: Black Rook Hold
						i(137858),	-- Design: Grim Furystone Gorget [Rank 3] (RECIPE!)
						i(127930),	-- Recipe: Flask of the Whispered Pact [Rank 2] (RECIPE!)
					},
				}),
			}),
			n(MYTHIC_PLUS, sharedDataSelf({ ["timeline"] = { ADDED_10_2_0, REMOVED_10_2_6_SEASON_FOUR } }, {
				i(211513),	-- Howling Echoes
				i(211470),	-- Ravencrest's Wrath
			})),
			d(DIFFICULTY.DUNGEON.NORMAL, {
				e(1518, {	-- Amalgam of Souls
					["creatureID"] = 98542,	-- Amalgam of Souls
					["groups"] = {
						i(136714),	-- Amalgam's Seventh Spine
						i(136976),	-- Etheldrin's Breastplate
						i(134437),	-- Harrowing Soulspun Bracers
						i(134469),	-- Midnight Reaper Handwraps
						i(139242),	-- Raven's Vil Gloves
						i(139246),	-- Ravencourt Formal Robes
						i(139241),	-- Rook Footman's Warboots
						i(139245),	-- Shadow Archer's Spaulders
						i(136977),	-- Shadowfeather Shawl
						i(134442),	-- Tooled Rivermoor Boots
						i(136719),	-- Curdled Soul Essence
						i(137270),	-- Howling Echoes
					},
				}),
				e(1653, {	-- Illysanna Ravencrest
					["creatureID"] = 98696,	-- Illysanna Ravencrest
					["groups"] = {
						i(134412),	-- Cloak of Unwavering Loyalty
						i(136978),	-- Ember of Nullification
						i(134519),	-- Ravencrest Bonecrush Gauntlets
						i(134490),	-- Ring of Contempt
						i(134419),	-- Slippers of Heedless Sacrifice
						i(136724),	-- Soul-Torn Fury Cinch
						i(134440),	-- Soulstarve Hood
						i(136769),	-- Ravencrest's Wrath
						i(136720),	-- Snapped Emerald Pendant
					},
				}),
				e(1664, {	-- Smashspite the Hateful
					["creatureID"] = 98949,	-- Smashspite the Hateful
					["groups"] = {
						i(134528),	-- Band of Callous Dominance
						i(134426),	-- Collar of Raking Claws
						i(134483),	-- Fel-Hammered Greaves
						i(134373),	-- Felbat Leather Vest
						i(134507),	-- Leadfoot Earthshakers
						i(134390),	-- Mardum Chain Vest
						i(134391),	-- Netherwhisper Cinch
						i(134362),	-- Portalguard Wristguard
						i(136979),	-- Shorn Batbrood Cuffs
						i(136715),	-- Spiked Counterweight
						i(136721),	-- Mo'arg Eyepatch
					},
				}),
				e(1672, {	-- Lord Kur'talos Ravencrest
					["crs"] = {
						98970,	-- Dantalionax
						98965,	-- Kur'talos Ravencrest
					},
					["groups"] = {
						i(136716),	-- Caged Horror
						i(136770),	-- Drape of the Raven Lord
						i(134370),	-- Felbat Leather Leggings
						i(134431),	-- Latosius's Blasting Gloves
						i(134384),	-- Madrum Chain Wristclamp
						i(134451),	-- Legguards of Endless Horrors
						i(134394),	-- Netherwhisper Leggings
						i(134510),	-- Pauldrons of Ancient Command
						i(134358),	-- Portalguard Helm
						i(134499),	-- Raven Filigree Pendant
						i(139243),	-- Raven's Veil Belt
						i(139247),	-- Ravencourt Formal Mantle
						i(134477),	-- Ravencrest's Unerring Striders
						i(139240),	-- Rook Footman's Legplates
						i(139244),	-- Shadow Archer's Helm
						i(136717),	-- Absolved Ravencrest Brooch
						i(137272),	-- Cruelty of Dantalionax
						i(136718),	-- Mark of Varo'then
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.HEROIC, {
				["lvl"] = 110,
				["groups"] = {
					e(1518, {	-- Amalgam of Souls
						["creatureID"] = 98542,	-- Amalgam of Souls
						["groups"] = {
							i(136714),	-- Amalgam's Seventh Spine
							i(136976),	-- Etheldrin's Breastplate
							i(134437),	-- Harrowing Soulspun Bracers
							i(134469),	-- Midnight Reaper Handwraps
							i(139242),	-- Raven's Vil Gloves
							i(139246),	-- Ravencourt Formal Robes
							i(139241),	-- Rook Footman's Warboots
							i(139245),	-- Shadow Archer's Spaulders
							i(136977),	-- Shadowfeather Shawl
							i(134442),	-- Tooled Rivermoor Boots
							i(136719),	-- Curdled Soul Essence
							i(137270),	-- Howling Echoes
						},
					}),
					e(1653, {	-- Illysanna Ravencrest
						["creatureID"] = 98696,	-- Illysanna Ravencrest
						["groups"] = {
							i(134412),	-- Cloak of Unwavering Loyalty
							i(136978),	-- Ember of Nullification
							i(134519),	-- Ravencrest Bonecrush Gauntlets
							i(134490),	-- Ring of Contempt
							i(134419),	-- Slippers of Heedless Sacrifice
							i(136724),	-- Soul-Torn Fury Cinch
							i(134440),	-- Soulstarve Hood
							i(136769),	-- Ravencrest's Wrath
							i(136720),	-- Snapped Emerald Pendant
						},
					}),
					e(1664, {	-- Smashspite the Hateful
						["creatureID"] = 98949,	-- Smashspite the Hateful
						["groups"] = {
							i(134528),	-- Band of Callous Dominance
							i(134426),	-- Collar of Raking Claws
							i(134483),	-- Fel-Hammered Greaves
							i(134373),	-- Felbat Leather Vest
							i(134507),	-- Leadfoot Earthshakers
							i(134390),	-- Mardum Chain Vest
							i(134391),	-- Netherwhisper Cinch
							i(134362),	-- Portalguard Wristguard
							i(136979),	-- Shorn Batbrood Cuffs
							i(136715),	-- Spiked Counterweight
							i(136721),	-- Mo'arg Eyepatch
						},
					}),
					e(1672, {	-- Lord Kur'talos Ravencrest
						["crs"] = {
							98970,	-- Dantalionax
							98965,	-- Kur'talos Ravencrest
						},
						["groups"] = {
							i(136716),	-- Caged Horror
							i(136770),	-- Drape of the Raven Lord
							i(134370),	-- Felbat Leather Leggings
							i(134431),	-- Latosius's Blasting Gloves
							i(134384),	-- Madrum Chain Wristclamp
							i(134451),	-- Legguards of Endless Horrors
							i(134394),	-- Netherwhisper Leggings
							i(134510),	-- Pauldrons of Ancient Command
							i(134358),	-- Portalguard Helm
							i(134499),	-- Raven Filigree Pendant
							i(139243),	-- Raven's Veil Belt
							i(139247),	-- Ravencourt Formal Mantle
							i(134477),	-- Ravencrest's Unerring Striders
							i(139240),	-- Rook Footman's Legplates
							i(139244),	-- Shadow Archer's Helm
							i(136717),	-- Absolved Ravencrest Brooch
							i(137272),	-- Cruelty of Dantalionax
							i(136718),	-- Mark of Varo'then
						},
					}),
				},
			}),
			d(DIFFICULTY.DUNGEON.MYTHIC, {
				["ItemAppearanceModifierID"] = 0,
				["lvl"] = 110,
				["groups"] = {
					e(1518, {	-- Amalgam of Souls
						["creatureID"] = 98542,	-- Amalgam of Souls
						["groups"] = {
							ach(10710, {	-- Black Rook Moan
								["description"] = createLocalizationString({
									readable = "Prevent a soul from touching the boss for 60 seconds during the intermission phase.",
									constant = "PREVENT_A_SOUL_FROM_TOUCHING_THE_BOSS_FOR_60",
									export = true,
									text = {
										en = "Prevent a soul from touching the boss for 60 seconds during the intermission phase.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "在间歇阶段阻止灵魂接触首领 60 秒。",
										-- TODO: tw = "",
									},
								}),
								["crs"] = { 99663 },	-- Frustrated Soul
							}),
							i(136714),	-- Amalgam's Seventh Spine
							i(136976),	-- Etheldrin's Breastplate
							i(134437),	-- Harrowing Soulspun Bracers
							i(134469),	-- Midnight Reaper Handwraps
							i(139242),	-- Raven's Vil Gloves
							i(139246),	-- Ravencourt Formal Robes
							i(139241),	-- Rook Footman's Warboots
							i(139245),	-- Shadow Archer's Spaulders
							i(136977),	-- Shadowfeather Shawl
							i(134442),	-- Tooled Rivermoor Boots
							i(136719),	-- Curdled Soul Essence
							i(137270),	-- Howling Echoes
						},
					}),
					e(1653, {	-- Illysanna Ravencrest
						["creatureID"] = 98696,	-- Illysanna Ravencrest
						["groups"] = {
							ach(10711),	-- Adds? More Like Bads
							i(134412),	-- Cloak of Unwavering Loyalty
							i(136978),	-- Ember of Nullification
							i(134519),	-- Ravencrest Bonecrush Gauntlets
							i(134490),	-- Ring of Contempt
							i(134419),	-- Slippers of Heedless Sacrifice
							i(136724),	-- Soul-Torn Fury Cinch
							i(134440),	-- Soulstarve Hood
							i(136769),	-- Ravencrest's Wrath
							i(136720),	-- Snapped Emerald Pendant
						},
					}),
					e(1664, {	-- Smashspite the Hateful
						["creatureID"] = 98949,	-- Smashspite the Hateful
						["groups"] = {
							i(134528),	-- Band of Callous Dominance
							i(134426),	-- Collar of Raking Claws
							i(134483),	-- Fel-Hammered Greaves
							i(134373),	-- Felbat Leather Vest
							i(134507),	-- Leadfoot Earthshakers
							i(134390),	-- Mardum Chain Vest
							i(134391),	-- Netherwhisper Cinch
							i(134362),	-- Portalguard Wristguard
							i(136979),	-- Shorn Batbrood Cuffs
							i(136715),	-- Spiked Counterweight
							i(136721),	-- Mo'arg Eyepatch
						},
					}),
					e(1672, {	-- Lord Kur'talos Ravencrest
						["crs"] = {
							98970,	-- Dantalionax
							98965,	-- Kur'talos Ravencrest
						},
						["groups"] = {
							ach(10806),	-- Mythic: Black Rook Hold
							ach(10862),	-- Mythic: Black Rook Hold Guild Run
							i(137931),	-- Pattern: Gravenscale Hauberk [Rank 3] (RECIPE!)
							i(137694),	-- Schematic: Reaves Module: Repair Mode
							i(136716),	-- Caged Horror
							i(136770),	-- Drape of the Raven Lord
							i(134370),	-- Felbat Leather Leggings
							i(134431),	-- Latosius's Blasting Gloves
							i(134384),	-- Madrum Chain Wristclamp
							i(134451),	-- Legguards of Endless Horrors
							i(134394),	-- Netherwhisper Leggings
							i(134510),	-- Pauldrons of Ancient Command
							i(134358),	-- Portalguard Helm
							i(134499),	-- Raven Filigree Pendant
							i(139243),	-- Raven's Veil Belt
							i(139247),	-- Ravencourt Formal Mantle
							i(134477),	-- Ravencrest's Unerring Striders
							i(139240),	-- Rook Footman's Legplates
							i(139244),	-- Shadow Archer's Helm
							i(136717),	-- Absolved Ravencrest Brooch
							i(137272),	-- Cruelty of Dantalionax
							i(136718),	-- Mark of Varo'then
						},
					}),
				},
			}),
		},
	}),
})));
