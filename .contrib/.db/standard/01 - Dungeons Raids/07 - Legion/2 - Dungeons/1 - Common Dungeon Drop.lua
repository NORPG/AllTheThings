-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.LEGION, bubbleDown({ ["timeline"] = { ADDED_7_0_3_LAUNCH } }, {
	n(COMMON_DUNGEON_DROPS, {
		i(141591, {	-- Technique: Codex of the Tranquil Mind [Rank 2] (RECIPE!)
			["crs"] = {
				102387,	-- Sael'orn
				102446,	-- Fel Lord Betrug
				98970,	-- Dantalionax
				98965,	-- Kur'talos Ravencrest
				99192,	-- Shade of Xavius
				104218,	-- Advisor Melandrus
				96028,	-- Wrath of Azshara
				95676,	-- Odyn
				96759,	-- Helya
				91007,	-- Dargrul
				98208,	-- Advisor Vandros
				95888,	-- Cordana Felsong
				-- #if AFTER 7.1.0
				114790,	-- Viz'aduum the Watcher
				-- #if AFTER 7.2.0
				120793,	-- Mephistroth
				-- #if AFTER 7.3.0
				122314,	-- L'ura
				124729,	-- L'ura
				-- #endif
				-- #endif
				-- #endif
			},
		}),
		i(141592, {	-- Technique: Codex of the Tranquil Mind (Rank 3) (RECIPE!)
			["description"] = createLocalizationString({
				readable = "Supposedly able to drop from any Legion Dungeon final boss while on Heroic/Mythic, but only certain ones have been confirmed recently as indicated by the Creatures tagged on this Item.",
				constant = "SUPPOSEDLY_ABLE_TO_DROP_FROM_ANY_LEGION_DUNGEON",
				export = true,
				text = {
					en = "Supposedly able to drop from any Legion Dungeon final boss while on Heroic/Mythic, but only certain ones have been confirmed recently as indicated by the Creatures tagged on this Item.",
					-- TODO: de = "",
					-- TODO: es = "",
					-- TODO: mx = "",
					-- TODO: fr = "",
					-- TODO: it = "",
					-- TODO: ko = "",
					-- TODO: pt = "",
					-- TODO: ru = "",
					cn = "据说在英雄/史诗难度下，军团再临任意地下城的最终首领都可能掉落，但近期只有部分首领得到确认，具体见本物品上标记的生物。",
					-- TODO: tw = "",
				},
			}),
		-- [commenting out on dungeon bosses as it has only been seen on emissary chests post-Legion]
			["crs"] = {
				102387,	-- Sael'orn confirmed 2022-04-18
				102446,	-- Fel Lord Betrug confirmed 2022-04-18
				114895,	-- Nightbane confirmed 01.10.2021
				-- 98970,	-- Dantalionax
				-- 98965,	-- Kur'talos Ravencrest
				-- 99192,	-- Shade of Xavius
				-- 104218,	-- Advisor Melandrus
				-- 96028,	-- Wrath of Azshara
				-- 95676,	-- Odyn
				-- 96759,	-- Helya
				-- 91007,	-- Dargrul
				-- 98208,	-- Advisor Vandros
				-- 95888,	-- Cordana Felsong
				-- #if AFTER 7.1.0
				-- 114790,	-- Viz'aduum the Watcher
				-- #if AFTER 7.2.0
				-- 120793,	-- Mephistroth
				-- #if AFTER 7.3.0
				122314,	-- L'ura confirmed 2022-07-22
				124729,	-- L'ura
				-- #endif
				-- #endif
				-- #endif
			},
		}),
	}),
})));
