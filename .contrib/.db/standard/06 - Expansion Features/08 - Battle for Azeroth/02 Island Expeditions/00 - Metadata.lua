-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.BFA, bubbleDownSelf({ ["timeline"] = { ADDED_8_0_1 } }, {
	n(ISLAND_EXPEDITIONS, {
		["description"] = createLocalizationString({
			readable = "Island expeditions are a 3-player scenario. Each faction will sail across the waters where they will harvest and steal any Azerite they can find from these islands. Goblins and gnomes have been able to use their new technology to find islands which contain possible amounts of Azerite and will be providing maps for each of their respective factions. Ships and queueing will take place in Dazar'alor for Horde and Boralus for Alliance. These are unlocked Account-Wide once you have finished the introduction questline on one character.",
			constant = "ISLAND_EXPEDITIONS_ARE_A_3_PLAYER_SCENARIO_EACH",
			export = true,
			text = {
				en = "Island expeditions are a 3-player scenario. Each faction will sail across the waters where they will harvest and steal any Azerite they can find from these islands. Goblins and gnomes have been able to use their new technology to find islands which contain possible amounts of Azerite and will be providing maps for each of their respective factions. Ships and queueing will take place in Dazar'alor for Horde and Boralus for Alliance. These are unlocked Account-Wide once you have finished the introduction questline on one character.",
				-- TODO: de = "",
				-- TODO: es = "",
				-- TODO: mx = "",
				-- TODO: fr = "",
				-- TODO: it = "",
				-- TODO: ko = "",
				-- TODO: pt = "",
				-- TODO: ru = "",
				cn = "海岛探险是 3 人场景战役。每个阵营都会航行穿越海域，在这些岛屿上采集并抢夺他们能找到的所有艾泽里特。地精和侏儒利用他们的新技术找到了可能蕴藏艾泽里特的岛屿，并将为各自阵营提供地图。部落的船只和排队地点都在达萨罗，联盟则在伯拉勒斯。只要在一个角色上完成引导任务线，即可账号通用解锁。",
				-- TODO: tw = "",
			},
		}),
		["crs"] = {
			143968,	-- Expedition Map [Alliance Side]
			143967,	-- Expedition Map [Horde Side]
		},
		["maps"] = {
			1501,	-- Crestfall
			1036,	-- Dread Chain
			1336,	-- Havenswood
			1337,	-- Jorundall
			1035,	-- Molten Cray
			1033,	-- Rotting Mire
			981,	-- Un'gol Ruins
			1032,	-- Skittering Hollow
			1502,	-- Snowblossom Village
			1034,	-- Verdant Wilds
			1037,	-- Whispering Reef
		},
	}),
})));
