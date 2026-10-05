---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(BASTION, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(161528, {	-- Aethon
				["crs"] = { 161441 },	-- Orator Kloe
				["coord"] = { 55.3, 80.3, BASTION },
				["questID"] = 58526,
				["groups"] = {
					i(179487),	-- Aethon's Horn
				},
			}),
			n(170899,   {	-- Ascended Council
				["description"] = createLocalizationString({
					readable = "You have to ring all 5 vespers within 5 minutes to summon the Ascended Council at |cFFFFFFFF53.5, 88.3|r. The vespers are spread out all over the map, so this might require at least a couple people.",
					constant = "YOU_HAVE_TO_RING_ALL_5_VESPERS_WITHIN_5_MINUTES",
					export = true,
					text = {
						en = "You have to ring all 5 vespers within 5 minutes to summon the Ascended Council at |cFFFFFFFF53.5, 88.3|r. The vespers are spread out all over the map, so this might require at least a couple people.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你必须在 5 分钟内敲响全部 5 个晚祷钟，才能在|cFFFFFFFF53.5, 88.3|r处召唤晋升议会。晚祷钟散布在地图各处，所以这可能需要至少几个人。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					170835,	-- Champion of Courage
					170836,	-- Champion of Humility
					170832,	-- Champion of Loyalty
					170834,	-- Champion of Purity
					170833,	-- Champion of Wisdom
				},
				["coords"] = {
					{ 53.5, 88.3, BASTION },	-- The Ascended Council
					{ 33.3, 59.7, BASTION },	-- Vesper of Courage
					{ 71.8, 38.8, BASTION },	-- Vesper of Humility
					{ 64.3, 69.8, BASTION },	-- Vesper of Purity
					{ 39.1, 20.4, BASTION },	-- Vesper of Wisdom
					{ 32.1, 17.8, BASTION },	-- Vesper of Loyalty
				},
				["questID"] = 60933,
				["groups"] = {
					o(354175, {	-- Cache of the Ascended
						["coord"] = { 53.5, 88.7, BASTION },
						["questID"] = 60977,
						["isDaily"] = true,
						["groups"] = {
							i(183741),	-- Ascended Skymane (MOUNT!)
						},
					}),
				},
			}),
			n(171211, {	-- Aspirant Eolis
				["description"] =
					-- #if AFTER DF
					"Fragile Humility Scrolls can be found throughout the Court of Elation. They are floating unfurled scrolls that do not sparkle, but glow purple. After you find one, read it to Eolis to start the encounter.\n\nOnly available to level 60 characters, both spawning and looting.",
					-- #else
					"Fragile Humility Scrolls can be found throughout the Court of Elation. They are floating unfurled scrolls that do not sparkle, but glow purple. After you find one, read it to Eolis to start the encounter.\n\nIf you are unable to see the scroll, your characters level is not high enough as it required max level (60) during Shadowlands (2021).",
					-- #endif
				["coord"] = { 32.6, 23.4, BASTION },
				["questID"] = 61083,
				["groups"] = {
					i(183607),	-- Uncertain Aspirant's Spear
					o(354848, {	-- Fragile Humility Scroll
						["coords"] = {
							{ 31.4, 22.9, BASTION },
							{ 31.4, 23.9, BASTION },
							{ 32.1, 21.2, BASTION },
							{ 32.1, 23.0, BASTION },
							{ 32.5, 24.4, BASTION },
							{ 32.7, 20.4, BASTION },
							{ 33.0, 20.7, BASTION },
							{ 33.2, 23.2, BASTION },
						},
						["groups"] = { i(180613) },	-- Fragile Humility Scroll (not dropped by the boss, but putting here so that the source text associates it w/ the rare)
					}),
				},
			}),
			n(160629, {	-- Baedos
				["description"] = createLocalizationString({
					readable = "To start the encounter, find casks full of Fermenting Purian Fruit near the rare and bring them to Baedos' Fruit Barrel.",
					constant = "TO_START_THE_ENCOUNTER_FIND_CASKS_FULL_OF",
					export = true,
					text = {
						en = "To start the encounter, find casks full of Fermenting Purian Fruit near the rare and bring them to Baedos' Fruit Barrel.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要开始此遭遇，请在稀有怪附近找到装满发酵普瑞安水果的木桶，并把它们带到贝多斯的果桶处。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 161536 },	-- Baedos' Fruit Barrel
				["coord"] = { 51.2, 40.6, BASTION },
				["questID"] = 58648,	-- looting chest triggers this and it's repeatable
			}),
			n(170659, {	-- Basilofos, King of the Hill
				["coord"] = { 48.4, 50.4, BASTION },
				["questID"] = 60897,	-- TODO: 62158 triggered as well
				["groups"] = {
					i(180704),	-- Infused Pet Biscuit
				},
			}),
			n(171189, {	-- Bookkeeper Mnemis
				["coord"] = { 57.2, 62.4, BASTION },
				["questID"] = 59022,
				["groups"] = {
					i(182682),	-- Book-Borrower Identification
				},
			}),
			n(170932, {	-- Cloudfeather Guardian
				["description"] = createLocalizationString({
					readable = "If the rare is not attackable, you can kill Anima-Starved Cloudfeathers in the area to provoke it.",
					constant = "IF_THE_RARE_IS_NOT_ATTACKABLE_YOU_CAN_KILL",
					export = true,
					text = {
						en = "If the rare is not attackable, you can kill Anima-Starved Cloudfeathers in the area to provoke it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果稀有怪无法被攻击，你可以击杀区域内饥渴心能的云羽来激怒它。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 50.6, 59.6, BASTION },
				["questID"] = 60978,
				["groups"] = {
					i(180812),	-- Golden Teroclaw (PET!)
				},
			}),
			n(161530, {	-- Cloudtail
				["crs"] = { 161441 },	-- Orator Kloe
				["coord"] = { 55.3, 80.3, BASTION },
				["questID"] = 60571,
				["groups"] = {
					i(179488),	-- Cloudtail's Paw
				},
			}),
			n(171014, {	-- Collector Astorestes
				["description"] = createLocalizationString({
					readable = "First, read the 6 chapters of Mercia's Legacy in order.\n\nChapter One - |cFFFFFFFF66.1, 44.1|r, on a small table with two vases.\nChapter Two - |cFFFFFFFF65.9, 44.1|r, on a bench.\nChapter Three - |cFFFFFFFF65.7, 43.9|r, behind a bench.\nChapter Four - |cFFFFFFFF65.7, 43.4|r, on the lower-left shelf.\nChapter Five - |cFFFFFFFF65.9, 43.2|r, to the right of the bench.\nChapter Six - |cFFFFFFFF66.2, 43.2|r, on the lower-right corner of the table.\n\nSpeak to the Echo of Mercia, and she will give you a 5-minute buff allowing you to find the secret 7th chapter of the story. It will be outside the main temple room; just look at all the tables until you find a glowing purple scroll.\n\nPick up the 7th chapter scroll, bring it to the Echo of Mercia, and the rare will appear.",
					constant = "FIRST_READ_THE_6_CHAPTERS_OF_MERCIA_S_LEGACY_IN",
					export = true,
					text = {
						en = "First, read the 6 chapters of Mercia's Legacy in order.\n\nChapter One - |cFFFFFFFF66.1, 44.1|r, on a small table with two vases.\nChapter Two - |cFFFFFFFF65.9, 44.1|r, on a bench.\nChapter Three - |cFFFFFFFF65.7, 43.9|r, behind a bench.\nChapter Four - |cFFFFFFFF65.7, 43.4|r, on the lower-left shelf.\nChapter Five - |cFFFFFFFF65.9, 43.2|r, to the right of the bench.\nChapter Six - |cFFFFFFFF66.2, 43.2|r, on the lower-right corner of the table.\n\nSpeak to the Echo of Mercia, and she will give you a 5-minute buff allowing you to find the secret 7th chapter of the story. It will be outside the main temple room; just look at all the tables until you find a glowing purple scroll.\n\nPick up the 7th chapter scroll, bring it to the Echo of Mercia, and the rare will appear.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "首先，按顺序阅读《梅西亚的遗产》的 6 个章节。\n\n第一章 - |cFFFFFFFF66.1, 44.1|r，在一张放着两个花瓶的小桌子上。\n第二章 - |cFFFFFFFF65.9, 44.1|r，在一条长椅上。\n第三章 - |cFFFFFFFF65.7, 43.9|r，在一条长椅后面。\n第四章 - |cFFFFFFFF65.7, 43.4|r，在左下方的架子上。\n第五章 - |cFFFFFFFF65.9, 43.2|r，在长椅右侧。\n第六章 - |cFFFFFFFF66.2, 43.2|r，在桌子的右下角。\n\n与梅西亚的回响交谈，她会给你一个持续 5 分钟的增益效果，让你能够找到故事中隐秘的第 7 章。它位于主神殿房间外；只要查看所有桌子，直到找到一卷发着紫色光芒的卷轴。\n\n拾取第 7 章卷轴，把它带给梅西亚的回响，稀有生物就会出现。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 157979 },	-- Echo of Mercia <Paragon of Humility>
				["coord"] = { 66.0, 43.6, BASTION },
				["questID"] = 61002,
				["providers"] = {
					{ "o", 354283 },	-- Mercia's Legacy: Chapter One
					{ "o", 354284 },	-- Mercia's Legacy: Chapter Two
					{ "o", 354285 },	-- Mercia's Legacy: Chapter Three
					{ "o", 354286 },	-- Mercia's Legacy: Chapter Four
					{ "o", 354287 },	-- Mercia's Legacy: Chapter Five
					{ "o", 354288 },	-- Mercia's Legacy: Chapter Six
					{ "i", 180569 },	-- Mercia's Legacy: Chapter Seven
				},
				["groups"] = {
					i(183606),	-- Bulwark of Echoing Courage
					i(184295),	-- Eternal Daybreak Necklace
					i(183608),	-- Evernote Vesper
					i(183614),	-- Gavel of Harmonious Wisdom
					i(183611),	-- Humble Ophelia's Greatblade
					i(183604),	-- Piercing Timbre Crossbow
					o(354467, {	-- Mercia's Legacy: Chapter Seven
						["coords"] = {
							{ 65.3, 44.4, BASTION },
							{ 65.4, 42.9, BASTION },
							{ 65.8, 44.4, BASTION },
							{ 66.4, 43.0, BASTION },
							{ 67.3, 43.6, BASTION },
							{ 67.4, 42.8, BASTION },
						},
						["groups"] = { i(180569) },	-- Mercia's Legacy: Chapter Seven (so the item is associated with the rare)
					}),
					i(183613),	-- Glinting Daybreak Dagger
					i(183612),	-- Loyal Champion's Hammer
					i(183609),	-- Re-Powered Goliath Fists
					i(183607),	-- Uncertain Aspirant's Spear
					i(183605),	-- Devourer Wrought Warglaive
					i(183610),	-- Warrior Poet's Poniard
				},
			}),
			n(171010, {	-- Corrupted Clawguard
				["description"] = createLocalizationString({
					readable = "To start the encounter, you need to find a Discarded Phalynx Core and use it on the Malfunctioning Clawguard.",
					constant = "TO_START_THE_ENCOUNTER_YOU_NEED_TO_FIND_A",
					export = true,
					text = {
						en = "To start the encounter, you need to find a Discarded Phalynx Core and use it on the Malfunctioning Clawguard.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "要开始此遭遇，你需要找到一个废弃的费林克斯核心，并将其用在故障的利爪守卫身上。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 171300 },	-- Malfunctioning Clawguard
				["coord"] = { 56.4, 46.1, BASTION },
				["questID"] = 60999,
				["groups"] = {
					i(182759),	-- Functioning Anima Core
					i(180651),	-- Discarded Phalynx Core (so the item is associated with the rare)
				},
			}),
			n(170623, {	-- Dark Watcher
				["description"] = createLocalizationString({
					readable = "If the rare is up, you will get a debuff called Ominous Gaze when you are close to it. To start the encounter, you need to die and speak to the NPC.",
					constant = "IF_THE_RARE_IS_UP_YOU_WILL_GET_A_DEBUFF_CALLED",
					export = true,
					text = {
						en = "If the rare is up, you will get a debuff called Ominous Gaze when you are close to it. To start the encounter, you need to die and speak to the NPC.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "如果稀有怪已刷新，你靠近它时会获得一个名为不祥凝视的减益。要开始这场遭遇战，你需要死亡并与该 NPC 交谈。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 27.8, 30.0, BASTION },
				["questID"] = 60883,
				["groups"] = {
					i(184297),	-- Death Warden's Greatblade
				},
			}),
			n(171011, {	-- Demi the Relic Hoarder
				["description"] = createLocalizationString({
					readable = "As soon as Demi is pulled, she will start running east. She will pull additional Forsworn mobs for you to contend with, and she has 100 stacks of a buff that causes her to take reduced damage. The stacks drop each time she is attacked, so she will take progressively more damage. Upon defeat, she drops the treasure she is holding.\n\nThis rare is soloable, but having decent gear and at least one more person may be helpful — if Demi makes it to safety, she will despawn.",
					constant = "AS_SOON_AS_DEMI_IS_PULLED_SHE_WILL_START",
					export = true,
					text = {
						en = "As soon as Demi is pulled, she will start running east. She will pull additional Forsworn mobs for you to contend with, and she has 100 stacks of a buff that causes her to take reduced damage. The stacks drop each time she is attacked, so she will take progressively more damage. Upon defeat, she drops the treasure she is holding.\n\nThis rare is soloable, but having decent gear and at least one more person may be helpful — if Demi makes it to safety, she will despawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "黛米一旦被引动，就会开始向东逃跑。她会为你拉来额外的弃誓者怪物，并且身带 100 层使她受到伤害降低的增益。每次受到攻击都会减少一层，因此她受到的伤害会越来越高。被击败后，她会掉落所持有的宝藏。\n\n这个稀有可以单刷，但拥有不错的装备并至少再带一个人会有所帮助——如果黛米成功逃到安全地带，她就会消失。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 37.0, 41.8, BASTION },
				["questID"] = 61000,
				["groups"] = {
					o(354649, {	-- Relic Hoard
						i(183606),	-- Bulwark of Echoing Courage
						i(183608),	-- Evernote Vesper
						i(183614),	-- Gavel of Harmonious Wisdom
						i(183613),	-- Glinting Daybreak Dagger
						i(183611),	-- Humble Ophelia's Greatblade
						i(183612),	-- Loyal Champion's Hammer
						i(183604),	-- Piercing Timbre Crossbow
						i(183609),	-- Re-Powered Golliath Fists
						i(183607),	-- Uncertain Aspirant's Spear
						i(183610),	-- Warrior Poet's Poniard
						i(183605),	-- Devourer Wrought Warglaive
					}),
				},
			}),
			n(163460, {	-- Dionae
				["description"] = createLocalizationString({
					readable = "Stewart offers you his Stewpendous Stew in thanks after you save him from Dionae.",
					constant = "STEWART_OFFERS_YOU_HIS_STEWPENDOUS_STEW_IN",
					export = true,
					text = {
						en = "Stewart offers you his Stewpendous Stew in thanks after you save him from Dionae.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在你从迪奥奈手中救出斯图尔特后，他会以他的超级炖肉作为答谢。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 40.9, 47.4, BASTION },
				["questID"] = 62650,
				["groups"] = {
					o(344588, {	-- Stewart's Stewpendous Stew
						i(180856),	-- Silvershell Snapper (PET!)
					}),
				},
			}),
			n(171255, {	-- Echo of Aella <Hand of Courage>
				["coord"] = { 46.8, 64.0, BASTION },
				["questID"] = 61091,	-- looting (seems more important to track than killing)
				["groups"] = {
					i(180062),	-- Heavenly Drum
				},
			}),
			n(171009, {	-- Enforcer Aegeon
				["description"] = createLocalizationString({
					readable = "Force the rare to spawn by killing mobs around the Eternal Forge. Forge-Keeper Mnemis will periodically announce the threat level, and Aegeon will be dispatched when the threat level reaches Major.",
					constant = "FORCE_THE_RARE_TO_SPAWN_BY_KILLING_MOBS_AROUND",
					export = true,
					text = {
						en = "Force the rare to spawn by killing mobs around the Eternal Forge. Forge-Keeper Mnemis will periodically announce the threat level, and Aegeon will be dispatched when the threat level reaches Major.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "通过击杀永恒熔炉周围的怪物来强制刷新该稀有。守炉者姆涅弥斯会定期通报威胁等级，当威胁等级达到“重大”时，埃该翁便会被派出。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 50.8, 19.6, BASTION },
				["questID"] = 60998,
				["groups"] = {
					i(184404),	-- Ever-Abundant Hearth (TOY!)
				},
			}),
			n(160721, {	-- Fallen Acolyte Erisne
			-- you defeat a non-rare version of this mob while on 57977 'a temple in need' / 57264 'on the edge of revelation' - figure out when the rare version becomes available, these quests or later
			-- cutscene phased the area during 57717, 'step back from that ledge, my friend' and the end of that storyline is 57447, 'purity's prerogative'
				["coord"] = { 60.5, 73.4, BASTION },
				["questID"] = 58222,
				["groups"] = {
					i(180444),	-- Harmonia's Chosen Belt
				},
			}),
			n(158659, {	-- Herculon
				["description"] = createLocalizationString({
					readable = "Pick up anima from the Depleted Anima Canisters around the chamber and the area outside. Feed them to Herculon to activate him.\n\nLoot will be in the Aspirant's Cache behind him after he is defeated.",
					constant = "PICK_UP_ANIMA_FROM_THE_DEPLETED_ANIMA_CANISTERS",
					export = true,
					text = {
						en = "Pick up anima from the Depleted Anima Canisters around the chamber and the area outside. Feed them to Herculon to activate him.\n\nLoot will be in the Aspirant's Cache behind him after he is defeated.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "从房间内及外面区域已耗尽的心能罐中拾取心能，把它们喂给赫库隆以激活他。\n\n击败他之后，战利品会在他身后的晋升者宝箱中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 43.0, 82.6, BASTION },
				["questID"] = 57708,
				["groups"] = {
					i(182759),	-- Functioning Anima Core
				},
			}),
			n(161529, {	-- Nemaeus
				["crs"] = { 161441 },	-- Orator Kloe
				["coord"] = { 55.3, 80.3, BASTION },
				["questID"] = 60569,
				["groups"] = {
					i(179485),	-- Fang of Nemaeus
				},
			}),
			n(160882, {	-- Nikara Blackheart
				["description"] = createLocalizationString({
					readable = "Requires 3 people to summon. After all 3 have channeled the incense, the vesper will ring and Sophia will appear. Protect her by defeating 2 waves of Forsworn attackers, and then the rare will spawn.\n\nAfter Nikara is defeated, Sophia will leave behind a chest called Sophia's Gift.",
					constant = "REQUIRES_3_PEOPLE_TO_SUMMON_AFTER_ALL_3_HAVE",
					export = true,
					text = {
						en = "Requires 3 people to summon. After all 3 have channeled the incense, the vesper will ring and Sophia will appear. Protect her by defeating 2 waves of Forsworn attackers, and then the rare will spawn.\n\nAfter Nikara is defeated, Sophia will leave behind a chest called Sophia's Gift.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要 3 人召唤。当 3 人全部引导完熏香后，晚祷钟会响起，索菲亚会出现。通过击败 2 波弃誓者攻击者来保护她，然后稀有就会刷新。\n\n击败尼卡拉后，索菲亚会留下一个名为索菲亚的礼物的箱子。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 51.8, 68.6, BASTION },
				["questID"] = 63411,
				["groups"] = {
					o(339625, {	-- Sophia's Gift
						["coord"] = { 51.7, 68.8, BASTION },
						["questID"] = 58319,
						["isDaily"] = true,
						["groups"] = { i(183608) },	-- Evernote Vesper
					}),
				},
			}),
			n(171327, {	-- Reekmonger
				["description"] = createLocalizationString({
					readable = "Killing the creatures in 'The Necrotic Wake' area will have a chance to make the dragon come down from the sky and become attackable.",
					constant = "KILLING_THE_CREATURES_IN_THE_NECROTIC_WAKE_AREA",
					export = true,
					text = {
						en = "Killing the creatures in 'The Necrotic Wake' area will have a chance to make the dragon come down from the sky and become attackable.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀“凋魂之殇”区域的生物，有几率使巨龙从天空降落并变为可攻击状态。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 30.3, 55.2, BASTION },
				["questID"] = 61108,
				["groups"] = {
					i(182749),	-- Regurgitated Kyrian Wings
				},
			}),
			n(160985, {	-- Selena the Reborn
				["description"] = createLocalizationString({
					readable = "Requires 3 people to summon. After all 3 have channeled the incense, the vesper will ring and Sophia will appear. Protect her by defeating 2 waves of Forsworn attackers, and then the rare will spawn.\n\nAfter Nikara is defeated, Sophia will leave behind a chest called Sophia's Radiance.",
					constant = "REQUIRES_3_PEOPLE_TO_SUMMON_AFTER_ALL_3_HAVE_2",
					export = true,
					text = {
						en = "Requires 3 people to summon. After all 3 have channeled the incense, the vesper will ring and Sophia will appear. Protect her by defeating 2 waves of Forsworn attackers, and then the rare will spawn.\n\nAfter Nikara is defeated, Sophia will leave behind a chest called Sophia's Radiance.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要 3 人召唤。当 3 人全部引导完熏香后，晚祷钟会响起，索菲亚会出现。通过击败 2 波弃誓者攻击者来保护她，然后稀有就会刷新。\n\n击败尼卡拉后，索菲亚会留下一个名为索菲亚的光辉的箱子。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 160875 },	-- Sophia
				["coord"] = { 61.2, 51.0, BASTION },
				["questID"] = 58320,
				["groups"] = {
					o(339625, {	-- Sophia's Radiance
						["coord"] = { 61.3, 50.4, BASTION },
						-- ["questID"] = ,
						-- ["isDaily"] = true,
						["groups"] = { i(183608) },	-- Evernote Vesper
					}),
				},
			}),
			n(161527, {	-- Sigilback
				["crs"] = { 161441 },	-- Orator Kloe
				["coord"] = { 55.3, 80.3, BASTION },
				["questID"] = 60570,
				["groups"] = {
					i(179486),	-- Sigilback's Smashshell
				},
			}),
			n(170548, {	-- Sundancer
				["description"] = createLocalizationString({
					readable = "Requires two Buffs to mount the rare. First buff is from the statue next to the rare & the second buff comes from the Skystrider Glider item.",
					constant = "REQUIRES_TWO_BUFFS_TO_MOUNT_THE_RARE_FIRST_BUFF",
					export = true,
					text = {
						en = "Requires two Buffs to mount the rare. First buff is from the statue next to the rare & the second buff comes from the Skystrider Glider item.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要两个增益才能骑上该稀有怪。第一个增益来自稀有怪旁边的雕像，第二个增益来自驭天滑翔器。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 60.6, 93.2, BASTION },
				["questID"] = 60862,
				["cost"] = { { "i", 180445, 1 } },	-- 1xSkystrider Glider
				["groups"] = {
					ach(14733, {	-- In the Hot Seat
						["description"] = createLocalizationString({
							readable = "Requires using the Skystrider Glider to bring Sundancer down. Being present for a kill will not grant credit.",
							constant = "REQUIRES_USING_THE_SKYSTRIDER_GLIDER_TO_BRING",
							export = true,
							text = {
								en = "Requires using the Skystrider Glider to bring Sundancer down. Being present for a kill will not grant credit.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要使用驭天滑翔器把逐日者引下来。仅仅在场旁观击杀不会计入。",
								-- TODO: tw = "",
							},
						}),
					}),
					i(180773),	-- Sundancer (MOUNT!)
				},
			}),
			n(171012, {	-- Swelling Tear
				["description"] = createLocalizationString({
					readable = "Swelling Tear has a chance to spawn Embodied Hunger, Worldfeaster Chronn, or Xixin the Ravening.",
					constant = "SWELLING_TEAR_HAS_A_CHANCE_TO_SPAWN_EMBODIED",
					export = true,
					text = {
						en = "Swelling Tear has a chance to spawn Embodied Hunger, Worldfeaster Chronn, or Xixin the Ravening.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "膨胀之泪有几率刷新出具象的饥饿、噬界者科隆或贪食者希辛。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 39.6, 45.0, BASTION },
					{ 46.8, 42.2, BASTION },
					{ 51.8, 21.0, BASTION },
					{ 52.2, 32.6, BASTION },
					{ 56.0, 14.2, BASTION },
					{ 59.8, 51.8, BASTION },
					{ 63.4, 36.0, BASTION },
				},
				["groups"] = {
					n(COMMON_BOSS_DROPS, {
						i(180869, {	-- Devoured Wader (PET!)
							["crs"] = {
								171013,	-- Embodied Hunger
								171041,	-- Worldfeaster Chronn
								171040,	-- Xixin the Ravening
							},
						}),
						i(183605, {	-- Devourer Wrought Warglaive
							["crs"] = {
								171013,	-- Embodied Hunger
								171041,	-- Worldfeaster Chronn
								171040,	-- Xixin the Ravening
							},
						}),
					}),
					n(171013, {	-- Embodied Hunger
						["questID"] = 61001,
						["isDaily"] = true,
					}),
					n(171041, {	-- Worldfeaster Chronn
						["questID"] = 61047,
						["isDaily"] = true,
					}),
					n(171040, {	-- Xixin the Ravening
						["questID"] = 61046,
						["isDaily"] = true,
					}),
				},
			}),
			n(171008, {	-- Unstable Memory
				["description"] = createLocalizationString({
					readable = "Get aggro on an Unstable Memory Fragment, drag it through more fragments until the mob has 10 stacks of Instability, and it will turn into the rare.\n\nIf Unstable Memory Fragments are not up, the rare is not available to summon.",
					constant = "GET_AGGRO_ON_AN_UNSTABLE_MEMORY_FRAGMENT_DRAG",
					export = true,
					text = {
						en = "Get aggro on an Unstable Memory Fragment, drag it through more fragments until the mob has 10 stacks of Instability, and it will turn into the rare.\n\nIf Unstable Memory Fragments are not up, the rare is not available to summon.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "对不稳定的记忆碎片获得仇恨，拖着它穿过更多碎片，直到该怪物拥有 10 层不稳定，它就会变成稀有怪。\n\n如果不稳定的记忆碎片没有刷新，就无法召唤该稀有怪。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 171018 },	-- Unstable Memory Fragment
				["coord"] = { 43.4, 25.2, BASTION },
				["questID"] = 60997,
				["groups"] = {
					i(184413),	-- Mnemonic Attunement Pane (TOY!)
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(SHADOWLANDS, {
		m(BASTION, {
			n(RARES, {
				q(63422),	-- Aethon secondary quest
				q(62192),	-- Baedos secondary quest
				q(62158),	-- Basilofos secondary quest
				q(62167),	-- Bookkeeper Mnemis secondary quest along with 59022
				q(62191),	-- Cloudfeather Guardian secondary quest
				q(63424),	-- Cloudtail secondary quest
				-- q(61069),	-- Demi the Relic Hoarder secondary quest
				-- q(61082),	-- Echo of Aella kill quest
				q(62251),	-- Echo of Aella secondary loot quest
				-- q(57705),	-- Herculon kill quest
				q(62201),	-- Herculon secondary loot quest
				q(63421),	-- Nemaeus secondary quest
				q(63410),	-- Selena the Reborn secondary quest (spellID 347866)
				q(63423),	-- Sigilback secondary quest
				q(62197),	-- Wingflayer the Cruel secondary quest
				q(62202),	-- triggers when killing Corrupted Clawguard, which drops Functioning Anima Core
				q(57741),	-- when defeating Sundancer after also having ridden Sundancer using the Skyfeather Glider
			}),
		}),
	}),
})));
