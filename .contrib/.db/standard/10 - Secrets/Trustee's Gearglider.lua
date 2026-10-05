-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

root(ROOTS.Secrets, header(HEADERS.Item, 186639, {	-- Xy Trustee's Gearglider
	["description"] = createLocalizationString({
		readable = "You can use one Cartel Deal per week on your account, across three weeks, equip the granted title then collect each dead drop within Manaforge Omega (Any difficulty) then return to the quartermaster for a new quest awarding your mount.",
		constant = "YOU_CAN_USE_ONE_CARTEL_DEAL_PER_WEEK_ON_YOUR",
		export = true,
		text = {
			en = "You can use one Cartel Deal per week on your account, across three weeks, equip the granted title then collect each dead drop within Manaforge Omega (Any difficulty) then return to the quartermaster for a new quest awarding your mount.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "你的账号每周可以使用一次财团交易，持续三周，装备所获得的头衔，然后在法力熔炉欧米茄（任意难度）内收集每个秘密投放点，最后返回军需官处领取奖励坐骑的新任务。",
			-- TODO: tw = "",
		},
	}),
	["minReputation"] = { FACTION_MANAFORGE_VANDALS, 8 },
	["timeline"] = { ADDED_11_2_0 },
	["maps"] = {
		2460,	-- The Forge Core
		2461,	-- The Unbound Vault
		2462,	-- Cultivation Chambers
		2463,	-- Technomancers' Terrace
		2464,	-- Central Operations
		2465,	-- Wastes of Karesh
		2466,	-- The Shadow Docks
		2467,	-- Seat of the Devourer
		2468,	-- Remnants of Conquest
		2469,	-- Remnants of Entropy
		2470,	-- Devourer's Heart
		2471,	-- The Dark Heart
	},
	["groups"] = {
		o(555609, {	-- Cartel Ba Dead Drop
			["description"] = createLocalizationString({
				readable = "To the right of the first miniboss after Plexus.",
				constant = "TO_THE_RIGHT_OF_THE_FIRST_MINIBOSS_AFTER_PLEXUS",
				export = true,
				text = {
					en = "To the right of the first miniboss after Plexus.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在普莱克斯之后的第一个小首领右侧。",
					-- TODO: tw = "",
				},
			}),
			["maps"] = 2460,	-- The Forge Core
			["cost"] = { { "i", 249702, 1 } },	-- Deal: Cartel Ba
			["minReputation"] = { FACTION_MANAFORGE_VANDALS, 8 },
			["questID"] = 92080,
			["groups"] = { i(249711) },	-- Cartel Ba Cypher
		}),
		o(555611, {	-- Cartel Om Dead Drop
			["description"] = createLocalizationString({
				readable = "On a rock past Fractillus near the edge of the map.",
				constant = "ON_A_ROCK_PAST_FRACTILLUS_NEAR_THE_EDGE_OF_THE",
				export = true,
				text = {
					en = "On a rock past Fractillus near the edge of the map.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在弗拉克提鲁斯之后、地图边缘附近的一块岩石上。",
					-- TODO: tw = "",
				},
			}),
			["maps"] = 2465,	-- Wastes of Karesh
			["cost"] = { { "i", 249704, 1 } },	-- Deal: Cartel Om
			["minReputation"] = { FACTION_MANAFORGE_VANDALS, 8 },
			["questID"] = 92081,
			["groups"] = { i(249712) },	-- Cartel Om Cypher
		}),
		o(555610, {	-- Cartel Zo Dead Drop
			["description"] = createLocalizationString({
				readable = "On top of a pipe in Mana-Vent Aphis before Forgeweaver Araz.\n\nThis cannot be looted in a cleared instance!",
				constant = "ON_TOP_OF_A_PIPE_IN_MANA_VENT_APHIS_BEFORE",
				export = true,
				text = {
					en = "On top of a pipe in Mana-Vent Aphis before Forgeweaver Araz.\n\nThis cannot be looted in a cleared instance!",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在法力喷口阿菲斯的一根管道顶部，位于织炉者阿拉兹之前。\n\n在已清空的副本中无法拾取此物品！",
					-- TODO: tw = "",
				},
			}),
			["maps"] = 2463,	-- Technomancers' Terrace
			["cost"] = { { "i", 249700, 1 } },	-- Deal: Cartel Zo
			["minReputation"] = { FACTION_MANAFORGE_VANDALS, 8 },
			["questID"] = 92079,
			["groups"] = { i(249710) },	-- Cartel Zo Cypher
		}),
		q(92082, {	-- Someone Like Me
			["sourceQuests"] = {
				92080,	-- Cartel Ba Cypher
				92081,	-- Cartel Om Cypher
				92079,	-- Cartel Zo Cypher
			},
			["qg"] = 245344,	-- Zo'turu <Renown Quartermaster>
			["coords"] = { 42.0, 22.1, KARESH },
			["groups"] = {
				i(249713),	-- Cartel Transmorpher (TOY!)
				i(186639),	-- Xy Trustee's Gearglider (MOUNT!)
			},
		}),
	},
}));
