---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, {
	m(BROKEN_ISLES, {
		m(LEGION_DALARAN, {
			petbattle(filter(BATTLE_PETS, {
				pet(1778, {	-- Dust Bunny
					["description"] = createLocalizationString({
						readable = "In order to see this battle pet you must first obtain the buff |cFFFFD700Spring Cleaning|r, which is a 15-minute buff. You obtain this buff by clicking on a |cFFFFD700Dusty Rug|r. Multiple people can click the rug. If there are none present you can realm hop until you find one. The rug can spawn in one of five locations:\n\n|cFFFFFFFFBarber Shop|r - Upper Level (|cFFFFFFFF52.52, 30.31|r),\n\n|cFFFFFFFFBreanni's Shop|r - Behind the counter (|cFFFFFFFF58.9, 38.3|r),\n\n|cFFFFFFFFFilthy Animal [Horde]|r - Outside the building on top of the sewer gate to the right before you enter. (|cFFFFFFFF64.15, 37.9|r)\n\n|cFFFFFFFFGreyfang Enclave [Alliance]|r - Behind the Paladin Portal\n\n|cFFFFFFFFLegerdemain Lounge|r - Top Floor",
						constant = "IN_ORDER_TO_SEE_THIS_BATTLE_PET_YOU_MUST_FIRST",
						export = true,
						text = {
							en = "In order to see this battle pet you must first obtain the buff |cFFFFD700Spring Cleaning|r, which is a 15-minute buff. You obtain this buff by clicking on a |cFFFFD700Dusty Rug|r. Multiple people can click the rug. If there are none present you can realm hop until you find one. The rug can spawn in one of five locations:\n\n|cFFFFFFFFBarber Shop|r - Upper Level (|cFFFFFFFF52.52, 30.31|r),\n\n|cFFFFFFFFBreanni's Shop|r - Behind the counter (|cFFFFFFFF58.9, 38.3|r),\n\n|cFFFFFFFFFilthy Animal [Horde]|r - Outside the building on top of the sewer gate to the right before you enter. (|cFFFFFFFF64.15, 37.9|r)\n\n|cFFFFFFFFGreyfang Enclave [Alliance]|r - Behind the Paladin Portal\n\n|cFFFFFFFFLegerdemain Lounge|r - Top Floor",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "要看到这只战斗宠物，你必须先获得|cFFFFD700春季大扫除|r增益，该增益持续 15 分钟。点击|cFFFFD700满是灰尘的地毯|r即可获得此增益。多人都可以点击地毯。如果当前没有地毯，你可以不断切换位面，直到找到一个。地毯可能在五个位置之一刷新：\n\n|cFFFFFFFF理发店|r - 上层（|cFFFFFFFF52.52, 30.31|r），\n\n|cFFFFFFFF布莱安妮的商店|r - 柜台后面（|cFFFFFFFF58.9, 38.3|r），\n\n|cFFFFFFFF肮脏的动物 [部落]|r - 建筑外面，入口右侧下水道闸门上方。（|cFFFFFFFF64.15, 37.9|r）\n\n|cFFFFFFFF灰牙围栏 [联盟]|r - 圣骑士传送门后面\n\n|cFFFFFFFF幻术酒馆|r - 顶层",
							-- TODO: tw = "",
						},
					}),
				}),
			})),
		}),
	}),
});
