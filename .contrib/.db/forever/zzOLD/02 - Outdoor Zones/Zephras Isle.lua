---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

-- #if FOREVER

root(ROOTS.Zones, m(ZEPHRAS_ISLE, {
	["races"] = { SKYBORNE_ALLIANCE, SKYBORNE_HORDE},
	["timeline"] = {ADDED_1_60_1},
	-- ["icon"] = nil, TODO: Add an icon for Zephras Isle
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
				["groups"] = {
					i(257281),	-- Fur-Lined Shoes
					i(257280),	-- 
					objective(1, { -- 0/8 
						["provider"] = { "n", 250873 },	-- 
					}),
				},
			}),
			q(92462, {	-- 
				["qg"] = 251368,	-- 
				["coords"] = { 43.4, 24.8, ZEPHRAS_ISLE },
				["sourcequests"] = { 92460 },	--
				["groups"] = {
					objective(1, { -- 0/8
						["provider"] = { "n", 251169 },	-- 
					}),
				},
			}),
			q(92465, {	-- 
				["qg"] = 249363,	-- 
				["coords"] = { 47.3, 21.9, ZEPHRAS_ISLE },
				["sourcequests"] = { 92460 },	--
				["groups"] = {
					objective(1, { -- 0/7 
						["provider"] = { "n", 251160 },	-- 
					}),
					objective(2, { -- 0/6
						["provider"] = { "n", 251143 },	-- 
					}),
				},
			}),
			q(92481, {	-- 
				["qg"] = 251361,	-- 
				["coords"] = { 42.1, 23.5, ZEPHRAS_ISLE },
				["sourcequests"] = { 92461 },	--
				["qi"] = 282416,	-- 
				["groups"] = {
					objective(1, { -- 
						["provider"] = { "i", 257282 },	-- 
					}),
				},
			}),
		}),
	},
}))

-- #endif