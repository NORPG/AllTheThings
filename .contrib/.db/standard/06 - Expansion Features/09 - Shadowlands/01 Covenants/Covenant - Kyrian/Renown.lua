-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

local WISPS_OF_MEMORY = i(186472, {	-- Wisps of Memory
	["description"] = createLocalizationString({
		readable = "Rewarded at 52, 67 and 76 Renown.",
		constant = "REWARDED_AT_52_67_AND_76_RENOWN",
		export = true,
		text = {
			en = "Rewarded at 52, 67 and 76 Renown.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "在名望 52、67 和 76 时获得奖励。",
			-- TODO: tw = "",
		},
	}),
});

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.SL, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH }, ["customCollect"] = "SL_COV_KYR" }, {
	n(KYRIAN, {
		n(RENOWN, {
			["description"] = createLocalizationString({
				readable = "These are rewards automatically granted by reaching a specific level of Renown.",
				constant = "THESE_ARE_REWARDS_AUTOMATICALLY_GRANTED_BY",
				export = true,
				text = {
					en = "These are rewards automatically granted by reaching a specific level of Renown.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "这些是通过达到特定名望等级自动获得的奖励。",
					-- TODO: tw = "",
				},
			}),
			["groups"] = {
				i(186593, {	-- A Tiny Pair of Wings (Pepe!)
					["description"] = "~L.REQUIRES_RENOWN_56",
					["timeline"] = { ADDED_9_1_0 },
				}),
				i(186482, {	-- Elysian Aquilon (MOUNT!)
					["description"] = createLocalizationString({
						readable = "Requires Renown 45.",
						constant = "REQUIRES_RENOWN_45",
						export = true,
						text = {
							en = "Requires Renown 45.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 45。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(180765, {	-- Eternal Phalynx of Purity (MOUNT!)
					["description"] = createLocalizationString({
						readable = "Requires Renown 39.",
						constant = "REQUIRES_RENOWN_39",
						export = true,
						text = {
							en = "Requires Renown 39.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 39。",
							-- TODO: tw = "",
						},
					}),
				}),
				title(445, {	-- Disciple of Devotion
					["description"] = createLocalizationString({
						readable = "Requires Renown 80.",
						constant = "REQUIRES_RENOWN_80",
						export = true,
						text = {
							en = "Requires Renown 80.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 80。",
							-- TODO: tw = "",
						},
					}),
				}),
				title(425, {	-- Hand of the Archon
					["description"] = createLocalizationString({
						readable = "Requires Renown 40.",
						constant = "REQUIRES_RENOWN_40",
						export = true,
						text = {
							en = "Requires Renown 40.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 40。",
							-- TODO: tw = "",
						},
					}),
				}),
				iensemble(186515, {	-- Ensemble: Aspiring Aspirant's Regalia
					["description"] = createLocalizationString({
						readable = "Requires Renown 60.",
						constant = "REQUIRES_RENOWN_60",
						export = true,
						text = {
							en = "Requires Renown 60.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 60。",
							-- TODO: tw = "",
						},
					}),
				}),
				i(188005, {	-- Anima-Bathed Blade
					["description"] = createLocalizationString({
						readable = "Rewarded at 15 and 24 Renown.",
						constant = "REWARDED_AT_15_AND_24_RENOWN",
						export = true,
						text = {
							en = "Rewarded at 15 and 24 Renown.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在名望 15 和 24 时获得奖励。",
							-- TODO: tw = "",
						},
					}),
				}),
				WISPS_OF_MEMORY,
				SL_Legendaries({
					["description"] = createLocalizationString({
						readable = "Requires Renown 48.",
						constant = "REQUIRES_RENOWN_48",
						export = true,
						text = {
							en = "Requires Renown 48.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要名望 48。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(186566),	-- Memory of the Final Sentence
						i(187111),	-- Memory of Blind Faith
						i(186673),	-- Memory of Kindred Affinity
						i(187229),	-- Memory of the Pact of the Soulstalkers
						i(186591),	-- Memory of the Harmonic Echo
						i(187237),	-- Memory of a Call to Arms
						i(187106),	-- Memory of Divine Resonance
						i(187163),	-- Memory of the Spheres' Harmony
						i(186775),	-- Memory of Resounding Clarity
						i(187259),	-- Memory of the Raging Vesper Vortex
						i(187225),	-- Memory of the Languishing Soul Detritus
						i(187511),	-- Memory of Elysian Might
					},
				}),
			},
		}),
	}),
})));

WISPS_OF_MEMORY.customCollect = nil;

root(ROOTS.HiddenQuestTriggers, expansion(EXPANSION.SL, bubbleDownSelf({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	n(KYRIAN,  bubbleDown({ ["customCollect"] = "SL_COV_KYR" }, {
		n(RENOWN, {
			q(62756),	-- Reaching Renown 19 / unlocking Deepening Bond 4% stam increase
			q(62757),	-- Reaching Renown 35 / unlocking Deepening Bond 6% stam increase
			q(62927),	-- Reaching Renown 39 / unlocking covenant mount
			q(64138, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 45
			q(64378, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Death Knight] (received Memory of the Final Sentence)
			q(64379, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Demon Hunter] (received Memory of Blind Faith)
			q(64395, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Druid] (received Memory of Kindred Affinity)
			q(64392, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Hunter] (received Memory of the Pact of the Soulstalkers)
			q(64386, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Mage] (received Memory of Harmonic Echo)
			q(64413, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Monk] (received Memory of Call to Arms)
			q(64417, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Paladin] (received Memory of Divine Resonance)
			q(64405, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Priest] (received Memory of Spheres' Harmony)
			q(64396, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Rogue] (received Memory of Resounding Clarity)
			q(64409, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Shaman] (received Memory of the Raging Vesper Vortex)
			q(64412, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Warlock] (received Memory of the Languishing Soul Detritus)
			q(64418, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 48 [Warrior] (received Memory of Elysian Might)
			q(64145, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 50
			q(64443, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 52
			q(64137, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 56
			q(64146, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 59
			q(64372, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 60
			q(64444, {["timeline"] = {ADDED_9_1_0}}),	-- hitting Renown 67
			q(64445, {["timeline"] = {ADDED_9_1_0}}),	-- Renown 76
			-- 9.1.5 New HQTS
			q(65107, {["timeline"] = {ADDED_9_1_5}}),	-- hitting Renown 15 (Anima instead of Soulkeeper Upgrade)
			q(65108, {["timeline"] = {ADDED_9_1_5}}),	-- hitting Renown 24 (Anima instead of Soulkeeper Upgrade)
		}),
	})),
})));
