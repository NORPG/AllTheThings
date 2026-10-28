-------------------------------------
--     I N - G A M E   S H O P     --
-------------------------------------
-- #if AFTER 2.0.1
local IN_GAME_SHOP = createHeader({
	readable = "In-Game Shop",
	constant = "IN_GAME_SHOP",
	icon = [[~_.asset("Category_InGameShop")]],
	text = {
		en = [[~BATTLE_PET_SOURCE_10]],
	},
	description = {
		-- #if ANYCLASSIC
		en = "This section will show you things that you could buy in the In-Game Shop in Retail.",
		-- TODO: de = "",
		es = "Esta sección te mostrará cosas que puedes comprar en la Tienda del Juego en Retail.",
		mx = "Esta sección te mostrará cosas que puedes comprar en la Tienda del Juego en Retail.",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "此部分显示能在正式服的游戏内商城购买的东西。",
		tw = "此部分顯示能在正式服的遊戲內商城購買的東西。",
		-- #else
		en = "This section will show you things that you can buy in the In-Game Shop.",
		-- TODO: de = "",
		es = "Esta sección te mostrará cosas que puedes comprar en la Tienda del Juego.",
		mx = "Esta sección te mostrará cosas que puedes comprar en la Tienda del Juego.",
		-- TODO: fr = "",
		-- TODO: it = "",
		-- TODO: ko = "",
		-- TODO: pt = "",
		-- TODO: ru = "",
		cn = "此部分显示能在游戏内商城购买的东西。",
		tw = "此部分顯示能在遊戲內商城購買的東西。",
		-- #endif
	},
});

