-------------------------------------------
--     S E C R E T S     M O D U L E     --
-------------------------------------------

FAITHFUL_DOG = createHeader({
	readable = "Faithful Dog",
	icon = 538568,
	text = {
		en = "Faithful Dog",
		de = "Treuer Hund",
		es = "Perro fiel",
		mx = "Perro fiel",
		fr = "Chien fidèle",
		it = "Cane Fedele",
		ko = "충직한 개",
		pt = "Cão Fiel",
		ru = "Верный пес",
		cn = "忠诚的狗",
		tw = "忠實的狗",
	},
});

root(ROOTS.Secrets, n(FAITHFUL_DOG, {
	["description"] = createLocalizationString({
		readable = "Multi-expansion secret to obtaining Dog as a companion pet.",
		constant = "MULTI_EXPANSION_SECRET_TO_OBTAINING_DOG_AS_A",
		export = true,
		text = {
			en = "Multi-expansion secret to obtaining Dog as a companion pet.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "跨多个资料片的秘密，可将“狗”作为战斗宠物获得。",
			-- TODO: tw = "",
		},
	}),
	["displayID"] = 1100,
	["timeline"] = { ADDED_5_0_4 },
	["groups"] = {
		q(30526, {	-- Step 1: Lost and Lonely
			["provider"] = { "n", 59533 },	-- Lost Dog
			["coord"] = { 42.4, 50.2, VALLEY_OF_THE_FOUR_WINDS },
			["minReputation"] = { FACTION_THE_TILLERS, REVERED+600 },	-- The Tillers, 12600 Rep
			["timeline"] = { ADDED_5_0_4 },
			["groups"] = {
				i(80144),	-- Tasty T-Bone (QI!)
				i(248663, {	-- Wooden Doghouse (DECOR!)
					["timeline"] = { ADDED_11_2_7 },
				}),
			},
		}),
		hqt(46952, name(HEADERS.Item, 147420, {	-- Step 2: Pebble (Show the Pebble to Dog)
			["description"] = createLocalizationString({
				readable = "Find a Loose Pebble on the streets of (Legion) Dalaran. Build an Herb Garden in your garrison.\nSpeak with Dog and show him the Pebble. Do not throw the Pebble at Dog.",
				constant = "FIND_A_LOOSE_PEBBLE_ON_THE_STREETS_OF_LEGION",
				export = true,
				text = {
					en = "Find a Loose Pebble on the streets of (Legion) Dalaran. Build an Herb Garden in your garrison.\nSpeak with Dog and show him the Pebble. Do not throw the Pebble at Dog.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "在（军团再临）达拉然的街道上找到一颗松动的卵石。在你的要塞中建造一座草药园。\n与“狗”交谈并把卵石给他看。不要把卵石扔向“狗”。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = {
				30526,	-- Lost and Lonely
				36404,	-- Clearing the Garden [A]
				34193,	-- Clearing the Garden [H]
			},
			["providers"] = {
				{ "n", 87553 },	-- Dog
				{ "i", 147420 },	-- Pebble
			},
			["coords"] = {
				{ 44.6, 84.8, FROSTWALL },
				{ 58.8, 53.8, LUNARFALL },
			},
			["timeline"] = { ADDED_7_2_0 },
		})),
		hqt(83093, name(HEADERS.Object, 452438, bubbleDownSelf({ ["timeline"] = { ADDED_11_0_2 } }, {	-- Step 3: Half-Buried Dog Bowl
			["description"] = createLocalizationString({
				readable = "Interact with the bowl near Dalaran's crash site to bring Dog out of hiding.",
				constant = "INTERACT_WITH_THE_BOWL_NEAR_DALARAN_S_CRASH",
				export = true,
				text = {
					en = "Interact with the bowl near Dalaran's crash site to bring Dog out of hiding.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "与达拉然坠毁点附近的碗互动，把狗狗引出来。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 46952 },
			["provider"] = { "o", 452438 },	-- Half-Buried Dog Bowl
			["coord"] = { 31.4, 51.3, ISLE_OF_DORN },
		}))),
		hqt(83094, name(HEADERS.NPC, 225486, bubbleDownSelf({ ["timeline"] = { ADDED_11_0_2 } }, {	-- Step 4: Interact with Dog
			["description"] = createLocalizationString({
				readable = "Interact with Dog and <Pet his head> to get him as a pet.",
				constant = "INTERACT_WITH_DOG_AND_PET_HIS_HEAD_TO_GET_HIM",
				export = true,
				text = {
					en = "Interact with Dog and <Pet his head> to get him as a pet.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "与狗狗互动并<抚摸它的头>把它收为宠物。",
					-- TODO: tw = "",
				},
			}),
			["sourceQuests"] = { 83093 },
			["provider"] = { "n", 225486 },	-- Dog
			["coord"] = { 31.4, 51.3, ISLE_OF_DORN },
			["groups"] = { i(224766) },	-- Faithful Dog (PET!)
		}))),
	},
}));
