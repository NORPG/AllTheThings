-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_FOUR_RUBYSANCTUM, bubbleDown({ ["timeline"] = { ADDED_3_3_5 } }, {
	inst(761, {	-- The Ruby Sanctum
		["mapID"] = THE_RUBY_SANCTUM,
		["coord"] = { 61.2, 52.7, DRAGONBLIGHT },
		-- #if AFTER CATA
		["sharedLockout"] = 1,
		-- #endif
		["isRaid"] = true,
		["lvl"] = 80,
		["groups"] = {
			n(QUESTS, {
				q(26013, {	-- Assault on the Sanctum
					["sourceQuest"] = 26012,	-- Trouble at Wyrmrest
					["qg"] = 27990,	-- Krasus <Consort of the Queen>
					["coord"] = { 59.7, 54.6, DRAGONBLIGHT },
				}),
				q(26034, {	-- The Twilight Destroyer
					["sourceQuest"] = 26013,	-- Assault on the Sanctum
					["qg"] = 40429,	-- Sanctum Guardian Xerestrasza
					["groups"] = {
						objective(1, {	-- 0/1 Halion slain
							["provider"] = { "n", 39863 },	-- Halion
						}),
					},
				}),
				q(26012, {	-- Trouble at Wyrmrest
					["description"] = createLocalizationString({
						readable = "You need to have cleared the first four bosses in Icecrown Citadel before this quest will be available to you.",
						constant = "YOU_NEED_TO_HAVE_CLEARED_THE_FIRST_FOUR_BOSSES",
						export = true,
						text = {
							en = "You need to have cleared the first four bosses in Icecrown Citadel before this quest will be available to you.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "你需要先击杀冰冠堡垒的前四个首领，此任务才会对你可用。",
							-- TODO: tw = "",
						},
					}),
					["sourceAchievements"] = {
						4531,	-- Storming the Citadel (10 Player)
						4604,	-- Storming the Citadel (25 Player)
					},
					["qg"] = 16128,	-- Rhonin
					["coord"] = { 30.6, 48.6, NORTHREND_DALARAN },
					["maps"] = { DRAGONBLIGHT },
					["isBreadcrumb"] = true,
				}),
			}),
			n(39751, {	-- Baltharus the Warborn
				["description"] = createLocalizationString({
					readable = "Must be killed before you can fight General Zarithrian or talk to the quest giver.",
					constant = "MUST_BE_KILLED_BEFORE_YOU_CAN_FIGHT_GENERAL",
					export = true,
					text = {
						en = "Must be killed before you can fight General Zarithrian or talk to the quest giver.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "必须先将其击杀，才能与扎里思瑞安将军交战或与任务给予者交谈。",
						-- TODO: tw = "",
					},
				}),
			}),
			n(39747, {	-- Saviana Ragefire
				["description"] = createLocalizationString({
					readable = "Must be killed before you can fight General Zarithrian.",
					constant = "MUST_BE_KILLED_BEFORE_YOU_CAN_FIGHT_GENERAL_2",
					export = true,
					text = {
						en = "Must be killed before you can fight General Zarithrian.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "必须先将其击杀，才能与扎里思瑞安将军交战。",
						-- TODO: tw = "",
					},
				})
			}),
			n(39746, {	-- General Zarithrian
				["description"] = createLocalizationString({
					readable = "Must be killed before you can fight Halion.",
					constant = "MUST_BE_KILLED_BEFORE_YOU_CAN_FIGHT_HALION",
					export = true,
					text = {
						en = "Must be killed before you can fight Halion.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "必须先将其击杀，才能与海莱恩交战。",
						-- TODO: tw = "",
					},
				})
			}),
			d(DIFFICULTY.LEGACY_RAID.PLAYER10_NORMAL, {
				e(1652, {	-- Halion
					["creatureID"] = 39863,	-- Halion
					["groups"] = {
						ach(4817),	-- The Twilight Destroyer (10 player)
						i(53103),	-- Baltharus' Gift
						i(53113),	-- Twilight Scale Shoulders			//** Confirmed Drop 4/19/19
						i(53115),	-- Abduction's Cover
						i(53114),	-- Gloaming Sark
						i(53112),	-- Bracers of the Heir
						i(53117),	-- Changeling Gloves				//** Confirmed Drop 4/19/19
						i(53118),	-- Misbegotten Belt					//** Confirmed Drop 4/19/19
						i(53121),	-- Surrogate Belt
						i(53119),	-- Boots of Divided Being
						i(53111),	-- Scion's Treads
						i(53116),	-- Saviana's Tribute
						i(53110),	-- Zarithrian's Offering
					},
				}),
			}),
			d(DIFFICULTY.LEGACY_RAID.PLAYER10_HEROIC, {
				e(1652, {	-- Halion
					["creatureID"] = 39863,	-- Halion
					["groups"] = {
						ach(4818),	-- Heroic: The Twilight Destroyer (10 player)
						ach(5022, {	-- The Twilight Destroyer - Guild Edition
							["timeline"] = { ADDED_4_0_3 },
						}),
						i(54557),	-- Baltharus' Gift					//** Confirmed Drop 4/19/19
						i(54566),	-- Twilight Scale Shoulders			//** Confirmed Drop 4/19/19
						i(54556),	-- Abduction's Cover
						i(54561),	-- Gloaming Sark
						i(54559),	-- Bracers of the Heir
						i(54560),	-- Changeling Gloves				//** Confirmed Drop 4/19/19
						i(54562),	-- Misbegotten Belt
						i(54565),	-- Surrogate Belt					//** Confirmed Drop 4/19/19
						i(54558),	-- Boots of Divided Being			//** Confirmed Drop 4/19/19
						i(54564),	-- Scion's Treads
						i(54563),	-- Saviana's Tribute				//** Confirmed Drop 4/19/19
						i(54567),	-- Zarithrian's Offering
					},
				}),
			}),
			d(DIFFICULTY.LEGACY_RAID.PLAYER25_NORMAL, {
				e(1652, {	-- Halion
					["creatureID"] = 39863,	-- Halion
					["groups"] = {
						ach(4815),	-- The Twilight Destroyer (25 player)
						i(53132),	-- Penumbra Pendant
						i(53489),	-- Cloak of Burning Dusk			//** Confirmed Drop 4/19/19
						i(53486),	-- Bracers of Fiery Night
						i(53134),	-- Phaseshifter's Bracers			//** Confirmed Drop 4/19/19
						i(53126),	-- Umbrage Armbands
						i(53488),	-- Split Shape Belt
						i(53125),	-- Apocalypse's Advance
						i(53487),	-- Foreshadow Steps					//** Confirmed Drop 4/19/19
						i(53127),	-- Returning Footfalls
						i(53129),	-- Treads of Impending Resurrection	//** Confirmed Drop 4/19/19
						i(53490),	-- Ring of Phased Regeneration		//** Confirmed Drop 4/19/19
						i(53133),	-- Signet of Twilight
						i(54572),	-- Charred Twilight Scale
						i(54573),	-- Glowing Twilight Scale
						i(54571),	-- Petrified Twilight Scale
						i(54569),	-- Sharpened Twilight Scale
					},
				}),
			}),
			d(DIFFICULTY.LEGACY_RAID.PLAYER25_HEROIC, {
				e(1652, {	-- Halion
					["creatureID"] = 39863,	-- Halion
					["groups"] = {
						ach(4816),	-- Heroic: The Twilight Destroyer (25 player)
						ach(5022, {	-- The Twilight Destroyer - Guild Edition
							["timeline"] = { ADDED_4_0_3 },
						}),
						i(54581),	-- Penumbra Pendant
						i(54583),	-- Cloak of Burning Dusk			//** Confirmed Drop 4/19/19
						i(54582),	-- Bracers of Fiery Night			//** Confirmed Drop 4/19/19
						i(54584),	-- Phaseshifter's Bracers			//** Confirmed Drop 4/19/19
						i(54580),	-- Umbrage Armbands
						i(54587),	-- Split Shape Belt					//** Confirmed Drop 4/19/19
						i(54578),	-- Apocalypse's Advance				//** Confirmed Drop 4/19/19
						i(54586),	-- Foreshadow Steps
						i(54577),	-- Returning Footfalls				//** Confirmed Drop 4/19/19
						i(54579),	-- Treads of Impending Resurrection
						i(54585),	-- Ring of Phased Regeneration
						i(54576),	-- Signet of Twilight				//** Confirmed Drop 4/19/19
						i(54588),	-- Charred Twilight Scale
						i(54589),	-- Glowing Twilight Scale			//** Confirmed Drop 4/19/19
						i(54591),	-- Petrified Twilight Scale
						i(54590),	-- Sharpened Twilight Scale			//** Confirmed Drop 4/19/19
					},
				}),
			}),
		},
	}),
}))));
