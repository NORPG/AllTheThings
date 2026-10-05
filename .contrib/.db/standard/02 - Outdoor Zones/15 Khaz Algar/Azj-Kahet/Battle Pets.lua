---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(AZJ_KAHET, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				4456,	-- Arachnoid Hatchling (PET!)
				4515,	-- Azure Flickerfly (PET!)
				4499,	-- Common Ploughworm (PET!)
				4498,	-- Ebon Ploughworm (PET!)
				4510,	-- Winged Arachnoid (PET!)
			}},
			["groups"] = {
				pet(4471, {	-- Aubergine Scootlefish (PET!)
					["coords"] = {
						{ 59.7, 70.2, AZJ_KAHET },
						{ 37.4, 54.2, AZJ_KAHET },
						{ 43.5, 64.2, AZJ_KAHET },
					},
				}),
				pet(4480, {	-- Shadowy Oozeling (PET!)
					["description"] = createLocalizationString({
						readable = "Interact with Black Blood Extractor objects in area until you reach at least 10x Unseeming Shift debuff to see this pet.",
						constant = "INTERACT_WITH_BLACK_BLOOD_EXTRACTOR_OBJECTS_IN",
						export = true,
						text = {
							en = "Interact with Black Blood Extractor objects in area until you reach at least 10x Unseeming Shift debuff to see this pet.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与区域内的黑血提取器互动，直到你获得至少 10 层失相变换减益，就能看到这只宠物。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 63.6, 85.1, AZJ_KAHET },
				}),
				pet(3550, {	-- Undermoth (PET!)
					["description"] = createLocalizationString({
						readable = "Backline pet only.",
						constant = "BACKLINE_PET_ONLY",
						export = true,
						text = {
							en = "Backline pet only.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "仅限后排宠物。",
							-- TODO: tw = "",
						},
					}),
					["maps"] = { AZJ_KAHET },
				}),
				pet(4477, {	-- Verdant Scootlefish (PET!)
					["coords"] = {
						{ 38.5, 56.1, AZJ_KAHET },
						{ 40.0, 61.3, AZJ_KAHET },
						{ 44.3, 65.0, AZJ_KAHET },
					},
				}),
				pet(4483, {	-- Vile Bloodtick (PET!)
					["description"] = createLocalizationString({
						readable = "It can be found both as a frontline and a backline pet in battles throughout Azj-Kahet.",
						constant = "IT_CAN_BE_FOUND_BOTH_AS_A_FRONTLINE_AND_A",
						export = true,
						text = {
							en = "It can be found both as a frontline and a backline pet in battles throughout Azj-Kahet.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在阿兹-卡赫特的战斗中，它既可以作为前排宠物，也可以作为后排宠物出现。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 57.3, 63.7, AZJ_KAHET },
				}),
				pet(4481, {	-- Voidling Ooze (PET!)
					["description"] = createLocalizationString({
						readable = "Interact with Black Blood Extractor objects in area until you reach at least 10x Unseeming Shift debuff to see this pet. Can also be found as a backline pet around the zone.",
						constant = "INTERACT_WITH_BLACK_BLOOD_EXTRACTOR_OBJECTS_IN_2",
						export = true,
						text = {
							en = "Interact with Black Blood Extractor objects in area until you reach at least 10x Unseeming Shift debuff to see this pet. Can also be found as a backline pet around the zone.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与区域内的黑血提取器互动，直到你获得至少 10 层失相变换减益，就能看到这只宠物。也可以在该区域周围作为后排宠物找到。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 61.0, 74.8, AZJ_KAHET },
				}),
			},
		})),
	}),
}));
