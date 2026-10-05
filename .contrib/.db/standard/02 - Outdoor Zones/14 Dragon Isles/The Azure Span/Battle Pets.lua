---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_AZURE_SPAN, {
		petbattle(filter(BATTLE_PETS, {
			["sym"] = {{"select","speciesID",
				3358,	-- Crimsonspine (PET!)
				3282,	-- Swoglet (PET!)
				3328,	-- Tiny Timbertooth (PET!)
				3336,	-- Vorquin Runt (PET!)
			}},
			["groups"] = {
				pet(3357),	-- Azure Crystalspine (PET!)
				pet(3356, {	-- Chalkshell Turtle (PET!)
					["description"] = createLocalizationString({
						readable = "Talk to |cFFefc400Lani|r and use the extra action button to spawn this pet.",
						constant = "TALK_TO_CFFEFC400LANI_R_AND_USE_THE_EXTRA",
						export = true,
						text = {
							en = "Talk to |cFFefc400Lani|r and use the extra action button to spawn this pet.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与 |cFFefc400拉妮|r 交谈，并使用额外动作按钮刷出该宠物。",
							-- TODO: tw = "",
						},
					}),
					["crs"] = {
						192260,	-- Chalkshell Turtle
						199255,	-- Lani
					},
					["coord"] = { 10.8, 48.0, THE_AZURE_SPAN },
				}),
				pet(3351,	{	-- Grizzlefur Cub (PET!)
					["coords"] = {
						{ 48.4, 56.0, THALDRASZUS },
						{ 68.6, 52.0, THALDRASZUS },
						{ 37.0, 33.0, THE_AZURE_SPAN },
					},
				}),
				pet(3335, {	-- Pale Baby Vorquin (PET!)
					["description"] = createLocalizationString({
						readable = "Click the |cFFefc400Magical Creature Manual|r to see this pet.",
						constant = "CLICK_THE_CFFEFC400MAGICAL_CREATURE_MANUAL_R_TO",
						export = true,
						text = {
							en = "Click the |cFFefc400Magical Creature Manual|r to see this pet.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "点击|cFFefc400魔法生物手册|r以查看该宠物。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 45.9, 38.3, THE_AZURE_SPAN },
				}),
				pet(3281, {	-- Scruffy Ottuk (PET!)
					["coords"] = {
						{ 68.6, 52.0, THE_AZURE_SPAN },
						{ 68.2, 53.4, THE_AZURE_SPAN },
						{ 59.6, 68.2, THE_AZURE_SPAN },
						{ 59.8, 56.2, THE_AZURE_SPAN },
						{ 50.4, 54.4, THE_AZURE_SPAN },
						{ 45.0, 54.0, THE_AZURE_SPAN },
						{ 15.6, 48.8, THE_AZURE_SPAN },
					},
				}),
				pet(3283),	-- Snowlemental (PET!)
				pet(3260, {	-- Snowy Treeflitter (PET!)
					["coord"] = { 69.0, 27.0, THE_AZURE_SPAN },
				}),
				pet(3320, {	-- Whitewhisker (PET!)
					["description"] = createLocalizationString({
						readable = "Talk to |cFFefc400Nuptuk|r to see this pet.",
						constant = "TALK_TO_CFFEFC400NUPTUK_R_TO_SEE_THIS_PET",
						export = true,
						text = {
							en = "Talk to |cFFefc400Nuptuk|r to see this pet.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与 |cFFefc400努普图克|r 交谈即可看到该宠物。",
							-- TODO: tw = "",
						},
					}),
					["crs"] = {
						189209,	-- Whitewhisker
						199180,	-- Nuptuk
					},
					["coord"] = { 50.9, 54.8, THE_AZURE_SPAN },
				}),
				pet(3322, {	-- Woodbiter Piculet (PET!)
					["coord"] = { 65.6, 60.4, THE_AZURE_SPAN },
				}),
			},
		})),
	}),
})));
