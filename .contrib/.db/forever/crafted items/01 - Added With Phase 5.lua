---------------------------------------------
--    C R A F T A B L E S   M O D U L E    --
---------------------------------------------
root(ROOTS.Craftables, {
	prof(BLACKSMITHING, {
		prof(9788, {	-- Armorsmith
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
			i(22197),	-- Heavy Obsidian Belt
			i(22195),	-- Light Obsidian Belt
		}),
	}),
	prof(ENCHANTING, {
		header(HEADERS.Spell, 13262, {	-- Disenchant
			i(20725, {	-- Nexus Crystal 
				["description"] = "Obtained from disenchanting all epic (purple) quality gear within the ilvl bracket 60-83.",
			}),
		}),
		filter(MISC, {
			i(20747),	-- Lesser Mana Oil
			i(20746),	-- Lesser Wizard Oil
			i(20745),	-- Minor Mana Oil
			i(20744),	-- Minor Wizard Oil
			i(20750),	-- Wizard Oil
		}),
	}),
	prof(MINING, {
		spell(2575, {	-- Mining
			i(22203, {	-- Large Obsidian Shard
				["maps_disp"] = {
					MAP.RUINS_OF_AHNQIRAJ,
					MAP.TEMPLE_OF_AHNQIRAJ,
					MAP.SILITHUS,
				},
				["providers"] = {
					{ "o", 181069 },	-- Large Obsidian Chunk
					{ "o", 181068 },	-- Small Obsidian Chunk
				},
			}),
			i(22202, {	-- Small Obsidian Shard
				["maps_disp"] = {
					MAP.RUINS_OF_AHNQIRAJ,
					MAP.TEMPLE_OF_AHNQIRAJ,
					MAP.SILITHUS,
				},
				["providers"] = {
					{ "o", 181069 },	-- Large Obsidian Chunk
					{ "o", 181068 },	-- Small Obsidian Chunk
				},
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
