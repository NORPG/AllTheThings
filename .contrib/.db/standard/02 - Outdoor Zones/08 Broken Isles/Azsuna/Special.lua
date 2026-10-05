---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(AZSUNA, {
			n(SPECIAL, {
				n(109028, {	-- Horkus
					["description"] = createLocalizationString({
						readable = "Can be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
						constant = "CAN_BE_MADE_HOSTILE_BY_DEMON_HUNTERS_USING",
						export = true,
						text = {
							en = "Can be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "恶魔猎手使用“幽灵视觉”或圣骑士装备“真理守卫”可使其变为敌对，从而让任何人都能获得进度。",
							-- TODO: tw = "",
						},
					}),
					["questID"] = 42825,
					["coord"] = { 56.2, 59.6, AZSUNA },
					["crs"] = { 109029 },	-- Horkus
				}),
				o(251168, {	-- Ephemeral Crystal
					["description"] = createLocalizationString({
						readable = "Finding 5 Ephemeral Crystals, scattered across Azsuna, will award this mount, but find them quickly - after someone clicks on 5 crystals, the event will end, and you'll have to wait at least 8 hours (possibly up to 24) for the event to reappear. Remember to play cautiously while you're hunting, because if you die you'll have to restart.",
						constant = "FINDING_5_EPHEMERAL_CRYSTALS_SCATTERED_ACROSS",
						export = true,
						text = {
							en = "Finding 5 Ephemeral Crystals, scattered across Azsuna, will award this mount, but find them quickly - after someone clicks on 5 crystals, the event will end, and you'll have to wait at least 8 hours (possibly up to 24) for the event to reappear. Remember to play cautiously while you're hunting, because if you die you'll have to restart.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在阿苏纳各处找到 5 块瞬息水晶即可获得此坐骑，但要尽快——有人点击 5 块水晶后，事件就会结束，你必须至少等待 8 小时（可能长达 24 小时）事件才会再次出现。狩猎时记得谨慎行事，因为一旦死亡就必须重新开始。",
							-- TODO: tw = "",
						},
					}),
					["groups"] = { i(138258) },	-- Long-Forgotten Hippogryph (MOUNT!)
				}),
			}),
		}),
	}),
});
