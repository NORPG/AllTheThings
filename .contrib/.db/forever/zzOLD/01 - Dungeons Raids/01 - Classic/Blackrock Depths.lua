-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

DETENTION_BLOCK = createHeader({
	readable = "Detention Block",
	icon = 236718,
	text = {
		en = [[~DUNGEON_FLOOR_BLACKROCKDEPTHS1]],
	},
});
SHADOWFORGE_CITY = createHeader({
	readable = "Shadowforge City",
	icon = 236718,
	text = {
		en = [[~DUNGEON_FLOOR_BLACKROCKDEPTHS2]],
	},
});

local REPUTATION_FROM_CORES, REPUTATION_FROM_LEATHER, REPUTATION_FROM_DARKIRON = 500, 350, 75;	-- These are the reputation values after TBC, other than for Classic.

-- #if BEFORE TBC
-- Reputation in Classic
REPUTATION_FROM_CORES = 200;
REPUTATION_FROM_LEATHER = 150;
REPUTATION_FROM_DARKIRON = 50;
-- #else
-- #if ANYCLASSIC
-- #if AFTER CATA
-- Reputation in Cata Classic
-- CRIEVE NOTE: Not sure if it is intended, but the reputation gained from these skyrocketed in Cataclysm Classic. It might be unintentional.
REPUTATION_FROM_CORES = 2200;
REPUTATION_FROM_LEATHER = 1540;
REPUTATION_FROM_DARKIRON = 300;
-- #endif
-- #endif
-- #endif

ExportDB.OnTooltipDB.ThoriumBrotherhood = [[~function(t, tooltipInfo)
	local reputation = t.reputation;
	if reputation < 42000 then
		local addRepInfo = _.Modules.FactionData.AddReputationTooltipInfo;
		addRepInfo(tooltipInfo, reputation, "Turn In Blood & Cores (1x each)",]] .. REPUTATION_FROM_CORES .. [[, 42000);
		addRepInfo(tooltipInfo, reputation, "Turn In Core Leather (2x each)",]] .. REPUTATION_FROM_LEATHER .. [[, 42000);
		addRepInfo(tooltipInfo, reputation, "Turn In Dark Iron Ore (10x each)",]] .. REPUTATION_FROM_DARKIRON .. [[, 42000);
	end
end]];

