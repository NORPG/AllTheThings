-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------
-- #IF SEASON_OF_DISCOVERY
root(ROOTS.ExpansionFeatures, expansion(EXPANSION.CLASSIC, {
	cl(HUNTER, {
		header(HEADERS.Item, 206032, {	-- Rune of Carve
			applyclassicphase(SOD_PHASE_ONE, n(209948, {	-- Relaeron <Caretaker>
				["description"] = "Use the musk and tame a Deer and then bring it to Relaeron.",
				["coord"] = { 39.8, 9.2, DARNASSUS },
				["cost"] = {{ "i", 208607, 1 }},	-- Deer Musk
				["maps"] = { TELDRASSIL },
				["crs"] = { 883 },	-- Deer
				["races"] = ALLIANCE_ONLY,
				["groups"] = {
					i(206032, {	-- Rune of Carve
						["classes"] = { HUNTER },
						["groups"] = {
							recipe(425758),	-- Engrave Gloves - Carve
						},
					}),
				},
			})),
		}),
	}),
	cl(MAGE, {
		--
	}),
	cl(WARLOCK, {
		-- Rune of the Felguard
		spell(1120, {	-- Drain Soul
			i(221978, {	-- Explorer's Soul
				spell(445459, {	-- Explorer Imp
					i(220446, {	-- Otherworldly Treasure (15)
						i(221499),	-- Rune of the Felguard
						i(223215),	-- Orah Raka
						i(223219),	-- Fel Cloth Wristbands
						i(223221),	-- Fel Leather Wristbands
						i(223222),	-- Fel Mail Wristbands
					}),
					i(223148, {	-- Otherworldly Treasure (25)
						["sym"] = {{"select","itemID",	
							221499,	-- Rune of the Felguard
						}},
						["groups"] = {
							i(223163),	-- Formula: Scroll of Spatial Mending
							i(223216),	-- Rakkan Archim
							i(223237),	-- Fel Cloth Shoulder Pads
							i(223238),	-- Fel Leather Shoulder Pads
							i(223239),	-- Fel Mail Shoulders
						},
					}),
					i(223149, {	-- Otherworldly Treasure (35)
						["sym"] = {{"select","itemID",	
							223163,	-- Formula: Scroll of Spatial Mending
							221499,	-- Rune of the Felguard
						}},
						["groups"] = {
							i(223217),	-- Rakkas Lek
							i(223240),	-- Fel Cloth Hood
							i(223241),	-- Fel Leather Hat
							i(223242),	-- Fel Mail Coif
						},
					}),
					i(223150, {	-- Otherworldly Treasure (45)
						["sym"] = {{"select","itemID",	
							223163,	-- Formula: Scroll of Spatial Mending
							221499,	-- Rune of the Felguard
						}},
						["groups"] = {
							i(223168),	-- Worldcore Fragment
							i(221547),	-- Coded Warlock Notes
							i(223198),	-- Modas Karkun
							i(223214),	-- Zila Gular
							i(223218),	-- Tor Kieldaz
							i(223248),	-- Fel Cloth Legs
							i(223249),	-- Fel Leather Legs
							i(223250),	-- Fel Mail Legs
							i(223251),	-- Fel Plate Legs
							i(223256),	-- Fel Cloth Robes
							i(223261),	-- Fel Leather Chest
							i(223262),	-- Fel Mail Chest
							i(223263),	-- Fel Plate Chest
						},
					}),
					i(223151, {	-- Otherworldly Treasure (55)
						["sym"] = {{"select","itemID",	
							223163,	-- Formula: Scroll of Spatial Mending
							221499,	-- Rune of the Felguard
						}},
						["groups"] = {
							-- No WOWHEAD Data, but probably the same as Lv45 Container
							i(223168),	-- Worldcore Fragment
							i(221547),	-- Coded Warlock Notes
							i(223198),	-- Modas Karkun
							i(223214),	-- Zila Gular
							i(223218),	-- Tor Kieldaz
							i(223248),	-- Fel Cloth Legs
							i(223249),	-- Fel Leather Legs
							i(223250),	-- Fel Mail Legs
							i(223251),	-- Fel Plate Legs
							i(223256),	-- Fel Cloth Robes
							i(223261),	-- Fel Leather Chest
							i(223262),	-- Fel Mail Chest
							i(223263),	-- Fel Plate Chest
						},
					}),
				}),
			}),
		}),
	}),
})),	
-- #endif