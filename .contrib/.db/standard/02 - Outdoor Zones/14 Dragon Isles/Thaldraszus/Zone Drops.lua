---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THALDRASZUS, {
		n(ZONE_DROPS, {
			i(201458, {	-- Aegis of Tyrhold
				["description"] = createLocalizationString({
					readable = "Drops from mobs around the Tyrhold Area, Titan Chests or the Valdrakken Accord Weekly.",
					constant = "DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
					export = true,
					text = {
						en = "Drops from mobs around the Tyrhold Area, Titan Chests or the Valdrakken Accord Weekly.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从提尔要塞区域周围的怪物、泰坦宝箱或瓦德拉肯联军周常中掉落。",
						-- TODO: tw = "",
					},
				}),
			}),
			i(200586, {	-- Derelict Sunglasses
				["cr"] = 197346,	-- Mudgatu
				["coord"] = { 40.6, 45.6, THALDRASZUS },
			}),
			i(201460, {	-- Gavel of Tyrhold
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(194562),	-- Occasional Sand
			i(194262),	-- Pattern: Temporal Spellthread (RECIPE!)
			i(198906),	-- Technique: Illusion Parchment: Arcane Burst (RECIPE!)
			i(189361, {	-- Screechflight Scroll
				["cr"] = 184592,	-- Hawthia Roc-Muncher
				["coord"] = { 48.8, 75.1, THALDRASZUS },
			}),
			i(201734),	-- Technique: Cliffside Wylderdrake: Silver and Blue Armor (RECIPE!)
			i(198893),	-- Technique: Cliffside Wylderdrake: Triple Head Horns (RECIPE!)
			i(201055, {	-- Tyrhold Bindings
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201455, {	-- Tyrhold Broadsword
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201456, {	-- Tyrhold Carbine
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201054, {	-- Tyrhold Drape
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201048, {	-- Tyrhold Epaulets
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201053, {	-- Tyrhold Gloves
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201050, {	-- Tyrhold Leggings
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201461, {	-- Tyrhold Pinnacle
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201457, {	-- Tyrhold Relic
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201049, {	-- Tyrhold Robe
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201056, {	-- Tyrhold Sash
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201459, {	-- Tyrhold Shortsword
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201051, {	-- Tyrhold Slippers
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(201052, {	-- Tyrhold Visage
				["description"] = "~L.DROPS_FROM_MOBS_AROUND_THE_TYRHOLD_AREA_TITAN",
			}),
			i(197708, {	-- Unstable Matrix Core
				["crs"] = {
					198385,	-- Fragmeneted Energy
					193244,	-- Titan Defense Matrix
				},
			}),
			i(197733, {	-- Unsustainable Containment Core
				["cost"] = { { "i", 197708, 5 } },	-- 5x Unstable Matrix Core
			}),
		}),
	}),
})));
