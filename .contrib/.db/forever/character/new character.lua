-------------------------------------------
--    C H A R A C T E R   M O D U L E    --
-------------------------------------------
root(ROOTS.Character, n(NEW_CHARACTER, {
	cl(DRUID, {
		n(ARMOR, {
			i(6124, {	-- Novice's Pants
				["races_disp"] = { NIGHTELF, TAUREN, TROLL },
			}),
			i(6123, {	-- Novice's Robe
				["races_disp"] = { NIGHTELF },
			}),
			i(6139, {	-- Novice's Robe
				["races_disp"] = { TAUREN, TROLL },
			}),
		}),
		n(WEAPONS, {
			i(35),	-- Bent Staff
			i(3661),	-- Handcrafted Staff
		}),
	}),
	cl(HUNTER, {
		n(ARMOR, {
			i(129, {	-- Rugged Trapper's Boots
				["races_disp"] = { HUMAN, DWARF, NIGHTELF, UNDEAD },
			}),
			i(147, {	-- Rugged Trapper's Pants
				["races_disp"] = { HUMAN, DWARF, NIGHTELF, UNDEAD },
			}),
			i(6126, {	-- Trapper's Pants [Orc]
				["timeline"] = { REMOVED_4_0_3 }
			}),
			i(6137, {	-- Thug Pants
				["races_disp"] = { ORC, TAUREN, TROLL },
			}),
			i(6127, {	-- Trapper's Boots [Orc]
				["timeline"] = { REMOVED_4_0_3 }
			}),
		}),
		n(WEAPONS, {
			i(2508),	-- Old Blunderbuss
			i(2504, {	-- Worn Shortbow
				["timeline"] = { REMOVED_9_0_1 }	-- TODO: I am not sure when this got removed.
			}),
		}),
	}),
	cl(MAGE, {
		n(ARMOR, {
			i(55, {	-- Apprentice's Boots
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
			i(1395, {	-- Apprentice's Pants
				["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF, UNDEAD },
			}),
			i(56, {	-- Apprentice's Robe
				["races_disp"] = { HUMAN, DWARF, GNOME },
			}),
			i(6140, {	-- Apprentice's Robe
				["races_disp"] = { UNDEAD },
			}),
		}),
		n(WEAPONS, {
			i(35),	-- Bent Staff
			i(3661),	-- Handcrafted Staff
		}),
	}),
	cl(PALADIN, {
		filter(MOUNTS, {
			mount(13819, {	-- Warhorse (MOUNT!)
				["races"] = { HUMAN, DWARF },
				["classes"] = { PALADIN },
				["lvl"] = 40,
			}),
		}),
		n(ARMOR, {
			i(43, {	-- Squire's Boots
				["races_disp"] = { HUMAN, DWARF },
			}),
			i(44, {	-- Squire's Pants
				["races_disp"] = { HUMAN, DWARF },
			}),
			i(6118, {	-- Squire's Pants [Dwarf]
				["races_disp"] = { DWARF },
			}),
		}),
		n(WEAPONS, {
			i(36),	-- Worn Mace
		}),
	}),
	cl(PRIEST, {
		n(ARMOR, {
			i(6098, {	-- Neophyte's Robe
				["races_disp"] = { HUMAN, DWARF, GNOME },
			}),
			i(6119, {	-- Neophyte's Robe
				["races_disp"] = { NIGHTELF },
			}),
			i(6144, {	-- Neophyte's Robe
				["races_disp"] = { UNDEAD },
			}),
			i(53, {	-- Neophyte's Shirt
				--["classes_display"] = { PRIEST },
			}),
			i(52, {	-- Neophyte's Pants
				["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF, UNDEAD },
			}),
			i(51, {	-- Neophyte's Boots
				["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF, UNDEAD },
			}),
		}),
		n(WEAPONS, {
			i(35),	-- Bent Staff
			i(3661),	-- Handcrafted Staff
		}),
	}),
	cl(ROGUE, {
		n(ARMOR, {
			i(48, {	-- Footpad's Pants
				["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF, UNDEAD },
			}),
			i(47, {	-- Footpad's Shoes
				["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF, UNDEAD },
			}),
			i(120, {	-- Thug Pants
				["races_disp"] = { ORC, TROLL },
			}),
			i(121, {	-- Thug Boots
				["races_disp"] = { ORC, UNDEAD },
			}),
			i(6138, {	-- Thug Boots [Classic] / Trapper's Boots [CATA+]
				["races_disp"] = { TROLL },
			}),
		}),
	}),
	cl(SHAMAN, {
		n(ARMOR, {
			i(153, {	-- Primitive Kilt
				["timeline"] = { REMOVED_4_0_3 }
			}),
			i(6135, {	-- Primitive Kilt
				["timeline"] = { REMOVED_4_0_3 }
			}),
		}),
		n(WEAPONS, {
			i(36),	-- Worn Mace
		}),
	}),
	cl(WARLOCK, {
		filter(MOUNTS, {
			mount(5784, {	-- Felsteed (MOUNT!)
				["classes"] = { WARLOCK },
				["lvl"] = 40,
			}),
		}),
		n(ARMOR, {
			i(6129, {	-- Acolyte's Robe
				["races_disp"] = { UNDEAD },
			}),
			i(57, {	-- Acolyte's Robe
				["races_disp"] = { HUMAN, DWARF, GNOME },
			}),
			i(6097, {	-- Acolyte's Shirt
				["races_disp"] = { HUMAN, GNOME },
			}),
			i(1396, {	-- Acolyte's Pants
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
			i(59, {	-- Acolyte's Shoes
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
		}),
		n(WEAPONS, {
			i(35),	-- Bent Staff
		}),
	}),
	cl(WARRIOR, {
		n(ARMOR, {
			i(6125, {	-- Brawler's Harness
				["races_disp"] = { ORC, TROLL, TAUREN, UNDEAD },
			}),
			i(139, {	-- Brawler's Pants
				["races_disp"] = { ORC, TROLL, TAUREN },
			}),
			i(140, {	-- Brawler's Boots
				["races_disp"] = { ORC, TROLL, TAUREN },
			}),
			
			i(38, {	-- Recruit's Shirt
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
			i(39, {	-- Recruit's Pants
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
			i(40, {	-- Recruit's Boots
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
			
			i(6120, {	-- Recruit's Shirt
				["races_disp"] = { NIGHTELF },
			}),
			i(6121, {	-- Recruit's Pants
				["races_disp"] = { NIGHTELF },
			}),
			i(6122, {	-- Recruit's Boots
				["races_disp"] = { NIGHTELF },
			}),
		}),
		n(WEAPONS, {
			i(12282, {	-- Worn Battleaxe
				["races_disp"] = { ORC, TROLL, TAUREN },
			}),
			i(25, {	-- Worn Shortsword
				["races_disp"] = { HUMAN, DWARF, GNOME, UNDEAD },
			}),
		}),
	}),
	filter(SHIRTS, {
		
		i(49, {	-- Footpad's Shirt
			["description"] = "Starter Shirt for Human, Night Elf, Dwarf & Gnome Rogues",
			--["classes_display"] = { ROGUE },
			["races_disp"] = { HUMAN, DWARF, GNOME, NIGHTELF },
		}),
		i(154, {	-- Primitive Mantle
			["description"] = "Starter Shirt for Orc & Tauren Shamans",
			--["classes_display"] = { SHAMAN },
			["races_disp"] = { ORC, TAUREN },
		}),
		i(6134, {	-- Primitive Mantle
			["description"] = "Starter Shirt for Troll Shamans",
			--["classes_display"] = { SHAMAN },
			["races_disp"] = { TROLL },
		}),
		i(148, {	-- Rugged Trapper's Shirt
			["description"] = "Starter Shirt for Dwarf & Night Elf Hunters",
			--["classes_display"] = { HUNTER },
			["races_disp"] = { DWARF, NIGHTELF },
		}),
		i(6117, {	-- Squire's Shirt
			["description"] = "Starter Shirt for Dwarf Paladins",
			--["classes_display"] = { PALADIN },
			["races_disp"] = { DWARF },
		}),
		i(2105, {	-- Thug Shirt
			["description"] = "Starter Shirt for Undead & Orc Rogues",
			--["classes_display"] = { ROGUE },
			["races_disp"] = { ORC, UNDEAD },
		}),
		i(6136, {	-- Thug Shirt [Classic] / Trapper's Shirt [CATA+]
			["description"] = "Starter Shirt for Troll Rogues",
			--["classes_display"] = { ROGUE },
			["races_disp"] = { TROLL },
		}),
		i(127, {	-- Trapper's Shirt
			["description"] = "Starter Shirt for Orc, Tauren & Troll Hunters",
			--["classes_display"] = { HUNTER },
			["races_disp"] = { ORC, TAUREN, TROLL },
		}),
	}),
	n(WEAPONS, {	-- These were used and changed so many times on different classes, that I leave them here.
		i(2361),	-- Battleworn Hammer
		i(37, {	-- Worn Axe
			["description"] = "Starter Weapon for Orc & Troll Rogues as well as Dwarf, Orc, Tauren & Troll Hunters.",
		}),
		i(2092, {	-- Worn Dagger
			--["classes_display"] = { WARLOCK },
			["races_disp"] = { HUMAN },
		}),
		i(2362, {	-- Worn Wooden Shield
			["classes_display"] = { WARRIOR, SHAMAN, PALADIN },
			["races_disp"] = { HUMAN },
		}),
	}),
	i(6948),	-- Hearthstone
}));
