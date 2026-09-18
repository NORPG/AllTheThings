-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

-- #if FOREVER
root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
applyclassicphase(FOREVER_PHASE_ONE, inst(3065, bubbleDownSelf({	-- The Hall of Thanes
	["timeline"] = { ADDED_1_60_1 },
}, {
	-- ["lore"] = "",
	["zone-text-areaID"] = 16919,	-- The Hall of Thanes
	["coord"] = { 50.0, 50.0, IRONFORGE },
	["lvl"] = 13,
	["groups"] = {
		n(3493, {	-- Faldrim Anvilmar
			i(),
		}),
		n(3495, {	-- Infurnus
			i(),
		}),
		n(3494, {	-- Plunder
			i(),
		}),
		n(3496, {	-- Durgen Dirgehammer
			i(),
		}),
	},
}))),
}));
-- #endif