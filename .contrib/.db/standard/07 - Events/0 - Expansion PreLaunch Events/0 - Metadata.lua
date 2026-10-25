-----------------------------------------------------
--     W O R L D   E V E N T S   M O D U L E       --
-----------------------------------------------------

-- since many world event files aren't organized based on pre-launch event, we can setup the prelaunch groupings here first to ensure correct expac order
root(ROOTS.WorldEvents, n(EXPANSION_PRELAUNCH, {
	expansionHeader(EXPANSION.TBC, IGNORED_VALUE),
	-- expansionHeader(EXPANSION.WRATH, IGNORED_VALUE), -- no data for this yet
	expansionHeader(EXPANSION.CATA, IGNORED_VALUE),
	expansionHeader(EXPANSION.MOP, IGNORED_VALUE),
	expansionHeader(EXPANSION.LEGION, IGNORED_VALUE),
	expansionHeader(EXPANSION.BFA, IGNORED_VALUE),
	expansionHeader(EXPANSION.SL, IGNORED_VALUE),
	expansionHeader(EXPANSION.DF, IGNORED_VALUE),
	expansionHeader(EXPANSION.TWW, IGNORED_VALUE),
}))
