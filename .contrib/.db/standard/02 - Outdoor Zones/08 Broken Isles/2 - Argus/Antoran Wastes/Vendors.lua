---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local INTACT_DEMON_EYE = 153021;

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(ARGUS, bubbleDown({ ["timeline"] = { ADDED_7_3_0 } }, {
			m(ANTORAN_WASTES, {
				n(VENDORS, {
					i(INTACT_DEMON_EYE, {
						["description"] = createLocalizationString({
							readable = "These eyes drop off of any demon on Argus while you have the Agent of the All-Seer buff, which can be obtained by clicking on the All-Seer Focus. WARNING: You will lose 90% health, so if you are missing any health, you might die! Guards will be unfriendly to you while you have the buff.",
							constant = "THESE_EYES_DROP_OFF_OF_ANY_DEMON_ON_ARGUS_WHILE",
							export = true,
							text = {
								en = "These eyes drop off of any demon on Argus while you have the Agent of the All-Seer buff, which can be obtained by clicking on the All-Seer Focus. WARNING: You will lose 90% health, so if you are missing any health, you might die! Guards will be unfriendly to you while you have the buff.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "在拥有全知者的代理人增益时，这些眼睛会从阿古斯上的任意恶魔身上掉落；该增益可以通过点击全知者聚焦器获得。警告：你会损失 90% 的生命值，所以如果你生命值不满，可能会死！拥有该增益时，卫兵会对你变为不友好。",
								-- TODO: tw = "",
							},
						}),
						["coords"] = {
							{ 67.34, 48.11, ANTORAN_WASTES },	-- Ven'orn's Lair
							{ 64.41, 21.03, ANTORAN_WASTES },	-- Defiled Path
							{ 58.01, 66.96, ANTORAN_WASTES },	-- Felfire Armory
						},
						["crs"] = { 128151 },	-- All-Seer Focus
					}),
					n(128134, {	-- Orix the All-Seer
						["coord"] = { 59.5, 44.9, ANTORAN_WASTES },
						["groups"] = {
							i(153069, {	-- All-Seer's Draught
								["cost"] = { { "i", INTACT_DEMON_EYE, 25 } },
							}),
							i(153204, {	-- All-Seer's Eye (TOY!)
								["cost"] = { { "i", INTACT_DEMON_EYE, 1000 } },
							}),
							i(153026, {	-- Cross Gazer (PET!)
								["cost"] = { { "i", INTACT_DEMON_EYE, 1000 } },
							}),
							i(153071, {	-- Gift of the All-Seer
								["cost"] = { { "i", INTACT_DEMON_EYE, 200 } },
							}),
							i(153226, {	-- Observer's Locus Resonator
								["cost"] = { { "i", INTACT_DEMON_EYE, 500 } },
							}),
							i(153219, {	-- Squished Demon Eye
								["cost"] = { { "i", INTACT_DEMON_EYE, 50 } },
							}),
						},
					}),
				}),
			}),
		})),
	}),
});
