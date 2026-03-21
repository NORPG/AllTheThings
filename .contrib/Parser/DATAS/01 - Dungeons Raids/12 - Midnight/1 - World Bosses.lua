-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local CRAGSPINE = 2782
local LUASHAL = 2827
local PREDAXUS = 2828
local THORMBELAN = 2829

------ EncounterToCRS ------
local EncounterToCRS = {
	-- [CRAGSPINE] = {
	-- 	-- Add CRS IDs here
	-- },
	[LUASHAL] = {
		244762,
	},
	-- [PREDAXUS] = {
	-- 	-- Add CRS IDs here
	-- },
	-- [THORMBELAN] = {
	-- 	-- Add CRS IDs here
	-- },
}

------ EncounterToLoot ------
local EncounterToLoot = {
	[CRAGSPINE] = {
		i(250450),	-- Forest Sentinel's Savage Longbow
		i(250446),	-- Cragtender Bulwark
		i(250461),	-- Chain of the Ancient Watcher
	},
	[LUASHAL] = {
		i(250451),	-- Dawncrazed Beast Cleaver
		i(250453),	-- Scepter of the Unbound Light
		i(250447),	-- Radiant Eversong Scepter
	},
	[PREDAXUS] = {
		i(250454),	-- Devouring Vanguard's Soulcleaver
		i(250448),	-- Voidbender's Spire
		i(250460),	-- Encroaching Shadow Signet
	},
	[THORMBELAN] = {
		i(250455),	-- Beastly Blossombarb
		i(250452),	-- Blooming Thornblade
		i(250449),	-- Skulking Nettledirk
	},
}

------ EncounterCoords ------
local EncounterCoords = {
	[CRAGSPINE] = {	-- Add coordinates and map here
	},
	[LUASHAL] = {	-- Add coordinates and map here
	},
	[PREDAXUS] = {	-- Add coordinates and map here
	},
	[THORMBELAN] = {	-- Add coordinates and map here
	},
}

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS, EncounterToLoot)
local Boss, BossWorldQuest =
InstanceHelper.Boss, InstanceHelper.BossWorldQuest
InstanceHelper.Coords = EncounterCoords

root(ROOTS.Instances, expansion(EXPANSION.MID, {
	n(WORLD_BOSSES, {
		["timeline"] = { ADDED_12_0_1_LAUNCH },
		["groups"] = bubbleDownFiltered({
			["isRaid"] = true,
			["isWeekly"] = true,
		},FILTERFUNC_questIDORencounterID,{
			n(COMMON_BOSS_DROPS, {
				["crs"] = appendAllGroups(
					nil,
					EncounterToCRS[CRAGSPINE],
					EncounterToCRS[LUASHAL],
					EncounterToCRS[PREDAXUS],
					EncounterToCRS[THORMBELAN]
				),
				["groups"] = {
					i(250459),	-- Bramblestalker's Feathered Cowl
					i(250458),	-- Host Commander's Casque
					i(250456),	-- Wretched Scholar's Gilded Robe
					i(250457),	-- Devouring Outrider's Chausses
					i(250462),	-- Forgotten Farstrider's Insignia
				},
			}),
			Boss(CRAGSPINE, {	-- Cragspine
				-- ["questID"] = xx,
			}),
			-- BossWorldQuest(CRAGSPINE, 0),	-- Cragspine WQ
			Boss(LUASHAL, {	-- Lu'ashal
				["questID"] = 92127,	-- maybe this is something else since it's account-wide...
			}),
			BossWorldQuest(LUASHAL, 92560),	-- Lu'ashal WQ
			Boss(PREDAXUS, {	-- Predaxus
				-- ["questID"] = xx,
			}),
			-- BossWorldQuest(PREDAXUS, 0),	-- Predaxus WQ
			Boss(THORMBELAN, {	-- Thormbelan
				-- ["questID"] = xx,
			}),
			-- BossWorldQuest(THORMBELAN, 0),	-- Thormbelan WQ
		}),
	}),
}))
