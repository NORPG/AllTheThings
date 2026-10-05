---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KUL_TIRAS, bubbleDown({ ["timeline"] = { ADDED_8_2_0 } }, {
	m(MECHAGON, {
		n(RARES, {
			n(COMMON_BOSS_DROPS, {
				i(168908, {	-- Blueprint: Experimental Adventurer Augment
					["description"] = createLocalizationString({
						readable = "This blueprint will drop from the first rare you kill once you've reached Neutral with the Rustbolt Resistance.",
						constant = "THIS_BLUEPRINT_WILL_DROP_FROM_THE_FIRST_RARE",
						export = true,
						text = {
							en = "This blueprint will drop from the first rare you kill once you've reached Neutral with the Rustbolt Resistance.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "当你的锈栓抵抗军声望达到中立后，这张图纸会从你击杀的第一只稀有生物身上掉落。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(168327),	-- Chain Ignitercoil
			}),
			--[[
				R33-DR - 63.4, 57.0 interactive "data analyzer" npc. Possibly part of a puzzle?
			]]--
			-- TODO:  See Hidden Quest Triggers.lua for remaining first kill id's needed
			n(150306, {	-- Drill Rig
				["description"] = createLocalizationString({
					readable = "These rares are only available when the Drill Rig is an active construction project. Speak to |Cff00991aWaren Gearheart|r |Cffffffff(73.0, 33.5)|r to see which construction projects are available.\r\rEach rare spawn is accompanied by a specific zonewide announcement. Hover over each rare in the list to see its announcement.",
					constant = "THESE_RARES_ARE_ONLY_AVAILABLE_WHEN_THE_DRILL",
					export = true,
					text = {
						en = "These rares are only available when the Drill Rig is an active construction project. Speak to |Cff00991aWaren Gearheart|r |Cffffffff(73.0, 33.5)|r to see which construction projects are available.\r\rEach rare spawn is accompanied by a specific zonewide announcement. Hover over each rare in the list to see its announcement.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "只有在钻探机是进行中的建造项目时，这些稀有才会出现。与 |Cff00991a沃伦·齿轮之心|r |Cffffffff(73.0, 33.5)|r 交谈，查看当前可用的建造项目。\r\r每个稀有刷新时都会伴随一条特定的全区域公告。将鼠标悬停在列表中的每个稀有上即可查看其公告。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					n(153200, {	-- Boilburn
						["questID"] = 55857,	-- no second questID
						["coord"] = { 51.1, 50.4, MECHAGON },
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-JD41...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-JD41...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-JD41...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(167042),	-- Blueprint: Scrap Trap
							i(169691),	-- Vinyl: Depths of Ulduar
						},
					}),
					n(154739, {	-- Caustic Mechaslime
						["questID"] = 56368,
						["coords"] = {
							{ 66.5, 58.9, MECHAGON },	-- Cave Entrance
							-- { 51.3, 47.8, MECHAGON },
						},
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you this message in chat \"|cffe1780cDrill Rig DR-CC73...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_THIS_MESSAGE_IN_CHAT",
							export = true,
							text = {
								en = "Spawning when you this message in chat \"|cffe1780cDrill Rig DR-CC73...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-CC73...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(169170),	-- Blueprint: Utility Mechanoclaw
						},
					}),
					n(150342, {	-- Earthbreaker Gulroc
						["questID"] = 55814,
						["coord"] = { 63.9, 24.4, MECHAGON },
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-TR35...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT_2",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-TR35...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-TR35...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(167042),	-- Blueprint: Scrap Trap
						},
					}),
					n(153205, {	-- Gemicide
						["questID"] = 55855,
						["coord"] = { 57.6, 69.2, MECHAGON },
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-JD99...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT_3",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-JD99...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-JD99...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(169691),	-- Vinyl: Depths of Ulduar
						},
					}),
					n(154701, {	-- Gorged Gear-Cruncher
						["questID"] = 56367,
						["coords"] = {
							{ 73.2, 54.2, MECHAGON },	-- Cave Entrance
							-- { 51.3, 47.8, MECHAGON },
						},
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-CC61...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT_4",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-CC61...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-CC61...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(167846),	-- Blueprint: Mechano-Treat
						},
					}),
					n(153206, {	-- Ol' Big Tusk
						["questID"] = 55853,
						["coord"] = { 55.6, 39.5, MECHAGON },
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-TR28...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT_5",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-TR28...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-TR28...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(167846),	-- Blueprint: Mechano-Treat
							i(169691),	-- Vinyl: Depths of Ulduar
							i(170466),	-- Junkyard Motivator
						},
					}),
					n(152113, {	-- The Kleptoboss
						["questID"] = 55858,
						["coords"] = {
							{ 68.0, 48.0, MECHAGON },	-- Cave Entrance
							-- { 51.3, 47.8, MECHAGON },
						},
						["isDaily"] = true,
						["description"] = createLocalizationString({
							readable = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-CC88...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
							constant = "SPAWNING_WHEN_YOU_SEE_THIS_MESSAGE_IN_CHAT_6",
							export = true,
							text = {
								en = "Spawning when you see this message in chat \"|cffe1780cDrill Rig DR-CC88...|r,\" or activate the |cFFFFD700Drill Rig|r. Only available when the |cFFFFD700Drill Rig|r is a construction project.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "当你看到聊天中的这条消息“|cffe1780c钻井平台 DR-CC88...|r，”时刷新，或激活|cFFFFD700钻井平台|r。仅当|cFFFFD700钻井平台|r为建造项目时可用。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(169886),	-- Spraybot 0D (PET!)
						},
					}),
				},
			}),
			n(151934, {	-- Arachnoid Harvester
				["description"] = createLocalizationString({
					readable = "Both versions of Arachnoid Harvester (the current timeline and alternate timeline) drop the same loot and share a daily lockout. You can use a Personal Time Displacer to travel to the alternate timeline if Chromie is not in Rustbolt.",
					constant = "BOTH_VERSIONS_OF_ARACHNOID_HARVESTER_THE",
					export = true,
					text = {
						en = "Both versions of Arachnoid Harvester (the current timeline and alternate timeline) drop the same loot and share a daily lockout. You can use a Personal Time Displacer to travel to the alternate timeline if Chromie is not in Rustbolt.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "蛛形收割者的两个版本（当前时间线和替代时间线）掉落相同的战利品，并共享每日锁定。如果克罗米不在锈栓镇，你可以使用个人时光置换器前往替代时间线。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 55512,
				["isDaily"] = true,
				["coord"] = { 52.6, 41.0, MECHAGON },
				["crs"] = { 154342 },	-- Arachnoid Harvester (alt-time)
				["groups"] = {
					i(168823),	-- Rusty Mechanocrawler (MOUNT!)
				},
			}),
			n(150394, {	-- Armored Vaultbot
				["cr"] = 154968,	-- future ID
				["questID"] = 55546,
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "Kite it to the large magnet at |cFFFFD700Bondo's Scrapyard|r to make it vulnerable to kill it, or use the |cFFFFD700Armored Vaultbot Key|r to unlock it BEFORE it is engaged in combat. If you've time-traveled to the future, you must use a key to unlock it.",
					constant = "KITE_IT_TO_THE_LARGE_MAGNET_AT_CFFFFD700BONDO_S",
					export = true,
					text = {
						en = "Kite it to the large magnet at |cFFFFD700Bondo's Scrapyard|r to make it vulnerable to kill it, or use the |cFFFFD700Armored Vaultbot Key|r to unlock it BEFORE it is engaged in combat. If you've time-traveled to the future, you must use a key to unlock it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "将它风筝到|cFFFFD700邦多的废料场|r的大型磁铁处，使它变得脆弱以便击杀；或者在它进入战斗之前使用|cFFFFD700装甲保险库机器人钥匙|r解锁它。如果你穿越到了未来时间线，则必须使用钥匙才能解锁它。",
						-- TODO: tw = "",
					},
				}),
				["cost"] = { { "i", 167062, 1 } },	-- 1x Armored Vaultbot Key
				["coords"] = {
					{ 53.6, 46.4, MECHAGON },
					{ 53.8, 49.4, MECHAGON },
					{ 53.2, 49.7, MECHAGON },
				},
				["groups"] = {
					o(322020, {	-- Pile of Coins
						i(167843),	-- Blueprint: Vaultbot Key
						i(167796),	-- Paint Vial: Mechagon Gold
						i(170072),	-- Armored Vaultbot (PET!)
					}),
				},
			}),
			n(151308, {	-- Boggac Skullbash
				["questID"] = 55539,
				["coord"] = { 55.4, 25.9, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(169688),	-- Vinyl: Gnomeregan Forever
				},
			}),
			n(152001, {	-- Bonepicker
				["questID"] = 55537,
				["coord"] = { 65.8, 22.9, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(169392),	-- Bonebiter (PET!)
					i(167846),	-- Blueprint: Mechano-Treat
				},
			}),
			n(152569, {	-- Crazed Trogg
				["questID"] = 55812,
				["coord"] = { 82.3, 21.0, MECHAGON },
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "The trogg will yell a specific color. Go to Bondo's Yard |cFFFFFFFF(63.3, 42.5)|r to paint yourself that color, then return to his cave.",
					constant = "THE_TROGG_WILL_YELL_A_SPECIFIC_COLOR_GO_TO",
					export = true,
					text = {
						en = "The trogg will yell a specific color. Go to Bondo's Yard |cFFFFFFFF(63.3, 42.5)|r to paint yourself that color, then return to his cave.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "穴居人会喊出一种特定颜色。前往邦多的院子|cFFFFFFFF(63.3, 42.5)|r把自己染成那个颜色，然后回到他的洞穴。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					149847,	-- Crazed Trogg
					152570,	-- Crazed Trogg
				},
				["groups"] = {
					i(169674),	-- Green Paint Filled Bladder
					i(167792),	-- Paint Vial: Fel Mint Green
					i(169169),	-- Blueprint: Blue Spraybot
					i(169168),	-- Blueprint: Green Spraybot
					i(169167),	-- Blueprint: Orange Spraybot
					i(167793),	-- Paint Vial: Overload Orange
				},
			}),
			n(151569, {	-- Deepwater Maw
				["cr"] = 151558,	-- Hundred-Fathom Lure
				["questID"] = 55514,
				["coord"] = { 35.3, 43.0, MECHAGON },
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "Must complete the |cFFFFD700Let's Fish!|r questline to spawn Deepwater Maw. Summoning requires a |cffa335eeHundred-Fathom Lure|r.",
					constant = "MUST_COMPLETE_THE_CFFFFD700LET_S_FISH_R",
					export = true,
					text = {
						en = "Must complete the |cFFFFD700Let's Fish!|r questline to spawn Deepwater Maw. Summoning requires a |cffa335eeHundred-Fathom Lure|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "必须完成|cFFFFD700来钓鱼吧！|r任务线才能刷出深水巨喉。召唤需要|cffa335ee百噚诱饵|r。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(168804),	-- Powered Piscine Procurement Pole
					i(167836),	-- Blueprint: Canned Minnows
				},
			}),
			n(155060, {	-- Doppel Ganger
				["description"] = createLocalizationString({
					readable = "This rare only spawns when the |cFFFFD700Cogfrenzy's Construction Frenzy|r quest is active and requires three |cFF0070ddPressure Relief Valves|r to summon.",
					constant = "THIS_RARE_ONLY_SPAWNS_WHEN_THE",
					export = true,
					text = {
						en = "This rare only spawns when the |cFFFFD700Cogfrenzy's Construction Frenzy|r quest is active and requires three |cFF0070ddPressure Relief Valves|r to summon.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此稀有怪仅在 |cFFFFD700齿轮狂乱的建设狂潮|r 任务激活时刷新，并需要三个 |cFF0070dd泄压阀|r 才能召唤。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 56419,
				["coord"] = { 81.0, 20.2, MECHAGON },
				["cost"] = {{"i",169470,3}},	-- Pressure Relief Valve
				["isDaily"] = true,
				["groups"] = {
					i(168631),	-- Metal Detector
				},
			}),
			n(154153, {	-- Enforcer KX-T57
				["questID"] = 56207,
				["coord"] = { 55.4, 55.0, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(170466),	-- Junkyard Motivator
					i(170470),	-- Reinforced Grease Deflector
					i(170467),	-- Whirring Chainblade
					i(170468),	-- Supervolt Zapper
					i(169174),	-- Blueprint: Rustbolt Pocket Turret
				},
			}),
			n(151202, {	-- Foul Manifestation
				["questID"] = 55513,
				["coord"] = { 65.7, 51.7, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(167871),	-- Blueprint: G99.99 Landshark
				},
			}),
			n(151884, {	-- Fungarian Furor
				["description"] = createLocalizationString({
					readable = "When the |cFFFFD700Aid From Nordrassil|r quest is active, fly around the quest area and look for a mushroom with the NPC ID 135497. Clicking on that mushroom will spawn the rare. If no mushroom with that ID is up, you'll need to click on some other ones to try to get the correct one to respawn.",
					constant = "WHEN_THE_CFFFFD700AID_FROM_NORDRASSIL_R_QUEST",
					export = true,
					text = {
						en = "When the |cFFFFD700Aid From Nordrassil|r quest is active, fly around the quest area and look for a mushroom with the NPC ID 135497. Clicking on that mushroom will spawn the rare. If no mushroom with that ID is up, you'll need to click on some other ones to try to get the correct one to respawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当|cFFFFD700来自诺达希尔的援助|r任务激活时，在任务区域飞行，寻找 NPC ID 为 135497 的蘑菇。点击那个蘑菇会刷新稀有。如果没有该 ID 的蘑菇，你需要点击其他一些蘑菇，试着让正确的那一个刷新出来。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 55367,
				["isDaily"] = true,
				["coord"] = { 44.5, 41.1, MECHAGON },	-- center of quest area / area with mushrooms
				["crs"] = { 135497 },	-- Mushroom that spawns the rare
				["groups"] = {
					i(169379),	-- Snowsoft Nibbler
					i(167793),	-- Paint Vial: Overload Orange
				},
			}),
			n(153228, {	-- Gear Checker Cogstar	-- possibly 154184?
				["questID"] = 55852,
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "Random spawn when you kill |cFFFFD700Upgraded Sentries|r.",
					constant = "RANDOM_SPAWN_WHEN_YOU_KILL_CFFFFD700UPGRADED",
					export = true,
					text = {
						en = "Random spawn when you kill |cFFFFD700Upgraded Sentries|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀|cFFFFD700升级哨兵|r时随机刷新。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(167847),	-- Blueprint: Ultrasafe Transporter: Mechagon
					i(170467),	-- Whirring Chainblade
				},
			}),
			n(151684, {	-- Jawbreaker
				["questID"] = 55399,
				["coord"] = { 77.3, 44.8, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168752),	-- Omnipurpose Efficient Logic Board
				},
			}),
			n(152007, {	-- Killsaw
				["description"] = createLocalizationString({
					readable = "This rare doesn't spawn on days when the Venture Co. invades the Fleeting Forest.",
					constant = "THIS_RARE_DOESN_T_SPAWN_ON_DAYS_WHEN_THE",
					export = true,
					text = {
						en = "This rare doesn't spawn on days when the Venture Co. invades the Fleeting Forest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当风险投资公司入侵瞬息森林的日子，此稀有怪不会刷新。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 55369,
				["coords"] = {
					{ 42.6, 48.7, MECHAGON },
					{ 41.0, 28.0, MECHAGON },
				},
				["isDaily"] = true,
				["groups"] = {
					i(167931),	-- Mechagonian Sawblades (TOY!)
				},
			}),
			n(151933, {	-- Malfunctioning Beastbot
				["questID"] = 55544,
				["coord"] = { 60.7, 42.2, MECHAGON },
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "Requires a |cFFFFD700Beastbot Powerpack|r.",
					constant = "REQUIRES_A_CFFFFD700BEASTBOT_POWERPACK_R",
					export = true,
					text = {
						en = "Requires a |cFFFFD700Beastbot Powerpack|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要|cFFFFD700野兽机器人动力包|r。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(169173),	-- Blueprint: Anti-Gravity Pack
					i(169382),	-- Lost Robogrip (PET!)
					i(169848),	-- Azeroth Mini Pack: Bondo's Yard
				},
			}),
			n(151124, {	-- Mechagonian Nullifier
				["questID"] = 55207,
				["coord"] = { 56.9, 52.1, MECHAGON },
				["providers"] = {
					{ "i", 168435 },	-- Remote Circuit Bypasser
					{ "i", 167555 },	-- Pocket-Sized Computation Device
					{ "n", 152174 },	-- Hackable Nullifier Relay
				},
				["isDaily"] = true,
				["groups"] = {
					i(168490),	-- Blueprint: Protocol Transference Device
					i(169688),	-- Vinyl: Gnomeregan Forever
				},
			}),
			n(151672, {	-- Mecharantula
				["questID"] = 55386,
				["coord"] = { 88.3, 20.6, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(169393),	-- Arachnoid Skitterbot (PET!)
				},
			}),
			n(151627, {	-- Mr. Fixthis
				["questID"] = 55859,
				["coord"] = { 61.0, 61.4, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168248),	-- Blueprint: BAWLD-371
					i(170467),	-- Whirring Chainblade
				},
			}),
			n(151296, {	-- OOX-Avenger/MG
				["description"] = createLocalizationString({
					readable = "This rare only spawns when the |cFFFFD700My Chickens are Not for Eating!|r quest is active. Finding and killing OOX-Fleetfoot/MG will spawn the rare, but you'll probably need a group to do it.",
					constant = "THIS_RARE_ONLY_SPAWNS_WHEN_THE_CFFFFD700MY",
					export = true,
					text = {
						en = "This rare only spawns when the |cFFFFD700My Chickens are Not for Eating!|r quest is active. Finding and killing OOX-Fleetfoot/MG will spawn the rare, but you'll probably need a group to do it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此稀有怪仅在 |cFFFFD700我的鸡不是用来吃的！|r 任务激活时刷新。找到并杀死 OOX-迅足/MG 会刷新该稀有怪，但你很可能需要组队才能做到。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 55515,
				["coord"] = { 57.0, 39.8, MECHAGON },
				["crs"] = { 151159 },	-- OOX-Fleetfoot/MG
				["isDaily"] = true,
				["groups"] = {
					i(168492),	-- Blueprint: Emergency Rocket Chicken
				},
			}),
			n(152764, {	-- Oxidized Leachbeast
				["coord"] = { 55.8, 60.6, MECHAGON },
				["questID"] = 55856,
				["isDaily"] = true,
				["groups"] = {
					i(170273),	-- Oxidizied Refuse Remover
					i(167794),	-- Paint Vial: Lemonade Steel
				},
			}),
			n(151702, {	-- Paol Pondwader
				["questID"] = 55405,
				["coord"] = { 23.0, 68.4, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(170468),	-- Supervolt Zapper
				},
			}),
			n(150448, {	-- Reclamaton Rig
				-- TODO: figure out questIDs for:
				-- 	hardmode rig (irradiated box of assorted parts)
				-- 	irradiated undercoat usage (may not have associated quest and may just be based on the shirt's timer)
				-- verify that epic recycling requisition is daily. possibly repeatable?
				-- if recycling requisitions are separate based on whether you get the items from the scrapyard or the reclamation rig, we should probably move the quests to the NYI file or something so that one doesn't check off the other!  (or mark them repeatable or whatever)
				-- possibly attach just the 'box of assorted parts' questID to the overall header instead of the box itself?
				["modelScale"] = 4.2,
				["cr"] = 150451,	-- Reclamation Rig (before being built)
				["questID"] = 57132,	-- normal
				-- ["altQuests"] = { 55848 },	-- hardmode
				["isDaily"] = true,	-- for some reason with the quests attached it won't reset after dailies
				["coord"] = { 70.0, 61.5, MECHAGON },
				["groups"] = {
					i(168394, {	-- Box of Assorted Parts
						["questID"] = 55847,
						["isDaily"] = true,
						["groups"] = {
							i(169396),	-- Echoing Oozeling (PET!)
							i(169850, {	-- Azeroth Mini Pack: Mechagon
								["sym"] = {{"fill"}},	-- fill with sourced content
							}),
							i(169692),	-- Vinyl: Triumph of Gnomeregan
						},
					}),
					i(168395, {	-- Irradiated Box of Assorted Parts
						["questID"] = 55794,	-- popped immediately upon death of final golems; shift+clicking to refresh afterwards also popped 55848. this item was the only thing i received from HM rig. it's possible that 55848 is the "item received" quest and that 55794 is the "rig done for the first time today" quest when hardmode is active (or vice versa!)... if we could isolate the non-hardmode "rig is done for the first time today" quest then we could maybe attach both with altQuests. WHY IS QUEST TRACKING SO COMPLICATED. @BLIZZARD ANSWER FOR YOUR CRIMES
						["description"] = createLocalizationString({
							readable = "During the Reclamation Rig event, use the Supercollider on each Irradiated Elemental to make them unstable. If you complete the hardmode event correctly, you'll face three Unstable Irradiated Golems at the end of the encounter.",
							constant = "DURING_THE_RECLAMATION_RIG_EVENT_USE_THE",
							export = true,
							text = {
								en = "During the Reclamation Rig event, use the Supercollider on each Irradiated Elemental to make them unstable. If you complete the hardmode event correctly, you'll face three Unstable Irradiated Golems at the end of the encounter.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在“回收钻井平台”事件期间，对每个被辐射的元素使用超级对撞机，使它们变得不稳定。如果你正确完成了困难模式事件，将在遭遇战结束时面对三个不稳定的被辐射魔像。",
								-- TODO: tw = "",
							},
						}),
						["isDaily"] = true,
						["groups"] = {
							i(168495),	-- Blueprint: Rustbolt Requisitions
							i(169396),	-- Echoing Oozeling (PET!)
							i(169692),	-- Vinyl: Triumph of Gnomeregan
						},
					}),
					i(169878, {	-- Irradiated Undercoat
						["description"] = createLocalizationString({
							readable = "This shirt can drop from mobs during the Reclamation Rig event. Equip it, collect 100 Unstable Isotopes from attacking more of the event mobs, and then use the shirt to absorb the isotopes. You can only absorb isotopes once every 24 hours, and you'll get the pet after you use all five of the shirt's charges.",
							constant = "THIS_SHIRT_CAN_DROP_FROM_MOBS_DURING_THE",
							export = true,
							text = {
								en = "This shirt can drop from mobs during the Reclamation Rig event. Equip it, collect 100 Unstable Isotopes from attacking more of the event mobs, and then use the shirt to absorb the isotopes. You can only absorb isotopes once every 24 hours, and you'll get the pet after you use all five of the shirt's charges.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此衬衫可以在回收装置事件期间从怪物身上掉落。装备它，通过攻击更多事件怪物收集 100 个不稳定的同位素，然后使用衬衫吸收这些同位素。每 24 小时只能吸收一次同位素，用掉衬衫全部五次充能后你就会获得该宠物。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							i(169879),	-- Irradiated Elementaling (PET!)
							i(169877),	-- Unstable Isotopes
						},
					}),
					i(168264, {["sym"]={{"fill"}}}),	-- Recycling Requisition (Green)
					i(168266, {["sym"]={{"fill"}}}),	-- Recycling Requisition (Epic)
				},
			}),
			n(150575, {	-- Rumblerocks
				["questID"] = 55368,
				["coord"] = { 39.9, 53.2, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168001),	-- Paint Vial: Big-ol Bronze
				},
			}),
			n(152182, {	-- Rustfeather
				["questID"] = 55811,
				["coord"] = { 65.6, 78.3, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168370),	-- Junkheap Drifter (MOUNT!)
					i(169173),	-- Blueprint: Anti-Gravity Pack
				},
			}),
			n(155583, {	-- Scrapclaw
				["questID"] = 56737,
				["coord"] = { 82.3, 77.8, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(170470),	-- Reinforced Grease Deflector
				},
			}),
			n(150937, {	-- Seaspit
				["questID"] = 55545,
				["coord"] = { 19.3, 80.4, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168063),	-- Blueprint: Rustbolt Kegerator
				},
			}),
			n(153000, {	-- Sparkqueen P'Emp
				["description"] = createLocalizationString({
					readable = "This rare only spawns when the |cFFFFD700Bugs, Lots of 'Em!|r quest is active. When it spawns, Razak Ironsides will yell, \"|cFFff4040Wait till that bug gets close, then blow it to pieces!  I want nothing left.|r  Kill it before it gets close to Razak, or he'll kill it and you won't get loot or credit.",
					constant = "THIS_RARE_ONLY_SPAWNS_WHEN_THE_CFFFFD700BUGS",
					export = true,
					text = {
						en = "This rare only spawns when the |cFFFFD700Bugs, Lots of 'Em!|r quest is active. When it spawns, Razak Ironsides will yell, \"|cFFff4040Wait till that bug gets close, then blow it to pieces!  I want nothing left.|r  Kill it before it gets close to Razak, or he'll kill it and you won't get loot or credit.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "此稀有怪仅在 |cFFFFD700虫子，好多虫子！|r 任务激活时刷新。它刷新时，拉扎克·铁肋会喊道：“|cFFff4040等那虫子靠近点，再把它炸成碎片！我一点都不要剩下。|r  在它靠近拉扎克之前杀死它，否则他会杀了它，你将无法获得战利品或击杀计数。",
						-- TODO: tw = "",
					},
				}),
				["questID"] = 55810,
				["coord"] = { 83.8, 22.0, MECHAGON },
				["isDaily"] = true,
			}),
			n(153226, {	-- Steel Singer Freza
				["questID"] = 55854,
				["coord"] = { 25.1, 77.4, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168062),	-- Blueprint: Rustbolt Gramophone
					i(169689),	-- Vinyl: Mimiron's Brainstorm
					i(169692),	-- Vinyl: Triumph of Gnomeregan
					i(169690),	-- Vinyl: Battle of Gnomeregan
				},
			}),
			n(154225, {	-- The Rusty Prince
				["questID"] = 56182,
				["coord"] = { 57.2, 58.6, MECHAGON },
				["isDaily"] = true,
				["description"] = createLocalizationString({
					readable = "Does not spawn when the daily quest |cFFFFD700The Other Place|r is active, must use the Personal Time Displacer to access Alt Time.",
					constant = "DOES_NOT_SPAWN_WHEN_THE_DAILY_QUEST",
					export = true,
					text = {
						en = "Does not spawn when the daily quest |cFFFFD700The Other Place|r is active, must use the Personal Time Displacer to access Alt Time.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当日常任务|cFFFFD700另一个地方|r激活时不会刷新，必须使用个人时间置换器进入平行时间。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(169347),	-- Judgment of Mechagon (TOY!)
					i(170467),	-- Whirring Chainblade
				},
			}),
			n(151625, {	-- The Scrap King
				["questID"] = 55364,
				["coord"] = { 72.3, 49.8, MECHAGON },
				["isDaily"] = true,
				["crs"] = {
					151623,	-- The Scrap King (while mounted on goretusk)
				},
				["groups"] = {
					i(167846),	-- Blueprint: Mechano-Treat
					i(168435, {	-- Remote Circuit Bypasser
						["sourceQuest"] = 55708,	-- Upgraded
					}),
					i(170467),	-- Whirring Chainblade
				},
			}),
			n(151940, {	-- Uncle T'Rogg
				["questID"] = 55538,
				["coord"] = { 57.3, 20.7, MECHAGON },
				["isDaily"] = true,
				["groups"] = {
					i(168749),	-- Performant Effective Logic Board
				},
			}),
		}),
		n(REWARDS, {
			container(169848, {	-- Azeroth Mini Pack: Bondo's Yard
				i(169843),	-- Azeroth Mini: Cork Stuttguard
				i(169842),	-- Azeroth Mini: Roadtrogg
				i(169840),	-- Azeroth Mini: Gazlowe
				i(169795),	-- Azeroth Mini: Bondo Bigblock
				i(169849),	-- Azeroth Mini: Naeno Megacrash
			}),
		}),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.BFA, bubbleDownSelf({ ["timeline"] = { ADDED_8_2_0 } }, {
	m(KUL_TIRAS, {
		m(MECHAGON, {
			n(RARES, {
				-- First rare kill
				q(55913),	-- Arachnoid Harvester
				q(56996),	-- Armored Vaultbot
				q(56997),	-- Armored Vaultbot (Alternate timeline)
				-- q(TODO),	-- Boilburn (maybe no ID)
				q(55920),	-- Boggac Skullbash
				q(55919),	-- Bonepicker
				-- q(TODO),	-- Caustic Mechaslime
				q(55927),	-- Crazed Trogg
				q(55917),	-- Deepwater Maw
				-- q(55544),	-- Doppel Ganger
				q(55932),	-- Earthbreaker Gulroc
				q(56994),	-- Enforcer KX-T57
				q(55916),	-- Foul Manifestation
				q(55915),	-- Fungarian Furor
				q(55934),	-- Gear Checker Cogstar
				q(55929),	-- Gemicide
				-- q(TODO),	-- Gorged Gear-Cruncher
				q(55910),	-- Jawbreaker
				q(55914),	-- Killsaw
				q(55926),	-- Malfunctioning Beastbot
				q(55907),	-- Mechagonian Nullifier
				q(55909),	-- Mecharantula
				q(55935),	-- Mr. Fixthis
				q(55928),	-- Ol' Big Tusk
				q(55918),	-- OOX-Avenger/MG
				q(55936),	-- Oxidized Leachbest
				q(55911),	-- Paol Pondwader
				q(55912),	-- Rumblerocks
				q(55924),	-- Rustfeather
				q(57084),	-- Scrapclaw
				q(55922),	-- Seaspit
				q(55923),	-- Sparkqueen P'Emp
				q(55933),	-- Steel Singer Freza
				q(55931),	-- The Kleptoboss
				q(56995),	-- The Rusty Prince
				q(55908),	-- The Scrap King
				q(55921),	-- Uncle T'Rogg
			}),
		}),
	}),
})));
