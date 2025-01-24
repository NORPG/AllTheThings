HONOR_TITLES = createHeader({
	readable = "Honor Titles",
	constant = "HONOR_TITLES",
	icon = 135358,
	text = {
		-- #if ANYCLASSIC
		en = "Honor Titles",
		-- #else
		en = [[~HONOR .. " " .. PAPERDOLL_SIDEBAR_TITLES]],
		-- #endif
		cn = [[~HONOR .. PAPERDOLL_SIDEBAR_TITLES]],
	},
});