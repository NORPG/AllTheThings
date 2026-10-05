---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(INVASION_VRYKUL, {
			["description"] = "~L.EVERY_WEEK_A_FACTION_INVADES_THE_ISLAND_THE",
			["groups"] = {
				petbattle(filter(BATTLE_PETS, {
					pet(4724, {	-- Battleboar Piglet
						["description"] = createLocalizationString({
							readable = "Only spawns during Vrykul invasion week.",
							constant = "ONLY_SPAWNS_DURING_VRYKUL_INVASION_WEEK",
							export = true,
							text = {
								en = "Only spawns during Vrykul invasion week.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "仅在维库人入侵周刷新。",
								-- TODO: tw = "",
							},
						}),
					}),
				})),
				n(QUESTS, {
					q(84248, {	-- A Ritual of Runes
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 233139 },	-- Machinist Kromleg
						["coord"] = { 51.4, 48.2, SIREN_ISLE },
						["isWeekly"] = true,
					}),
					q(83932, {	-- Historical Documents
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 229716 },	-- Stellin Verasa
						["coord"] = { 71.0, 39.6, SIREN_ISLE },
						["isWeekly"] = true,
						["groups"] = {
							i(227405),	-- Research Journal (QI!)
							o(457181,{	-- Interesting Notes
								i(227406),	-- Interesting Notes (QI!)
							}),
						},
					}),
					q(84432, {	-- Longship Landing
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 228096 },	-- Dawn
						["coords"] = {
							{ 69.1, 43.0, SIREN_ISLE },
							{ 71.4, 44.1, SIREN_ISLE },
						},
						["isWeekly"] = true,
					}),
					q(84222, {	-- Secure the Perimeter
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 227796 },	-- Sky-Captain Elaena Lancekat
						["coord"] = { 69.4, 42.8, SIREN_ISLE },
						["isWeekly"] = true,
					}),
					q(84680, {	-- Rock 'n' Stone Revival
						["sourceQuests"] = { 84725 },	-- The Circlet Calls
						["provider"] = { "n", 228096 },	-- Dawn
						["coords"] = {
							{ 69.1, 43.0, SIREN_ISLE },
							{ 71.4, 44.1, SIREN_ISLE },
						},
						["isWeekly"] = true,
						["groups"] = {
							i(228988),	-- Rock Reviver (QI!)
						},
					}),
				}),
				n(RARES, sharedData({
					["isDaily"] = true,
				},{
					n(227545, {	-- Ikir the Flotsurge
						["coord"] = { 32.8, 73.7, SIREN_ISLE },
						["questID"] = 84792,
					}),
					n(230137, {	-- Asbjorn the Bloodsoaked
						["coord"] = { 63.9, 87.3, SIREN_ISLE },
						["questID"] = 84805,
						["groups"] = {
							i(234972),	-- Bloodwake Missive [book]
						},
					}),
				})),
				n(TREASURES, {
					o(493375, {	-- Rune-Sealed Coffer
						["coord"] = { 67.8, 73.5, SIREN_ISLE },
						["questID"] = 86171,
						["isWeekly"] = true,
					}),
					o(493373, {	-- Unsolved Amethyst Runelock
						["coord"] = { 67.8, 73.5, SIREN_ISLE },
						["questID"] = 85714,
						["isWeekly"] = true,
					}),
				}),
				n(WORLD_QUESTS, {
					["sourceQuests"] = {
						TWW_ACCOUNT_CAMPAIGN_QUEST,
						84725,	-- The Circlet Calls
					},
					["groups"] = bubbleDownFiltered({ ["isWorldQuest"] = true, },FILTERFUNC_questID,{
						q(84852, {	-- Legacy of the Vrykul
							["groups"] = {
								i(228648),	-- Roaring War-Queen's Citrine
							},
						}),
					}),
				}),
				n(ZONE_DROPS, {
					i(233494, {	-- Muddy Snapdragon Treat (CI!)
						["description"] = createLocalizationString({
							readable = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Vrykul.",
							constant = "YOU_MUST_HAVE_THE_PRISMATIC_SNAPDRAGON_MOUNT_3",
							export = true,
							text = {
								en = "You must have the Prismatic Snapdragon Mount before this can drop.\n\nCan be looted from Vrykul.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "你必须先拥有棱彩龙蜥坐骑，此物品才会掉落。\n\n可以从维库人身上拾取。",
								-- TODO: tw = "",
							},
						}),
						-- n: 232324 / n: 232323
					}),
				}),
			},
		}),
	}),
}));
