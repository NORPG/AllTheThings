---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(BROKEN_ISLES, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	m(STORMHEIM, {
		n(SPECIAL, {
			n(109083, {	-- Houndmaster Payne
				["questID"] = 42858,
				["coord"] = { 72.0, 59.8, STORMHEIM },
				["crs"] = { 109089 },	-- Houndmaster Payne
				["description"] = createLocalizationString({
					readable = "Patrols inside of Greywatch. Horde players can still interact with him, but be aware the rest of the camp will be hostile. Shares completion with |cffffff00Batmaster Claud|r. \n\nCan be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
					constant = "PATROLS_INSIDE_OF_GREYWATCH_HORDE_PLAYERS_CAN",
					export = true,
					text = {
						en = "Patrols inside of Greywatch. Horde players can still interact with him, but be aware the rest of the camp will be hostile. Shares completion with |cffffff00Batmaster Claud|r. \n\nCan be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在灰卫营地内部巡逻。部落玩家仍然可以与他互动，但要注意营地中的其他成员都会敌对。与|cffffff00蝙蝠大师克劳德|r共享完成进度。\n\n恶魔猎手使用“幽灵视觉”或圣骑士装备“真理守护者”可以使其变为敌对，从而让任何人都能获得击杀记录。",
						-- TODO: tw = "",
					},
				}),
			}),
			n(109133, {	-- Batmaster Claud
				["questID"] = 42858,
				["coord"] = { 54.6, 71.6, STORMHEIM },
				["description"] = createLocalizationString({
					readable = "Patrols inside of Dreadwake's Landing. Alliance players can still interact with him, but be aware the rest of the camp will be hostile. Shares completion with |cffffff00Houndmaster Payne|r. \n\nCan be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
					constant = "PATROLS_INSIDE_OF_DREADWAKE_S_LANDING_ALLIANCE",
					export = true,
					text = {
						en = "Patrols inside of Dreadwake's Landing. Alliance players can still interact with him, but be aware the rest of the camp will be hostile. Shares completion with |cffffff00Houndmaster Payne|r. \n\nCan be made hostile by Demon Hunters using 'Spectral Sight' or Paladins wielding 'Truthguard' allowing anyone to get credit.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "在恐潮登陆点内部巡逻。联盟玩家仍然可以与他互动，但要注意营地中的其他成员都会敌对。与|cffffff00驯犬者佩恩|r共享完成进度。\n\n恶魔猎手使用“幽灵视觉”或圣骑士装备“真理守护者”可以使其变为敌对，从而让任何人都能获得击杀记录。",
						-- TODO: tw = "",
					},
				}),
			}),
		}),
	}),
})));
