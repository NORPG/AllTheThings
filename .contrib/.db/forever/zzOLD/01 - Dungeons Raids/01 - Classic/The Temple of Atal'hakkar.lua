-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

local ATALAI_DEFENDERS = createHeader({
	readable = "Atal'ai Defenders",
	icon = 134177,
	text = {
		en = "Atal'ai Defenders",
		de = "Verteidiger der Atal'ai",
		es = "Defensores Atal'ai",
		mx = "Defensores de Atal'ai",
		fr = "Défenseurs atal’ai",
		it = "",
		ko = "아탈라이 파수병",
		pt = "Defensores Atal'ai",
		ru = "Защитники Атал'ай",
		cn = "阿塔莱防御者",
		tw = "阿塔萊防衛者",
	},
	description = {
		en = "You must kill all 6 mini bosses around the room in order to unlock the way to Jammal'an the Prophet.",
		cn = "你必须击杀大厅周围的全部6名小首领，才能解锁通往预言者迦玛兰的道路。",
	},
});

local ESSENCE_OF_ERANIKUS_PART_TWO_OnUpdate = [[function(t)
	if not t.collected and _.IsQuestFlaggedCompleted(3373) and ]] .. WOWAPI_GetItemCount(10455) .. [[ < 1 then
		if not _.Settings.AccountWide.Quests then
			t.u = ]] .. REMOVED_FROM_GAME .. [[;
		else
			t.u = nil;
		end
		t.description = "|cffaa0000You have completed the previous quest, but deleted the item needed to complete this quest. As such, you'll be unable to complete the quest chain. Sorry!|r";
	end
end]];
local ESSENCE_OF_ERANIKUS_OWN_WORDS_OnUpdate = [[function(t)
	if not _.IsQuestFlaggedCompleted(3374) and (_.IsQuestFlaggedCompleted(3373) and ]] .. WOWAPI_GetItemCount(10455) .. [[ < 1) then
		if not _.Settings.AccountWide.Quests then
			t.u = ]] .. REMOVED_FROM_GAME .. [[;
		else
			t.u = nil;
		end
		t.description = "|cffaa0000You deleted the item needed to complete the previous quest. As such, you'll be unable to complete this one. Sorry!|r";
	end
end]];

