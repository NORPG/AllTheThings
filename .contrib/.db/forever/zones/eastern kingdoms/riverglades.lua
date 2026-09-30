---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(MAP.EASTERN_KINGDOMS, MAP.RIVERGLADES, {
	lore = "A sprawling landscape in the Eastern Kingdom which shifts from lush hillsides to ruined keeps of old.",
	timeline = { TIMELINE.ADDED_1_60_1 },
	icon = 1032150,
	groups = {
		n(ACHIEVEMENTS, {
			ach(62354),	-- Explore Riverglades
		}),
		n(FACTIONS, {
			faction(2826, {	-- Brotherhood of the Horse
				races = ALLIANCE_ONLY,
			}),
		}),
		n(FLIGHT_PATHS, {
			fp(3276, {	-- Farholde Keep, Riverglades
				cr = 257087,	-- Gretchen Mayberry <Gryphon Master>
				coord = { 60.6, 81.6, MAP.RIVERGLADES },
				races = ALLIANCE_ONLY,
			}),
		}),
		n(VENDORS, {
			n(259860, {	-- Martha Wellsworth <General Goods>
				coord = { 64.2, 84.0, MAP.RIVERGLADES },
				races = ALLIANCE_ONLY,
				groups = {
					i(251460),	-- Plans: Mithril Warhammer (RECIPE!)
					i(274977),	-- Recipe: Plain Ol' Paletusk (RECIPE!)
				},
			}),
			n(272646, {	-- Miranda Turner <Cooking Supplier>
				coord = { 63.6, 82.6, MAP.RIVERGLADES },
				races = ALLIANCE_ONLY,
				groups = {
					i(21219),	-- Recipe: Sagefish Delight (RECIPE!)
					i(21099),	-- Recipe: Smoked Sagefish (RECIPE!)
				},
			}),
			n(259861, { -- Paige Armstrong
				coord = { 64.3, 82.0, MAP.RIVERGLADES },
				races = ALLIANCE_ONLY,
				sym = {{ "select", "itemID",
					2429, -- Russet Vest
					3593, -- Russet Belt
					2431, -- Russet Pants
					2432, -- Russet Boots
					3594, -- Russet Bracers
					2434, -- Russet Gloves
					3889, -- Russet Hat
					2463, -- Studded Doublet
					2464, -- Studded Belt
					2465, -- Studded Pants
					2467, -- Studded Boots
					2468, -- Studded Bracers
					2469, -- Studded Gloves
					3890, -- Studded Hat
					2417, -- Augmented Chain Vest
					2419, -- Augmented Chain Belt
					2418, -- Augmented Chain Leggings
					2420, -- Augmented Chain Boots
					2421, -- Augmented Chain Bracers
					2422, -- Augmented Chain Gloves
					3891, -- Augmented Chain Helm
					17189, -- Metal Buckler
					2448, -- Heavy Pavise
					2520, -- Broadsword
					2521, -- Flamberge
					2522, -- Crescent Axe
					2523, -- Bullova
					2524, -- Truncheon
					2525, -- War Hammer
					2526, -- Main Gauche
					2527, -- Battle Staff
				}},
			}),
		}),
	},
});
