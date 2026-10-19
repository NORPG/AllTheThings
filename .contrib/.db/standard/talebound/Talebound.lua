-------------------------------------------------
--      T A L E B O U N D    M O D U L E       --
-------------------------------------------------

local BOUND_SILVER = 3361;
local DUCATS = 3325;
local OUTFITTER_SUPPLIES = 3320;

root(ROOTS.Talebound, timelineSelf({ timeline = { ADDED_12_1_7 } }, {
	n(ACHIEVEMENTS, {
		-- Main Achievements
		ach(63819),	-- A Puzzling Tale
		ach(63826),	-- The Antiquarian's Chapter
		ach(63825),	-- The Arcanist's Account
		ach(64229),	-- The Eldritch Puzzlemaster
		ach(64230),	-- The Fae Puzzlemaster
		ach(64228),	-- The Hexed Puzzlemaster
		ach(63823),	-- The Inquisitor and the Scribe: The Complete Tale
		ach(63824),	-- The Outfitter's Story
		ach(64227),	-- The Sanguine Puzzlemaster
		ach(63821),	-- The Slayer and the Scribe: The Complete Tale
		ach(64135),	-- The Stories of Greenthistle Wood
		ach(64139),	-- The Stories of the Storyteller
		ach(64136),	-- The Story of Darkhaven
		ach(64138),	-- The Story of Greywake's Expedition
		ach(63820),	-- The Tale of the Puzzle Master
		ach(63822),	-- The Witch and the Scribe: The Complete Tale
		ach(64137),	-- The Verses of the Court of Night
		ach(63814),	-- Traveler's Coin (1000 Ducats)
		ach(63815),	-- Traveler's Purse (2000 Ducats)
		ach(63816),	-- Traveler's Cache (3000 Ducats)
		ach(63817),	-- Traveler's Trove (4000 Ducats)
		ach(63818),	-- Traveler's Fortune (5000 Ducats)

		-- Bosses
		ach(63760),	-- The Fairy Queen
		ach(63761),	-- Veteran: The Fairy Queen
		ach(63762),	-- Heroic: The Fairy Queen
		ach(63763),	-- Mythic: The Fairy Queen
		ach(63776),	-- The Final Confrontation
		ach(63777),	-- Veteran: The Final Confrontation
		ach(63778),	-- Heroic: The Final Confrontation
		ach(63779),	-- Mythic: The Final Confrontation
		ach(63729),	-- The Giant of Greenthistle Wood
		ach(63734),	-- Veteran: The Giant of Greenthistle Wood
		ach(63735),	-- Heroic: The Giant of Greenthistle Wood
		ach(63736),	-- Mythic: The Giant of Greenthistle Wood
		ach(63768),	-- The Hadal Tyrant
		ach(63769),	-- Veteran: The Hadal Tyrant
		ach(63770),	-- Heroic: The Hadal Tyrant
		ach(63771),	-- Mythic: The Hadal Tyrant
		ach(63772),	-- The Herald from Beyond
		ach(63773),	-- Veteran: The Herald from Beyond
		ach(63774),	-- Heroic: The Herald from Beyond
		ach(63775),	-- Mythic: The Herald from Beyond
		ach(63810),	-- The Inquisitor's Final Confrontation
		ach(63811),	-- Veteran: The Inquisitor's Final Confrontation
		ach(63812),	-- Heroic: The Inquisitor's Final Confrontation
		ach(63813),	-- Mythic: The Inquisitor's Final Confrontation
		ach(63748),	-- The Lord Marshal
		ach(63749),	-- Veteran: The Lord Marshal
		ach(63780),	-- Heroic: The Lord Marshal
		ach(63750),	-- Mythic: The Lord Marshal
		ach(63764),	-- The Nightmare King
		ach(63765),	-- Veteran: The Nightmare King
		ach(63766),	-- Heroic: The Nightmare King
		ach(63767),	-- Mythic: The Nightmare King
		ach(63802),	-- The Slayer's Final Confrontation
		ach(63803),	-- Veteran: The Slayer's Final Confrontation
		ach(63804),	-- Heroic: The Slayer's Final Confrontation
		ach(63805),	-- Mythic: The Slayer's Final Confrontation
		ach(63754),	-- The Vampire Bishop
		ach(63755),	-- Veteran: The Vampire Bishop
		ach(63758),	-- Heroic: The Vampire Bishop
		ach(63759),	-- Mythic: The Vampire Bishop
		ach(63743),	-- The Witch of the Wilds
		ach(63744),	-- Veteran: The Witch of the Wilds
		ach(63745),	-- Heroic: The Witch of the Wilds
		ach(63746),	-- Mythic: The Witch of the Wilds
		ach(63737),	-- The Witch of the Woods
		ach(63738),	-- Veteran: The Witch of the Woods
		ach(63741),	-- Heroic: The Witch of the Woods
		ach(63742),	-- Mythic: The Witch of the Woods
		ach(63806),	-- The Witch's Final Confrontation
		ach(63807),	-- Veteran: The Witch's Final Confrontation
		ach(63808),	-- Heroic: The Witch's Final Confrontation
		ach(63809),	-- Mythic: The Witch's Final Confrontation

		-- Levels
		ach(63798),	-- The Complete Tale
		ach(63799),	-- Veteran: The Complete Tale
		ach(63800),	-- Heroic: The Complete Tale
		ach(63801),	-- Mythic: The Complete Tale
		ach(63786),	-- The Tale of Darkhaven
		ach(63787),	-- Veteran: The Tale of Darkhaven
		ach(63788),	-- Heroic: The Tale of Darkhaven
		ach(63789),	-- Mythic: The Tale of Darkhaven
		ach(63782),	-- The Tale of Greenthistle Wood
		ach(63783),	-- Veteran: The Tale of Greenthistle Wood
		ach(63784),	-- Heroic: The Tale of Greenthistle Wood
		ach(63785),	-- Mythic: The Tale of Greenthistle Wood
		ach(63794),	-- The Tale of Greywake's Expedition
		ach(63795),	-- Veteran: The Tale of Greywake's Expedition
		ach(63796),	-- Heroic: The Tale of Greywake's Expedition
		ach(63797),	-- Mythic: The Tale of Greywake's Expedition
		ach(63790),	-- The Tale of the Court of Night
		ach(63791),	-- Veteran: The Tale of the Court of Night
		ach(63792),	-- Heroic: The Tale of the Court of Night
		ach(63793),	-- Mythic: The Tale of the Court of Night
	}),
	n(REWARDS, {
		currency(BOUND_SILVER),
		currency(DUCATS),
		currency(OUTFITTER_SUPPLIES),
	}),
}))
