---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(SPECIAL, {
			header(HEADERS.Spell, 474086, sharedData({	-- Prismatic Snapdragon Alternate Colors
				type = "characterUnlockQuestID",
				sourceQuest = 86485,	-- A Loyal Friend
			}, {
				-- Teal is unlocked via 86485	-- A Loyal Friend
				-- Item drop unlocks the 'character unlock'
				-- but the Item itself retains a separate repeatable questID which determines which color
				-- you currently have active, so we can't easily treat the Item as the unlock itself
				q(86379, name(HEADERS.Item, 233500, {	-- Crimson Snapdragon Treat
					["provider"] = { "i", 233500 },	-- Crimson Snapdragon Treat
				})),
				q(86375, name(HEADERS.Item, 233495, {	-- Inky Snapdragon Treat
					["provider"] = { "i", 233495 },	-- Inky Snapdragon Treat
				})),
				q(86376, name(HEADERS.Item, 233497, {	-- Kaja'Cola-braised Snapdragon Treat
					["provider"] = { "i", 233497 },	-- Kaja'Cola-braised Snapdragon Treat
				})),
				q(86374, name(HEADERS.Item, 233494, {	-- Muddy Snapdragon Treat
					["provider"] = { "i", 233494 },	-- Muddy Snapdragon Treat
				})),
				q(86378, name(HEADERS.Item, 233499, {	-- Royal Snapdragon Treat
					["provider"] = { "i", 233499 },	-- Royal Snapdragon Treat
				})),
				q(86380, name(HEADERS.Item, 233501, {	-- Sandy Snapdragon Treat
					["provider"] = { "i", 233501 },	-- Sandy Snapdragon Treat
				})),
				q(86377, name(HEADERS.Item, 233498, {	-- Storminfused Snapdragon Treat
					["provider"] = { "i", 233498 },	-- Storminfused Snapdragon Treat
				})),
			})),
			n(233694, {	-- Zexel Fingersnap
				["sourceQuest"] = 86485,	-- A Loyal Friend
				["description"] = createLocalizationString({
					readable = "Vendor who sells Snapdragon Treats once they've been unlocked.",
					constant = "VENDOR_WHO_SELLS_SNAPDRAGON_TREATS_ONCE_THEY_VE",
					export = true,
					text = {
						en = "Vendor who sells Snapdragon Treats once they've been unlocked.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "解锁之后出售金鱼草零食的商人。",
						-- TODO: tw = "",
					},
				}),
				["skipFill"] = true,	-- only care to show the tooltips for this NPC or in popouts
				["sym"] = {{"select","itemID",
					233500,	-- Crimson Snapdragon Treat
					233495,	-- Inky Snapdragon Treat
					233497,	-- Kaja'Cola-braised Snapdragon Treat
					233494,	-- Muddy Snapdragon Treat
					233499,	-- Royal Snapdragon Treat
					233501,	-- Sandy Snapdragon Treat
					233498,	-- Storminfused Snapdragon Treat
					233493,	-- Teal Snapdragon Treat
				}},
			}),
		}),
	}),
}))
