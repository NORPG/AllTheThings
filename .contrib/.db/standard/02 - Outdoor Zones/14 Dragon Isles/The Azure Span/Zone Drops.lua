---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(DRAGON_ISLES, bubbleDown({ ["timeline"] = { ADDED_10_0_2_LAUNCH } }, {
	m(THE_AZURE_SPAN, {
		n(ZONE_DROPS, {
			i(201368, {	-- Brackenhide Hollow Barbslinger
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201363, {	-- Brackenhide Hollow Maul
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201365, {	-- Brackenhide Gnoll Guard
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201370, {	-- Brackenhide Skullcracker
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201422, {	-- Flash Frozen Meat
				["crs"] = {
					189653,	-- Snowhide Brute
					197165,	-- Snowhide Gnoll
					197167,	-- Snowhide Gnoll
					189654,	-- Snowhide Shaman
					190428,	-- Snowhide Yeti Hunter
					193451,	-- Snowhide Yeti Hunter
				},
				["coords"] = {
					{ 57.6, 41.6, THE_AZURE_SPAN },
					{ 58.8, 44.0, THE_AZURE_SPAN },
					{ 63.8, 39.0, THE_AZURE_SPAN },
				},
			}),
			i(201420, {	-- Gnolan's House Special
				["crs"] = {
					187931,	-- Stormfang Bonecaster
					187551,	-- Stormfang Dustcaller
					187549,	-- Stormfang Grunt
					187930,	-- Stormfang Hexspiter
					187552,	-- Stormfang Shaman
				},
				["coord"] = { 23.0, 43.6, THE_AZURE_SPAN },
			}),
			i(201369, {	-- Hollow Greatwood Pestilence
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201367, {	-- Hollow Hunter's Sticker
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(201373, {	-- Imbu Net Cutter
				["description"] = createLocalizationString({
					readable = "Drops from Primal Mobs spawning around Tuskarr Chests or from Tuskarr Chests themselves.",
					constant = "DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
					export = true,
					text = {
						en = "Drops from Primal Mobs spawning around Tuskarr Chests or from Tuskarr Chests themselves.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "由海象人宝箱周围刷新的原始生物或海象人宝箱本身掉落。",
						-- TODO: tw = "",
					},
				}),
			}),
			i(201372, {	-- Imbu Tuskarr Axe
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(201376, {	-- Imbu Tuskarr Mace
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(201375, {	-- Imbu Warrior's Club
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(193882, {	-- Pattern: Acidic Hailstone Treads (RECIPE!)
				["description"] = createLocalizationString({
					readable = "Drops from Decayed Creatures around Bracken Hollow.",
					constant = "DROPS_FROM_DECAYED_CREATURES_AROUND_BRACKEN",
					export = true,
					text = {
						en = "Drops from Decayed Creatures around Bracken Hollow.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "由蕨皮谷周围的腐朽生物掉落。",
						-- TODO: tw = "",
					},
				}),
			}),
			i(194312, {	-- Pattern: Gnoll Tent (RECIPE!)
				["description"] = "~L.DROPS_FROM_GNOLL_CREATURES_OR_DECAY_COVERED",
			}),
			i(193868, {	-- Pattern: Slimy Expulsion Boots (RECIPE!)
				["description"] = "~L.DROPS_FROM_DECAYED_CREATURES_AROUND_BRACKEN",
			}),
			i(193869, {	-- Pattern: Toxic Thorn Footwraps (RECIPE!)
				["description"] = "~L.DROPS_FROM_DECAYED_CREATURES_AROUND_BRACKEN",
			}),
			i(193883, {	-- Pattern: Venom-Steeped Stompers (RECIPE!)
				["description"] = "~L.DROPS_FROM_DECAYED_CREATURES_AROUND_BRACKEN",
			}),
			i(204695, {	-- Recipe: Cauldron of Extracted Putrescence (RECIPE!)
				["description"] = "~L.DROPS_FROM_DECAYED_CREATURES_AROUND_BRACKEN",
				["timeline"] = { ADDED_10_1_0 },
			}),
			i(198907),	-- Technique: Illusion Parchment: Chilling Wind (RECIPE!)
			i(201735),	-- Technique: Highland Drake: Silver and Blue Armor (RECIPE!)
			i(201378, {	-- Tuskarr Angler's Crossbow
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(201377, {	-- Tuskarr Elder's Staff
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(201374, {	-- Tuskarr Fishing Pike
				["description"] = "~L.DROPS_FROM_PRIMAL_MOBS_SPAWNING_AROUND_TUSKARR",
			}),
			i(201421, {	-- Tuskarr Jerky
				["crs"] = {
					195337,	-- Chief Dead Eye
					195264,	-- Darktooth Battler
					197669,	-- Darktooth Poacher
					195269,	-- Darktooth Skirmisher
					195267,	-- Darktooth Spirit-Caller
					195270,	-- Darktooth Stalker
				},
				["coords"] = {
					{ 30.6, 41.6, THE_AZURE_SPAN },
					{ 32.0, 48.4, THE_AZURE_SPAN },
					{ 33.8, 45.0, THE_AZURE_SPAN },
					{ 34.8, 45.6, THE_AZURE_SPAN },
					{ 36.2, 47.8, THE_AZURE_SPAN },
				},
			}),
		}),
	}),
})));
