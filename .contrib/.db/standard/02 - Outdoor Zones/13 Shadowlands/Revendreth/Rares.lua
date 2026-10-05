---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(REVENDRETH, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(166393, {	-- Amalgamation of Filth
				["description"] = createLocalizationString({
					readable = "Click on the sparkling Rubbish Box and throw rubbish into the water. Kill the oozes, and eventually the rare will spawn.",
					constant = "CLICK_ON_THE_SPARKLING_RUBBISH_BOX_AND_THROW",
					export = true,
					text = {
						en = "Click on the sparkling Rubbish Box and throw rubbish into the water. Kill the oozes, and eventually the rare will spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击闪光的垃圾箱并把垃圾扔进水里。击杀软泥怪，稀有怪最终就会刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 53.8, 72.5, REVENDRETH },
				["questID"] = 59854,
				["groups"] = {
					i(183729),	-- Filth-Splattered Headcover
				},
			}),
			n(164388, {	-- Amalgamation of Light
				["description"] = createLocalizationString({
					readable = "When the rare is available, 3 light-reflecting mirrors will appear. Move all 3 to start the encounter.",
					constant = "WHEN_THE_RARE_IS_AVAILABLE_3_LIGHT_REFLECTING",
					export = true,
					text = {
						en = "When the rare is available, 3 light-reflecting mirrors will appear. Move all 3 to start the encounter.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当稀有刷新时，会出现 3 面反光镜。移动全部 3 面即可开始战斗。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 25.3, 48.5, REVENDRETH },
				["questID"] = 59584,
				["groups"] = {
					i(180586),	-- Bound Lightspawn (PET!)
					i(180688),	-- Infused Remnant of Light
					i(179925),	-- Light-Infused Breastplate
					i(179653),	-- Light-Infused Hauberk
					i(179924),	-- Light-Infused Jacket
					i(179926),	-- Light-Infused Tunic
				},
			}),
			n(166576, {	-- Azgar
				["coord"] = { 36.0, 68.6, REVENDRETH },
				["questID"] = 59893,
				["groups"] = {
					i(180691),	-- Obscuring Ash Cloud
					i(183731),	-- Smolder-Tempered Legplates
				},
			}),
			n(165206, {	-- Endlurker
				["description"] = createLocalizationString({
					readable = "There is a sparkling Anima Stake in front of the portal. Pick it up and use the Extra Action Button to lure the rare.",
					constant = "THERE_IS_A_SPARKLING_ANIMA_STAKE_IN_FRONT_OF",
					export = true,
					text = {
						en = "There is a sparkling Anima Stake in front of the portal. Pick it up and use the Extra Action Button to lure the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "传送门前有一根闪烁的心能木桩。拾取它并使用额外动作按钮来引诱该稀有。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 66.4, 59.6, REVENDRETH },
				["questID"] = 59582,
				["groups"] = {
					i(179927),	-- Glowing Endmire Stinger
					i(183759),	-- Unusually Large Cranium
				},
			}),
			n(166710, {	-- Executioner Aatron
				["description"] = createLocalizationString({
					readable = "Kill the 3 Stone Legion Punishers along the wall to make the rare attackable.",
					constant = "KILL_THE_3_STONE_LEGION_PUNISHERS_ALONG_THE",
					export = true,
					text = {
						en = "Kill the 3 Stone Legion Punishers along the wall to make the rare attackable.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀沿墙的 3 名石裔军团惩罚者，使该稀有变为可攻击状态。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 166715 },	-- Stone Legion Punisher
				["coord"] = { 37.2, 47.8, REVENDRETH },
				["questID"] = 59913,
				["groups"] = {
					i(183737),	-- Aatron's Stone Girdle
				},
			}),
			n(161310, {	-- Executioner Adrastia
				["description"] = createLocalizationString({
					readable = "As of 9.1, there is now an on-screen counter in the area: 'Dredgers Escaped: 0/50'. Freeing 50 dredgers causes the rare to spawn. Once the rare is killed, the counter resets.",
					constant = "AS_OF_9_1_THERE_IS_NOW_AN_ON_SCREEN_COUNTER_IN",
					export = true,
					text = {
						en = "As of 9.1, there is now an on-screen counter in the area: 'Dredgers Escaped: 0/50'. Freeing 50 dredgers causes the rare to spawn. Once the rare is killed, the counter resets.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "自 9.1 起，该区域现在会显示一个屏幕上的计数器：“逃脱的泥仆：0/50”。解救 50 个泥仆会使稀有刷新。稀有被击杀后，计数器会重置。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 44.0, 51.0, REVENDRETH },
				["questID"] = 58441,
				["groups"] = {
					i(180502),	-- Adrastia's Executioner Gloves
					i(182967),	-- Dredger's Long Sleeved Doublet
				},
			}),
			n(166521, {	-- Famu the Infinite
				["crs"] = { 166483 },	-- Seeker Hilda
				["coord"] = { 62.6, 47.2, REVENDRETH },
				["questID"] = 59869,
				["groups"] = {
					i(182972),	-- Critter Two-Thumbs Portrait
					i(180582),	-- Endmire Flyer (MOUNT!)
					i(183739),	-- Endmire Wristwarmers
				},
			}),
			n(167464, {	-- Grand Arcanist Dimitri
				["description"] = createLocalizationString({
					readable = "Kill the Shrouded Ritualists to spawn the rare.",
					constant = "KILL_THE_SHROUDED_RITUALISTS_TO_SPAWN_THE_RARE",
					export = true,
					text = {
						en = "Kill the Shrouded Ritualists to spawn the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀蒙面仪式师以刷出该稀有。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 20.9, 54.3, REVENDRETH },
				["questID"] = 60173,
				["groups"] = {
					i(180503),	-- Grand Arcanist's Soulblade
					i(180708),	-- Mirror of Despair
					i(180659),	-- Soul Siphoning Shard
				},
			}),
			n(166679, {	-- Hopecrusher
				["description"] = createLocalizationString({
					readable = "When you inspect the Large Prey, Hopecrusher will attack you.",
					constant = "WHEN_YOU_INSPECT_THE_LARGE_PREY_HOPECRUSHER",
					export = true,
					text = {
						en = "When you inspect the Large Prey, Hopecrusher will attack you.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "当你查看大型猎物时，希望粉碎者会攻击你。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 166682 },	-- Large Prey
				["coord"] = { 51.9, 51.8, REVENDRETH },
				["questID"] = 59900,
				["groups"] = {
					i(180581, {	-- Hopecrusher Gargon (MOUNT!)
						["customCollect"] = "SL_COV_VEN",	-- Venthyr covenant drop only
					}),
				},
			}),
			n(166993, {	-- Huntmaster Petrus
				["crs"] = { 165891 },	-- Reza
				["coord"] = { 61.8, 79.2, REVENDRETH },
				["questID"] = 60022,
				["groups"] = {
					i(180705),	-- Gargon Training Manual (CI!)
					i(180704),	-- Infused Pet Biscuit
				},
			}),
			n(160640, {	-- Innervus
				["description"] = createLocalizationString({
					readable = "You will need a |cFFFFFFFFScorched Crypt Key|r to enter the rare's tomb. The key can drop from the Feral Ritualists and Blistering Inquisitors in the surrounding area.",
					constant = "YOU_WILL_NEED_A_CFFFFFFFFSCORCHED_CRYPT_KEY_R",
					export = true,
					text = {
						en = "You will need a |cFFFFFFFFScorched Crypt Key|r to enter the rare's tomb. The key can drop from the Feral Ritualists and Blistering Inquisitors in the surrounding area.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你需要一把|cFFFFFFFF焦灼墓穴钥匙|r才能进入稀有的陵墓。钥匙可以从周边区域的野性仪式师和炽热审判官身上掉落。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 21.7, 35.9, REVENDRETH },
				["questID"] = 58210,
				["groups"] = {
					i(183735),	-- Rogue Sinstealer's Mantle
					i(177223),	-- Scorched Crypt Key
					i(183760),	-- Venthyr Spectacles
				},
			}),
			n(165152, {	-- Leeched Soul
				["description"] = createLocalizationString({
					readable = "Inside the crypt. Protect Absolver Meylann from waves of mobs.",
					constant = "INSIDE_THE_CRYPT_PROTECT_ABSOLVER_MEYLANN_FROM",
					export = true,
					text = {
						en = "Inside the crypt. Protect Absolver Meylann from waves of mobs.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在地穴内。保护赦免者梅兰免受一波波怪物的攻击。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					165151,	-- Absolver Meylann
					165175,	-- Prideful Hulk
				},
				["coord"] = { 67.5, 82.2, REVENDRETH },
				["questID"] = 59580,
				["groups"] = {
					i(180585),	-- Wrathling (PET!)
					i(183736),	-- Pride Resistant Handwraps
				},
			}),
			n(161891, {	-- Lord Mortegore
				["description"] = createLocalizationString({
					readable = "Collect 4 |cFF0070ddMortegore Scrolls|r from nearby Maldraxxi and use them to activate |cFFFFFFFFMortegore Sigils|r to summon the rare.",
					constant = "COLLECT_4_CFF0070DDMORTEGORE_SCROLLS_R_FROM",
					export = true,
					text = {
						en = "Collect 4 |cFF0070ddMortegore Scrolls|r from nearby Maldraxxi and use them to activate |cFFFFFFFFMortegore Sigils|r to summon the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从附近的玛卓克萨斯人身上收集 4 个|cFF0070dd莫特戈尔卷轴|r，并用它们激活|cFFFFFFFF莫特戈尔符印|r以召唤该稀有怪。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 75.8, 61.4, REVENDRETH },
				["questID"] = 58633,
				["cost"] = { { "i", 174378, 4 } },	-- 4x Mortegore Scroll
				["groups"] = {
					i(180501),	-- Skull-Formed Headcage
				},
			}),
			n(160675, {	-- Scrivener Lenua
				["description"] = createLocalizationString({
					readable = "To spawn the rare, find four stacks of Forbidden Tomes in the surrounding area and deliver them to the library.",
					constant = "TO_SPAWN_THE_RARE_FIND_FOUR_STACKS_OF_FORBIDDEN",
					export = true,
					text = {
						en = "To spawn the rare, find four stacks of Forbidden Tomes in the surrounding area and deliver them to the library.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要刷新此稀有怪，请在周围区域找到四堆禁忌典籍，并把它们送到图书馆。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 160753 },	-- Forbidden Tomes
				["coord"] = { 37.6, 68.7, REVENDRETH },
				["questID"] = 58213,
				["groups"] = {
					i(180587),	-- Animated Tome (PET!)
					i(180694),	-- Tome of Power
				},
			}),
			n(162481, {	-- Sinstone Hoarder
				["description"] = createLocalizationString({
					readable = "Click on the |cFFFFFFFFCatacombs Cache|r to spawn the rare.",
					constant = "CLICK_ON_THE_CFFFFFFFFCATACOMBS_CACHE_R_TO",
					export = true,
					text = {
						en = "Click on the |cFFFFFFFFCatacombs Cache|r to spawn the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击|cFFFFFFFF地下墓穴贮藏|r以刷新该稀有怪。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 162503 },	-- Catacombs Cache
				["coord"] = { 67.4, 30.6, REVENDRETH },
				["questID"] = 62252,
				["groups"] = {
					i(183732),	-- Sinstone-Linked Greaves
				},
			}),
			n(160857, {	-- Sire Ladinas <The Lightrazed>
				["description"] = createLocalizationString({
					readable = "Remnants of Light are sparkling gold shards scattered around the Ember Ward. Pick them up and use the Extra Action Button on any mobs in the area (ghouls/outcasts/etc.) for a chance to make Sire Ladinas spawn.\n\nIf the ghoul yells, the rare will spawn soon.",
					constant = "REMNANTS_OF_LIGHT_ARE_SPARKLING_GOLD_SHARDS",
					export = true,
					text = {
						en = "Remnants of Light are sparkling gold shards scattered around the Ember Ward. Pick them up and use the Extra Action Button on any mobs in the area (ghouls/outcasts/etc.) for a chance to make Sire Ladinas spawn.\n\nIf the ghoul yells, the rare will spawn soon.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "圣光残片是散落在余烬区各处的闪亮金色碎片。拾取它们，并对该区域的任何怪物（食尸鬼/流亡者等）使用额外动作按钮，就有机会使拉迪纳斯刷新。\n\n如果食尸鬼喊叫，稀有很快就会刷新。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 34.0, 55.5, REVENDRETH },
				["questID"] = 58263,
				["groups"] = {
					i(180873),	-- Smolderheart (TOY!)
				},
			}),
			n(160392, {	-- Soulstalker Doina
				["description"] = createLocalizationString({
					readable = "Spawns at the top of the tower. She will escape through mirror portals twice during the encounter. Follow her to continue the fight.",
					constant = "SPAWNS_AT_THE_TOP_OF_THE_TOWER_SHE_WILL_ESCAPE",
					export = true,
					text = {
						en = "Spawns at the top of the tower. She will escape through mirror portals twice during the encounter. Follow her to continue the fight.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在塔顶刷新。战斗中她会两次通过镜像传送门逃走。跟上她才能继续战斗。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					160385,	-- Soulstalker Doina
					160393,	-- Soulstalker Doina
					160401,	-- Grenich
					160402,	-- Grond
				},
				["coord"] = { 78.5, 49.7, REVENDRETH },
				["questID"] = 58130,
				["groups"] = {
					i(180692),	-- Box of Stalker Traps
					i(180490),	-- Soulstalker's Barbs
				},
			}),
			n(159503, {	-- Stonefist
				["coord"] = { 31.0, 23.2, REVENDRETH },
				["questID"] = 62220,
				["groups"] = {
					i(180488),	-- Fist-Forged Breastplate
				},
			}),
			n(165253, {	-- Tollkeeper Varaboss
				["coord"] = { 66.4, 71.4, REVENDRETH },
				["questID"] = 59595,
				["groups"] = {
					i(179363),	-- 'Misplaced' Anima Tolls (QS!)
				},
			}),
			n(155779, {	-- Tomb Burster <Dread Crawler Queen>
				["description"] = createLocalizationString({
					readable = "After you kill all the Crawler Eggs around Funguss and defeat several waves of Dread Crawlers, the rare will attack.",
					constant = "AFTER_YOU_KILL_ALL_THE_CRAWLER_EGGS_AROUND",
					export = true,
					text = {
						en = "After you kill all the Crawler Eggs around Funguss and defeat several waves of Dread Crawlers, the rare will attack.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "杀死菌菇斯周围的全部爬行虫卵，并击败几波恐惧爬行者后，这只稀有怪就会发起攻击。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					155769,	-- Crawler Egg
					155777,	-- Funguss
				},
				["coord"] = { 42.8, 79.2, REVENDRETH },
				["questID"] = 56877,
				["groups"] = {
					i(180584),	-- Blushing Spiderling (PET!)
				},
			}),
			n(160821, {	-- Worldedge Gorger
				["description"] = createLocalizationString({
					readable = "To summon Worldedge Gorger, you need to use |cff1eff00Enticing Anima|r to light Worldedge Braziers. |cff1eff00Enticing Anima|r drops from the aberrations that spawn along the river.",
					constant = "TO_SUMMON_WORLDEDGE_GORGER_YOU_NEED_TO_USE",
					export = true,
					text = {
						en = "To summon Worldedge Gorger, you need to use |cff1eff00Enticing Anima|r to light Worldedge Braziers. |cff1eff00Enticing Anima|r drops from the aberrations that spawn along the river.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要召唤世界边缘吞噬者，你需要使用 |cff1eff00诱人的心能|r 点燃世界边缘火盆。|cff1eff00诱人的心能|r 由沿河刷新的畸变体掉落。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 38.6, 72.0, REVENDRETH },
				["questID"] = 58259,
				["cost"] = { { "i", 173939, 1 } },	-- Enticing Anima
				["groups"] = {
					i(180583, {	-- Impressionable Gorger Spawn
						["description"] = createLocalizationString({
							readable = "To have a chance for this item to drop, you may need to complete the The Endmire Quest (/ATT quest:60480). Better safe than sorry, the Quest only takes 1 minute to do.",
							constant = "TO_HAVE_A_CHANCE_FOR_THIS_ITEM_TO_DROP_YOU_MAY",
							export = true,
							text = {
								en = "To have a chance for this item to drop, you may need to complete the The Endmire Quest (/ATT quest:60480). Better safe than sorry, the Quest only takes 1 minute to do.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "为了让此物品有几率掉落，你可能需要完成终末泥沼任务（/ATT quest:60480）。有备无患，该任务只需 1 分钟就能完成。",
								-- TODO: tw = "",
							},
						}),
					}),
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(SHADOWLANDS, {
		m(REVENDRETH, {
			n(RARES, {
				q(62464),	-- Azgar secondary quest
				q(60581),	-- Endlurker secondary quest
				q(62463),	-- Prideful Hulk secondary quest
				q(60583),	-- Tollkeeper Varaboss secondary quest
				q(62455),	-- Amalgamation of Light secondary quest
			}),
		}),
	}),
})));
