-----------------------------------------------------
--        P R O M O T I O N S   M O D U L E        --
-----------------------------------------------------

TITANFORGED_PROMOTIONS = createHeader({
	readable = "Titanforged Promotions",
	icon = [[~_.asset("Expansion_MN")]],
	text = {
		en = "Titanforged Promotions",
		-- TODO: de = "",
	--	es = "Promociones temporada Midnight",
	--	mx = "Promociones temporada Midnight",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
	--	ru = "Промо Midnight",
	--	cn = "至暗之夜季节性促销",
	--	tw = "《至暗之夜》季節性促銷",
	},
	description = {
	--	en = "These promotions happened during the time Midnight was the most recent expansion.\n\nThey are listed in the order of their first appearance.",
	--	es = "Estas promociones tuvieron lugar durante el tiempo en que Midnight era la expansión más reciente.\n\nSe enumeran en el orden en que aparecieron por primera vez.",
	--	mx = "Estas promociones sucedieron durante el tiempo en que Midnight era la expansión más reciente.\n\nSe listan en el orden en que aparecieron por primera vez.",
	--	cn = "这些促销活动均发生在《至暗之夜（Midnight）》作为最新资料片的时期。以下按活动首次出现的时间顺序列出",
	},
});

root(ROOTS.Promotions, {
	cnONLY(n(TITANFORGED_PROMOTIONS, {
		["timeline"] = { "added 3.80.0", "removed 3.89.0" },	-- Unclear when it exactly ends
		["groups"] = {
			mount(1280400, {	-- Reforged Invincible (MOUNT!)
				["description"] = "This red version of the iconic Invincible mount has so far only been available in China. We don't know if or when it'll become available in the rest of the world. It was obtainable only through a special event on China's Titan Reforged servers in September-November 2025, awarded to players who defeated the Lich King in Icecrown Citadel on any difficulty.",
			}),
			i(269659, {	-- The Sire's Palanquin
				["description"] = "This unique palanquin was only available from a China-exclusive event: the Crimson Tide Treasure promotion during April-May, 2026. In this event, players obtain Azerothian Treasure Coins and spend them to obtain random prizes in a lootbox-style marketing campaign.",
			}),
		},
	})),
});

--https://warcraft.wiki.gg/wiki/Titan_Reforged_-_Chrono