---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(SURAMAR, {
			petbattle(filter(BATTLE_PETS, {
				["sym"] = {{"select","speciesID",
					425,	-- Ash Viper (PET!)
					1914,	-- Coastal Sandpiper (PET!)
					751,	-- Dancing Watter Skimmer (PET!)
					1325,	-- Flamering moth (PET!)
					1591,	-- Violet Firefly (PET!)
				}},
				["groups"] = {
					pet(706),	-- Bandicoon (PET!)
					pet(1809, {	-- Crystalline Broodling (PET!)
						["description"] = createLocalizationString({
							readable = "Found around Falanaar.",
							constant = "FOUND_AROUND_FALANAAR",
							export = true,
							text = {
								en = "Found around Falanaar.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在法拉纳尔周围可找到。",
								-- TODO: tw = "",
							},
						}),
						["coord"] = { 21.0, 41.0, SURAMAR },
					}),
					pet(1810, {	-- Thornclaw Broodling (PET!)
						["description"] = createLocalizationString({
							readable = "Found in Felsoul Hold.",
							constant = "FOUND_IN_FELSOUL_HOLD",
							export = true,
							text = {
								en = "Found in Felsoul Hold.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于邪魂堡垒。",
								-- TODO: tw = "",
							},
						})
					}),
					pet(1807, {	-- Vicious Broodling (PET!)
						["description"] = createLocalizationString({
							readable = "Found in Felsoul Hold. May be elusive, shares spawn with Thornclaw Broodling.",
							constant = "FOUND_IN_FELSOUL_HOLD_MAY_BE_ELUSIVE_SHARES",
							export = true,
							text = {
								en = "Found in Felsoul Hold. May be elusive, shares spawn with Thornclaw Broodling.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "位于邪魂堡垒。可能较难遇到，与刺爪幼蛛共享刷新。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			})),
		}),
	}),
});