local SUNKEN_TEMPLE_ZONE_DROPS = n(ZONE_DROPS, {
	i(11318, {	-- Atal'ai Haze
		["crs"] = {
			8384,	-- Deep Lurker
			5226,	-- Murk Worm
			5228,	-- Saturated Ooze
			-- #if SEASON_OF_DISCOVERY
			224243,	-- Deep Lurker
			224242,	-- Saturated Ooze
			-- #endif
		},
	}),
	i(6181),	-- Fetish of Hakkar
	i(16216, {	-- Formula: Enchant Cloak - Greater Resistance (RECIPE!)
		["crs"] = {
			5259,	-- Atal'ai Witch Doctor
		},
	}),
	i(78346, {	-- Pattern: Green Dragonscale Breastplate (New Version) (RECIPE!)
		["timeline"] = { ADDED_4_3_0 },
	}),
	i(15733, {	-- Pattern: Green Dragonscale Leggings (Old Version) (RECIPE!)
		["timeline"] = { REMOVED_4_0_3 },
	}),
	i(78345, {	-- Pattern: Green Dragonscale Leggings (New Version) (RECIPE!)
		["timeline"] = { ADDED_4_3_0 },
	}),
	i(10627),	-- Bludgeon of the Grinning Dog
	i(10628),	-- Deathblow
	i(10626),	-- Ragehammer
	i(10625),	-- Stealthblade
	i(10624),	-- Stinging Bow
	i(10623),	-- Winter's Bite
	i(10630),	-- Soulcatcher Halo
	i(10632),	-- Slimescale Bracers
	i(10631),	-- Murkwater Gauntlets
	i(10633),	-- Silvershell Leggings
	i(10629),	-- Mistwalker Boots
	i(10634),	-- Mindseye Circle
});

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(237, {	-- The Temple of Atal'hakkar
		-- #if BEFORE MOP
		["lore"] = "Over a thousand years ago, the powerful Gurubashi Empire was torn apart by a massive civil war. An influential group of troll priests, known as the Atal'ai, attempted to bring back an ancient blood god named Hakkar the Soulflayer. Though the priests were defeated and ultimately exiled, the great troll empire buckled in upon itself. The exiled priests fled far to the north, into the Swamp of Sorrows. There they erected a great temple to Hakkar - where they could prepare for his arrival into the physical world. The great dragon Aspect, Ysera, learned of the Atal'ai's plans and smashed the temple beneath the marshes. To this day, the temple's drowned ruins are guarded by the green dragons who prevent anyone from getting in or out. However, it is believed that some of the fanatical Atal'ai may have survived Ysera's wrath - and recommitted themselves to the dark service of Hakkar.",
		-- #endif
		-- #if BEFORE WRATH
		["zone-text-areas"] = {
			1417,	-- Sunken Temple
			1477,	-- The Temple of Atal'hakkar
		},
		-- #endif
		["mapID"] = MAP.TEMPLE_OF_ATALHAKKAR,
		["coords"] = {
			-- #if AFTER CATA
			{ 76.0, 45.2, MAP.SWAMP_OF_SORROWS },
			-- #else
			{ 69.2, 54.8, MAP.SWAMP_OF_SORROWS },
			-- #endif
		},
		-- #if SEASON_OF_DISCOVERY
		["sharedLockout"] = 1,
		["isRaid"] = true,
		-- #endif
		["lvl"] = 45,
		["groups"] = {
			-- #if SEASON_OF_DISCOVERY
			-- In Season of Discovery, this version of the instance has been deprecated and removed in favor of the raid.
			d(DIFFICULTY.DUNGEON.NORMAL, bubbleDownTimelineEventSelf(REMOVED_1_15_1, {
			-- #endif
			n(QUESTS, {
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(9053, {	-- A Better Ingredient
					["sourceQuest"] = 9051,	-- Toxic Test
					["qg"] = 9619,	-- Torwa Pathfinder
					["coord"] = { 71.6, 76.0, MAP.UNGORO_CRATER },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { DRUID },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Putrid Vine
							["provider"] = { "i", 22444 },	-- Putrid Vine
						}),
						i(53560, {	-- Moonshadow Staff
							["timeline"] = { CREATED_4_0_3 },
						}),
						i(22458, {	-- Moonshadow Stave
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(53561, {	-- Thicket's Embrace
							["timeline"] = { CREATED_4_0_3 },
						}),
						i(22272, {	-- Forest's Embrace
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(53562, {	-- Grizzled Hide
							["timeline"] = { CREATED_4_0_3 },
						}),
						i(22274, {	-- Grizzled Pelt
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(10593, {	-- An Ancient Evil
					["sourceQuest"] = 10592,	-- Wisdom of the Banshee Queen
					["qg"] = 10181,	-- Lady Sylvanas Windrunner <Banshee Queen>
					["coord"] = { 57.8, 92.0, MAP.UNDERCITY },
					["timeline"] = { ADDED_2_0_3, REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = HORDE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Putrid Vine
							["provider"] = { "i", 22444 },	-- Putrid Vine
						}),
						i(30696, {	-- Scourgebane
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8257, {	-- Blood of Morphaz
					["sourceQuest"] = 8256,	-- The Ichor of Undeath
					["qg"] = 8405,	-- Ogtinc
					["coord"] = { 42.2, 42.6, MAP.AZSHARA },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PRIEST },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Blood of Morphaz
							["provider"] = { "i", 20025 },	-- Blood of Morphaz
							["cr"] = 5719,	-- Morphaz
						}),
						i(19990, {	-- Blessed Prayer Beads
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20006, {	-- Circle of Hope
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20082, {	-- Woestave
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8413, {	-- Da Voodoo
					["sourceQuest"] = 8412,	-- Spirit Totem
					["qg"] = 6176,	-- Bath'rah the Windwatcher
					["coord"] = { 80.4, 66.8, MAP.ALTERAC_MOUNTAINS },
					["timeline"] = { REMOVED_4_0_3 },
					-- #if BEFORE TBC
					["races"] = HORDE_ONLY,
					-- #endif
					["classes"] = { SHAMAN },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/2 Amber Voodoo Feather
							["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
						}),
						objective(2, {	-- 0/2 Blue Voodoo Feather
							["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
						}),
						objective(3, {	-- 0/2 Green Voodoo Feather
							["provider"] = { "i", 20608 },	-- Green Voodoo Feather
						}),
						i(20369, {	-- Azurite Fists
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20503, {	-- Enamored Water Spirit
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20556, {	-- Wildstaff
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8253, {	-- Destroy Morphaz
					["sourceQuest"] = 8252,	-- The Siren's Coral
					["qg"] = 8379,	-- Archmage Xylem
					["coord"] = { 29.6, 40.6, MAP.AZSHARA },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { MAGE },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Arcane Shard
							["provider"] = { "i", 20085 },	-- Arcane Shard
							["cr"] = 5719,	-- Morphaz
						}),
						i(20035, {	-- Glacial Spike
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20036, {	-- Fire Ruby
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20037, {	-- Arcane Crystal Pendant
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(27605, {	-- Eranikus
					["sourceQuest"] = 27915,	-- The Heart of the Temple
					["qg"] = 46077,	-- Lord Itharius
					["timeline"] = { ADDED_4_0_3 },
					["lvl"] = lvlsquish(50, 50, 20),
					["groups"] = {
						objective(1, {	-- 0/1 Shade of Eranikus slain
							["provider"] = { "n", 5709 },	-- Shade of Eranikus
						}),
						i(65931, {	-- Essence of Eranikus' Shade
							["timeline"] = { ADDED_4_0_3 },
						}),
					},
				}),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8418, {	-- Forging the Mightstone
					["sourceQuest"] = 8416,	-- Inert Scourgestones
					["qg"] = 10838,	-- Commander Ashlam Valorfist
					["coord"] = { 42.8, 84.0, MAP.WESTERN_PLAGUELANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { PALADIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/2 Amber Voodoo Feather
							["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
						}),
						objective(2, {	-- 0/2 Blue Voodoo Feather
							["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
						}),
						objective(3, {	-- 0/2 Green Voodoo Feather
							["provider"] = { "i", 20608 },	-- Green Voodoo Feather
						}),
						i(20504, {	-- Lightforged Blade
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20505, {	-- Chivalrous Signet
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20512, {	-- Sanctified Orb
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20620, {	-- Holy Mightstone
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(4143, {	-- Haze of Evil
					["sourceQuest"] = 4142,	-- A Visit to Gregan
					["qg"] = 7775,	-- Gregan Brewspewer
					["coord"] = { 45.1, 25.6, MAP.FERALAS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.UNGORO_CRATER },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 47,
					["groups"] = {
						objective(1, {	-- 0/5 Atal'ai Haze
							["provider"] = { "i", 11318 },	-- Atal'ai Haze
						}),
					},
				}),
				q(3512, {	-- In Eranikus' Own Words
					["description"] = createLocalizationString({
						readable = "This quest chain seems to be an incomplete one as there is no follow-up. Still an interesting quest chain as most people do not know about it. It essentially details how Eranikus is not actually dead and likely prepares the player for the Opening of AQ quest chain that does involve Eranikus once again.",
						constant = "THIS_QUEST_CHAIN_SEEMS_TO_BE_AN_INCOMPLETE_ONE",
						export = true,
						text = {
							en = "This quest chain seems to be an incomplete one as there is no follow-up. Still an interesting quest chain as most people do not know about it. It essentially details how Eranikus is not actually dead and likely prepares the player for the Opening of AQ quest chain that does involve Eranikus once again.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "这个任务链似乎并不完整，因为没有后续任务。不过它仍然是一个有趣的任务链，因为大多数人都不知道它的存在。它实际上讲述了伊兰尼库斯并未真正死去，很可能是在为涉及伊兰尼库斯再次登场的安其拉开门任务链做铺垫。",
							-- TODO: tw = "",
						},
					}),
					["sourceQuest"] = 3374,	-- The Essence of Eranikus [Part 2]
					["qg"] = 5353,	-- Itharius
					["coord"] = { 13.7, 71.7, MAP.SWAMP_OF_SORROWS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.WINTERSPRING },
					["lvl"] = 48,
					-- #if BEFORE 4.0.3
					["OnUpdate"] = ESSENCE_OF_ERANIKUS_OWN_WORDS_OnUpdate,
					-- #endif
				}),
				q(3446, {	-- Into the Depths
					["sourceQuest"] = 3444,	-- The Stone Circle
					["providers"] = {
						{ "n",  7771 },	-- Marvon Rivetseeker
						{ "i",  10466 },	-- Atal'ai Stone Circle
						{ "o", 148836 },	-- Altar of Hakkar
					},
					["coord"] = { 52.6, 45.8, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 46,
				}),
				q(1475, {	-- Into The Temple of Atal'Hakkar
					["sourceQuest"] = 1469,	-- Rhapsody's Tale
					["qg"] = 5384,	-- Brohann Caskbelly <Explorers' League>
					["coord"] = { 64.2, 20.8, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 38,
					["groups"] = {
						objective(1, {	-- 0/10 Atal'ai Tablet
							["providers"] = {
								{ "i", 6288 },	-- Atal'ai Tablet
								{ "o", 37099 },	-- Atal'ai Tablet
							},
							["description"] = createLocalizationString({
								readable = "Scattered around the inside and outside of the instance.",
								constant = "SCATTERED_AROUND_THE_INSIDE_AND_OUTSIDE_OF_THE",
								export = true,
								text = {
									en = "Scattered around the inside and outside of the instance.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "散布在副本内外。",
									-- TODO: tw = "",
								},
							}),
						}),
						i(1490, {	-- Guardian Talisman
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(1446, {	-- Jammal'an the Prophet
					["qg"] = 5598,	-- Atal'ai Exile
					["coord"] = { 33.6, 75.2, MAP.THE_HINTERLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 38,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Jammal'an
							["provider"] = { "i", 6212 },	-- Head of Jammal'an
						}),
						i(11124, {	-- Helm of Exile
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(11123, {	-- Rainstrider Leggings
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(27604, {	-- Jammal'an the Prophet
					["qg"] = 46077,	-- Lord Itharius
					["timeline"] = { ADDED_4_0_3 },
					["lvl"] = lvlsquish(50, 50, 20),
					["groups"] = {
						objective(1, {	-- 0/1 Head of Jammal'an
							["provider"] = { "i", 6212 },	-- Head of Jammal'an
						}),
					},
				}),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8236, {	-- The Azure Key
					["sourceQuest"] = 8235,	-- Encoded Fragments
					["qg"] = 8379,	-- Archmage Xylem
					["coord"] = { 29.6, 40.6, MAP.AZSHARA },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.HILLSBRAD_FOOTHILLS },
					["classes"] = { ROGUE },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Azure Key
							["provider"] = { "i", 20022 },	-- Azure Key
							["cr"] = 5719,	-- Morphaz
						}),
						i(19982, {	-- Duskbat Drape
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(19984, {	-- Ebon Mask
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20255, {	-- Whisperwalk Boots
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(27633, {	-- The Blood God Hakkar
					["qg"] = 46077,	-- Lord Itharius
					["timeline"] = { ADDED_4_0_3 },
					["lvl"] = lvlsquish(50, 50, 20),
					["groups"] = {
						objective(1, {	-- 0/1 Avatar of Hakkar slain
							["providers"] = {
								{ "n", 8443 },	-- Avatar of Hakkar
								{ "n", 8440 },	-- Shade of Hakkar
							},
							["cost"] = { { "i", 10465, 1 } },	-- Egg of Hakkar
						}),
					},
				}),
				q(3373, {	-- The Essence of Eranikus
					["description"] = createLocalizationString({
						readable = "Interact with the Essence Font located in the back corner of the room after you defeat Eranikus to turn in this quest and loot the Essence of Eranikus.",
						constant = "INTERACT_WITH_THE_ESSENCE_FONT_LOCATED_IN_THE",
						export = true,
						text = {
							en = "Interact with the Essence Font located in the back corner of the room after you defeat Eranikus to turn in this quest and loot the Essence of Eranikus.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "击败伊兰尼库斯后，与房间后方角落的精华之泉互动，以交还此任务并拾取伊兰尼库斯的精华。",
							-- TODO: tw = "",
						},
					}),
					["providers"] = {
						{ "i",  10454 },	-- Essence of Eranikus
						{ "o", 148512 },	-- Essence Font
					},
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 48,
					["groups"] = {
						i(10455, {	-- Chained Essence of Eranikus
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(3374, {	-- The Essence of Eranikus [Part 2]
					["description"] = createLocalizationString({
						readable = "You get the Oathstone by talking to Itharius, at the cave in the SW part of Swamp of Sorrows. You must have the Chained Essence first.",
						constant = "YOU_GET_THE_OATHSTONE_BY_TALKING_TO_ITHARIUS_AT",
						export = true,
						text = {
							en = "You get the Oathstone by talking to Itharius, at the cave in the SW part of Swamp of Sorrows. You must have the Chained Essence first.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "你可以通过在悲伤沼泽西南部洞穴处与伊萨里奥斯交谈来获得誓约之石。你必须先拥有束缚精华。",
							-- TODO: tw = "",
						},
					}),
					["sourceQuest"] = 3373,	-- The Essence of Eranikus
					["qg"] = 5353,	-- Itharius
					["provider"] = { "i", 10589 },	-- Oathstone of Ysera's Dragonflight
					["coord"] = { 13.7, 71.7, MAP.SWAMP_OF_SORROWS },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 10455, 1 } },	-- Chained Essence of Eranikus
					["lvl"] = 48,
					-- #if BEFORE 4.0.3
					["OnUpdate"] = ESSENCE_OF_ERANIKUS_PART_TWO_OnUpdate,
					-- #endif
				}),
				q(3528, {	-- The God Hakkar
					["sourceQuest"] = 4787,	-- The Ancient Egg
					["qg"] = 8579,	-- Yeh'kinya
					["coord"] = { 66.8, 22.4, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 40,
					["groups"] = {
						objective(1, {	-- 0/1 Filled Egg of Hakkar
							["provider"] = { "i", 10662 },	-- Filled Egg of Hakkar
							["cr"] = 8443,	-- Avatar of Hakkar
							["cost"] = {
								{ "i", 10465, 1 },	-- Egg of Hakkar
								{ "i", 10663, 1 },	-- Essence of Hakkar
							},
						}),
						i(10749, {	-- Avenguard Helm
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(10750, {	-- Lifeforce Dirk
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(10751, {	-- Gemburst Circlet
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8232, {	-- The Green Drake
					["sourceQuest"] = 8231,	-- Wavethrashing
					["qg"] = 8405,	-- Ogtinc
					["coord"] = { 42.2, 42.6, MAP.AZSHARA },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { HUNTER },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Tooth of Morphaz
							["provider"] = { "i", 20019 },	-- Tooth of Morphaz
							["cr"] = 5719,	-- Morphaz
						}),
						i(19991, {	-- Devilsaur Eye
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(19992, {	-- Devilsaur Tooth
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20083, {	-- Hunting Spear
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(1445, {	-- The Temple of Atal'Hakkar
					["sourceQuest"] = 1424,	-- Pool of Tears
					["qg"] = 1443,	-- Fel'zerul
					["coord"] = { 64.2, 20.8, MAP.SWAMP_OF_SORROWS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 38,
					["groups"] = {
						objective(1, {	-- 0/20 Fetish of Hakkar
							["provider"] = { "i", 6181 },	-- Fetish of Hakkar
						}),
						i(1490, {	-- Guardian Talisman
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8422, {	-- Trolls of a Feather
					["sourceQuest"] = 8421,	-- The Wrong Stuff
					["qg"] = 14470,	-- Impsy <Niby's Minion>
					["coord"] = { 41.6, 45.0, MAP.FELWOOD },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARLOCK },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/2 Amber Voodoo Feather
							["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
						}),
						objective(2, {	-- 0/2 Blue Voodoo Feather
							["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
						}),
						objective(3, {	-- 0/2 Green Voodoo Feather
							["provider"] = { "i", 20608 },	-- Green Voodoo Feather
						}),
						i(20534, {	-- Abyss Shard
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20530, {	-- Robes of Servitude
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20536, {	-- Soul Harvester
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				applyclassicphase(PHASE_FOUR_SUNKEN_TEMPLE_CLASS_QUESTS, q(8425, {	-- Voodoo Feathers
					["sourceQuest"] = 8424,	-- War on the Shadowsworn
					["qg"] = 7572,	-- Fallen Hero of the Horde
					["coord"] = { 34.3, 66.2, MAP.SWAMP_OF_SORROWS },
					["timeline"] = { REMOVED_4_0_3 },
					["classes"] = { WARRIOR },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/2 Amber Voodoo Feather
							["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
						}),
						objective(2, {	-- 0/2 Blue Voodoo Feather
							["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
						}),
						objective(3, {	-- 0/2 Green Voodoo Feather
							["provider"] = { "i", 20608 },	-- Green Voodoo Feather
						}),
						i(20130, {	-- Diamond Flask
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20517, {	-- Razorsteel Shoulders
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(20521, {	-- Fury Visor
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				})),
				q(4146, {	-- Zapper Fuel
					["sourceQuest"] = 4147,	-- Marvon's Workshop
					["providers"] = {
						{ "n", 8496 },	-- Liv Rizzlefix <Workshop Assistant>
						{ "i", 11319 },	-- Unloaded Zapper
					},
					["coord"] = { 62.5, 38.7, MAP.THE_BARRENS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 47,
					["groups"] = {
						objective(1, {	-- 0/5 Atal'ai Haze
							["provider"] = { "i", 11318 },	-- Atal'ai Haze
						}),
					},
				}),
			}),
			-- #if AFTER 10.1.5
			prof(SKINNING, {
				i(20381),	-- Dreamscale
			}),
			-- #endif
			-- #if NOT SEASON_OF_DISCOVERY
			SUNKEN_TEMPLE_ZONE_DROPS,
			n(COMMON_BOSS_DROPS, {
				i(20606, {	-- Amber Voodoo Feather
					["crs"] = {
						5713,	-- Gasher
						5716,	-- Zul'Lor
					},
				}),
				i(20607, {	-- Blue Voodoo Feather
					["crs"] = {
						5715,	-- Hukku
						5717,	-- Mijan
					},
				}),
				i(20608, {	-- Green Voodoo Feather
					["crs"] = {
						5714,	-- Loro
						5712,	-- Zolo
					},
				}),
			}),
			-- #endif
			n(5708, {	-- Spawn of Hakkar
				["timeline"] = { REMOVED_4_0_3 },
				["groups"] = {
					i(10801, {	-- Slitherscale Boots
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10802, {	-- Wingveil Cloak
						["timeline"] = { REMOVED_4_0_3 },
					}),
				},
			}),
			o(148832, {	-- Atal'ai Statue
				["description"] = createLocalizationString({
					readable = "Go to the Pit of Refuse.\n\nClear all of the trash as you travel around the circular platform. You'll notice balconies that dip out and overlook the center of the pit. Essentially, once it's all cleared, each of your party members should spread out and be assigned to a balcony with an Atal'ai Shrine. The shrines must be clicked in a specific order:\n\n    South (Bottom)\n    North (Top)\n    Southwest (Bottom Left)\n    Southeast (Bottom Right)\n    Northwest (Top Left)\n    Northeast (Top Right)\n\nOnce a statue has been clicked in the correct sequence, it'll turn green. If not, the person attempting to activate will gain a curse.",
					constant = "GO_TO_THE_PIT_OF_REFUSE_CLEAR_ALL_OF_THE_TRASH",
					export = true,
					text = {
						en = "Go to the Pit of Refuse.\n\nClear all of the trash as you travel around the circular platform. You'll notice balconies that dip out and overlook the center of the pit. Essentially, once it's all cleared, each of your party members should spread out and be assigned to a balcony with an Atal'ai Shrine. The shrines must be clicked in a specific order:\n\n    South (Bottom)\n    North (Top)\n    Southwest (Bottom Left)\n    Southeast (Bottom Right)\n    Northwest (Top Left)\n    Northeast (Top Right)\n\nOnce a statue has been clicked in the correct sequence, it'll turn green. If not, the person attempting to activate will gain a curse.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "前往废物之坑。\n\n在绕着圆形平台移动时清掉所有小怪。你会注意到有些向外凸出、俯瞰坑中央的阳台。基本上，全部清完后，队伍中的每个成员都应分散开来，各自负责一个带有阿塔莱神龛的阳台。神龛必须按特定顺序点击：\n\n    南（下）\n    北（上）\n    西南（左下）\n    东南（右下）\n    西北（左上）\n    东北（右上）\n\n一旦雕像按正确顺序被点击，它就会变绿。如果没有，尝试激活的人将会获得一个诅咒。",
						-- TODO: tw = "",
					},
				}),
				["timeline"] = { REMOVED_4_0_3 },
				["groups"] = {
					q(3447, {	-- Secret of the Circle
						["sourceQuest"] = 3444,	-- The Stone Circle
						["providers"] = {
							{ "n",   7771 },	-- Marvon Rivetseeker
							{ "o", 148838 },	-- Idol of Hakkar
						},
						["coord"] = { 52.6, 45.8, MAP.TANARIS },
						["timeline"] = { REMOVED_4_0_3 },
						["lvl"] = 46,
						["groups"] = {
							i(10773, {	-- Hakkari Urn
								["timeline"] = { REMOVED_4_0_3 },
								["groups"] = {
									i(10781, {	-- Hakkari Breastplate
										["timeline"] = { REMOVED_4_0_3 },
									}),
									i(10782, {	-- Hakkari Shroud
										["timeline"] = { REMOVED_4_0_3 },
									}),
									i(10780, {	-- Mark of Hakkar
										["timeline"] = { REMOVED_4_0_3 },
									}),
								},
							}),
						},
					}),
					n(8580, {	-- Atal'alarion
						["description"] = createLocalizationString({
							readable = "Summoned by activating the Atal'ai Statues in the proper order.",
							constant = "SUMMONED_BY_ACTIVATING_THE_ATAL_AI_STATUES_IN",
							export = true,
							text = {
								en = "Summoned by activating the Atal'ai Statues in the proper order.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "按正确顺序激活阿塔莱雕像即可召唤。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { REMOVED_4_0_3 },
						["groups"] = {
							i(22444, {	-- Putrid Vine
								["timeline"] = { REMOVED_4_0_3 },
							}),
							i(10799, {	-- Headspike
								["timeline"] = { REMOVED_4_0_3 },
							}),
							i(10800, {	-- Darkwater Bracers
								["timeline"] = { REMOVED_4_0_3 },
							}),
							i(10798, {	-- Atal'alarion Tusk Ring
								["timeline"] = { REMOVED_4_0_3 },
							}),
						},
					}),
				},
			}),
			n(ATALAI_DEFENDERS, {
				["providers"] = {
					{ "n", 5713 },	-- Gasher
					{ "n", 5715 },	-- Hukku
					{ "n", 5714 },	-- Loro
					{ "n", 5717 },	-- Mijan
					{ "n", 5712 },	-- Zolo
					{ "n", 5716 },	-- Zul'Lor
				},
				["timeline"] = { REMOVED_4_0_3 },
				["groups"] = {
					i(10783, {	-- Atal'ai Spaulders
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10787, {	-- Atal'ai Gloves
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10784, {	-- Atal'ai Breastplate
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10788, {	-- Atal'ai Girdle
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10785, {	-- Atal'ai Leggings
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10786, {	-- Atal'ai Boots
						["timeline"] = { REMOVED_4_0_3 },
					}),
				},
			}),
			e(457, {	-- Avatar of Hakkar
				["crs"] = {
					8443,	-- Avatar of Hakkar
					8440,	-- Shade of Hakkar
				},
				-- #if AFTER 4.0.3
				["provider"] = { "o", 208321 },	-- Shrine of the Soulflayer
				-- #endif
				["description"] =
					-- #if AFTER 4.0.3
					"There is now a skull pile that you can click on in order to summon the boss.",
					-- #else
					"Requires the use of the Egg of Hakkar or Yeh'kinya's Scroll to summon.\n\nOnce you start the fight, the room will fill with a variety of creatures. You need to kill the 4 Wind Serpents that appear, and loot the blood off of them, and use it to douse one of the fires in each corner of the room.\n\nEvery time you douse a fire, a dragonkin will walk in and start channeling a spell on Hakkar. Do not let them complete this channel.\n\nThe boss spawns after all 4 flames are doused.",
					-- #endif
				-- #if BEFORE 4.0.3
				["cost"] = {
					{ "i", 10465, 1 },	-- Egg of Hakkar
					{ "i", 10818, 1 },	-- Yeh'kinya's Scroll
				},
				-- #endif
				["groups"] = {
					i(10663),	-- Essence of Hakkar
					i(10844),	-- Spire of Hakkar
					i(10838),	-- Might of Hakkar
					i(10843),	-- Featherskin Cape
					i(12462),	-- Embrace of the Wind Serpent
					i(10845),	-- Warrior's Embrace
					i(10842),	-- Windscale Sarong
					i(10846),	-- Bloodshot Greaves
				},
			}),
			-- #if BEFORE 6.0.2
			n(5711, {	-- Ogom the Wretched
				i(10803),	-- Blade of the Wretched
				i(10805),	-- Eater of the Dead
				i(10804),	-- Fist of the Damned
			}),
			n(5710, {	-- Jammal'an the Prophet
				i(6212),	-- Head of Jammal'an
				-- #if AFTER 6.0.2
				i(12465),	-- Nightfall Drape
				-- #endif
				i(10806),	-- Vestments of the Atal'ai Prophet
				i(10808),	-- Gloves of the Atal'ai Prophet
				i(10807),	-- Kilt of the Atal'ai Prophet
			}),
			-- #else
			e(458, {	-- Jammal'an the Prophet & Ogom the Wretched
				["crs"] = { 5710, 5711 },
				["groups"] = {
					i(6212),	-- Head of Jammal'an
					i(10803),	-- Blade of the Wretched
					i(10805),	-- Eater of the Dead
					i(10804),	-- Fist of the Damned
					-- #if AFTER 6.0.2
					i(12465),	-- Nightfall Drape
					-- #endif
					i(10806),	-- Vestments of the Atal'ai Prophet
					i(10808),	-- Gloves of the Atal'ai Prophet
					i(10807),	-- Kilt of the Atal'ai Prophet
				},
			}),
			-- #endif
			e(459, {	-- Wardens of the Dream
				-- #if BEFORE WRATH
				["description"] = createLocalizationString({
					readable = "These four dragons come in pairs. You can tank them away from each other if you pull the one that's behind the other one and get really lucky.",
					constant = "THESE_FOUR_DRAGONS_COME_IN_PAIRS_YOU_CAN_TANK",
					export = true,
					text = {
						en = "These four dragons come in pairs. You can tank them away from each other if you pull the one that's behind the other one and get really lucky.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这四条龙成对出现。如果你先拉走位于另一条身后的那条，而且运气足够好，就能把它们分离开来。",
						-- TODO: tw = "",
					},
				}),
				-- #endif
				["crs"] = {
					5721,	-- Dreamscythe
					5722,	-- Hazzas
					5719,	-- Morphaz
					5720,	-- Weaver
				},
				["groups"] = {
					i(12463),	-- Drakefang Butcher
					i(12243),	-- Smoldering Claw
					i(10797),	-- Firebreather
					i(10796),	-- Drakestone
					i(12465),	-- Nightfall Drape
					i(12464),	-- Bloodfire Talons
					i(12466),	-- Dawnspire Cord
					i(10795),	-- Drakeclaw Band
				},
			}),
			e(463, {	-- Shade of Erankikus
				["creatureID"] = 5709,
				["groups"] = {
					ach(641),	-- Sunken Temple
					ach(5050, {	-- Sunken Temple Guild Run
						["timeline"] = { ADDED_4_0_3 },
					}),
					i(10454, {	-- Essence of Eranikus
						["timeline"] = { REMOVED_4_0_3 },
					}),
					i(10828),	-- Dire Nail
					i(10847),	-- Dragon's Call
					i(10837),	-- Tooth of Eranikus
					i(10836),	-- Rod of Corrosion
					i(10835),	-- Crest of Supremacy
					i(10833),	-- Horns of Eranikus
					i(10829),	-- Dragon's Eye [Classic] / The Dragon's Eye [WRATH+]
				},
			}),
			-- #if SEASON_OF_DISCOVERY
			})),
			applyclassicphase(SOD_PHASE_THREE, d(DIFFICULTY.SOD.PLAYER20, bubbleDownSelf({ ["timeline"] = { ADDED_1_15_2, REMOVED_2_0_1 }, }, {
				["description"] = createLocalizationString({
					readable = "This instance was converted from a normal difficulty dungeon into a 20-player raid instance.",
					constant = "THIS_INSTANCE_WAS_CONVERTED_FROM_A_NORMAL",
					export = true,
					text = {
						en = "This instance was converted from a normal difficulty dungeon into a 20-player raid instance.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "该副本已从普通难度地下城转换为 20 人团队副本。",
						-- TODO: tw = "",
					},
				}),
				["lvl"] = 50,
				["groups"] = {
					n(QUESTS, {
						q(82112, {	-- A Better Ingredient
							-- ["sourceQuest"] = 9051,	-- Toxic Test
							["qg"] = 9619,	-- Torwa Pathfinder
							["coord"] = { 71.6, 76.0, MAP.UNGORO_CRATER },
							["classes"] = { DRUID },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Putrid Vine
									["provider"] = { "i", 22444 },	-- Putrid Vine
									["cr"] = 218624,	-- Atal'alarion
								}),
								i(22458, {	-- Moonshadow Stave
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(22272, {	-- Forest's Embrace
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(22274, {	-- Grizzled Pelt
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82081, {	-- A Broken Ritual (A)
							["providers"] = {
								{ "i", 221346 },	-- Scapula of the Fallen Avatar (A)
								{ "n",  14875 },	-- Molthor <Hand of Rastakhan>
							},
							["coord"] = { 15.0, 15.2, MAP.STRANGLETHORN_VALE },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								i(220626),	-- Drakeclaw Band of the Berserker
								i(220629),	-- Drakeclaw Band of the Blood Prophet
								i(220628),	-- Drakeclaw Band of the Harbinger
								i(220630),	-- Drakeclaw Band of the Juggernaut
								i(220627),	-- Drakeclaw Band of the Stalker
							},
						}),
						q(82083, {	-- A Broken Ritual (H)
							["providers"] = {
								{ "i", 221363 },	-- Scapula of the Fallen Avatar (H)
								{ "n",  14875 },	-- Molthor <Hand of Rastakhan>
							},
							["coord"] = { 15.0, 15.2, MAP.STRANGLETHORN_VALE },
							["races"] = HORDE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								i(220626),	-- Drakeclaw Band of the Berserker
								i(220629),	-- Drakeclaw Band of the Blood Prophet
								i(220628),	-- Drakeclaw Band of the Harbinger
								i(220630),	-- Drakeclaw Band of the Juggernaut
								i(220627),	-- Drakeclaw Band of the Stalker
							},
						}),
						q(82021, {	-- A Fortuitous Turn of Events
							["sourceQuest"] = 82020,	-- Return to Moonglade
							["qg"] = 222188,	-- Shadowy Figure
							["coord"] = { 52.0, 40.6, MAP.MOONGLADE },
							["lvl"] = 50,
						}),
						q(82017, {	-- An Amalagamation of Nightmares
							["sourceQuest"] = 82015,	-- Emotional Damage HQT
							["qg"] = 221477,	-- Field Captain Hannalah
							["coord"] = { 89.6, 40.6, MAP.ASHENVALE },
							["maps"] = { MAP.MOONGLADE },
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- Seek out Loganaar in Moonglade
									["provider"] = { "n", 12042 },	-- Loganaar <Druid Trainer>
									["coord"] = { 52.4, 40.4, MAP.MOONGLADE },
								}),
							},
						}),
						n(createHeader({	-- Aura of Paralyzing Dread
							readable = "SOD - Nightmare Incursions - Aura of Paralyzing Dread",
							icon = 136147,
							text = {
								en = "Aura of Paralyzing Dread",
								cn = "痹体恐惧氛围",
							},
							description = {
								en = "You need to be debuffed from the Nightmare Amalgam to proc this quest. (do not engage it, just run away)",
								cn = "你需要被梦魇融合体施加负面效果才能触发此任务。（不要与它交战，直接跑开即可）",
							},
						}), {
							["qg"] = 222198,	-- Nightmare Amalgamation
							["questID"] = 82014,	-- Aura of Paralyzing Dread HQT
							["coord"] = { 88.6, 68.2, MAP.ASHENVALE },
							["lvl"] = 40,
						}),
						q(82111, {	-- Blood of Morphaz
							-- ["sourceQuest"] = 8256,	-- The Ichor of Undeath
							["qg"] = 8405,	-- Ogtinc
							["coord"] = { 42.2, 42.6, MAP.AZSHARA },
							["classes"] = { PRIEST },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Blood of Morphaz
									["provider"] = { "i", 20025 },	-- Blood of Morphaz
									["cr"] = 221942,	-- Morphaz
								}),
								i(19990, {	-- Blessed Prayer Beads
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20006, {	-- Circle of Hope
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20082, {	-- Woestave
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82113, {	-- Da Voodoo
							-- ["sourceQuest"] = 8412,	-- Spirit Totem
							["qg"] = 6176,	-- Bath'rah the Windwatcher
							["coord"] = { 80.4, 66.8, MAP.ALTERAC_MOUNTAINS },
							-- #if BEFORE TBC
							["races"] = HORDE_ONLY,
							-- #endif
							["classes"] = { SHAMAN },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/2 Amber Voodoo Feather
									["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
								}),
								objective(2, {	-- 0/2 Blue Voodoo Feather
									["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
								}),
								objective(3, {	-- 0/2 Green Voodoo Feather
									["provider"] = { "i", 20608 },	-- Green Voodoo Feather
								}),
								i(20369, {	-- Azurite Fists
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20503, {	-- Enamored Water Spirit
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20556, {	-- Wildstaff
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82114, {	-- Destroy Morphaz
							-- ["sourceQuest"] = 8252,	-- The Siren's Coral
							["qg"] = 8379,	-- Archmage Xylem
							["coord"] = { 29.6, 40.6, MAP.AZSHARA },
							["classes"] = { MAGE },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Arcane Shard
									["provider"] = { "i", 20085 },	-- Arcane Shard
									["cr"] = 221942,	-- Morphaz
								}),
								i(20035, {	-- Glacial Spike
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20036, {	-- Fire Ruby
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20037, {	-- Arcane Crystal Pendant
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						n(createHeader({	-- Emotional Damage
							readable = "SOD - Nightmare Incursions - Emotional Damage",
							icon = 237552,
							text = {
								en = "Emotional Damage",
								cn = "心理创伤",
							},
						}), {
							["qg"] = 221477,	-- Field Captain Hannalah
							["questID"] = 82015,	-- Emotional Damage HQT
							["sourceQuest"] = 82014,	-- Aura of Paralyzing Dread HQT
							["coord"] = { 89.6, 40.6, MAP.ASHENVALE },
							["lvl"] = 40,
						}),
						q(82106, {	-- Forging the Mightstone
							-- ["sourceQuest"] = 8416,	-- Inert Scourgestones
							["qg"] = 10838,	-- Commander Ashlam Valorfist
							["coord"] = { 42.8, 84.0, MAP.WESTERN_PLAGUELANDS },
							["classes"] = { PALADIN },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/2 Amber Voodoo Feather
									["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
								}),
								objective(2, {	-- 0/2 Blue Voodoo Feather
									["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
								}),
								objective(3, {	-- 0/2 Green Voodoo Feather
									["provider"] = { "i", 20608 },	-- Green Voodoo Feather
								}),
								i(20504, {	-- Lightforged Blade
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20505, {	-- Chivalrous Signet
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20512, {	-- Sanctified Orb
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20620, {	-- Holy Mightstone
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82019, {	-- Going Under
							["sourceQuest"] = 82018,	-- Itharius
							["qg"] = 5353,	-- Itharius
							["coord"] = { 13.6, 71.6, MAP.SWAMP_OF_SORROWS },
							["lvl"] = 40,
						}),
						q(82099, {	-- Haze of Evil
							["sourceQuest"] = 4142,	-- A Visit to Gregan
							["qg"] = 7775,	-- Gregan Brewspewer
							["coord"] = { 45.1, 25.6, MAP.FERALAS },
							["maps"] = { MAP.UNGORO_CRATER },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/5 Atal'ai Haze
									["provider"] = { "i", 11318 },	-- Atal'ai Haze
								}),
							},
						}),
						q(82096, {	-- Into the Depths
							["providers"] = {
								{ "n",  7771 },	-- Marvon Rivetseeker
								{ "i",  10466 },	-- Atal'ai Stone Circle
								{ "o", 148836 },	-- Altar of Hakkar
							},
							["coord"] = { 52.6, 45.8, MAP.TANARIS },
							["lvl"] = 50,
						}),
						q(82098, {	-- Into The Temple of Atal'Hakkar
							["qg"] = 5384,	-- Brohann Caskbelly <Explorers' League>
							["coord"] = { 64.2, 20.8, MAP.STORMWIND_CITY },
							["races"] = ALLIANCE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/10 Atal'ai Tablet
									["providers"] = {
										{ "i", 6288 },	-- Atal'ai Tablet
										{ "o", 37099 },	-- Atal'ai Tablet
									},
									["description"] = "~L.SCATTERED_AROUND_THE_INSIDE_AND_OUTSIDE_OF_THE",
								}),
								i(1490, {	-- Guardian Talisman
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82018, {	-- Itharius
							["sourceQuest"] = 82017,	-- An Amalagamation of Nightmares
							["qg"] = 12042,	-- Loganaar <Druid Trainer>
							["coord"] = { 52.4, 40.4, MAP.MOONGLADE },
							["maps"] = { MAP.SWAMP_OF_SORROWS },
							["lvl"] = 40,
							["groups"] = {
								objective(1, {	-- Seek out Itharius in the Swamp of Sorrows
									["provider"] = { "n", 5353 },	-- Itharius
									["coord"] = { 13.6, 71.6, MAP.SWAMP_OF_SORROWS },
								}),
							},
						}),
						q(82104, {	-- Jammal'an the Prophet
							["qg"] = 5598,	-- Atal'ai Exile
							["coord"] = { 33.6, 75.2, MAP.THE_HINTERLANDS },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Head of Jammal'an
									["provider"] = { "i", 6212 },	-- Head of Jammal'an
								}),
								i(221782),	-- Helm of Exile
								i(223324),	-- Rainstrider Leggings
							},
						}),
						q(82020, {	-- Return to Moonglade
							["sourceQuest"] = 82019,	-- Going Under
							["qg"] = 5353,	-- Itharius
							["coord"] = { 13.6, 71.6, MAP.SWAMP_OF_SORROWS },
							["maps"] = { MAP.MOONGLADE },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- Seek out Loganaar in Moonglade
									["provider"] = { "n", 12042 },	-- Loganaar <Druid Trainer>
									["coord"] = { 52.4, 40.4, MAP.MOONGLADE },
								}),
							},
						}),
						q(82097, {	-- Secret of the Circle
							["providers"] = {
								{ "n",   7771 },	-- Marvon Rivetseeker
								{ "o", 148838 },	-- Idol of Hakkar
							},
							["coord"] = { 52.6, 45.8, MAP.TANARIS },
							["lvl"] = 50,
							["groups"] = {
								i(10773, {	-- Hakkari Urn
									i(223325),	-- Hakkari Breastplate
									i(223326),	-- Hakkari Shroud
									i(223327),	-- Mark of Hakkar
								}),
							},
						}),
						q(82110, {	-- The Azure Key
							-- ["sourceQuest"] = 8235,	-- Encoded Fragments
							["qg"] = 8379,	-- Archmage Xylem
							["coord"] = { 29.6, 40.6, MAP.AZSHARA },
							["maps"] = { MAP.HILLSBRAD_FOOTHILLS },
							["classes"] = { ROGUE },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Azure Key
									["provider"] = { "i", 20022 },	-- Azure Key
									["cr"] = 221942,	-- Morphaz
								}),
								i(19982, {	-- Duskbat Drape
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(19984, {	-- Ebon Mask
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20255, {	-- Whisperwalk Boots
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82022, {	-- The Bad News...
							["sourceQuest"] = 82021,	-- A Fortuitous Turn of Events
							["qg"] = 222188,	-- Shadowy Figure
							["coord"] = { 52.0, 40.6, MAP.MOONGLADE },
							["maps"] = { MAP.STRANGLETHORN_VALE },
							["lvl"] = 50,
							["groups"] = {
								q(82023, {	-- The Lost Vambraces
									["qg"] = 222444,	-- Injured Gnome <Knight of Some Renown>
									["coord"] = { 26.8, 77.2, MAP.STRANGLETHORN_VALE },
									["repeatable"] = true,
									["groups"] = {
										objective(1, {	-- 0/1 Decharged Void-Powered Vambraces
											["questID"] = 82022,	-- The Bad News...
											["providers"] = {
												{ "i", 220964 },	-- Decharged Void-Powered Vambraces
												{ "o", 441848 },	-- Small Burrow
											},
											["coord"] = { 40.8, 85.6, MAP.STRANGLETHORN_VALE },
											["cr"] = 222451,	-- Itty Bitty Murloc
										}),
									},
								}),
								i(220689),	-- Void-Powered Vambraces
							},
						}),
						q(82095, {	-- The God Hakkar
							["sourceQuest"] = 4787,	-- The Ancient Egg
							["qg"] = 8579,	-- Yeh'kinya
							["coord"] = { 66.8, 22.4, MAP.TANARIS },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Filled Egg of Hakkar
									["provider"] = { "i", 10662 },	-- Filled Egg of Hakkar
									["cr"] = 8443,	-- Avatar of Hakkar
									["cost"] = {
										{ "i", 10465, 1 },	-- Egg of Hakkar
										{ "i", 10663, 1 },	-- Essence of Hakkar
									},
								}),
								i(221781),	-- Avenguard Helm
								i(223329),	-- Lifeforce Dirk
								i(223328),	-- Gemburst Circlet
							},
						}),
						q(82108, {	-- The Green Drake
							-- ["sourceQuest"] = 8231,	-- Wavethrashing
							["qg"] = 8405,	-- Ogtinc
							["coord"] = { 42.2, 42.6, MAP.AZSHARA },
							["classes"] = { HUNTER },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Tooth of Morphaz
									["provider"] = { "i", 20019 },	-- Tooth of Morphaz
									["cr"] = 221942,	-- Morphaz
								}),
								i(19991, {	-- Devilsaur Eye
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(19992, {	-- Devilsaur Tooth
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20083, {	-- Hunting Spear
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82102, {	-- The Essence of Eranikus
							["description"] = "~L.INTERACT_WITH_THE_ESSENCE_FONT_LOCATED_IN_THE",
							["providers"] = {
								{ "i", 221475 },	-- Essence of Eranikus
								{ "o", 148512 },	-- Essence Font
							},
							["lvl"] = 50,
							["groups"] = {
								i(221474),	-- Chained Essence of Eranikus
							},
						}),
						q(82100, {	-- The Temple of Atal'Hakkar
							["qg"] = 1443,	-- Fel'zerul
							["coord"] = { 64.2, 20.8, MAP.SWAMP_OF_SORROWS },
							["races"] = HORDE_ONLY,
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/20 Fetish of Hakkar
									["provider"] = { "i", 6181 },	-- Fetish of Hakkar
								}),
								i(1490, {	-- Guardian Talisman
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82115, {	-- Trolls of a Feather
							-- ["sourceQuest"] = 8421,	-- The Wrong Stuff
							["qg"] = 14470,	-- Impsy <Niby's Minion>
							["coord"] = { 41.6, 45.0, MAP.FELWOOD },
							["classes"] = { WARLOCK },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/2 Amber Voodoo Feather
									["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
								}),
								objective(2, {	-- 0/2 Blue Voodoo Feather
									["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
								}),
								objective(3, {	-- 0/2 Green Voodoo Feather
									["provider"] = { "i", 20608 },	-- Green Voodoo Feather
								}),
								i(20534, {	-- Abyss Shard
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20530, {	-- Robes of Servitude
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20536, {	-- Soul Harvester
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(82107, {	-- Voodoo Feathers
							-- ["sourceQuest"] = 8424,	-- War on the Shadowsworn
							["qg"] = 7572,	-- Fallen Hero of the Horde
							["coord"] = { 34.3, 66.2, MAP.SWAMP_OF_SORROWS },
							["classes"] = { WARRIOR },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/2 Amber Voodoo Feather
									["provider"] = { "i", 20606 },	-- Amber Voodoo Feather
								}),
								objective(2, {	-- 0/2 Blue Voodoo Feather
									["provider"] = { "i", 20607 },	-- Blue Voodoo Feather
								}),
								objective(3, {	-- 0/2 Green Voodoo Feather
									["provider"] = { "i", 20608 },	-- Green Voodoo Feather
								}),
								i(20130, {	-- Diamond Flask
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20517, {	-- Razorsteel Shoulders
									["timeline"] = { REMOVED_4_0_3 },
								}),
								i(20521, {	-- Fury Visor
									["timeline"] = { REMOVED_4_0_3 },
								}),
							},
						}),
						q(81986, {	-- Waking the Nightmare
							["sourceQuest"] = 82022,	-- The Bad News...
							["qg"] = 222188,	-- Shadowy Figure
							["coord"] = { 52.0, 40.6, MAP.MOONGLADE },
							["maps"] = { MAP.ASHENVALE },
							["lvl"] = 50,
							["groups"] = {
								objective(1, {	-- 0/1 Nightmare Amalgamation slain
									["provider"] = { "n", 222198 },	-- Nightmare Amalgamation
									["coord"] = { 88.6, 68.2, MAP.ASHENVALE },
								}),
								objective(2, {	-- 0/1 Mantle of Nightmares
									["provider"] = { "i", 220570 },	-- Mantle of Nightmares
								}),
								i(220688),	-- Inert Mantle of Nightmares
							},
						}),
					}),
					SUNKEN_TEMPLE_ZONE_DROPS,
					n(COMMON_BOSS_DROPS, {
						i(20606, {	-- Amber Voodoo Feather
							["crs"] = {
								221637,	-- Gasher
								221640,	-- Zul'Lor
							},
						}),
						i(20607, {	-- Blue Voodoo Feather
							["crs"] = {
								218922,	-- Hukku
								218868,	-- Mijan
							},
						}),
						i(20608, {	-- Green Voodoo Feather
							["crs"] = {
								221638,	-- Loro
								221639,	-- Zolo
							},
						}),
						i(220636, {	-- Atal'ai Blood Icon
							["crs"] = {
								218624,	-- Atal'alarion <Guardian of the Idol>
								218819,	-- Festering Rotslime
								221637,	-- Gasher
								220833,	-- Dreamscythe
								218721,	-- Jammal'an the Prophet
								221943,	-- Hazzas
								218571,	-- Shade of Eranikus
								221394,	-- Avatar of Hakkar
							},
						}),
						i(220637, {	-- Atal'ai Ritual Token
							["crs"] = {
								218624,	-- Atal'alarion <Guardian of the Idol>
								218819,	-- Festering Rotslime
								221637,	-- Gasher
								220833,	-- Dreamscythe
								218721,	-- Jammal'an the Prophet
								221943,	-- Hazzas
								218571,	-- Shade of Eranikus
								221394,	-- Avatar of Hakkar
							},
						}),
						i(221312, {	-- Flask of Atal'ai Mojo
							["crs"] = {
								218624,	-- Atal'alarion <Guardian of the Idol>
								218819,	-- Festering Rotslime
								218721,	-- Jammal'an the Prophet
								218718,	-- Ogom the Wretched
								221394,	-- Avatar of Hakkar
								224260,	-- Atal'ai Corpse Eater
								224259,	-- Atal'ai Deathwalker
								224258,	-- Atal'ai High Priest
								5269,	-- Atal'ai Priest
								224250,	-- Atal'ai Warrior
								224263,	-- Atal'ai Witch Doctor
								5243,	-- Cursed Atal'ai
								5261,	-- Enthralled Atal'ai
								221924,	-- Kazkaz the Unholy
								5263,	-- Mummified Atal'ai
								224262,	-- Unliving Atal'ai
							},
						}),
						i(221021, {	-- Nightmare Seed
							["crs"] = {
								218819,	-- Festering Rotslime
								221637,	-- Gasher
								220833,	-- Dreamscythe
								221943,	-- Hazzas
								218571,	-- Shade of Eranikus
								221394,	-- Avatar of Hakkar
								224255,	-- Nightmare Scalebane
								224253,	-- Nightmare Wanderer
								224256,	-- Nightmare Whelp
								224254,	-- Nightmare Wyrmkin
							},
						}),
					}),
					n(222290, {	-- Unfortunate Adventurer
						["description"] = createLocalizationString({
							readable = "RIP Guzu <Demon>.\n\nGo watch 'The Fall of Guzu' by Hurricane on YouTube for context!",
							constant = "RIP_GUZU_DEMON_GO_WATCH_THE_FALL_OF_GUZU_BY",
							export = true,
							text = {
								en = "RIP Guzu <Demon>.\n\nGo watch 'The Fall of Guzu' by Hurricane on YouTube for context!",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "安息吧 Guzu <Demon>。\n\n想了解背景的话，去 YouTube 看 Hurricane 制作的《The Fall of Guzu》吧！",
								-- TODO: tw = "",
							},
						}),
					}),
					n(218624, {	-- Atal'alarion <Guardian of the Idol>
						["description"] = createLocalizationString({
							readable = "Atal'alarion has three main abilities.\n\nThe primary danger on this boss is the Pillars of Might stacking 5% damage buff. To remove this, use his Demolishing Smash to get knocked back into the pillars from Pillars of Might. The player bodies will then destroy the pillars and reduce the stacking damage buff. Spreading out around the boss helps to minimize the total movement required to destroy every pillar.",
							constant = "ATAL_ALARION_HAS_THREE_MAIN_ABILITIES_THE",
							export = true,
							text = {
								en = "Atal'alarion has three main abilities.\n\nThe primary danger on this boss is the Pillars of Might stacking 5% damage buff. To remove this, use his Demolishing Smash to get knocked back into the pillars from Pillars of Might. The player bodies will then destroy the pillars and reduce the stacking damage buff. Spreading out around the boss helps to minimize the total movement required to destroy every pillar.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "阿塔拉利恩有三个主要技能。\n\n这个首领身上的主要危险来自力量之柱可叠加的 5% 伤害增益。要移除它，可以利用他的毁灭猛击被击退到力量之柱上。玩家的身体随后会摧毁这些柱子并降低可叠加的伤害增益。分散站在首领周围有助于减少摧毁每根柱子所需的总移动距离。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(220567),	-- Bloodied Headspike
							i(220580),	-- Madness of the Avatar
							i(220568),	-- Temple Explorer's Gun Axe
							i(220602),	-- Sewer Turtle Half-Shell
							i(220511),	-- Greathelm of the Nightmare
							i(220615),	-- Panther Fur Cloak
							i(220527),	-- Atal'ai Berserker's Mantle
							i(220529),	-- Spaulders of Fanaticism
							i(220537),	-- Dreamer's Darkwater Bracers
							i(220539),	-- Warbands of Sacrifice
							i(220554),	-- Atal'alarion's Tusk Band
							i(220561),	-- Tenacious Troll Kickers
							i(220635),	-- Atal'alarion's Enchanted Boulder
						},
					}),
					n(218819, {	-- Festering Rotslime
						["description"] = createLocalizationString({
							readable = "Kite the boss through the corridor.\n\nPlayers should focus on continuously moving between Gunk casts to avoid the poison pools. Gunk must be cleansed ASAP.\n\nThe boss will gain speed from Slime Time throughout the fight, to stop this: kill the Atal'ai Slab, Atal'ai Mask, Atal'ai Candle, and Atal'ai Drum objects which are located along the corridor. Ideally, have the melee focus on this to avoid getting Devoured themselves.",
							constant = "KITE_THE_BOSS_THROUGH_THE_CORRIDOR_PLAYERS",
							export = true,
							text = {
								en = "Kite the boss through the corridor.\n\nPlayers should focus on continuously moving between Gunk casts to avoid the poison pools. Gunk must be cleansed ASAP.\n\nThe boss will gain speed from Slime Time throughout the fight, to stop this: kill the Atal'ai Slab, Atal'ai Mask, Atal'ai Candle, and Atal'ai Drum objects which are located along the corridor. Ideally, have the melee focus on this to avoid getting Devoured themselves.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "把首领风筝到走廊里。\n\n玩家应专注于在“粘液”施放间隙持续移动，以避开毒池。“粘液”必须尽快驱散。\n\n整场战斗中，首领的移动速度会因“粘液时间”不断提升，要阻止这一点：摧毁沿走廊放置的阿塔莱石板、阿塔莱面具、阿塔莱蜡烛和阿塔莱鼓。最好让近战负责这些，以免他们自己被吞噬。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(220569),	-- Blistering Ragehammer
							i(220571),	-- Stinging Longbow
							i(220518),	-- Ba'ham's Dusty Hat
							i(220538),	-- Cursed Slimescale Bracers
							i(220540),	-- Corruption Laden Handguards
							i(220541),	-- Disease-Ridden Plate Fists
							i(220545),	-- Foul Smelling Fighter's Gloves
							i(220546),	-- Hands of the Tormented
							i(220542),	-- Polluted Murkwater Gauntlets
							i(220550),	-- Temple Looter's Waistband
							i(220552),	-- Waistguard of Pain
							i(220565),	-- Ethereal Mistwalker Boots
							i(221484),	-- Witch Doctor's Hex Stick
							i(221281),	-- Ace of Plagues
						},
					}),
					n(ATALAI_DEFENDERS, {
						["description"] = createLocalizationString({
							readable = "The Atal'ai Defenders are the third boss encounter in The Temple of Atal'Hakkar.\n\nGasher & Mijan's abilities are the most threatening.\n\nOnce killed, each boss will respawn as an undead. Do not attack them, instead use Shackle Undead and Freezing Trap to CC them.",
							constant = "THE_ATAL_AI_DEFENDERS_ARE_THE_THIRD_BOSS",
							export = true,
							text = {
								en = "The Atal'ai Defenders are the third boss encounter in The Temple of Atal'Hakkar.\n\nGasher & Mijan's abilities are the most threatening.\n\nOnce killed, each boss will respawn as an undead. Do not attack them, instead use Shackle Undead and Freezing Trap to CC them.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "阿塔莱防御者是阿塔哈卡神庙的第三个首领战。\n\n加舍尔和米扬的技能威胁最大。\n\n每个首领被击杀后都会以亡灵形态复活。不要攻击它们，而是使用束缚亡灵和冰冻陷阱来控制它们。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							n(221637, {	-- Gasher
								["description"] = createLocalizationString({
									readable = "|cffff0000Fervor|r can cause him to deal a lot of damage, focus him down fast; if needed, the tank can run away from Gasher while still in range of casters to minimize the damage taken if Gasher gets high stacks.\n\nSpinning Axes - Spawns spinning axes around him, this deals minor cleave damage.",
									constant = "CFFFF0000FERVOR_R_CAN_CAUSE_HIM_TO_DEAL_A_LOT",
									export = true,
									text = {
										en = "|cffff0000Fervor|r can cause him to deal a lot of damage, focus him down fast; if needed, the tank can run away from Gasher while still in range of casters to minimize the damage taken if Gasher gets high stacks.\n\nSpinning Axes - Spawns spinning axes around him, this deals minor cleave damage.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cffff0000狂热|r 会使他造成大量伤害，要尽快集火击杀；如有必要，当加舍尔叠高层数时，坦克可以拉开与加舍尔的距离，同时保持在施法者的射程内，以尽量减少受到的伤害。\n\n旋转斧 - 在他周围生成旋转的斧头，造成轻微的顺劈伤害。",
										-- TODO: tw = "",
									},
								}),
								["groups"] = {
									i(220674),	-- Debased Stealthblade
									i(220591),	-- Mijan's Restorative Rod
									i(220572),	-- Rinzo's Rapid Repeater
									i(220516),	-- Gasher's Forgotten Visor
									i(220522),	-- Soulcatcher Crown
									i(220611),	-- Hukku's Hex Cape
									i(220528),	-- Atal'ai Huntsman's Shoulders
									i(220532),	-- Reinforced Atal'ai Spaulders
									i(220533),	-- Reforged Atal'ai Breastplate
									i(220548),	-- Atal'ai Hexxer's Gloves
									i(220555),	-- Atal'ai Serpentscale Girdle
									i(220558),	-- Atal'ai Assassin's Leggings
									i(220560),	-- Silvershell Legplates
									i(220638),	-- Unorthodox Hex Stick
								},
							}),
							n(218922, {	-- Hukku
								["description"] = createLocalizationString({
									readable = "Curse of Blood - Dispellable curse which increases a player's damage taken. This can be interrupted.",
									constant = "CURSE_OF_BLOOD_DISPELLABLE_CURSE_WHICH",
									export = true,
									text = {
										en = "Curse of Blood - Dispellable curse which increases a player's damage taken. This can be interrupted.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "鲜血诅咒 - 可驱散的诅咒，会提高玩家受到的伤害。此技能可以被打断。",
										-- TODO: tw = "",
									},
								}),
							}),
							n(221638, {	-- Loro
								["description"] = createLocalizationString({
									readable = "Demoralizing Shout - Interruptable AoE debuff which reduces player's attack power by 40.",
									constant = "DEMORALIZING_SHOUT_INTERRUPTABLE_AOE_DEBUFF",
									export = true,
									text = {
										en = "Demoralizing Shout - Interruptable AoE debuff which reduces player's attack power by 40.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "挫志怒吼 - 可打断的范围减益，会使玩家的攻击强度降低 40。",
										-- TODO: tw = "",
									},
								}),
							}),
							n(218868, {	-- Mijan
								["description"] = createLocalizationString({
									readable = "|cffff0000Mijan's Atal'ai Serpent Totems|r should be interrupted and killed asap in order to minimize damage taken. These can deal a fair bit of damage if they happen to focus the same player.\n\nRenew - Interruptable self heal ability, make sure to have someone focused on kicking this to increase kill time.\n\nThorns - Dispellable self thorns buff, should be removed to minimize melee players' damage taken.",
									constant = "CFFFF0000MIJAN_S_ATAL_AI_SERPENT_TOTEMS_R",
									export = true,
									text = {
										en = "|cffff0000Mijan's Atal'ai Serpent Totems|r should be interrupted and killed asap in order to minimize damage taken. These can deal a fair bit of damage if they happen to focus the same player.\n\nRenew - Interruptable self heal ability, make sure to have someone focused on kicking this to increase kill time.\n\nThorns - Dispellable self thorns buff, should be removed to minimize melee players' damage taken.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "|cffff0000米詹的阿塔莱蛇图腾|r 应尽快打断并击杀，以尽量减少受到的伤害。如果它们恰好集中攻击同一名玩家，会造成相当可观的伤害。\n\n恢复 - 可打断的自我治疗技能，务必安排人专门负责打断，以加快击杀速度。\n\n荆棘 - 可驱散的自身荆棘增益，应将其驱散，以尽量减少近战玩家受到的伤害。",
										-- TODO: tw = "",
									},
								}),
							}),
							n(221639, {	-- Zolo
								["description"] = createLocalizationString({
									readable = "Chain lightning increases damage which each subsequent hit, this can be interrupted.",
									constant = "CHAIN_LIGHTNING_INCREASES_DAMAGE_WHICH_EACH",
									export = true,
									text = {
										en = "Chain lightning increases damage which each subsequent hit, this can be interrupted.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "闪电链每次后续命中的伤害都会提高，这可以被打断。",
										-- TODO: tw = "",
									},
								}),
							}),
							n(221640, {	-- Zul'Lor
								["description"] = createLocalizationString({
									readable = "Frailty - Reduces all attributes of nearby enemies by 10 for 1 min. Can be dispelled.",
									constant = "FRAILTY_REDUCES_ALL_ATTRIBUTES_OF_NEARBY",
									export = true,
									text = {
										en = "Frailty - Reduces all attributes of nearby enemies by 10 for 1 min. Can be dispelled.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "虚弱 - 使附近敌人的所有属性降低 10，持续 1 分钟。可被驱散。",
										-- TODO: tw = "",
									},
								}),
							}),
						},
					}),
					n(220833, {	-- Dreamscythe
						["provider"] = { "n", 220864 },	-- Weaver
						["description"] = createLocalizationString({
							readable = "The bosses cast Acid Breath, so you should two tank this fight. DPS Dreamscythe to 80% and Weaver to 60%. Avoid facing either boss into the raid.\n\nFor positioning, you really want to avoid getting knocked back into both the outside poison pool which surrounds the boss arena, as well as the middle pit which will cause you to die from fall damage by either of the wing buffet abilities. To avoid the pit you should either stand next to it so that you get knocked back parallel to it; or stand right against it to get knocked over to the opposite side of it. Doing either, depending on what's easier for you at that moment, will gain you uptime on casting.\n\nIdeally, have all of the damage dealers focusing a single boss as the bosses share health pools. This way you'll be focusing a fully debuffed target.",
							constant = "THE_BOSSES_CAST_ACID_BREATH_SO_YOU_SHOULD_TWO",
							export = true,
							text = {
								en = "The bosses cast Acid Breath, so you should two tank this fight. DPS Dreamscythe to 80% and Weaver to 60%. Avoid facing either boss into the raid.\n\nFor positioning, you really want to avoid getting knocked back into both the outside poison pool which surrounds the boss arena, as well as the middle pit which will cause you to die from fall damage by either of the wing buffet abilities. To avoid the pit you should either stand next to it so that you get knocked back parallel to it; or stand right against it to get knocked over to the opposite side of it. Doing either, depending on what's easier for you at that moment, will gain you uptime on casting.\n\nIdeally, have all of the damage dealers focusing a single boss as the bosses share health pools. This way you'll be focusing a fully debuffed target.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "首领们会施放酸液喷吐，所以这场战斗应该用两个坦克。把梦境之镰打到 80%，把编织者打到 60%。不要让任何首领面向团队。\n\n在站位方面，你真正要避免的是被击退进两处地方：环绕首领场地的外围毒水池，以及中间的深坑——被两种振翅技能中的任何一种击退进坑里，都会让你因坠落伤害而死亡。要避开深坑，你可以站在它旁边，这样你会被平行击退；或者紧贴着它站，这样你会被击退到它的另一侧。根据当时哪种更容易来二选一，都能为你争取到施法时间。\n\n理想情况下，让所有输出职业集火同一个首领，因为首领们共享生命值。这样你集火的就是一个叠满减益的目标。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(220584),	-- Flamebreath Blade
							i(220587),	-- Sacrificial Dream Dagger
							i(220594),	-- Scythe of the Dream
							i(220566),	-- Smolder Claw
							i(220581),	-- Snake Clobberer
							i(220521),	-- Hakkari Ritualist's Headdress
							i(220519),	-- Voodoo Feathered Headdress
							i(220609),	-- Drape of Nightfall
							i(220536),	-- Atal'ai Medicine Man's Wrists
							i(220544),	-- Bloodflare Talons
							i(220549),	-- Dawnspire Strap
							i(220551),	-- Devotee's Sash of the Emerald Dream
							i(221298),	-- Ace of Nightmares
						},
					}),
					n(218721, {	-- Jammal'an the Prophet
						["provider"] = { "n", 218718 },	-- Ogom the Wretched
						["description"] = createLocalizationString({
							readable = "This fight has two different versions which rotate every week.\n\nOne where Ogom the Wretched dies first, making Jammal'an the Prophet the main boss.\n Mass Penance is a spoopy mechanic.\n\nThe other where Jammal'an the Prophet dies first, making Ogom the Wretched the main boss.\n Avoid Consecration.",
							constant = "THIS_FIGHT_HAS_TWO_DIFFERENT_VERSIONS_WHICH",
							export = true,
							text = {
								en = "This fight has two different versions which rotate every week.\n\nOne where Ogom the Wretched dies first, making Jammal'an the Prophet the main boss.\n Mass Penance is a spoopy mechanic.\n\nThe other where Jammal'an the Prophet dies first, making Ogom the Wretched the main boss.\n Avoid Consecration.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "这场战斗有两种不同的版本，每周轮换。\n\n一种是悲惨的奥戈姆先死，使预言者迦玛兰成为主首领。\n 群体苦修是个很吓人的机制。\n\n另一种是预言者迦玛兰先死，使悲惨的奥戈姆成为主首领。\n 躲避奉献。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(220576),	-- Axe of the Atal'ai Executioner
							i(220575),	-- Eater of the Damned
							i(220578),	-- Fist of the Forsaken
							i(220586),	-- Hubris the Bandit Brander
							i(220583),	-- Vile Blade of the Wretched
							i(220601),	-- Hakkari Witch Doctor's Guard
							i(220515),	-- Enchanted Emerald Helmet
							i(220624),	-- Bloodstained Charm of Valor
							i(220623),	-- Jin'do's Lost Locket
							i(220625),	-- Resilience of the Exiled
							i(220535),	-- Garments of the Atal'ai Prophet
							i(220547),	-- Gloves of the Fallen Atal'ai Prophet
							i(220556),	-- Kilt of the Fallen Atal'ai Prophet
							i(220605),	-- Libram of Sacrilege
						},
					}),
					n(221943, {	-- Hazzas
						["provider"] = { "n", 221942 },	-- Morphaz
						["description"] = createLocalizationString({
							readable = "Keep the boss stationary to avoid the frontal Corrupted Breath and Backfire from the tail. Tanks swap every 2-3 stacks. Big heals for Dreamer's Lament ability!\n\nAt 80%, Hazzas will cast Animate Flame which will summon elementals. Stack & nuke them. They also drop fire on the floor. You can use the fire to avoid being sent downstairs to Morphaz during Lucid Dreaming.\n\nAt 30%, Hazzas will cast Lucid Dreaming again and then begin casting Eternal Slumber. You must bear the damage check and the cast will be canceled.\n\nDodge Falling Rocks.",
							constant = "KEEP_THE_BOSS_STATIONARY_TO_AVOID_THE_FRONTAL",
							export = true,
							text = {
								en = "Keep the boss stationary to avoid the frontal Corrupted Breath and Backfire from the tail. Tanks swap every 2-3 stacks. Big heals for Dreamer's Lament ability!\n\nAt 80%, Hazzas will cast Animate Flame which will summon elementals. Stack & nuke them. They also drop fire on the floor. You can use the fire to avoid being sent downstairs to Morphaz during Lucid Dreaming.\n\nAt 30%, Hazzas will cast Lucid Dreaming again and then begin casting Eternal Slumber. You must bear the damage check and the cast will be canceled.\n\nDodge Falling Rocks.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "保持首领静止不动，以避免正面的腐蚀吐息和来自尾部的反冲。坦克每叠加 2-3 层就换坦。应对“梦者的悲叹”技能时要有大量治疗！\n\n在 80% 时，哈扎斯会施放活化烈焰，召唤元素生物。把它们聚起来集火击杀。它们还会在地面留下火焰。你可以利用这些火焰避免在清醒梦境期间被传送到下层去见莫尔法兹。\n\n在 30% 时，哈扎斯会再次施放清醒梦境，随后开始施放永恒沉睡。你们必须承受住这次伤害检测，施法就会被取消。\n\n躲开落石。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(220596),	-- Ancient Divining Rod
							i(220965),	-- Scalebane Greataxe
							i(220589),	-- Serpent's Striker
							i(220599),	-- Drakestone of the Blood Prophet
							i(220597),	-- Drakestone of the Dream Harbinger
							i(220598),	-- Drakestone of the Nightmare Harbinger
							i(220512),	-- Immaculate Goldsteel Helmet
							i(220514),	-- Visor of Verdant Feathers
							i(220543),	-- Emerald Scalemail Gloves
							i(220553),	-- Belt of the Forsaken Worshipper
							i(220559),	-- Revitalized Drake Scale Leggings
							i(220563),	-- Boots of the Atal'ai Blood Shaman
							i(220606),	-- Idol of the Dream
							i(220607),	-- Totem of Tormented Ancestry
							i(221298),	-- Ace of Nightmares
						},
					}),
					n(218571, {	-- Shade of Eranikus
						["description"] = createLocalizationString({
							readable = "The boss casts Corrosive Breath and has a tail sweep. Tanks should swap after each breath.\n\nDispell Lethargic Poison. Interupt Bellowing Roar!\n\nWhen the boss casts Deep Slumber, you'll want everyone to stack close to the boss so that when the boss casts Waking Nightmare, everyone can jump into the pool and to get afflicted and then move out asap to avoid getting CC'd again.\n\nAt 70%, the boss will summon two Lumbering Dreamwalkers. Kill them and interupt their Deep Slumber casts. Kill any whelplings that spawn.\n\nAt 40%, he'll repeat this and then summon two Nightmare Scalebanes. These cast Acid Rain that can be interupted, so the raid should spread out to avoid this.",
							constant = "THE_BOSS_CASTS_CORROSIVE_BREATH_AND_HAS_A_TAIL",
							export = true,
							text = {
								en = "The boss casts Corrosive Breath and has a tail sweep. Tanks should swap after each breath.\n\nDispell Lethargic Poison. Interupt Bellowing Roar!\n\nWhen the boss casts Deep Slumber, you'll want everyone to stack close to the boss so that when the boss casts Waking Nightmare, everyone can jump into the pool and to get afflicted and then move out asap to avoid getting CC'd again.\n\nAt 70%, the boss will summon two Lumbering Dreamwalkers. Kill them and interupt their Deep Slumber casts. Kill any whelplings that spawn.\n\nAt 40%, he'll repeat this and then summon two Nightmare Scalebanes. These cast Acid Rain that can be interupted, so the raid should spread out to avoid this.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "首领会对玩家施放腐蚀喷吐，并有一个扫尾技能。坦克应在每次喷吐后换嘲。\n\n驱散昏睡毒液。打断震耳咆哮！\n\n当首领施放深度沉睡时，所有人都应紧贴首领集合，这样当首领施放唤醒梦魇时，大家可以跳进水池中被感染，然后尽快离开，以免再次被控制。\n\n在 70% 时，首领将召唤两个笨重的梦行者。击杀它们并打断它们的深度沉睡施法。击杀所有刷新的雏龙。\n\n在 40% 时，它会重复这一过程，然后召唤两个梦魇鳞卫。它们会施放可以被打断的酸雨，因此团队应分散站位以躲避。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(221475),	-- Essence of Eranikus
							i(220585),	-- Degraded Dire Nail
							i(220582),	-- Dragon's Cry
							i(220573),	-- Dreadstalker's Hunting Bow
							i(220595),	-- Nightmare Focus Staff
							i(220574),	-- Sharpened Tooth of Eranikus
							i(220579),	-- Witch Doctor's Stick of Mojo
							i(220600),	-- Crest of Preeminence
							i(220604),	-- Nightmare Trophy
							i(220603),	-- Rod of Irreversible Corrosion
							i(220523),	-- Visage of the Exiled
							i(220622),	-- Perfectly Preserved Dragon's Eye
							i(220564),	-- Restored Slitherscale Boots
							i(221298),	-- Ace of Nightmares
						},
					}),
					n(221394, {	-- Avatar of Hakkar
						["description"] = createLocalizationString({
							readable = "Have all the ranged stacked and then kill the four Atal'ai Ritualists.\n\nOnce Hakkari Bloodkeeper casts Bubbling Blood, move out of it. He'll ocasionally cast Spirit Chains, move out of the group before getting dispelled. (it will spread otherwise) Frightsome Howl should be dispelled immediately.\n\nAfter 33 seconds the Bloodkeeper will resurrect Hakkar and pass on some of the damage dealt to him during that time.\n\nDecurse Curse of Tongues, and dispel the Insanity mind control that'll happen once in a while.\n\nThe boss will occasionally cast Corrupted Blood, afflicted players should move out of the raid as fast as they can, and move to the front of the boss (away from the tank) to then get hit by Drain Blood. This will dispel the debuff. Move back afterwards and then kill the boss.",
							constant = "HAVE_ALL_THE_RANGED_STACKED_AND_THEN_KILL_THE",
							export = true,
							text = {
								en = "Have all the ranged stacked and then kill the four Atal'ai Ritualists.\n\nOnce Hakkari Bloodkeeper casts Bubbling Blood, move out of it. He'll ocasionally cast Spirit Chains, move out of the group before getting dispelled. (it will spread otherwise) Frightsome Howl should be dispelled immediately.\n\nAfter 33 seconds the Bloodkeeper will resurrect Hakkar and pass on some of the damage dealt to him during that time.\n\nDecurse Curse of Tongues, and dispel the Insanity mind control that'll happen once in a while.\n\nThe boss will occasionally cast Corrupted Blood, afflicted players should move out of the raid as fast as they can, and move to the front of the boss (away from the tank) to then get hit by Drain Blood. This will dispel the debuff. Move back afterwards and then kill the boss.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "让所有远程职业集中站好，然后击杀四名阿塔莱仪祭者。\n\n当哈卡莱护血者施放沸腾之血时，离开该区域。他偶尔会施放灵魂锁链，在被驱散前离开人群。（否则它会扩散）骇人嚎叫应立即被驱散。\n\n33 秒后，护血者会复活哈卡，并转移在此期间对他造成的一部分伤害。\n\n解除语言诅咒，并驱散偶尔会出现的疯狂精神控制。\n\n首领偶尔会施放腐化之血，受影响的玩家应尽快离开团队，并移动到首领前方（远离坦克），以便被吸取鲜血击中。这会驱散该减益。之后再回到原位，然后击杀首领。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(221346),	-- Scapula of the Fallen Avatar (A)
							i(221363),	-- Scapula of the Fallen Avatar (H)
							i(220620),	-- Wind Serpent Skull (PET!)
							i(220686),	-- Chieftain's Bane
							i(220588),	-- Cobra Fang Claw
							i(220577),	-- Might of the Blood Loa
							i(220590),	-- Spire of Hakkari Worship
							i(220608),	-- Featherskin Drape
							i(220534),	-- Eternal Embrace of the Wind Serpent
							i(220530),	-- Will of the Atal'ai Warrior
							i(220557),	-- Cursed Windscale Sarong
							i(220562),	-- Bloodshot Battle Greaves
							i(220633),	-- Atal'ai Blood Ritual Badge
							i(220634),	-- Atal'ai Blood Ritual Charm
							i(220632),	-- Atal'ai Blood Ritual Medallion
						},
					}),
				},
			}))),
			-- #endif
		},
	}),
}));
