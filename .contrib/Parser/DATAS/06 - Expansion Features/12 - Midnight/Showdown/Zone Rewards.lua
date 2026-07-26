-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

local FIELD_ACCOLADE = 3405;
local DARK_PARTICLE = 267051;

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.MID, {
	n(SHOWDOWN, {
		n(ZONE_DROPS, {
			["maps"] = {
				NAIGTAL,
				VAL,
			},
			["groups"] = {
				currency(FIELD_ACCOLADE),
				i(DARK_PARTICLE),
				i(278116),	-- Player Experience
				i(276330, {	-- Taken Riftwalker's Starbarb (COSMETIC!)
					["providers"] = {
						{ "n", 265882 },	-- Spellslinger Rem'lazar <Warp Rider>
						{ "n", 265881 },	-- Renegade Kulivero <Warp Rider>
						{ "n", 265879 },	-- Guardian Halazir <Warp Rider>
						{ "n", 265880 },	-- Techno-Medic Alazj <Warp Rider>
						{ "n", 264769 },	-- Ethereal Adjutant
						{ "n", 264876 },	-- Reaper Gorzok <Blackstar Legion>
						{ "n", 265447 },	-- Starseeker Dreadus <Blackstar Legion>
						{ "n", 265446 },	-- Vanguard Kadoxe <Blackstar Legion>
						{ "n", 265445 },	-- Mender Amatory <Blackstar Legion>
					},
				}),
				i(276298, {	-- Forgotten Fel-Shard Talon (COSMETIC!)
					["providers"] = {
						{ "n", 264571 },	-- Indomitable Mk XII
						{ "n", 264869 },	-- Nelgothar
						{ "n", 267422 },	-- Warbringer Thal'kuur
					},
				}),
			},
		}),
		n(ZONE_REWARDS, {
			["description"] = "It appears that almost any Showdown content has a small chance to drop or reward these items, in addition to their most prevalent Source.",
			["maps"] = {
				NAIGTAL,
				VAL,
			},
			["symselector"] = SymSelector.MID_SHOWDOWN_ZONE_REWARDS,
			["sym"] = {{"select","symselector",
						SymSelector.MID_SHOWDOWN_VAL_RARES,
						SymSelector.MID_SHOWDOWN_NAIGTAL_RARES},
						{"extract","itemID"},
			},
		}),
	}),
}))

