-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

--[[
------ Encounter Constants ------
local LUASHAL =

------ EncounterToCRS ------
local EncounterToCRS = {
};

------ EncounterToLoot ------
local EncounterToLoot = {
	[LUASHAL] = {
		i(250458),	-- Host Commander's Casque
		i(250447),	-- Radiant Eversong Scepter
	},
};

------ EncounterCoords ------
local EncounterCoords = {
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS, EncounterToLoot)
local Boss, BossWorldQuest =
InstanceHelper.Boss, InstanceHelper.BossWorldQuest
InstanceHelper.Coords = EncounterCoords
--]]

root(ROOTS.Instances, expansion(EXPANSION.MID, {
	n(WORLD_BOSSES, {
		["timeline"] = { ADDED_12_0_1_LAUNCH },
		["groups"] = {
			-- TEMP UNTIL RESTRUCTURED
			q(92560),	-- Lu'ashal WQ
			q(92127),	-- Lu'ashal WQ
		},
	}),
}))
