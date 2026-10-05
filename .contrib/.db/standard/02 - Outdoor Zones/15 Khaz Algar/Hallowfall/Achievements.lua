---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(HALLOWFALL, {
		n(ACHIEVEMENTS, {
			ach(40851),	-- Adventurer of Hallowfall (automated)
			ach(40622),	-- Biblo Archivist (automated)
			ach(41188, {	-- Crystal Chronicled
				["timeline"] = { ADDED_11_0_7 },
				-- Meta Achievement
				["sym"] = {{"meta_achievement",
					40851,	-- Adventurer of Hallowfall
					40308,	-- Beacon of Hope
					40622,	-- Biblo Archivist
					40150,	-- Children's Entertainer
					40313,	-- Igniting the Keyflames
					40618,	-- Lost and Found
					40151,	-- Mereldar Menace
					40311,	-- Sharing the Light
					40625,	-- The Missing Lynx
					40848,	-- Treasures of Hallowfall
				}},
			}),
			ach(40826),	-- Explore Hallowfall (automated)
			ach(20594, {	-- Flamegard's Hope
				["description"] = createLocalizationString({
					readable = "Use healing spells, bandages or Algari Healing Potion to heal 20 patients over 20 days. This does not have to be done on consecutive days.",
					constant = "USE_HEALING_SPELLS_BANDAGES_OR_ALGARI_HEALING",
					export = true,
					text = {
						en = "Use healing spells, bandages or Algari Healing Potion to heal 20 patients over 20 days. This does not have to be done on consecutive days.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用治疗法术、绷带或阿拉加治疗药水，在 20 天内治疗 20 名患者。不必在连续的日子里完成。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 43.2, 51.8, HALLOWFALL },
				["crs"] = {
					213306,	-- Injured Solider
					215678,	-- Injured Soldier
					220225,	-- Injured Soldier
				},
			}),
			ach(20598),	-- Hallowfall (automated)
			skyriding(ach(40704, {	-- Hallowfall Glyph Hunter
				-- Meta Achievement
				["sym"] = {{"meta_achievement",
					40685,	-- Skyriding Glyphs: Bleak Sand
					40684,	-- Skyriding Glyphs: Dunelle's Kindness
					40688,	-- Skyriding Glyphs: Fortune's Fall
					40686,	-- Skyriding Glyphs: Mereldar
					40687,	-- Skyriding Glyphs: Priory of the Sacred Flame
					40683,	-- Skyriding Glyphs: Sanguine Grasps
					40682,	-- Skyriding Glyphs: Sina's Yearning
					40681,	-- Skyriding Glyphs: The Fangs
					40690,	-- Skyriding Glyphs: Tenir's Ascent
					40689,	-- Skyriding Glyphs: Velhan's Claim
				}},
			})),
			ach(40360, {	-- Life on the Farm (automated)
				["groups"] = {
					i(226160),	-- Hillhelm Farmhand's Hoe
					i(226161),	-- Hillhelm Farmhand's Watering Can
				},
			}),
			ach(40618, {	-- Lost and Found (automated)
				iensemble(219105),	-- Sandy Quotidian Wear
			}),
			ach(40151, {	-- Mereldar Menace
				["description"] = createLocalizationString({
					readable = "Use Throwing Stone at the 3 coordinates to hit nearby targets. Chat dialogs will indicate success per target.",
					constant = "USE_THROWING_STONE_AT_THE_3_COORDINATES_TO_HIT",
					export = true,
					text = {
						en = "Use Throwing Stone at the 3 coordinates to hit nearby targets. Chat dialogs will indicate success per target.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在 3 个坐标处使用投掷石块击中附近的目标。聊天对话框会提示每个目标是否成功。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "o", 412066 },	-- Throwing Stone
				["coords"] = {
					{ 41.9, 55.5, HALLOWFALL },	-- Throwing Stone
					{ 42.3, 52.5, HALLOWFALL },	-- Throwing Stone
					{ 44.2, 51.2, HALLOWFALL },	-- Throwing Stone
				},
			}),
			ach(40082, {	-- Never Enough
				["crs"] = {
					215254,	-- Alyza Bowblaze (minion)
					219368,	-- Alyza Bowblaze
				},
			}),
			skyriding(ach(40685, {	-- Skyriding Glyphs: Bleak Sand
				["coord"] = { 62.8, 7.2, HALLOWFALL },
			})),
			skyriding(ach(40684, {	-- Skyriding Glyphs: Dunelle's Kindness
				["coord"] = { 69.9, 44.2, HALLOWFALL },
			})),
			skyriding(ach(40688, {	-- Skyriding Glyphs: Fortune's Fall
				["coord"] = { 30.8, 51.6, HALLOWFALL },
			})),
			skyriding(ach(40686, {	-- Skyriding Glyphs: Mereldar
				["coord"] = { 43.3, 52.8, HALLOWFALL },
			})),
			skyriding(ach(40687, {	-- Skyriding Glyphs: Priory of the Sacred Flame
				["coord"] = { 35.4, 33.9, HALLOWFALL },
			})),
			skyriding(ach(40683, {	-- Skyriding Glyphs: Sanguine Grasps
				["coord"] = { 63.6, 65.5, HALLOWFALL },
			})),
			skyriding(ach(40682, {	-- Skyriding Glyphs: Sina's Yearning
				["coord"] = { 57.3, 32.8, HALLOWFALL },
			})),
			skyriding(ach(40681, {	-- Skyriding Glyphs: The Fangs
				["coord"] = { 62.9, 51.8, HALLOWFALL },
			})),
			skyriding(ach(40690, {	-- Skyriding Glyphs: Tenir's Ascent
				["coord"] = { 57.6, 64.6, HALLOWFALL },
			})),
			skyriding(ach(40689, {	-- Skyriding Glyphs: Velhan's Claim
				["coord"] = { 45.7, 12.4, HALLOWFALL },
			})),
			ach(40844),	-- Sojourner of Hallowfall (automated)
			ach(40625, {	-- The Missing Lynx
				crit(68975, {	-- Magpie
					["coord"] = { 60.4, 60.2, HALLOWFALL },
				}),
				crit(68998, {	-- Evan
					["coord"] = { 42.7, 53.8, HALLOWFALL },
				}),
				crit(68999, {	-- Emery
					["coord"] = { 42.7, 53.9, HALLOWFALL },
				}),
				crit(69000, {	-- Jinx
					["coord"] = { 42.2, 54.0, HALLOWFALL },
				}),
				crit(69001, {	-- Moog
					["coord"] = { 69.3, 43.6, HALLOWFALL },
				}),
				crit(69002, {	-- Iggy
					["coord"] = { 69.3, 43.7, HALLOWFALL },
				}),
				crit(69003, {	-- Nightclaw
					["description"] = createLocalizationString({
						readable = "Available when Lesser Keyflame is active.",
						constant = "AVAILABLE_WHEN_LESSER_KEYFLAME_IS_ACTIVE",
						export = true,
						text = {
							en = "Available when Lesser Keyflame is active.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "当小型钥焰激活时可用。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 63.2, 29.3, HALLOWFALL },
				}),
				crit(69004, {	-- Purrlock
					["description"] = createLocalizationString({
						readable = "Available when Light's Blooming Keyflame is active.",
						constant = "AVAILABLE_WHEN_LIGHT_S_BLOOMING_KEYFLAME_IS",
						export = true,
						text = {
							en = "Available when Light's Blooming Keyflame is active.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "当圣光绽放钥焰激活时可用。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 63.8, 29.6, HALLOWFALL },
				}),
				crit(69005, {	-- Shadowpouncer
					["description"] = "~L.AVAILABLE_WHEN_LIGHT_S_BLOOMING_KEYFLAME_IS",
					["coord"] = { 63.3, 28.1, HALLOWFALL },
				}),
				crit(69006, {	-- Miral Murder-Mittens
					["coord"] = { 61.2, 30.5, HALLOWFALL },
				}),
				crit(69007, {	-- Fuzzy
					["coord"] = { 64.3, 18.9, HALLOWFALL },
				}),
				crit(69008, {	-- Furball
					["coord"] = { 64.4, 18.6, HALLOWFALL },
				}),
				crit(69009, {	-- Dander
					["coord"] = { 61.9, 20.8, HALLOWFALL },
				}),
				crit(69010, {	-- Gobbo
					["coord"] = { 42.1, 53.7, HALLOWFALL },
				}),
			}),
			pvp(ach(40085)),	-- Tour of Duty: Hallowfall
			ach(40848),	-- Treasures of Hallowfall (automated)
		}),
	}),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.TWW, {
	m(KHAZ_ALGAR, {
		m(HALLOWFALL, bubbleDownSelf({ ["timeline"] = { ADDED_11_0_2 } }, {
			n(ACHIEVEMENTS, {
				q(79081,name(HEADERS.Achievement,20594,{isDaily=true})),	-- daily progress on 'Flamegard's Hope'
				q(82131, name(HEADERS.NPC,215254)),	-- talking to Alyza Bowblaze and telling her to 'go away'
				q(83624),	-- Choosing 'Novice Formation' difficulty for 'Light's Gambit Champion' (achievementID 40729)
				q(83625),	-- Choosing 'Adept Formation' difficulty for 'Light's Gambit Champion' (achievementID 40729)
				q(83626),	-- Choosing 'Master Formation' difficulty for 'Light's Gambit Champion' (achievementID 40729)
				q(83857),	-- on earning Light's Gambit Champion ach(40729)
			}),
		})),
	}),
}));
