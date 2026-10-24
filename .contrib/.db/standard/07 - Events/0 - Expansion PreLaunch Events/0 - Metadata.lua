-----------------------------------------------------
--     W O R L D   E V E N T S   M O D U L E       --
-----------------------------------------------------

-- since many world event files aren't organized based on pre-launch event, we can setup the prelaunch groupings here first to ensure correct expac order
root(ROOTS.WorldEvents, n(EXPANSION_PRELAUNCH, {
	expansion(EXPANSION.TBC, {forcetimeline=IGNORED_VALUE}),
	-- expansion(EXPANSION.WRATH, {forcetimeline=IGNORED_VALUE}), -- no data for this yet
	expansion(EXPANSION.CATA, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.MOP, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.LEGION, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.BFA, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.SL, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.DF, {forcetimeline=IGNORED_VALUE}),
	expansion(EXPANSION.TWW, {forcetimeline=IGNORED_VALUE}),
}))
