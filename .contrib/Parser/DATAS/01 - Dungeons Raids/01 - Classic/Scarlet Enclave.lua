-- #if SEASON_OF_DISCOVERY
-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------
root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	applyclassicphase(SOD_PHASE_EIGHT, inst(2856, bubbleDownSelf({["timeline"] = { ADDED_1_15_7 }}, {	-- Scarlet Enclave
		["zone-text-areaID"] = 16236,	-- Scarlet Enclave
		-- ["description"] = "[TBC] \nThis is a new raid added in SoD Phase 8.\nThe current loot table is not accurate. If you get items not in the boss drop, please report it in Discord #classic-errors.",
		["lvl"] = 60,
		-- ["coord"] = { 39.8, 73.6, DEADWIND_PASS },
        ["isRaid"] = true,
		-- ["sourceQuest"] = 86970,
		["groups"] = {
			n(QUESTS),
			d(DIFFICULTY.RAID.NORMAL, {
				["sharedDescription"] = "[TBC]\nIf the boss loot that is not in the boss's loot table, @NORPG on Discord.",
				["groups"] = {
					n(COMMON_BOSS_DROPS),
				},
			}),
		},
	}))),
}));
-- #endif