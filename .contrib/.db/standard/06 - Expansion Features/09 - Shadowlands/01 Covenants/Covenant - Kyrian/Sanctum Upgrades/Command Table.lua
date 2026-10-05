-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------

root(ROOTS.ExpansionFeatures, expansion(EXPANSION.SL, bubbleDown({ ["timeline"] = { ADDED_9_0_2_LAUNCH }, ["customCollect"] = "SL_COV_KYR" }, {
	n(KYRIAN, {
		n(SANCTUM_UPGRADES, {
			["icon"] = 3641395,
			["groups"] = {
				n(COMMAND_TABLE, {
					n(TIER_ONE, {
						["icon"] = 3675495,
						["groups"] = {
							n_TrainingFollowers({
								follower(1241),	-- Kyrian Halberdier
								follower(1291),	-- Kyrian Halberdier
								follower(1292),	-- Kyrian Halberdier
								follower(1319),	-- Kyrian Halberdier
								follower(1240),	-- Kyrian Phalanx
								follower(1289),	-- Kyrian Phalanx
								follower(1290),	-- Kyrian Phalanx
								follower(1320),	-- Kyrian Phalanx
							}),
							n(QUESTS, {
								q(57900, {	-- Across the Shadowlands
									["sourceQuests"] = { 57899 },	-- More Work?
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1259),	-- Pelagos
									},
								}),
								q(61863, {	-- Adventurer: Apolon
									["description"] = createLocalizationString({
										readable = "Requires Renown 27.",
										constant = "REQUIRES_RENOWN_27",
										export = true,
										text = {
											en = "Requires Renown 27.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 27。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1276),	-- Apolon
									},
								}),
								q(64463, {	-- Adventurer: Auric Spiritguide
									["description"] = createLocalizationString({
										readable = "Requires Renown 71.",
										constant = "REQUIRES_RENOWN_71",
										export = true,
										text = {
											en = "Requires Renown 71.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 71。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1343),	-- Auric Spiritguide
									},
								}),
								q(61864, {	-- Adventurer: Bron
									["description"] = createLocalizationString({
										readable = "Requires Renown 33.",
										constant = "REQUIRES_RENOWN_33",
										export = true,
										text = {
											en = "Requires Renown 33.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 33。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1275),	-- Bron
									},
								}),
								q(61862, {	-- Adventurer: Clora
									["description"] = "~L.REQUIRES_RENOWN_17",
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1273),	-- Clora
									},
								}),
								q(64462, {	-- Adventurer: Cromas the Mystic
									["description"] = createLocalizationString({
										readable = "Requires Renown 62.",
										constant = "REQUIRES_RENOWN_62",
										export = true,
										text = {
											en = "Requires Renown 62.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 62。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1342),	-- Cromas the Mystic
									},
								}),
								q(61865, {	-- Adventurer: Disciple Kosmas
									["description"] = createLocalizationString({
										readable = "Requires Renown 38.",
										constant = "REQUIRES_RENOWN_38",
										export = true,
										text = {
											en = "Requires Renown 38.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 38。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1274),	-- Disciple Kosmas
									},
								}),
								q(64461, {	-- Adventurer: Hermestes
									["description"] = createLocalizationString({
										readable = "Requires Renown 44.",
										constant = "REQUIRES_RENOWN_44",
										export = true,
										text = {
											en = "Requires Renown 44.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 44。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1341),	-- Hermestes
									},
								}),
								q(61859, {	-- Adventurer: Nemea
									["description"] = createLocalizationString({
										readable = "Requires Renown 4. Must choose Nemea in the Pride or Unit quest to get this follower.",
										constant = "REQUIRES_RENOWN_4_MUST_CHOOSE_NEMEA_IN_THE",
										export = true,
										text = {
											en = "Requires Renown 4. Must choose Nemea in the Pride or Unit quest to get this follower.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 4。必须在“骄傲还是团结”任务中选择涅墨亚才能获得该追随者。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = {
										58103,	-- Pride or Unit
										57900,	-- Across the Shadowlands
									},
									["altQuests"] = { 61860 },	-- Adventurer: Pelodis
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["DisablePartySync"] = true,
									["groups"] = {
										follower(1270),	-- Nemea
									},
								}),
								q(61860, {	-- Adventurer: Pelodis
									["description"] = createLocalizationString({
										readable = "Requires Renown 4. Must choose Pelodis in the Pride or Unit quest to get this follower.",
										constant = "REQUIRES_RENOWN_4_MUST_CHOOSE_PELODIS_IN_THE",
										export = true,
										text = {
											en = "Requires Renown 4. Must choose Pelodis in the Pride or Unit quest to get this follower.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 4。必须在“骄傲还是团结”任务中选择佩洛迪斯才能获得该追随者。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = {
										58103,	-- Pride or Unit
										57900,	-- Across the Shadowlands
									},
									["altQuests"] = { 61859 },	-- Adventurer: Nemea
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["DisablePartySync"] = true,
									["groups"] = {
										follower(1271),	-- Pelodis
									},
								}),
								q(61861, {	-- Adventurer: Sika
									["description"] = createLocalizationString({
										readable = "Requires Renown 12.",
										constant = "REQUIRES_RENOWN_12",
										export = true,
										text = {
											en = "Requires Renown 12.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 12。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57900 },	-- Across the Shadowlands
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["groups"] = {
										follower(1272),	-- Sika
									},
								}),
								q(57899, {	-- More Work?
									["provider"] = { "n", 167745 },	-- Haephus
									["coord"] = { 42.6, 53.1, ARCHONS_RISE },
								}),
								q(63068, {	-- Settling Disputes
									["description"] = createLocalizationString({
										readable = "Requires Renown 4.",
										constant = "REQUIRES_RENOWN_4",
										export = true,
										text = {
											en = "Requires Renown 4.",
											-- TODO: de = "",
											-- TODO: es = "",
											-- TODO: mx = "",
											-- TODO: fr = "",
											-- TODO: it = "",
											-- TODO: ko = "",
											-- TODO: pt = "",
											-- TODO: ru = "",
											cn = "需要名望 4。",
											-- TODO: tw = "",
										},
									}),
									["sourceQuests"] = { 57899 },	-- More Work?
									["altQuests"] = { 59674 },	-- A Friendly Rivalry
									["provider"] = { "n", 160389 },	-- Koros
									["coord"] = { 43.8, 40.7, ARCHONS_RISE },
									["isBreadcrumb"] = true,
									-- TODO: is altQuests necessary or do they complete each other?
									-- quest is unavailable until you build your command table
								}),
							}),
							n(REWARDS, {
								currency(1828, {["customCollect"] = IGNORED_VALUE}),	-- Soul Ash
								currency(MEDALLION_OF_SERVICE),
							}),
						},
					}),
				}),
			},
		}),
	}),
})));
