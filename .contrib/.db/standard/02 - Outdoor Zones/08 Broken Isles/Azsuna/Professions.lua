---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(AZSUNA, {
			n(PROFESSIONS, {
				prof(FISHING, {
					faction(FACTION_ILYSSIA, {	-- Ilyssia of the Waters
						["creatureID"] = 120266,
						["coord"] = { 43.2, 40.6, AZSUNA },
						["description"] = createLocalizationString({
							readable = "This Fisherfriend NPC is located at: |cFFFFFFFF43.2, 40.6|r north of Illidari Stand.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
							constant = "THIS_FISHERFRIEND_NPC_IS_LOCATED_AT_CFFFFFFFF43",
							export = true,
							text = {
								en = "This Fisherfriend NPC is located at: |cFFFFFFFF43.2, 40.6|r north of Illidari Stand.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此渔友 NPC 位于：|cFFFFFFFF43.2, 40.6|r，伊利达雷哨站以北。\n\n这些渔友 NPC 并不总会出现，同一时间只会有一个出现。你需要前往该区域、询问朋友或查看队伍查找器来确认他们是否出现。\n\n在为此渔友钓取物品时，务必靠得足够近以获得|cFFFFD700有蹊跷|r增益，否则你将无法获得可上交的物品，也无法召唤出首领。\n\n建议组队进行，以便最快达到挚友。",
								-- TODO: tw = "",
							},
						}),
						["requireSkill"] = FISHING,
						["groups"] = {
							i(146848, {	-- Fragmented Enchantment
								-- extra info for the item can go here
							}),
							i(147308, {	-- Crate of Bobbers: Enchanted Bobber (TOY!)
								["cost"] = { { "i", 146848, 100 } },	-- 100x Fragmented Enchantment
							}),
							i(152555, {	-- Ghost Shark (PET!)
								["timeline"] = { ADDED_7_3_0 },
								["cost"] = { { "i", 146848, 50 } },	-- 50x Fragmented Enchantment
							}),
							i(133703, {	-- Pearlescent Conch
								["cost"] = { { "i", 146848, 25 } },	-- 25x Fragmented Enchantment
								["sym"] = {{"fill"}},
							}),
							i(133704, {	-- Rusty Queenfish Brooch
								["cost"] = { { "i", 146848, 25 } },	-- 25x Fragmented Enchantment
								["sym"] = {{"fill"}},
							}),
							i(133701, {	-- Skrog Toenail
								["cost"] = { { "i", 146848, 25 } },	-- 25x Fragmented Enchantment
								["sym"] = {{"fill"}},
							}),
							i(124107, {	-- Cursed Queenfish
								["cost"] = { { "i", 146848, 10 } },	-- 25x Fragmented Enchantment
							}),
						},
					}),
					i(137775, {	-- Vantus Rune Technique: Chronomatic Anomaly [Rank 3] (RECIPE!)
						["description"] = createLocalizationString({
							readable = "Cursed Queenfish pools are recommended, as they can give access to Ghostly Queenfish pools which do not deplete so long as the buff lasts.",
							constant = "CURSED_QUEENFISH_POOLS_ARE_RECOMMENDED_AS_THEY",
							export = true,
							text = {
								en = "Cursed Queenfish pools are recommended, as they can give access to Ghostly Queenfish pools which do not deplete so long as the buff lasts.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "推荐钓被诅咒的皇后鱼群，因为它们可以让你接触到幽灵皇后鱼群，只要增益持续，这些鱼群就不会枯竭。",
								-- TODO: tw = "",
							},
						}),
						["timeline"] = { ADDED_7_1_0 },
					}),
				}),
			}),
		}),
	}),
});
