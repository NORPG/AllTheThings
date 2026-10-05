-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.DF, {
	n(COMMON_BOSS_DROPS, {
		d(DIFFICULTY.RAID.MULTI.ALL, {
			i(213089, {	-- Antique Bronze Bullion
				["description"] = createLocalizationString({
					readable = "Drops from Awakened Dragonflight Raid bosses.",
					constant = "DROPS_FROM_AWAKENED_DRAGONFLIGHT_RAID_BOSSES",
					export = true,
					text = {
						en = "Drops from Awakened Dragonflight Raid bosses.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "由觉醒的巨龙时代团队副本首领掉落。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_6_SEASON_FOUR, REMOVED_TWW_LAUNCH },
			}),
			i(211515, {	-- Splintered Spark of Awakening
				["description"] = createLocalizationString({
					readable = "Drops from Dragonflight Dungeon/Raid & certain Outdoor content.\n\nEnable 'Debug Mode' to see the drop limitations for this Item for your character.",
					constant = "DROPS_FROM_DRAGONFLIGHT_DUNGEON_RAID_CERTAIN",
					export = true,
					text = {
						en = "Drops from Dragonflight Dungeon/Raid & certain Outdoor content.\n\nEnable 'Debug Mode' to see the drop limitations for this Item for your character.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "由《巨龙时代》地下城/团队副本及部分户外内容掉落。\n\n启用“调试模式”即可查看此物品对你角色的掉落限制。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { ADDED_10_2_6_SEASON_FOUR },
				["groups"] = {
					-- TODO: maybe a more interesting way to link 'drop amounts' via currency/HQT into Items in the future
					currency(2800),	-- 10.2.6 Professions - Personal Tracker - S4 Spark Drops (Hidden)
				},
			}),
		}),
	}),
}));
root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.DF, {
	q(80540, {
		["name"] = "Bullion Capped",	-- Triggered when Bullion Cap is met for the week
		["timeline"] = { ADDED_10_2_6_SEASON_FOUR, REMOVED_TWW_LAUNCH }
	}),
}));
