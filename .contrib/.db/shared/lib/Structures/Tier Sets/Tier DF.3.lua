TIER_AMIRDRASSIL = {
	DEATHKNIGHT = {
		i(207202),	-- Graveboots of the Risen Nightmare
		i(207197),	-- Seal of the Risen Nightmare
		i(207195),	-- Shroud of the Risen Nightmare
		i(207196),	-- Vambraces of the Risen Nightmare
	},
	DEMONHUNTER = {
		i(207259),	-- Screaming Torchfiend's Armlets
		i(207260),	-- Screaming Torchfiend's Clasp
		i(207265),	-- Screaming Torchfiend's Clutches
		i(207258),	-- Screaming Torchfiend's Shawl
	},
	DRUID = {
		i(207249),	-- Benevolent Embersage's Featherdrape
		i(207256),	-- Benevolent Embersage's Lined Boots
		i(207251),	-- Benevolent Embersage's Sagacious Sash
		i(207250),	-- Benevolent Embersage's Wristwraps
	},
	EVOKER = {
		i(207224),	-- Weyrnkeeper's Timeless Adorned Sash
		i(207222),	-- Weyrnkeeper's Timeless Ornamented Cloak
		i(207229),	-- Weyrnkeeper's Timeless Treads
		i(207223),	-- Weyrnkeeper's Timeless Wristlets
	},
	HUNTER = {
		i(207214),	-- Blazing Dreamstalker's Bracers
		i(207215),	-- Blazing Dreamstalker's Spined Girdle
		i(207213),	-- Blazing Dreamstalker's Staghide
		i(207220),	-- Blazing Dreamstalker's Striders
	},
	MAGE = {
		i(207286),	-- Wayward Chronomancer's Cuffs
		i(207285),	-- Wayward Chronomancer's Stole
		i(207292),	-- Wayward Chronomancer's Strapped Boots
		i(207287),	-- Wayward Chronomancer's Synchronous Belt
	},
	MONK = {
		i(207242),	-- Mystic Heron's Belt
		i(207240),	-- Mystic Heron's Feathered Mantle
		i(207241),	-- Mystic Heron's Fisticuffs
		i(207247),	-- Mystic Heron's Tabi
	},
	PALADIN = {
		i(207186),	-- Zealous Pyreknight's Banner
		i(207193),	-- Zealous Pyreknight's Dreamstompers
		i(207188),	-- Zealous Pyreknight's Emblem
		i(207187),	-- Zealous Pyreknight's Flameguards
	},
	PRIEST = {
		i(207278),	-- Cincture of Lunar Communion
		i(207276),	-- Cloak of Lunar Communion
		i(207283),	-- Poulaines of Lunar Communion
		i(207277),	-- Wristwraps of Lunar Communion
	},
	ROGUE = {
		i(207233),	-- Lucid Shadewalker's Baldric
		i(207232),	-- Lucid Shadewalker's Bracers
		i(207231),	-- Lucid Shadewalker's Cape
		i(207238),	-- Lucid Shadewalker's Sollerets
	},
	SHAMAN = {
		i(207204),	-- Greatwolf Outcast's Chainweave
		i(207211),	-- Greatwolf Outcast's Footpads
		i(207206),	-- Greatwolf Outcast's Sigil Belt
		i(207205),	-- Greatwolf Outcast's Wristguards
	},
	WARLOCK = {
		i(207268),	-- Devout Ashdevil's Bracelets
		i(207269),	-- Devout Ashdevil's Fanged Sash
		i(207267),	-- Devout Ashdevil's Fiendcloak
		i(207274),	-- Devout Ashdevil's Slippers
	},
	WARRIOR = {
		i(207179),	-- Molten Vanguard's Chains
		i(207184),	-- Molten Vanguard's Greatboots
		i(207177),	-- Molten Vanguard's Manacles
		i(207176),	-- Molten Vanguard's Thermal Cape
	},
	SYM_TIER = function(ClassID, DiffID) return {{"sub","instance_tier",1207,DiffID,ClassID}} end
}

TIER_STRUCTURE_ASSIGN_CLASSIDS(TIER_AMIRDRASSIL)
