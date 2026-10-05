---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

CHETT = createHeader({
	readable = "C.H.E.T.T.",
	constant = "CHETT",
	icon = 134391,
	text = {
		en = "C.H.E.T.T.",
		de = "C.H.E.T.T.",
		es = "T.C.E.H.T.",
		mx = "T.A.R.E.A.S.",
		fr = "C.H.E.T.T.",
		it = "C.I.H.T.T.",
		ko = "안.녕.거.기.",
		pt = "C.H.A.T.A.",
		ru = "КРОТ",
		tw = "C.H.E.T.T.",
	},
});

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(UNDERMINE, {
		n(CHETT, bubbleDownSelf({ ["minReputation"] = { FACTION_CARTELS_OF_UNDERMINE, 13 } }, {
			["description"] = createLocalizationString({
				readable = "Once per week you can interact with the C.H.E.T.T. machine to receive a weekly set of tasks with rewards for completing each one. You can turn in a completed list to C.H.E.T.T. for some valorstones or to your cartel's quartermaster for 500 rep.",
				constant = "ONCE_PER_WEEK_YOU_CAN_INTERACT_WITH_THE_C_H_E_T",
				export = true,
				text = {
					en = "Once per week you can interact with the C.H.E.T.T. machine to receive a weekly set of tasks with rewards for completing each one. You can turn in a completed list to C.H.E.T.T. for some valorstones or to your cartel's quartermaster for 500 rep.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "每周你可以与 C.H.E.T.T. 机器互动一次，领取一组每周任务，每完成一项都有奖励。你可以将完成的清单交给 C.H.E.T.T. 换取一些神勇石，或交给你所属财阀的军需官换取 500 点声望。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				n(ACHIEVEMENTS, {
					ach(41626),	-- C.H.E.T.T. a Look
					ach(41627),	-- C.H.E.T.T.ing it Twice
					ach(41629, {	-- C.H.E.T.T.mate
						["description"] = createLocalizationString({
							readable = "Turning in a completed list for a Finders Fee will |cffff0000NOT|r give achievement credit.",
							constant = "TURNING_IN_A_COMPLETED_LIST_FOR_A_FINDERS_FEE",
							export = true,
							text = {
								en = "Turning in a completed list for a Finders Fee will |cffff0000NOT|r give achievement credit.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "提交已完成的清单以换取寻宝者报酬将|cffff0000不会|r获得成就进度。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							title(616),	-- Part-Timer <Name>
						},
					}),
					ach(41630, {	-- "Employee" of the Month
						["description"] = createLocalizationString({
							readable = "Rumored to be obtainable by turning in the most Chett Cards on a single Character in a month.\nOnly 1 Person per Region can get it.\nExpect minimum 150+ Card Turn-in's.",
							constant = "RUMORED_TO_BE_OBTAINABLE_BY_TURNING_IN_THE_MOST",
							export = true,
							text = {
								en = "Rumored to be obtainable by turning in the most Chett Cards on a single Character in a month.\nOnly 1 Person per Region can get it.\nExpect minimum 150+ Card Turn-in's.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "据传，单个月内在单个角色上上交最多的 C.H.E.T.T. 卡片即可获得。\n每个地区只有 1 人能够获得。\n预计至少需要上交 150 张以上卡片。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = {
							title(617, {	-- <Name>, "Employee" of the Month
								["collectible"] = false,	-- You only keep it for a few days
							}),
						},
					}),
				}),
				n(QUESTS, sharedData({["isWeekly"]=true,}, {
					q(87303),	-- Clean the Sidestreets
					q(87305),	-- Desire to D.R.I.V.E.
					q(87307),	-- Garbage Day
					q(86923),	-- Go Fish
					q(86924),	-- Gotta Catch at Least a Few
					q(87306),	-- Kaja Cruising
					q(87302),	-- Rare Rivals
					q(86918),	-- Reclaimed Scrap
					q(86915),	-- Side with a Cartel
					q(86919),	-- Side Gig
					q(86917),	-- Ship Right
					q(87304),	-- Time to Vacate
					q(86920),	-- War Mode Violence
				})),
				n(REWARDS, {
					i(235053, {	-- Completed C.H.E.T.T. List
						["cost"] = { { "i", 236682, 1 } },	-- C.H.E.T.T. List
					}),
				}),
				n(VENDORS, {
					n(238029, {	-- C.H.E.T.T.
						["coord"] = { 43.4, 50.5, UNDERMINE },
						["groups"] = {
							i(236682, {	-- C.H.E.T.T. List
								["description"] = createLocalizationString({
									readable = "Talk to C.H.E.T.T. to be granted one for free, or turn in 40 C.H.E.T.T. cards to earn more after your first.",
									constant = "TALK_TO_C_H_E_T_T_TO_BE_GRANTED_ONE_FOR_FREE_OR",
									export = true,
									text = {
										en = "Talk to C.H.E.T.T. to be granted one for free, or turn in 40 C.H.E.T.T. cards to earn more after your first.",
										-- TODO: de = "",
										-- TODO: es = "",
										-- TODO: mx = "",
										-- TODO: fr = "",
										-- TODO: it = "",
										-- TODO: ko = "",
										-- TODO: pt = "",
										-- TODO: ru = "",
										cn = "与 C.H.E.T.T. 交谈可免费获得一个，或者在获得第一个之后上交 40 张 C.H.E.T.T. 卡片以换取更多。",
										-- TODO: tw = "",
									},
								}),
								["cost"] = { { "i", 236668, 40 } },	-- C.H.E.T.T. Card
							}),
							i(237900, {	-- C.H.E.T.T. Pack (COSMETIC!)
								["sourceAchievement"] = 41629,	-- C.H.E.T.T.mate
								["cost"] = { { "c", RESONANCE_CRYSTALS, 1000 } },
							}),
						},
					}),
				}),
			},
		})),
	}),
}));

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.TWW, {
	m(KHAZ_ALGAR, {
		m(UNDERMINE, bubbleDownSelf({ ["timeline"] = { ADDED_11_1_0 } }, {
			header(HEADERS.Faction, FACTION_CARTELS_OF_UNDERMINE, {
				n(CHETT, {
					q(87296, name(HEADERS.Item, 235053, { ["isWeekly"] = true })),	-- Free C.H.E.T.T. List acquired (spellID 1219077)
				}),
			}),
		})),
	}),
}));
