-------------------
-- BLACKSMITHING --
-------------------
BLACKSMITHING_RECIPES = {
	APPRENTICE = {
		r(2018, {	-- Blacksmithing (Apprentice)
			["lvl"] = 5,
			["rank"] = 1,
		}),
		n(ARMOR, {
			r(2663),	-- Copper Bracers
			r(2661),	-- Copper Chain Belt
			r(3319),	-- Copper Chain Boots
			r(2662),	-- Copper Chain Pants
			r(1252229),	-- Gemmed Copper Boots
			r(1252231),	-- Glowing Copper Boots
			r(12260),	-- Rough Copper Vest
			r(2666),	-- Runed Copper Belt
			r(3323),	-- Runed Copper Gauntlets
			r(3324),	-- Runed Copper Pants
			r(1252230),	-- Strange Copper Boots
		}),
		filter(MISC, {
			r(2665),	-- Coarse Sharpening Stone
			r(3116),	-- Coarse Weightstone
			r(2660),	-- Rough Sharpening Stone
			r(3115),	-- Rough Weightstone
		}),
		filter(REAGENTS, {
			r(1245287),	-- Copper Rod
			r(3320),	-- Rough Grinding Stone
		}),
		n(WEAPONS, {
			r(2738),	-- Copper Axe
			r(3293),	-- Copper Battle Axe
			r(9983),	-- Copper Claymore
			r(8880),	-- Copper Dagger
			r(2737),	-- Copper Mace
			r(2739),	-- Copper Shortsword
			r(7408),	-- Heavy Copper Maul
			r(3294),	-- Thick War Axe
		}),
	},
	JOURNEYMAN = {
		r(3100, {	-- Blacksmithing (Journeyman)
			["lvl"] = 10,
			["rank"] = 2,
		}),
		n(WEAPONS, {
			r(3491),	-- Big Bronze Knife
			r(2740),	-- Bronze Mace
			r(6517),	-- Pearl-handled Dagger
			r(2741),	-- Bronze Axe
			r(2742),	-- Bronze Shortsword
			r(3296),	-- Heavy Bronze Mace
			r(3292),	-- Heavy Copper Broadsword
			r(9985),	-- Bronze Warhammer
			r(9987),	-- Bronze Battle Axe
			r(9986),	-- Bronze Greatsword
		}),
		r(1252250),	-- Acolyte's Chain Helm
		r(1252247),	-- Veteran's Chain Helm
		r(1252248),	-- Guard's Chain Helm
		r(1252249),	-- Protector's Chain Helm
		r(1252251),	-- Crusader's Chain Helm
		r(3328),	-- Rough Bronze Shoulders
		r(1252237),	-- Veteran's Chain Shirt
		r(1252239),	-- Protector's Chain Shirt
		r(1252240),	-- Acolyte's Chain Shirt
		r(1252241),	-- Crusader's Chain Shirt
		r(2670),	-- Rough Bronze Cuirass
		r(2675),	-- Shining Silver Breastplate
		r(2664),	-- Runed Copper Bracers
		r(2672),	-- Patterned Bronze Bracers
		r(3333),	-- Silvered Bronze Gauntlets
		r(1252242),	-- Veteran's Chain Leggings
		r(1252243),	-- Guard's Chain Leggings
		r(1252244),	-- Protector's Chain Leggings
		r(1252245),	-- Acolyte's Chain Leggings
		r(1252246),	-- Crusader's Chain Leggings
		r(2668),	-- Rough Bronze Leggings
		r(7817),	-- Rough Bronze Boots
		r(3331),	-- Silvered Bronze Boots

		r(3326),	-- Coarse Grinding Stone
		r(3337),	-- Heavy Grinding Stone
		r(2674),	-- Heavy Sharpening Stone
		r(3117),	-- Heavy Weightstone
		r(19666),	-- Silver Skeleton Key
		r(7818, {["timeline"] = {REMOVED_5_0_4}}),	-- Silver Rod
	},
	EXPERT = {
		r(3538, {	-- Blacksmithing (Expert)
			["lvl"] = 20,
			["rank"] = 3,
		}),
		r(15972),	-- Glinting Steel Dagger
		r(9993),	-- Heavy Mithril Axe

		r(3501),	-- Green Iron Bracers
		r(3508),	-- Green Iron Hauberk
		r(3502),	-- Green Iron Helm
		r(3506),	-- Green Iron Leggings
		r(9935),	-- Steel Plate Helm
		r(9928),	-- Heavy Mithril Gauntlet
		r(9926),	-- Heavy Mithril Shoulder
		r(9916),	-- Steel Breastplate
		r(7223),	-- Golden Scale Bracers
		r(9931),	-- Mithril Plate Pants

		r(9920),	-- Solid Grinding Stone
		r(9918),	-- Solid Sharpening Stone
		r(9921),	-- Solid Weightstone
		r(19668),	-- Truesilver Skeleton Key
		r(19667),	-- Golden Skeleton Key
		r(14379, {["timeline"] = {REMOVED_5_0_4}}),	-- Golden Rod
		r(8768),	-- Iron Buckle
		
		r(14380, {["timeline"] = {REMOVED_5_0_4}}),	-- Truesilver Rod
	
	},
	ARTISAN = {
		r(9785, {	-- Blacksmithing (Artisan)
			["lvl"] = 35,
			["rank"] = 4,
		}),
		n(WEAPONS, {
			r(10001),	-- Big Black Mace
		}),
		r(9968),	-- Heavy Mithril Boots
		r(9959),	-- Heavy Mithril Breastplate
		r(9961),	-- Mithril Coif
		r(1252292),	-- Shining Mithril Helm

		r(20201, {["timeline"] = {REMOVED_5_0_4}}),	-- Arcanite Rod
		r(19669),	-- Arcanite Skeleton Key
		r(16639),	-- Dense Grinding Stone
		r(16641),	-- Dense Sharpening Stone
		r(16640),	-- Dense Weightstone
	},
	WEAPONSMITHING = {
		r(WEAPONSMITH),
		r(MASTER_AXESMITH),
		r(MASTER_HAMMERSMITH),
		r(MASTER_SWORDSMITH),
		r(10003),	-- The Shatterer
		r(10007),	-- Phantom Blade
		r(10011),	-- Blight
		r(10015),	-- Truesilver Champion
	};
	ARMORSMITHING = {
		r(ARMORSMITH),
		r(9974),	-- Truesilver Breastplate
		r(9954),	-- Truesilver Gauntlets
	};
};