root(ROOTS.Instances, expansion(EXPANSION.CLASSIC, {
	inst(228, {	-- Blackrock Depths
		-- #if BEFORE MOP
		["lore"] = "Once the capital city of the Dark Iron dwarves, this volcanic labyrinth now serves as the seat of power for Ragnaros the Firelord. Ragnaros has uncovered the secret to creating life from stone and plans to build an army of unstoppable golems to aid him in conquering the whole of Blackrock Mountain. Obsessed with defeating Nefarian and his draconic minions, Ragnaros will go to any extreme to achieve final victory.",
		["zone-text-areaID"] = 1584,	-- Blackrock Depths
		-- #endif
		["description"] = createLocalizationString({
			readable = "The best route for a full clear is to enter Shadowforge City first time through the Dark Iron Highway. The Detention Block can be cleared whenever.",
			constant = "THE_BEST_ROUTE_FOR_A_FULL_CLEAR_IS_TO_ENTER",
			export = true,
			text = {
				en = "The best route for a full clear is to enter Shadowforge City first time through the Dark Iron Highway. The Detention Block can be cleared whenever.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "全清的最佳路线是第一次就经黑铁公路进入暗炉城。拘留区则随时都可以清理。",
				-- TODO: tw = "",
			},
		}),
		["mapID"] = MAP.BLACKROCK_DEPTHS,
		["coord"] = { 39.06, 18.12, MAP.BLACKROCK_MOUNTAIN_LEVEL3 },
		["lvl"] = 42,
		["groups"] = {
			n(FACTIONS, {
				faction(FACTION_THORIUM_BROTHERHOOD, {	-- Thorium Brotherhood
					["maps"] = { MAP.SEARING_GORGE },
					["OnTooltip"] = [[_.OnTooltipDB.ThoriumBrotherhood]],
				}),
			}),
			n(QUESTS, {
				q(7604, {	-- A Binding Contract
					["provider"] = { "i", 18628 },	-- Thorium Brotherhood Contract
					-- #if SEASON_OF_DISCOVERY
					["timeline"] = { REMOVED_1_15_3 },
					-- #endif
					["lvl"] = lvlsquish(60, 60, 20),
					["groups"] = {
						i(18592, {	-- Plans: Sulfuron Hammer (RECIPE!)
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(256673, {	-- Stormwind Forge (DECOR!)
							["timeline"] = { ADDED_11_2_7 },
						}),
					},
				}),
				q(4264, {	-- A Crumpled Up Note
					-- #if BEFORE 3.0.2
					["description"] = createLocalizationString({
						readable = "After completing the Abandoned Hope quest, kill trash until this item drops for you. If your group has not yet killed the Dark Keeper, they have a fairly high chance to drop this item as well.",
						constant = "AFTER_COMPLETING_THE_ABANDONED_HOPE_QUEST_KILL",
						export = true,
						text = {
							en = "After completing the Abandoned Hope quest, kill trash until this item drops for you. If your group has not yet killed the Dark Keeper, they have a fairly high chance to drop this item as well.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "完成任务“被遗弃的希望”后，击杀小怪直到此物品掉落。如果你的队伍还没有击杀黑暗守护者，它们也有相当高的几率掉落此物品。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["sourceQuest"] = 4242,	-- Abandoned Hope
					["provider"] = { "i", 11446 },	-- A Crumpled Up Note
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4282, {	-- A Shred of Hope
					["sourceQuest"] = 4264,	-- A Crumpled Up Note
					["qg"] = 9023,	-- Marshal Windsor
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Marshal Windsor's Lost Information
							["provider"] = { "i", 11464 },	-- Marshal Windsor's Lost Information
						}),
						objective(2, {	-- 0/1 Marshal Windsor's Lost Information
							["provider"] = { "i", 11465 },	-- Marshal Windsor's Lost Information
						}),
					},
				}),
				q(4022, {	-- A Taste of Flame (1/2) (A)
					-- #if BEFORE 4.0.3
					["description"] = createLocalizationString({
						readable = "If you completed the quest 'Trinkets...' in Searing Gorge, you can complete this quest immediately without having to fight the elite dragon by bringing the Black Dragonflight Molt with you.",
						constant = "IF_YOU_COMPLETED_THE_QUEST_TRINKETS_IN_SEARING",
						export = true,
						text = {
							en = "If you completed the quest 'Trinkets...' in Searing Gorge, you can complete this quest immediately without having to fight the elite dragon by bringing the Black Dragonflight Molt with you.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "如果你已完成灼热峡谷的任务“小饰品……”，只要随身携带黑龙军团蜕皮，就可以立即完成此任务，无需与精英龙战斗。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["sourceQuest"] = 3481,	-- Trinkets...
					["altQuests"] = { 4023 },	-- A Taste of Flame
					["qg"] = 9459,	-- Cyrus Therepentous
					["coord"] = { 95.09, 31.56, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["cost"] = { { "i", 10575, 1 } },	-- Black Dragonflight Molt
					["lvl"] = 52,
				}),
				q(4023, {	-- A Taste of Flame (1/2) (B)
					["altQuests"] = { 4022 },	-- A Taste of Flame (1/2) (A)
					["qg"] = 9459,	-- Cyrus Therepentous
					["coord"] = { 95.09, 31.56, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 52,
					["groups"] = {
						objective(1, {	-- 0/1 Black Dragonflight Molt
							["provider"] = { "i", 10575 },	-- Black Dragonflight Molt
							["coord"] = { 93.2, 32.6, MAP.BURNING_STEPPES },
							["cr"] = 9461,	-- Frenzied Black Drake <Cyrus's Minion>
						}),
					},
				}),
				q(4024, {	-- A Taste of Flame (2/2)
					["sourceQuests"] = {
						4022,	-- A Taste of Flame (1/2) (A)
						4023,	-- A Taste of Flame (1/2) (B)
					},
					["qg"] = 9459,	-- Cyrus Therepentous
					["coord"] = { 95.09, 31.56, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["groups"] = {
						objective(1, {	-- 0/1 Encased Fiery Essence
							["provider"] = { "i", 11230 },	-- Encased Fiery Essence
							["cost"] = { { "i", 11231, 1 } },	-- Altered Black Dragonflight Molt
							["cr"] = 9016,	-- Bael'Gar
						}),
						i(12066, {	-- Shaleskin Cape
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12082, {	-- Wyrmhide Spaulders
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12083, {	-- Valconian Sash
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4242, {	-- Abandoned Hope
					["sourceQuest"] = 4241,	-- Marshal Windsor
					["qg"] = 9023,	-- Marshal Windsor
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["groups"] = {
						i(12018, {	-- Conservator Helm
							["timeline"] = { REMOVED_3_0_2 },
						}),
						i(12021, {	-- Shieldplate Sabatons
							["timeline"] = { REMOVED_3_0_2 },
						}),
						i(12041, {	-- Windshear Leggings
							["timeline"] = { REMOVED_3_0_2 },
						}),
					},
				}),
				q(3981, {	-- Commander Gor'shak
					["sourceQuest"] = 3906,	-- Disharmony of Flame
					["qg"] = 9081,	-- Galamav the Marksman <Kargath Expeditionary Force>
					["coord"] = { 5.8, 47.6, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
				}),
				q(3801, {	-- Dark Iron Legacy (1/2)
					-- #if BEFORE 4.0.3
					["description"] = createLocalizationString({
						readable = "You must be a ghost in order to interact with this quest giver. He's in the middle of Blackrock Mountain on the floating island on top of his tomb.",
						constant = "YOU_MUST_BE_A_GHOST_IN_ORDER_TO_INTERACT_WITH",
						export = true,
						text = {
							en = "You must be a ghost in order to interact with this quest giver. He's in the middle of Blackrock Mountain on the floating island on top of his tomb.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "你必须处于幽灵状态才能与这个任务给予者互动。他在黑石山中央、他那座陵墓顶部的浮空岛上。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["qg"] = 8888,	-- Franclorn Forgewright
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BLACKROCK_MOUNTAIN },
					["lvl"] = 48,
				}),
				q(3802, {	-- Dark Iron Legacy (2/2)
					["sourceQuest"] = 3801,	-- Dark Iron Legacy (1/2)
					["providers"] = {
						{ "n",   8888 },	-- Franclorn Forgewright
						{ "o", 164689 },	-- Monument of Franclorn Forgewright
					},
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BLACKROCK_MOUNTAIN },
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Ironfel
							["provider"] = { "i", 10999 },	-- Ironfel
							["cr"] = 9056,	-- Fineous Darkvire <Chief Architect>
						}),
						i(11000, {	-- Shadowforge Key
							["timeline"] = { DELETED_4_0_3 },
						}),
					},
				}),
				q(3906, {	-- Disharmony of Flame
					["qg"] = 9084,	-- Thunderheart <Kargath Expeditionary Force>
					["coord"] = { 3.3, 48.3, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BLACKROCK_MOUNTAIN },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Overmaster Pyron slain
							["provider"] = { "n", 9026 },	-- Overmaster Pyron
						}),
					},
				}),
				q(3907, {	-- Disharmony of Fire
					["sourceQuest"] = 3906,	-- Disharmony of Flame
					["qg"] = 9084,	-- Thunderheart <Kargath Expeditionary Force>
					["coord"] = { 3.3, 48.3, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Lord Incendius slain
							["provider"] = { "n", 9017 },	-- Lord Incendius
						}),
						objective(2, {	-- 0/1 Tablet of Kurniya
							["provider"] = { "i", 11126 },	-- Tablet of Kurniya
						}),
						i(12112, {	-- Crypt Demon Bracers
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12114, {	-- Nightfall Gloves
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12115, {	-- Stalwart Clutch
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12113, {	-- Sunborne Cape
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4182, {	-- Dragonkin Menace
					-- #if BEFORE 3.0.2
					["description"] = createLocalizationString({
						readable = "You should finish this full quest chain up to Marshal Windsor before joining a Blackrock Depths group.",
						constant = "YOU_SHOULD_FINISH_THIS_FULL_QUEST_CHAIN_UP_TO",
						export = true,
						text = {
							en = "You should finish this full quest chain up to Marshal Windsor before joining a Blackrock Depths group.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在加入黑石深渊队伍之前，你应该先完成这条完整的任务链直到温德索尔元帅。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["qg"] = 9562,	-- Helendis Riverhorn
					["coord"] = { 85.8, 69.0, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/15 Black Broodling slain
							["provider"] = { "n", 7047 },	-- Black Broodling
						}),
						objective(2, {	-- 0/10 Black Dragonspawn slain
							["provider"] = { "n", 7040 },	-- Black Dragonspawn
						}),
						objective(3, {	-- 0/1 Black Drake slain
							["provider"] = { "n", 7044 },	-- Black Drake
						}),
						objective(4, {	-- 0/4 Black Wyrmkin slain
							["provider"] = { "n", 7041 },	-- Black Wyrmkin
						}),
					},
				}),
				q(6646, {	-- Favor Amongst the Brotherhood, Blood of the Mountain
					["qg"] = 12944,	-- Lokhtos Darkbargainer
					["maxReputation"] = { FACTION_THORIUM_BROTHERHOOD, EXALTED },	-- The Thorium Brotherhood, Exalted.
					["cost"] = { { "i", 11382, 1 } },	-- Blood of the Mountain
					["repeatable"] = true,
					["lvl"] = 60,
				}),
				q(6645, {	-- Favor Amongst the Brotherhood, Core Leather
					["qg"] = 12944,	-- Lokhtos Darkbargainer
					["maxReputation"] = { FACTION_THORIUM_BROTHERHOOD, EXALTED },	-- The Thorium Brotherhood, Exalted.
					["cost"] = { { "i", 17012, 2 } },	-- Core Leather
					["repeatable"] = true,
					["lvl"] = 60,
				}),
				q(6642, {	-- Favor Amongst the Brotherhood, Dark Iron Ore
					["qg"] = 12944,	-- Lokhtos Darkbargainer
					["maxReputation"] = { FACTION_THORIUM_BROTHERHOOD, EXALTED },	-- The Thorium Brotherhood, Exalted.
					["cost"] = { { "i", 11370, 10 } },	-- Dark Iron Ore
					["repeatable"] = true,
					["lvl"] = 60,
				}),
				q(6643, {	-- Favor Amongst the Brotherhood, Fiery Core
					["qg"] = 12944,	-- Lokhtos Darkbargainer
					["maxReputation"] = { FACTION_THORIUM_BROTHERHOOD, EXALTED },	-- The Thorium Brotherhood, Exalted.
					["cost"] = { { "i", 17010, 1 } },	-- Fiery Core
					["repeatable"] = true,
					["lvl"] = 60,
				}),
				q(6644, {	-- Favor Amongst the Brotherhood, Lava Core
					["qg"] = 12944,	-- Lokhtos Darkbargainer
					["maxReputation"] = { FACTION_THORIUM_BROTHERHOOD, EXALTED },	-- The Thorium Brotherhood, Exalted.
					["cost"] = { { "i", 17011, 1 } },	-- Lava Core
					["repeatable"] = true,
					["lvl"] = 60,
				}),
				q(4122, {	-- Grark Lorkrub
					["sourceQuests"] = 4082,	-- KILL ON SIGHT: High Ranking Dark Iron Officials
					["providers"] = {
						{ "n", 9080 },	-- Lexlort <Kargath Expeditionary Force>
						{ "i", 11286 },	-- Thorium Shackles
					},
					["coord"] = { 5.9, 47.6, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
				}),
				q(4126, {	-- Hurley Blackbreath
					["sourceQuest"] = 4128,	-- Ragnar Thunderbrew
					["qg"] = 1267,	-- Ragnar Thunderbrew
					["coord"] = { 46.8, 52.4, MAP.DUN_MOROGH },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Lost Thunderbrew Recipe
							["provider"] = { "i", 11312 },	-- Lost Thunderbrew Recipe
						}),
						i(12000, {	-- Limb Cleaver
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(11964, {	-- Swiftstrike Cudgel
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12003),	-- Dark Dwarven Lager
					},
				}),
				q(4263, {	-- Incendius!
					["sourceQuest"] = 4262,	-- Overmaster Pyron
					["qg"] = 9561,	-- Jalinda Sprig
					["coord"] = { 85.4, 70.1, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Lord Incendius slain
							["provider"] = { "n", 9017 },	-- Lord Incendius
						}),
						i(12112, {	-- Crypt Demon Bracers
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12114, {	-- Nightfall Gloves
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12115, {	-- Stalwart Clutch
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12113, {	-- Sunborne Cape
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4322, {	-- Jail Break!
					["sourceQuest"] = 4282,	-- A Shred of Hope
					["qg"] = 9023,	-- Marshal Windsor
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						i(12061, {	-- Blade of Reckoning
							["timeline"] = { REMOVED_3_0_2 },
						}),
						i(12062, {	-- Skilled Fighting Blade
							["timeline"] = { REMOVED_3_0_2 },
						}),
						i(12065, {	-- Ward of the Elements
							["timeline"] = { REMOVED_3_0_2 },
						}),
					},
				}),
				q(4341, {	-- Kharan Mighthammer
					["sourceQuest"] = 3701,	-- The Smoldering Ruins of Thaurissan (2/2)
					["qg"] = 2784,	-- King Magni Bronzebeard <Lord of Ironforge>
					["coord"] = { 39.09, 56.19, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4342, {	-- Kharan's Tale
					["sourceQuest"] = 4341,	-- Kharan Mighthammer
					["qg"] = 9021,	-- Kharan Mighthammer
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4081, {	-- KILL ON SIGHT: Dark Iron Dwarves
					["provider"] = { "o", 164867 },	-- WANTED
					["coord"] = { 3.9, 47.4, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/10 Anvilrage Guardsman slain
							["provider"] = { "n", 8891 },	-- Anvilrage Guardsman
						}),
						objective(2, {	-- 0/10 Anvilrage Warden slain
							["provider"] = { "n", 8890 },	-- Anvilrage Warden
						}),
						objective(3, {	-- 0/10 Anvilrage Footman slain
							["provider"] = { "n", 8892 },	-- Anvilrage Footman
						}),
					},
				}),
				q(4082, {	-- KILL ON SIGHT: High Ranking Dark Iron Officials
					["sourceQuest"] = 4081,	-- KILL ON SIGHT: Dark Iron Dwarves
					["provider"] = { "o", 164868 },	-- KILL ON SIGHT
					["coord"] = { 3.9, 47.4, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/10 Anvilrage Medic slain
							["provider"] = { "n", 8894 },	-- Anvilrage Medic
						}),
						objective(2, {	-- 0/10 Anvilrage Soldier slain
							["provider"] = { "n", 8893 },	-- Anvilrage Soldier
						}),
						objective(3, {	-- 0/10 Anvilrage Officer slain
							["provider"] = { "n", 8895 },	-- Anvilrage Officer
						}),
					},
				}),
				q(4134, {	-- Lost Thunderbrew Recipe
					["sourceQuest"] = 4133,	-- Vivian Lagrave
					["qg"] = 9078,	-- Shadowmage Vivian Lagrave <Kargath Expeditionary Force>
					["coord"] = { 2.9, 47.8, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Lost Thunderbrew Recipe
							["provider"] = { "i", 11312 },	-- Lost Thunderbrew Recipe
						}),
						i(12000, {	-- Limb Cleaver
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(11964, {	-- Swiftstrike Cudgel
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4241, {	-- Marshal Windsor
					["sourceQuest"] = 4224,	-- The True Masters (6/6)
					["qg"] = 9560,	-- Marshal Maxwell
					["coord"] = { 84.74, 69.02, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
				}),
				q(4132, {	-- Operation: Death to Angerforge
					["sourceQuest"] = 4121,	-- Precarious Predicament
					["qg"] = 9077,	-- Warlord Goretooth <Kargath Expeditionary Force>
					["coord"] = { 5.8, 47.5, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
					["groups"] = {
						objective(1, {	-- 0/1 General Angerforge slain
							["provider"] = { "n", 9033 },	-- General Angerforge
						}),
						i(12059, {	-- Conqueror's Medallion
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4262, {	-- Overmaster Pyron
					["qg"] = 9561,	-- Jalinda Sprig
					["coord"] = { 85.4, 70.1, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BLACKROCK_MOUNTAIN },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Overmaster Pyron slain
							["provider"] = { "n", 9026 },	-- Overmaster Pyron
						}),
					},
				}),
				q(4121, {	-- Precarious Predicament
					["sourceQuest"] = 4122,	-- Grark Lorkrub
					["qg"] = 9520,	-- Grark Lorkrub
					["coord"] = { 40.2, 34.2, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
					["groups"] = {
						objective(1, {	-- 0/1 Thorium Shackles
							["provider"] = { "i", 11286 },	-- Thorium Shackles
						}),
						objective(2, {	-- Prisoner Transport
							["provider"] = { "i", 11286 },	-- Thorium Shackles
						}),
					},
				}),
				q(4128, {	-- Ragnar Thunderbrew
					["qg"] = 9540,	-- Enohar Thunderbrew
					["coord"] = { 63.6, 20.6, MAP.BLASTED_LANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.DUN_MOROGH },
					["races"] = ALLIANCE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 50,
				}),
				q(4136, {	-- Ribbly Screwspigot
					["sourceQuest"] = 4324,	-- Yuka Screwspigot
					["qg"] = 9544,	-- Yuka Screwspigot
					["coord"] = { 66.1, 21.9, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Ribbly's Head
							["provider"] = { "i", 11313 },	-- Ribbly's Head
						}),
						i(11963, {	-- Penance Spaulders
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12049, {	-- Splintsteel Armor
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(11865, {	-- Rancor Boots
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4295, {	-- Rocknot's Ale
					["qg"] = 9503,	-- Private Rocknot
					["cost"] = { { "i", 11325, 2 } },	-- Dark Iron Ale Mug
					["repeatable"] = true,
				}),
				q(6402, {	-- Stormwind Rendezvous
					["sourceQuest"] = 4322,	-- Jail Break!
					["qg"] = 9560,	-- Marshal Maxwell
					["coord"] = { 84.7, 69.0, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4361, {	-- The Bearer of Bad News
					["sourceQuest"] = 4342,	-- Kharan's Tale
					["qg"] = 9021,	-- Kharan Mighthammer
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(6501, {	-- The Dragon's Eye
					-- #if BEFORE 3.0.2
					["description"] = createLocalizationString({
						readable = "Go to Haleh in Winterspring. Use the blue rune on the ground inside the cave to reach her. Don't bother going to Dustwallow Marsh.",
						constant = "GO_TO_HALEH_IN_WINTERSPRING_USE_THE_BLUE_RUNE",
						export = true,
						text = {
							en = "Go to Haleh in Winterspring. Use the blue rune on the ground inside the cave to reach her. Don't bother going to Dustwallow Marsh.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "前往冬泉谷的哈莱。使用洞穴内地面上的蓝色符文即可抵达她那里。不必去尘泥沼泽。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["sourceQuest"] = 6403,	-- The Great Masquerade
					["providers"] = {
						{ "n", 1748 },	-- Highlord Bolvar Fordragon
						{ "i", 16662 },	-- Fragment of the Dragon's Eye
					},
					["coord"] = { 78.2, 18.1, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4002, {	-- The Eastern Kingdoms
					["sourceQuest"] = 4001,	-- What Is Going On? (2/2)
					["qg"] = 4949,	-- Thrall <Warchief>
					["coord"] = { 31.61, 37.83, MAP.ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
				}),
				q(4362, {	-- The Fate of the Kingdom
					["sourceQuest"] = 4361,	-- The Bearer of Bad News
					["qg"] = 2784,	-- King Magni Bronzebeard <Lord of Ironforge>
					["coord"] = { 39.09, 56.19, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 Emperor Dagran Thaurissan slain
							["provider"] = { "n", 9019 },	-- Emperor Dagran Thaurissan
						}),
					},
				}),
				q(6403, {	-- The Great Masquerade
					-- #if BEFORE 3.0.2
					["description"] = createLocalizationString({
						readable = "This quest can be solo'd. Do NOT touch anything and let Bolvar take care of the dragons. They do heavy AOE, you will likely die unless you're in a raid group of 20+.",
						constant = "THIS_QUEST_CAN_BE_SOLO_D_DO_NOT_TOUCH_ANYTHING",
						export = true,
						text = {
							en = "This quest can be solo'd. Do NOT touch anything and let Bolvar take care of the dragons. They do heavy AOE, you will likely die unless you're in a raid group of 20+.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此任务可以单刷。不要碰任何东西，让伯瓦尔去对付那些龙。它们会施放强力的范围伤害，除非你在一个 20 人以上的团队中，否则很可能会死。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["sourceQuest"] = 6402,	-- Stormwind Rendezvous
					["qg"] = 12580,	-- Reginald Windsor
					["coord"] = { 64.7, 76.8, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(4286, {	-- The Good Stuff
					["qg"] = 9177,	-- Oralius
					["coord"] = { 84.6, 68.7, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/20 Dark Iron Fanny Pack
							["provider"] = { "i", 11468 },	-- Dark Iron Fanny Pack
						}),
						i(11883, {	-- A Dingy Fanny Pack
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4123, {	-- The Heart of the Mountain
					["qg"] = 9536,	-- Maxwort Uberglint
					["coord"] = { 65.2, 23.9, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_4_0_3 },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/1 The Heart of the Mountain
							["provider"] = { "i", 11309 },	-- The Heart of the Mountain
						}),
					},
				}),
				q(7201, {	-- The Last Element
					["sourceQuest"] = 3906,	-- Disharmony of Flame
					["qg"] = 9078,	-- Shadowmage Vivian Lagrave <Kargath Expeditionary Force>
					["coord"] = { 2.9, 47.76, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/10 Essence of the Elements
							["provider"] = { "i", 11129 },	-- Essence of the Elements
						}),
						i(12038, {	-- Lagrave's Seal
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4201, {	-- The Love Potion
					["qg"] = 9500,	-- Mistress Nagmara
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.AZSHARA, MAP.UNGORO_CRATER },
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/4 Gromsblood
							["provider"] = { "i", 8846 },	-- Gromsblood
						}),
						objective(2, {	-- 0/10 Giant Silver Vein
							["provider"] = { "i", 11405 },	-- Giant Silver Vein
							["coord"] = { 68.0, 17.0, MAP.AZSHARA },
							["crs"] = {
								6146,	-- Cliff Breaker
								6147,	-- Cliff Thunderer
								6148,	-- Cliff Walker
							},
						}),
						objective(3, {	-- 0/1 Nagmara's Filled Vial
							["provider"] = { "i", 11413 },	-- Nagmara's Filled Vial
							["cost"] = { { "i", 11412, 1 } },	-- Nagmara's Vial
							["coord"] = { 31.0, 49.0, MAP.UNGORO_CRATER },
						}),
						i(11962, {	-- Manacle Cuffs
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(11866, {	-- Nagmara's Whipping Belt
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4004, {	-- The Princess Saved?
					["sourceQuest"] = 4003,	-- The Royal Rescue
					["qg"] = 8929,	-- Princess Moira Bronzebeard <Princess of Ironforge>
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.ORGRIMMAR },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						i(12545, {	-- Eye of Orgrimmar
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12544, {	-- Thrall's Resolve
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4363, {	-- The Princess's Surprise
					["sourceQuest"] = 4362,	-- The Fate of the Kingdom
					["qg"] = 8929,	-- Princess Moira Bronzebeard <Princess of Ironforge>
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.IRONFORGE },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						i(12548, {	-- Magni's Will
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12543, {	-- Songstone of Ironforge
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4061, {	-- The Rise of the Machines (1/3)
					["qg"] = 9079,	-- Hierophant Theodora Mulvadania <Kargath Expeditionary Force>
					["coord"] = { 3.02, 47.81, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BURNING_STEPPES },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
					["groups"] = {
						objective(1, {	-- 0/10 Fractured Elemental Shard
							["provider"] = { "i", 11266 },	-- Fractured Elemental Shard
							["crs"] = {
								7032,	-- Greater Obsidian Elemental
								8981,	-- Malfunctioning Reaver
								7039,	-- War Reaver
							},
						}),
					},
				}),
				q(4062, {	-- The Rise of the Machines (2/3)
					["sourceQuest"] = 4061,	-- The Rise of the Machines (1/3)
					["providers"] = {
						{ "n", 9079 },	-- Hierophant Theodora Mulvadania <Kargath Expeditionary Force>
						{ "i", 11267 },	-- Elemental Shard Sample
					},
					["coord"] = { 3.02, 47.81, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
				}),
				q(4063, {	-- The Rise of the Machines (3/3)
					["sourceQuest"] = 4062,	-- The Rise of the Machines (2/3)
					["qg"] = 2921,	-- Lotwil Veriatus
					["coord"] = { 25.95, 44.87, MAP.BADLANDS },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 52,
					["groups"] = {
						objective(1, {	-- 0/1 Head of Argelmach
							["provider"] = { "i", 11268 },	-- Head of Argelmach
						}),
						objective(2, {	-- 0/10 Intact Elemental Core
							["provider"] = { "i", 11269 },	-- Intact Elemental Core
						}),
						i(12110, {	-- Raincaster Drape
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12109, {	-- Azure Moon Amice
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12111, {	-- Lavaplate Gauntlets
							["timeline"] = { REMOVED_4_0_3 },
						}),
						i(12108, {	-- Basaltscale Armor
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4003, {	-- The Royal Rescue
					["sourceQuest"] = 4002,	-- The Eastern Kingdoms
					["qg"] = 4949,	-- Thrall <Warchief>
					["coord"] = { 31.61, 37.83, MAP.ORGRIMMAR },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- 0/1 Emperor Dagran Thaurissan slain
							["provider"] = { "n", 9019 },	-- Emperor Dagran Thaurissan
						}),
					},
				}),
				q(3702, {	-- The Smoldering Ruins of Thaurissan (1/2)
					["qg"] = 8879,	-- Royal Historian Archesonus
					["coord"] = { 38.37, 55.31, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
				}),
				q(3701, {	-- The Smoldering Ruins of Thaurissan (2/2)
					["sourceQuest"] = 3702,	-- The Smoldering Ruins of Thaurissan (1/2)
					["qg"] = 8879,	-- Royal Historian Archesonus
					["coord"] = { 38.37, 55.31, MAP.IRONFORGE },
					["timeline"] = { REMOVED_4_0_3 },
					["maps"] = { MAP.BURNING_STEPPES },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 50,
					["groups"] = {
						objective(1, {	-- 0/12 Information Recovered
							["provider"] = { "o", 153556 },	-- Thaurissan Relic
						}),
						i(12102, {	-- Ring of the Aristocrat
							["timeline"] = { REMOVED_4_0_3 },
						}),
					},
				}),
				q(4083, {	-- The Spectral Chalice
					["description"] = createLocalizationString({
						readable = "If you are a miner with 230 skill, speak with Gloom'rel to have him summon the Spectral Chalice.\n\nAfter you deposit the required items, speak to Gloom'rel again to learn how to smelt Dark Iron Ore.",
						constant = "IF_YOU_ARE_A_MINER_WITH_230_SKILL_SPEAK_WITH",
						export = true,
						text = {
							en = "If you are a miner with 230 skill, speak with Gloom'rel to have him summon the Spectral Chalice.\n\nAfter you deposit the required items, speak to Gloom'rel again to learn how to smelt Dark Iron Ore.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "如果你是一名技能 230 的矿工，与格鲁姆雷尔交谈，让他召唤出幽灵圣杯。\n\n存入所需物品后，再次与格鲁姆雷尔交谈，即可学会如何熔炼黑铁矿石。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 164869 },	-- Spectral Chalice
					["cost"] = {
						{ "i", 3577, 20 },	-- 20x Gold Bar
						{ "i", 7910, 2 },	-- 2x Star Ruby
						{ "i", 6037, 10 },	-- 10x Truesilver Bar
					},
					["requireSkill"] = MINING,
					["cr"] = 9037,	-- Gloom'rel
					["lvl"] = 40,
					["groups"] = {
						r(14891),	-- Smelt Dark Iron
					},
				}),
				q(4183, {	-- The True Masters (1/6)
					["sourceQuest"] = 4182,	-- Dragonkin Menace
					["qg"] = 9562,	-- Helendis Riverhorn
					["qi"] = 11366,	-- Helendis Riverhorn's Letter
					["coord"] = { 85.8, 69.0, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
				}),
				q(4184, {	-- The True Masters (2/6)
					["sourceQuest"] = 4183,	-- The True Masters (1/6)
					["qg"] = 344,	-- Magistrate Solomon
					["qi"] = 11367,	-- Solomon's Plea to Bolvar
					["coord"] = { 24.9, 44.4, MAP.REDRIDGE_MOUNTAINS },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
				}),
				q(4185, {	-- The True Masters (3/6)
					["sourceQuest"] = 4184,	-- The True Masters (2/6)
					["qg"] = 1748,	-- Highlord Bolvar Fordragon
					["coord"] = { 78.2, 18.1, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- Advice from Lady Prestor
							["provider"] = { "n", 1749 },	-- Lady Katrana Prestor
						}),
					},
				}),
				q(4186, {	-- The True Masters (4/6)
					["sourceQuest"] = 4185,	-- The True Masters (3/6)
					["providers"] = {
						{ "n", 1748 },	-- Highlord Bolvar Fordragon
						{ "i", 11368 },	-- Bolvar's Decree
					},
					["coord"] = { 78.2, 18.1, MAP.STORMWIND_CITY },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
				}),
				q(4223, {	-- The True Masters (5/6)
					["sourceQuest"] = 4186,	-- The True Masters (4/6)
					["qg"] = 344,	-- Magistrate Solomon
					["coord"] = { 24.9, 44.4, MAP.REDRIDGE_MOUNTAINS },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
				}),
				q(4224, {	-- The True Masters (6/6)
					["sourceQuest"] = 4223,	-- The True Masters (5/6)
					["qg"] = 9560,	-- Marshal Maxwell
					["coord"] = { 84.74, 69.02, MAP.BURNING_STEPPES },
					["timeline"] = { REMOVED_3_0_2 },
					["races"] = ALLIANCE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- Ragged John's Story
							["provider"] = { "n", 9563 },	-- Ragged John
							["coord"] = { 65.0, 23.8, MAP.BURNING_STEPPES },
						}),
					},
				}),
				q(4133, {	-- Vivian Lagrave
					["qg"] = 5204,	-- Apothecary Zinge <Royal Apothecary Society>
					["coord"] = { 50.1, 68.0, MAP.UNDERCITY },
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["isBreadcrumb"] = true,
					["lvl"] = 50,
				}),
				q(3982, {	-- What Is Going On? (1/2)
					["sourceQuest"] = 3981,	-- Commander Gor'shak
					["qg"] = 9020,	-- Commander Gor'shak <Kargath Expeditionary Force>
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
				}),
				q(4001, {	-- What Is Going On? (2/2)
					["sourceQuest"] = 3982,	-- What Is Going On? (1/2)
					["qg"] = 9020,	-- Commander Gor'shak <Kargath Expeditionary Force>
					["timeline"] = { REMOVED_4_0_3 },
					["races"] = HORDE_ONLY,
					["lvl"] = 48,
					["groups"] = {
						objective(1, {	-- Information Gathered from Kharan
							["provider"] = { "n", 9021 },	-- Kharan Mighthammer
						}),
					},
				}),
				q(4324, {	-- Yuka Screwspigot
					["qg"] = 9706,	-- Yorba Screwspigot
					["coord"] = { 67.0, 24.0, MAP.TANARIS },
					["timeline"] = { REMOVED_4_0_3 },
					["isBreadcrumb"] = true,
					["lvl"] = 48,
				}),
			}),
			n(VENDORS, {
				n(12944, bubbleDownClassicRep(FACTION_THORIUM_BROTHERHOOD, {	-- Lokhtos Darkbargainer <The Thorium Brotherhood>
					{	-- Neutral
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227730, {	-- Thorium Brotherhood Contract
							["description"] = createLocalizationString({
								readable = "With a Sulfuron Ingot in your bags, speak with Lokhtos and click on the new chat option to obtain a Thorium Brotherhood Contract.",
								constant = "WITH_A_SULFURON_INGOT_IN_YOUR_BAGS_SPEAK_WITH",
								export = true,
								text = {
									en = "With a Sulfuron Ingot in your bags, speak with Lokhtos and click on the new chat option to obtain a Thorium Brotherhood Contract.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "背包中带有萨弗隆铁锭时，与洛克托斯交谈并点击新的对话选项，即可获得瑟银兄弟会契约。",
									-- TODO: tw = "",
								},
							}),
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = { { "i", 17203, 1 } },	-- Sulfuron Ingot
							["lvl"] = 60,
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(20754, {	-- Lesser Mana Oil (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(20755, {	-- Formula: Wizard Oil (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(22308, {	-- Pattern: Enchanted Runecloth Bag (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(18628, {	-- Thorium Brotherhood Contract
							["description"] = "~L.WITH_A_SULFURON_INGOT_IN_YOUR_BAGS_SPEAK_WITH",
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
							["cost"] = { { "i", 17203, 1 } },	-- Sulfuron Ingot
							["lvl"] = lvlsquish(60, 60, 20),
						}),
					},
					{	-- Friendly
						--[[Commented out until confirmed
						i(19444),	-- Formula: Enchant Weapon - Strength (RECIPE!)
						--]]
						i(17022),	-- Pattern: Corehound Boots (RECIPE!)
						i(17018),	-- Pattern: Flarecore Gloves (RECIPE!)
						i(17023),	-- Pattern: Molten Helm (RECIPE!)
						i(17051),	-- Plans: Dark Iron Bracers (RECIPE!)
						i(20761),	-- Recipe: Transmute Elemental Fire (RECIPE!)
					},
					{	-- Honored
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(228981, {	-- Formula: Conductive Shield Coating (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(229008, {	-- Formula: Enchant Cloak - Greater Fire Resistance (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(229009, {	-- Formula: Enchant Cloak - Greater Nature Resistance (RECIPE!)
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						--[[ BWL Removed until confirmed
						applyclassicphase(PHASE_THREE_ENCHANTS, i(19448)),	-- Formula: Enchant Weapon - Mighty Spirit (RECIPE!)
						--]]
						i(17025),	-- Pattern: Black Dragonscale Boots (RECIPE!)
						i(17017),	-- Pattern: Flarecore Mantle (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19219)),	-- Pattern: Flarecore Robe (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19330)),	-- Pattern: Lava Belt (RECIPE!)
						i(17060),	-- Plans: Dark Iron Destroyer (RECIPE!)
						--[[ BWL Removed until confirmed
						applyclassicphase(PHASE_THREE_RECIPES, i(19206)),	-- Plans: Dark Iron Helm (RECIPE!)
						--]]
						i(17059),	-- Plans: Dark Iron Reaver (RECIPE!)
						i(17049),	-- Plans: Fiery Chain Girdle (RECIPE!)

						-- #if SEASON_OF_DISCOVERY
						-- EPIC ITEM UPGRADES
						applyclassicphase(SOD_PHASE_FOUR, i(227826, {	-- Dark Iron Flame Reaver
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   17015, 1 },	-- Dark Iron Reaver
								{ "i", 227801, 25 },	-- Firelands Ember
								{ "i",   17010, 2 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227842, {	-- Ebon Fist
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19170, 1 },	-- Ebon Hand
								{ "i", 227801, 25 },	-- Firelands Ember
								{ "i",   17010, 2 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227823, {	-- Fine Flarecore Gloves
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16979, 1 },	-- Flarecore Gloves
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227839, {	-- Fine Flarecore Leggings
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19165, 1 },	-- Flarecore Leggings
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227830, {	-- Fine Flarecore Mantle
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16980, 1 },	-- Flarecore Mantle
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227831, {	-- Fine Flarecore Robe
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19156, 1 },	-- Flarecore Robe
								{ "i", 227801, 20 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227821, {	-- Flamekissed Molten Helm
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16983, 1 },	-- Molten Helm
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227833, {	-- Glaive of Obsidian Fury
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19167, 1 },	-- Blackfury
								{ "i", 227801, 25 },	-- Firelands Ember
								{ "i",   17011, 2 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227829, {	-- Hardened Black Dragonscale Boots
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16984, 1 },	-- Black Dragonscale Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227840, {	-- Implacable Blackguard
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19168, 1 },	-- Blackguard
								{ "i", 227801, 25 },	-- Firelands Ember
								{ "i",   17011, 2 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227828, {	-- Lavawalker Belt
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19149, 1 },	-- Lava Belt
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227827, {	-- Molten Chain Girdle
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16989, 1 },	-- Fiery Chain Girdle
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227834, {	-- Molten Chain Shoulders
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16988, 1 },	-- Fiery Chain Shoulders
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227825, {	-- Molten Dark Iron Destroyer
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   17016, 1 },	-- Dark Iron Destroyer
								{ "i", 227801, 25 },	-- Firelands Ember
								{ "i",   17010, 2 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227838, {	-- Shining Chromatic Gauntlets
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19157, 1 },	-- Chromatic Gauntlets
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227832, {	-- Tempered Black Amnesty
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19166, 1 },	-- Black Amnesty
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 2 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227841, {	-- Tempered Dark Iron Boots (Str/Stam)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228924, {	-- Tempered Dark Iron Boots (Agi/Stam)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228925, {	-- Tempered Dark Iron Boots (Def/Stam)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228926, {	-- Tempered Dark Iron Boots (Int/Holy)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228927, {	-- Tempered Dark Iron Boots (Str/Holy)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228928, {	-- Tempered Dark Iron Boots (Healing/Stam)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(228929, {	-- Tempered Dark Iron Boots (Healing/Int)
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   20039, 1 },	-- Dark Iron Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227820, {	-- Tempered Dark Iron Bracers
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   17014, 1 },	-- Dark Iron Bracers
								{ "i", 227801, 10 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227835, {	-- Tempered Dark Iron Gauntlets
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19164, 1 },	-- Dark Iron Gauntlets
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227824, {	-- Tempered Dark Iron Helm
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19148, 1 },	-- Dark Iron Helm
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227836, {	-- Tempered Dark Iron Leggings
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   17013, 1 },	-- Dark Iron Leggings
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227837, {	-- Thick Corehound Belt
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   19162, 1 },	-- Corehound Belt
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17010, 1 },	-- Fiery Core
							},
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227822, {	-- Thick Corehound Boots
							["timeline"] = { ADDED_1_15_3 },
							["cost"] = {
								{ "i",   16982, 1 },	-- Corehound Boots
								{ "i", 227801, 15 },	-- Firelands Ember
								{ "i",   17011, 1 },	-- Lava Core
							},
						})),
						-- #endif
					},
					{	-- Revered
						--[[ BWL Removed until confirmed
						applyclassicphase(PHASE_THREE_ENCHANTS, i(19449)),	-- Formula: Enchant Weapon - Mighty Intellect (RECIPE!)
						--]]
						applyclassicphase(PHASE_THREE_RECIPES, i(19331)),	-- Pattern: Chromatic Gauntlets (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19332)),	-- Pattern: Corehound Belt (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19220)),	-- Pattern: Flarecore Leggings (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19333)),	-- Pattern: Molten Belt (RECIPE!)

						--[[ BWL Removed until confirmed
						applyclassicphase(PHASE_THREE_RECIPES, i(19208)),	-- Plans: Black Amnesty (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19209)),	-- Plans: Blackfury (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19207)),	-- Plans: Dark Iron Gauntlets (RECIPE!)
						--]]
						i(17052),	-- Plans: Dark Iron Leggings (RECIPE!)
						i(17053),	-- Plans: Fiery Chain Shoulders (RECIPE!)
					},
					{	-- Exalted
						--[[ BWL Removed until confirmed
						applyclassicphase(PHASE_THREE_RECIPES, i(19211)),	-- Plans: Blackguard (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19212)),	-- Plans: Nightfall (RECIPE!)
						applyclassicphase(PHASE_THREE_RECIPES, i(19210)),	-- Plans: Ebon Hand (RECIPE!)
						--- P4
						applyclassicphase(PHASE_FOUR_DARKIRON_RECIPES,  i(20040)),	-- Plans: Dark Iron Boots (RECIPE!)
						--]]
					},
				})),
				n(9499, {	-- Plugger Spazzring
					-- #if SEASON_OF_DISCOVERY
					applyclassicphase(SOD_PHASE_FOUR, i(227902, {	-- Pattern: Hardened Black Dragonscale Breastplate (RECIPE!)
						["timeline"] = { ADDED_1_15_3 },
					})),
					-- #endif
					i(15759, {	-- Pattern: Black Dragonscale Breastplate (RECIPE!)
						-- #if SEASON_OF_DISCOVERY
						["timeline"] = { REMOVED_1_15_3 },
						-- #endif
					}),
					i(13483),	-- Recipe: Transmute Fire to Earth (RECIPE!)
					i(11325),	-- Dark Iron Ale Mug
				}),
				n(45843, {	-- Yuka Screwspigot <Engineering Supplies>
					["timeline"] = { ADDED_4_0_1 },
					["groups"] = {
						i(10602),	-- Schematic: Deadly Scope (RECIPE!)
					},
				}),
			}),
			n(ZONE_DROPS, {
				i(11468),	-- Dark Iron Fanny Pack
				i(18945),	-- Dark Iron Residue
				applyclassicphase(PHASE_FIVE, i(22528)),	-- Dark Iron Scraps
				i(11129),	-- Essence of the Elements
				i(11269, {	-- Intact Elemental Core
					["crs"] = {
						8908,	-- Molten War Golem
						8906,	-- Ragereaver Golem
						8905,	-- Warbringer Construct
						8907,	-- Wrath Hammer Construct
					},
				}),
				i(15781, {	-- Pattern: Black Dragonscale Leggings (RECIPE!)
					-- #if SEASON_OF_DISCOVERY
					["timeline"] = { REMOVED_1_15_3 },
					-- #endif
					["cr"] = 8903,	-- Anvilrage Captain
				}),
				i(15770, {	-- Pattern: Black Dragonscale Shoulders (RECIPE!)
					-- #if SEASON_OF_DISCOVERY
					["timeline"] = { REMOVED_1_15_3 },
					-- #endif
					["cr"] = 8898,	-- Anvilrage Marshal
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_FOUR, i(227903, {	-- Pattern: Hardened Black Dragonscale Leggings (RECIPE!)
					["timeline"] = { ADDED_1_15_3 },
					["cr"] = 8903,	-- Anvilrage Captain
				})),
				applyclassicphase(SOD_PHASE_FOUR, i(227904, {	-- Pattern: Hardened Black Dragonscale Shoulders (RECIPE!)
					["timeline"] = { ADDED_1_15_3 },
					["cr"] = 8898,	-- Anvilrage Marshal
				})),
				-- #endif
				i(11614, {	-- Plans: Dark Iron Mail (RECIPE!)
					["description"] = createLocalizationString({
						readable = "|cFFFFD700Plans: Dark Iron Mail|r can spawn in one of four spots.\n\n|cFFFFFFFFLocation 1:|r Located in the |cFFFFD700West Garrison|r. After going up the ramp from where |cFFFFD700General Angerforge|r is located on your left are some tables. It will be located in the back corner where the Fireguard Destroyer is and two tables in front of it. This table is close to the table that has vases on it that is near the keg.\n\n|cFFFFFFFFLocation 2:|r In |cFFFFD700Golem Lord Argelmach's|r room. When you walk into the room it will be in the back left corner where in between barrels. There will be two barrels to the left and one barrel to the right of it.\n\n|cFFFFFFFFLocation 3:|r In |cFFFFD700The Manufactory|r, on a bench.\n\n|cFFFFFFFFLocation 4:|r After leaving the room with |cFFFFD700Ambassador Flamelash|r you will cross a bridge that leads into the |cFFFFD700Mold Foundry|r. Once you enter the room you will continue straight until you see the ramp. Instead of going down the ramp you will jump off the ledge to the right of the ramp. After landing on the ground you will see the plans located here.",
						constant = "CFFFFD700PLANS_DARK_IRON_MAIL_R_CAN_SPAWN_IN",
						export = true,
						text = {
							en = "|cFFFFD700Plans: Dark Iron Mail|r can spawn in one of four spots.\n\n|cFFFFFFFFLocation 1:|r Located in the |cFFFFD700West Garrison|r. After going up the ramp from where |cFFFFD700General Angerforge|r is located on your left are some tables. It will be located in the back corner where the Fireguard Destroyer is and two tables in front of it. This table is close to the table that has vases on it that is near the keg.\n\n|cFFFFFFFFLocation 2:|r In |cFFFFD700Golem Lord Argelmach's|r room. When you walk into the room it will be in the back left corner where in between barrels. There will be two barrels to the left and one barrel to the right of it.\n\n|cFFFFFFFFLocation 3:|r In |cFFFFD700The Manufactory|r, on a bench.\n\n|cFFFFFFFFLocation 4:|r After leaving the room with |cFFFFD700Ambassador Flamelash|r you will cross a bridge that leads into the |cFFFFD700Mold Foundry|r. Once you enter the room you will continue straight until you see the ramp. Instead of going down the ramp you will jump off the ledge to the right of the ramp. After landing on the ground you will see the plans located here.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFD700设计图：黑铁锁甲|r 可能在四个位置之一刷新。\n\n|cFFFFFFFF位置 1：|r 位于 |cFFFFD700西部兵营|r。从 |cFFFFD700安格弗将军|r 所在处沿斜坡上去后，你左侧有几张桌子。它会在火焰护卫毁灭者所在的后方角落，以及它前面的两张桌子处。这张桌子靠近那张摆着花瓶、位于酒桶附近的桌子。\n\n|cFFFFFFFF位置 2：|r 在 |cFFFFD700傀儡统帅阿格曼奇|r 的房间内。走进房间后，它会在后方左侧角落的桶之间。它的左边会有两个桶，右边有一个桶。\n\n|cFFFFFFFF位置 3：|r 在 |cFFFFD700制造厂|r，放在一张长椅上。\n\n|cFFFFFFFF位置 4：|r 离开 |cFFFFD700弗莱拉斯大使|r 的房间后，你会穿过一座桥进入 |cFFFFD700模具铸造厂|r。进入房间后一直往前走，直到看到斜坡。不要走下斜坡，而是从斜坡右侧的边沿跳下去。落地后你就会看到设计图在这里。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 173232 },	-- Blacksmithing Plans
				}),
				i(11615, {	-- Plans: Dark Iron Shoulders (RECIPE!)
					["description"] = createLocalizationString({
						readable = "|cFFFFD700Plans: Dark Iron Shoulders|r spawn in one of two spots.\n\n|cFFFFFFFFLocation 1:|r In |cFFFFD700General Angerforge's|r room. They are sitting on the bottom shelf next to the floating crystal.\n\n|cFFFFFFFFLocation 2:|r On the ground in the |cFFFFD700Detention Block|r. After passing Lexlort you will continue down into the room. When you come across the first split into two rooms you will enter the room on the left. They will be located on the seat behind the bench which is located next to the 3 red jugs.",
						constant = "CFFFFD700PLANS_DARK_IRON_SHOULDERS_R_SPAWN_IN",
						export = true,
						text = {
							en = "|cFFFFD700Plans: Dark Iron Shoulders|r spawn in one of two spots.\n\n|cFFFFFFFFLocation 1:|r In |cFFFFD700General Angerforge's|r room. They are sitting on the bottom shelf next to the floating crystal.\n\n|cFFFFFFFFLocation 2:|r On the ground in the |cFFFFD700Detention Block|r. After passing Lexlort you will continue down into the room. When you come across the first split into two rooms you will enter the room on the left. They will be located on the seat behind the bench which is located next to the 3 red jugs.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "|cFFFFD700设计图：黑铁护肩|r 在两个位置之一刷新。\n\n|cFFFFFFFF位置 1：|r 在 |cFFFFD700安格弗将军|r 的房间内。它们放在悬浮水晶旁边的底层架子上。\n\n|cFFFFFFFF位置 2：|r 在 |cFFFFD700监狱区|r 的地面上。经过莱克斯洛特后，继续往下进入房间。当你遇到第一个分成两个房间的岔路时，进入左边的房间。它们会放在长椅后面的座位上，长椅位于 3 个红色罐子旁边。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 173232 },	-- Blacksmithing Plans
				}),
				i(11611, {	-- Plans: Dark Iron Sunderer (RECIPE!)
					["crs"] = {
						9554,	-- Hammered Patron
						10043,	-- Ribbly's Crony
					},
				}),
				i(16049, {	-- Schematic: Dark Iron Bomb (RECIPE!)
					["cr"] = 8920,	-- Weapon Technician
				}),
				i(16048, {	-- Schematic: Dark Iron Rifle (RECIPE!)
					["cr"] = 8897,	-- Doomforge Craftsman
				}),
				i(18235, {	-- Schematic: Field Repair Bot 74A (RECIPE!)
					["description"] = createLocalizationString({
						readable = "On the floor next to Golem Lord Argelmach.",
						constant = "ON_THE_FLOOR_NEXT_TO_GOLEM_LORD_ARGELMACH",
						export = true,
						text = {
							en = "On the floor next to Golem Lord Argelmach.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在魔像领主阿格曼奇旁边的地上。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "o", 179552 },	-- Schematic: Field Repair Bot 74A
				}),
				i(18654, {	-- Schematic: Gnomish Alarm-o-Bot (RECIPE!)
					["cr"] = 8920,	-- Weapon Technician
				}),
				i(16053, {	-- Schematic: Master Engineer's Goggles
					-- #if AFTER 2.0.1
					["description"] = createLocalizationString({
						readable = "This is now learned from the trainer.",
						constant = "THIS_IS_NOW_LEARNED_FROM_THE_TRAINER",
						export = true,
						text = {
							en = "This is now learned from the trainer.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "现在可以从训练师处学习。",
							-- TODO: tw = "",
						},
					}),
					-- #endif
					["timeline"] = { REMOVED_2_0_1 },
					["cr"] = 8900,	-- Doomforge Arcanasmith
				}),
				i(18661, {	-- Schematic: World Enlarger (RECIPE!)
					["cr"] = 8920,	-- Weapon Technician
				}),
				i(12546),	-- Aristocratic Cuffs
				i(12555),	-- Battlechaser's Greaves
				i(12552),	-- Blisterbane Wrap
				i(12549),	-- Braincage
				i(12535),	-- Doomforged Straightedge
				i(12542),	-- Funeral Pyre Vestment
				i(12547),	-- Mar Alom's Grip
				i(11078),	-- Relic Coffer Key
				i(12527),	-- Ribsplitter
				i(12550),	-- Runed Golem Shackles
				i(12531),	-- Searing Needle
				i(12532),	-- Spire of the Stoneshaper
				i(12551),	-- Stoneshield Cloak
				i(12528),	-- The Judge's Gavel
			}),
			n(DETENTION_BLOCK, {
				e(369, {	-- High Interrogator Gerstahn
					["creatureID"] = 9018,
					["groups"] = {
						i(11140),	-- Prison Cell Key
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223539, {	-- Enthralled Sphere
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11625, {	-- Enthralled Sphere
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						i(11626),	-- Blackveil Cape
						i(11624),	-- Kentic Amice
						applyclassicphase(PHASE_FIVE, i(22240)),	-- Greaves of Withering Despaire
					},
				}),
				e(370, {	-- Lord Roccor
					["creatureID"] = 9025,
					["groups"] = {
						i(11813),	-- Formula: Smoking Heart of the Mountain [BOE] (RECIPE!)
						i(11631),	-- Stoneshell Guard
						i(11632),	-- Earthslag Shoulders
						applyclassicphase(PHASE_FIVE, i(22234)),	-- Mantle of Lost Hope
						-- #if AFTER 7.3.2
						applyclassicphase(PHASE_FIVE, i(22271)),	-- Leggings of Frenzied Magic
						i(11679),	-- Rubicund Armguards
						-- #endif
						applyclassicphase(PHASE_FIVE, i(22397, {	-- Idol of Ferocity
							["timeline"] = { REMOVED_5_0_4 },
						})),
						i(11630, {	-- Rockshard Pellets
							["timeline"] = { DELETED_4_0_1 },
						}),
					},
				}),
				e(371, {	-- Houndmaster Grebmar
					["creatureID"] = 9319,
					["groups"] = {
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223540, {	-- Houndmaster's Bow
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11628, {	-- Houndmaster's Bow
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223982, {	-- Houndmaster's Rifle
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11629, {	-- Houndmaster's Rifle
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						i(11627),	-- Fleetfoot Greaves
						i(11623),	-- Spritecaster Cape
					},
				}),
				e(372, {	-- Ring of Law
					["description"] = createLocalizationString({
						readable = "Approaching the center of the ring will start an event, and the High Justice will appear and approach one of the gates and release three waves of non-elite enemies, followed by one of six possible mini-bosses.",
						constant = "APPROACHING_THE_CENTER_OF_THE_RING_WILL_START",
						export = true,
						text = {
							en = "Approaching the center of the ring will start an event, and the High Justice will appear and approach one of the gates and release three waves of non-elite enemies, followed by one of six possible mini-bosses.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "靠近圆环中心会触发一个事件，大法官将会出现，走向其中一座大门并释放三波非精英敌人，随后出现六个可能的小首领之一。",
							-- TODO: tw = "",
						},
					}),
					["creatureID"] = 10096,	-- High Justice Grimstone
					["groups"] = {
						n(9031, {	-- Anub'shiah
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_THREE, i(223986, {	-- Graverot Cape
								["timeline"] = { ADDED_1_15_2 },
							})),
							-- #endif
							i(11677, {	-- Graverot Cape
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_2 },
								-- #endif
							}),
							i(11678),	-- Carapace of Anub'shiah
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_FOUR, i(227957, {	-- Savage Gladiator Greaves
								["timeline"] = { ADDED_1_15_3 },
							})),
							-- #endif
							i(11731, {	-- Savage Gladiator Greaves
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_3 },
								-- #endif
							}),
							i(11675),	-- Shadefiend Boots
						}),
						n(9029, {	-- Eviscerator
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_THREE, i(223987, {	-- Splinthide Shoulders
								["timeline"] = { ADDED_1_15_2 },
							})),
							-- #endif
							i(11685, {	-- Splinthide Shoulders
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_2 },
								-- #endif
							}),
							-- #if BEFORE 7.3.2
							i(11679),	-- Rubicund Armguards
							-- #endif
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_FOUR, i(227961, {	-- Savage Gladiator Grips
								["timeline"] = { ADDED_1_15_3 },
							})),
							-- #endif
							i(11730, {	-- Savage Gladiator Grips
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_3 },
								-- #endif
							}),
							i(11686),	-- Girdle of Beastial Fury
						}),
						n(9027, {	-- Gorosh the Dervish
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_FOUR, i(227962, {	-- Flarethorn
								["timeline"] = { ADDED_1_15_3 },
							})),
							-- #endif
							applyclassicphase(PHASE_FIVE, i(22266, {	-- Flarethorn
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_3 },
								-- #endif
							})),
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_FOUR, i(227952, {	-- Savage Gladiator Chain
								["timeline"] = { ADDED_1_15_3 },
							})),
							-- #endif
							i(11726, {	-- Savage Gladiator Chain
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_3 },
								-- #endif
							}),
							-- #if AFTER 7.3.2
							i(11662),	-- Ban'thok Sash
							-- #endif
							applyclassicphase(PHASE_FIVE, i(22271)),	-- Leggings of Frenzied Magic
							applyclassicphase(PHASE_FIVE, i(22257)),	-- Bloodclot Band
						}),
						n(9028, {	-- Grizzle
							i(11610),	-- Plans: Dark Iron Pulverizer (RECIPE!)
							i(11702),	-- Grizzle's Skinner
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_THREE, i(223544, {	-- Dregmetal Spaulders
								["timeline"] = { ADDED_1_15_2 },
							})),
							-- #endif
							i(11722, {	-- Dregmetal Spaulders
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_2 },
								-- #endif
							}),
							i(11703),	-- Stonewall Girdle
							applyclassicphase(PHASE_FIVE, i(22270)),	-- Entrenching Boots
						}),
						n(9032, {	-- Hedrum the Creeper
							i(11635),	-- Hookfang Shanker
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_FOUR, i(227955, {	-- Savage Gladiator Helm
								["timeline"] = { ADDED_1_15_3 },
							})),
							-- #endif
							i(11729, {	-- Savage Gladiator Helm
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_3 },
								-- #endif
							}),
							i(11633),	-- Spiderfang Carapace
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_THREE, i(223984, {	-- Silkweb Gloves
								["timeline"] = { ADDED_1_15_2 },
							})),
							-- #endif
							i(11634, {	-- Silkweb Gloves
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_2 },
								-- #endif
							}),
						}),
						n(9030, {	-- Ok'thor the Breaker
							i(11665),	-- Ogreseer Fists
							i(11662),	-- Ban'thok Sash
							i(11728),	-- Savage Gladiator Leggings
							-- #if SEASON_OF_DISCOVERY
							applyclassicphase(SOD_PHASE_THREE, i(223985, {	-- Cyclopean Band
								["timeline"] = { ADDED_1_15_2 },
							})),
							-- #endif
							i(11824, {	-- Cyclopean Band
								-- #if SEASON_OF_DISCOVERY
								["timeline"] = { REMOVED_1_15_2 },
								-- #endif
							}),
						}),
						applyclassicphase(PHASE_FIVE_TIER_ZERO_POINT_FIVE_SETS, n_conditional(16059, {	-- Theldren
							["description"] = createLocalizationString({
								readable = "Requires Banner of Provocation (Dungeon Set 2 Questline) to summon this boss. Loot the grey chest on the grey grate after killing the mobs. You must use the banner before the non-elites are killed.\nSummon Location: Ring of Law.",
								constant = "REQUIRES_BANNER_OF_PROVOCATION_DUNGEON_SET_2",
								export = true,
								text = {
									en = "Requires Banner of Provocation (Dungeon Set 2 Questline) to summon this boss. Loot the grey chest on the grey grate after killing the mobs. You must use the banner before the non-elites are killed.\nSummon Location: Ring of Law.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "需要挑衅之旗（地下城套装 2 任务线）才能召唤这个首领。杀死怪物后拾取灰色格栅上的灰色宝箱。你必须在非精英被杀死之前使用旗帜。\n召唤地点：法律之环。",
									-- TODO: tw = "",
								},
							}),
							["timeline"] = { REMOVED_4_0_3 },
							-- #if AFTER 4.0.3
							["sourceQuest"] = 9015,	-- The Challenge
							["u_sqs"] = true,	-- remove the u flag if sourcequests are completed
							-- #endif
							["providers"] = {
								{ "i", 21986 },	-- Banner of Provocation
								{ "o", 181074 },	-- Arena Spoils
							},
							["groups"] = {
								i(22047),	-- Top Piece of Lord Valthalak's Amulet
								-- #if SEASON_OF_DISCOVERY
								applyclassicphase(SOD_PHASE_FOUR, i(228700, {	-- Ironweave Mantle
									["timeline"] = { ADDED_1_15_3 },
								})),
								-- #endif
								i(22305, {	-- Ironweave Mantle
									-- #if SEASON_OF_DISCOVERY
									["timeline"] = { REMOVED_1_15_3 },
									-- #endif
								}),
								i(22317),	-- Lefty's Brass Knuckle
								i(22318),	-- Malgen's Long Bow
								i(22330),	-- Shroud of Arcane Mastery
							},
						})),
					},
				}),
				-- #if SEASON_OF_DISCOVERY
				applyclassicphase(SOD_PHASE_THREE, n(223265, {	-- Delirious Ancient
					["description"] = createLocalizationString({
						readable = "Spawns after defeating High Interrogator Gerstahn, Houndmaster Grebmar, Ring of Law in the Dark Iron Highway.",
						constant = "SPAWNS_AFTER_DEFEATING_HIGH_INTERROGATOR",
						export = true,
						text = {
							en = "Spawns after defeating High Interrogator Gerstahn, Houndmaster Grebmar, Ring of Law in the Dark Iron Highway.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "击败黑铁公路的高阶审讯官格斯塔恩、驯犬者格雷布玛尔以及法律之环后刷新。",
							-- TODO: tw = "",
						},
					}),
					["cost"] = { { "i", 221418, 1 } },	-- Agamaggan's Roar
					["groups"] = {
						i(221271),	-- Ace of Wilds
						i(221262),	-- Wild Offering
					},
				})),
				-- #endif
				e(377, {	-- Bael'gar
					["creatureID"] = 9016,
					["groups"] = {
						i(11803),	-- Force of Magma
						i(11805),	-- Rubidium Hammer
						i(11807),	-- Sash of the Burning Heart
						i(11802),	-- Lavacrest Leggings
						-- #if AFTER 7.3.2
						applyclassicphase(PHASE_FIVE, i(22257)),	-- Bloodclot Band
						-- #endif
					},
				}),
				e(374, {	-- Lord Incendius
					["creatureID"] = 9017,
					["groups"] = {
						applyclassicphase(PHASE_FIVE, i(21987)),	-- Incendicite of Incendius
						i(11126),	-- Tablet of Kurniya
						i(11766),	-- Flameweave Cuffs
						i(11764),	-- Cinderhide Armsplints
						i(11765),	-- Pyremail Wristguards
						i(11767),	-- Emberplate Armguards
						i(11768, {	-- Incendic Bracers
							-- #if BEFORE 10.1.7
							-- #if AFTER 2.0.1
							["description"] = createLocalizationString({
								readable = "This item appears to have been removed with TBC Prepatch. Please @Crieve if you get it to drop.",
								constant = "THIS_ITEM_APPEARS_TO_HAVE_BEEN_REMOVED_WITH_TBC",
								export = true,
								text = {
									en = "This item appears to have been removed with TBC Prepatch. Please @Crieve if you get it to drop.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "此物品似乎已在《燃烧的远征》前夕版本中移除。如果你让它掉落了，请 @Crieve。",
									-- TODO: tw = "",
								},
							}),
							["isBounty"] = true,
							-- #endif
							-- #endif
							["timeline"] = { REMOVED_2_0_1, ADDED_10_1_7 },	-- 07.09.2023 ATT DISCORD
						}),
						applyclassicphase(PHASE_THREE_DMF_CARDS, i(19268)),	-- Ace of Elementals
					},
				}),
				e(376, {	-- Fineous Darkvire <Chief Architect>
					["creatureID"] = 9056,
					["groups"] = {
						i(11840),	-- Master Builder's Shirt
						i(11839),	-- Chief Architect's Monocle
						applyclassicphase(PHASE_FIVE, i(22223)),	-- Foreman's Head Protector
						i(151406, {	-- Belt of the Eminent Mason
							["timeline"] = { ADDED_7_3_0 },
						}),
						i(11842),	-- Land Surveyor's Mantle
						i(11841),	-- Senior Designer's Pantaloons
					},
				}),
			}),
			n(SHADOWFORGE_CITY, {
				e(373, {	-- Pyromancer Loregrain
					["creatureID"] = 9024,
					["groups"] = {
						i(11207),	-- Formula: Enchant Weapon - Fiery Weapon (RECIPE!)
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223538, {	-- Kindling Stave
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11750, {	-- Kindling Stave
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						i(11748),	-- Pyric Caduceus
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223981, {	-- Flamestrider Robes
							["timeline"] = { ADDED_1_15_2 },
						})),
						applyclassicphase(SOD_PHASE_THREE, i(223980, {	-- Searingscale Leggings
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11747, {	-- Flamestrider Robes
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						i(11749, {	-- Searingscale Leggings
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						-- #if AFTER 7.3.2
						applyclassicphase(PHASE_FIVE, i(22270)),	-- Entrenching Boots
						-- #endif
					},
				}),
				e(375, {	-- Warder Stilgiss
					["creatureID"] = 9041,
					["groups"] = {
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(223983, {	-- Arbiter's Blade
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
						i(11784, {	-- Arbiter's Blade
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_2 },
							-- #endif
						}),
						i(11782),	-- Boreal Mantle
						applyclassicphase(PHASE_FIVE, i(22241)),	-- Dark Warder's Pauldrons
						i(11783),	-- Chillsteel Girdle
						i(151405, {	-- Cold-Forged Chestplate
							["timeline"] = { ADDED_7_3_0 },
						}),
					},
				}),
				n(9042, {	-- Verek
					i(11755),	-- Verek's Collar
					applyclassicphase(PHASE_FIVE, i(22242)),	-- Verek's Leash
				}),
				n(9476, {	-- Watchman Doomgrip
					["description"] = createLocalizationString({
						readable = "Watchman Doomgrip spawns once all twelve Relic Coffers have been opened using Relic Coffer Keys that can drop from any Dark Iron mob in the instance. Upon defeating all enemies, a hidden door beneath the Dark Coffer will open allowing access to the Secret Safe as well as the Heart of the Mountain.",
						constant = "WATCHMAN_DOOMGRIP_SPAWNS_ONCE_ALL_TWELVE_RELIC",
						export = true,
						text = {
							en = "Watchman Doomgrip spawns once all twelve Relic Coffers have been opened using Relic Coffer Keys that can drop from any Dark Iron mob in the instance. Upon defeating all enemies, a hidden door beneath the Dark Coffer will open allowing access to the Secret Safe as well as the Heart of the Mountain.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "守望者末日之握会在所有十二个圣物保险箱都被打开后生成，打开它们需要用到副本内任何黑铁怪物掉落的圣物保险箱钥匙。击败所有敌人后，黑暗保险箱下方的一道暗门会打开，让你可以进入秘密保险箱以及山脉之心。",
							-- TODO: tw = "",
						},
					}),
					["cost"] = { { "i", 11078, 12 } },	-- Relic Coffer Key
					["groups"] = {
						o(160836, {	-- Relic Coffer
							["description"] = createLocalizationString({
								readable = "Relic Coffer Keys can drop from any Dark Iron mob in the instance.",
								constant = "RELIC_COFFER_KEYS_CAN_DROP_FROM_ANY_DARK_IRON",
								export = true,
								text = {
									en = "Relic Coffer Keys can drop from any Dark Iron mob in the instance.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "遗物宝箱钥匙可以由副本中的任何黑铁怪物掉落。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								i(11946),	-- Fire Opal Necklace
								i(11945),	-- Dark Iron Ring
								i(11938),	-- Sack of Gems
								i(11966),	-- Small Sack of Coins
								i(11937),	-- Fat Sack of Coins
								i(11944),	-- Dark Iron Baby Booties
							},
						}),
						o(165554, {	-- Heart of the Mountain
							["description"] = createLocalizationString({
								readable = "This spawns after defeating Watchman Doomgrip.",
								constant = "THIS_SPAWNS_AFTER_DEFEATING_WATCHMAN_DOOMGRIP",
								export = true,
								text = {
									en = "This spawns after defeating Watchman Doomgrip.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "击败看守者末日之握后刷新。",
									-- TODO: tw = "",
								},
							}),
							["groups"] = {
								i(11309),	-- The Heart of the Mountain
							},
						}),
						o(161495, {	-- Secret Safe
							["description"] = "~L.THIS_SPAWNS_AFTER_DEFEATING_WATCHMAN_DOOMGRIP",
							["groups"] = {
								-- #if BEFORE 1.13.5
								i(11923),	-- The Hammer of Grace
								i(11920),	-- Wraith Scythe
								i(11926),	-- Deathdealer Breastplate
								i(11929),	-- Haunting Specter Leggings
								-- #endif
								applyclassicphase(PHASE_FIVE, i(22256)),	-- Mana Shaping Handwraps
								applyclassicphase(PHASE_FIVE, i(22205)),	-- Black Steel Bindings
								applyclassicphase(PHASE_FIVE, i(22254)),	-- Wand of Eternal Light
								applyclassicphase(PHASE_FIVE, i(22255)),	-- Magma Forged Band
							},
						}),
					},
				}),
				o(164820, {	-- Dark Keeper Nameplate
					["description"] = createLocalizationString({
						readable = "Inspect the portrait in front of the coffer room. Opening it will tell you the name of the Dark Keeper you need and where he is located. Only one will spawn each reset.\n\n|cff3399ffDark Keepers:|r\n\n|cFFFFD700Dark Keeper Bethek|r spawns inside the vault room as soon as you open the portrait.\n\n|cFFFFD700Dark Keeper Ofgut|r is located in |cFFFFD700General Angerforge's|r room. When you come down the stairs and are looking straight at |cFFFFD700General Angerforge|r, you will see him located directly to the left near the crystal.\n\n|cFFFFD700Dark Keeper Pelver|r is located in |cFFFFD700The Domicile|r. For quicker access, you can take any of the mole machines and click |cFFFFD700Into the Domicile|r and he will be on top of it.\n\n|cFFFFD700Dark Keeper Uggel|r is quite a close walk; go outside the vault room and turn right to the last room. He is near the entrance where all the golems are.\n\n|cFFFFD700Dark Keeper Vorfalk|r is located at the |cFFFFD700Grim Guzzler|r. When you first enter the room after coming from the bridge, he will be located on your right side in the corner (in front of the band's playing spot).\n\n|cFFFFD700Dark Keeper Zimrel|r is located on the second floor of the |cFFFFD700Ring of Law|r. When entering this floor from the |cFFFFD700East Garrison|r (room with the Shadowforge Lock), you will go around to your right and he will be sitting in the middle of the seats.",
						constant = "INSPECT_THE_PORTRAIT_IN_FRONT_OF_THE_COFFER",
						export = true,
						text = {
							en = "Inspect the portrait in front of the coffer room. Opening it will tell you the name of the Dark Keeper you need and where he is located. Only one will spawn each reset.\n\n|cff3399ffDark Keepers:|r\n\n|cFFFFD700Dark Keeper Bethek|r spawns inside the vault room as soon as you open the portrait.\n\n|cFFFFD700Dark Keeper Ofgut|r is located in |cFFFFD700General Angerforge's|r room. When you come down the stairs and are looking straight at |cFFFFD700General Angerforge|r, you will see him located directly to the left near the crystal.\n\n|cFFFFD700Dark Keeper Pelver|r is located in |cFFFFD700The Domicile|r. For quicker access, you can take any of the mole machines and click |cFFFFD700Into the Domicile|r and he will be on top of it.\n\n|cFFFFD700Dark Keeper Uggel|r is quite a close walk; go outside the vault room and turn right to the last room. He is near the entrance where all the golems are.\n\n|cFFFFD700Dark Keeper Vorfalk|r is located at the |cFFFFD700Grim Guzzler|r. When you first enter the room after coming from the bridge, he will be located on your right side in the corner (in front of the band's playing spot).\n\n|cFFFFD700Dark Keeper Zimrel|r is located on the second floor of the |cFFFFD700Ring of Law|r. When entering this floor from the |cFFFFD700East Garrison|r (room with the Shadowforge Lock), you will go around to your right and he will be sitting in the middle of the seats.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "检查遗物宝箱房前的画像。打开它会告诉你所需黑暗守护者的名字及其位置。每次重置只会刷新一个。\n\n|cff3399ff黑暗守护者：|r\n\n|cFFFFD700黑暗守护者贝塞克|r 会在你打开画像后立刻刷新在宝库房间内。\n\n|cFFFFD700黑暗守护者奥夫古特|r 位于|cFFFFD700安格弗将军|r的房间。当你走下楼梯正对|cFFFFD700安格弗将军|r时，会看到他就在左侧水晶附近。\n\n|cFFFFD700黑暗守护者佩尔弗|r 位于|cFFFFD700居所|r。为更快到达，你可以乘坐任意钻探机并点击|cFFFFD700前往居所|r，他就会在顶部。\n\n|cFFFFD700黑暗守护者乌格尔|r 距离很近；走出宝库房间后右转，走到最后一个房间。他就在所有魔像聚集的入口附近。\n\n|cFFFFD700黑暗守护者沃法克|r 位于|cFFFFD700黑铁酒吧|r。当你从桥那边第一次进入该房间时，他会在你右侧的角落里（乐队演奏处前方）。\n\n|cFFFFD700黑暗守护者兹姆雷尔|r 位于|cFFFFD700法律之环|r的二层。从|cFFFFD700东部兵营|r（有暗炉锁的房间）进入这一层后，向右绕行，他会坐在座位区中间。",
							-- TODO: tw = "",
						},
					}),
					["crs"] = {
						9438,	-- Dark Keeper Bethek
						9442,	-- Dark Keeper Ofgut
						9443,	-- Dark Keeper Pelver
						9439,	-- Dark Keeper Uggel
						9437,	-- Dark Keeper Vorfalk
						9441,	-- Dark Keeper Zimrel
					},
					["groups"] = {
						o(160845, {	-- Dark Coffer
							["sharedDescription"] =
								-- #if BEFORE 4.0.3
								"Is used to turn in Librams.",
								-- #else
								"Was used to turn in Librams prior to Cataclysm, is now without any purpose.",
								-- #endif
							["cost"] = { { "i", 11197, 1 } },	-- Dark Keeper Key
							["groups"] = {
								i(11752),	-- Black Blood of the Tormented
								i(11751),	-- Burning Essence
								i(11753),	-- Eye of Kajal
							},
						}),
						i(11197),	-- Dark Keeper Key
					},
				}),
				e(378, {	-- General Angerforge
					["creatureID"] = 9033,
					["groups"] = {
						i(11464),	-- Marshal Windsor's Lost Information
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227948, {	-- Angerforge's Battle Axe
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11816, {	-- Angerforge's Battle Axe
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if AFTER 7.3.2
						i(11932),	-- Guiding Stave of Wisdom
						-- #endif
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227940, {	-- Lord General's Sword
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11817, {	-- Lord General's Sword
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if AFTER 7.3.2
						i(12557, {	-- Ebonsteel Spaulders
							["timeline"] = { REMOVED_4_0_3, ADDED_8_1_0 },
						}),
						-- #endif
						i(11820),	-- Royal Decorated Armor
						i(11821),	-- Warstrife Leggings
						i(11810),	-- Force of Will
						-- #if BEFORE 1.13.5
						i(11815),	-- Hand of Justice
						-- #endif
					},
				}),
				e(379, {	-- Golem Lord Argelmach
					["creatureID"] = 8983,
					["groups"] = {
						i(11268),	-- Head of Argelmach
						i(11465),	-- Marshal Windsor's Lost Information
						applyclassicphase(TBC_PHASE_ONE, i(21956, {	-- Design: Dark Iron Scorpid (RECIPE!)
							["timeline"] = { ADDED_2_0_5 },
						})),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227964, {	-- Luminary Kilt
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11823, {	-- Luminary Kilt
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227965, {	-- Omnicast Boots
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11822, {	-- Omnicast Boots
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11669),	-- Naglering
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227967, {	-- Second Wind
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11819, {	-- Second Wind
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
					},
				}),
				e(380, {	-- Hurley Blackbreath
					["creatureID"] = 9537,
					["provider"] = { "o", 164911 },	-- Thunderbrew Lager Keg
					["description"] = createLocalizationString({
						readable = "Break the 3 Thunderbrew Lager Kegs to start the encounter.",
						constant = "BREAK_THE_3_THUNDERBREW_LAGER_KEGS_TO_START_THE",
						export = true,
						text = {
							en = "Break the 3 Thunderbrew Lager Kegs to start the encounter.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "打破 3 个雷酒淡啤酒桶即可开始战斗。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(11312),	-- Lost Thunderbrew Recipe
						-- #if AFTER 7.3.2
						i(11922),	-- Blood-Etched Blade
						-- #endif
						i(18044),	-- Hurley's Tankard
						i(11735),	-- Ragefury Eyepatch
						i(151408, {	-- Dark Iron Dredger's Pauldrons
							["timeline"] = { ADDED_7_3_0 },
						}),
						i(151407, {	-- Blackened Pit Trousers
							["timeline"] = { ADDED_7_3_0 },
						}),
						i(18043),	-- Coal Miner Boots
						applyclassicphase(PHASE_FIVE, i(22275)),	-- Firemoss Boots
					},
				}),
				e(9543, {	-- Ribbly Screwspigot
					["creatureID"] = 9543,
					["description"] = createLocalizationString({
						readable = "Speak to him to start the encounter.",
						constant = "SPEAK_TO_HIM_TO_START_THE_ENCOUNTER",
						export = true,
						text = {
							en = "Speak to him to start the encounter.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与他交谈以开始战斗。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(11313),	-- Ribbly's Head
						i(11612),	-- Plans: Dark Iron Plate (RECIPE!)
						i(2663, {	-- Ribbly's Bandolier
							["timeline"] = { REMOVED_4_0_1 },
						}),
						i(2662, {	-- Ribbly's Quiver
							["timeline"] = { REMOVED_4_0_1 },
						}),
						i(11742),	-- Wayfarer's Knapsack
					},
				}),
				e(383, {	-- Plugger Spazzring
					["creatureID"] = 9499,
					["groups"] = {
						i(18653),	-- Schematic: Goblin Jumper Cables XL (RECIPE!)
						i(12791),	-- Barman Shanker
						i(12793),	-- Mixologist's Tunic
						i(151410, {	-- Bottle-Popper Ring
							["timeline"] = { ADDED_7_3_0 },
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_THREE, i(220168, {	-- Triple-Brewed Molten Lager
							["timeline"] = { ADDED_1_15_2 },
						})),
						-- #endif
					},
				}),
				applyclassicphase(TBC_PHASE_FOUR, n(28067, {	-- Dark Iron Brewer
					["description"] = createLocalizationString({
						readable = "Speak to him until he passes out, a Mug will appear on the ground",
						constant = "SPEAK_TO_HIM_UNTIL_HE_PASSES_OUT_A_MUG_WILL",
						export = true,
						text = {
							en = "Speak to him until he passes out, a Mug will appear on the ground",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "与他交谈直到他醉倒，地上会出现一个酒杯。",
							-- TODO: tw = "",
						},
					}),
					["timeline"] = { ADDED_2_4_3 },
					["groups"] = {
						o(190394, {	-- Mug of Dire Brew
							i(38320),	-- Dire Brew
						}),
					},
				})),
				e(381, {	-- Phalanx
					["creatureID"] = 9502,
					["description"] = createLocalizationString({
						readable = "Private Rocknot must be sent into a drunken rage to aggro Phalanx.\nTo do that, give him 6 dark iron ale mugs, which can be bought from Plugger Spazzring.\nRocknot will break one of the kegs, it'll blow the door open and Phalanx will be angry.",
						constant = "PRIVATE_ROCKNOT_MUST_BE_SENT_INTO_A_DRUNKEN",
						export = true,
						text = {
							en = "Private Rocknot must be sent into a drunken rage to aggro Phalanx.\nTo do that, give him 6 dark iron ale mugs, which can be bought from Plugger Spazzring.\nRocknot will break one of the kegs, it'll blow the door open and Phalanx will be angry.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "必须让列兵罗克诺特陷入醉酒的暴怒，才能引到法拉克斯。\n为此，给他 6 个黑铁酒杯，这些可以从普拉格·斯帕兹林处购买。\n罗克诺特会打破其中一只酒桶，把门炸开，法拉克斯就会发怒。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(11744),	-- Bloodfist
						i(11743, {	-- Rockfist
							-- #if BEFORE 10.1.7
							-- #if AFTER 2.0.1
							["description"] = "~L.THIS_ITEM_APPEARS_TO_HAVE_BEEN_REMOVED_WITH_TBC",
							["isBounty"] = true,
							-- #endif
							-- #endif
							["timeline"] = { REMOVED_2_0_1, ADDED_10_1_7 },
						}),
						-- #if BEFORE 7.3.2
						i(11746),	-- Golem Skull Helm
						-- #endif
						applyclassicphase(PHASE_FIVE, i(22212)),	-- Golem Fitted Pauldrons
						applyclassicphase(PHASE_FIVE, i(22204)),	-- Wristguards of Renown
						i(11745),	-- Fists of Phalanx
						i(151409, {	-- Ferrous Cord
							["timeline"] = { ADDED_7_3_0 },
						}),
					},
				}),
				e(384, {	-- Ambassador Flamelash
					["creatureID"] = 9156,
					["groups"] = {
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227934, {	-- Flame Wrath
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227973, {	-- Circle of Flame
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227970, {	-- Cape of the Fire Salamander
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227971, {	-- Molten Fists
							["timeline"] = { ADDED_1_15_3 },
						})),
						applyclassicphase(SOD_PHASE_FOUR, i(227972, {	-- Burst of Knowledge
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11809, {	-- Flame Wrath
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11808, {	-- Circle of Flame
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11812, {	-- Cape of the Fire Salamander
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11814, {	-- Molten Fists
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11832, {	-- Burst of Knowledge
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
					},
				}),
				n(8923, {	-- Panzor the Invincible
					["description"] = "~L.THIS_IS_A_RARE_CREATURE_AND_AS_SUCH_IS_NOT",
					["groups"] = {
						i(11786),	-- Stone of the Earth
						i(11785),	-- Rock Golem Bulwark
						i(11787),	-- Shalehusk Boots
						applyclassicphase(PHASE_FIVE, i(22245)),	-- Soot Encrusted Footwear
					},
				}),
				e(385, {	-- The Seven
					["creatureID"] = 9039,	-- Doom'rel
					["provider"] = { "o", 169243 },	-- Chest of The Seven
					["modelScale"] = 3,
					["groups"] = {
						-- #if BEFORE 7.3.2
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227963, {	-- Blood-Etched Blade
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11922, {	-- Blood-Etched Blade
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #endif
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227960, {	-- Impervious Giant
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11921, {	-- Impervious Giant
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11923),	-- The Hammer of Grace
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227941, {	-- Wraith Scythe
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11920, {	-- Wraith Scythe
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227958, {	-- Ghostshroud
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11925, {	-- Ghostshroud
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227956, {	-- Deathdealer Breastplate
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11926, {	-- Deathdealer Breastplate
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11929),	-- Haunting Specter Leggings
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227959, {	-- Legplates of the Eternal Guardian
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11927, {	-- Legplates of the Eternal Guardian
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
					},
				}),
				e(386, {	-- Magmus
					["creatureID"] = 9938,
					["groups"] = {
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227974, {	-- Lavastone Hammer
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						applyclassicphase(PHASE_FIVE, i(22208, {	-- Lavastone Hammer
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						})),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227978, {	-- Magmus Stone
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11935, {	-- Magmus Stone
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						i(11746),	-- Golem Skull Helm
						i(151411, {	-- Molten-Warden Leggings
							["timeline"] = { ADDED_7_3_0 },
						}),
						i(22275),	-- Firemoss Boots
						applyclassicphase(PHASE_FIVE, i(22400, {	-- Libram of Truth
							["timeline"] = { DELETED_5_0_4 },
						})),
						applyclassicphase(PHASE_FIVE, i(22395, {	-- Totem of Rage
							["timeline"] = { DELETED_5_0_4 },
						})),
					},
				}),
				-- #if BEFORE 7.3.2
				n(8929, {	-- Princess Moira Bronzebeard <Princess of Ironforge> / Thaurissan High Priest
					["description"] = createLocalizationString({
						readable = "In order to be eligible for this loot, you need to have completed The Fate of the Kingdom or The Royal Rescue. (Removed in 4.0.3)",
						constant = "IN_ORDER_TO_BE_ELIGIBLE_FOR_THIS_LOOT_YOU_NEED",
						export = true,
						text = {
							en = "In order to be eligible for this loot, you need to have completed The Fate of the Kingdom or The Royal Rescue. (Removed in 4.0.3)",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "要获得这件战利品，你需要完成“王国的命运”或“王室救援”。（4.0.3 中移除）",
							-- TODO: tw = "",
						},
					}),
					["sourceQuests"] = {
						4362,	-- The Fate of the Kingdom
						4003,	-- The Royal Rescue
					},
					["groups"] = {
						i(12557, {	-- Ebonsteel Spaulders
							["timeline"] = { REMOVED_4_0_3, ADDED_8_1_0 },
						}),
						i(12554, {	-- Hands of the Exalted Herald
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
						i(12556, {	-- High Priestess Boots
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
						i(12553, {	-- Swiftwalker Boots
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
					},
				}),
				-- #endif
				e(387, {	-- Emperor Dagran Thaurissan
					["creatureID"] = 9019,
					["groups"] = {
						ach(642),	-- Blackrock Depths
						ach(5051, {	-- Blackrock Depths Guild Run
							["timeline"] = { ADDED_4_0_3 },
						}),
						i(246429, {	-- Dark Iron Chandelier (DECOR!)
							["timeline"] = { ADDED_11_2_7 },
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227981, {	-- Dreadforge Retaliatior
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11931, {	-- Dreadforge Retaliatior
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if BEFORE 7.3.2
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227982, {	-- Guiding Stave of Wisdom
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11932, {	-- Guiding Stave of Wisdom
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #endif
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227991, {	-- Ironfoe
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11684, {	-- Ironfoe
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227984, {	-- Thaurissan's Royal Scepter
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11928, {	-- Thaurissan's Royal Scepter
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227988, {	-- Imperial Jewel
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11933, {	-- Imperial Jewel
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227985, {	-- The Emperor's New Cape
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11930, {	-- The Emperor's New Cape
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227980, {	-- Robes of the Royal Crown
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11924, {	-- Robes of the Royal Crown
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227986, {	-- Wristguards of Renown
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						applyclassicphase(PHASE_FIVE, i(22204, {	-- Wristguards of Renown
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						})),
						-- #if AFTER 7.3.2
						i(12554, {	-- Hands of the Exalted Herald
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
						-- #endif
						-- #if BEFORE 1.13.5
						i(16724, {	-- Lightforge Gauntlets
							["timeline"] = { REMOVED_4_0_3 },
						}),
						-- #endif
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227987, {	-- Sash of the Grand Hunt
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						applyclassicphase(PHASE_FIVE, i(22207, {	-- Sash of the Grand Hunt
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						})),
						-- #if AFTER 7.3.2
						i(12556, {	-- High Priestess Boots
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
						i(12553, {	-- Swiftwalker Boots
							["timeline"] = { REMOVED_4_0_3, ADDED_7_3_2 },
						}),
						-- #endif
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(227983, {	-- Dark Iron Seal
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11934),	-- Emperor's Seal
						-- #if AFTER 1.13.5
						-- #if SEASON_OF_DISCOVERY
						applyclassicphase(SOD_PHASE_FOUR, i(228722, {	-- Hand of Justice
							["timeline"] = { ADDED_1_15_3 },
						})),
						-- #endif
						i(11815, {	-- Hand of Justice
							-- #if SEASON_OF_DISCOVERY
							["timeline"] = { REMOVED_1_15_3 },
							-- #endif
						}),
						-- #endif
						i(12033),	-- Thaurissan Family Jewels
					},
				}),
			}),
		},
	}),
}));

