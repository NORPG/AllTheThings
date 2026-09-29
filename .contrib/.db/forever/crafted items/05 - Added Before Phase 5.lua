---------------------------------------------
--    C R A F T A B L E S   M O D U L E    --
---------------------------------------------
-- CRIEVE NOTE: This was originally added at the end of Phase 4 before the opening of AQ.
root(ROOTS.Craftables, {
	prof(BLACKSMITHING, {
		prof(9788, {	-- Armorsmith
			i(20039),	-- Dark Iron Boots
			i(22385),	-- Titanic Leggings
		}),
		prof(9787, {	-- Weaponsmith
			prof(17040, {	-- Master Hammersmith
				i(22384),	-- Persuader
			}),
			prof(17039, {	-- Master Swordsmith
				i(22383),	-- Sageblade
			}),
		}),
		n(ARMOR, {
			i(20550),	-- Darkrune Breastplate
			i(20549),	-- Darkrune Gauntlets
			i(20551),	-- Darkrune Helm
			i(22197),	-- Heavy Obsidian Belt
			i(22195),	-- Light Obsidian Belt
		}),
	}),
	prof(ENCHANTING, {
		filter(MISC, {
			i(20747),	-- Lesser Mana Oil
			i(20746),	-- Lesser Wizard Oil
			i(20745),	-- Minor Mana Oil
			i(20744),	-- Minor Wizard Oil
			i(20750),	-- Wizard Oil
		}),
	}),
	prof(LEATHERWORKING, {
		prof(10656, {	-- Dragonscale Leatherworking
			applyclassicphase(PHASE_FOUR, i(20380)),	-- Dreamscale Breastplate
		}),
		n(ARMOR, {
			filter(MAIL, {
				applyclassicphase(PHASE_FOUR, i(20476)),	-- Sandstalker Bracers
				applyclassicphase(PHASE_FOUR, i(20478)),	-- Sandstalker Breastplate
				applyclassicphase(PHASE_FOUR, i(20477)),	-- Sandstalker Gauntlets
				applyclassicphase(PHASE_FOUR, i(20481)),	-- Spitfire Bracers
				applyclassicphase(PHASE_FOUR, i(20479)),	-- Spitfire Breastplate
				applyclassicphase(PHASE_FOUR, i(20480)),	-- Spitfire Gauntlets
			}),
		}),
	}),
	prof(TAILORING, {
		filter(BAGS, {
			i(22249),	-- Big Bag of Enchantment
			i(22251),	-- Cenarion Herb Bag
			i(22248),	-- Enchanted Runecloth Bag
			i(22252),	-- Satchel of Cenarius
		}),
	}),
});
