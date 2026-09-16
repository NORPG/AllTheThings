-- Provides an all-in-one builder object to help with consistently building Instance content

---@class InstanceHelperExtraLoot
---@field Add fun(encounter: table, bossID: integer, difficultyID: integer|nil, data: table) Adds extra loot data to an encounter for the active difficulty.
---@field Data table<integer, table[]> BossID-keyed extra loot data consumed by `Add`.

---@class InstanceHelperLFRQueueNPC
---@field cr? integer
---@field crs? integer[]
---@field coord? table
---@field coords? table[]

---@class InstanceHelperDifficultyGroup
---@field groups? table[]
---@field AddGroups fun(groups: table[]): InstanceHelperDifficultyGroup Appends groups to this difficulty group.
---@field AddGroupsWithUpgrades fun(groups: table[]): InstanceHelperDifficultyGroup Appends groups and applies the configured upgrade mapping.
---@field WithUpgrades fun(): InstanceHelperDifficultyGroup Applies the configured upgrade mapping to the existing groups.

---@class InstanceHelper
---@field BossOnly fun(id: integer, t?: table): table Creates an Encounter populated with the configured creature IDs only.
---@field Boss fun(id: integer, t?: table): table Creates an Encounter populated with creature IDs, configured loot, and optional helper metadata.
---@field BossWithHeader fun(id: integer, headerFunc: fun(groups: table[]): table, t?: table): table Creates an Encounter whose configured loot is wrapped by `headerFunc`.
---@field BossWorldQuest fun(id: integer, questID: integer, t?: table): table Creates a World Quest associated with an Encounter.
---@field Difficulty fun(difficultyID: integer, t?: table): InstanceHelperDifficultyGroup Creates a difficulty group and makes it the active difficulty for upgrade/extra-loot handling.
---@field CommonBossDrops fun(t?: table[]): table Creates a Common Boss Drops header shared by all configured bosses.
---@field ZoneDrops fun(groups?: table[]): table Creates a Zone Drops header from the configured zone drops, optionally appending more groups.
---@field RawAllBosses fun(groups?: table[]): table[]|nil Assigns all configured boss creature IDs to every group in the array.
---@field WithUpgrades fun(groups?: table[]) Applies the configured upgrade mapping recursively to item groups.
---@field ALL_BOSSES integer[] Flattened creature-ID list from all configured bosses.
---@field ExtraLoots? InstanceHelperExtraLoot[] Optional extra-loot processors executed by `Boss`.
---@field Coords? table<integer, table> Optional BossID-keyed coordinates applied when an Encounter/Quest has no coordinate.
---@field BossObjects? table<integer, integer[]> Optional BossID-keyed object IDs added as Encounter providers.
---@field UpgradeMapping? table<integer, integer> DifficultyID-keyed upgrade values (`ModID.BonusID`). A value of `0` disables applying upgrades for that difficulty.
---@field LFRQueueNPC? InstanceHelperLFRQueueNPC Optional queue NPC data copied onto LFR difficulty groups.

