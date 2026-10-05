---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(MALDRAXXUS, {
		petbattle(filter(BATTLE_PETS, {
			pet(3051, {	-- Animated Cruor (PET!)
				["description"] = createLocalizationString({
					readable = "Found commonly in the House of Constructs and northeast of Theatre of Pain.",
					constant = "FOUND_COMMONLY_IN_THE_HOUSE_OF_CONSTRUCTS_AND",
					export = true,
					text = {
						en = "Found commonly in the House of Constructs and northeast of Theatre of Pain.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "常见于构造之屋以及苦痛剧场东北方。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 31.8, 28.6, MALDRAXXUS },
					{ 56.2, 41.8, MALDRAXXUS },
					{ 32.0, 23.4, MALDRAXXUS },
				},
			}),
			pet(3050, {	-- Bleak Skitterer (PET!)
				["description"] = createLocalizationString({
					readable = "Found close to these few coords.",
					constant = "FOUND_CLOSE_TO_THESE_FEW_COORDS",
					export = true,
					text = {
						en = "Found close to these few coords.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在这些坐标附近可找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 38.4, 32.8, MALDRAXXUS },
					{ 53.6, 59.8, MALDRAXXUS },
					{ 64.2, 36.6, MALDRAXXUS },
				},
			}),
			pet(2950, {	-- Clutch (PET!)
				["description"] = createLocalizationString({
					readable = "Normally found only around this coord.",
					constant = "NORMALLY_FOUND_ONLY_AROUND_THIS_COORD",
					export = true,
					text = {
						en = "Normally found only around this coord.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "通常只在此坐标附近找到。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 31.8, 28.6, MALDRAXXUS },
			}),
			pet(3083, {	-- Crawbat (PET!)
				["description"] = createLocalizationString({
					readable = "Found commonly around the outside of the ToP arena.",
					constant = "FOUND_COMMONLY_AROUND_THE_OUTSIDE_OF_THE_TOP",
					export = true,
					text = {
						en = "Found commonly around the outside of the ToP arena.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "常见于苦痛剧场竞技场外围。",
						-- TODO: tw = "",
					},
				}),
			}),
			pet(3052, {	-- Necroray Spawnling (PET!)
				["description"] = createLocalizationString({
					readable = "Found around the green slime pools (1) above the House of Plagues and (2) SW of the House of Eyes.",
					constant = "FOUND_AROUND_THE_GREEN_SLIME_POOLS_1_ABOVE_THE",
					export = true,
					text = {
						en = "Found around the green slime pools (1) above the House of Plagues and (2) SW of the House of Eyes.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在瘟疫之屋上方的绿色黏液池（1）以及眼目之屋西南方（2）周围可找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 73.6, 51.2, MALDRAXXUS },
					{ 45.0, 30.4, MALDRAXXUS },
				},
			}),
			pet(3049, {	-- Pulsating Maggot (PET!)
				["description"] = "~L.FOUND_COMMONLY_AROUND_THE_OUTSIDE_OF_THE_TOP",
			}),
		})),
	}),
})));
