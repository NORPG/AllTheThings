---------------------------------------------------
--     P R O M O T I O N S   M O D U L E     --
---------------------------------------------------
root(ROOTS.Promotions, n(COLLECTORS_EDITION, bubbleDownSelf({ ["u"] = REAL_MONEY }, {
	n(WORLD_OF_WARCRAFT_FOREVER_COLLECTORS, {
		["description"] = "These rewards are available to anyone who purchased a World of Warcraft: Forever Skyborne Heroic Pack, Skyborne Epic Pack or Warcraft Forever Collection.",
		["groups"] = {
			n(HEROIC_EDITION, {	-- Skyborne Heroic Pack
				-- TODO: Skyborne Race + Zephras Isle Starting Experience
				i(280544),	-- Cerulean Prideclaw (MOUNT!)
				iensemble(271755),	-- Ensemble: Shen'dorei Skyseer's Garb (COSMETIC!)
				i(280740),	-- Shen'dorei Windwell (TOY!)
				i(280623),	-- Veteran Adventurer's Rucksack (COSMETIC!)
			}),
			n(EPIC_EDITION, {	-- Skyborne Epic Pack
				i(281168),	-- Diablo Stone (PET!)
				iensemble(279182),	-- Ensemble: Veteran Adventurer's Outdoor Wear (COSMETIC!)
				i(280404),	-- Lordaeron Forever Tabard (COSMETIC!)
				i(280614),	-- Pachimari (PET!)
				i(281166),	-- Panda Collar (PET!)
				i(280729),	-- Shen'dorei Tabard (COSMETIC!)
				i(280611),	-- Veteran Adventurer's Loyal Companion (MOUNT!)
				i(281167),	-- Zergling Leash (PET!)
			}),
		},
	}),
})));
