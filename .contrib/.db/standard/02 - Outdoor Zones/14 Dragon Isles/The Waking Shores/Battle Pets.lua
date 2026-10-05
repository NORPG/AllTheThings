---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_WAKING_SHORES, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				3313,	-- Grassland Stomper (PET!)
				3281,	-- Scruffy Ottuk (PET!)
				3283,	-- Snowlemental (PET!)
				3336,	-- Vorquin Runt (PET!)
			}},
			["groups"] = {
				pet(3367),	-- Emberling (PET!)
				pet(3295, {	-- Igneoid (PET!)
					["coord"] = { 51.4, 31.6, THE_WAKING_SHORES },
				}),
				pet(3300),	-- Ironbeak Duck (PET!)
				pet(3366),	-- Kindlet (PET!)
				pet(3273),	-- Magma Slug (PET!)
				pet(3296),	-- Palamanther (PET!)
				pet(3307, {	-- Plucky Duckling (PET!)
					["coords"] = {
						{ 60.8, 57.2, VALDRAKKEN },
						{ 57.0, 71.0, THE_WAKING_SHORES },
					},
				}),
				pet(3272),	-- Pricklefury Hare (PET!)
				pet(3280, {	-- Shyfly (PET!)
					["description"] = createLocalizationString({
						readable = "You won't be able to see these pets until you've accepted the quest |cffffff00A Friend for Lubbins|r. For some reason, these are tradeable.",
						constant = "YOU_WON_T_BE_ABLE_TO_SEE_THESE_PETS_UNTIL_YOU",
						export = true,
						text = {
							en = "You won't be able to see these pets until you've accepted the quest |cffffff00A Friend for Lubbins|r. For some reason, these are tradeable.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在接受任务|cffffff00拉宾的朋友|r之前，你将无法看到这些宠物。出于某种原因，它们是可以交易的。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 40.8, 81.2, THE_WAKING_SHORES },
				}),
				pet(3282),	-- Swoglet (PET!)
				pet(3318, {	-- Thunderfoot Calf (PET!)
					["description"] = createLocalizationString({
						readable = "Not very common, often grouped with other NPCs.",
						constant = "NOT_VERY_COMMON_OFTEN_GROUPED_WITH_OTHER_NPCS",
						export = true,
						text = {
							en = "Not very common, often grouped with other NPCs.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "不太常见，常与其他 NPC 聚集在一起。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 45.8, 35.2, THE_WAKING_SHORES },
				}),
				pet(3301),	-- Wild Duckling (PET!)
			},
		})),
	}),
})));
