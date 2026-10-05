---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(HIGHMOUNTAIN, {
			n(ACHIEVEMENTS, {
				ach(11264),	-- Adventurer of Highmountain (automated)
				ach(10059),	-- Ain't No Mountain High Enough (automated)
				ach(10398, {	-- Drum Circle
					["description"] = createLocalizationString({
						readable = "This achievement can be soloed since after 'Battle for Azeroth'. Repeatedly jump for 1-3 minutes in the middle ring on the lower floor of Thunder Totem. It CANNOT be completed while you are on 'Assault on Thunder Totem' and you must be able to hear the drum beats to know the achievement is working.",
						constant = "THIS_ACHIEVEMENT_CAN_BE_SOLOED_SINCE_AFTER",
						export = true,
						text = {
							en = "This achievement can be soloed since after 'Battle for Azeroth'. Repeatedly jump for 1-3 minutes in the middle ring on the lower floor of Thunder Totem. It CANNOT be completed while you are on 'Assault on Thunder Totem' and you must be able to hear the drum beats to know the achievement is working.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "自“争霸艾泽拉斯”之后，这个成就可以单人完成。在雷霆图腾下层的中间圆环处反复跳跃 1-3 分钟。你**不能**在处于“突袭雷霆图腾”状态时完成它，而且你必须能听到鼓点声才能确认成就在生效。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = {
						i(257721, {	-- Skyhorn Arrow Kite (DECOR!)
							["timeline"] = { ADDED_11_2_7 },
						}),
					},
				}),
				ach(10667),	-- Explore Highmountain
				ach(10626, {	-- Zoom!
					i(137298),	-- Zoom (PET!)
				}),
				ach(10774, {	-- Hatchling of the Talon
					["sourceQuests"] = { 41094 },	-- Hatchlings of the Talon
					["groups"] = {
						i(139773),	-- Emerald Winds (TOY!)
					},
				}),
				ach(12292),	-- Highmountain Tribe
				ach(11257, {	-- Treasures of Highmountain (mostly-automated)
					crit(33537, {	-- 40 Treasures
						-- ["_quests"] = {  },	-- 40 Treasures (apparently this triggers inconsistently, questID 40610)
					}),
					i(245460, {	-- Skyhorn Storage Chest (DECOR!)
						["timeline"] = { ADDED_11_2_7 },
					}),
				}),
			}),
		}),
	}),
});
