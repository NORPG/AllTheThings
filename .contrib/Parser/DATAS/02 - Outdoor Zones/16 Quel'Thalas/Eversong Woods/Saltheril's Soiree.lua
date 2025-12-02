---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------
SALTHERILS_HAVEN = createHeader({
	readable = "Saltheril's Soiree",
	--icon = ,
	text = {
		en = "Saltheril's Soiree",
	},
});
root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.EVERSONG_WOODS, {
		n(SALTHERILS_HAVEN, {
			n(ACHIEVEMENTS, {
			}),
			n(QUESTS, {
				q(91627, {	-- Saltheril's Haven
					--["sourceQuests"] = { ??? },	-- ??
					["provider"] = { "n", 247955 },	-- Jonas Everdawn
					["coord"] = { 45.7, 62.5, MAP.MIDNIGHT.SILVERMOON_CITY },
				}),
				q(91628, {	-- Honored Guests
					["sourceQuests"] = { 91627 },	-- Saltheril's Haven
					["provider"] = { "n", 240832 },	-- Lord Saltheril
					["coord"] = { 42.7, 47.3, MAP.MIDNIGHT.EVERSONG_WOODS },
				}),
				q(91629, {	-- High Esteem
					["sourceQuests"] = { 91628 },	-- Honored Guests
					["provider"] = { "n", 240832 },	-- Lord Saltheril
					["coord"] = { 42.7, 47.3, MAP.MIDNIGHT.EVERSONG_WOODS },
					["groups"] = {
						i(238987),	-- Saltheril's Favor (TODO: not really quest item, but it is?)
					},
				}),
				q(91693, {	-- The Subtle Game
					["sourceQuests"] = { 91629 },	-- High Esteem (TODO: could be wrong)
					["provider"] = { "n", 240832 },	-- Lord Saltheril
					["coord"] = { 42.7, 47.3, MAP.MIDNIGHT.EVERSONG_WOODS },
				}),
			}),
			--Blood-Guards weekly
			n(QUESTS, sharedData({
				["provider"] = { "n", 240835 },	-- Knight-Lord Sunguard
				["coord"] = { 42.4, 46.7, MAP.MIDNIGHT.EVERSONG_WOODS },
				["isWeekly"] = true,
			}, {
				--q(XXX),	-- Fortify the Runestones: XXX
				q(91971, {	-- Hitting the Hammer
					["description"] = "Up after 1st Saltheril's Favor donation.",
					["groups"] = {
						i(249416),	-- Partially Eaten Rations (QI!)
						i(249413),	-- Previously Loved Earring (QI!)
						i(249412),	-- Smelly Left Shoe (QI!)
						i(249415),	-- Throk's Scroll of Doom (QI!)
						i(249411),	-- Twilight Tokens (QI!)
					},
				}),
				q(91978, {	-- Taxing the Tideborne
					["description"] = "Up after 2nd Saltheril's Favor donation.",
					["groups"] = {
						o(568550, {	--
							i(249686),	-- Tideborne Dubloon (QI!)
						}),
					},
				}),
				q(91973, {	-- Naga Blade
					["description"] = "Up after 3rd Saltheril's Favor donation.",
					["groups"] = {
						o(568483, {	--
							i(249499),	-- Naga Scimitar (QI!)
						}),
					},
				}),
			})),
			--Farstriders weekly
			n(QUESTS, sharedData({
				["provider"] = { "n", 240836 },	-- Ranger-Captain Dawnfletch
				["coord"] = { 42.9, 46.4, MAP.MIDNIGHT.EVERSONG_WOODS },
				["isWeekly"] = true,
			}, {
				q(90575),	-- Fortify the Runestones: Farstriders
				q(91989, {	-- Ghostland Peppers
					["description"] = "Up after 1st Saltheril's Favor donation.",
					["groups"] = {
						o(568477, {	--
							i(249497),	-- Ghostland Pepper (QI!)
						}),
					},
				}),
				q(91984, {	-- Sungrub Silk
					["description"] = "Up after 2nd Saltheril's Favor donation.",
					["groups"] = {
						i(249422),	-- Sunsilk (QI!)
					},
				}),
				q(91985, {	-- Windrunner Memorabilia
					["description"] = "Up after 3rd Saltheril's Favor donation.",
					["groups"] = {
						i(249542),	-- Partially Used Memento (QI!)
						o(568507, {	--
							i(249552),	-- Mischievous Mask (QI!)
							i(249531),	-- Mysterious Cube (QI!)
							i(249540),	-- Oddly Sealed Book (QI!)
							i(249554),	-- Variable Timepiece (QI!)
						}),
					},
				}),
			})),
			n(BONUS_OBJECTIVES, {
				q(91966, {	-- Saltheril's Soiree (TODO: possibly wq in future builds? questID unique per chosen faction?)
					["coord"] = { 42.7, 47.3, MAP.MIDNIGHT.EVERSONG_WOODS },
				}),
			}),
			n(REWARDS, {
				--Currency
				currency(3394),	-- Latent Arcana
				currency(3379),	-- Brimming Arcana (from runestones elite kill (244142 - Commander Viskaj))
				--It was a bad idea to not add it right away, it could be Midnight wqs rewards
				i(256969),	-- Farstrider's Pendant (neck)
			}),
			--[[n(VENDORS, {
				n(xx, {	--
					["coord"] = { x, y, MAP.MIDNIGHT.EVERSONG_WOODS },
					["groups"] = {
						i(, {
							["costs"] = {{"c", XX, XXX }},
						}),
					},
				}),
			}),]]--
		}),
	}),
}));
root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.MID, {
	m(MAP.MIDNIGHT.QUELTHALAS, {
		n(SALTHERILS_HAVEN, {
			n(QUESTS, {
				q(89431),	-- Farstrider - Epic [DNT] (spellID 1227983), Farstriders with "exeptional" tag was chosen during questID 91629 (High Esteem) // this also seems like unlock ability to see objectID 531479 (Ranger's Cache) in zone.
				q(89290),	-- Invite Rep Script [DNT] (spellID 1228071), fired when questID 91966 (Saltheril's Soiree) pop in player ui as objective (server-side push quest?), could also be sourceQuest in future for alts/weekly?
			}),
		}),
	}),
}));
