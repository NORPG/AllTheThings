---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(DRAGON_ISLES, THE_FORBIDDEN_REACH, {
	timeline = { ADDED_10_0_7 },
	groups = {
		n(FACTIONS, {
			faction(FACTION_DARK_TALONS, {	-- Dark Talons
				races = HORDE_ONLY
			}),
			faction(FACTION_OBSIDIAN_WARDERS, {	-- Obsidian Warders
				races = ALLIANCE_ONLY
			}),
		}),
	},
});
