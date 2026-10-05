-----------------------------------------------------
--     W O R L D   E V E N T S   M O D U L E       --
-----------------------------------------------------

root(ROOTS.WorldEvents, n(EXPANSION_PRELAUNCH, {
	expansion(EXPANSION.LEGION, {
		["lvl"] = 98,
		["forcetimeline"] = { ADDED_7_0_3, REMOVED_7_0_3 },
		["groups"] = {
			n(ACHIEVEMENTS, {
				ach(11201, {		-- Defender of Azeroth: Legion Invasions
					["timeline"] = { ADDED_7_0_3, REMOVED_7_0_3_LAUNCH },
				}),
				ach(11065, {		-- It All Makes Sense Now
					["timeline"] = { ADDED_7_0_3, REMOVED_7_0_3_LAUNCH },
				}),
				ach(11200, {		-- Stand Against the Legion
					["timeline"] = { ADDED_7_0_3, REMOVED_7_0_3_LAUNCH },
				}),
			}),
			n(MAILBOX, {
				["description"] = createLocalizationString({
					readable = "These items came automatically in the mail box (sometimes even pre-equipped), once the pre-expansion patch launched due to class & ability changes.",
					constant = "THESE_ITEMS_CAME_AUTOMATICALLY_IN_THE_MAIL_BOX",
					export = true,
					text = {
						en = "These items came automatically in the mail box (sometimes even pre-equipped), once the pre-expansion patch launched due to class & ability changes.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这些物品在资料片前夕补丁上线时因职业和技能改动而自动通过邮箱发放（有时甚至已经装备好）。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(140694, {	-- Brewmasher's Staff
						["description"] = createLocalizationString({
							readable = "Given to Monks.",
							constant = "GIVEN_TO_MONKS",
							export = true,
							text = {
								en = "Given to Monks.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "发放给武僧。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(140715, {	-- Frost-Etched Runeblade
						["description"] = createLocalizationString({
							readable = "Given to Death Knights.",
							constant = "GIVEN_TO_DEATH_KNIGHTS",
							export = true,
							text = {
								en = "Given to Death Knights.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "给予死亡骑士。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(140716, {	-- Guardian's Oaken Spear
						["modID"] = 1,
						["description"] = createLocalizationString({
							readable = "Given to Druids.",
							constant = "GIVEN_TO_DRUIDS",
							export = true,
							text = {
								en = "Given to Druids.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "给予德鲁伊。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(140716, {	-- Guardian's Oaken Spear
						["modID"] = 3,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140716, {	-- Guardian's Oaken Spear
						["modID"] = 5,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140716, {	-- Guardian's Oaken Spear
						["modID"] = 6,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140712, {	-- Greataxe of Fury
						["description"] = createLocalizationString({
							readable = "Given to Warriors.",
							constant = "GIVEN_TO_WARRIORS",
							export = true,
							text = {
								en = "Given to Warriors.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "给予战士。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(140689, {	-- Pike of Feral Rage
						["modID"] = 1,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140689, {	-- Pike of Feral Rage
						["modID"] = 3,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140689, {	-- Pike of Feral Rage
						["modID"] = 5,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140689, {	-- Pike of Feral Rage
						["modID"] = 6,
						["description"] = "~L.GIVEN_TO_DRUIDS",
					}),
					i(140718, {	-- Survivalist's Hunting Spear
						["modID"] = 1,
						["description"] = createLocalizationString({
							readable = "Given to Hunters.",
							constant = "GIVEN_TO_HUNTERS",
							export = true,
							text = {
								en = "Given to Hunters.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "给予猎人。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(140718, {	-- Survivalist's Hunting Spear
						["modID"] = 3,
						["description"] = "~L.GIVEN_TO_HUNTERS",
					}),
					i(140718, {	-- Survivalist's Hunting Spear
						["modID"] = 5,
						["description"] = "~L.GIVEN_TO_HUNTERS",
					}),
					i(140718, {	-- Survivalist's Hunting Spear
						["modID"] = 6,
						["description"] = "~L.GIVEN_TO_HUNTERS",
					}),
					i(140696, {	-- Sword of the Singing Wind
						["description"] = "~L.GIVEN_TO_MONKS",
					}),
				},
			}),
			i(139048, {	-- Small Legion Chest
				f(CLOTH, {
					i(138184),	-- Fel-Infused Helm
					i(138186),	-- Fel-Infused Spaulders
					i(138187),	-- Fel-Infused Hauberk
					i(138181),	-- Fel-Infused Bracers
					i(138182),	-- Fel-Infused Grips
					i(138180),	-- Fel-Infused Cinch
					i(138185),	-- Fel-Infused Leggings
					i(138183),	-- Fel-Infused Boots
				}),
				f(LEATHER, {
					i(138167),	-- Felshroud Hood
					i(138168),	-- Felshroud Shoulders
					i(138192),	-- Felshroud Vest
					i(138163),	-- Felshroud Bindings
					i(138166),	-- Felshroud Gloves
					i(138169),	-- Felshroud Belt
					i(138165),	-- Felshroud Pants
					i(138164),	-- Felshroud Boots
				}),
				f(MAIL, {
					i(138176),	-- Fel-Chain Helm
					i(138178),	-- Fel-Chain Spaulders
					i(138179),	-- Fel-Chain Hauberk
					i(138173),	-- Fel-Chain Bracers
					i(138174),	-- Fel-Chain Grips
					i(138172),	-- Fel-Chain Cinch
					i(138177),	-- Fel-Chain Leggings
					i(138175),	-- Fel-Chain Boots
				}),
				f(PLATE, {
					i(138155),	-- Felforged Helmet
					i(138157),	-- Felforged Pauldrons
					i(138152),	-- Felforged Chestplate
					i(138159),	-- Felforged Vambracers
					i(138153),	-- Felforged Gauntlets
					i(138154),	-- Felforged Waistplate
					i(138156),	-- Felforged Legplates
					i(138158),	-- Felforged Warboots
				}),
				n(WEAPONS, {
					i(141597),	-- Corrupted Argus Gavel
					i(141609),	-- Corrupted Argus Gavel	-- Non Upgrade Version	-- Was posted here already - Gold 14.04.2019
					i(141595),	-- Eredar Battle Blade
					i(141607),	-- Eredar Battle Blade	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
					i(141602),	-- Eredar Splitter
					i(141614),	-- Eredar Splitter	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
					i(141599),	-- Fel Barbed Spear
					i(141611),	-- Fel Barbed Spear	-- Non Upgrade Version	-- Dropped below a certain level, somebody on discord posted having it around end of 2018, early 2019)
					i(141594),	-- Fel Hacker
					i(141606),	-- Fel Hacker	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
					i(141603),	-- Fel Lord's Warmace
					i(141615),	-- Fel Lord's Warmace	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
					i(141604),	-- Glaive of the Fallen
					i(141601),	-- Hellfury Longbow
					i(141613),	-- Hellfury Longbow	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
					i(141616),	-- Inquisitor's Wand
					i(141617),	-- Inquisitor's Wand	-- Non Upgrade Version	-- Dropped below a certain level - My Priest has it - Gold 14.04.2019)
					i(141600),	-- Wyrmtongue Spiteblade
					i(141612),	-- Wyrmtongue Spiteblade	-- Non Upgrade Version	-- Probably similar to other Non Upgrade Items
				}),
			}),
			i(139049, {	-- Large Legion Chest
				["sym"] = {{"select", "itemID",139048},{"pop"}},	-- Small Legion Chest
			}),
			n(QUESTS, {
				-- Weren't all repeatable quests just HQTs? - Darkal
				q(43298, { ["isRepeatable"] = true, }),	-- Defend (Azshara)
				q(43291, { ["isRepeatable"] = true, }),	-- Defend (Dun Morogh)
				q(43296, { ["isRepeatable"] = true, }),	-- Defend (Hillsbrad Foothills)
				q(43289, { ["isRepeatable"] = true, }),	-- Defend (Northern Barrens)
				q(43293, { ["isRepeatable"] = true, }),	-- Defend (Tanaris)
				q(43287, { ["isRepeatable"] = true, }),	-- Defend (Westfall)
				q(43299, { ["isRepeatable"] = true, }),	-- Demon Commander (Azshara)
				q(43283, { ["isRepeatable"] = true, }),	-- Demon Commander (Dun Morogh)
				q(43286, { ["isRepeatable"] = true, }),	-- Demon Commander (Hillsbrad Foothills)
				-- q(xxxxx, { ["isRepeatable"] = true, }),	Demon Commander (Northern Barrens) - try to find ID
				q(43243, { ["isRepeatable"] = true, }),	-- Demon Commander (Tanaris)
				q(43242, { ["isRepeatable"] = true, }),	-- Demon Commander (Westfall)
				q(44184, {	-- In the Blink of an Eye
					-- #if AFTER SL
					["description"] = createLocalizationString({
						readable = "This is available to players choosing the Legion Timeline during Chromie Time.",
						constant = "THIS_IS_AVAILABLE_TO_PLAYERS_CHOOSING_THE",
						export = true,
						text = {
							en = "This is available to players choosing the Legion Timeline during Chromie Time.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此内容对在克罗米时间线中选择《军团再临》时间线的玩家开放。",
							-- TODO: tw = "",
						},
					}),
					["timeline"] = { ADDED_7_0_3, REMOVED_7_0_3, ADDED_9_0_1 },
					-- TODO: confirm if this can somehow be picked up via Party Sync
					["DisablePartySync"] = false,	-- false = "hasn't been verified yet"
					-- #endif
					["sourceQuests"] = {
						44500,	-- Author! Author!
						43926,	-- Legion: The Legion Returns
					},
					["sourceQuestNumRequired"] = 1,
					["qg"] = 114562,	-- Khadgar's Upgraded Servant
					["groups"] = {
						i(140192),	-- Dalaran Heartstone (TOY!)
						i(143780),	-- Tome of the Tranquil Mind
					},
				}),
				q(42804, { ["isRepeatable"] = true, }),	-- Invasion: Azshara
				q(43301, { ["isRepeatable"] = true, }),	-- Invasion: Azshara
				q(43284, { ["isRepeatable"] = true, }),	-- Invasion: Dun Morogh
				q(42803, { ["isRepeatable"] = true, }),	-- Invasion: Dun Morogh
				q(43285, { ["isRepeatable"] = true, }),	-- Invasion: Hillsbrad Foothills
				q(42805, { ["isRepeatable"] = true, }),	-- Invasion: Hillsbrad Foothills
				q(43282, { ["isRepeatable"] = true, }),	-- Invasion: Northern Barrens
				q(42236, { ["isRepeatable"] = true, }),	-- Invasion: Northern Barrens
				q(43244, { ["isRepeatable"] = true, }),	-- Invasion: Tanaris
				q(42237, { ["isRepeatable"] = true, }),	-- Invasion: Tanaris
				q(43245, { ["isRepeatable"] = true, }),	-- Invasion: Westfall
				q(42235, { ["isRepeatable"] = true, }),	-- Invasion: Westfall
				q(40661, {	-- Protect the Home Front (A)
					["qg"] = 101004,	-- Elerion Bladedancer
					["coord"] = { 40.4, 77.8, STORMWIND_CITY },
					["races"] = ALLIANCE_ONLY,
				}),
				q(44092, {	-- Protect the Home Front (H)
					["qg"] = 95234,	-- Elthyn Da'rai
					["coord"] = { 52.6, 56.2, ORGRIMMAR },
					["races"] = HORDE_ONLY,
				}),
				q(43300, { ["isRepeatable"] = true, }),	-- Repel (Azshara)
				q(43292, { ["isRepeatable"] = true, }),	-- Repel (Dun Morogh)
				q(43297, { ["isRepeatable"] = true, }),	-- Repel (Hillsbrad Foothills)
				q(43290, { ["isRepeatable"] = true, }),	-- Repel (Northern Barrens)
				q(43294, { ["isRepeatable"] = true, }),	-- Repel (Tanaris)
				q(43288, { ["isRepeatable"] = true, }),	-- Repel (Westfall)
			}),
			n(RARES, {
				n(112527, {	-- Doomsayer
					["description"] = createLocalizationString({
						readable = "This Toy, Pocket Fel Spreader is available EXCLUSIVELY during the Legion pre-expansion event. It is obtained by using any ability or item that allows you to detect demons, and then speaking to a Doomsayer. \nWhen using any such ability or item, the Doomsayer will sometimes have the dialogue option \"There's something not quite right about you...\". Selecting this option, when visible, will change the Doomsayer into a Dread Infiltrator, which can be killed and looted to obtain this Toy. Note that the Toy is NOT a guaranteed drop, but has a roughly 25% drop rate.",
						constant = "THIS_TOY_POCKET_FEL_SPREADER_IS_AVAILABLE",
						export = true,
						text = {
							en = "This Toy, Pocket Fel Spreader is available EXCLUSIVELY during the Legion pre-expansion event. It is obtained by using any ability or item that allows you to detect demons, and then speaking to a Doomsayer. \nWhen using any such ability or item, the Doomsayer will sometimes have the dialogue option \"There's something not quite right about you...\". Selecting this option, when visible, will change the Doomsayer into a Dread Infiltrator, which can be killed and looted to obtain this Toy. Note that the Toy is NOT a guaranteed drop, but has a roughly 25% drop rate.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此玩具“口袋邪能喷洒器”仅在军团再临前夕事件期间开放。使用任何可以侦测恶魔的技能或物品，然后与末日预言者交谈即可获得。 \n使用此类技能或物品时，末日预言者有时会出现对话选项“你身上有点不对劲……”。在可见时选择此选项，会将末日预言者变成恐惧渗透者，击杀并拾取它即可获得此玩具。请注意，此玩具并非必掉，掉率约为 25%。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(140363),	-- Pocket Fel Spreader (TOY!)
					},
				}),
				n(112198, {	-- Doomsayer
					["description"] = createLocalizationString({
						readable = "This Toy, Pocket Fel Spreader is available EXCLUSIVELY during the Legion pre-expansion event. It is obtained by using any ability or item that allows you to detect demons, and then speaking to a Doomsayer. \nWhen using any such ability or item, the Doomsayer will sometimes have the dialogue option \"There's something not quite right about you...\". Selecting this option, when visible, will change the Doomsayer into a Dread Infiltrator, which can be killed and looted to obtain this Toy. Note that the Toy is NOT a guaranteed drop, but has a roughly 25% drop rate.\n",
						constant = "THIS_TOY_POCKET_FEL_SPREADER_IS_AVAILABLE_2",
						export = true,
						text = {
							en = "This Toy, Pocket Fel Spreader is available EXCLUSIVELY during the Legion pre-expansion event. It is obtained by using any ability or item that allows you to detect demons, and then speaking to a Doomsayer. \nWhen using any such ability or item, the Doomsayer will sometimes have the dialogue option \"There's something not quite right about you...\". Selecting this option, when visible, will change the Doomsayer into a Dread Infiltrator, which can be killed and looted to obtain this Toy. Note that the Toy is NOT a guaranteed drop, but has a roughly 25% drop rate.\n",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此玩具“口袋邪能喷洒器”仅在军团再临前夕事件期间开放。使用任何可以侦测恶魔的技能或物品，然后与末日预言者交谈即可获得。 \n使用此类技能或物品时，末日预言者有时会出现对话选项“你身上有点不对劲……”。在可见时选择此选项，会将末日预言者变成恐惧渗透者，击杀并拾取它即可获得此玩具。请注意，此玩具并非必掉，掉率约为 25%。\n",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(140363),	-- Pocket Fel Spreader (TOY!)
					},
				}),
			}),
			n(VENDORS, {
				n(109912, {	-- Captive Wyrmtongue <Reluctant 'Quartermaster'>
					["coords"] = {
						{ 52.6, 57.6, ORGRIMMAR },
						{ 41.2, 78.8, STORMWIND_CITY },
					},
					["timeline"] = { ADDED_7_0_3 },
					["groups"] = {
						i(136924),	-- Felbat Pup (PET!)
						i(141604),	-- Glaive of the Fallen
						i(142526),	-- Glaive of the Fallen (this 2nd version was seen in game Oct 2020)
						i(138160),	-- Infernal Cord
						i(139172),	-- Legionnaire's Fel Pendant
						i(138188),	-- Demon Commander's Drape
						i(138162),	-- Legion Bound Ring
						i(139173),	-- Nether Twisted Band
						i(138170),	-- Felstalker Spine
						i(138171),	-- Inquisitor's Talisman
						i(138161),	-- Mo'arg Clan Token
						iensemble(139170),	-- Ensemble: Fel-Infused Cloth Armor
						iensemble(139169),	-- Ensemble: Felshroud Lather Armor
						iensemble(139168),	-- Ensemble: Fel-Chain Mail Armor
						iensemble(139167),	-- Ensemble: Felforged Plate Armor
					},
				}),
			}),
			n(ZONE_DROPS, {
				n(112315, {	-- Dread Infiltrator
					["description"] = createLocalizationString({
						readable = "Players with some sort of Sense Demons ability could get this mob to spawn from Doomsayers.",
						constant = "PLAYERS_WITH_SOME_SORT_OF_SENSE_DEMONS_ABILITY",
						export = true,
						text = {
							en = "Players with some sort of Sense Demons ability could get this mob to spawn from Doomsayers.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "拥有某种感知恶魔能力的玩家可以让这个怪物从末日预言者身上刷新。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(140363),	-- Pocket Fel Spreader (TOY!)
					},
				}),
			}),
		},
	}),
}));
