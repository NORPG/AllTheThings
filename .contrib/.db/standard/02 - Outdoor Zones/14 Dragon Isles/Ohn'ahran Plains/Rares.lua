---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local function bo(questID, isDaily)
    return { ["questID"] = questID, ["isDaily"] = isDaily };
end

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(OHNAHRAN_PLAINS, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(193168, {	-- Biryuk
				["coord"] = { 72.5, 56.2, OHNAHRAN_PLAINS },
				["questID"] = 73903,
			}),
			n(193128, {	-- Blightpaw the Depraved
				["description"] = createLocalizationString({
					readable = "Speak to nearby NPC to spawn.",
					constant = "SPEAK_TO_NEARBY_NPC_TO_SPAWN",
					export = true,
					text = {
						en = "Speak to nearby NPC to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与附近的NPC交谈即可刷新。",
						-- TODO: tw = "",
					},
				}),
				["cr"] = 193222,	-- Archaeologist Koranir
				["coord"] = { 90.2, 40.2, OHNAHRAN_PLAINS },
				["questID"] = 74096,
				["groups"] = {
					bo(73869, true),
				},
			}),
			n(201535,	-- Bloodbeak the Ravenous
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 37.3, 38.5, OHNAHRAN_PLAINS },
				["questID"] = 74552,
				["groups"] = {
					bo(74467, true),
					i(203673),	-- Bloodbeak's Ravenor
				},
			})),
			n(195186, {	-- Cinta the Forgotten
				["description"] = createLocalizationString({
					readable = "Only spawns if the Aylaag Camp is stationed west.",
					constant = "ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED",
					export = true,
					text = {
						en = "Only spawns if the Aylaag Camp is stationed west.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅当艾拉格营地驻扎在西部时才会刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 31.3, 76.0, OHNAHRAN_PLAINS },
				["questID"] = 73950,
			}),
			n(189652, {	-- Deadwaker Ghendish
				["coord"] = { 30.8, 66.6, OHNAHRAN_PLAINS },
				["questID"] = 73872,
				["groups"] = {
					i(189055),	-- Ghendish's Backup Talisman
				},
			}),
			n(192020, {	-- Eaglemaster Niraak
				["coord"] = { 49.5, 67.0, OHNAHRAN_PLAINS },
				["description"] = createLocalizationString({
					readable = "Chance to spawn after killing any nearby Nokhud Mobs. Yells 'Filth! I will end you for your actions!' upon spawning.",
					constant = "CHANCE_TO_SPAWN_AFTER_KILLING_ANY_NEARBY_NOKHUD",
					export = true,
					text = {
						en = "Chance to spawn after killing any nearby Nokhud Mobs. Yells 'Filth! I will end you for your actions!' upon spawning.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀附近任何诺库德怪物后有几率刷新。刷新时会喊叫“污秽！我会为你的所作所为终结你！”",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 74063,
				["groups"] = {
					-- #if AFTER 10.0.5
					bo(74441, true),	-- Bonus Objective was added in 10.0.5
					-- #endif
					i(200536),	-- Tamed Eagle
				},
			}),
			n(193142, {	-- Enraged Sapphire
				["coord"] = { 56.6, 81.4, OHNAHRAN_PLAINS },
				["questID"] = 73875,
				["groups"] = {
					i(200309),	-- Rock Encrusted Chestguard
				},
			}),
			-- n(193170),	-- Fulgurb // under DF/Timed Based Rare
			n(201537,	-- Groffnar
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 35.0, 41.1, OHNAHRAN_PLAINS },
				["questID"] = 74549,
				["groups"] = {
					bo(74463, true),
					i(203671),	-- Pack Leader's Pelt
				},
			})),
			n(187781, {	-- Hamett <Rockfang Matriarch>
				["description"] = createLocalizationString({
					readable = "Only available if the Aylaag Camp is stationed north.\nChance to spawn upon killing Sutaan.",
					constant = "ONLY_AVAILABLE_IF_THE_AYLAAG_CAMP_IS_STATIONED",
					export = true,
					text = {
						en = "Only available if the Aylaag Camp is stationed north.\nChance to spawn upon killing Sutaan.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在北面时可用。\n击杀苏塔恩时有几率刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 85.4, 15.8, OHNAHRAN_PLAINS },
				["questID"] = 73951,
			}),
			n(188095, {	-- Hunter of the Deep
				["description"] = createLocalizationString({
					readable = "Only spawns if the Aylaag Camp is stationed north.\nThere will be some glowing fish in the water when he is summonable. Click on the weapon rack, shoot the fish. When all fish are eliminated, the boss will spawn.",
					constant = "ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED_2",
					export = true,
					text = {
						en = "Only spawns if the Aylaag Camp is stationed north.\nThere will be some glowing fish in the water when he is summonable. Click on the weapon rack, shoot the fish. When all fish are eliminated, the boss will spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在北面时刷新。\n他可以召唤时，水中会出现一些发光的鱼。点击武器架，射击那些鱼。所有鱼都被消灭后，首领就会刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 80.5, 42.2, OHNAHRAN_PLAINS },
				["questID"] = 73966,
			}),
			n(201538,	-- Huntmaster Yrgena
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 33.5, 38.7, OHNAHRAN_PLAINS },
				["questID"] = 74548,
				["groups"] = {
					bo(74466, true),
					i(203672),	-- Master Huntmaster's Wristguards
				},
			})),
			n(188124, {	-- Irontree
				["description"] = createLocalizationString({
					readable = "Only spawns if the Aylaag Camp is stationed north.\nCave Entrance: 79.2, 36.6.",
					constant = "ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED_3",
					export = true,
					text = {
						en = "Only spawns if the Aylaag Camp is stationed north.\nCave Entrance: 79.2, 36.6.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在北面时刷新。\n洞穴入口：79.2, 36.6。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 79.2, 36.6, OHNAHRAN_PLAINS },	-- Cave Entrance
					{ 80.5, 37.8, OHNAHRAN_PLAINS },	-- Boss
				},
				["questID"] = 73967,
				["groups"] = {
					bo(66356, true),
					i(203672),	-- Master Huntmaster's Wristguards
				},
			}),
			n(197009, {	-- Liskheszaera
				["coord"] = { 87.4, 61.4, OHNAHRAN_PLAINS },
				["questID"] = 73882,
			}),
			n(201540,	-- Lurgan
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 33.7, 34.8, OHNAHRAN_PLAINS },
				["questID"] = 74546,
				["groups"] = {
					bo(74464, true),
					i(203674),	-- Brutal Tramplers
				},
			})),
			n(195409, {	-- Makhra the Ashtouched <Corrupted Child of Ohn'ahra>
				["description"] = "~L.ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED",
				["coord"] = { 32.7, 38.1, OHNAHRAN_PLAINS },
				["questID"] = 73968,
			}),
			-- n(193212),	-- Malsegan // under DF/Timed Based Rare
			-- n(193173),	-- Mikrin of the Raging Winds // under DF/Timed Based Rare
			n(195895, {	-- Nergazurai
				["coord"] = { 60.0, 71.3, OHNAHRAN_PLAINS },
				["questID"] = 74093,
			}),
			n(187219, {	-- Nokhud Warmaster
				["description"] = createLocalizationString({
					readable = "Spawns during the Aylaag Caravan escort from River Camp to Eaglewatch Outpost.",
					constant = "SPAWNS_DURING_THE_AYLAAG_CARAVAN_ESCORT_FROM",
					export = true,
					text = {
						en = "Spawns during the Aylaag Caravan escort from River Camp to Eaglewatch Outpost.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在艾拉格商队从河畔营地护送至鹰望哨站的途中刷新。",
						-- TODO: tw = "",
					},
				}),
				-- ["coord"] = { X, Y, OHNAHRAN_PLAINS },
				-- ["questID"] = ,
				-- ["groups"] = {
				-- },
			}),
			n(196350, {	-- Old Stormhide
				["description"] = createLocalizationString({
					readable = "Spawns during the Aylaag Caravan escort from Eaglewatch Outlook to Aylaag Outpout.",
					constant = "SPAWNS_DURING_THE_AYLAAG_CARAVAN_ESCORT_FROM_2",
					export = true,
					text = {
						en = "Spawns during the Aylaag Caravan escort from Eaglewatch Outlook to Aylaag Outpout.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在艾拉格商队从鹰望眺台前往艾拉格前哨的护送途中刷新。",
						-- TODO: tw = "",
					},
				}),
				-- ["coord"] = { X, Y, OHNAHRAN_PLAINS },
				-- ["questID"] = ,
				-- ["groups"] = {
				-- },
			}),
			-- n(193235),	-- Oshigol // under DF/Timed Based Rare
			n(191950, {	-- Porta the Overgrown
				["description"] = createLocalizationString({
					readable = "Only available if the Aylaag Camp is stationed at the south east.\nRequires 5 Enriched Soil used on the mushroom in the cave at 59.71, 68.10 to spawn this rare. The Enriched Soil can be looted from piles of dirt scattered around the bottom of the lake in Mirror of the Sky and underwater in the surrounding area. The coordinates indicate possible spots for the Dirt Piles.",
					constant = "ONLY_AVAILABLE_IF_THE_AYLAAG_CAMP_IS_STATIONED_2",
					export = true,
					text = {
						en = "Only available if the Aylaag Camp is stationed at the south east.\nRequires 5 Enriched Soil used on the mushroom in the cave at 59.71, 68.10 to spawn this rare. The Enriched Soil can be looted from piles of dirt scattered around the bottom of the lake in Mirror of the Sky and underwater in the surrounding area. The coordinates indicate possible spots for the Dirt Piles.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在东南面时可用。\n需要在 59.71, 68.10 处洞穴里的蘑菇上使用 5 份肥沃土壤才能刷新此稀有。肥沃土壤可以从镜天湖湖底及周边水下散落的土堆中拾取。所给坐标表示土堆可能出现的位置。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 59.6, 68.0, OHNAHRAN_PLAINS },	-- Boss
					{ 50.5, 70.2, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 52.7, 65.8, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 54.6, 69.4, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 52.1, 70.5, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 53.1, 72.0, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 49.7, 68.7, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 54.1, 66.9, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
					{ 53.77, 67.45, OHNAHRAN_PLAINS },	-- Soil Spawn posibility
				},
				["questID"] = 73971,
			}),
			n(193669, {	-- Prozela Galeshot
				["coord"] = { 59.9, 66.9, OHNAHRAN_PLAINS },
				["questID"] = 72815,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(192557, {	-- Quackers the Terrible
				["description"] =
					-- #if AFTER 10.0.5
					"Requires Duck Trap Kit, purchased from a nearby camp (northern waypoint).\n\nYou'll need a rank 1 of these reagents:\n\n1 x Large Sturdy Femur\n\n3 x Contoured Fowlfeather\n\n2 x Tallstrider Sinew\n\nUse the item to trap a duck and then go to southern waypoint & put the trapped duck into the nest.",
					-- #else
					"Requires Duck Trap Kit, purchased from a nearby camp (northern waypoint).\n\nYou'll need a rank 1 of these reagents:\n\n1 x Primal Molten Alloy\n\n3 x Resilient Leather\n\n4 x Spool of Wilderthread\n\nUse the item to trap a duck and then go to southern waypoint & put the trapped duck into the nest.",
					-- #endif
				["coords"] = {
					{ 68.2, 79.2, OHNAHRAN_PLAINS },
					{ 70.43, 63.49, OHNAHRAN_PLAINS },
				},
				["cost"] = { { "i", 194739, 1 } },	-- Trapped Duck
				["questID"] = 73972,
			}),
			-- n(196010),	-- Researcher Sneakwing // under DF/Timed Based Rare
			-- n(193227),	-- Ronsak the Decimator // under DF/Timed Based Rare
			n(193153, {	-- Ripsaw the Stalker
				["coord"] = { 26.3, 65.4, OHNAHRAN_PLAINS },
				["questID"] = 72845,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(195223, {	-- Rustlily <Nimblewing Matriarch>
				["description"] = "~L.ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED",
				["coord"] = { 42.6, 44.6, OHNAHRAN_PLAINS },
				["questID"] = 73973,
			}),
			n(193215, {	-- Scaleseeker Mezeri
				["crs"] = { 193224 },	-- Dawnbell
				["description"] = createLocalizationString({
					readable = "Feed Dawnbell at the southern waypoint a Sugarwing Cupcake & then follow her to the rare.",
					constant = "FEED_DAWNBELL_AT_THE_SOUTHERN_WAYPOINT_A",
					export = true,
					text = {
						en = "Feed Dawnbell at the southern waypoint a Sugarwing Cupcake & then follow her to the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在南部的路径点喂给黎明铃一个糖翼纸杯蛋糕，然后跟随她找到稀有生物。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 16.6, 51.2, OHNAHRAN_PLAINS },	-- Dawnbell
					{ 20.3, 43.7, OHNAHRAN_PLAINS },	-- Rare
				},
				["questID"] = 74073,
				["cost"] = { { "i", 194681, 1 } },	-- Sugarwing Cupcake
				["groups"] = {
					bo(69865, true),
					i(200735),	-- Magically Magical Faerie Flower
				},
			}),
			n(193136, {	-- Scav Notail
				["coord"] = { 50.1, 75.2, OHNAHRAN_PLAINS },
				["questID"] = 73893,
				["groups"] = {
					i(200168),	-- Gnoll Hide Belt
				},
			}),
			n(193188, {	-- Seeker Teryx
				["coord"] = { 61.9, 13.0, OHNAHRAN_PLAINS },
				["questID"] = 73894,
				["groups"] = {
					i(200875),	-- Seeker's Bands
				},
			}),
			n(187559, {	-- Shade of Grief
				["crs"] = { 193166 },	-- Solethus's Gravestone
				["coord"] = { 29.9, 41.1, OHNAHRAN_PLAINS },
				["questID"] = 74075,
				["groups"] = {
					i(196996),	-- Cliffside Wylderdrake: Branched Horns (MM!)
					i(200437),	-- Dreamsong Censer
					i(197115),	-- Highland Drake: Thorned Jaw (MM!)
					i(200444),	-- Mantle of the Gatekeeper
				},
			}),
			n(192949, {	-- Skaara
				["coord"] = { 44.9, 49.2, OHNAHRAN_PLAINS },
				["questID"] = 72847,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193165, {	-- Sparkspitter Vrak
				["coord"] = { 22.1, 38.8, OHNAHRAN_PLAINS },
				["questID"] = 73896,
				["groups"] = {
					i(200234),	-- Vrak's Embossed Aegis
				},
			}),
			-- n(193123),	-- Steamgill // under DF/Timed Based Rare
			n(201539,	-- Stormcaller Narkena
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 32.5, 42.3, OHNAHRAN_PLAINS },
				["questID"] = 74547,
				["groups"] = {
					bo(74465, true),
					i(203676),	-- Stormcaller's Grounding Shoes
					i(197367),	-- Renewed Proto-Drake: Gray Hair (MM!)
				},
			})),
			n(191842, {	-- Sulfurion
				["description"] = createLocalizationString({
					readable = "Only spawns if the Aylaag Camp is stationed at the south east.",
					constant = "ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED_AT",
					export = true,
					text = {
						en = "Only spawns if the Aylaag Camp is stationed at the south east.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅当艾拉格营地驻扎在东南方时才会刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 78.3, 83.0, OHNAHRAN_PLAINS },
				["questID"] = 73974,
			}),
			n(193133, {	-- Sunscale Behemoth
				["coord"] = { 63.2, 48.6, OHNAHRAN_PLAINS },
				["questID"] = 72849,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(193163, {	-- Territorial Coastling
				["coord"] = { 22.7, 67.6, OHNAHRAN_PLAINS },
				["questID"] = 72851,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(200212, {	-- Sand-Encrusted Graves
						["description"] = createLocalizationString({
							readable = "While this item can drop from almost every Dragonflight Rare, its best farmed by killing the Territorial Coastling Rare.\n\nDroprate is around 75%.\n\nThe Rare is once per Character.",
							constant = "WHILE_THIS_ITEM_CAN_DROP_FROM_ALMOST_EVERY",
							export = true,
							text = {
								en = "While this item can drop from almost every Dragonflight Rare, its best farmed by killing the Territorial Coastling Rare.\n\nDroprate is around 75%.\n\nThe Rare is once per Character.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "虽然此物品几乎可以从所有龙军团稀有身上掉落，但刷取它的最佳方式是击杀领地海岸幼龙稀有。\n\n掉落率约为 75%。\n\n该稀有每个角色只能拾取一次。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
			n(196334, {	-- The Great Enla <Scourge of the Plains>
				["description"] = createLocalizationString({
					readable = "Spawns during the Aylaag Caravan escort from Eaglewatch Outpost to Aylaag Outpost.",
					constant = "SPAWNS_DURING_THE_AYLAAG_CARAVAN_ESCORT_FROM_3",
					export = true,
					text = {
						en = "Spawns during the Aylaag Caravan escort from Eaglewatch Outpost to Aylaag Outpost.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在艾拉格商队从鹰望哨站前往艾拉格哨站的护送途中刷新。",
						-- TODO: tw = "",
					},
				}),
				-- ["coord"] = { X, Y, OHNAHRAN_PLAINS },
				-- ["questID"] = ,
				-- ["groups"] = {
				-- },
			}),
			n(195204, {	-- The Jolly Giant
				["description"] = "~L.ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED",
				["coord"] = { 27.6, 55.6, OHNAHRAN_PLAINS },
				["questID"] = 73976,
			}),
			n(191354, {	-- Ty'foon the Ascended
				["coord"] = { 26.1, 34.2, OHNAHRAN_PLAINS },
				["questID"] = 72852,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(192453, {	-- Vaniik the Stormtouched <Corrupted Child of Ohn'ahra>
				["description"] = "~L.ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED_AT",
				["coord"] = { 82.0, 63.0, OHNAHRAN_PLAINS },
				["questID"] = 73978,
			}),
			n(192983, {	-- Web-Queen Ashkaz
				["coord"] = { 43.3, 47.2, OHNAHRAN_PLAINS },
				["questID"] = 74095,
				["groups"] = {
					bo(67717, true),
				},
			}),
			n(192364, {	-- Windscale the Stormborn
				["description"] = createLocalizationString({
					readable = "Only available if the Aylaag Camp is stationed at the south east.\nSpawns from the egg after killing 5 nearby egg channelers.",
					constant = "ONLY_AVAILABLE_IF_THE_AYLAAG_CAMP_IS_STATIONED_3",
					export = true,
					text = {
						en = "Only available if the Aylaag Camp is stationed at the south east.\nSpawns from the egg after killing 5 nearby egg channelers.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在东南面时可用。\n击杀附近 5 名引导蛋的引导者后，从蛋中刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					192367,	-- Nokhud Galebringer
					192357,	-- Storm-touched Egg
				},
				["coord"] = { 84.2, 47.8, OHNAHRAN_PLAINS },
				["questID"] = 73979,
			}),
			n(192045,	-- Windseeker Avash
			bubbleDownSelf({ ["timeline"] = { ADDED_10_0_5 } }, {
				["coord"] = { 58.6, 68.2, OHNAHRAN_PLAINS },
				["questID"] = 74088,
				["groups"] = {
					bo(74440, true),
					i(200141),	-- Wind Generating Band
				},
			})),
			n(193209, {	-- Zenet Avis <The Hard Wind>
				["coord"] = { 31.5, 64.0, OHNAHRAN_PLAINS },
				["questID"] = 73901,
				["groups"] = {
					i(200879, {	-- Zenet Egg
						i(198825),	-- Zenet Hatchling (MOUNT!)
					}),
				},
			}),
			n(188451, {	-- Zerimek <The Darkened Cloud>
				["description"] = createLocalizationString({
					readable = "Only spawns if the Aylaag Camp is stationed north.",
					constant = "ONLY_SPAWNS_IF_THE_AYLAAG_CAMP_IS_STATIONED_4",
					export = true,
					text = {
						en = "Only spawns if the Aylaag Camp is stationed north.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "仅在艾拉格营地驻扎在北面时刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 72.2, 23.2, OHNAHRAN_PLAINS },
				["questID"] = 73980,
			}),
			n(193140, {	-- Zarizz
				["description"] = createLocalizationString({
					readable = "Use /hiss on 4 nearby Juvenile Wind Serpents to spawn.",
					constant = "USE_HISS_ON_4_NEARBY_JUVENILE_WIND_SERPENTS_TO",
					export = true,
					text = {
						en = "Use /hiss on 4 nearby Juvenile Wind Serpents to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "对附近 4 只年幼的风蛇使用 /hiss 即可刷出。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 30.3, 62.1, OHNAHRAN_PLAINS },
				["questID"] = 74091,
				["groups"] = {
					i(200215),	-- Plumed Shoulderguards of the Hunt
				},
			}),
		})),
	}),
})));
