-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

root(ROOTS.Instances, expansion(EXPANSION.SL, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH } }, {
	inst(1182, {	-- The Necrotic Wake
		["coord"] = { 40.0, 55.3, BASTION },
		["maps"] = {
			1666,	-- The Necrotic Wake
			1667,	-- Stitchwerks
			1668,	-- Zolramus
		},
		["groups"] = {
			n(ACHIEVEMENTS, {
				header(HEADERS.Achievement, 14339, {	-- Shard Labor
					["description"] = createLocalizationString({
						readable = "Quest tracking must be enabled to see the location of each shard in the list.\n\nShards are collected account-wide. There are shards to collect in Bastion, Necrotic Wake, and Spires of Ascension.\n\nGoblin Gliders are required for some of the shards in Bastion. Being part of the |cFFfe040fVenthyr Covenant|r is not required, but the |cFFfe040fDoor of Shadows|r ability does trivialize a few of the more annoying shards!",
						constant = "QUEST_TRACKING_MUST_BE_ENABLED_TO_SEE_THE_2",
						export = true,
						text = {
							en = "Quest tracking must be enabled to see the location of each shard in the list.\n\nShards are collected account-wide. There are shards to collect in Bastion, Necrotic Wake, and Spires of Ascension.\n\nGoblin Gliders are required for some of the shards in Bastion. Being part of the |cFFfe040fVenthyr Covenant|r is not required, but the |cFFfe040fDoor of Shadows|r ability does trivialize a few of the more annoying shards!",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "必须开启任务追踪才能看到列表中每块碎片的位置。\n\n碎片为账号通用收集。在晋升堡垒、凋魂之殇和晋升之巅都有碎片可收集。\n\n晋升堡垒的一些碎片需要地精滑翔器。不必加入|cFFfe040f温西尔盟约|r，但|cFFfe040f暗影之门|r技能确实能让几块比较麻烦的碎片变得微不足道！",
							-- TODO: tw = "",
						},
					}),
					["groups"] = sharedData({ ["name"] = "Anima Crystal Shard", ["icon"] = 3528288 }, {
						q(61296, {	-- Anima Crystal Shard
							["description"] = createLocalizationString({
								readable = "After Blightbone, go up the stairs to the middle platform. Straight ahead is a large fallen bell. The shard is behind it on the right-hand side.",
								constant = "AFTER_BLIGHTBONE_GO_UP_THE_STAIRS_TO_THE_MIDDLE",
								export = true,
								text = {
									en = "After Blightbone, go up the stairs to the middle platform. Straight ahead is a large fallen bell. The shard is behind it on the right-hand side.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "击败凋骨后，沿楼梯上到中间的平台。正前方有一口巨大的倒下的钟。碎片就在它后面靠右侧。",
									-- TODO: tw = "",
								},
							}),
						}),
						q(61297, {	-- Anima Crystal Shard
							["description"] = createLocalizationString({
								readable = "Before Amarth, at the middle of the top of the final platform is a little outcropping that juts north. Climb behind the large broken pillar. Behind it is a small broken pillar, and the shard is behind that.",
								constant = "BEFORE_AMARTH_AT_THE_MIDDLE_OF_THE_TOP_OF_THE",
								export = true,
								text = {
									en = "Before Amarth, at the middle of the top of the final platform is a little outcropping that juts north. Climb behind the large broken pillar. Behind it is a small broken pillar, and the shard is behind that.",
									-- TODO: de = "",
									-- TODO: es = "",
									-- TODO: mx = "",
									-- TODO: fr = "",
									-- TODO: it = "",
									-- TODO: ko = "",
									-- TODO: pt = "",
									-- TODO: ru = "",
									cn = "在阿玛斯之前，最终平台顶部的中央有一块向北突出的小岩石。爬到巨大断裂石柱的后面。它后面还有一根小的断裂石柱，碎片就在那后面。",
									-- TODO: tw = "",
								},
							}),
						}),
					}),
				}),
			}),
			n(QUESTS, {
				q(60057, {	-- Necrotic Wake: A Paragon's Plight
					["sourceQuests"] = { 60055 },	-- A Time For Courage
					["provider"] = { "n", 167584 },	-- Disciple Artemede
					["coord"] = { 40.9, 55.3, BASTION },
					["groups"] = {
						i(184714),	-- Refulgent Chestguard
						i(184713),	-- Refulgent Cuirass
						i(184712),	-- Refulgent Raiment
						i(184715),	-- Refulgent Tunic
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS, {
				e(2395, {	-- Blightbone
					["crs"] = { 162691 },	-- Blightbone
					["groups"] = {
						-- Conduits
						i(183505),	-- Maim, Mangle
						i(181641),	-- Rising Sun Revival
						i(183482),	-- Sudden Ambush
						i(181709),	-- Unnerving Focus
						-- Items
						i(178732, {	-- Abominable Visage
							["filterID"] = CLOTH,
						}),
						i(178735),	-- Blight Belcher
						i(178733),	-- Blightbone Spaulders
						i(178730),	-- Engorged Worm Smasher
						i(178734),	-- Fused Bone Greatbelt
						i(178736),	-- Stitchflesh's Misplaced Signet
						i(178731),	-- Viscera-Stitched Footpads

					},
				}),
				e(2391, {	-- Amarth, The Harvester
					["crs"] = { 163157 },	-- Amarth, The Harvester
					["groups"] = {
						-- Legendaries
						i(183387),	-- Memory of the Deathmaker
						-- Conduits
						i(183402),	-- Bloodletting
						i(181712),	-- Depths of Insanity
						i(181982),	-- Everfrost
						i(183481),	-- Incessant Hunter
						i(182772),	-- Infernal Brand
						-- Items
						i(178737),	-- Amarth's Spellblade
						i(178742),	-- Bottled Chimera Toxin
						i(178739),	-- Legplates of Unholy Frenzy
						i(178738),	-- Rattling Deadeye Hood
						i(178740),	-- Reanimator's Mantle
						i(178741),	-- Risen Monstrosity Cuffs
					},
				}),
				e(2392, {	-- Surgeon Stitchflesh
					["crs"] = {
						162689,	-- Surgeon Stitchflesh
						164578,	-- Stitchflesh's Creation
					},
					["groups"] = {
						-- Legendaries
						i(183373),	-- Memory of an Implosive Potential
						-- Conduits
						i(181738),	-- Artifice of the Archmage
						i(182750),	-- Carnivorous Stalkers
						i(182385),	-- Growing Inferno
						i(183512),	-- Planned Execution
						i(181700),	-- Scalding Brew
						-- Items
						i(178750),	-- Encrusted Canopic Lid
						i(178744),	-- Freshly Embalmed Jerkin
						i(178748),	-- Gory Surgeon's Gloves
						i(178772),	-- Satchel of Misbegotten Minions
						i(178751),	-- Spare Meat Hook
						i(178743),	-- Stitchflesh's Scalpel
						i(178745),	-- Striders of Restless Malice
						i(178749),	-- Vile Butcher's Pauldrons
					},
				}),
				e(2396, {	-- Nalthor the Rimebinder
					["crs"] = { 162693 },	-- Nalthor the Rimebinder
					["groups"] = {
						ach(14366),	-- The Necrotic Wake
						-- Legendaries
						i(182633),	-- Memory of the Biting Cold
						i(183278),	-- Memory of the Cold Front
						-- Conduits
						i(182136),	-- Chilled to the Core
						i(182622),	-- Resplendent Light
						i(181843),	-- Shining Radiance
						i(182201),	-- Unleashed Frenzy
						i(181383),	-- Unrelenting Cold
						-- Items
						i(178777),	-- Dark Frost Helmet
						i(178778),	-- Lichbone Legguards
						i(178782),	-- Necropolis Lord's Shackles
						i(178780),	-- Rimebinder's Runeblade
						i(178781),	-- Ritual Commander's Ring
						i(178783),	-- Siphoning Phylactery Shard
						i(178779),	-- Undying Chill Shoulderpads
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS, {
				e(2396, {	-- Nalthor the Rimebinder
					["crs"] = { 162693 },	-- Nalthor the Rimebinder
					["groups"] = {
						ach(14367),	-- Heroic: The Necrotic Wake
					},
				}),
			}),
			d(DIFFICULTY.DUNGEON.MYTHIC, {
				e(2391, {	-- Amarth, The Harvester
					["crs"] = { 166855 },	-- Amarth, The Harvester
					["groups"] = {
						ach(14295),	-- Bountiful Harvest
					},
				}),
				e(2392, {	-- Surgeon Stitchflesh
					["crs"] = {
						162689,	-- Surgeon Stitchflesh
						164578,	-- Stitchflesh's Creation
					},
					["groups"] = {
						ach(14320),	-- Surgeon's Supplies
					},
				}),
				e(2396, {	-- Nalthor the Rimebinder
					["crs"] = { 162693 },	-- Nalthor the Rimebinder
					["groups"] = {
						ach(14368),	-- Mythic: The Necrotic Wake
						ach(14381),	-- Mythic: The Necrotic Wake Guild Run
						ach(14285),	-- Ready for Raiding VII
						i(181819),	-- Marrowfang (MOUNT!)
					},
				}),
			}),
		},
	}),
})));
