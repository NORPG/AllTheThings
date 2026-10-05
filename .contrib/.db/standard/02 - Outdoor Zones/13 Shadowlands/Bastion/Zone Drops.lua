---------------------------------------------------
--          Z O N E S       M O D U L E          --
---------------------------------------------------

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	m(BASTION, {
		n(ZONE_DROPS, {
			currency(MEDALLION_OF_SERVICE, {
				["customCollect"] = "SL_COV_KYR",
				["description"] = createLocalizationString({
					readable = "One of the best spots to farm those is in the northwest of Bastion around the World Boss. In the area there are 4 repeatable treasure chests, all of which contain 1 Medallion & can be looted without any daily CD. \n\nCan also drop from any Forsworn enemy.",
					constant = "ONE_OF_THE_BEST_SPOTS_TO_FARM_THOSE_IS_IN_THE",
					export = true,
					text = {
						en = "One of the best spots to farm those is in the northwest of Bastion around the World Boss. In the area there are 4 repeatable treasure chests, all of which contain 1 Medallion & can be looted without any daily CD. \n\nCan also drop from any Forsworn enemy.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "刷这些物品的最佳地点之一是晋升堡垒西北部世界首领周围。该区域有 4 个可重复拾取的宝箱，每个都包含 1 个勋章，且没有每日冷却限制。\n\n也可以从任何弃誓者敌人身上掉落。",
						-- TODO: tw = "",
					},
				}),
			}),
			i(184397, {	-- Lost Featherling (PET!)
				["customCollect"] = "SL_COV_KYR",
				["crs"] = {
					156559,	-- Ardent Warrior
					157212,	-- Assuming Scholar
					157054,	-- Fallacious Aspirant
					156560,	-- Misguided Postulant
				},
			}),
			i(180477),	-- Elysian Feathers
			i(178995),	-- Soul Mirror Shard
			i(179008),	-- Depleted Goliath Core
			i(179009),	-- Tampered Anima Charger
			i(180533),	-- Solenium Lockbox
			i(174021),	-- Age-Worn Shortblade
			i(176788),	-- Darkfeather Belt
			i(176792),	-- Darkfeather Bindings
			i(176780),	-- Darkfeather Breeches
			i(182557),	-- Darkfeather Cape
			i(176781),	-- Darkfeather Epaulets
			i(176770),	-- Darkfeather Grips
			i(176776),	-- Darkfeather Helm
			i(176769),	-- Darkfeather Treads
			i(176765),	-- Darkfeather Tunic
			i(176795),	-- Defender's Aspis
			i(176796),	-- Elysian Dory
			i(176794),	-- Gilded Glaive
			i(176790),	-- Glimmerhoof Armplates
			i(176763),	-- Glimmerhoof Breastplate
			i(176785),	-- Glimmerhoof Cincture
			i(182560),	-- Glimmerhoof Drape
			i(176766),	-- Glimmerhoof Footguards
			i(176771),	-- Glimmerhoof Gauntlets
			i(176761),	-- Glimmerhoof Helm
			i(176777),	-- Glimmerhoof Legguards
			i(176782),	-- Glimmerhoof Pauldrons
			i(176803),	-- Harmonious Mallet
			i(176793),	-- Honorguide Crossbow
			i(176798),	-- Larion Claw
			i(187427),	-- Lost Meditation Bell
			i(176802),	-- Meditator's Blade
			i(176800),	-- Modest Greatblade
			i(176987),	-- Ossein Scale Belt
			i(176799),	-- Reverent Dagger
			i(178915, {	-- Ripe Purian
				["description"] = createLocalizationString({
					readable = "Can be looted from objects scattered around the zone. Used to open Silver Strongboxes and the Steward's Golden Chest.",
					constant = "CAN_BE_LOOTED_FROM_OBJECTS_SCATTERED_AROUND_THE",
					export = true,
					text = {
						en = "Can be looted from objects scattered around the zone. Used to open Silver Strongboxes and the Steward's Golden Chest.",
						-- TODO: de = "",
						-- TODO: es = "",
						-- TODO: mx = "",
						-- TODO: fr = "",
						-- TODO: it = "",
						-- TODO: ko = "",
						-- TODO: pt = "",
						-- TODO: ru = "",
						cn = "可从散布在该区域的物体上拾取。用于打开白银保险箱和管事的金箱子。",
						-- TODO: tw = "",
					},
				}),
			}),
			i(176797),	-- Ritual Bell
			i(176791),	-- Steelscale Bracers
			i(176764),	-- Steelscale Chainmail
			i(176787),	-- Steelscale Cinch
			i(182558),	-- Steelscale Cloak
			i(176773),	-- Steelscale Gloves
			i(176775),	-- Steelscale Helm
			i(176779),	-- Steelscale Leggings
			i(176784),	-- Steelscale Shoulderguards
			i(176768),	-- Steelscale Striders
			i(176786),	-- Umbrawing Cord
			i(182556),	-- Umbrawing Drape
			i(176772),	-- Umbrawing Handwraps
			i(176774),	-- Umbrawing Hood
			i(176778),	-- Umbrawing Leggings
			i(176767),	-- Umbrawing Sandals
			i(176783),	-- Umbrawing Shoulderpads
			i(176762),	-- Umbrawing Vestment
			i(176789),	-- Umbrawing Wristwraps
			i(176801),	-- Unburdened Hammer
		}),
	}),
})));
