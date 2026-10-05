---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(HIGHMOUNTAIN, {
			n(PROFESSIONS, {
				prof(FISHING, {
					faction(FACTION_AKULE_RIVERHORN, {	-- Akule Riverhorn
						["description"] = createLocalizationString({
							readable = "This Fisherfriend NPC is located at: |cFFFFFFFF32.4, 40.9|r at the bottom of Thunder Totem in the boat on the water.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
							constant = "THIS_FISHERFRIEND_NPC_IS_LOCATED_AT_CFFFFFFFF32",
							export = true,
							text = {
								en = "This Fisherfriend NPC is located at: |cFFFFFFFF32.4, 40.9|r at the bottom of Thunder Totem in the boat on the water.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此渔友 NPC 位于：|cFFFFFFFF32.4, 40.9|r，雷霆图腾底部水面的船上。\n\n这些渔友 NPC 并不总会出现，同一时间只会有一个出现。你需要前往该区域、询问朋友或查看队伍查找器来确认他们是否出现。\n\n在为此渔友钓取物品时，务必靠得足够近以获得|cFFFFD700有蹊跷|r增益，否则你将无法获得可上交的物品，也无法召唤出首领。\n\n建议组队进行，以便最快达到挚友。",
								-- TODO: tw = "",
							},
						}),
						["requireSkill"] = FISHING,
						["creatureID"] = 120457,
						["coord"] = { 32.4, 40.9, 750 },	-- Highmountain (Thunder Totem)
						["groups"] = {
							i(146960, {		-- Ancient Totem Fragment
								-- extra info for the item can go here
							}),
							i(147310, {	-- Crate of Bobbers: Floating Totem (TOY!)
								["cost"] = { { "i", 146960, 100 } },	-- 100x Ancient Totem Fragment
							}),
							i(152556, {	-- Trawler Totem (TOY!)
								["cost"] = { { "i", 146960, 50 } },	-- 50x Ancient Totem Fragment
							}),
							i(133709, {	-- Funky Sea Snail
								["cost"] = { { "i", 146960, 25 } },	-- 25x Ancient Totem Fragment
								["sym"] = {{"fill"}},
							}),
							i(133711, {	-- Swollen Murloc Egg
								["cost"] = { { "i", 146960, 25 } },	-- 25x Ancient Totem Fragment
								["sym"] = {{"fill"}},
							}),
							i(133712, {	-- Frost Worm
								["cost"] = { { "i", 146960, 25 } },	-- 25x Ancient Totem Fragment
								["sym"] = {{"fill"}},
							}),
							i(124109, {	-- Highmountain Salmon
								["cost"] = { { "i", 146960, 10 } },	-- 10x Ancient Totem Fragment
							}),
						},
					}),
				}),
				prof(TAILORING, {
					i(137681, {	-- Pattern: Bloodtotem Saddle Blanket
						["description"] = createLocalizationString({
							readable = "Can drop from any Feltotem.",
							constant = "CAN_DROP_FROM_ANY_FELTOTEM",
							export = true,
							text = {
								en = "Can drop from any Feltotem.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "可从任意邪舌牛头人身上掉落。",
								-- TODO: tw = "",
							},
						}),
					}),
				}),
			}),
		}),
	}),
});
