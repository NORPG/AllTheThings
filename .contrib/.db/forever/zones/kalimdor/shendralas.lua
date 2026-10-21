---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

maproot(MAP.KALIMDOR, MAP.SHENDRALAS, {
	--lore = "",
	--icon = ,
	timeline = { TIMELINE.ADDED_1_60_1 },
	groups = {
		n(ACHIEVEMENTS, {
			ach(63684),	-- Explore Shen'dralas
		}),
		explorationHeader({
			exploration(16677),	-- Bristleback Retreat
			exploration(16678),	-- Evenshade's Overlook
			exploration(16742),	-- Forlorn Gardens
			exploration(16675),	-- Magram Front
			exploration(16676),	-- Outcast Hideaway
			exploration(2657),	-- Valley of Bones
		}),
	},
});
