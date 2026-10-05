---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(ISLE_OF_DORN, {
		n(ZONE_DROPS, {
			i(224025, {	-- Crackling Shard
				["description"] = createLocalizationString({
					readable = "Shards can drop from any mob, but rare mobs have an increased chance.\n\nBest Route is killing the following rare mobs:\nBloodmaw\nEmperor Pitfang\nRustul Titancap\nSandres\nSpringbubble\nWarphorn\n\nShards continue to drop even when you already killed the rare for the day.",
					constant = "SHARDS_CAN_DROP_FROM_ANY_MOB_BUT_RARE_MOBS_HAVE",
					export = true,
					text = {
						en = "Shards can drop from any mob, but rare mobs have an increased chance.\n\nBest Route is killing the following rare mobs:\nBloodmaw\nEmperor Pitfang\nRustul Titancap\nSandres\nSpringbubble\nWarphorn\n\nShards continue to drop even when you already killed the rare for the day.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "碎片可以由任何怪物掉落，但稀有怪物的几率更高。\n\n最佳路线是击杀以下稀有怪物：\n血喉\n帝王坑牙\n鲁斯图尔·泰坦盖\n桑德雷斯\n涌泉泡\n扭曲之角\n\n即使你今天已经击杀过该稀有怪，碎片仍会继续掉落。",
						-- TODO: tw = "",
					},
				}),
				["groups"] = {
					i(224026, {	-- Storm Vessel (CI!)
						["cost"] = { { "i", 224025, 10 } },	-- 10x Crackling Shard
					}),
				},
			}),
			i(222906, {	-- Plump Snapcrab
				["crs"] = { 223159 },	-- Plump Snapcrab
				["coord"] = { 40.6, 59.9, ISLE_OF_DORN },
			}),
			i(225557),	-- Sizzling Cinderpollen
		}),
	}),
}));
