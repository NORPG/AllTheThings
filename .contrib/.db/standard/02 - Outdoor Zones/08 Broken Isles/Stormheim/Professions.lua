---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(STORMHEIM, {
			n(PROFESSIONS, {
				prof(FISHING, {
					faction(FACTION_CORBYN, {	-- Corbyn
						["creatureID"] = 120458,
						["coord"] = { 90.6, 10.6, STORMHEIM },
						["description"] = createLocalizationString({
							readable = "This Fisherfriend NPC is located at: |cFFFFFFFF90.6, 10.6|r on Shield's Rest.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
							constant = "THIS_FISHERFRIEND_NPC_IS_LOCATED_AT_CFFFFFFFF90",
							export = true,
							text = {
								en = "This Fisherfriend NPC is located at: |cFFFFFFFF90.6, 10.6|r on Shield's Rest.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "此渔友 NPC 位于：|cFFFFFFFF90.6, 10.6|r，盾憩之地。\n\n这些渔友 NPC 并不总会出现，同一时间只会有一个出现。你需要前往该区域、询问朋友或查看队伍查找器来确认他们是否出现。\n\n在为此渔友钓取物品时，务必靠得足够近以获得|cFFFFD700有蹊跷|r增益，否则你将无法获得可上交的物品，也无法召唤出首领。\n\n建议组队进行，以便最快达到挚友。",
								-- TODO: tw = "",
							},
						}),
						["requireSkill"] = FISHING,
						["groups"] = {
							i(146961, {		-- Shiny Bauble
								-- extra info for the item can go here
							}),
							i(147307, {	-- Crate of Bobbers: Carved Wooden Helm (TOY!)
								["cost"] = { { "i", 146961, 100 } },	-- 100x Shiny Bauble
							}),
							i(152574, {	-- Corbyn's Beacon (TOY!)
								["cost"] = { { "i", 146961, 50 } },	-- 50x Shiny Bauble
							}),
							i(133713, {	-- Moosehorn Hook
								["cost"] = { { "i", 146961, 25 } },	-- 25x Shiny Bauble
								["sym"] = {{"fill"}},
							}),
							i(133715, {	-- Ancient Vrykul Ring
								["cost"] = { { "i", 146961, 25 } },	-- 25x Shiny Bauble
								["sym"] = {{"fill"}},
							}),
							i(133716, {	-- Soggy Drakescale
								["cost"] = { { "i", 146961, 25 } },	-- 25x Shiny Bauble
								["sym"] = {{"fill"}},
							}),
							i(124110, {	-- Stormray
								["cost"] = { { "i", 146961, 10 } },	-- 10x Shiny Bauble
							}),
						},
					}),
				}),
			}),
		}),
	}),
});
