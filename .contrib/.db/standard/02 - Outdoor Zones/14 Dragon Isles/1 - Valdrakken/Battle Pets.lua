---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(DRAGON_ISLES, VALDRAKKEN, {
	timeline = { ADDED_10_0_2_LAUNCH },
	groups = {
		petbattle(filter(BATTLE_PETS, {
			sym = {{"select","speciesID",
				3307,	-- Plucky Duckling (PET!)
				3301,	-- Wild Duckling (PET!)
			}},
		})),
	},
});