--- Creates an InstanceHelper from BossID-keyed encounter metadata.
---
--- `crs` maps Encounter/Boss IDs to creature IDs.
--- `loots` maps Encounter/Boss IDs to the groups appended by `Boss`/`BossWithHeader`.
--- `zonedrops` supplies the base data used by `ZoneDrops`.
---
--- Optional behavior can be configured on the returned helper through fields such as
--- `ExtraLoots`, `Coords`, `BossObjects`, `UpgradeMapping`, and `LFRQueueNPC`.
---@param crs table<integer, integer[]> BossID-keyed creature-ID arrays.
---@param loots? table<integer, table[]> BossID-keyed loot groups. May be omitted when only helpers that do not consume loot are used.
---@param zonedrops? table Base Zone Drops data. May be omitted when `ZoneDrops` is unused.
---@return InstanceHelper helper
CreateInstanceHelper = function(crs, loots, zonedrops)
	---@type InstanceHelper
	local helper = {}
	---@type integer|nil
	local CurrentDifficultyID
	---@type integer[]
	local ALL_BOSSES = {}
	for _,v in pairs(crs) do
		appendAllGroups(ALL_BOSSES, v)
	end

	--- Creates an Encounter and assigns its configured creature IDs.
	---@param id integer Encounter/Boss ID.
	---@param t? table Additional Encounter data passed to `e`.
	---@return table encounter
	local function BossOnly(id, t)
		if not t and type(id) ~= "number" then
			error("Missing id for boss. Got instead: ",id)
		end
		local encounter = (helper.TreatBossesAsNpcOnly and n or e)(id, t)
		encounter.crs = crs[id]
		return encounter
	end

	--- Creates a complete Encounter using the helper configuration.
	---
	--- In addition to the creature IDs from `BossOnly`, this applies optional
	--- `ExtraLoots`, coordinates, object providers, and the configured loot groups.
	---@param id integer Encounter/Boss ID.
	---@param t? table Additional Encounter data passed to `e`.
	---@return table encounter
	local function Boss(id, t)
		local encounter = BossOnly(id, t)
		if helper.ExtraLoots then
			local add, data
			for _,extraLootData in ipairs(helper.ExtraLoots) do
				add, data = extraLootData.Add, extraLootData.Data
				if (not add or type(add) ~= "function") or (not data or type(data) ~= "table") then
					print("'extraLoots' expects an array of tables with { Add = func(encounter, bossID, difficultyID, [data]), Data = { [bossID] = {i(###),i(###)}, ... } }")
				end
				add(encounter, id, CurrentDifficultyID, data)
			end
		end
		if helper.Coords and not encounter.coord then
			encounter.coord = helper.Coords[id]
		end
		if helper.BossObjects then
			local bossObjects = helper.BossObjects[id]
			if bossObjects then
				local bossProviders = encounter.providers
				if not bossProviders then
					bossProviders = {}
					encounter.providers = bossProviders
				end
				for i=1,#bossObjects do
					bossProviders[#bossProviders + 1] = { "o", bossObjects[i] }
				end
			end
		end
		encounter.groups = appendAllGroups(encounter.groups, clone(loots[id]))
		return encounter
	end

	--- Creates a World Quest which requires defeating the specified Encounter.
	---
	--- Creature IDs and optional coordinates are inherited from this helper. If no
	--- symbolic link is supplied, a default `encounterID` selection is generated.
	---@param id integer Encounter/Boss ID.
	---@param questID integer World Quest ID.
	---@param t? table Additional quest data passed to `q`.
	---@return table quest
	local function BossWorldQuest(id, questID, t)
		if not t and (type(id) ~= "number" or type(questID) ~= "number") then
			error("Missing id/questID for BossWorldQuest",id,questID)
		end
		local quest = q(questID, t)
		quest.crs = crs[id]
		quest.isWorldQuest = true
		if not quest.sym then
			quest.sym = {{"select","encounterID",id,},{"pop"}}	-- Original WB
		end
		if helper.Coords and not quest.coord then
			quest.coord = helper.Coords[id]
		end
		return quest
	end

	--- Applies the upgrade value for the active difficulty to item groups recursively.
	---
	--- Nested groups are traversed only for supported container/object types. Existing
	--- `up` values are preserved. An upgrade mapping value of `0` skips application.
	---@param groups? table[] Groups to process.
	local function WithUpgrades(groups)
		if not groups then return end
		if not helper.UpgradeMapping then error("To use 'WithUpgrades', define InstanceHelper.UpgradeMapping = { [DifficultyID] = ModID.BonusID }") end
		local up = helper.UpgradeMapping[CurrentDifficultyID]
		if not up then print("Missing 'UpgradeMapping' for Difficulty ",CurrentDifficultyID) end
		-- allow a 0 upgrade to basically skip applying upgrades on that difficulty... some situations where this is desirable
		if up == 0 then return end
		for _,o in ipairs(groups) do
			-- add upgrades within certain nested groups
			if o.groups and (o.npcID or o.headerID or o.itemID or o.encounterID) then
				WithUpgrades(o.groups)
			elseif o.itemID and not o.up then
				o.up = up
			end
		end
	end

	--- Creates an Encounter and wraps its configured loot with a caller-provided header.
	---@param id integer Encounter/Boss ID.
	---@param headerFunc fun(groups: table[]): table Function which receives a cloned loot array and returns a header/group object.
	---@param t? table Additional Encounter data passed to `e`.
	---@return table encounter
	local function BossWithHeader(id, headerFunc, t)
		if not t and (type(headerFunc) ~= "function" or type(id) ~= "number") then
			error("Missing valid id/headerFunc for BossWithHeader",id,headerFunc)
		end
		local encounter = BossOnly(id, t)
		encounter.groups = appendAllGroups(encounter.groups, {headerFunc(clone(loots[id]))})
		return encounter
	end

	--- Creates a Common Boss Drops header associated with every boss creature configured in this helper.
	---@param t? table[] Groups placed under the Common Boss Drops header.
	---@return table commonBossDrops
	local function CommonBossDrops(t)
		return n(COMMON_BOSS_DROPS, {
					["crs"] = ALL_BOSSES,
					["groups"] = t,
				})
	end

	--- Assigns all configured boss creature IDs directly to each supplied group.
	---@param groups? table[] Array of group objects.
	---@return table[]|nil groups The same array after mutation, or the original invalid value.
	local function RawAllBosses(groups)
		if not groups or not isarray(groups) then
			print("Expecting array type for AddGroups for InstanceHelper")
			return groups
		end
		for _,o in ipairs(groups) do
			o.crs = ALL_BOSSES
		end
		return groups
	end

	--- Creates a Zone Drops header from the configured zone-drop data.
	---@param groups? table[] Additional groups appended to a clone of the configured zone drops.
	---@return table zoneDrops
	local function ZoneDrops(groups)
		if groups then
			return n(ZONE_DROPS, { groups = appendGroups(clone(zonedrops), groups)})
		end
		return n(ZONE_DROPS, clone(zonedrops))
	end

	local helperMeta = {
		---@param t InstanceHelperDifficultyGroup
		---@param key string
		---@return function|nil
		__index = function(t, key)
			if key == "AddGroups" then
				---@param groups table[]
				---@return InstanceHelperDifficultyGroup
				return function(groups)
					if not groups or not isarray(groups) or groups.g then
						print("Expecting array type for AddGroups for InstanceHelper")
						return t
					end
					t.groups = appendAllGroups(t.groups, groups)
					return t
				end
			elseif key == "AddGroupsWithUpgrades" then
				---@param groups table[]
				---@return InstanceHelperDifficultyGroup
				return function(groups)
					if not groups or not isarray(groups) or groups.g then
						print("Expecting array type for AddGroups for InstanceHelper")
						return t
					end
					t.groups = appendAllGroups(t.groups, groups)
					WithUpgrades(t.groups)
					return t
				end
			elseif key == "WithUpgrades" then
				---@return InstanceHelperDifficultyGroup
				return function()
					WithUpgrades(t.groups)
					return t
				end
			end
		end
	}

	--- Creates a difficulty group and records its exact requested difficulty ID.
	---
	--- The explicit input ID is retained because `d()` may alter the difficulty stored
	--- on the returned object. For LFR-related difficulties, configured queue-NPC
	--- creature/coordinate data is copied to the difficulty group.
	---@param difficultyID integer Difficulty ID passed to `d` and used by upgrade/extra-loot processing.
	---@param t? table Additional difficulty data passed to `d`.
	---@return InstanceHelperDifficultyGroup diff
	local function Difficulty(difficultyID, t)
		local diff = d(difficultyID, t)
		diff = togroups(diff)
		-- d() can sometimes change the applied difficultyID, so just track the exact one passed in since
		-- it's likely the same one re-used in the file
		CurrentDifficultyID = difficultyID
		if helper.LFRQueueNPC and (difficultyID == DIFFICULTY.RAID.LFR or difficultyID == DIFFICULTY.RAID.MULTI.ALL or difficultyID == DIFFICULTY.RAID.MULTI.ALL_WITHOUT_MYTHIC) then
			-- assign the crs/coords to the difficulty group
			diff.cr = clone(helper.LFRQueueNPC.cr)
			diff.crs = clone(helper.LFRQueueNPC.crs)
			diff.coord = clone(helper.LFRQueueNPC.coord)
			diff.coords = clone(helper.LFRQueueNPC.coords)
		end
		return setmetatable(diff, helperMeta)
	end

	helper.BossOnly = BossOnly
	helper.Boss = Boss
	helper.BossWithHeader = BossWithHeader
	helper.BossWorldQuest = BossWorldQuest
	helper.Difficulty = Difficulty
	helper.CommonBossDrops = CommonBossDrops
	helper.ZoneDrops = ZoneDrops
	helper.RawAllBosses = RawAllBosses
	helper.WithUpgrades = WithUpgrades
	return helper
end

--- Returns the symbolic processing instructions for Dragonflight Season 4 tier-token item groups.
---
--- When `modID` is supplied, the first instruction forces that mod ID; otherwise the
--- caller's current mod ID is used. The remaining instructions select the known
--- Season 4 tier-token items, fill their groups, then pop the symbolic context.
---@param modID? integer Optional mod ID to force via `usemodID`.
---@return table[] sym Symbolic-processing instruction array.
GET_SYM_DF_S4_TIER_TOKENS = function(modID)
	return {
		modID and {"usemodID",modID} or {"usemyModID"},
		{"select","modItemID",
			217324,	-- Dreadful Decelerating Chronograph
			217325,	-- Mystic Decelerating Chronograph
			217326,	-- Venerated Decelerating Chronograph
			217327,	-- Zenith Decelerating Chronograph
			217332,	-- Dreadful Synchronous Timestrand
			217333,	-- Mystic Synchronous Timestrand
			217334,	-- Venerated Synchronous Timestrand
			217335,	-- Zenith Synchronous Timestrand
			217316,	-- Dreadful Fleeting Hourglass
			217317,	-- Mystic Fleeting Hourglass
			217318,	-- Venerated Fleeting Hourglass
			217319,	-- Zenith Fleeting Hourglass
			217320,	-- Dreadful Quickened Bronzestone
			217321,	-- Mystic Quickened Bronzestone
			217322,	-- Venerated Quickened Bronzestone
			217323,	-- Zenith Quickened Bronzestone
			217328,	-- Dreadful Ephemeral Hypersphere
			217329,	-- Mystic Ephemeral Hypersphere
			217330,	-- Venerated Ephemeral Hypersphere
			217331,	-- Zenith Ephemeral Hypersphere
		},
		{"groupfill",true},
		{"pop"}}
end
