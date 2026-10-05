-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.DF, bubbleDown({ ["timeline"] = { ADDED_10_0_2 } }, {
	inst(1197, {	-- Uldaman: Legacy of Tyr
		["coord"] = {41.2, 10.3, BADLANDS },
		["maps"] = {
			2071,	-- Hall of the Keepers
			2072,	-- The Vault of Tyr
		},
		["groups"] = {
			n(QUESTS, {
				q(71093, {	-- Legacy of Tyr: Secrets of the Past
					["description"] = createLocalizationString({
						readable = "Given on zoning into the instance on a character that did not do the pre-patch version of this quest.",
						constant = "GIVEN_ON_ZONING_INTO_THE_INSTANCE_ON_A",
						export = true,
						text = {
							en = "Given on zoning into the instance on a character that did not do the pre-patch version of this quest.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在未完成该任务前夕版本的角色上进入副本时获得。",
							-- TODO: tw = "",
						},
					}),
					["altQuests"] = {
						66458,	-- Legacy of Tyr: Secrets of the Past [A]
						66586,	-- Legacy of Tyr: Secrets of the Past [H]
					},
					["timeline"] = { ADDED_10_0_2_LAUNCH },
					["_drop"] = { "r" },	-- bad API data
				}),
			}),
			n(ZONE_DROPS, {
				i(194256),	-- Pattern: Hood of Surging Time (RECIPE!)
			}),
			n(TREASURES, {
				o(384653, {	-- Ancient Volume
					["description"] = createLocalizationString({
						readable = "After second boss room, to the right of the broken bench.",
						constant = "AFTER_SECOND_BOSS_ROOM_TO_THE_RIGHT_OF_THE",
						export = true,
						text = {
							en = "After second boss room, to the right of the broken bench.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "第二个首领房间之后，在破损长椅的右侧。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(201920),	-- Obeservational Report: Earthen
					},
				}),
				o(384313, {	-- Ancient Volume
					["description"] = createLocalizationString({
						readable = "Third boss room to the right of the exit door on the shelf.",
						constant = "THIRD_BOSS_ROOM_TO_THE_RIGHT_OF_THE_EXIT_DOOR",
						export = true,
						text = {
							en = "Third boss room to the right of the exit door on the shelf.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "第三个首领房间，在出口门右侧的架子上。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(201727),	-- To My Staunchest Allies
					},
				}),
				o(384311, {	-- Ancient Volume
					["description"] = createLocalizationString({
						readable = "Before entering the Fourth boss room on top of some chests.",
						constant = "BEFORE_ENTERING_THE_FOURTH_BOSS_ROOM_ON_TOP_OF",
						export = true,
						text = {
							en = "Before entering the Fourth boss room on top of some chests.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在进入第四个首领房间之前，在一些箱子的顶部。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(201722),	-- Edicts of the Prime Designate, Volume 742
					},
				}),
				o(384654, {	-- Ancient Volume
					["description"] = createLocalizationString({
						readable = "To the right on shelf in the circle room before final boss.",
						constant = "TO_THE_RIGHT_ON_SHELF_IN_THE_CIRCLE_ROOM_BEFORE",
						export = true,
						text = {
							en = "To the right on shelf in the circle room before final boss.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在最终首领前圆形房间右侧的架子上。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(201833),	-- Wreckage Analysis Report
					},
				}),
				o(384312, {	-- Ancient Volume
					["description"] = createLocalizationString({
						readable = "In the room before final boss, left side under the middle bench.",
						constant = "IN_THE_ROOM_BEFORE_FINAL_BOSS_LEFT_SIDE_UNDER",
						export = true,
						text = {
							en = "In the room before final boss, left side under the middle bench.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在最终首领前的房间里，左侧中间长凳下方。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(201726),	-- Progress Report: Uldorus
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS, {
				e(2475, {	-- The Lost Dwarves
					["crs"] = {
						184581,	-- Baelog
						184582,	-- Eric "The Swift"
						184580,	-- Olaf
					},
					["groups"] = {
						i(193812),	-- Fierce Boreal Armguards
						i(193815),	-- Homeland Raid Horn
						i(193816),	-- Lost Hero's Waist Wrap
						i(193819),	-- Old Seafarer's Headpiece
						i(193820),	-- Stout Shield
						i(193817),	-- Treads of the Swift
					},
				}),
				e(2487, {	-- Bromach
					["crs"] = { 184018 },	-- Bromach
					["groups"] = {
						i(193809),	-- Bromach's Disentombed Locket
						i(193813),	-- Excavated Earthen Wristslabs
						i(193810),	-- Miner's Sturdy Trousers
						i(193818),	-- Rock Shovelers
						i(193668),	-- Troggskin Waistband
						i(193814),	-- Unearthed Trogglodicer
					},
				}),
				e(2484, {	-- Sentinel Talondras
					["crs"] = { 184124 },	-- Sentinel Talondras
					["groups"] = {
						i(193806),	-- Ancient Crosswrapped Sandals
						i(193804),	-- Eternal Sentry's Ring
						i(193805, {	-- Inexorable Resonator
							["timeline"] = { ADDED_10_0_2_LAUNCH, REMOVED_10_2_6 },
						}),
						i(212756, {	-- Inexorable Resonator
							["timeline"] = { ADDED_10_2_6 },
						}),
						i(193808),	-- Sentinel's Battle Lance
						i(193807),	-- Shoulders of Animated Stone
					},
				}),
				e(2476, {	-- Emberon
					["crs"] = { 184422 },
					["groups"] = {
						i(193792),	-- Animated Shackles
						i(193811),	-- Annora's Punctured Leggings
						i(193797),	-- Bouldersplitter
						i(193794),	-- Gatekeeper's Girdle
						i(193795),	-- Keeper's Iron Grips
						i(193796),	-- Vault Piercer
					},
				}),
				e(2479, {	-- Chrono-Lord Deios
					["crs"] = { 184125 },	-- Chrono-Lord Deios
					["groups"] = {
						ach(16278),	-- Uldaman: Legacy of Tyr
						i(193799),	-- Crazed Traveler's Legwraps
						i(193801),	-- Fatebound Chainmail
						i(193803),	-- Infinite Dragonspire
						i(193802),	-- Pauldrons of Immutable Truth
						i(193791),	-- Time-Breaching Talon
						i(193800),	-- Vision of Foreshadowed Ends
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS, {
				e(2479, {	-- Chrono-Lord Deios
					["crs"] = { 184125 },	-- Chrono-Lord Deios
					["groups"] = {
						ach(16279),	-- Heroic: Uldaman: Legacy of Tyr
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MYTHIC, {
				e(2487, {	-- Bromach
					["crs"] = { 184018 },	-- Bromach
					["groups"] = {
						ach(16337),	-- It's a Trogg Eat Trogg World
					},
				}),
				e(2484, {	-- Sentinel Talondras
					["crs"] = { 184124 },	-- Sentinel Talondras
					["groups"] = {
						ach(16282),	-- No, You're Stunning!
					},
				}),
				e(2479, {	-- Chrono-Lord Deios
					["crs"] = { 184125 },	-- Chrono-Lord Deios
					["groups"] = {
						ach(16280),	-- Mythic: Uldaman: Legacy of Tyr
						ach(17103),	-- Mythic: Uldaman: Legacy of Tyr Guild Run
						ach(16281),	-- Like Sands Through the Hourglass
					},
				}),
			}),
		},
	}),
})));
