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
CN_PROMOTIONS_CLASSIC = createHeader({
	readable = "CN Promotions (Classic)",
	icon = [[~_.asset("Expansion_WOTLK")]],
	text = {
		en = "CN Promotions (Classic)",
		-- TODO: de = "",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
	},
	description = {
		en = "These promotions are limited to the Classic & Titanforged Chinese Realms.",
	},
});
root(ROOTS.Promotions, {
	cnONLY(n(CN_PROMOTIONS_CLASSIC, {
		n(QUICKSAND_SECRET_TREASURE_VAULT, sharedDataSelf({
			["timeline"] = { "added 3.80.0", "removed 3.80.10", "added 5.5.0", "removed 5.5.10" },
		}, {
			["groups"] = {
				i(63125), -- Dark Phoenix (MOUNT!) (August 2026)
				i(38312), -- Tabard of Brilliance (COSMETIC!) (August 2026)
				i(257515), -- Lil' Coalee (PET!) (August 2026)
				i(38576), -- Big Battle Bear (MOUNT!)
				i(49704), -- Carved Ogre Idol (TOY!)
				i(78924), -- Heart of the Aspects (MOUNT!)
				i(23720), -- Riding Turtle (MOUNT!)
				i(226812), -- Harmonious Greetings Bear (PET!)
			},
		}));
		n(LUCKY_BAMBOO_TILES, sharedDataSelf({
			["timeline"] = { "added 3.80.0", "removed 3.80.10", "added 5.5.0", "removed 5.5.10" },
		}, {
			["groups"] = {
				i(272920), -- Spring Panda (MOUNT!)
				i(170206), -- Crown of Infinite Prosperity (COSMETIC!)
				i(275818), -- Pinky (PET!)
				i(98550), -- Blossoming Ancient (PET!)
				i(273849, { -- Landro's Sha-Touched Loot Box
					["description"] = "1.25% chance for any of the following:",
					["groups"] = {
						i(273021),	-- Sha-Warped Hippogryph Hatchling (PET!)
						i(269640),	-- Sha-Warped Owl (MOUNT!)
						i(269012),	-- Sha-Warped Riding Wolf (MOUNT!)
						i(54860),	-- X-53 Touring Rocket (MOUNT!)
					},
				}),
				-- #if AFTER 3.80.0
				-- #if BEFORE 3.80.10
			--	i(ITEMID_TODO), -- Northrend Adventuring Supplies (Titan Reforged) (ITEM!)
				-- #endif
				-- #endif
				-- #if AFTER 5.5.0
				-- #if BEFORE 5.5.10
				i(269590), -- Lorewalker's Curio Crate (MoP Classic) (ITEM!)
				-- #endif
				-- #endif
			},
		}));
		-- TODO: This Event + Treasure of Azeroth, Lunar New Year, and Crimson Tide Treasure
		--[[n(AZURESPAN_TREASURETROVE, sharedDataSelf({
			["timeline"] = { "added 3.80.0", "removed 3.80.10", "added 5.5.0", "removed 5.5.10" },
		}, {
			["groups"] = {
				i(ITEMID_TODO), -- Tuskarr Hermit Crab (MOUNT!)
				i(ITEMID_TODO), -- Death Knight toy item (TOY!)
				i(ITEMID_TODO), -- Fishmonger May (PET!)
				i(ITEMID_TODO), -- Tuskarr Dinghy (MOUNT!)
				i(ITEMID_TODO), -- Backswimmer Timbertooth (PET!)
				i(ITEMID_TODO), -- Delta (PET!)
				i(ITEMID_TODO), -- Tuskarr Ice Fishing Tent (TOY!)
				i(ITEMID_TODO), -- Big Kinook's Spare Ladle (COSMETIC!)
				i(ITEMID_TODO), -- Landro's Sha-Touched Loot Box (CONSUMABLE!)
				i(ITEMID_TODO), -- Landro's Sha-Touched Loot Box (CONSUMABLE!)
				i(ITEMID_TODO), -- Northrend Adventuring Supplies (Titan Reforged) (ITEM!)
				i(ITEMID_TODO), -- Lorewalker's Curio Crate (MoP Classic) (ITEM!)
				--i(ITEMID_TODO), -- Treasure Shard (CURRENCY!)
				n(TOP_TIER_CNONLY, {
					["groups"] = {
						i(ITEMID_TODO), -- Heart of the Nightwing (MOUNT!)
						i(ITEMID_TODO), -- Avatar of Flame (MOUNT!)
						i(ITEMID_TODO), -- Tuskarr Hermit Crab (MOUNT!)
						i(ITEMID_TODO), -- Death Knight toy item (TOY!)
					},
				}),
				n(FIRST_TIER_CNONLY, {
					["groups"] = {
						i(ITEMID_TODO), -- Lava Drake (MOUNT!)
						i(ITEMID_TODO), -- Festering Emerald Drake (MOUNT!)
						i(ITEMID_TODO), -- Blazing Hippogryph (MOUNT!)
						i(ITEMID_TODO), -- Nightmarish Emerald Drake (MOUNT!)
						i(ITEMID_TODO), -- Spectral Gryphon (MOUNT!)
						i(ITEMID_TODO), -- Spectral Wind Rider (MOUNT!)
						i(ITEMID_TODO), -- Tuskarr Dinghy (MOUNT!)
					},
				}),
				n(SECOND_TIER_CNONLY, {
					["groups"] = {
						i(ITEMID_TODO), -- Spectral Tiger Cub (PET!)
						i(ITEMID_TODO), -- Murky's Little Soulstone (PET!)
						i(ITEMID_TODO), -- Lil' Wrathion (PET!)
						i(ITEMID_TODO), -- Fishing Chair (DECOR!)
						i(ITEMID_TODO), -- Carved Ogre Idol (TOY!)
						i(ITEMID_TODO), -- Fishmonger May (PET!)
						i(ITEMID_TODO), -- Delta (PET!)
						i(ITEMID_TODO), -- Tuskarr Ice Fishing Tent (TOY!)
						i(ITEMID_TODO), -- Backswimmer Timbertooth (PET!)
					},
				}),
				n(THIRD_TIER_CNONLY, {
					["groups"] = {
						i(ITEMID_TODO), -- Perpetual Purple Firework (TOY!)
						i(ITEMID_TODO), -- Imp in a Ball (TOY!)
						i(ITEMID_TODO), -- Grim Campfire (TOY!)
						i(ITEMID_TODO), -- Spurious Sarcophagus (TOY!)
						i(ITEMID_TODO), -- Goblin Gumbo Kettle (TOY!)
						i(ITEMID_TODO), -- D.I.S.C.O. (TOY!)
						i(ITEMID_TODO), -- Instant Statue Pedestal (TOY!)
						i(ITEMID_TODO), -- Silver Pig Coin (TOY!)
						i(ITEMID_TODO), -- Enchanted Purple Jade (TOY!)
						i(ITEMID_TODO), -- Picnic Basket (TOY!)
						i(ITEMID_TODO), -- Hippogryph Hatchling (PET!)
					},
				}),
			},
		}));--]]
		n(CN_WOW_ANNIVERSARY_TWENTYONE, sharedDataSelf({	-- Yes CN is 1year Behind and celebrates 21st Bday 2026
			["timeline"] = { "added 3.80.0", "removed 3.80.10", "added 5.5.0", "removed 5.5.10" },
		}, {
			["groups"] = {
				-- Login giveaway
				i(95059), -- Clutch of Ji-Kun (MOUNT!)
				i(273150), -- Voidfeather Dragonhawk (MOUNT!)
				-- Deluxe Collector's Annual Pass Bundle
				i(281681), -- Varian's Dragon Spirit (TOY!)
			},
		})),
	})),
	cnONLY(n(TITANFORGED_PROMOTIONS, {
		["timeline"] = { "added 3.80.0", "removed 3.80.10" },
		["groups"] = {
			mount(1280400, {	-- Reforged Invincible (MOUNT!)
				["description"] = "This red version of the iconic Invincible mount has so far only been available in China. We don't know if or when it'll become available in the rest of the world. It was obtainable only through a special event on China's Titan Reforged servers in September-November 2025, awarded to players who defeated the Lich King in Icecrown Citadel on any difficulty.",
			}),
			i(269659, {	-- The Sire's Palanquin (MOUNT!)
				["description"] = "This unique palanquin was only available from a China-exclusive event: the Crimson Tide Treasure promotion during April-May, 2026. In this event, players obtain Azerothian Treasure Coins and spend them to obtain random prizes in a lootbox-style marketing campaign.",
			}),
		},
	})),
});

--https://warcraft.wiki.gg/wiki/Titan_Reforged_-_Chrono
