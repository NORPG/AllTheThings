---------------------------------------------
--    C R A F T A B L E S   M O D U L E    --
---------------------------------------------
-- CRIEVE NOTE: Doing it this way to make phase locking later easier and less disgusting to look at.
root(ROOTS.Craftables, {
	prof(ALCHEMY, {
		filter(CONSUMABLES, {
			i(18253),	-- Major Rejuvenation Potion
		}),
	}),
	prof(BLACKSMITHING, {
		filter(MISC, {
			i(18262),	-- Elemental Sharpening Stone
		}),
	}),
	--[[
	-- Enchanters can't enchant scrolls in Forever
	-- ... or can they?
	prof(ENCHANTING, {
		i(),	-- Enchant Weapon - Healing Power
		i(),	-- Enchant Weapon - Spell Power
	}),
	]]--
	prof(ENGINEERING, {
		n(WEAPONS, {
			i(18282),	-- Core Marksman Rifle
			i(18168),	-- Force Reactive Disk
		}),
		n(WEAPON_ENCHANTMENTS, {
			i(18283),	-- Biznicks 247x128 Accurascope
		}),
	}),
	prof(LEATHERWORKING, {
		filter(MISC, {
			i(18251),	-- Core Armor Kit
		}),
	}),
	prof(TAILORING, {
		n(ARMOR, {
			i(18263),	-- Flarecore Wraps
		}),
		filter(BAGS, {
			i(21342),	-- Core Felcloth Bag
		}),
	}),
});
