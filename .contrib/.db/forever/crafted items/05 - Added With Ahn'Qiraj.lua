---------------------------------------------
--    C R A F T A B L E S   M O D U L E    --
---------------------------------------------
root(ROOTS.Craftables, {
	prof(BLACKSMITHING, {
		n(ARMOR, {
			i(22194),	-- Black Grasp of the Destroyer
			i(22191),	-- Obsidian Mail Tunic
			i(22196),	-- Thick Obsidian Breastplate
		}),
		n(WEAPONS, {
			i(22198),	-- Jagged Obsidian Shield
		}),
	}),
	prof(COOKING, {
		i(21023),	-- Dirge's Kickin' Chimaerok Chops
	}),
	--[[
	-- Enchanters can't enchant scrolls in Forever
	-- ... or can they?
	prof(ENCHANTING, {
		i(),	-- Enchant Cloak - Dodge
		i(),	-- Enchant Cloak - Subtlety
		i(),	-- Enchant Cloak - Stealth
		i(),	-- Enchant Gloves - Fire Power
		i(),	-- Enchant Gloves - Frost Power
		i(),	-- Enchant Gloves - Healing Power
		i(),	-- Enchant Gloves - Threat
		i(),	-- Enchant Gloves - Superior Agility
		i(),	-- Enchant Gloves - Shadow Power
	}),
	]]--
	prof(POISONS, {
		i(20844),	-- Deadly Poison V
	}),
});