---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local DERBY_MARK = 3055;

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(HALLOWFALL, {
		header(HEADERS.Quest, 82778, {	-- Hallowfall Fishing Derby
			["description"] = createLocalizationString({
				readable = "This event is available every Saturday.",
				constant = "THIS_EVENT_IS_AVAILABLE_EVERY_SATURDAY",
				export = true,
				text = {
					en = "This event is available every Saturday.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "此事件每周六开放。",
					-- TODO: tw = "",
				},
			}),
			["icon"] = 6012052,
			["requireSkill"] = FISHING,
			["groups"] = {
				n(ACHIEVEMENTS, {
					ach(40539, {	-- The Derby Dash (automated)
						i(223286),	-- Kah, Legend of the Deep (MOUNT!)
					}),
				}),
				n(QUESTS, sharedData({
					["isWeekly"] = true,
				}, {
					q(82778, {	-- Hallowfall Fishing Derby
						["description"] = createLocalizationString({
							readable = "Nibbling Minnow, Arathor Hammerfish, Queen's Lureback",
							constant = "NIBBLING_MINNOW_ARATHOR_HAMMERFISH_QUEEN_S",
							export = true,
							text = {
								en = "Nibbling Minnow, Arathor Hammerfish, Queen's Lureback",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "啃食米诺鱼、阿拉索锤头鱼、女王的诱背鱼",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 226846 },	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							currency(DERBY_MARK),
						},
					}),
					q(83529, {	-- Hallowfall Fishing Derby
						["description"] = createLocalizationString({
							readable = "Bismuth Bitterling, Whispering Stargazer, Regal Dottyback",
							constant = "BISMUTH_BITTERLING_WHISPERING_STARGAZER_REGAL",
							export = true,
							text = {
								en = "Bismuth Bitterling, Whispering Stargazer, Regal Dottyback",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "铋苦鱼、低语瞻星鱼、华丽准雀鲷",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 226846 },	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							currency(DERBY_MARK),
						},
					}),
					q(83530, {	-- Hallowfall Fishing Derby
						["description"] = createLocalizationString({
							readable = "Bloody Perch, Roaring Anglerseeker, Spiked Sea Raven",
							constant = "BLOODY_PERCH_ROARING_ANGLERSEEKER_SPIKED_SEA",
							export = true,
							text = {
								en = "Bloody Perch, Roaring Anglerseeker, Spiked Sea Raven",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "血斑鲈、咆哮觅鮟鱇、尖刺海鸦",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 226846 },	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							currency(DERBY_MARK),
						},
					}),
					q(83531, {	-- Hallowfall Fishing Derby
						["description"] = createLocalizationString({
							readable = "Dilly-Dally Dace, Dornish Pike, Azj-Kahet Slum Shark",
							constant = "DILLY_DALLY_DACE_DORNISH_PIKE_AZJ_KAHET_SLUM",
							export = true,
							text = {
								en = "Dilly-Dally Dace, Dornish Pike, Azj-Kahet Slum Shark",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "磨蹭鲦鱼、多恩狗鱼、艾基-卡赫特贫民鲨",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 226846 },	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							currency(DERBY_MARK),
						},
					}),
					q(83532, {	-- Hallowfall Fishing Derby
						["description"] = createLocalizationString({
							readable = "Crystalline Sturgeon, Specular Rainbowfish, Sanguine Dogfish",
							constant = "CRYSTALLINE_STURGEON_SPECULAR_RAINBOWFISH",
							export = true,
							text = {
								en = "Crystalline Sturgeon, Specular Rainbowfish, Sanguine Dogfish",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "水晶鲟鱼、镜面虹鱼、血色狗鲨",
								-- TODO: tw = "",
							},
						}),
						["provider"] = { "n", 226846 },	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							currency(DERBY_MARK),
						},
					}),
				})),
				header(HEADERS.Quest, 82778, sharedData({	-- Hallowfall Fishing Derby
					["collectible"] = false,
					["isWeekly"] = true,
				}, {
					q(82928, {	-- Arathor Hammerfish
						["name"] = "Arathor Hammerfish Derby Bonus Mark",
					}),
					q(82936, {	-- Awoken Coelacanth
						["name"] = "Awoken Coelacanth Derby Bonus Mark",
					}),
					q(82920, {	-- Bismuth Bitterling
						["name"] = "Bismuth Bitterling Derby Bonus Mark",
					}),
					q(82918, {	-- Bloody Perch
						["name"] = "Bloody Perch Derby Bonus Mark",
					}),
					q(82919, {	-- Crystalline Sturgeon
						["name"] = "Crystalline Sturgeon Derby Bonus Mark",
					}),
					q(82935, {	-- Cursed Ghoulfish
						["name"] = "Cursed Ghoulfish Derby Bonus Mark",
					}),
					q(82947, {	-- Dilly-Dally Dace
						["name"] = "Dilly-Dally Dace Derby Bonus Mark",
					}),
					q(82926, {	-- Dornish Pike
						["name"] = "Dornish Pike Derby Bonus Mark",
					}),
					q(82923, {	-- Goldengill Trout
						["name"] = "Goldengill Trout Derby Bonus Mark",
					}),
					q(82930, {	-- Kaheti Slum Shark
						["name"] = "Kaheti Slum Shark Derby Bonus Mark",
					}),
					q(82921, {	-- Nibbling Minnow
						["name"] = "Nibbling Minnow Derby Bonus Mark",
					}),
					q(82931, {	-- Pale Huskfish
						["name"] = "Pale Huskfish Derby Bonus Mark",
					}),
					q(82934, {	-- Queen's Lurefish
						["name"] = "Queen's Lurefish Derby Bonus Mark",
					}),
					q(82925, {	-- Quiet River Bass
						["name"] = "Quiet River Bass Derby Bonus Mark",
					}),
					q(82929, {	-- Regal Dottyback
						["name"] = "Regal Dottyback Derby Bonus Mark",
					}),
					q(82927, {	-- Roaring Anglerseeker
						["name"] = "Roaring Anglerseeker Derby Bonus Mark",
					}),
					q(82932, {	-- Sanguine Dogfish
						["name"] = "Sanguine Dogfish Derby Bonus Mark",
					}),
					q(82924, {	-- Specular Rainbowfish
						["name"] = "Specular Rainbowfish Derby Bonus Mark",
					}),
					q(82933, {	-- Spiked Sea Raven
						["name"] = "Spiked Sea Raven Derby Bonus Mark",
					}),
					q(82922, {	-- Whispering Stargazer
						["name"] = "Whispering Stargazer Derby Bonus Mark",
					}),
				})),
				n(VENDORS, {
					n(226846, {	-- Captain Oathmyt
						["coord"] = { 44.2, 61.4, HALLOWFALL },
						["groups"] = {
							i(225770, {	-- Algari Anglerthread
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(225771, {	-- Algari Seekerthread
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(224727, {	-- Dasher's Trophy Fish
								["cost"] = { { "c", DERBY_MARK, 250 } },
							}),
							i(226376, {	-- Dasher's Violet Rucksack
								["cost"] = { { "c", DERBY_MARK, 50 } },
							}),
							iensemble(224717, {	-- Ensemble: Cerulean Dredger
								["cost"] = { { "c", DERBY_MARK, 500 } },
							}),
							i(225763, {	-- Fallen Dalaran Defender
								["cost"] = { { "c", DERBY_MARK, 50 } },
							}),
							i(217375, {	-- Frenzied Hat of the Crimson Seas
								["cost"] = { { "c", DERBY_MARK, 100 } },
							}),
							i(225758, {	-- Hallowfall Harvester's Pitchfork
								["cost"] = { { "c", DERBY_MARK, 50 } },
							}),
							i(226379, {	-- Keen-eye 'Noculars
								["cost"] = { { "c", DERBY_MARK, 50 } },
							}),
							i(226378, {	-- Mereldar Artisan's Shoulderbag
								["cost"] = { { "c", DERBY_MARK, 50 } },
							}),
							i(228422, {	-- Recipe: Ghoulfish Delight (RECIPE!)
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(228421, {	-- Recipe: Melted Candlebar (RECIPE!)
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(228423, {	-- Recipe: Pep-In-Your-Step (RECIPE!)
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(225892, {	-- Recipe: Rockslide Shake (RECIPE!)
								["cost"] = { { "c", DERBY_MARK, 10 } },
							}),
							i(224752, {	-- Soaked Journal Entry
								["cost"] = { { "c", DERBY_MARK, 5 } },
							}),
						},
					}),
				}),
			},
		}),
	}),
}));
