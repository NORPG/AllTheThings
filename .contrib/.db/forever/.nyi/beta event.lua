---------------------------------------------------------------
--     N E V E R    I M P L E M E N T E D    M O D U L E     --
---------------------------------------------------------------
local BETA_EVENT = createHeader({
	readable = "Beta Event",
	icon = 133066,	-- Sulfuras, Hand of Ragnaros
	text = {
		en = "Beta Event",
	},
	description = {
		en = "On the last day of the WoW: Forever Beta, low level creatures dropped epic items resembling Molten Core loot. These items were added to the client's Item table but are not obtainable in the live game.",
	},
});
root(ROOTS.NeverImplemented, n(BETA_EVENT, {
	timeline = { TIMELINE.ADDED_1_60_1 },
	groups = {
		filter(CONSUMABLES, {
			i(288896),	-- Unnamed Potion (no ItemSparse data)
			i(288897),	-- Unnamed Potion (no ItemSparse data)
			i(288898),	-- Unnamed Potion (no ItemSparse data)
			i(289081),	-- Unnamed Elixir (no ItemSparse data)
			i(289082),	-- Unnamed Elixir (no ItemSparse data)
			i(289083),	-- Unnamed Elixir (no ItemSparse data)
			i(289084),	-- Unnamed Elixir (no ItemSparse data)
			i(289086),	-- Unnamed Elixir (no ItemSparse data)
			i(289087),	-- Unnamed Elixir (no ItemSparse data)
			i(289088),	-- Unnamed Scroll (no ItemSparse data)
			i(289321),	-- Unnamed Elixir (no ItemSparse data)
			i(289329),	-- Unnamed Elixir (no ItemSparse data)
			i(289330),	-- Unnamed Scroll (no ItemSparse data)
			i(289334),	-- Unnamed Elixir (no ItemSparse data)
		}),
		n(ARMOR, {
			i(288823),	-- Arcanist Crown
			i(288824),	-- Arcanist Leggings
			i(288825),	-- Arcanist Mantle
			i(288826),	-- Arcanist Robes
			i(288827),	-- Arcanist Bindings
			i(288828),	-- Arcanist Boots
			i(288829),	-- Arcanist Gloves
			i(288830),	-- Arcanist Belt
			i(288831),	-- Felheart Slippers
			i(288832),	-- Felheart Bracers
			i(288833),	-- Felheart Gloves
			i(288834),	-- Felheart Belt
			i(288835),	-- Felheart Shoulder Pads
			i(288836),	-- Felheart Horns
			i(288837),	-- Felheart Robes
			i(288838),	-- Felheart Pants
			i(288839),	-- Boots of Prophecy
			i(288840),	-- Gloves of Prophecy
			i(288841),	-- Circlet of Prophecy
			i(288842),	-- Pants of Prophecy
			i(288843),	-- Robes of Prophecy
			i(288844),	-- Mantle of Prophecy
			i(288845),	-- Girdle of Prophecy
			i(288846),	-- Vambraces of Prophecy
			i(288847),	-- Nightslayer Chestpiece
			i(288848),	-- Nightslayer Cover
			i(288849),	-- Nightslayer Pants
			i(288850),	-- Nightslayer Shoulder Pads
			i(288851),	-- Nightslayer Boots
			i(288852),	-- Nightslayer Bracelets
			i(288853),	-- Nightslayer Gloves
			i(288854),	-- Nightslayer Belt
			i(288855),	-- Cenarion Belt
			i(288856),	-- Cenarion Boots
			i(288857),	-- Cenarion Bracers
			i(288858),	-- Cenarion Gloves
			i(288859),	-- Cenarion Vestments
			i(288860),	-- Cenarion Helm
			i(288861),	-- Cenarion Leggings
			i(288862),	-- Cenarion Spaulders
			i(288863),	-- Earthfury Boots
			i(288864),	-- Earthfury Belt
			i(288865),	-- Earthfury Gauntlets
			i(288866),	-- Earthfury Bracers
			i(288867),	-- Earthfury Vestments
			i(288868),	-- Earthfury Helmet
			i(288869),	-- Earthfury Legguards
			i(288870),	-- Earthfury Epaulets
			i(288871),	-- Giantstalker's Breastplate
			i(288872),	-- Giantstalker's Helmet
			i(288873),	-- Giantstalker's Leggings
			i(288874),	-- Giantstalker's Epaulets
			i(288875),	-- Giantstalker's Boots
			i(288876),	-- Giantstalker's Bracers
			i(288877),	-- Giantstalker's Belt
			i(288878),	-- Giantstalker's Gloves
			i(288879),	-- Lawbringer Chestguard
			i(288880),	-- Lawbringer Helm
			i(288881),	-- Lawbringer Legplates
			i(288882),	-- Lawbringer Spaulders
			i(288883),	-- Lawbringer Bracers
			i(288884),	-- Lawbringer Belt
			i(288885),	-- Lawbringer Boots
			i(288886),	-- Lawbringer Gauntlets
			i(288887),	-- Bracers of Might
			i(288888),	-- Sabatons of Might
			i(288889),	-- Gauntlets of Might
			i(288890),	-- Belt of Might
			i(288891),	-- Breastplate of Might
			i(288892),	-- Helm of Might
			i(288893),	-- Legplates of Might
			i(288894),	-- Pauldrons of Might
			i(288916),	-- Drillborer Disk
			i(288917),	-- Fire Runed Grimoire
			i(288918),	-- Malistar's Defender
			i(288919),	-- Unnamed Ring (no ItemSparse data)
			i(288920),	-- Unnamed Neck (no ItemSparse data)
			i(288921),	-- Cloak of the Shrouded Mists
			i(288922),	-- Dragon's Blood Cape
			i(288923),	-- Unnamed Neck (no ItemSparse data)
			i(288924),	-- Unnamed Ring (no ItemSparse data)
			i(288925),	-- Fireproof Cloak
			i(288926),	-- Unnamed Neck (no ItemSparse data)
			i(288927),	-- Unnamed Ring (no ItemSparse data)
			i(288928),	-- Unnamed Ring (no ItemSparse data)
			i(288929),	-- Unnamed Ring (no ItemSparse data)
			i(288930),	-- Unnamed Ring (no ItemSparse data)
			i(288931),	-- Unnamed Ring (no ItemSparse data)
		}),
		n(WEAPONS, {
			i(288358),	-- Gnoll Greataxe
			i(288900),	-- Earthshaker
			i(288901),	-- Spinal Reaper
			i(288902),	-- Hyperthermically Insulated Lava Dredger
			i(288903),	-- Shadowstrike
			i(288904),	-- Bonereaver's Edge
			i(288905),	-- Obsidian Edged Blade
			i(288906),	-- Staff of Dominance
			i(288907),	-- Gutgore Ripper
			i(288908),	-- Aurastone Hammer
			i(288909),	-- Perdition's Blade
			i(288910),	-- Sorcerous Dagger
			i(288911),	-- Striker's Mark
			i(288913),	-- Blastershot Launcher
			i(288914),	-- Crimson Shocker
			i(288915),	-- Azuresong Mageblade
			i(289292),	-- Hammer of Bestial Fury
			i(289294),	-- Thunderfury, Blessed Blade of the Windseeker
			i(289295),	-- Sulfuras, Hand of Ragnaros
			i(289296),	-- Benediction
			i(289297),	-- Anathema
			i(289302),	-- Quel'Serrar
			i(289303),	-- Rhok'delar, Longbow of the Ancient Keepers
		}),
	},
}));
