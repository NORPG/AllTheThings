---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

root(ROOTS.Zones, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.THE_COILED_ISLE, {
		m(MAP.MIDNIGHT.VAULTS_OF_ATALUTEK, {
			n(QUESTS, {
				header(HEADERS.NPC, 269485, {	-- Altar of Corrosion
					q(97640, {	-- Vaults of Atal'Utek: One Coin Too Many
						["qgs"] = {
							272024,	-- Sack of Coins
							262798,	-- Warleader Abdumati
						},
						["coords"] = {
							{ 42.3, 14.5, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Sack of Coins
							{ 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Warleader Abdumati @ Amani Foothold
							-- { 53.9, 39.5, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Mok'sa the Stone @ Eastern Amani Outpost
						},
					}),
					q(98428, {	-- Vaults of Atal'Utek: The Altar of Corrosion
						["sourceQuest"] = 97640,	-- Vaults of Atal'Utek: One Coin Too Many
						["qg"] = 262880,	-- Er'inye
						["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
					}),
					q(96643, {	-- From When it Came
						["sourceQuest"] = 98388,	-- Into the Vaults of Atal'Utek
						["qg"] = 262880,	-- Er'inye
						["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
						["isDaily"] = true,
					}),
					q(96644, {	-- Essence of Malice
						["sourceQuest"] = 98388,	-- Into the Vaults of Atal'Utek
						["qg"] = 262880,	-- Er'inye
						["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
						["isDaily"] = true,
						["groups"] = { i(278470) },	-- Malefic Venom (QI!)
					}),
					q(96640, {	-- Bounty of the Cursed
						["qg"] = 262880,	-- Er'inye
						["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
						["isDaily"] = true,
						["groups"] = { i(275060) },	-- Forgotten Relic (QI!)
					}),
				}),
				q(98388, {	-- Into the Vaults of Atal'Utek
					["qgs"] = {
						262798,	-- Warleader Abdumati
						271885,	-- Mok'sa the Stone
					},
					["coords"] = {
						{ 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Warleader Abdumati @ Amani Foothold
						{ 53.9, 39.5, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Mok'sa the Stone @ Eastern Amani Outpost
					},
					["groups"] = {
						o(675629, {	-- Broken Urn
							i(278472),	-- Noxious Corrosive Coin
						}),
					},
				}),
				q(98515, {	-- Vaults of Atal'Utek: A Toxic Tour
					["sourceQuest"] = 98388,	-- Into the Vaults of Atal'Utek
					["qg"] = 262798,	-- Warleader Abdumati
					["coord"] = { 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
				}),
				-- Altar Unlocks
				q(97662, {	-- The Winds of Tok'jara
					["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
					["provider"] = { "i", 278523 },	-- Feather of Tok'jara
				}),
				q(97669, {	-- The Luck of the Bound Spirit
					["coord"] = { 51.2, 62.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
					["provider"] = { "i", 278536 },	-- Mummified Lynx's Paw
				}),
				-- Zone Repeatables
				q(95520, {	-- Purging the Vaults
					["qgs"] = {
						262798,	-- Warleader Abdumati
						267635,	-- Talon Commander Zela
					},
					["coords"] = {
						{ 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Warleader Abdumati
						{ 58.7, 45.8, MAP.MIDNIGHT.THE_COILED_ISLE },		-- Talon Commander Zela
					},
					["isDaily"] = true,
				}),
				q(98419, {	-- Shoulder to Shoulder
					["sourceQuest"] = 98388,	-- Into the Vaults of Atal'Utek
					["qg"] = 262798,	-- Warleader Abdumati
					["coord"] = { 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
					["isDaily"] = true,
				}),
				q(96639, {	-- Patrolling the Temple
					["qg"] = 272109,	-- Hawkeye Socho (mobileNPC)
					["coord"] = { 47.2, 65.1, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Moves to the troops left and right of this point
					["isDaily"] = true,
				}),
				q(96642, {	-- Decisive Incursions
					["qg"] = 272109,	-- Hawkeye Socho (mobileNPC)
					["coord"] = { 47.2, 65.1, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },	-- Moves to the troops left and right of this point
					["isDaily"] = true,
				}),
				q(98420, {	-- What's Out There?
					["sourceQuest"] = 98388,	-- Into the Vaults of Atal'Utek
					["qg"] = 262798,	-- Warleader Abdumati
					["coord"] = { 47.2, 60.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
					["isDaily"] = true,
				}),
				header(HEADERS.Achievement, 63598, sharedData({	-- Roll the Patrol
					["repeatable"] = true,
				},{
					-- ["description"] = "These appear to be able to spawn any Patrol in any of the listed coords.",
					-- ["coords"] = {

					-- },
					["groups"] = {
						q(95972, {	-- Ash to Ash
							["coord"] = { 43.9, 30.1, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							["qg"] = 263346,	-- Er'inye
						}),
						q(95952, {	-- Breath and Bile
							["coord"] = { 44.4, 53.1, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							["qg"] = 263472,	-- Er'inye
							["groups"] = {
								i(271864),	-- Rotten Pneuma
								i(271863),	-- Ophidian Bile
							},
						}),
						q(95573, {	-- Broken Bonds
							["coord"] = { 49.4, 56.9, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							-- ["qg"] = ??,
						}),
						q(95985, {	-- Calming the Dead
							["coord"] = { 44.1, 30.1, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							-- ["qg"] = ??,
						}),
						q(95987, {	-- Laid to Rest
							["coords"] = {
								{ 50.1, 38.8, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
								{ 52.6, 45.5, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							},
							["qg"] = 263339,	-- Tortured Spirit
						}),
						q(95598, {	-- Slay Children of Ula'tek
							["coord"] = { 42.8, 41.2, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							["qg"] = 261973,	-- Fading Spirit
						}),
						q(95962, {	-- Vengeance for the Dead
							["coord"] = { 52.1, 32.6, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
							["qg"] = 263336,	-- Vengeful Spirit
						}),
						-- TODO: add more
					},
				})),
				n(REWARDS, {
					i(273000),	-- Corrosive Soul
					i(274374),	-- Trovehunter's Bounty
					i(279382),	-- Venom-Cursed Fragment
				}),
			}),
		}),
	}),
}));

root(ROOTS.HiddenQuestTriggers, m(MAP.MIDNIGHT.QUELTHALAS, {
	m(MAP.MIDNIGHT.THE_COILED_ISLE, {
		m(MAP.MIDNIGHT.VAULTS_OF_ATALUTEK, {
			header(HEADERS.Achievement, 63598, sharedData({
				["repeatable"] = true
			},{
				q(96041),	-- completion of 95972 -- Ash to Ash
				q(96037),	-- completion of 95952 -- Breath and Bile
				q(96032),	-- completion of 95573 -- Broken Bonds
				q(96042),	-- completion of 95985 -- Calming the Dead
				q(96043),	-- completion of 95987 -- Laid to Rest
				q(96034),	-- completion of 95598 -- Slay Children of Ula'tek
				q(96040),	-- completion of 95962 -- Vengeance for the Dead
			})),
		}),
	}),
}))
