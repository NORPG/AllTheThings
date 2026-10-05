root(ROOTS.Professions, prof(FIRST_AID, bubbleDownSelf({ ["requireSkill"] = FIRST_AID, ["timeline"] = { REMOVED_8_0_1 } }, {
	expansion(EXPANSION.CLASSIC, bubbleDownSelf({
		["timeline"] = {
			-- #if NOT ANYCLASSIC
			ADDED_3_0_2,
			-- #endif
			REMOVED_8_0_1,
	}}, {
		ach(131),	-- Journeyman in First Aid
		ach(132),	-- Expert in First Aid
		ach(133),	-- Artisan in First Aid
	})),
	expansion(EXPANSION.TBC, applyclassicphase(TBC_PHASE_ONE, bubbleDownSelf({
		["timeline"] = {
			-- #if NOT ANYCLASSIC
			ADDED_3_0_2,
			-- #else
			ADDED_2_0_5,
			-- #endif
			REMOVED_8_0_1,
	}}, {
		ach(134),	-- Master in First Aid
	}))),
	expansion(EXPANSION.WRATH, applyclassicphase(WRATH_PHASE_ONE, bubbleDownSelf({ ["timeline"] = { ADDED_3_0_3, REMOVED_8_0_1 } }, {
		ach(135),	-- Grand Master in First Aid
		-- #if BEFORE BFA
		ach(137, {	-- Stocking Up
			["provider"] = { "i", 34722 },	-- Heavy Frostweave Bandage
		}),
		ach(141, {	-- Ultimate Triage
			["providers"] = {
				{ "i", 34722 },	-- Heavy Frostweave Bandage
				-- #if AFTER CATA
				{ "i", 53049 },	-- Embersilk Bandage
				{ "i", 53051 },	-- Dense Embersilk Bandage
				-- #endif
				-- #if AFTER MOP
				{ "i", 72985 },	-- Windwool Bandage
				{ "i", 72986 },	-- Heavy Windwool Bandage
				-- #endif
			},
		}),
		-- #endif
	}))),
	expansion(EXPANSION.CATA, bubbleDownSelf({ ["timeline"] = { ADDED_4_0_3_LAUNCH, REMOVED_8_0_1 } }, {
		ach(4918),	-- Illustrious Grand Master Medic
		-- #if BEFORE BFA
		ach(5480, {	-- Preparing for Disaster
			["provider"] = { "i", 53051 },	-- Dense Embersilk Bandage
		}),
		-- #endif
	})),
	expansion(EXPANSION.MOP, bubbleDownSelf({ ["timeline"] = { ADDED_5_0_4, REMOVED_8_0_1 } }, {
		ach(6838),	-- Zen Master Medic
	})),
	expansion(EXPANSION.WOD, bubbleDownSelf({ ["timeline"] = { ADDED_6_0_3_LAUNCH, REMOVED_8_0_1 } }, {
		ach(9505),	-- Draenor Medic
	})),
	expansion(EXPANSION.LEGION, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3_LAUNCH, REMOVED_8_0_1 } }, {
		ach(10599),	-- Legion Medic
		ach(11139, {	-- Field Medic!
			["description"] = createLocalizationString({
				readable = "WARNING: You must drop or turn in duplicate quests otherwise you will be unable to loot anymore.",
				constant = "WARNING_YOU_MUST_DROP_OR_TURN_IN_DUPLICATE",
				export = true,
				text = {
					en = "WARNING: You must drop or turn in duplicate quests otherwise you will be unable to loot anymore.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "警告：你必须放弃或交掉重复的任务，否则你将无法继续拾取。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				title(340),	-- Field Medic <Name>
				i(139534, {	-- Bloody Letter
					["criteriaID"] = 34872,	-- Bloody Letter
					["maps"] = { SURAMAR },
					["crs"] = {101783},
					["description"] = createLocalizationString({
						readable = "Northwest Suramar.",
						constant = "NORTHWEST_SURAMAR",
						export = true,
						text = {
							en = "Northwest Suramar.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "苏拉玛西北部。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139522, {	-- Bloody Note
					["criteriaID"] = 34873,	-- Bloody Note
					["maps"] = { MAP.AZSHARA },
					["crs"] = {108133, 108139, 108153, 108146},
					["description"] = createLocalizationString({
						readable = "Pirates in southern-east Azsuna.",
						constant = "PIRATES_IN_SOUTHERN_EAST_AZSUNA",
						export = true,
						text = {
							en = "Pirates in southern-east Azsuna.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "阿苏纳东南部的海盗。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139527, {	-- Bloody Plea
					["criteriaID"] = 34874,	-- Bloody Plea
					["maps"] = { VALSHARAH },
					["crs"] = {93577, 91288},
					["description"] = createLocalizationString({
						readable = "Furbolgs in southern Val'sharah",
						constant = "FURBOLGS_IN_SOUTHERN_VAL_SHARAH",
						export = true,
						text = {
							en = "Furbolgs in southern Val'sharah",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "瓦尔莎拉南部的熊怪",
							-- TODO: tw = "",
						},
					})
				}),
				i(139535, {	-- Bloody Prayer
					["criteriaID"] = 34875,	-- Bloody Prayer
					["maps"] = { SURAMAR },
					["crs"] = {114470},
					["description"] = createLocalizationString({
						readable = "Southwest Suramar City.",
						constant = "SOUTHWEST_SURAMAR_CITY",
						export = true,
						text = {
							en = "Southwest Suramar City.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "苏拉玛城西南部。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139528, {	-- Bloody Request
					["criteriaID"] = 34876,	-- Bloody Request
					["maps"] = { VALSHARAH },
					["crs"] = { 109045 },
					["description"] = createLocalizationString({
						readable = "Grizzleweald (68, 73) in Val'sharah",
						constant = "GRIZZLEWEALD_68_73_IN_VAL_SHARAH",
						export = true,
						text = {
							en = "Grizzleweald (68, 73) in Val'sharah",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "瓦尔莎拉的灰鬃林地 (68, 73)",
							-- TODO: tw = "",
						},
					})
				}),
				i(139524, {	-- Crumpled Letter
					["criteriaID"] = 34877,	-- Crumpled Letter
					["maps"] = { HIGHMOUNTAIN },
					["crs"] = {96774},
					["description"] = createLocalizationString({
						readable = "Western Highmountain next to Skyhorn.",
						constant = "WESTERN_HIGHMOUNTAIN_NEXT_TO_SKYHORN",
						export = true,
						text = {
							en = "Western Highmountain next to Skyhorn.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "至高岭西部，天角附近。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(139525, {	-- Crumpled Note
					["criteriaID"] = 34878,	-- Crumpled Note
					["maps"] = { HIGHMOUNTAIN },
					["crs"] = {104323},
					["description"] = createLocalizationString({
						readable = "Northern Highmountain.",
						constant = "NORTHERN_HIGHMOUNTAIN",
						export = true,
						text = {
							en = "Northern Highmountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "至高岭北部。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139531, {	-- Crumpled Request
					["criteriaID"] = 34879,	-- Crumpled Request
					["maps"] = { STORMHEIM },
					["crs"] = {108030},
					["description"] = createLocalizationString({
						readable = "Vampirates. (Stormheim)",
						constant = "VAMPIRATES_STORMHEIM",
						export = true,
						text = {
							en = "Vampirates. (Stormheim)",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "吸血鬼海盗。（风暴峡湾）",
							-- TODO: tw = "",
						},
					})
				}),
				i(139523, {	-- Fevered Letter
					["criteriaID"] = 34880,	-- Fevered Letter
					["maps"] = { HIGHMOUNTAIN },
					["crs"] = {103177},
					["description"] = createLocalizationString({
						readable = "Southern Highmountain.",
						constant = "SOUTHERN_HIGHMOUNTAIN",
						export = true,
						text = {
							en = "Southern Highmountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "至高岭南部。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139526, {	-- Fevered Note
					["criteriaID"] = 34881,	-- Fevered Note
					["maps"] = { VALSHARAH },
					["crs"] = { 108675 },
					["description"] = createLocalizationString({
						readable = "Southern Val'sharah",
						constant = "SOUTHERN_VAL_SHARAH",
						export = true,
						text = {
							en = "Southern Val'sharah",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "瓦尔莎拉南部",
							-- TODO: tw = "",
						},
					})
				}),
				i(139520, {	-- Fevered Plea
					["criteriaID"] = 34882,	-- Fevered Plea
					["maps"] = { MAP.AZSHARA },
					["crs"] = {111598, 111630, 111586 },
					["description"] = createLocalizationString({
						readable = "Murlocs at the southern tip in Azsuna.",
						constant = "MURLOCS_AT_THE_SOUTHERN_TIP_IN_AZSUNA",
						export = true,
						text = {
							en = "Murlocs at the southern tip in Azsuna.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "阿苏纳南端的鱼人。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139532, {	-- Fevered Prayer
					["criteriaID"] = 34883,	-- Fevered Prayer
					["maps"] = { SURAMAR },
					["crs"] = {101784},
					["description"] = "~L.NORTHWEST_SURAMAR"
				}),
				i(139529, {	-- Fevered Request
					["criteriaID"] = 34884,	-- Fevered Request
					["maps"] = { STORMHEIM },
					["crs"] = {98498, 98500, 98501, 98502, 110258},
					["description"] = createLocalizationString({
						readable = "Murlocs at Morheim (eastern Stormheim).",
						constant = "MURLOCS_AT_MORHEIM_EASTERN_STORMHEIM",
						export = true,
						text = {
							en = "Murlocs at Morheim (eastern Stormheim).",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "莫尔海姆（风暴峡湾东部）的鱼人。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139530, {	-- Singed Letter
					["criteriaID"] = 34885,	-- Singed Letter
					["maps"] = { STORMHEIM },
					["crs"] = {116600},
					["description"] = createLocalizationString({
						readable = "Southern Stormheim.",
						constant = "SOUTHERN_STORMHEIM",
						export = true,
						text = {
							en = "Southern Stormheim.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "风暴峡湾南部。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139521, {	-- Singed Note
					["criteriaID"] = 34886,	-- Singed Note
					["maps"] = { MAP.AZSHARA },
					["crs"] = {88101, 88099, 108146},
					["description"] = createLocalizationString({
						readable = "Murlocs on the left coast of the lake surrounding Nar'thalos Academy.",
						constant = "MURLOCS_ON_THE_LEFT_COAST_OF_THE_LAKE",
						export = true,
						text = {
							en = "Murlocs on the left coast of the lake surrounding Nar'thalos Academy.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "环绕纳萨拉斯学院的湖泊左岸的鱼人。",
							-- TODO: tw = "",
						},
					})
				}),
				i(139533, {	-- Singed Plea
					["criteriaID"] = 34887,	-- Singed Plea
					["maps"] = { SURAMAR },
					["crs"] = {105753, 105625, 113162},
					["description"] = createLocalizationString({
						readable = "Fal'dorei Tunnels.",
						constant = "FAL_DOREI_TUNNELS",
						export = true,
						text = {
							en = "Fal'dorei Tunnels.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "法多雷隧道。",
							-- TODO: tw = "",
						},
					})
				}),
			},
		}),
		achpart(11138, 11139),	-- Is There a Medic in the Zone?
	})),
})));

