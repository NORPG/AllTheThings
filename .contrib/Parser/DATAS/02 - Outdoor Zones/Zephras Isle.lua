---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

-- #if FOREVER

root(ROOTS.Zones, m(ZEPHRAS_ISLE, {
	["races"] = { SKYBORNE_ALLIANCE, SKYBORNE_HORDE},
	["timeline"] = {ADDED_1_60_1},
	-- ["icon"] = nil, TODO: Add an icon for Zephras Isle
	["maps"] = {
	["groups"] = {
		n(QUESTS, {
			q(92460, {	-- 
				["qg"] = 251362,	-- 
				["coord"] = { 42.8, 23.4, ZEPHRAS_ISLE },
			}),
			q(92461, {	-- 
				["qg"] = 251361,	-- 
				["coords"] = { 42.1, 23.5, ZEPHRAS_ISLE },
				["sourcequests"] = { 92460 },	--
			}),
			q(92462, {	-- 
				["qg"] = 251368,	-- 
				["coords"] = { 43.4, 24.8, ZEPHRAS_ISLE },
				["sourcequests"] = { 92460 },	--
			}),
		}),
	},
}))

-- #endif
