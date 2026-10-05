-----------------------------------------------------
--       P R O F E S S I O N S   M O D U L E       --
-----------------------------------------------------
root(ROOTS.Professions, prof(ENGINEERING, bubbleDownSelf({ ["requireSkill"] = ENGINEERING }, {
	n(REWARDS, {
		i(11423, {	-- Gnome Engineer's Renewal Gift
			["description"] = createLocalizationString({
				readable = "If you destroy your Gnome Engineer Membership Card, you can renew your membership for 2 Gold and will receive this gift in the mail in about a day.",
				constant = "IF_YOU_DESTROY_YOUR_GNOME_ENGINEER_MEMBERSHIP",
				export = true,
				text = {
					en = "If you destroy your Gnome Engineer Membership Card, you can renew your membership for 2 Gold and will receive this gift in the mail in about a day.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "如果你销毁了侏儒工程师会员卡，可以花 2 金币续费，大约一天后就会通过邮件收到这份礼物。",
					-- TODO: tw = "",
				},
			}),
			["provider"] = { "i", 10790 },	-- Gnome Engineer Membership Card
			["groups"] = {
				i(10603),	-- Schematic: Catseye Ultra Goggles (RECIPE!)
				i(11827, {["requireSkill"] = IGNORED_VALUE}),	-- Schematic: Lil' Smoky (RECIPE!)
				i(10606),	-- Schematic: Parachute Cloak(RECIPE!)
			},
		}),
		i(11422, {	-- Goblin Engineer's Renewal Gift
			["description"] = createLocalizationString({
				readable = "If you destroy your Goblin Engineer Membership Card, you can renew your membership for 2 Gold and will receive this gift in the mail in about a day.",
				constant = "IF_YOU_DESTROY_YOUR_GOBLIN_ENGINEER_MEMBERSHIP",
				export = true,
				text = {
					en = "If you destroy your Goblin Engineer Membership Card, you can renew your membership for 2 Gold and will receive this gift in the mail in about a day.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "如果你销毁了地精工程师会员卡，可以花 2 金币续费，大约一天后就会通过邮件收到这份礼物。",
					-- TODO: tw = "",
				},
			}),
			["provider"] = { "i", 10791 },	-- Goblin Engineer Membership Card
			["groups"] = {
				i(4416),	-- Schematic: Goblin Land Mine (RECIPE!)
				i(4417),	-- Schematic: Large Seaforium Charge (RECIPE!)
				i(11828, {["requireSkill"] = IGNORED_VALUE}),	-- Schematic: Pet Bombling (RECIPE!)
			},
		}),
	}),
})));