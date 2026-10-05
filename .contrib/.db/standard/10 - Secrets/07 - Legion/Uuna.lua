-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, expansion(EXPANSION.LEGION, {
	header(HEADERS.Spell, 254763, bubbleDownSelf({ ["timeline"] = { ADDED_7_3_0 } }, {	-- Uuna
		["lore"] = "Uuna was found bound to an Ur'zul, and was released into the Shadowlands, where she wandered in the utter darkness.",
		["description"] = createLocalizationString({
			readable = "This secret is a prerequisite for Baa'l. It requires having collected |cff0070d0Uuna's Doll|r, which drops from |cff883325The Many-Faced Devourer|r, a Rare Elite in Antoran Wastes.",
			constant = "THIS_SECRET_IS_A_PREREQUISITE_FOR_BAA_L_IT",
			export = true,
			text = {
				en = "This secret is a prerequisite for Baa'l. It requires having collected |cff0070d0Uuna's Doll|r, which drops from |cff883325The Many-Faced Devourer|r, a Rare Elite in Antoran Wastes.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "此秘密是巴尔的前置条件。它需要你已收集 |cff0070d0乌娜的玩偶|r，该物品由安托兰废土的稀有精英 |cff883325千面吞噬者|r 掉落。",
				-- TODO: tw = "",
			},
		}),
		["modelScale"] = 1.1,
		["displayID"] = 76829,
		["groups"] = {
			hqt(50098, {	-- Steps 1-4: A New Friend
				["name"] = "Steps 1-4: A New Friend",
				["description"] = createLocalizationString({
					readable = "1. Summon Uuna and wait for her to say one of the following lines:\n'|cffffffffMama? Mama! Why is it so dark? It's scary here...|r'\n'|cffffffffCan anybody hear me?|r'\n'|cffffffffC-c-cold...|r'\n",
					constant = "1_SUMMON_UUNA_AND_WAIT_FOR_HER_TO_SAY_ONE_OF",
					export = true,
					text = {
						en = "1. Summon Uuna and wait for her to say one of the following lines:\n'|cffffffffMama? Mama! Why is it so dark? It's scary here...|r'\n'|cffffffffCan anybody hear me?|r'\n'|cffffffffC-c-cold...|r'\n",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "1. 召唤乌娜，等待她说出以下台词之一：\n'|cffffffff妈妈？妈妈！为什么这么黑？这里好可怕……|r'\n'|cffffffff有人能听见我吗？|r'\n'|cffffffff好……好冷……|r'\n",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["groups"] = {
					hqt(50099, {	-- /whistle at Uuna
						["name"] = "2. /whistle at Uuna",
						["description"] = createLocalizationString({
							readable = "2. |cffffffff/whistle|r at Uuna.\n",
							constant = "2_CFFFFFFFF_WHISTLE_R_AT_UUNA",
							export = true,
							text = {
								en = "2. |cffffffff/whistle|r at Uuna.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "2. 对乌娜使用 |cffffffff/whistle|r。\n",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 50098 },	-- Steps 1-4: A New Friend
					}),
					hqt(50100, {	-- /roar at Uuna
						["name"] = "3. /roar at Uuna",
						["description"] = createLocalizationString({
							readable = "3. When she asks you questions, |cffffffff/roar|r at her.\n",
							constant = "3_WHEN_SHE_ASKS_YOU_QUESTIONS_CFFFFFFFF_ROAR_R",
							export = true,
							text = {
								en = "3. When she asks you questions, |cffffffff/roar|r at her.\n",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "3. 当她向你提问时，对她使用 |cffffffff/roar|r。\n",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 50098 },	-- Steps 1-4: A New Friend
					}),
					hqt(50101, {	-- /cry at Uuna
						["name"] = "4. /cry at Uuna",
						["description"] = createLocalizationString({
							readable = "4. Resummon Uuna and |cffffffff/cry|r at her. She will tell you that she wishes she could see you better, but it's too dark where she is.",
							constant = "4_RESUMMON_UUNA_AND_CFFFFFFFF_CRY_R_AT_HER_SHE",
							export = true,
							text = {
								en = "4. Resummon Uuna and |cffffffff/cry|r at her. She will tell you that she wishes she could see you better, but it's too dark where she is.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "4. 重新召唤乌娜，并对她使用 |cffffffff/cry|r。她会告诉你，她希望能更清楚地看到你，但她所在的地方太暗了。",
								-- TODO: tw = "",
							},
						}),
						["sourceQuests"] = { 50098 },	-- Steps 1-4: A New Friend
					}),
				},
			}),
			hqt(50102, {	-- Step 5: Bright Lights
				["name"] = "Step 5: Bright Lights",
				["description"] = createLocalizationString({
					readable = "Take Uuna to A'dal in Shattrath City. The light of the Naaru is too bright, and she will run away.",
					constant = "TAKE_UUNA_TO_A_DAL_IN_SHATTRATH_CITY_THE_LIGHT",
					export = true,
					text = {
						en = "Take Uuna to A'dal in Shattrath City. The light of the Naaru is too bright, and she will run away.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "带乌娜前往沙塔斯城的阿达尔处。纳鲁的光芒太过耀眼，她会跑开。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50098 },	-- Steps 1-4: A New Friend
				["coord"] = { 54.0, 44.7, SHATTRATH_CITY },
			}),
			hqt(50103, {	-- Step 6: Wanna be Friends?
				["name"] = "Step 6: Wanna be Friends?",
				["description"] = createLocalizationString({
					readable = "Take Uuna to the moonlight by Ashenvale's Lake Falathim.",
					constant = "TAKE_UUNA_TO_THE_MOONLIGHT_BY_ASHENVALE_S_LAKE",
					export = true,
					text = {
						en = "Take Uuna to the moonlight by Ashenvale's Lake Falathim.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "带乌娜前往灰谷法拉希姆湖旁的月光处。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50102 },	-- Step 5: Bright Lights
				["coord"] = { 18.9, 41.6, ASHENVALE },
			}),
			hqt(50104, {	-- Step 7: Finding Nuu
				["name"] = "Step 7: Finding Nuu",
				["description"] = createLocalizationString({
					readable = "Most classes will need 2 |cffffffffGoblin Glider Kits|r to reach Nuu, who is in a house on a floating island in southwest Eredath.\n\nStart near the entrance to Seat of the Triumvirate and glide to the small rock, and then use your second glider to coast to the island further to the south.",
					constant = "MOST_CLASSES_WILL_NEED_2_CFFFFFFFFGOBLIN_GLIDER",
					export = true,
					text = {
						en = "Most classes will need 2 |cffffffffGoblin Glider Kits|r to reach Nuu, who is in a house on a floating island in southwest Eredath.\n\nStart near the entrance to Seat of the Triumvirate and glide to the small rock, and then use your second glider to coast to the island further to the south.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "大多数职业需要 2 个|cffffffff地精滑翔器工具包|r才能到达努乌，他位于艾瑞达斯西南部一座浮空岛上的房子里。\n\n从执政团之座入口附近出发，滑翔到那块小岩石上，然后使用第二个滑翔器滑向更南边的那座岛。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 133632,
				["sourceQuests"] = { 50103 },	-- Step 6: Wanna be Friends?
				["coords"] = {
					{ 32.6, 74.9, EREDATH },	-- house with Nuu
					{ 25.1, 59.8, EREDATH },	-- first little rock to jump to
				},
			}),
			hqt(50105, {	-- Step 8: Shooting Stars
				["name"] = "Step 8: Shooting Stars",
				["description"] = createLocalizationString({
					readable = "Take Uuna to Blood Watch on Bloodmyst Isle.",
					constant = "TAKE_UUNA_TO_BLOOD_WATCH_ON_BLOODMYST_ISLE",
					export = true,
					text = {
						en = "Take Uuna to Blood Watch on Bloodmyst Isle.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "带乌娜前往秘血岛的血望岗哨。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50104 },	-- Step 7: Finding Nuu
				["coord"] = { 56.5, 56.6, BLOODMYST_ISLE },
			}),
			hqt(50106, {	-- Step 9: Flower Crown
				["name"] = "Step 9: Flower Crown",
				["description"] = createLocalizationString({
					readable = "Take Uuna to the small campsite northwest of Path of the Light in Draenor's Shadowmoon Valley. She will pick up the flower crown that is resting on one of the chairs around the campfire.",
					constant = "TAKE_UUNA_TO_THE_SMALL_CAMPSITE_NORTHWEST_OF",
					export = true,
					text = {
						en = "Take Uuna to the small campsite northwest of Path of the Light in Draenor's Shadowmoon Valley. She will pick up the flower crown that is resting on one of the chairs around the campfire.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "带乌娜前往德拉诺影月谷圣光之路西北方的小营地。她会捡起放在篝火旁一把椅子上的花环。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50105 },	-- Step 8: Shooting Stars
				["coord"] = { 56.0, 41.1, DRAENOR_SHADOWMOON_VALLEY },
			}),
			hqt(50107, {	-- Step 10: Uuna Gets Kidnapped
				["name"] = "Step 10: Uuna Gets Kidnapped",
				["description"] = createLocalizationString({
					readable = "Wait for a little while after Uuna picks up the flower crown. Void tendrils will eventually erupt from the ground and take her captive.",
					constant = "WAIT_FOR_A_LITTLE_WHILE_AFTER_UUNA_PICKS_UP_THE",
					export = true,
					text = {
						en = "Wait for a little while after Uuna picks up the flower crown. Void tendrils will eventually erupt from the ground and take her captive.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在乌娜捡起花冠后稍等片刻。虚空触须最终会从地面涌出并把她抓走。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50106 },	-- Step 9: Flower Crown
			}),
			hqt(50108, {	-- Step 11: Spirit Healer
				["name"] = "Step 11: Spirit Healer",
				["description"] = createLocalizationString({
					readable = "Die and ask a Spirit Healer if they have seen Uuna. The Spirit Healer will give you permission to enter the spirit realm to try to find her. Resurrect (no need to do it through the Spirit Healer, just return to your corpse) and continue to the next step.",
					constant = "DIE_AND_ASK_A_SPIRIT_HEALER_IF_THEY_HAVE_SEEN",
					export = true,
					text = {
						en = "Die and ask a Spirit Healer if they have seen Uuna. The Spirit Healer will give you permission to enter the spirit realm to try to find her. Resurrect (no need to do it through the Spirit Healer, just return to your corpse) and continue to the next step.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "死亡后询问灵魂医者是否见过乌娜。灵魂医者会允许你进入灵魂之境寻找她。复活（无需通过灵魂医者，直接回到尸体处即可），然后继续下一步。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50107 },	-- Step 10: Uuna Gets Kidnapped
				["coord"] = { 52.1, 47.7, DRAENOR_SHADOWMOON_VALLEY },	-- Nearest spirit healer
			}),
			hqt(50109, {	-- Step 12: A Dark Place
				["name"] = "Step 12: A Dark Place",
				["description"] = createLocalizationString({
					readable = "Click on the Shadow Tear in Dragonblight's Emerald Dragonshrine to look for Uuna in the spirit realm. Once inside, do the following:\n\n1. |cffffffff/cheer|r at Uuna.\n2. Place a |cffffffffCooking Fire|r next to her.\n3. Survive the gauntlet for 3 minutes, running into the |cff883325Soul-Eaters|r to scare them away.\n4. When Uuna wraps her arms around herself and cries, |cffffffff/hug|r her.",
					constant = "CLICK_ON_THE_SHADOW_TEAR_IN_DRAGONBLIGHT_S",
					export = true,
					text = {
						en = "Click on the Shadow Tear in Dragonblight's Emerald Dragonshrine to look for Uuna in the spirit realm. Once inside, do the following:\n\n1. |cffffffff/cheer|r at Uuna.\n2. Place a |cffffffffCooking Fire|r next to her.\n3. Survive the gauntlet for 3 minutes, running into the |cff883325Soul-Eaters|r to scare them away.\n4. When Uuna wraps her arms around herself and cries, |cffffffff/hug|r her.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "点击龙骨荒野翡翠龙眠神殿中的暗影之泪，以在灵魂领域中寻找乌娜。进入后进行以下操作：\n\n1. 对乌娜使用|cffffffff/cheer|r。\n2. 在她旁边放置一个|cffffffff烹饪火堆|r。\n3. 在试炼中存活 3 分钟，冲向|cff883325噬魂者|r把它们吓跑。\n4. 当乌娜抱住自己哭泣时，对她使用|cffffffff/hug|r。",
						-- TODO: tw = "",
					},
				}),
				["icon"] = 134506,
				["sourceQuests"] = { 50108 },	-- Step 11: Spirit Healer
				["provider"] = { "o", 280747 },	-- Shadow Tear
				["coord"] = { 66.2, 74.5, DRAGONBLIGHT },
			}),
			n(createHeader({
				readable = "Uuna's World Tour",
				icon = 134507,
				text = {
					en = "Uuna's World Tour",
					de = "Uunas Welttournee",
					es = "Gira mundial de Uuna",
					-- TODO: mx = "",
					fr = "Tour du monde d’Uuna",
					it = "Il tour mondiale di Uuna",
					-- TODO: ko = "",
					pt = "Tour Mundial de Uuna",
					ru = "Приключения с Ууной",
					cn = "尤娜的世界旅行",
					-- TODO: tw = "",
				},
				description = {
					en = "Congrats on making it this far! Now it's time to take your favorite li'l ghost on a world tour.",
					cn = "恭喜你走到这一步！现在，是时候带你最喜欢的小幽灵去环游世界了。",
				},
			}), {
				hqt(50140, {	-- Step 1: Gate of the Setting Sun
					["name"] = "Step 1: Gate of the Setting Sun",
					["icon"] = 134506,
					["sourceQuests"] = { 50109 },	-- Step 12: A Dark Place
					["coord"] = { 8.00, 59.0, VALE_OF_ETERNAL_BLOSSOMS },
				}),
				hqt(50141, {	-- Step 2: Nighthold
					["name"] = "Step 2: Nighthold",
					["icon"] = 134506,
					["sourceQuests"] = { 50140 },	-- Step 1: Gate of the Setting Sun
					["coord"] = { 62.3, 83.7, SURAMAR },
				}),
				hqt(50142, {	-- Step 3: Krasus Landing, Legion Dalaran
					["name"] = "Step 3: Krasus Landing, Legion Dalaran",
					["icon"] = 134506,
					["sourceQuests"] = { 50141 },	-- Step 2: Nighthold
					["coord"] = { 72.4, 45.9, LEGION_DALARAN },
				}),
				hqt(50143, {	-- Step 4: Dragonblight
					["name"] = "Step 4: Dragonblight",
					["icon"] = 134506,
					["sourceQuests"] = { 50142 },	-- Step 3: Krasus Landing, Legion Dalaran
					["coord"] = { 57.8, 54.6, DRAGONBLIGHT },
				}),
				hqt(50144, {	-- Step 5: Mount Hyjal
					["name"] = "Step 5: Mount Hyjal",
					["icon"] = 134506,
					["sourceQuests"] = { 50143 },	-- Step 4: Dragonblight
					["coord"] = { 59.0, 24.1, MOUNT_HYJAL },
				}),
				hqt(50145, {	-- Step 6: Kun-Lai Summit
					["name"] = "Step 6: Kun-Lai Summit",
					["icon"] = 134506,
					["sourceQuests"] = { 50144 },	-- Step 5: Mount Hyjal
					["coord"] = { 44.8, 52.3, KUN_LAI_SUMMIT },
				}),
				hqt(50146, {	-- Step 7: Blackrock Mountain
					["name"] = "Step 7: Blackrock Mountain",
					["icon"] = 134506,
					["sourceQuests"] = { 50145 },	-- Step 6: Kun-Lai Summit
					["coords"] = {
						{ 37.5, 67.4, BLACKROCK_MOUNTAIN },
						{ 21.1, 38.4, BURNING_STEPPES },
					},
				}),
				hqt(50147, {	-- Step 8: Temple of Karabor
					["name"] = "Step 8: Temple of Karabor",
					["icon"] = 134506,
					["sourceQuests"] = { 50146 },	-- Step 7: Blackrock Mountain
					["coord"] = { 70.7, 46.7, DRAENOR_SHADOWMOON_VALLEY },
				}),
			}),
		},
	})),
}));
