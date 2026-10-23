---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(DRAGON_ISLES, VALDRAKKEN, {
	timeline = { ADDED_10_0_2_LAUNCH },
	groups = {
		n(ACHIEVEMENTS, {
			ach(16101, {	-- Dragon Glyphs: Valdrakken
				coord = { 59.0, 38.4, VALDRAKKEN },
			}),
			ach(16338, {	-- Fang Flap Fire Fighter
				provider = { "o", 381653 },	-- Fang Flap Fire Signups
				coord = { 42.8, 69.3, VALDRAKKEN },
			}),
			ach(16556, {	-- Great Gourmand of The Ruby Feast
				coord = { 61.0, 12.2, VALDRAKKEN },
			}),
		}),
	},
});
