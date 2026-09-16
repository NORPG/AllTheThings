-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

-- #if FOREVER
root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
applyclassicphase(FOREVER_PHASE_ONE, inst(2999, bubbleDownSelf({	-- Ruins of Lordaeron
	["timeline"] = { ADDED_1_16_1 },
}, {
	-- ["lore"] = "",
	["zone-text-areaID"] = 16611,	-- Ruins of Lordaeron
	["coord"] = { 50.0, 50.0, TIRISFAL_GLADES },
	["lvl"] = 15,
	["groups"] = {
		n(3353, {	-- Witherfang
			i(),
		}),
		n(3357, {	-- The Abandoned
			i(),
		}),
		n(3355, {	-- The Butcher
			i(),
		}),
		n(3354, {	-- Rath'mael
			i(),
		}),
		n(3408, {	-- Lordaeron Captain
			i(),
		}),
		n(3411, {	-- Viktor the Vile
			i(),
		}),
		n(3412, {	-- Bjork
			i(),
		}),
	},
}))),
}));
-- #endif