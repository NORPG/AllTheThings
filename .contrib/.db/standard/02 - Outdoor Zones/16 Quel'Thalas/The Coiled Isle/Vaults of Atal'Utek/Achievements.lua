---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.THE_COILED_ISLE, {
		m(MAP.MIDNIGHT.VAULTS_OF_ATALUTEK, {
			n(ACHIEVEMENTS, {
				ach(62649, {	-- A Lone Wanderer
					["description"] = createLocalizationString({
						readable = "During the Earth and Sky event, go to the Sky Altar and fly around the raid entrance, looking for the moving large blue orb.",
						constant = "DURING_THE_EARTH_AND_SKY_EVENT_GO_TO_THE_SKY",
						export = true,
						text = {
							en = "During the Earth and Sky event, go to the Sky Altar and fly around the raid entrance, looking for the moving large blue orb.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在“大地与天空”事件期间，前往天空祭坛并围绕团队副本入口飞行，寻找那个移动的巨大蓝色球体。",
							-- TODO: tw = "",
						},
					})
				}),
				ach(63630, {	-- Assault the Vault
					i(276801),	-- Venomous Coiler (MOUNT!)
				}),
				ach(62604),	-- Dance While Everyone Watches
				ach(63636, {	-- Fully Corroded
					["cr"] = 269485,	-- Altar of Corrosion
					["groups"] = { title(794) },	-- <Name> the Snake
				}),
				ach(63601, {	-- Oppose the Foes
					-- automation doesn't work because the criteria require completion of 'scenarios' rather than kills of the mob
					crit(116325, {
						["_npcs"] = {263014},	-- Congealed Malice
					}),
					crit(116326, {
						["_npcs"] = {263015},	-- Khu'tulak
					}),
					crit(116327, {
						["_npcs"] = {263016},	-- Susarikk
					}),
				}),
				ach(63653, {	-- Pro Poison Patroller
					i(276553),	-- Emerald Skyfang (MOUNT!)
				}),
				ach(62600, {	-- Ritual Behavior
					["description"] = createLocalizationString({
						readable = "Petrified Egg spawns on the west wing, Spirit Urn spawns on the east wing, Venomous Ooze drops from the Venomous Giants in the middle.",
						constant = "PETRIFIED_EGG_SPAWNS_ON_THE_WEST_WING_SPIRIT",
						export = true,
						text = {
							en = "Petrified Egg spawns on the west wing, Spirit Urn spawns on the east wing, Venomous Ooze drops from the Venomous Giants in the middle.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "石化之卵在西翼刷新，灵魂之瓮在东翼刷新，剧毒软泥由中部的剧毒巨人掉落。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						crit(113658, {	-- Petrified Egg
							["providers"] = {
								{ "o", 633913 },	-- Petrified Egg
							},
						}),
						crit(113659, {	-- Venomous Ooze
							["providers"] = {
								{ "n", 262909 },	-- Venomous Ooze
							},
						}),
						crit(113660, {	-- Spirit Urn
							["providers"] = {
								{ "o", 633908 },	-- Spirit Urn
							},
						}),
					}
				}),
				ach(63598, {	-- Roll the Patrol (automated)
					["description"] = createLocalizationString({
						readable = "The Temple Patrols rotate every 10 minutes. Not all of them are available on any given week.",
						constant = "THE_TEMPLE_PATROLS_ROTATE_EVERY_10_MINUTES_NOT",
						export = true,
						text = {
							en = "The Temple Patrols rotate every 10 minutes. Not all of them are available on any given week.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "神殿巡逻队每 10 分钟轮换一次。任何一周都并非所有巡逻队都会出现。",
							-- TODO: tw = "",
						},
					}),
				}),
				ach(63596),	-- Snake Stompin'
				ach(62601),	-- Soft Underbelly
				ach(63600),	-- Spike the Strike
				ach(63599),	-- Submerge the Incursion
				ach(63610),	-- The Honored Dead
			}),
		}),
	}),
}));
