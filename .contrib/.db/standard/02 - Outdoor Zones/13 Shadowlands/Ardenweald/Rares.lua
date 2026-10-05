---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(ARDENWEALD, {
		n(RARES, sharedData({
			["isDaily"] = true,
		}, {
			n(164477, {	-- Deathbinder Hroth
				["coord"] = { 34.6, 68.0, ARDENWEALD },
				["questID"] = 59226,
				["groups"] = {
					i(180166),	-- Deathbinder's Staff
				},
			}),
			n(164238, {	-- Deifir the Untamed
				["description"] = createLocalizationString({
					readable = "The rare runs laps through the water. You can hop on its back slow it and periodically stun it.",
					constant = "THE_RARE_RUNS_LAPS_THROUGH_THE_WATER_YOU_CAN",
					export = true,
					text = {
						en = "The rare runs laps through the water. You can hop on its back slow it and periodically stun it.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "这只稀有生物会在水中绕圈奔跑。你可以跳到它背上让它减速，并周期性地眩晕它。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 47.6, 24.6, ARDENWEALD },
				["questID"] = 59201,
				["groups"] = {
					i(180631),	-- Gorm Needler (PET!)
				},
			}),
			n(163229, {	-- Dustbrawl
				["coord"] = { 48.6, 76.8, ARDENWEALD },
				["questID"] = 58987,
				["groups"] = {
					i(181395)	-- Dustbreak Maul
				},
			}),
			n(167851, {	-- Egg-Tender Leh'go
				["description"] = createLocalizationString({
					readable = "At the back of the cave. Destroy |cFFFFFFFFQuivering Gorm Eggs|r and defeat the Angry Egg-Tenders until the rare spawns.",
					constant = "AT_THE_BACK_OF_THE_CAVE_DESTROY",
					export = true,
					text = {
						en = "At the back of the cave. Destroy |cFFFFFFFFQuivering Gorm Eggs|r and defeat the Angry Egg-Tenders until the rare spawns.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在洞穴深处。摧毁|cFFFFFFFF颤动的戈姆之卵|r并击败愤怒的护卵者，直到稀有刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 171827 },	-- Angry Egg-Tender
				["coord"] = { 58.5, 31.8, ARDENWEALD },
				["questID"] = 60266,
				["groups"] = {
					i(179539),	-- Kelox's Eggbeater
				},
			}),
			n(171688, {	-- Faeflayer
				["description"] = createLocalizationString({
					readable = "In a cave behind a waterfall.",
					constant = "IN_A_CAVE_BEHIND_A_WATERFALL",
					export = true,
					text = {
						en = "In a cave behind a waterfall.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在瀑布后面的洞穴中。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 68.4, 29.4, ARDENWEALD },
				["questID"] = 61184,
				["groups"] = {
					i(180144),	-- Faeflayer's Hatchet
				},
			}),
			n(163370, {	-- Gormbore
				["description"] = createLocalizationString({
					readable = "Kill mobs on top of the dust cloud. Eventually, Watcher Ver'lo will yell a warning about something moving underground, at which point you've almost killed enough to force the rare to spawn.",
					constant = "KILL_MOBS_ON_TOP_OF_THE_DUST_CLOUD_EVENTUALLY",
					export = true,
					text = {
						en = "Kill mobs on top of the dust cloud. Eventually, Watcher Ver'lo will yell a warning about something moving underground, at which point you've almost killed enough to force the rare to spawn.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在尘云上方击杀怪物。最终，守望者维尔洛会喊出警告，说有东西在地下移动，此时你已经快要击杀足够数量来强制刷出该稀有了。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 53.8, 75.8, ARDENWEALD },
				["questID"] = 59006,
				["groups"] = {
					i(183196),	-- Lavender Nibbler (PET!)
				},
			}),
			n(164107, {	-- Gormtamer Tizo
				["description"] = createLocalizationString({
					readable = "Kill Deranged Guardians and Bristlecone Terrors until Chompy spawns. Gormtamer Tizo will spawn after Chompy is killed.",
					constant = "KILL_DERANGED_GUARDIANS_AND_BRISTLECONE_TERRORS",
					export = true,
					text = {
						en = "Kill Deranged Guardians and Bristlecone Terrors until Chompy spawns. Gormtamer Tizo will spawn after Chompy is killed.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "击杀疯狂的守护者和棘锥恐魔，直到嚼嚼刷新。击杀嚼嚼后，戈姆驯服者提佐会刷新。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 164110 },	-- Chompy
				["coord"] = { 28.4, 55.3, ARDENWEALD },
				["questID"] = 59145,
				["groups"] = {
					i(180725),	-- Spinemaw Gladechewer (MOUNT!)
				},
			}),
			n(164547, {	-- Mystic Rainbowhorn
				["description"] = createLocalizationString({
					readable = "The horn can randomly spawn at one of many locations in Ardenweald. When the horn is used, the Mystic Rainbowhorn will spawn at |cFFFFFFFF65.7, 28.1|r.",
					constant = "THE_HORN_CAN_RANDOMLY_SPAWN_AT_ONE_OF_MANY",
					export = true,
					text = {
						en = "The horn can randomly spawn at one of many locations in Ardenweald. When the horn is used, the Mystic Rainbowhorn will spawn at |cFFFFFFFF65.7, 28.1|r.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "号角可以随机刷新在炽蓝仙野的许多地点之一。使用号角时，秘法彩虹角鹿会在|cFFFFFFFF65.7, 28.1|r刷新。",
						-- TODO: tw = "",
					},
				}),
				["provider"] = { "o", 345446 },	-- Great Horn of the Runestag
				["coord"] = { 65.7, 28.1, ARDENWEALD },
				["questID"] = 59235,
				["groups"] = {
					i(182179),	-- Runestag Soul
					i(179586),	-- Elderwood Piercer
				},
			}),
			n(164112, {	-- Humon'gozz
				["crs"] = { 164122 },	-- Rapidly Growing Mushroom/Humon'gozz (npcID stays the same after it morphs from the mushroom into Humon'gozz)
				["coord"] = { 32.6, 31.0, ARDENWEALD },
				["questID"] = 59157,
				["cost"] = { { "i", 175247, 1 } },	-- 1x Unusually Large Mushroom
				["groups"] = {
					i(182650),	-- Arboreal Gulper (MOUNT!)
				},
			}),
			n(160448, {	-- Hunter Vivanna <The Wild Hunt>
				["coord"] = { 67.8, 51.2, ARDENWEALD },
				["questID"] = 59221,
				["groups"] = {
					i(183091),	-- Lifewoven Bracelet (QI!)
					i(180163),	-- Blackthorn Harvester
					i(180143),	-- Darkreach Hacker
					i(179593),	-- Darkreach Mask
					i(180155),	-- Darkreach Splitter
					i(180142),	-- Deadstone Hatchet
					i(179596),	-- Drust Mask of Dominance
					i(180153),	-- Drustwrought Executioner
					i(180162),	-- Drustwrought Scythe
					i(180156),	-- Witherscorn Greataxe
					i(179594),	-- Witherscorn Guise
					i(180145),	-- Witherscorn Handaxe
					i(180165),	-- Witherscorn Reaper
				},
			}),
			n(164093, {	-- Macabre
				["description"] = createLocalizationString({
					readable = "Shows up as 'Mysterious Mushroom Ring' on the minimap. Requires 3 players.\n\nAll 3 must stand in the Ring of Dance. Player 1 /dances with Player 2, Player 2 /dances with Player 3, and Player 3 /dances with Player 1.",
					constant = "SHOWS_UP_AS_MYSTERIOUS_MUSHROOM_RING_ON_THE",
					export = true,
					text = {
						en = "Shows up as 'Mysterious Mushroom Ring' on the minimap. Requires 3 players.\n\nAll 3 must stand in the Ring of Dance. Player 1 /dances with Player 2, Player 2 /dances with Player 3, and Player 3 /dances with Player 1.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在小地图上显示为“神秘蘑菇圈”。需要 3 名玩家。\n\n3 人都必须站在舞蹈之环中。玩家 1 对玩家 2 使用 /dance，玩家 2 对玩家 3 使用 /dance，玩家 3 对玩家 1 使用 /dance。",
						-- TODO: tw = "",
					},
				}),
				["coords"] = {
					{ 32.9, 44.4, ARDENWEALD },
					{ 36.4, 48.1, ARDENWEALD },
					{ 47.9, 40.2, ARDENWEALD },
				},
				["questID"] = 59140,
				["groups"] = {
					i(180644),	-- Rocky (PET!)
				},
			}),
			n(165053, {	-- Mymaen
				["description"] = createLocalizationString({
					readable = "Shared spawn with Rotbriar Scrappers.",
					constant = "SHARED_SPAWN_WITH_ROTBRIAR_SCRAPPERS",
					export = true,
					text = {
						en = "Shared spawn with Rotbriar Scrappers.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "与腐棘拾荒者共享刷新点。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 62.2, 24.8, ARDENWEALD },
				["questID"] = 59431,
				["groups"] = {
					i(179502),	-- Ripvine Barb
				},
			}),
			n(164391, {	-- Old Ardeite
				["description"] = createLocalizationString({
					readable = "Use either a |cff16bf0dPinch of Faerie Dust|r (dropped by the mobs in the area) or the buff from |cFFFFFFFFBasket of Enchanted Wings|r to fly up to the rare. When you get close enough, it will fly down and be attackable.",
					constant = "USE_EITHER_A_CFF16BF0DPINCH_OF_FAERIE_DUST_R",
					export = true,
					text = {
						en = "Use either a |cff16bf0dPinch of Faerie Dust|r (dropped by the mobs in the area) or the buff from |cFFFFFFFFBasket of Enchanted Wings|r to fly up to the rare. When you get close enough, it will fly down and be attackable.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用 |cff16bf0d一撮仙尘|r（由该区域内的怪物掉落）或 |cFFFFFFFF魔法翅膀篮|r 提供的增益效果，飞上稀有生物所在的位置。当你靠近到足够近时，它会飞下来并变为可攻击状态。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 52.0, 58.8, ARDENWEALD },
				["questID"] = 59208,
				["groups"] = {
					i(180643),	-- Chirpy Valeshrieker (PET!)
				},
			}),
			n(167726, {	-- Rootwrithe
				["description"] = createLocalizationString({
					readable = "Poke the Dormant Blossoms repeatedly to summon the rare.",
					constant = "POKE_THE_DORMANT_BLOSSOMS_REPEATEDLY_TO_SUMMON",
					export = true,
					text = {
						en = "Poke the Dormant Blossoms repeatedly to summon the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "反复戳动休眠的花蕾来召唤稀有。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = {
					167928,	-- Dormant Blossom
					167929,	-- Dormant Blossom
					167916,	-- Dormant Blossom
				},
				["coord"] = { 64.6, 44.0, ARDENWEALD },
				["questID"] = 60273,
				["groups"] = {
					i(179603),	-- Nettlehusk Barrier
				},
			}),
			n(167724, {	-- Rotbriar Boggart
				["coord"] = { 65.6, 24.0, ARDENWEALD },
				["crs"] = { 171684 },	-- Daffodil
				["questID"] = 60258,
				["groups"] = {
					i(175729),	-- Rotbriar Sprout
				},
			}),
			n(164415, {	-- Skuld Vit
				["description"] = createLocalizationString({
					readable = "Use soulshape to cross the barrier.",
					constant = "USE_SOULSHAPE_TO_CROSS_THE_BARRIER",
					export = true,
					text = {
						en = "Use soulshape to cross the barrier.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "使用灵魂变形穿过屏障。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 37.4, 59.6, ARDENWEALD },
				["questID"] = 59220,
				["groups"] = {
					i(182183),	-- Wolfhawk Soul
					i(180146),	-- Axe of Broken Wills
				},
			}),
			n(171451, {	-- Soultwister Cero
				["coord"] = { 72.4, 51.6, ARDENWEALD },
				["questID"] = 61177,
				["groups"] = {
					i(180164),	-- Soultwister's Scythe
				},
			}),
			n(167721, {	-- The Slumbering Emperor
				["description"] = createLocalizationString({
					readable = "You can use various toys (Darkmoon Cannon, Phial of Ravenous Slime), pet abilities, and AoE abilities to pull this rare. If you need help not falling asleep, pulling a nearby Greater Ardenmoth can apply a poison that will give you a few more seconds by waking you up with each tick.",
					constant = "YOU_CAN_USE_VARIOUS_TOYS_DARKMOON_CANNON_PHIAL",
					export = true,
					text = {
						en = "You can use various toys (Darkmoon Cannon, Phial of Ravenous Slime), pet abilities, and AoE abilities to pull this rare. If you need help not falling asleep, pulling a nearby Greater Ardenmoth can apply a poison that will give you a few more seconds by waking you up with each tick.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "你可以使用各种玩具（暗月大炮、贪食黏液小瓶）、宠物技能和范围伤害技能来拉这只稀有。如果你需要帮助以免睡着，拉一只附近的大型艾登蛾可以施加一种毒药，每次跳数都会把你唤醒，从而为你多争取几秒钟。",
						-- TODO: tw = "",
					},
				}),
				["coord"] = { 59.2, 46.6, ARDENWEALD },
				["questID"] = 60290,
				["groups"] = {
					i(183828),	-- Friendly Bugs
					i(175711),	-- Slumberwood Band
				},
			}),
			n(164147, {	-- Wrigglemortis
				["description"] = createLocalizationString({
					readable = "Pull on the Wriggling Tendril to spawn the rare.",
					constant = "PULL_ON_THE_WRIGGLING_TENDRIL_TO_SPAWN_THE_RARE",
					export = true,
					text = {
						en = "Pull on the Wriggling Tendril to spawn the rare.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "拉动扭动的卷须来刷新稀有。",
						-- TODO: tw = "",
					},
				}),
				["crs"] = { 164179 },	-- Wriggling Tendril
				["coord"] = { 58.0, 61.6, ARDENWEALD },
				["questID"] = 59170,
				["groups"] = {
					i(181396),	-- Thornsweeper Scythe
				},
			}),
		})),
	}),
})));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(SHADOWLANDS, {
		m(ARDENWEALD, {
			n(RARES, {
				q(62267),	-- Gormbore secondary quest
				q(62269),	-- Macabre secondary quest
				q(62270),	-- Old Ardeite secondary quest
				q(62271),	-- Deifir the Untamed secondary quest
				q(61198),	-- Triggers when successfully completing the pre-req sequence for the Shimmermist Runner rare
			}),
		}),
	}),
})));
