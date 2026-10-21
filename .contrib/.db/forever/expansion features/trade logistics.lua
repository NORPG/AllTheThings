-------------------------------------------------------------------
--      E X P A N S I O N   F E A T U R E S    M O D U L E       --
-------------------------------------------------------------------
root(ROOTS.ExpansionFeatures, {
	n(TRADE_LOGISTICS, {
		timeline = { TIMELINE.ADDED_1_60_1 },
		groups = {
			n(VENDORS, {
				n(256742, {	-- Dianne Softstep <Uncertified Scribe>
					coord = { 9.0, 76.6, MAP.REDRIDGE_MOUNTAINS },
					races = ALLIANCE_ONLY,
					groups = {
						i(262902, {	-- Forged Delivery Receipt
							cost = { { "c", 3402, 15 } },	-- x15 Merchant's Favor
							groups = {
								i(262917),	-- Notarized Shipping Container
							},
						}),
						i(262896, {	-- Forger's Quill
							minReputation = { 2586, HONORED },	-- Azeroth Commerce Authority, Honored.
							cost = { { "c", 3402, 15 } },	-- x15 Merchant's Favor
						}),
					},
				}),
				n(256672, {	-- Kurvelk Shadowhoof <Uncertified Scribe>
					coord = { 49.8, 30.0, MAP.THE_BARRENS },
					races = HORDE_ONLY,
					groups = {
						i(262902, {	-- Forged Delivery Receipt
							cost = { { "c", 3402, 15 } },	-- x15 Merchant's Favor
							groups = {
								i(262917),	-- Notarized Shipping Container
							},
						}),
						i(262896, {	-- Forger's Quill
							minReputation = { 2587, HONORED },	-- Durotar Supply and Logistics, Honored.
							cost = { { "c", 3402, 15 } },	-- x15 Merchant's Favor
						}),
					},
				}),
			}),
		},
	}),
});
