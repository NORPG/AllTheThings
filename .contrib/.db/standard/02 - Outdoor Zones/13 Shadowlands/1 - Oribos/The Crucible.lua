---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(ORIBOS, {
		m(1673, {	-- The Crucible
			["description"] = createLocalizationString({
				readable = "The Crucible - sub-zone accessed via Tal-Inara",
				constant = "THE_CRUCIBLE_SUB_ZONE_ACCESSED_VIA_TAL_INARA",
				export = true,
				text = {
					en = "The Crucible - sub-zone accessed via Tal-Inara",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "熔炉——通过塔尔-伊纳拉进入的子区域",
					-- TODO: tw = "",
				},
			}),
			["provider"] = { "n", 159478 },	-- Tal-Inara
			["sourceQuest"] = 63857,	-- Voices of the Eternal
			["groups"] = {
				n(HIDDEN_QUESTS, {
					hqt(65614, {	-- Stay awhile and listen with Arbiter Pelagos (spellID 366958)
						["timeline"] = {ADDED_9_2_0},
						["name"] = "Stay awhile and listen: Arbiter Pelagos",
						["sourceQuest"] = 63857,	-- Voices of the Eternal
						["provider"] = { "n", 183830 },	-- Arbiter Pelagos
						["coord"] = { 68.0, 48.6, 1673 },	-- The Crucible
					}),
					hqt(65612, {	-- Stay awhile and listen with Baine (spellID 366952)
						["timeline"] = {ADDED_9_2_0},
						["name"] = "Stay awhile and listen: Baine Bloodhoof",
						["sourceQuest"] = 63857,	-- Voices of the Eternal
						["provider"] = { "n", 184098 },	-- Baine Bloodhoof
						["coord"] = { 42.5, 34.0, 1673 },	-- The Crucible
					}),
					hqt(65609, {	-- Stay awhile and listen with Lor'themar Theron (spellID 366932)
						["timeline"] = {ADDED_9_2_0},
						["name"] = "Stay awhile and listen: Lor'themar Theron",
						["sourceQuest"] = 63857,	-- Voices of the Eternal
						["provider"] = { "n", 184100 },	-- Lor'themar Theron
						["coord"] = { 44.2, 33.2, 1673 },	-- The Crucible
					}),
					hqt(65607, {	-- Stay awhile and listen with King Greymane (spellID 366925)
						["timeline"] = {ADDED_9_2_0},
						["name"] = "Stay awhile and listen: Genn Greymane",
						["sourceQuest"] = 63857,	-- Voices of the Eternal
						["provider"] = { "n", 184088 },	-- Genn Greymane
						["coord"] = { 54.2, 28.2, 1673 },	-- The Crucible
					}),
				}),
			},
		}),
	}),
})))
