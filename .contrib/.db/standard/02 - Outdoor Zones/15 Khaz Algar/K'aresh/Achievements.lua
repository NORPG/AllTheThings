---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(KARESH, {
		n(ACHIEVEMENTS, {
			ach(42731),	-- Become a Hero. Become a Phasediver!
			ach(41979, {	-- Bounty Seeker (automated)
				i(245255),	-- Starlight (PET!)
			}),
			ach(41778, {	-- Brokers Don't Care How You Win
				crit(103854, {
					["_quests"] = { 85481 },	-- Ridge Racer
				}),
				crit(103855, {
					["_quests"] = { 89065 },	-- Ray-cing for the Future
				}),
			}),
			ach(42737),	-- Capstoned (automated)
			ach(42729, {	-- Dangerous Prowlers of K'aresh (automated)
				crit(106220, {	-- C.T. <Systems Scanner>
					["coord"] = { 47.9, 62.6, KARESH },
				}),
				crit(106225, {	-- Empurror
					["description"] = createLocalizationString({
						readable = "Must fly up to reach him.",
						constant = "MUST_FLY_UP_TO_REACH_HIM",
						export = true,
						text = {
							en = "Must fly up to reach him.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "必须向上飞行才能到达他那里。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 73.2, 23.7, KARESH },
				}),
				crit(106226, {	-- K'aresh'ire
					["description"] = createLocalizationString({
						readable = "Phases between Visible and Untethered space every 10 seconds.",
						constant = "PHASES_BETWEEN_VISIBLE_AND_UNTETHERED_SPACE",
						export = true,
						text = {
							en = "Phases between Visible and Untethered space every 10 seconds.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "每 10 秒在可见空间与未束缚空间之间相位切换。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 70.2, 54.2, KARESH },
				}),
				crit(106221, {	-- Little Ms. Phaser
					["description"] = createLocalizationString({
						readable = "Phases between Visible and Untethered space every 15-20 seconds.",
						constant = "PHASES_BETWEEN_VISIBLE_AND_UNTETHERED_SPACE_2",
						export = true,
						text = {
							en = "Phases between Visible and Untethered space every 15-20 seconds.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "每 15-20 秒在可见空间与未束缚空间之间相位切换。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 50.4, 59.2, KARESH },
				}),
				crit(106222, {	-- Mar <Alley Queen of Tazavesh>
					["coord"] = { 61.0, 55.5, KARESH_TAZAVESH },
				}),
				crit(106223, {	-- The King in Silver
					["description"] = createLocalizationString({
						readable = "You need to Phasedive in order to see the Purrkin.",
						constant = "YOU_NEED_TO_PHASEDIVE_IN_ORDER_TO_SEE_THE",
						export = true,
						text = {
							en = "You need to Phasedive in order to see the Purrkin.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "你需要进行相位潜行才能看到喵尔金。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 47.6, 37.4, KARESH },
				}),
			}),
			ach(41811),	-- Ecological Stability (automated)
			ach(41815),	-- Ecological Succession (automated)
			ach(41809),	-- Ecological Variety (automated)
			ach(41812),	-- Expertly Done (automated)
			ach(42740),	-- Explore K'aresh (automated)
			ach(42736),	-- Ixthar's Legacy (automated)
			ach(42727),	-- K'aresh Glyph Hunter (automated)
			ach(41978, {	-- Moonlighter
				iensemble(244140),	-- Ethereal Sash Cache
			}),
			ach(41808),	-- Otherworldly Ecologist (automated)
			ach(42742, {	-- Power of the Reshii
				i(247703),	-- Reshii Hood
				i(247704),	-- Reshii Mantle
			}),
			ach(61916, {	-- Rage of the Ren'dorei
				["timeline"] = { ADDED_12_0_0 },
			}),
			ach(42761),	-- Remnants of a Shattered World (automated)
			ach(60890),	-- Secrets of the K'areshi (automated)
			skyriding(ach(42717, {	-- Skyriding Glyphs: Castigaar
				["coord"] = { 61.0, 38.7, KARESH },
			})),
			skyriding(ach(42718, {	-- Skyriding Glyphs: Eco-Dome: Primus
				["coord"] = { 46.5, 58.4, KARESH },
			})),
			skyriding(ach(42715, {	-- Skyriding Glyphs: Fracture of Laacuna
				["coord"] = { 54.7, 23.4, KARESH },
			})),
			skyriding(ach(42719, {	-- Skydiving Glyphs: North Sufaad
				["coord"] = { 76.5, 46.3, KARESH },
			})),
			skyriding(ach(42713, {	-- Skyriding Glyphs: Serrated Peaks
				["coord"] = { 54.7, 53.2, KARESH },
			})),
			skyriding(ach(42716, {	-- Skydiving Glyphs: Shadow Point
				["coord"] = { 43.9, 17.0, KARESH },
			})),
			skyriding(ach(42712, {	-- Skyriding Glyphs: Tazavesh, the Veiled Market
				["coord"] = { 55.1, 67.5, KARESH_TAZAVESH },
			})),
			skyriding(ach(42714, {	-- Skyriding Glyphs: The Oasis
				["coord"] = { 74.1, 32.5, KARESH },
			})),
			ach(42739),	-- Sojourner of K'aresh (automated)
			ach(41970),	-- The Knife's Edge (automated)
			pvp(ach(42131)),	-- Tour of Duty: K'aresh
			ach(42741),	-- Treasures of K'aresh (automated)
			ach(60889),	-- Unraveled and Persevering (automated)
			ach(41980, {	-- Vigilante (automated)
				i(237485),	-- Terror of the Night (MOUNT!)
			}),
			ach(42738),	-- We've All Got Swords! (automated)
		}),
	}),
}));
