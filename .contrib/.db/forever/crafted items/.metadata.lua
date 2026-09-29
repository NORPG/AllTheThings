---------------------------------------------
--    C R A F T A B L E S   M O D U L E    --
---------------------------------------------
root(ROOTS.Craftables, {
	prof(ALCHEMY),
	prof(BLACKSMITHING),
	prof(COOKING),
	prof(ENCHANTING),
	prof(ENGINEERING),
	prof(FIRST_AID),
	prof(FISHING, {
		["description"] = "If you struggle to catch an open water fish in a given zone, try a different spot or a different body of water. There might be local variations of which fish you can reliably catch from a given spot.",
	}),
	prof(HERBALISM, {
		["description"] = "It is beneficial to gather all herbs in the area even if you only need specific herbs because the node spawns are often connected.",
	}),
	prof(LEATHERWORKING),
	prof(MINING, {
		["description"] = "Mining veins are usually found on uneven terrain and mountainsides as well as inside caves. It is beneficial to mine all veins in the area even if you only need specific ore because the node spawns are often connected.",
	}),
	prof(POISONS, {
		["classes"] = { ROGUE },
	}),
	prof(SKINNING, {
		["description"] = "The following items can be gathered by skinning creatures out in the world.",
	}),
	prof(TAILORING),
});
