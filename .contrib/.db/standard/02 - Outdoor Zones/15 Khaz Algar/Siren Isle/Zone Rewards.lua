---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(KHAZ_ALGAR, {
	m(SIREN_ISLE, {
		n(ZONE_REWARDS, {
			currency(3090),	-- Flame-Blessed Iron
			i(233495, {	-- Inky Snapdragon Treat (CI!)
				["description"] = createLocalizationString({
					readable = "Requires having obtained the Trashmaster title from the equipable cloak or from having it unlocked permanently from q:56250/q:56249 I am the Trashmaster. You don't need to actually use the title. Talk to Gazix Fusegrease in the main camp.",
					constant = "REQUIRES_HAVING_OBTAINED_THE_TRASHMASTER_TITLE",
					export = true,
					text = {
						en = "Requires having obtained the Trashmaster title from the equipable cloak or from having it unlocked permanently from q:56250/q:56249 I am the Trashmaster. You don't need to actually use the title. Talk to Gazix Fusegrease in the main camp.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "需要已通过可装备的披风获得垃圾大王头衔，或已通过任务 q:56250/q:56249“我是垃圾大王”永久解锁该头衔。你并不需要真正使用该头衔。与主营地的加兹克斯·融脂交谈。",
						-- TODO: tw = "",
					},
				}),
				["providers"] = {
					{ "n", 229928 },	-- Gazix Fusegrease <Gazlowe's Greasemonkeys>
					{ "i", 168970 },	-- Trashmaster's Mantle
				},
			}),
		}),
	}),
}));
