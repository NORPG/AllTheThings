---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(BASTION, {
		petbattle(filter(BATTLE_PETS, {
			pet(2936),	-- Copperfur Kit (PET!)
			pet(2926, {	-- Fledgling Teroclaw (PET!)
				["description"] = createLocalizationString({
					readable = "Inside one of the cartel's containment units, next to a few other Bastion animals. The pet's respawn time is less than 5 minutes.",
					constant = "INSIDE_ONE_OF_THE_CARTEL_S_CONTAINMENT_UNITS",
					export = true,
					text = {
						en = "Inside one of the cartel's containment units, next to a few other Bastion animals. The pet's respawn time is less than 5 minutes.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在某个卡特尔的一个收容单元内，旁边还有几只晋升堡垒的动物。这只宠物的刷新时间不到 5 分钟。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 31.6, 34.1, BASTION },
			}),
			pet(2927),	-- Fluttering Glimmerfly (PET!)
			pet(2930, {	-- Glimmerpool Hatchling (PET!)
				["description"] = createLocalizationString({
					readable = "Found mostly around these few coords.",
					constant = "FOUND_MOSTLY_AROUND_THESE_FEW_COORDS",
					export = true,
					text = {
						en = "Found mostly around these few coords.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "大多可在这几个坐标附近找到。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 53.8, 32.8, BASTION },
					{ 49.6, 62.0, BASTION },
					{ 46.0, 34.0, BASTION },
					{ 44.8, 29.8, BASTION },
				},
			}),
			pet(2937),	-- Rustfur Kit (PET!)
			pet(2929),	-- Vibrant Glimmerfly (PET!)
			pet(2939, {	-- Wader Chick (PET!)
				["description"] = "~L.FOUND_MOSTLY_AROUND_THESE_FEW_COORDS",
				["coords"] = {
					{ 54.2, 80.8, BASTION },
					{ 53.4, 76.6, BASTION },
					{ 53.4, 72.4, BASTION },
				},
			}),
			pet(2943),	-- Wild Etherwyrm (PET!)
		})),
	}),
})));
