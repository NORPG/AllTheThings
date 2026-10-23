---------------------------------------------------------------
--     N E V E R    I M P L E M E N T E D    M O D U L E     --
---------------------------------------------------------------
-- #if AFTER BFA
root(ROOTS.NeverImplemented, filter(ILLUSIONS, {
	expansion(EXPANSION.BFA, {
		-- 8.2.5
		expansion(EXPANSION.BFA, patch(2,5), {
			ill(6185),	-- Stinging Sands (ILLUSION!)
		}),

		-- 8.3.0
		expansion(EXPANSION.BFA, patch(3,0), {
			i(174933),	-- Illusion: Voidwrath (ILLUSION!)
		}),
	}),
	expansion(EXPANSION.TWW, {
		-- 11.1.7
		expansion(EXPANSION.TWW, patch(1,7), {
			i(250776),	-- Illusion: Sha Corruption (ILLUSION!)
		}),
	}),
	expansion(EXPANSION.MID, {
		-- 12.0.5
		expansion(EXPANSION.MID, patch(0,5), {
			ill(8674),	-- Internal Testing Visual Enchant (ILLUSION!)
		}),
	}),
}));
-- #endif
