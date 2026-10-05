---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
root(ROOTS.Zones, m(BROKEN_ISLES, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	m(VALSHARAH, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(93758, {	-- Antydas Nightcaller
				["description"] = createLocalizationString({
					readable = "This part of the 'Adventurer of Val'sharah' achievement doesn't involve killing a rare, but stealing an NPC's treasure. The treasure chest is on the second floor of the building and can be found directly across the room from Antydas, hidden next to the sink. Enjoy your foray into larceny!",
					constant = "THIS_PART_OF_THE_ADVENTURER_OF_VAL_SHARAH",
					export = true,
					text = {
						en = "This part of the 'Adventurer of Val'sharah' achievement doesn't involve killing a rare, but stealing an NPC's treasure. The treasure chest is on the second floor of the building and can be found directly across the room from Antydas, hidden next to the sink. Enjoy your foray into larceny!",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "“瓦尔莎拉冒险家”成就的这一部分并不涉及杀死稀有生物，而是偷取一个 NPC 的宝藏。宝箱在建筑二楼，位于安提达斯对面房间的另一侧，藏在水槽旁边。祝你行窃愉快！",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 64.5, 85.3, VALSHARAH },
				["questID"] = 38903,
				["isDaily"] = IGNORED_VALUE,
			}),
			n(110562, {	-- Bahagar
				["coord"] = { 45.2, 88.1, VALSHARAH },
				["questID"] = 43446,
				["groups"] = {
					i(130135),	-- Mana-Prowler Leggings
				},
			}),
			n(92965, {	-- Darkshade
				["coord"] = { 44.0, 52.5, VALSHARAH },
				["questID"] = 38767,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(130166),	-- Risen Saber Kitten (PET!)
				},
			}),
			n(97517, {	-- Dreadbog
				["coord"] = { 60.4, 44.1, VALSHARAH },
				["questID"] = 39858,
				["groups"] = {
					i(130125),	-- Dreadbog Fungalflesh Cape
				},
			}),
			n(92334, {	-- Elindya Featherlight (Skul'vrax)
				["description"] = createLocalizationString({
					readable = "Revive Elindya Featherlight, follow her to Swiftflight and Skul'vrax will spawn.",
					constant = "REVIVE_ELINDYA_FEATHERLIGHT_FOLLOW_HER_TO",
					export = true,
					text = {
						en = "Revive Elindya Featherlight, follow her to Swiftflight and Skul'vrax will spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "复活艾琳迪亚·羽光，跟随她到迅翼处，斯库尔瓦克斯就会刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 93654 },	-- Skul'vrax
				["coord"] = { 60.4, 90.7, VALSHARAH },
				["questID"] = 38887,
				["groups"] = {
					i(130115),	-- Darkfiend Slippers
				},
			}),
			n(93679, {	-- Gathenak the Subjugator
				["crs"] = { 112472 },	-- Tehd Shoemaker
				["coord"] = { 49.1, 47.4, VALSHARAH },
				["questID"] = 44070,
				["groups"] = {
					i(132359),	-- The Subjugator's Shackles
				},
			}),
			n(92117, {	-- Gorebeak
				["crs"] = { 92111 },	-- Lorel Sagefeather
				["coord"] = { 59.7, 77.2, VALSHARAH },
				["questID"] = 38468,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(130154),	-- Pygmy Owl (PET!)
				},
			}),
			n(95123, {	-- Grelda the Hag
				["coord"] = { 66.0, 52.5, VALSHARAH },
				["questID"] = 40126,
				["groups"] = {
					i(130122),	-- Grelda's Ageless Pendant
				},
			}),
			n(93030, {	-- Ironbranch
				["coord"] = { 58.8, 33.9, VALSHARAH },
				["questID"] = 40080,
				["groups"] = {
					i(130126),	-- Iron Branch
				},
			}),
			n(94414, {	-- Kiranys Duskwhisper
				["coord"] = { 34.4, 58.3, VALSHARAH },
				["questID"] = 39121,
			}),
			n(98241, {	-- Lyrath Moonfeather
				["coord"] = { 61.9, 30.2, VALSHARAH },
				["questID"] = 40079,
				["groups"] = {
					i(130118),	-- Moonfeather Handwraps
				},
			}),
			n(95221, {	-- Mad Henryk
				["coord"] = { 47.1, 57.8, VALSHARAH },
				["questID"] = 39357,
				["groups"] = {
					i(130214),	-- Worn Doll (TOY!)
				},
			}),
			n(95318, {	-- Perrexx the Corruptor
				["coord"] = { 61.1, 69.9, VALSHARAH },
				["questID"] = 39596,
				["groups"] = {
					i(130137),	-- Bramblevine Spaulders
				},
			}),
			n(94485, {	-- Pollous the Fetid
				["coord"] = { 67.0, 44.0, VALSHARAH },
				["questID"] = 39130,
				["groups"] = {
					i(130168),	-- Fetid Waveling (PET!)
				},
			}),
			n(92180, {	-- Seersei
				["coord"] = { 41.8, 77.7, VALSHARAH },
				["questID"] = 38479,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(130171),	-- Cursed Orb (TOY!)
				},
			}),
			n(92423, {	-- Theryssia
				["description"] = createLocalizationString({
					readable = "Click on Theryssia's nameplate on the gravestone.",
					constant = "CLICK_ON_THERYSSIA_S_NAMEPLATE_ON_THE",
					export = true,
					text = {
						en = "Click on Theryssia's nameplate on the gravestone.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击墓碑上瑟瑞西亚的姓名板。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 38.0, 52.8, VALSHARAH },
				["questID"] = 38772,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(130136),	-- Theryssia's White Gown
				},
			}),
			n(93205, {	-- Thondrax
				["coord"] = { 62.6, 47.8, VALSHARAH },
				["questID"] = 38780,
				["isDaily"] = IGNORED_VALUE,
				["groups"] = {
					i(130121),	-- Thondrax's Night-Runed Bands
				},
			}),
			n(109708, {	-- Undergrell Ringleader
				["crs"] = { 109225 },	-- Elandris Bladesong
				["coord"] = { 67.0, 69.5, VALSHARAH },
				["questID"] = 43176,
				["groups"] = {
					i(130133),	-- Undergrell Mobilehelm
				},
			}),
			o(241128, {	-- Unguarded Thistleleaf Treasure
				["coord"] = { 55.4, 77.6, VALSHARAH },
				["questID"] = 38466,
				["groups"] = {
					i(130147),	-- Thistleleaf Branch (TOY!)
				},
			}),
			n(97504, {	-- Wraithtalon
				["coord"] = { 66.6, 37.0, VALSHARAH },
				["questID"] = 39856,
				["groups"] = {
					i(130116),	-- Twisted Wraithtalon Gloves
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.LEGION, bubbleDownSelf({ ["timeline"] = { ADDED_7_0_3 } }, {
	m(BROKEN_ISLES, {
		m(VALSHARAH, {
			n(RARES, {
				q(45500),	-- Shalas'aman, I see there is a vignette in Todo about this
				q(43447),	-- Vignette: Wraithtalon - secondary trigger for Wraithtalon rare in Val'sharah
			}),
		}),
	}),
})));
