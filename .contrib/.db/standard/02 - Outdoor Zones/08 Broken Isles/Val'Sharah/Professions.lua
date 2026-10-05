---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(BROKEN_ISLES, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	m(VALSHARAH, {
		n(PROFESSIONS, {
			prof(FISHING, {
				faction(FACTION_KEEPER_RAYNAE, {	-- Keeper Raynae
					["creatureID"] = 120456,
					["coord"] = { 53.4, 72.8, VALSHARAH },
					["description"] = createLocalizationString({
						readable = "This Fisherfriend NPC is located at: |cFFFFFFFF53.4, 72.8|r in Lorlathil.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
						constant = "THIS_FISHERFRIEND_NPC_IS_LOCATED_AT_CFFFFFFFF53",
						export = true,
						text = {
							en = "This Fisherfriend NPC is located at: |cFFFFFFFF53.4, 72.8|r in Lorlathil.\n\nThe Fisherfriend NPC's will not always be up and only one is up at any given time. You will have to either travel to the zone, ask a friend or check group finder to see if they are up.\n\nWhen fishing for the item for this particular fisherfriend make sure that you are close enough so that you recive the buff |cFFFFD700Something's Fishy|r, otherwise you won't be able to receive the turn-in items or the boss that is summoned.\n\nIt is recommended to be in a group in order to be able to reach Best Friend the quickest.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "此渔友 NPC 位于：|cFFFFFFFF53.4, 72.8|r，洛拉希尔。\n\n这些渔友 NPC 并不总会出现，同一时间只会有一个出现。你需要前往该区域、询问朋友或查看队伍查找器来确认他们是否出现。\n\n在为此渔友钓取物品时，务必靠得足够近以获得|cFFFFD700有蹊跷|r增益，否则你将无法获得可上交的物品，也无法召唤出首领。\n\n建议组队进行，以便最快达到挚友。",
							-- TODO: tw = "",
						},
					}),
					["requireSkill"] = FISHING,
					["groups"] = {
						i(146959, {		-- Corrupted Globule
							-- extra info for the item can go here
						}),
						i(147309, {	-- Crate of Bobbers: Face of the Forest (TOY!)
							["cost"] = { { "i", 146959, 100 } },	-- 100x Corrupted Globule
						}),
						i(152565, {	-- Recipe: Feast of the Fishes [Rank 1] (RECIPE!)
							["timeline"] = { ADDED_7_3_0 },
							["cost"] = { { "i", 146959, 50 } },	-- 50x Corrupted Globule
						}),
						i(133705, {		-- Rotten Fishbone
							["cost"] = { { "i", 146959, 25 } },	-- 25x Corrupted Globule
							["sym"] = {{"fill"}},
						}),
						i(133707, {		-- Nightmare Nightcrawler
							["cost"] = { { "i", 146959, 25 } },	-- 25x Corrupted Globule
							["sym"] = {{"fill"}},
						}),
						i(133708, {		-- Drowned Thistleleaf
							["cost"] = { { "i", 146959, 25 } },	-- 25x Corrupted Globule
							["sym"] = {{"fill"}},
						}),
						i(124108, {		-- Mossgill Perch
							["cost"] = { { "i", 146959, 10 } },	-- 10x Corrupted Globule
						}),
					},
				}),
			}),
		}),
	}),
})));