assignRootCategoryHeader(85, ROOTS.InGameShop, IN_GAME_SHOP);
root(ROOTS.InGameShop, bubbleDown({ u = REAL_MONEY }, {
	-- #if AFTER 5.0.1.15662
	n(ACHIEVEMENTS, {
		ach(8917, {	-- Collector's Edition: Dread Hatchling
			provider = { "i", 109014 },	-- Dread Hatchling
			timeline = { ADDED_10_1_0 },
		}),
		ach(8916, {	-- Collector's Edition: Dread Raven
			provider = { "i", 109013 },	-- Dread Raven
			timeline = { ADDED_10_1_0 },
		}),
		ach(12230, {	-- Collector's Edition: Gilded Ravasaur
			provider = { "i", 153540 },	-- Gilded Ravasaur
			timeline = { ADDED_7_3_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = HORDE_ONLY,
		}),
		ach(10320, {	-- Collector's Edition: Illidari Felstalker
			provider = { "i", 128425 },	-- Illidari Felstalker
			timeline = { ADDED_9_1_0, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		ach(6849, {	-- Collector's Edition: Imperial Quilen
			provider = { "i", 85870 },	-- Imperial Quilen
			timeline = { ADDED_8_3_0 },
		}),
		ach(6848, {	-- Collector's Edition: Lucky Quilen Cub
			provider = { "i", 85871 },	-- Lucky Quilen Cub
			timeline = { ADDED_8_3_0 },
		}),
		ach(10321, {	-- Collector's Edition: Nibbles
			provider = { "i", 128426 },	-- Nibbles
			timeline = { ADDED_9_1_0, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		ach(12229, {	-- Collector's Edition: Seabraid Stallion
			provider = { "i", 153539 },	-- Seabraid Stallion
			timeline = { ADDED_7_3_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = ALLIANCE_ONLY,
		}),
		ach(12232, {	-- Collector's Edition: Tottle
			provider = { "i", 153541 },	-- Tottle
			timeline = { ADDED_9_1_0, REMOVED_10_1_7 },	-- Removed Sep 17th, 2023
		}),
		ach(14283, {	-- Heroic Edition: Ensorcelled Everwyrm
			timeline = { ADDED_10_2_0 },
		}),
		ach(17314,	{	-- Heroic Edition: Tangled Dreamweaver
			-- #if AFTER 11.2.5
			provider = { "i", 248089 },	-- Tangled Dreamweaver
			-- #endif
			timeline = { ADDED_10_2_0 },
		}),
		ach(19029, {	-- Lil' Maggz
			provider = { "i", 208850 },	-- Lil' Maggz
			timeline = { ADDED_10_1_7, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		ach(19031, {	-- Fyrn
			provider = { "i", 208446 },	-- Fyrn
			timeline = { CREATED_10_2_5, ADDED_11_1_5 },
		}),
	}),
	-- #endif
	filter(BATTLE_PETS, {	-- AVAILABLE --
		i(106240, {	-- Alterac Brew-Pup (PET!)
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_4_2,
				-- #else
				ADDED_5_4_2,
				-- #endif
			},
		}),
		-- #if AFTER 11.2.5
		i(248091, { timeline = { ADDED_10_2_0 } }),	-- Anima Wyrmling (PET!)
		-- #else
		pet(2779, { timeline = { ADDED_10_2_0 } }),	-- Anima Wyrmling (PET!)
		-- #endif
		i(118516, { timeline = { ADDED_6_0_2 } }),	-- Argi (PET!)
		-- #if AFTER 11.2.5
		i(248092, { timeline = { ADDED_9_1_5 } }),	-- Blinky (PET!)
		-- #else
		i(188837, { timeline = { ADDED_9_1_5 } }),	-- Blinky (PET!)
		-- #endif
		i(98550, {	-- Blossoming Ancient (PET!)
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_3_0,
				-- #else
				ADDED_5_3_0,
				-- #endif
			},
		}),
		i(128424, { timeline = { ADDED_6_2_3 } }),	-- Brightpaw (PET!)
		i(92707, {	-- Cinder Kitten (PET!)
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_1_0,
				-- #else
				ADDED_5_1_0,
				-- #endif
			},
		}),
		i(190608, { timeline = { ADDED_10_1_5 } }),	-- Crushhoof
		-- #if ANYCLASSIC
		i(209877, { timeline = { ADDED_5_5_0 } }),	-- Cypress
		-- #endif
		pet(2780, { timeline = { ADDED_9_0_5 } }),	-- Daisy (PET!)
		i(109014, { timeline = { ADDED_10_1_0 } }),	-- Dread Hatchling (PET!)
		i(208446, { timeline = { ADDED_11_1_5 } }),	-- Fyrn (PET!)
		-- #if ANYCLASSIC
		i(204982, { timeline = { ADDED_5_5_0 } }),	-- Glub
		-- #endif
		cnONLY(i(252650, { timeline = { ADDED_11_2_7 } })),	-- Heartglow Listener (PET!)
		-- #if ANYCLASSIC
		i(200060, { timeline = { ADDED_5_5_0 } }),	-- Hoplet
		-- #endif
		i(68385, {	-- Lil' Ragnaros (PET!)
			timeline = {
				-- #if ANYCLASSIC
				CREATED_4_0_3,
				-- #else
				ADDED_4_0_3,
				-- #endif
			},
		}),
		i(190586, { timeline = { ADDED_9_2_5 } }),	-- Lil' Ursoc (PET!)
		i(85871, { timeline = { ADDED_8_3_0 } }),	-- Lucky Quilen Cub (PET!)
		pet(3175, { timeline = { ADDED_10_2_0 } }),	-- Murkastrasza (PET!)
		i(246342, {	-- Mustyfur Fel Snooter (PET!)
			timeline = { ADDED_11_2_5, "removed 11.2.7.65299" },	-- Removed January 12, 2026
		}),
		-- #if ANYCLASSIC
		i(198665, { timeline = { ADDED_5_5_0 } }),	-- Pebble's Pebble (PET!)
		-- #endif
		i(262982, {	-- Roofus (PET!)
			description = "Part of the charity Roofus Pack.",
			timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
		}),
		i(239082, { timeline = { ADDED_11_1_7 } }),	-- Sa'bak's Blessed (PET!)
		i(151234, { timeline = { ADDED_7_3_0 } }),	-- Shadow (PET!)
		i(248073, { timeline = { ADDED_11_2_7 } }),	-- Smoldering Valor
		i(78916, {	-- Soul of the Aspects (PET!)
			timeline = {
				-- #if ANYCLASSIC
				CREATED_4_3_0,
				-- #else
				ADDED_4_3_0,
				-- #endif
			},
		}),
		i(208751, {	-- Squally (PET!)
			timeline = { ADDED_11_2_7 },
			groups = {
				ach(19030),	-- Squally
				q(82809, {	-- Gryphons of a Feather
					provider = { "n", 209681 },	-- Squally
					groups = {
						i(224259),	-- Flash (PET!)
						i(224261),	-- Gale (PET!)
						i(224260),	-- Thundo (PET!)
					},
				}),
			},
		}),
		i(272956, { timeline = { ADDED_12_0_7 } }),	-- Sunflicker Driftmoth (PET!)
		-- #if ANYCLASSIC
		i(224002, { timeline = { ADDED_5_5_0 } }),	-- Swoopy
		-- #endif
		i(231310, { timeline = { ADDED_11_0_7 } }),	-- Timbered Sky Snakelet (PET!)
		-- #if ANYCLASSIC
		i(231312, { timeline = { ADDED_5_5_0 } }),	-- Timbered Air Snakelet
		-- #endif
		i(147900, { timeline = { ADDED_7_3_0 } }),	-- Twilight (PET!)
		i(160587, { timeline = { ADDED_8_0_1_LAUNCH } }),	-- Whomper (PET!)
		i(223498, { timeline = { ADDED_11_1_5 } }),	-- Whoopy (PET!)
		cnONLY(i(233190, { timeline = { ADDED_11_0_7 } })),	-- Wanderer Liu/Xiao Liu
	}),
	filter(BATTLE_PETS, bubbleDown({ u = REMOVED_FROM_GAME }, {	-- REMOVED --
		pet(156, { timeline = { ADDED_9_0_5, REMOVED_9_1_5 } }),	-- Bananas (PET!)
		i(160588, {	-- Cap'n Crackers (PET!)
			timeline = { ADDED_8_0_1_LAUNCH, REMOVED_10_1_7 },	-- Removed Sep 17th, 2023
		}),
		i(70099, { timeline = { ADDED_4_1_0, REMOVED_8_3_0 } }),	-- Cenarion Hatchling (PET!)
		pet(2623, {	-- Dottie (PET!)
			timeline = { ADDED_8_3_0, REMOVED_10_1_7 },	-- Removed Sep 17th, 2023
		}),
		i(69847, { timeline = { ADDED_4_1_0, REMOVED_4_2_0 } }),	-- Guardian Cub (Original Version which was bound for 24h)
		i(72068, { timeline = { ADDED_4_2_0, REMOVED_5_4_7 } }),	-- Guardian Cub (PET!)
		i(49662, {	-- Gryphon Hatchling (PET!)
			description = "This item is available only if you purchase the Plush Toy and redeem the code.",
			timeline = { ADDED_3_3_2, REMOVED_8_3_0 },
		}),
		i(213556, {	-- Hoplet (PET!)
			timeline = { ADDED_10_2_5, REMOVED_10_2_5 },	-- Removed Feb 29th, 2024
		}),
		i(49693, {	-- Lil' K.T.
			timeline = { ADDED_3_2_2, REMOVED_10_0_2_LAUNCH },	-- Removed Jan 2 2023
		}),
		i(208850, {	-- Lil' Maggz (PET!)
			timeline = { ADDED_10_1_7, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		i(54847, { timeline = { ADDED_3_3_3, REMOVED_8_3_0 } }),	-- Lil' XT (PET!)
		i(141893, {	-- Mischief (PET!)
			timeline = { ADDED_7_1_0, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		i(68384, {	-- Moonkin Egg (You had to open the Egg on both faction sides before 6.0.1 to receive your Moonkin Pet). You get both now automatically
			timeline = { ADDED_4_0_3, REMOVED_8_3_0 },
		}),
		i(68618, {	-- Moonkin Hatchling [A] (PET!)
			timeline = { ADDED_4_0_3, REMOVED_8_3_0 },
			races = ALLIANCE_ONLY,
		}),
		i(68619, {	-- Moonkin Hatchling [H] (PET!)
			timeline = { ADDED_4_0_3, REMOVED_8_3_0 },
			races = HORDE_ONLY,
		}),
		i(128426, {	-- Nibbles (PET!)
			timeline = { ADDED_6_2_2, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		i(49665, {	-- Pandaren Monk
			timeline = { ADDED_3_2_2, REMOVED_10_0_2_LAUNCH },	-- Removed Jan 2 2023
		}),
		i(231294, {	-- Reven (PET!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Removed January 7, 2025
		}),
		i(190601, {	-- Sunny
			timeline = { ADDED_10_1_5, REMOVED_10_1_7 },	-- Removed Aug 29th, 2023
		}),
		i(153541, {	-- Tottle (PET!)
			timeline = { ADDED_9_1_0,  REMOVED_10_1_7 },	-- Removed Sep 17th, 2023
		}),
		i(49663, {	-- Wind Rider Cub (PET!)
			timeline = { ADDED_3_3_2, REMOVED_8_3_0 },
			description = "This item is available only if you purchase the Plush Toy and redeem the code.",
		}),
	})),
	-- #if AFTER 5.4.0.17153
	filter(CONSUMABLES, {
		-- #if BEFORE 6.0.2
		description = "Only available in the Asian In-Game Shop.",
		-- #endif
		groups = {
			i(103557, { timeline = { ADDED_5_4_0, REMOVED_6_0_2 } }),	-- Enduring Elixir of Wisdom
			i(105911, { timeline = { ADDED_5_4_0, REMOVED_6_0_2 } }),	-- Pouch of Enduring Wisdom
			i(105912, { timeline = { ADDED_5_4_0, REMOVED_6_0_2 } }),	-- Pouch of Enduring Wisdom (5)
		},
	}),
	-- #endif
	-- #if AFTER 5.4.0.17227
	filter(COSMETIC, {	-- AVAILABLE --
		iensemble(208943, { timeline = { ADDED_11_0_0 } }),	-- Arsenal: Cosmic Weapons Cache
		iensemble(269797, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Azshara's Darkscale Raiment
		iensemble(269809, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Azshara's Deepscale Raiment

		------ Celestial Observer Set ------
		-- #if AFTER 11.2.5
		iensemble(255824, { timeline = { ADDED_11_2_5 } }),	-- Ensemble: Celestial Observer
		-- #else
		i(184832, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Astral Walkers
		i(184833, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Buckle
		i(184829, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Constellations
		i(184835, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Gloves
		i(184836, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Leggings
		i(184830, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Robe
		i(184831, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Skygazer
		i(184837, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Starshroud
		i(184834, { timeline = { ADDED_9_1_5 } }),	-- Celestial Observer's Wristwrap
		-- #endif

		------ Cozy Kobold Collection ------
		iensemble(262413, { timeline = { ADDED_12_0_1 } }),	-- Ensemble: Blue Candlelight Kobold Romper
		iensemble(262422, { timeline = { ADDED_12_0_1 } }),	-- Ensemble: Brown Candlelight Kobold Romper
		iensemble(262405, { timeline = { ADDED_12_0_1 } }),	-- Ensemble: Pink Candlelight Kobold Romper
		iensemble(262430, { timeline = { ADDED_12_0_1 } }),	-- Ensemble: Tan Candlelight Kobold Romper

		iensemble(212218, { timeline = { ADDED_10_2_5 } }),	-- Ensemble: Dreadlord's Shadowsbane Regalia
		iensemble(212219, { timeline = { ADDED_10_2_5 } }),	-- Ensemble: Dreadlord's Venombane Regalia

		iensemble(249754, { timeline = { ADDED_11_2_7 } }),	-- Ensemble: The Drustvar Winter Collection

		------ Feathered Archmage Set ------
		iensemble(243480, { timeline = { ADDED_11_1_5 } }),	-- Ensemble: Feathered Collection of the Archmage
		i(238999, { timeline = { ADDED_11_1_5 } }),	-- Standard of the Archmage

		------ Feathered Prophet Set ------
		iensemble(243481, { timeline = { ADDED_11_1_5 } }),	-- Ensemble: Feathered Collection of the Prophet
		i(239000, { timeline = { ADDED_11_1_5 } }),	-- Standard of the Prophet

		------ Fireplume Set ------
		-- #if AFTER 11.2.5
		iensemble(255815, { timeline = { ADDED_11_2_5 } }),	-- Ensemble: Fireplume Regalia
		-- #else
		i(191616, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Crest
		i(191617, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Vestments
		i(191618, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Coverts
		i(191619, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Flarewraps
		i(191620, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Plumage
		i(191621, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Insignia
		i(191622, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Talons
		i(191627, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Blouse
		i(191628, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Tailwinds
		i(191774, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Claws
		i(191775, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Shorts and Stockings
		i(191776, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Coverts
		i(191779, { timeline = { ADDED_10_0_2_LAUNCH } }),	-- Fireplume Halter
		-- #endif

		iensemble(223485, { timeline = { ADDED_10_2_7 } }),	-- Ensemble: Green Snugglefin Murloc Romper

		------ Hexed Witchwick Collection ------
		iensemble(279104, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Autumnal Witchwick Ensemble
		iensemble(279135, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Blushing Witchwick Ensemble
		iensemble(279080, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Moonlit Witchwick Ensemble
		iensemble(279022, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Wintry Witchwick Ensemble

		------ Murloc Shells Set ------
		-- #if AFTER 11.2.5
		iensemble(255839, { timeline = { ADDED_11_2_5 } }),	-- Collection: Baby Murloc Satch-Shells
		-- #else
		i(188135, { timeline = { ADDED_9_1_5 } }),	-- Frrgl's Shaking Shell
		i(184828, { timeline = { ADDED_9_1_5 } }),	-- Grrgl's Spotted Shell
		i(188136, { timeline = { ADDED_9_1_5 } }),	-- Mrrgl's Shiny Shell
		-- #endif

		iensemble(283360, { timeline = { ADDED_12_1_5 } }),	-- Ensemble: Rexxar's Fabled Attire

		------ South Guard's Copper Raiment Collection ------
		iensemble(258802, {	-- Ensemble: South Guard's Copper Raiment
			timeline = { ADDED_12_0_0, "removed 12.0.1.66198" },	-- Removed March 2nd, 2026
		}),
		i(257711, {	-- Anubisath's Sunscorched Blade
			timeline = { ADDED_12_0_0, "removed 12.0.1.66198" },	-- Removed March 2nd, 2026
		}),
		i(257426, {	-- Anubisath's Sunscorched Greatblade
			timeline = { ADDED_12_0_0, "removed 12.0.1.66198" },	-- Removed March 2nd, 2026
		}),

		------ Spirit Healer Collection ------
		iensemble(239481, { timeline = { ADDED_11_2_0 } }),	-- Arsenal: Soul-Touched Collection
		iensemble(239445, { timeline = { ADDED_11_2_0 } }),	-- Arsenal: Spirit-Touched Collection
		iensemble(239441, { timeline = { ADDED_11_2_0 } }),	-- Ensemble: Soulbringer Attire
		iensemble(239444, { timeline = { ADDED_11_2_0 } }),	-- Ensemble: Soulrune Attire
		iensemble(239439, { timeline = { ADDED_11_2_0 } }),	-- Ensemble: Spiritbringer Attire
		iensemble(239443, { timeline = { ADDED_11_2_0 } }),	-- Ensemble: Spiritrune Attire

		------ Sprite Darter Set ------
		-- #if AFTER 11.2.5
		iensemble(255817, { timeline = { ADDED_11_2_5 } }),	-- Ensemble: Sprite Darter's Wings
		-- #else
		i(172378, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Bangle
		i(172373, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Flutterers
		i(172376, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Galoshes
		i(172379, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Glovelettes
		i(172375, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Mask
		i(172377, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Sash
		i(172374, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Shawl
		i(172380, { timeline = { ADDED_8_3_0 } }),	-- Sprite Darter's Trousers
		-- #endif

		------ Stormrider's Attire Sets ------
		iensemble(209336, {	-- Ensemble: Stormrider's Attire (COSMETIC!)
			timeline = { ADDED_11_2_7 },
			groups = {
				q(77813, {	-- Lightning Strikes
					provider = { "n", 197478 },	-- Herald Flaps
					coord = { 45.4, 55.2, VALDRAKKEN },
					isBreadcrumb = true,	-- was unflagged for some players on the day it was released, sad
					DisablePartySync = true,
				}),
				q(77815, {	-- The Storm Race Tour
					sourceQuest = 77813,	-- Lightning Strikes
					provider = { "n", 193359 },	-- Lord Andestrasz
					coord = { 75.2, 55.0, THE_WAKING_SHORES },
					groups = { iensemble(209417) },	-- Ensemble: Thundering Stormrider's Attire (COSMETIC!)
				}),
				q(81993, {	-- The Stormrider's Bond [Dragon Isle Version]
					provider = { "n", 222277 },	-- Kurdran Wildhammer
					coord = { 38.3, 94.9, VALDRAKKEN },
					qi = 220737,	-- Storm Spirit (QI!)
					groups = {
						i(220710),	-- Champion Stormrider's Boots (COSMETIC!)
						i(220709),	-- Champion Stormrider's Breastplate (COSMETIC!)
						i(220716),	-- Champion Stormrider's Buckle (COSMETIC!)
						i(220711),	-- Champion Stormrider's Cape (COSMETIC!)
						i(220715),	-- Champion Stormrider's Epaulets (COSMETIC!)
						i(220712),	-- Champion Stormrider's Grips (COSMETIC!)
						i(220713),	-- Champion Stormrider's Helmet (COSMETIC!)
						i(220714),	-- Champion Stormrider's Pants (COSMETIC!)
						i(220717),	-- Champion Stormrider's Wristguards (COSMETIC!)
						i(220696),	-- Deep Stormrider's Boots (COSMETIC!)
						i(220695),	-- Deep Stormrider's Breastplate (COSMETIC!)
						i(220702),	-- Deep Stormrider's Buckle (COSMETIC!)
						i(220697),	-- Deep Stormrider's Cape (COSMETIC!)
						i(220701),	-- Deep Stormrider's Epaulets (COSMETIC!)
						i(220698),	-- Deep Stormrider's Grips (COSMETIC!)
						i(220699),	-- Deep Stormrider's Helmet (COSMETIC!)
						i(220700),	-- Deep Stormrider's Pants (COSMETIC!)
						i(220703),	-- Deep Stormrider's Wristguards (COSMETIC!)
						i(220719),	-- Shining Stormrider's Boots (COSMETIC!)
						i(220718),	-- Shining Stormrider's Breastplate (COSMETIC!)
						i(220725),	-- Shining Stormrider's Buckle (COSMETIC!)
						i(220720),	-- Shining Stormrider's Cape (COSMETIC!)
						i(220724),	-- Shining Stormrider's Epaulets (COSMETIC!)
						i(220721),	-- Shining Stormrider's Grips (COSMETIC!)
						i(220722),	-- Shining Stormrider's Helmet (COSMETIC!)
						i(220723),	-- Shining Stormrider's Pants (COSMETIC!)
						i(220726),	-- Shining Stormrider's Wristguards (COSMETIC!)
					},
				}),
				q(84908, {	-- Stormrider's Honors [Khaz Algar Version]
					lockCriteria = { 1, "questID", 83024 },	-- The Stormrider's Bond [Khaz Algar Version]
					DisablePartySync = true,
					-- Pops on login directs you to quest 83024
				}),
				q(83024, {	-- The Stormrider's Bond [Khaz Algar Version]
					provider = { "n", 225347 },	-- Stormrider Bruelda
					coord = { 35.3, 38.2, DORNOGAL },
					sym = {{"select","questID",81993},{"pop"}},	-- The Stormrider's Bond [Dragon Isle Version]
				}),
				q(81994, {	-- A Sacred Connection [Dragon Isles Version]
					sourceQuests = {
						81993,	-- The Stormrider's Bond [Dragon Isle Version]
						83024,	-- The Stormrider's Bond [Khaz Algar Version]
					},
					provider = { "n", 222277 },	-- Kurdran Wildhammer
					coord = { 38.3, 94.9, VALDRAKKEN },
					groups = {
						i(220708),	-- Frenzied Stormrider's Breastplate (COSMETIC!)
						i(220706),	-- Frenzied Stormrider's Buckle (COSMETIC!)
						i(220705),	-- Frenzied Stormrider's Epaulets (COSMETIC!)
						i(220707),	-- Frenzied Stormrider's Grips (COSMETIC!)
						i(220704),	-- Frenzied Stormrider's Helmet (COSMETIC!)
						i(220736),	-- Shocking Stormrider's Breastplate (COSMETIC!)
						i(220734),	-- Shocking Stormrider's Buckle (COSMETIC!)
						i(220733),	-- Shocking Stormrider's Epaulets (COSMETIC!)
						i(220735),	-- Shocking Stormrider's Grips (COSMETIC!)
						i(220732),	-- Shocking Stormrider's Helmet (COSMETIC!)
						i(220731),	-- Sparking Stormrider's Breastplate (COSMETIC!)
						i(220729),	-- Sparking Stormrider's Buckle (COSMETIC!)
						i(220728),	-- Sparking Stormrider's Epaulets (COSMETIC!)
						i(220730),	-- Sparking Stormrider's Grips (COSMETIC!)
						i(220727),	-- Sparking Stormrider's Helmet (COSMETIC!)
					},
				}),
				q(83025, {	-- A Sacred Connection [Khaz Algar Version]
					provider = { "n", 225347 },	-- Stormrider Bruelda
					coord = { 35.3, 38.2, DORNOGAL },
					sym = {{"select","questID",81994},{"pop"}},	-- A Sacred Connection [Dragon Isle Version]
				}),
			},
		}),

		------ Vestments of the Heavens Sets ------
		iensemble(233052, { timeline = { ADDED_11_1_0 } }),	-- Ensemble: Radiant Vestments of the Heavens
		iensemble(233050, { timeline = { ADDED_11_1_0 } }),	-- Ensemble: Shining Vestments of the Heavens

		iensemble(204888, { timeline = { ADDED_10_0_7 } }),	-- Ensemble: Waveborne Diplomat's Regalia

		------ Vibrant Petalweave Collection ------
		iensemble(271089, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Azure Petalweave
		iensemble(271080, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Blush Petalweave
		iensemble(271071, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Scarlet Petalweave
		iensemble(271062, { timeline = { ADDED_12_1_0 } }),	-- Ensemble: Sunlit Petalweave

		------ Single Pieces ------
		-- #if AFTER 11.2.5
		iensemble(255827, { timeline = { ADDED_11_2_5 } }),	-- Collection: Wings of Awakening
		-- #else
		i(188257, { timeline = { ADDED_10_2_0 } }),	-- Azure Wings of Awakening
		i(188258, { timeline = { ADDED_10_2_0 } }),	-- Bronze Wings of Awakening
		i(193610, { timeline = { ADDED_10_2_0 } }),	-- Diadem of the Spell-Keeper
		i(188259, { timeline = { ADDED_10_2_0 } }),	-- Emerald Wings of Awakening
		i(188256, { timeline = { ADDED_10_2_0 } }),	-- Obsidian Wings of Awakening
		i(188260, { timeline = { ADDED_10_2_0 } }),	-- Ruby Wings of Awakening
		-- #endif

		-- #if ANYCLASSIC
		i(23705, { timeline = { ADDED_5_5_0 } }),	-- Tabard of Flame
		-- #endif
	}),
	filter(COSMETIC, bubbleDown({ u = REMOVED_FROM_GAME }, {	-- REMOVED --
		-- Black Tropical
		iensemble(221540, {	-- Ensemble: Black Tropical Beachwear
			timeline = { ADDED_11_1_7, "removed 11.2.0.63305" },	-- Removed September 15, 2025
		}),
		iensemble(221847, {	-- Ensemble: Black Tropical Swimwear
			timeline = { ADDED_11_1_7, "removed 11.2.0.63305" },	-- Removed September 15, 2025
		}),

		iensemble(246989, {	-- Ensemble: Felreaver's Arcane Attire
			timeline = { ADDED_11_2_5, "removed 11.2.7.65299" },	-- Removed January 12, 2026
		}),

		iensemble(217029, { timeline = { ADDED_10_2_6, REMOVED_10_2_6 } }),	-- Ensemble: Gladiator's Ragged Armor

		------ Guardian Set ------
		i(190216, {	-- Feathered Cowl of the Guardian
			timeline = { ADDED_10_1_0, REMOVED_10_1_0 },	-- Removed May 31, 2023
		}),
		i(190200, {	-- Feathered Drape of the Guardian
			timeline = { ADDED_10_1_0, REMOVED_10_1_0 },	-- Removed May 31, 2023
		}),
		i(190220, {	-- Standard of the Guardian
			timeline = { ADDED_10_1_0, REMOVED_10_1_0 },	-- Removed May 31, 2023
		}),

		iensemble(208412, {	-- High Scholar's Arcana
			timeline = { ADDED_10_1_5, REMOVED_10_1_7 },	-- Removed Oct 31st, 2023
		}),

		iensemble(246291, {	-- Ensemble: Lana'thel's Crimson Couture
			timeline = { ADDED_11_2_5, "removed 11.2.7.65299" },	-- Removed January 12, 2026
		}),

		------ Lavaborn Emerald Attire Set ------
		iensemble(238428, {	timeline = { ADDED_11_1_5, "removed 11.1.7.61967" } }),	-- Ensemble: Lavaborn Emerald Attire	-- Removed July 14, 2025
		i(238948, {	timeline = { ADDED_11_1_5, "removed 11.1.7.61967" } }),	-- Fel Inferno Helm	-- Removed July 14, 2025

		iensemble(212221, {	-- Ensemble: Sky Witch's Attire
			timeline = { ADDED_11_0_5, "removed 11.1.0.60037" },	-- Removed March 31, 2025
		}),

		iensemble(210079, {	-- Sky-Captain's Masquerade Attire
			timeline = { ADDED_10_2_0, REMOVED_10_2_0 },	-- Removed Jan 1st, 2024
		}),

		iensemble(200925, {	-- Ensemble: Solemn Watchman's Garb
			timeline = { ADDED_10_1_5, REMOVED_10_1_7 },
		}),

		iensemble(212222, {	-- Ensemble: Twilight Witch's Attire
			timeline = { ADDED_10_2_5, REMOVED_10_2_5 },	-- Removed Feb 29th, 2024
		}),

		------ Single Pieces ------
		i(97213, {	-- Hood of Hungering Darkness
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_4_0,
				-- #else
				ADDED_5_4_0,
				-- #endif
				REMOVED_8_3_0
			},
		}),
		i(95474, {	-- Jewel of the Firelord
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_4_0,
				-- #else
				ADDED_5_4_0,
				-- #endif
				REMOVED_8_3_0
			},
		}),
		i(95475, {	-- Crown of Eternal Winter
			timeline = {
				-- #if ANYCLASSIC
				CREATED_5_4_0,
				-- #else
				ADDED_5_4_0,
				-- #endif
				REMOVED_8_3_0
			},
		}),
		i(231290, {	-- Reven's Comfy Carrier
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Removed January 7, 2025
		}),
	})),
	-- #endif
	n(DECOR, {
		timeline = { ADDED_12_0_1 },
		groups = {
			i(260727),	-- Alliance Doormat (DECOR!)
			i(263052),	-- Beloved Lion Plushie (DECOR!)
			i(263053),	-- Beloved Wolf Plushie (DECOR!)
			i(250795),	-- Colorful Dotted Egg (DECOR!)
			i(250794),	-- Colorful Shroomic Egg (DECOR!)
			i(250796),	-- Colorful Striped Egg (DECOR!)
			i(260728),	-- Horde Doormat (DECOR!)
			i(253546),	-- Lush Garden Butterfly Sconce (DECOR!)
			i(252419),	-- Lush Garden Fungal Basin (DECOR!)
			i(258567),	-- Lush Garden Fungal Chair (DECOR!)
			i(258888),	-- Lush Garden Fungal Fountain (DECOR!)
			i(266164, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Fungal Picnic (DECOR!)
			i(266163, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Fungal Planter (DECOR!)
			i(266070, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Fungal Table (DECOR!)
			i(258294),	-- Lush Garden Gnome-Like Statue (DECOR!)
			i(266162, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Hedge (DECOR!)
			i(268550, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Rug (DECOR!)
			i(267203, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Stable (DECOR!)
			i(250793),	-- Lush Garden Trellis (DECOR!)
			i(264692, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Window (DECOR!)
			i(259046, {	-- Paw Pal Bed (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(259045, {	-- Paw Pal Bed and Blanket (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(264275, {	-- Paw Pal House Durotar Roof (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(259094, {	-- Paw Pal House Elwynn Roof (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(264276, {	-- Paw Pal House Eversong Roof (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(259093, {	-- Paw Pal House Frame (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(264277, {	-- Paw Pal House Shadowglen Roof (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(259044, {	-- Paw Pal Water Dish (DECOR!)
				description = "Part of the charity Roofus Pack.",
				timeline = { "added 12.0.1.66384", "removed 12.0.5.67451" },	-- Removed May 12, 2026
			}),
			i(250797),	-- Spring Blossom Ceiling Light (DECOR!)
			i(258569),	-- Spring Blossom Gazebo (DECOR!)
			i(254417),	-- Spring Blossom Hanging Chair (DECOR!)
			i(266165, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Lantern (DECOR!)
			i(266167, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Pond (DECOR!)
			i(265556, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Privacy Screen (DECOR!)
			i(250798),	-- Spring Blossom Shelf (DECOR!)
			i(265555, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Stepping Stone (DECOR!)
			i(265559, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Stepping Stone Collection (DECOR!)
			i(265557, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Stepping Stone Duo (DECOR!)
			i(265558, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Stepping Stone Trio (DECOR!)
			i(266069, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Table (DECOR!)
			i(266068, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Tea Set (DECOR!)
			i(266166, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Tranquility Garden (DECOR!)
			i(263290),	-- Spring Blossom Tree (DECOR!)
			i(263291, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Tree Pond (DECOR!)
			i(258568),	-- Spring Blossom Window (DECOR!)
			i(253547),	-- Spring Blossom Wreath (DECOR!)
			i(281372, { timeline = { ADDED_12_1_5 } }),	-- Zhevraskin Rug (DECOR!)

			-- Houses
			i(272146, { timeline = { ADDED_12_0_5 } }),	-- Lush Garden Treehouse
			i(272992, { timeline = { ADDED_12_0_5 } }),	-- Spring Blossom Treehouse
		},
	}),
	filter(MOUNTS, {	-- AVAILABLE --
		i(258479, { timeline = { ADDED_11_2_7 } }),	-- Algarian Stormrider (MOUNT!)
		-- #if ANYCLASSIC
		mount(1229672, { timeline = { ADDED_5_5_1 } }),	-- Archmage's Great Crow
		-- #endif
		i(268474, { timeline = { ADDED_12_0_5 } }),	-- Amberback Arboon (MOUNT!)
		i(238994, { timeline = { ADDED_11_1_5 } }),	-- Archmage's Great Raven (MOUNT!)
		i(190636, { timeline = { ADDED_10_1_5 } }),	-- Armored Siege Kodo (MOUNT!)
		i(282657, {	-- Ashen Dreadglider (MOUNT!)
			description = "Obtained if you set up a 12-Month WoW Subscription.",
			timeline = { ADDED_12_1_5 },
		}),
		-- #if ANYCLASSIC
		mount(440915, { timeline = { ADDED_3_4_3 } }),	-- Auspicious Arborwyrm (MOUNT!)
		-- #else
		mount(418286, { timeline = { ADDED_10_2_0 } }),	-- Auspicious Arborwyrm (MOUNT!)
		-- #endif
		i(268472, {	-- Blossomback Arboon (MOUNT!)
			timeline = { ADDED_12_0_5 },
		}),
		i(219450, { timeline = { ADDED_10_2_6_SEASON_FOUR } }),	-- Charming Courier (MOUNT!)
		i(250108, { timeline = { ADDED_11_2_7 } }),	-- Cragstepper Crest-Horn (MOUNT!)
		i(109013, { timeline = { ADDED_10_1_0 } }),	-- Dread Raven (MOUNT!)
		-- #if ANYCLASSIC
		mount(1257674, { timeline = { ADDED_5_5_3 } }),	-- Embertuft Groveglider
		-- #endif
		-- #if NOT ANYCLASSIC
		i(97989, { timeline = { ADDED_5_3_0 } }),	-- Enchanted Fey Dragon (MOUNT!)
		-- #endif
		mount(307932, { timeline = { ADDED_10_2_0 } }),	-- Ensorcelled Everwyrm (MOUNT!)
		-- #if ANYCLASSIC
		mount(1238816, { timeline = { ADDED_5_5_0 } }),	-- Envoy of Sa'bak
		-- #endif
		i(278743, {	-- Giant Grrloc (MOUNT!)
			description = "Obtained if you set up a 12-Month WoW Subscription.",
			timeline = { ADDED_12_1_5 },
		}),
		mount(457485, { timeline = { ADDED_11_0_2 } }),	-- Grizzly Hills Packmaster (MOUNT!)
		-- #if NOT ANYCLASSIC
		i(78924, { timeline = { ADDED_4_3_0 } }),	-- Heart of the Aspects (MOUNT!)
		-- #endif
		i(274164, { timeline = { ADDED_12_1_0 } }),	-- Hearthkeeper's Wandering Caravan (MOUNT!)
		i(239076, {	-- Herald of Sa'bak (MOUNT!)
			description = "Also obtained if you set up a 6-Month WoW Subscription.",
			timeline = { ADDED_11_1_7 },
		}),

		------ Hexed Witchwick Collection ------
		i(275551, { timeline = { ADDED_12_1_0 } }),	-- Autumnal Witchwick's Rider (MOUNT!)
		i(275573, { timeline = { ADDED_12_1_0 } }),	-- Blushing Witchwick's Rider (MOUNT!)
		i(275571, { timeline = { ADDED_12_1_0 } }),	-- Moonlit Witchwick's Rider (MOUNT!)
		i(280581, { timeline = { ADDED_12_1_0 } }),	-- Wintry Witchwick's Rider (MOUNT!)

		i(166774, { timeline = { ADDED_8_1_0 } }),	-- Hogrus, Swine of Good Fortune (MOUNT!)
		i(85870, { timeline = { ADDED_8_3_0 } }),	-- Imperial Quilen (MOUNT!)
		-- #if AFTER 11.2.5
		i(248088, { timeline = { ADDED_10_0_2 } }),	-- Jade, Bright Foreseer (MOUNT!)
		-- #else
		mount(369451, { timeline = { ADDED_10_0_2 } }),	-- Jade, Bright Foreseer (MOUNT!)
		-- #endif
		-- #if ANYCLASSIC
		i(192455, { timeline = { ADDED_3_4_0 } }),	-- Kalu'ak Whalebone Glider (MOUNT!)
		-- #endif
		i(242795, {	-- Lana'Thel's Crimson Cascade (MOUNT!)
			timeline = { ADDED_11_2_5, "removed 11.2.7.65299" },	-- Removed January 12, 2026
		}),
		i(275756, { timeline = { ADDED_12_1_5 } }),	-- Living Heartsbane Cauldron (MOUNT!)
		mount(308087, { timeline = { ADDED_9_0_2 } }),	-- Lucky Yun (MOUNT!)
		i(147901, { timeline = { ADDED_7_3_0 } }),	-- Luminous Starseeker (MOUNT!)
		-- #if ANYCLASSIC
		mount(1224647, { timeline = { ADDED_5_5_3 } }),	-- Meeksi Brewrobber (MOUNT!)
		-- #endif
		i(233286, { timeline = { ADDED_11_1_0, "removed 11.1.5.60568", ADDED_11_2_7 } }),	-- Meeksi Brewthief (MOUNT!)
		-- #if ANYCLASSIC
		mount(1224643, { timeline = { ADDED_5_5_3 } }),	-- Meeksi Gentlepaw (MOUNT!)
		-- #endif
		i(233284, { timeline = { ADDED_11_1_0, "removed 11.1.5.60568", ADDED_11_2_7 } }),	-- Meeksi Rollingpaw (MOUNT!)
		i(233282, { timeline = { ADDED_11_1_0, "removed 11.1.5.60568", ADDED_11_2_7 } }),	-- Meeksi Rufflefur (MOUNT!)
		-- #if ANYCLASSIC
		mount(1224645, { timeline = { ADDED_5_5_3 } }),	-- Meeksi Rufflemane (MOUNT!)
		-- #endif
		i(233283, { timeline = { ADDED_11_1_0, "removed 11.1.5.60568", ADDED_11_2_7 } }),	-- Meeksi Softpaw (MOUNT!)
		-- #if ANYCLASSIC
		mount(1224596, { timeline = { ADDED_5_5_3 } }),	-- Meeksi Teapuff (MOUNT!)
		-- #endif
		i(233285, { timeline = { ADDED_11_1_0 } }),	-- Meeksi Teatuft (MOUNT!)
		-- #if ANYCLASSIC
		mount(1224646, { timeline = { ADDED_5_5_3 } }),	-- Meeksi Wanderpaw (MOUNT!)
		-- #endif
		i(122469, { timeline = { ADDED_6_1_0 } }),	-- Mystic Runesaber (MOUNT!)
		i(190581, { timeline = { ADDED_9_2_5 } }),	-- Nether-Gorged Greatwyrm (MOUNT!)
		-- #if ANYCLASSIC
		mount(1257676, { timeline = { ADDED_5_5_3 } }),	-- Petalbranch Groveglider
		-- #endif
		-- #if ANYCLASSIC
		mount(1229670, { timeline = { ADDED_5_5_1 } }),	-- Prophet's Great Crow
		-- #endif
		i(238943, { timeline = { ADDED_11_1_5 } }),	-- Prophet's Great Raven (MOUNT!)
		-- #if ANYCLASSIC
		i(184865, { timeline = { ADDED_3_4_0 } }),	-- Reawakened Phase-Hunter (MOUNT!)
		-- #endif
		mount(347812, { timeline = { ADDED_9_0_5 } }),	-- Sapphire Skyblazer (MOUNT!)
		------ Scurrywind Groveglider Collection ------
		i(250973, { timeline = { ADDED_12_0_1 } }),	-- Blossombranch Groveglider (MOUNT!)
		i(250971, { timeline = { ADDED_12_0_1 } }),	-- Cindertuft Groveglider (MOUNT!)
		i(250930, { timeline = { ADDED_12_0_1 } }),	-- Frostfall Groveglider (MOUNT!)
		i(250972, { timeline = { ADDED_12_0_1 } }),	-- Gloombough Groveglider (MOUNT!)

		-- #if ANYCLASSIC
		mount(1257677, { timeline = { ADDED_5_5_3 } }),	-- Shadowbough Groveglider
		-- #endif
		i(156564, { timeline = { ADDED_8_0_1 } }),	-- Shu-zen, the Divine Sentinel (MOUNT!)
		-- #if ANYCLASSIC
		mount(1257673, { timeline = { ADDED_5_5_3 } }),	-- Snowfall Groveglider
		-- #endif
		mount(308078, { timeline = { ADDED_8_3_0 } }),	-- Squeakers, the Trickster (MOUNT!)
		mount(326390, { timeline = { ADDED_8_3_7 } }),	-- Steamscale Incinerator (MOUNT!)
		i(267078, { timeline = { ADDED_12_0_7 } }),	-- Stoneforged Sentinel (MOUNT!)
		i(273655, { timeline = { ADDED_12_0_7 } }),	-- Sunflare Driftmoth (MOUNT!)
		cnONLY(i(272920, { timeline = { ADDED_12_0_7 } })),	-- Spring Panda (MOUNT!)
		-- #if AFTER 11.2.0
		i(246698, { timeline = { ADDED_9_1_0 } }),	-- Sunwarmed Furline (MOUNT!)
		-- #else
		mount(317177, { timeline = { ADDED_9_1_0 } }),	-- Sunwarmed Furline (MOUNT!)
		-- #endif
		i(166776, { timeline = { ADDED_8_2_0 } }),	-- Sylverian Dreamer (MOUNT!)
		-- #if AFTER 11.2.5
		i(248089, { timeline = { ADDED_10_2_0 } }),	-- Tangled Dreamweaver (MOUNT!)
		-- #else
		mount(359843, { timeline = { ADDED_10_2_0 } }),	-- Tangled Dreamweaver (MOUNT!)
		-- #endif
		i(231297, {	-- Timbered Sky Snake (MOUNT!)
			description = "Also obtained if you set up a 6-Month WoW Subscription.",
			timeline = { ADDED_11_0_7 },
		}),
		i(229418, {	-- Trader's Gilded Brutosaur (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238", "added 11.2.5.64395", "removed 11.2.7.64978" },	-- Removed Jan 6, 2025, Added Nov 17 2025, Removed Jan 5 2026
		}),
		-- #if AFTER 11.2.5
		i(248090, {	-- Viridian Phase-Hunter (MOUNT!)
			timeline = { ADDED_10_0_2 },	-- Not sure when exactly it got added to the shop.
		}),
		-- #else
		mount(346136, {	-- Viridian Phase-Hunter (MOUNT!)
			timeline = { ADDED_10_0_2 },	-- available on 17 November 2022
		}),
		-- #endif
		i(246920, {	-- Void-Razed Elekk (MOUNT!)
			timeline = { ADDED_11_2_5, "removed 11.2.7.65299" },	-- Removed January 12, 2026
		}),
		i(166775, { timeline = { ADDED_8_1_0 } }),	-- Vulpine Familiar (MOUNT!)
		mount(359317, { timeline = { ADDED_9_1_5 } }),	-- Wen Lo, the River's Edge (MOUNT!)
		i(277261, { timeline = { ADDED_12_1_0 } }),	-- Whoofle Bramblewing (MOUNT!)
		i(206167, { timeline = { ADDED_10_1_0 } }),	-- Wonderous Wavewhisker (MOUNT!)
		i(268833, { timeline = { ADDED_12_1_0 } }),	-- Zothwing Darkseeker (MOUNT!)
		i(268834, { timeline = { ADDED_12_1_0 } }),	-- Zothwing Deepseeker (MOUNT!)
	}),
	filter(MOUNTS, bubbleDown({ u = REMOVED_FROM_GAME }, {	-- REMOVED --
		i(207964, {	-- Alabaster Stormtalon (MOUNT!)
			timeline = { ADDED_8_2_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = ALLIANCE_ONLY,
		}),
		i(207963, {	-- Alabaster Thunderwing (MOUNT!)
			timeline = { ADDED_8_2_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = HORDE_ONLY,
		}),
		i(95341, { timeline = { ADDED_5_2_0, REMOVED_8_3_0 } }),	-- Armored Bloodwing (MOUNT!)
		i(190231, {	-- Ash'adar, Harbinger of Dawn (MOUNT!)
			timeline = { ADDED_10_2_5, REMOVED_10_2_6 },	-- 1st March 2024 until 1st April 2024
		}),
		i(54811, {	-- Celestial Steed (MOUNT!)
			timeline = { ADDED_3_3_3, REMOVED_10_0_2_LAUNCH },	-- Removed from shop on Jan 2 2023, will be offered sometimes in Trading Post
		}),
		-- #if ANYCLASSIC
		mount(466948, { timeline = { ADDED_4_4_1, REMOVED_4_4_2 } }),	-- Chaos-Born Dreadwing (MOUNT!)
		-- #endif
		i(230200, {	-- Chaos-Forged Dreadwing (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Available through January 6, 2025
		}),
		-- #if ANYCLASSIC
		mount(466983, { timeline = { ADDED_4_4_1, REMOVED_4_4_2 } }),	-- Chaos-Born Gryphon (MOUNT!)
		-- #endif
		i(230184, {	-- Chaos-Forged Gryphon (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Available through January 6, 2025
		}),
		-- #if ANYCLASSIC
		mount(466980, { timeline = { ADDED_4_4_1, REMOVED_4_4_2 } }),	-- Chaos-Born Hippogryph (MOUNT!)
		-- #endif
		i(230185, {	-- Chaos-Forged Hippogryph (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Available through January 6, 2025
		}),
		-- #if ANYCLASSIC
		mount(466977, { timeline = { ADDED_4_4_1, REMOVED_4_4_2 } }),	-- Chaos-Born Wind Rider (MOUNT!)
		-- #endif
		i(230201, {	-- Chaos-Forged Wind Rider (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.0.7.58238" },	-- Available through January 6, 2025
		}),
		i(208598, {	-- Eve's Ghastly Rider (MOUNT!)
			timeline = { ADDED_11_0_2, REMOVED_11_0_5 },	-- 1st October 2024 until 5th November 2024
		}),
		i(238966, {	-- Felborn Cormaera (MOUNT!)
			timeline = { ADDED_11_1_5, "removed 11.1.7.61967" },	-- Removed July 14, 2025
		}),
		i(112327, { timeline = { ADDED_6_0_2, REMOVED_8_3_0 } }),	-- Grinning Reaver (MOUNT!)
		i(153540, {	-- Gilded Ravasaur (MOUNT!)
			timeline = { ADDED_7_3_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = HORDE_ONLY,
		}),
		i(107951, {	-- Iron Skyreaver (MOUNT!)
			timeline = { ADDED_5_4_2, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		i(128425, {	-- Illidari Felstalker (MOUNT!)
			timeline = { ADDED_9_1_0, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
		}),
		i(221270, { timeline = { ADDED_11_1_7, "removed 11.2.0.63305" } }),	-- Kickin' Kezan Waveshredder (MOUNT!)
		i(92724, { timeline = { ADDED_5_1_0, REMOVED_8_1_0 } }),	-- Swift Windsteed (MOUNT!)
		i(153539, {	-- Seabraid Stallion (MOUNT!)
			timeline = { ADDED_7_3_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
			races = ALLIANCE_ONLY,
		}),
		i(233019, {	-- Sky Witch's Sweeper (MOUNT!)
			timeline = { ADDED_11_0_7, "removed 11.1.0.60037" },	-- Removed March 31, 2025
		}),
		i(212228, {	-- Soaring Sky Fox (MOUNT!)
			timeline = { ADDED_11_0_5, "removed 11.1.0.60037" },	-- Removed March 31, 2025
		}),
		i(160589, {	-- The Dreadwake (MOUNT!)
			timeline = { ADDED_8_0_1_LAUNCH, REMOVED_10_1_7 },	-- Removed Sep 17th, 2023
		}),
		i(212229, {	-- Twilight Sky Prowler (MOUNT!)
			timeline = { ADDED_10_2_5, REMOVED_10_2_5 },	-- Removed Feb 29th, 2024
		}),
		i(233020, {	-- Twilight Witch's Sweeper (MOUNT!)
			timeline = { ADDED_11_0_7, "removed 11.1.0.60037" },	-- Removed March 31, 2025
		}),
		i(76755, {	-- Tyrael's Charger (MOUNT!)
			timeline = { ADDED_10_0_2_LAUNCH, REMOVED_10_0_2_LAUNCH },	-- removed from the store again on Jan 2 2023
		}),
		i(112326, {	-- Warforged Nightmare (MOUNT!)
			timeline = { ADDED_6_0_2, REMOVED_10_1_7 },	-- Removed Oct 31, 2023
			groups = { i(112324) },	-- Nightmarish Hitching Post (TOY!)
		}),
		i(69846, {	-- Winged Guardian (MOUNT!)
			timeline = { ADDED_4_1_0, REMOVED_10_0_2_LAUNCH },	-- Removed Jan 2 2023
		}),
	})),
	-- #if AFTER 5.0.4
	filter(TOYS, {
		-- #if ANYCLASSIC
		i(184871, { timeline = { ADDED_5_5_0 } }),	-- Dark Portal (TOY!)
		-- #endif
		i(208704, { timeline = { ADDED_11_2_7 } }),	-- Deepdweller's Earthen Hearthstone (TOY!)
		i(172179, { timeline = { ADDED_10_2_0 } }),	-- Eternal Traveler's Hearthstone (TOY!)
		-- #if ANYCLASSIC
		i(198647, { timeline = { ADDED_5_5_0 } }),	-- Fishspeaker's Lucky Lure (TOY!)
		i(33219, { timeline = { ADDED_5_5_0 } }),	-- Goblin Gumbo Kettle (TOY!)
		-- #endif
		i(166778, {	-- Horde's Might Firework (TOY!)
			timeline = { ADDED_8_1_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
		}),
		-- #if ANYCLASSIC
		i(32542, { timeline = { ADDED_5_5_0 } }),	-- Imp in a Ball (TOY!)
		-- #endif
		i(166777, {	-- Lion's Pride Firework (TOY!)
			timeline = { ADDED_8_1_5, REMOVED_10_1_0 },	-- Removed 17th April 2023
		}),
		i(210467, { timeline = { ADDED_10_2_5 } }),	-- Magical Murkmorpher (TOY!)
		-- #if ANYCLASSIC
		i(38233, { timeline = { ADDED_5_5_0 } }),	-- Path of Illidan (TOY!)
		-- #endif
		i(284572, { timeline = { ADDED_12_1_5 } }),	-- Rexxar's Companion Transformation (TOY!)
		i(208883, { timeline = { ADDED_11_2_7 } }),	-- Sandbox Storm Gryphon (TOY!)
		i(193588, { timeline = { ADDED_10_2_0 } }),	-- Timewalker's Hearthstone (TOY!)
		i(166779, { timeline = { ADDED_8_1_5 } }),	-- Transmorpher Beacon (TOY!)
	}),
	-- #endif
	i(122284, { timeline = { ADDED_6_1_2 } }),	-- WoW Token (Use)
	i(122270, { timeline = { ADDED_6_1_2 } }),	-- Wow Token (Sell)
}));
-- #endif
