-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

-- These are for the outdoor section of Uldaman before the instance. (rather than listing them in Badlands...)
local OUTDOOR_ULDAMAN_CRS = {
	4846,	-- Shadowforge Digger
	4845,	-- Shadowforge Ruffian
	4844,	-- Shadowforge Surveyor
};

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(239, {	-- Uldaman
		-- #if BEFORE MOP
		["lore"] = "Uldaman is an ancient Titan vault buried deep within the Khaz Mountains, accessible from the Badlands. Partially excavated, it has since fallen into the hands of the Dark Iron dwarves who seek to corrupt its riches for their master, Ragnaros.",
		-- #endif
		-- #if BEFORE WRATH
		["zone-text-areaID"] = 1337,	-- Uldaman
		-- #endif
		["mapID"] = MAP.ULDAMAN,
		["coords"] = {
			{ 36.6, 29.4, MAP.ULDAMAN_OUTDOORS },	-- Uldaman [Front], Uldaman [Badlands]
			{ 64.0, 44.0, MAP.BADLANDS },	-- Uldaman [Side]
		},
		["lvl"] = lvlsquish(35, 35, 15),
		["groups"] = {
			n(PROFESSIONS, {
				prof(ENCHANTING, {
					n(11073, {	-- Annora <Master Enchanter>
						["description"] = createLocalizationString({
							readable = "To get the Annora to spawn, you'll have to kill all scorpions first.",
							constant = "TO_GET_THE_ANNORA_TO_SPAWN_YOU_LL_HAVE_TO_KILL",
							export = true,
							text = {
								en = "To get the Annora to spawn, you'll have to kill all scorpions first.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "要让安诺拉刷新，你必须先杀掉所有蝎子。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = ENCHANTING_RECIPES.ARTISAN,
					}),
				}),
			}),
			n(QUESTS, {
				q(2964, {	-- A Future Task [Alliance]
					["sourceQuest"] = 2977,	-- Return to Ironforge
					["qg"] = 2916,	-- Historian Karnik
					["coord"] = { 77.2, 11.8, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 45,
					["groups"] = {
						i(34418, {	-- Scrying Wand
							["timeline"] = {
								ADDED_2_3_0,
								REMOVED_4_0_3,
							},
						}),
						-- #if BEFORE MOP
						i(34419, {	-- Thorium Flight Blade
							["timeline"] = {
								ADDED_2_3_0,
								REMOVED_4_0_3,
							},
						}),
						-- #endif
					},
				}),
				q(2968, {	-- A Future Task [Horde]
					["sourceQuest"] = 2967,	-- Return to Thunder Bluff
					["qg"] = 3978,	-- Sage Truthseeker
					["coord"] = { 34.4, 46.9, MAP.THUNDER_BLUFF },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 45,
					["groups"] = {
						i(34421, {	-- Cave Crawler's Mail Treads
							["timeline"] = {
								ADDED_2_3_0,
								REMOVED_4_0_3,
							},
						}),
						i(34422, {	-- Tempered Thorium Boots
							["timeline"] = {
								ADDED_2_3_0,
								REMOVED_4_0_3,
							},
						}),
					},
				}),
				q(27677, {	-- Archaedas, The Ancient Stone Watcher [Alliance]
					["sourceQuest"] = 27672,	-- The Chamber of Khaz'mul [Alliance]
					["qg"] = 46234,	-- Lead Prospector Durdin <Explorer's League>
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Archaedas slain
							["provider"] = { "n", 2748 },	-- Archaedas <Ancient Stone Watcher>
						}),
					},
				}),
				q(27680, {	-- Archaedas, The Ancient Stone Watcher [Horde]
					["sourceQuest"] = 27679,	-- The Chamber of Khaz'mul [Horde]
					["qg"] = 46236,	-- High Examiner Tae'thelan Bloodwatcher <The Reliquary>
					["timeline"] = { ADDED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Archaedas slain
							["provider"] = { "n", 2748 },	-- Archaedas <Ancient Stone Watcher>
						}),
					},
				}),
				q(2200, {	-- Back to Uldaman
					["sourceQuest"] = 2199,	-- Lore for a Price
					["qg"] = 6826,	-- Talvash del Kissel
					["coord"] = { 36.4, 3.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						i(7667),	-- Talvash's Phial of Scrying
					},
				}),
				q(27676, {	-- Behind Closed Doors
					["qg"] = 46233,	-- Olga Runesworn
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Galgann Firehammer slain
							["provider"] = { "n", 7291 },	-- Galgann Firehammer
						}),
					},
				}),
				q(27681, {	-- Behind Closed Doors
					["qg"] = 46235,	-- Lidia Sunglow
					["timeline"] = { ADDED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Galgann Firehammer slain
							["provider"] = { "n", 7291 },	-- Galgann Firehammer
						}),
					},
				}),
				q(2340, {	-- Deliver the Gems
					["sourceQuest"] = 2339,	-- Find the Gems and Power Source
					["providers"] = {
						{ "n", 6868 },	-- Jarkal Mossmeld
						{ "i", 7887 },	-- Necklace and Gem Salvage
					},
					["coord"] = { 2.6, 46.0, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
				}),
				q(2201, {	-- Find the Gems
					["sourceQuest"] = 2200,	-- Back to Uldaman
					["providers"] = {
						{ "n", 6912 },	-- Remains of a Paladin
						{ "i", 7668 },	-- Bloodstained Journal
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						objective(1, {	-- 0/1 Shattered Necklace Ruby
							["provider"] = { "i", 7669 },	-- Shattered Necklace Ruby
						}),
						objective(2, {	-- 0/1 Shattered Necklace Sapphire
							["provider"] = { "i", 7670 },	-- Shattered Necklace Sapphire
						}),
						objective(3, {	-- 0/1 Shattered Necklace Topaz
							["provider"] = { "i", 7671 },	-- Shattered Necklace Topaz
						}),
					},
				}),
				q(2339, {	-- Find the Gems and Power Source
					["sourceQuest"] = 2338,	-- Translating the Journal
					["providers"] = {
						{ "n", 6868 },	-- Jarkal Mossmeld
						{ "i", 7668 },	-- Bloodstained Journal
					},
					["coord"] = { 2.6, 46.0, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						objective(1, {	-- 0/1 Shattered Necklace Ruby
							["provider"] = { "i", 7669 },	-- Shattered Necklace Ruby
						}),
						objective(2, {	-- 0/1 Shattered Necklace Sapphire
							["provider"] = { "i", 7670 },	-- Shattered Necklace Sapphire
						}),
						objective(3, {	-- 0/1 Shattered Necklace Topaz
							["provider"] = { "i", 7671 },	-- Shattered Necklace Topaz
						}),
						objective(4, {	-- 0/1 Shattered Necklace Power Source
							["provider"] = { "i", 7672 },	-- Shattered Necklace Power Source
						}),
					},
				}),
				q(27673, {	-- It's What's Inside That Counts
					["qg"] = 46247,	-- Kand Sandseeker
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Obsidian Power Core
							["provider"] = { "i", 62053 },	-- Obsidian Power Core
						}),
						objective(2, {	-- 0/1 Titan Power Core
							["provider"] = { "i", 62055 },	-- Titan Power Core
						}),
					},
				}),
				q(2199, {	-- Lore for a Price
					["sourceQuest"] = 2198,	-- The Shattered Necklace
					["qg"] = 6826,	-- Talvash del Kissel
					["coord"] = { 36.4, 3.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 2842, 5 } },	-- Silver Bar (x5)
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
				}),
				q(2283, {	-- Necklace Recovery
					["qg"] = 6986,	-- Dran Droffers <Droffers and Son Salvage>
					["coord"] = { 59.4, 36.8, MAP.ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						objective(1, {	-- 0/1 Shattered Necklace
							["provider"] = { "i", 7666 },	-- Shattered Necklace
						}),
					},
				}),
				q(2284, {	-- Necklace Recovery, Take 2
					["sourceQuest"] = 2283,	-- Necklace Recovery
					["qg"] = 6986,	-- Dran Droffers <Droffers and Son Salvage>
					["coord"] = { 59.4, 36.8, MAP.ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
				}),
				q(2341, {	-- Necklace Recovery, Take 3
					["sourceQuest"] = 2340,	-- Deliver the Gems
					["qg"] = 6986,	-- Dran Droffers <Droffers and Son Salvage>
					["coord"] = { 59.4, 36.8, MAP.ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						i(7888, {	-- Jarkal's Enhancing Necklace
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2963, {	-- Portents of Uldum [Alliance]
					["sourceQuest"] = 2439,	-- The Platinum Discs (3/3) [Alliance]
					["qg"] = 5387,	-- High Explorer Magellas
					["coord"] = { 69.8, 18.4, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 45,
				}),
				q(2965, {	-- Portents of Uldum [Horde]
					["sourceQuest"] = 2440,	-- The Platinum Discs (3/3) [Horde]
					["qg"] = 3978,	-- Sage Truthseeker
					["coord"] = { 34.6, 47.2, MAP.THUNDER_BLUFF },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 45,
				}),
				q(1956, {	-- Power in Uldaman
					["sourceQuest"] = 1955,	-- The Exorcism
					["qg"] = 6546,	-- Tabetha
					["coord"] = { 46.0, 57.0, MAP.DUSTWALLOW_MARSH },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { MAGE },
					["lvl"] = 35,
					["groups"] = {
						objective(1, {	-- 0/1 Obsidian Power Source
							["provider"] = { "i", 8053 },	-- Obsidian Power Source
						}),
					},
				}),
				q(3375, {	-- Replacement Phial
					["sourceQuest"] = 2199,	-- Lore for a Price
					["qg"] = 6826,	-- Talvash del Kissel
					["coord"] = { 36.4, 3.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = {
						{ "i", 3827, 1 },	-- Mana Potion
						{ "i", 3857, 1 },	-- Coal
						{ "i", 1708, 1 },	-- Sweet Nectar
					},
					["races"] = ALLIANCE_ONLY,
					["repeatable"] = true,
					["lvl"] = 37,
					["groups"] = {
						i(7667),	-- Talvash's Phial of Scrying
					},
				}),
				q(2204, {	-- Restoring the Necklace (1/2)
					["sourceQuest"] = 2201,	-- Find the Gems
					["provider"] = { "i", 7667 },	-- Talvash's Phial of Scrying
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						objective(1, {	-- 0/1 Shattered Necklace Power Source
							["provider"] = { "i", 7672 },	-- Shattered Necklace Power Source
						}),
					},
				}),
				q(2361, {	-- Restoring the Necklace (2/2)
					["sourceQuest"] = 2204,	-- Restoring the Necklace (1/2)
					["qg"] = 6826,	-- Talvash del Kissel
					["coord"] = { 36.4, 3.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
					["groups"] = {
						i(7673, {	-- Talvash's Enhancing Necklace
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2977, {	-- Return to Ironforge
					["sourceQuest"] = 2954,	-- The Stone Watcher
					["providers"] = {
						{ "o", 142343 },	-- Uldum Pedestal
						{ "i", 6064 },	-- Miniature Platinum Discs
					},
					["coord"] = { 37.7, 81.5, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.IRONFORGE },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 45,
				}),
				q(2967, {	-- Return to Thunder Bluff
					["sourceQuest"] = 2954,	-- The Stone Watcher
					["providers"] = {
						{ "o", 142343 },	-- Uldum Pedestal
						{ "i", 6064 },	-- Miniature Platinum Discs
					},
					["coord"] = { 37.7, 81.5, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.THUNDER_BLUFF },
					["races"] = HORDE_ONLY,
					["lvl"] = 45,
				}),
				q(2946, {	-- Seeing What Happens [Alliance]
					["sourceQuest"] = 2963,	-- Portents of Uldum [Alliance]
					["providers"] = {
						{ "n", 2916 },	-- Historian Karnik
						{ "i", 6064 },	-- Miniature Platinum Discs
					},
					["coord"] = { 77.2, 11.8, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 45,
				}),
				q(2966, {	-- Seeing What Happens [Horde]
					["sourceQuest"] = 2965,	-- Portents of Uldum [Horde]
					["providers"] = {
						{ "n", 5770 },	-- Nara Wildmane
						{ "i", 6064 },	-- Miniature Platinum Discs
					},
					["coord"] = { 75.6, 31.2, MAP.THUNDER_BLUFF },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 45,
				}),
				q(27672, {	-- The Chamber of Khaz'mul [Alliance]
					["qg"] = 46234,	-- Lead Prospector Durdin <Explorer's League>
					["timeline"] = { ADDED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Ironaya slain
							["provider"] = { "n", 7228 },	-- Ironaya
						}),
					},
				}),
				q(27679, {	-- The Chamber of Khaz'mul [Horde]
					["qg"] = 46236,	-- High Examiner Tae'thelan Bloodwatcher <The Reliquary>
					["timeline"] = { ADDED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Ironaya slain
							["provider"] = { "n", 7228 },	-- Ironaya
						}),
					},
				}),
				q(2240, {	-- The Hidden Chamber
					["sourceQuest"] = 2398,	-- The Lost Dwarves
					["qg"] = 6906,	-- Baelog
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 35,
					["groups"] = {
						i(9626, {	-- Dwarven Charge
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(9627, {	-- Explorers' League Lodestar
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2398, {	-- The Lost Dwarves
					["qg"] = 1356,	-- Prospector Stormpike
					["coord"] = { 74.6, 11.7, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 35,
				}),
				q(1139, {	-- The Lost Tablets of Will
					["sourceQuest"] = 762,	-- An Ambassador of Evil
					["qg"] = 2918,	-- Advisor Belgrum
					["coord"] = { 77.3, 9.7, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 35,
					["groups"] = {
						objective(1, {	-- 0/1 Tablet of Will
							["provider"] = { "i", 5824 },	-- Tablet of Will
						}),
						i(6723, {	-- Medal of Courage
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2278, {	-- The Platinum Discs (1/3)
					["description"] = createLocalizationString({
						readable = "Right click on The Discs of Norgannon after defeating Archaedas to start this quest.",
						constant = "RIGHT_CLICK_ON_THE_DISCS_OF_NORGANNON_AFTER",
						export = true,
						text = {
							en = "Right click on The Discs of Norgannon after defeating Archaedas to start this quest.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "击败阿扎达斯后右键点击诺甘农圆盘来开始此任务。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 131474 },	-- The Discs of Norgannon
					["lvl"] = lvlsquish(40, 40, 15),
				}),
				q(2279, {	-- The Platinum Discs (2/3) [Alliance]
					["provider"] = { "i", 6064 },	-- Miniature Platinum Discs
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = lvlsquish(40, 40, 15),
				}),
				-- #if BEFORE CATA
				-- apparently there used to be A/H versions of these quests, then changed to one shared version in Cata?
				q(2280, {	-- The Platinum Discs (2/3) [Horde]
					["provider"] = { "i", 6064 },	-- Miniature Platinum Discs
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(40, 40, 15),
				}),
				-- #else
				q(2280, {	-- The Platinum Discs (2/3) [Both]
					["provider"] = { "i", 6064 },	-- Miniature Platinum Discs
					["lvl"] = lvlsquish(40, 40, 15),
					["groups"] = {
						i(65921, {	-- Durdin's Hammer
							["timeline"] = { ADDED_4_0_3 },
						}),
						i(65947, {	-- Platinum Sword
							["timeline"] = { ADDED_4_0_3 },
						}),
						i(65971, {	-- Band of Uldaman
							["timeline"] = { ADDED_4_0_3 },
						}),
					},
				}),
				-- #endif
				q(2439, {	-- The Platinum Discs (3/3) [Alliance]
					["sourceQuest"] = 2279,	-- The Platinum Discs (2/3) [Alliance]
					["qg"] = 5387,	-- High Explorer Magellas <Explorers' League>
					["coord"] = { 69.9, 18.6, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 8070, 1 } },	-- Reward Voucher
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 40,
					["groups"] = {
						i(9587, {	-- Thawpelt Sack
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2440, {	-- The Platinum Discs (3/3) [Horde]
					["sourceQuest"] = 2280,	-- The Platinum Discs (2/3) [Horde]
					["qg"] = 3978,	-- Sage Truthseeker
					["coord"] = { 34.6, 47.2, MAP.THUNDER_BLUFF },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 8070, 1 } },	-- Reward Voucher
					["races"] = HORDE_ONLY,
					["lvl"] = 40,
					["groups"] = {
						i(9587, {	-- Thawpelt Sack
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(2198, {	-- The Shattered Necklace
					["provider"] = { "i", 7666 },	-- Shattered Necklace
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 37,
				}),
				q(2954, {	-- The Stone Watcher
					["sourceQuests"] = {
						2946,	-- Seeing What Happens [Ironforge]
						2966,	-- Seeing What Happens [Thunder Bluff]
					},
					["provider"] = { "o", 142343 },	-- Uldum Pedestal
					["coord"] = { 37.7, 81.5, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 45,
				}),
				q(2318, {	-- Translating the Journal (1/2)
					["sourceQuest"] = 2284,	-- Necklace Recovery, Take 2
					["providers"] = {
						{ "n", 6912 },	-- Remains of a Paladin
						{ "i", 7886 },	-- Untranslated Journal
					},
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
				}),
				q(2338, {	-- Translating the Journal (2/2)
					["sourceQuest"] = 2318,	-- Translating the Journal
					["providers"] = {
						{ "n", 6868 },	-- Jarkal Mossmeld
						{ "i", 7886 },	-- Untranslated Journal
					},
					["coord"] = { 2.6, 46.0, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 37,
				}),
				q(27682, {	-- We Require More Minerals
					["qg"] = 46241,	-- Aoren Sunglow
					["timeline"] = { ADDED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = lvlsquish(35, 35, 15),
					["groups"] = {
						objective(1, {	-- 0/1 Obsidian Power Core
							["provider"] = { "i", 62053 },	-- Obsidian Power Core
						}),
						objective(2, {	-- 0/1 Titan Power Core
							["provider"] = { "i", 62055 },	-- Titan Power Core
						}),
					},
				}),
			}),
			n(ZONE_DROPS, {
				i(7666),	-- Shattered Necklace
				i(9420),	-- Adventurer's Pith Helmet
				i(9392),	-- Annealed Blade
				i(9393, {	-- Beacon of Hope
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
				i(9465),	-- Digmaster 5000
				i(9381),	-- Earthen Rod
				i(9397),	-- Energy Cloak
				i(9386, {	-- Excavator's Brand
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
				i(9424),	-- Ginn-Su Sword
				i(9396),	-- Legguards of the Vault
				i(9429),	-- Miner's Hat of the Deep
				i(9426),	-- Monolithic Bow
				i(9383),	-- Obsidian Cleaver
				i(9431),	-- Papal Fez
				i(9425),	-- Pendulum of Doom
				i(9422),	-- Shadowforge Bushmaster
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_THREE, i(223537)),	-- Skullplate Bracers
				i(9432, {	-- Skullplate Bracers
					["timeline"] = { REMOVED_1_15_2 },
				}),
				-- #else
				i(9432),	-- Skullplate Bracers
				-- #endif
				i(9430),	-- Spaulders of a Lost Age
				i(9406, {	-- Spirewind Fetter
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
				i(9427),	-- Stonevault Bonebreaker
				i(9384, {	-- Stonevault Shiv
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
				i(9423),	-- The Jackhammer
				i(9391, {	-- The Shoveler
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
				i(9428, {	-- Unearthed Bands
					["crs"] = OUTDOOR_ULDAMAN_CRS,
				}),
			}),
			n(RARES, {
				n(7057, {	-- Digmaster Shovelphlange
					["description"] =
						-- #if AFTER 10.1.7
						"This guy spawns outside of the instance, inside the halls or cave ends surrounding Dig One. All locations can be reached with '/tar Digmaster Shovelphlange' from the cave leading in to the North Common Hall.",
						-- #else
						"This guy spawns outside of the instance in the cave leading to the instance.",
						-- #endif
					-- #if AFTER 10.1.7
					["coords"] = {
						{ 62.0, 51.5, MAP.ULDAMAN_OUTDOORS },	-- Spur cave
						{ 51.8, 68.5, MAP.ULDAMAN_OUTDOORS },	-- The Sealed Hall
						{ 34.0, 84.5, MAP.ULDAMAN_OUTDOORS },	-- North Common Hall
						{ 32.4, 62.4, MAP.ULDAMAN_OUTDOORS },	-- South Common Hall
					},
					["maps"] = { MAP.BADLANDS },
					-- #endif
					["timeline"] = { REMOVED_4_0_3, ADDED_10_1_7 },
					["groups"] = {
						i(9378, {	-- Shovelphlange's Mining Axe
							["timeline"] = { REMOVED_4_0_3, ADDED_10_1_7 },
						}),
						i(9375, {	-- Expert Goldminer's Helmet
							["timeline"] = { REMOVED_4_0_3, ADDED_10_1_7 },
						}),
						i(9382, {	-- Tromping Miner's Boots
							["timeline"] = { REMOVED_4_0_3, ADDED_10_1_7 },
						}),
					},
				}),
			}),
			n(TREASURES, {
				o(141979, {	-- Ancient Treasure
					["description"] = createLocalizationString({
						readable = "Found in the Hall of the Crafters after you defeat Archaedas. Contains 2-3 items.",
						constant = "FOUND_IN_THE_HALL_OF_THE_CRAFTERS_AFTER_YOU",
						export = true,
						text = {
							en = "Found in the Hall of the Crafters after you defeat Archaedas. Contains 2-3 items.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "击败阿扎达斯后可在工匠大厅中找到。包含 2-3 件物品。",
							-- TODO: tw = "",
						},
					}),
					["modelScale"] = 3,
					["sym"] = {{"select","itemID",	-- Since this is basically a source for any classic world drops, we will only list drops where the Ancient Treasure appears to be the best chance
						8029,	-- Plans: Wicked Mithril Blade
					}},
				}),
				o(123329, {	-- Baelog's Chest
					i(7740, {	-- Gni'kiv Medallion
						["description"] = createLocalizationString({
							readable = "Use this item along with the Shaft of Tsol to create the Staff of Prehistoria required to open the door to Ironaya.\n\nYou should ask whoever loots the Shaft of Tsol from Revelosh to trade it to you.",
							constant = "USE_THIS_ITEM_ALONG_WITH_THE_SHAFT_OF_TSOL_TO",
							export = true,
							text = {
								en = "Use this item along with the Shaft of Tsol to create the Staff of Prehistoria required to open the door to Ironaya.\n\nYou should ask whoever loots the Shaft of Tsol from Revelosh to trade it to you.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "将此物品与索尔之柄一起使用，即可制作出打开伊罗娜之门所需的史前法杖。\n\n你应当请从雷弗洛什身上拾取到索尔之柄的人把它交易给你。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { REMOVED_4_1_0 },
					}),
				}),
				o(125477, {	-- Conspicuous Urn
					["description"] = createLocalizationString({
						readable = "In the room with the Lost Dwarves next to the sealed door opposite to the dwarves on top of the stairs. You will need to kill some stealthed Troggs to get there.",
						constant = "IN_THE_ROOM_WITH_THE_LOST_DWARVES_NEXT_TO_THE",
						export = true,
						text = {
							en = "In the room with the Lost Dwarves next to the sealed door opposite to the dwarves on top of the stairs. You will need to kill some stealthed Troggs to get there.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在密封之门旁、楼梯上方矮人对面的房间里，那里有失踪的矮人。你需要杀死一些潜行的穴居人才能到达那里。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(7671),	-- Shattered Necklace Topaz
					},
				}),
				o(113757, {	-- Shadowforge Cache
					["description"] = createLocalizationString({
						readable = "WARNING: Defeat the Galgann Firehammer first as looting this chest will spawn two dwarven Ambushers.\n\nNOTE: This trigger only occurs once per instance lockout.",
						constant = "WARNING_DEFEAT_THE_GALGANN_FIREHAMMER_FIRST_AS",
						export = true,
						text = {
							en = "WARNING: Defeat the Galgann Firehammer first as looting this chest will spawn two dwarven Ambushers.\n\nNOTE: This trigger only occurs once per instance lockout.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "警告：请先击败加加恩·火锤，因为拾取这个箱子会生成两个矮人伏击者。\n\n注意：此触发每个副本锁定周期只会发生一次。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(7669),	-- Shattered Necklace Ruby
					},
				}),
				i(7733, {	-- Staff of Prehistoria
					["description"] = createLocalizationString({
						readable = "Use this on the Keystone in the digsite that has the miniature city to open the door to Ironaya.\n\nThis is a reference to the Raiders of the Lost Ark.",
						constant = "USE_THIS_ON_THE_KEYSTONE_IN_THE_DIGSITE_THAT",
						export = true,
						text = {
							en = "Use this on the Keystone in the digsite that has the miniature city to open the door to Ironaya.\n\nThis is a reference to the Raiders of the Lost Ark.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在有微缩城市的挖掘场中对拱心石使用此物，即可打开通往伊罗娜的门。\n\n这是对《夺宝奇兵》的致敬。",
							-- TODO: tw = "",
						},
					}),
					["timeline"] = { REMOVED_4_1_0 },
					["cost"] = {
						{ "i", 7740, 1 },	-- Gni'kiv Medallion
						{ "i", 7741, 1 },	-- The Shaft of Tsol
					},
				}),
				o(142088, {	-- Tablet of Will
					["description"] = createLocalizationString({
						readable = "Located in the same room as Galgann Firehammer.",
						constant = "LOCATED_IN_THE_SAME_ROOM_AS_GALGANN_FIREHAMMER",
						export = true,
						text = {
							en = "Located in the same room as Galgann Firehammer.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与加加恩·火锤在同一个房间内。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(5824),	-- Tablet of Will
					},
				}),
				o(131474, {	-- The Discs of Norgannon
					["description"] = createLocalizationString({
						readable = "Talk to the Lore Keeper until he has finished talking and then pick up the quest from The Discs of Norgannon again.",
						constant = "TALK_TO_THE_LORE_KEEPER_UNTIL_HE_HAS_FINISHED",
						export = true,
						text = {
							en = "Talk to the Lore Keeper until he has finished talking and then pick up the quest from The Discs of Norgannon again.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与博学者交谈，直到他说完话，然后再次从诺甘农圆盘处接取任务。",
							-- TODO: tw = "",
						},
					}),
					["modelScale"] = 3,
					["groups"] = {
						i(6064),	-- Miniature Platinum Discs
					},
				}),
			}),
			-- #if AFTER 6.0.2
			e(468, {	-- The Lost Dwarves (Baelog)
				["crs"] = {
					6906,	-- Baelog
					6908,	-- Olaf
					6907,	-- Eric "The Swift"
				},
				["races"] = HORDE_ONLY,
				["groups"] = {
					i(9400),	-- Baelog's Shortbow
					i(9403),	-- Battered Viking Shield
					i(151396, {	-- Erik's High-Performance Armbands
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(9394),	-- Horned Viking Helmet
					i(9401),	-- Nordic Longshank
					i(9404),	-- Olaf's All Purpose Shield
					i(132734, {	-- Viking Chain Boots
						["timeline"] = { ADDED_7_0_3},
					}),
					i(9398),	-- Worn Running Boots
				},
			}),
			-- #else
			n(6906, {	-- Baelog
				["description"] = createLocalizationString({
					readable = "This dwarf is named after the French Archiologist, René Belloq, from the Raiders of the Lost Ark.",
					constant = "THIS_DWARF_IS_NAMED_AFTER_THE_FRENCH",
					export = true,
					text = {
						en = "This dwarf is named after the French Archiologist, René Belloq, from the Raiders of the Lost Ark.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这位矮人的名字来源于《夺宝奇兵》中的法国考古学家勒内·贝洛克。",
						-- TODO: tw = "",
					},
				}),
				["races"] = HORDE_ONLY,
				["groups"] = {
					i(9399),	-- Precision Arrow
					i(9401),	-- Nordic Longshank
					i(9400),	-- Baelog's Shortbow
				},
			}),
			n(6907, {	-- Eric "The Swift"
				["races"] = HORDE_ONLY,
				["groups"] = {
					i(9394),	-- Horned Viking Helmet
					i(151396, {	-- Erik's High-Performance Armbands
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(132734, {	-- Viking Chain Boots
						["timeline"] = { ADDED_7_0_3},
					}),
					i(9398),	-- Worn Running Boots
					i(2459),	-- Swiftness Potion
				},
			}),
			n(6908, {	-- Olaf
				["races"] = HORDE_ONLY,
				["groups"] = {
					i(9404),	-- Olaf's All Purpose Shield
					i(9403),	-- Battered Viking Shield
					i(1177),	-- Oil of Olaf
				},
			}),
			-- #endif
			n(6912, {	-- Remains of a Paladin
				-- #if AFTER 4.0.3
				["description"] = createLocalizationString({
					readable = "This dead Paladin was central in now removed dungeon quests, and remains abandoned on the ground without any purpose.",
					constant = "THIS_DEAD_PALADIN_WAS_CENTRAL_IN_NOW_REMOVED",
					export = true,
					text = {
						en = "This dead Paladin was central in now removed dungeon quests, and remains abandoned on the ground without any purpose.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这位死去的圣骑士曾是现已移除的地下城任务的关键人物，如今仍被遗弃在地上，没有任何用途。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["groups"] = {
					i(7886),	-- Untranslated Journal
				},
			}),
			e(467, {	-- Revelosh
				["creatureID"] = 6910,
				["groups"] = {
					i(7741, {	-- The Shaft of Tsol
						["description"] = createLocalizationString({
							readable = "Use this item along with the Gni'kiv Medallion to create the Staff of Prehistoria required to open the door to Ironaya.\n\nYou should trade this to the person that looted the Gni'kiv Medallion.",
							constant = "USE_THIS_ITEM_ALONG_WITH_THE_GNI_KIV_MEDALLION",
							export = true,
							text = {
								en = "Use this item along with the Gni'kiv Medallion to create the Staff of Prehistoria required to open the door to Ironaya.\n\nYou should trade this to the person that looted the Gni'kiv Medallion.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "将此物品与格尼基夫徽章一起使用，即可制作出打开伊罗娜之门所需的史前法杖。\n\n你应当把它交易给拾取到格尼基夫徽章的人。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { REMOVED_4_1_0 },
					}),
					i(132736, {	-- Revelosh's Pauldrons
						["timeline"] = { ADDED_7_0_3 },
					}),
					-- #if SEASON_OF_DISCOVERY
					applyclassicphase(SOD_PHASE_TWO, i(217307)),	-- Revelosh's Spaulders
					applyclassicphase(SOD_PHASE_TWO, i(217305)),	-- Revelosh's Armguards
					applyclassicphase(SOD_PHASE_TWO, i(217304)),	-- Revelosh's Gloves
					applyclassicphase(SOD_PHASE_TWO, i(217306)),	-- Revelosh's Boots
					i(9389, {	-- Revelosh's Spaulders
						["timeline"] = { REMOVED_1_15_1 },
					}),
					i(9388, {	-- Revelosh's Armguards
						["timeline"] = { REMOVED_1_15_1 },
					}),
					i(9390, {	-- Revelosh's Gloves
						["timeline"] = { REMOVED_1_15_1 },
					}),
					i(9387, {	-- Revelosh's Boots
						["timeline"] = { REMOVED_1_15_1 },
					}),
					-- #else
					i(9389),	-- Revelosh's Spaulders
					i(9388),	-- Revelosh's Armguards
					i(9390),	-- Revelosh's Gloves
					i(151395, {	-- Revelosh's Girdle
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(9387),	-- Revelosh's Boots
					-- #endif
				},
			}),
			-- #if BEFORE 4.1.0
			o(124371, {	-- Keystone
				["coord"] = { 50.7, 73.9, MAP.ULDAMAN },
				["cost"] = { { "i", 7733, 1 } },	-- Staff of Prehistoria
				["groups"] = {
					-- #if OBJECTIVES
					objective(1, {	-- Explore the Hidden Chamger
						["questID"] = 2240,	-- The Hidden Chamber
						["timeline"] = { REMOVED_4_0_3 },
						["races"] = ALLIANCE_ONLY,
					}),
					-- #endif
			-- #endif
					e(469, {	-- Ironaya
						-- #if AFTER 4.1.0
						["provider"] = { "o", 124371 },	-- Keystone
						-- #endif
						["creatureID"] = 7228,
						["groups"] = {
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_TWO, i(217704)),	-- Ironshod Bludgeon
							i(9408, {	-- Ironshod Bludgeon
								["timeline"] = { REMOVED_1_15_1 },
							}),
							-- #else
							i(9408),	-- Ironshod Bludgeon
							-- #endif
							i(151398, {	-- Hood of the Idle Architect
								["timeline"] = { ADDED_7_3_0 },
							}),
							i(151420, {	-- Vault-Watcher's Breastplate
								["timeline"] = { ADDED_7_3_0 },
							}),
							i(9409),	-- Ironaya's Bracers
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_TWO, i(217303)),	-- Stoneweaver Leggings
							i(9407, {	-- Stoneweaver Leggings
								["timeline"] = { REMOVED_1_15_1 },
							}),
							-- #else
							i(9407),	-- Stoneweaver Leggings
							-- #endif
						},
					}),
			-- #if BEFORE 4.1.0
				},
			}),
			-- #endif
			e(748, {	-- Obsidian Sentinel
				["creatureID"] = 7023,
				["groups"] = {
					i(62053, {	-- Obsidian Power Core
						["timeline"] = { ADDED_4_0_3 },
					}),
					i(8053),	-- Obsidian Power Source
					i(151399, {	-- Splintered Obsidian Shard
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(470, {	-- Ancient Stone Keeper
				["creatureID"] = 7206,
				["groups"] = {
					i(62055, {	-- Titan Power Core
						["timeline"] = { ADDED_4_0_3 },
					}),
					i(9411),	-- Rockshard Pauldrons
					i(132733, {	-- Stone Keeper's Mantle
						["timeline"] = { ADDED_7_0_3},
					}),
					i(9410),	-- Cragfists
					i(151401, {	-- Titanic Stone Legguards
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(151400, {	-- Sand-Scoured Treads
						["timeline"] = { ADDED_7_3_0 },
					}),
				},
			}),
			e(471, {	-- Galgann Firehammer
				["creatureID"] = 7291,
				["groups"] = {
					i(9419),	-- Galgann's Firehammer
					i(9412),	-- Galgann's Fireblaster
					i(11310),	-- Flameseer Mantle
					i(11311),	-- Emberscale Cape
				},
			}),
			e(472, {	-- Grimlok
				["creatureID"] = 4854,
				["groups"] = {
					i(7670),	-- Shattered Necklace Sapphire
					-- #if SEASON_OF_DISCOVERY
					applyclassicphase(SOD_PHASE_TWO, i(223536)),	-- Grimlock's Charge
					applyclassicphase(SOD_PHASE_TWO, i(223535)),	-- Grimlock's Tribal Vestments
					i(9416, {	-- Grimlock's Charge
						["timeline"] = { REMOVED_1_15_1 },
					}),
					i(9415, {	-- Grimlock's Tribal Vestments
						["timeline"] = { REMOVED_1_15_1 },
					}),
					-- #else
					i(9416),	-- Grimlock's Charge
					i(9415),	-- Grimlock's Tribal Vestments
					-- #endif
					i(151402, {	-- Grimlock's Jagged Wristguards
						["timeline"] = { ADDED_7_3_0 },
					}),
					i(132735, {	-- Grimlock's Chain Chaps
						["timeline"] = { ADDED_7_0_3},
					}),
					i(9414),	-- Oilskin Leggings
				},
			}),
			e(473, {	-- Archaedas
				["creatureID"] = 2748,
				["groups"] = {
					ach(638),	-- Uldaman
					ach(5047, {	-- Uldaman Guild Run
						["timeline"] = { ADDED_4_0_3 },
					}),
					i(7672),	-- Shattered Necklace Power Source
					i(9418),	-- Stoneslayer
					i(9413),	-- The Rockpounder
					i(11118),	-- Archaedic Stone
				},
			}),
		},
	}),
}));
