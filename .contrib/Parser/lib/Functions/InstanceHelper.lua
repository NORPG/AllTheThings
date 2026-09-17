-- Provides an all-in-one builder object to help with consistently building Instance content

-- ============================================================================
-- LuaLS / DocGen type model
-- ============================================================================
-- Documentation-only parser types used by InstanceHelper. These names are
-- intentionally InstanceHelper-prefixed so this file can be used independently
-- without colliding with broader parser type definitions.

---@alias JournalEncounterID integer
---@alias DifficultyID integer
---@alias QuestID integer
---@alias NPCID integer
---@alias ItemID integer
---@alias ObjectID integer
---@alias UpgradeValue integer
---@alias Coord { [1]: number, [2]: number, [3]?: integer }
---@alias Provider { [1]: string, [2]: integer }
---@alias SymCommand table<integer, any>
---@alias Sym SymCommand[]
---@alias ATTObjectArray ATTObject[]
---@alias InstanceHelperCRMap table<JournalEncounterID, NPCID[]>
---@alias InstanceHelperLootMap table<JournalEncounterID, ATTObjectArray>
---@alias InstanceHelperCoordMap table<JournalEncounterID, Coord>
---@alias InstanceHelperBossObjectMap table<JournalEncounterID, ObjectID[]>
---@alias InstanceHelperUpgradeMap table<DifficultyID, UpgradeValue>

---@class ATTObject
---@field groups? ATTObjectArray Nested parser groups.
---@field g? ATTObjectArray Legacy/alternate groups field rejected by AddGroups.
---@field cr? NPCID Single creature/NPC ID.
---@field crs? NPCID[] Creature/NPC IDs associated with this object.
---@field coord? Coord Single map coordinate.
---@field coords? Coord[] Multiple map coordinates.
---@field providers? Provider[] Providers attached to this object.
---@field itemID? ItemID
---@field npcID? NPCID
---@field headerID? integer
---@field encounterID? JournalEncounterID
---@field questID? QuestID
---@field difficultyID? DifficultyID
---@field up? UpgradeValue Encoded upgrade value (`ModID.BonusID`).
---@field sym? Sym Symbolic-processing instructions.
---@field isWorldQuest? boolean
---@field [string] any Additional ATT parser metadata.

---@class JournalEncounterObject: ATTObject
---@field encounterID? JournalEncounterID Encounter ID when created through `e`.

---@class NPCObject: ATTObject
---@field npcID? NPCID NPC/header identity when `TreatBossesAsNpcOnly` is enabled.

---@class QuestObject: ATTObject
---@field questID QuestID
---@field isWorldQuest boolean

---@class HeaderObject: ATTObject
---@field headerID? integer

---@class InstanceHelperExtraLootData
---@field [integer] ATTObjectArray Boss/Encounter-ID keyed extra loot arrays.

---@class InstanceHelperExtraLoot
---@field Add fun(encounter: JournalEncounterObject|NPCObject, bossID: JournalEncounterID, difficultyID: DifficultyID|nil, data: InstanceHelperExtraLootData) Called by `Boss` after the base boss object is created and before normal configured loot is appended.
---@field Data InstanceHelperExtraLootData Boss/Encounter-ID keyed data consumed by `Add`.

---@class InstanceHelperLFRQueueNPC
---@field cr? NPCID Single queue NPC copied onto qualifying LFR difficulty groups.
---@field crs? NPCID[] Queue NPC list copied onto qualifying LFR difficulty groups.
---@field coord? Coord Single queue-NPC coordinate.
---@field coords? Coord[] Queue-NPC coordinates.

---@class InstanceHelperDifficultyGroup: ATTObject
---@field difficultyID? DifficultyID Difficulty stored by `d`; it may differ from the exact ID passed to `Difficulty`.
---@field groups? ATTObjectArray
---@field AddGroups fun(groups: ATTObjectArray): InstanceHelperDifficultyGroup Dynamically supplied by the difficulty metatable. Appends groups and returns the same difficulty object.
---@field AddGroupsWithUpgrades fun(groups: ATTObjectArray): InstanceHelperDifficultyGroup Appends groups, applies upgrades recursively, and returns the same difficulty object.
---@field WithUpgrades fun(): InstanceHelperDifficultyGroup Applies upgrades to existing groups and returns the same difficulty object.

---@class InstanceHelperDifficultyMeta
---@field __index fun(t: InstanceHelperDifficultyGroup, key: string): function|nil Lazily exposes `AddGroups`, `AddGroupsWithUpgrades`, and `WithUpgrades`.

---@class InstanceHelper
---@field BossOnly fun(id: JournalEncounterID, t?: ATTObject): JournalEncounterObject|NPCObject Creates the base boss object and assigns configured creature IDs.
---@field Boss fun(id: JournalEncounterID, t?: ATTObject): JournalEncounterObject|NPCObject Creates a boss and applies extra loot, coordinates, object providers, and configured loot.
---@field BossWithHeader fun(id: JournalEncounterID, headerFunc: fun(groups: ATTObjectArray): ATTObject, t?: ATTObject): JournalEncounterObject|NPCObject Creates a boss whose configured loot is wrapped by `headerFunc`.
---@field BossWorldQuest fun(id: JournalEncounterID, questID: QuestID, t?: ATTObject): QuestObject Creates a World Quest associated with a configured encounter.
---@field Difficulty fun(difficultyID: DifficultyID, t?: ATTObject): InstanceHelperDifficultyGroup Creates a difficulty container and sets the helper's active difficulty context.
---@field CommonBossDrops fun(t?: ATTObjectArray): HeaderObject Creates a Common Boss Drops header associated with all configured boss creature IDs.
---@field ZoneDrops fun(groups?: ATTObjectArray): HeaderObject Creates a Zone Drops header using cloned configured zone-drop data.
---@field RawAllBosses fun(groups?: ATTObjectArray): ATTObjectArray|nil Assigns all configured boss creature IDs directly to every supplied group.
---@field WithUpgrades fun(groups?: ATTObjectArray) Applies the active difficulty's configured upgrade value recursively.
---@field ExtraLoots? InstanceHelperExtraLoot[] Extra-loot processors executed in array order by `Boss`.
---@field Coords? InstanceHelperCoordMap Boss/Encounter-ID keyed fallback coordinates.
---@field BossObjects? InstanceHelperBossObjectMap Boss/Encounter-ID keyed world-object IDs appended as `"o"` providers.
---@field UpgradeMapping? InstanceHelperUpgradeMap Difficulty-ID keyed encoded upgrade values. `0` explicitly disables upgrades for that difficulty.
---@field LFRQueueNPC? InstanceHelperLFRQueueNPC Queue-NPC metadata copied onto LFR/multi-LFR difficulty groups.
---@field TreatBossesAsNpcOnly? boolean When true, `BossOnly` constructs bosses with `n()` instead of `e()`.

--- Creates an all-in-one helper for consistently constructing dungeon/raid instance data.
---
--- The helper captures three data sources:
--- * `crs`: journal encounter ID -> creature IDs.
--- * `loots`: journal encounter ID -> normal loot/groups consumed by `Boss` and `BossWithHeader`.
--- * `zonedrops`: base Zone Drops data consumed by `ZoneDrops`.
---
--- The returned object is also a configuration object. Callers may assign
--- `ExtraLoots`, `Coords`, `BossObjects`, `UpgradeMapping`, `LFRQueueNPC`, or
--- `TreatBossesAsNpcOnly` after construction.
---
--- `Difficulty()` establishes mutable helper state (`CurrentDifficultyID`). That
--- state is subsequently consumed by `ExtraLoots` callbacks and `WithUpgrades`,
--- so boss/group construction is expected to occur in the corresponding
--- difficulty block.
---@param crs InstanceHelperCRMap Boss/Encounter-ID keyed creature arrays.
---@param loots? InstanceHelperLootMap Boss/Encounter-ID keyed normal loot/groups. May be omitted only when loot-consuming helpers are not used.
---@param zonedrops? ATTObject|ATTObjectArray Base Zone Drops data. May be omitted when `ZoneDrops` is unused.
---@return InstanceHelper helper Builder/configuration object bound to the supplied maps.
CreateInstanceHelper = function(crs, loots, zonedrops)
	---@type InstanceHelper
	local helper = {}
	---@type DifficultyID|nil
	local CurrentDifficultyID
	---@type NPCID[]
	local ALL_BOSSES = {}
	for _,v in pairs(crs) do
		appendAllGroups(ALL_BOSSES, v)
	end

	--- Creates the base object for a configured boss and assigns its creature IDs.
	---
	--- Normally this delegates to `e(id, t)`. When `TreatBossesAsNpcOnly` is true,
	--- it delegates to `n(id, t)` instead. No configured loot, extra loot, boss
	--- objects, or helper coordinates are added here; those belong to `Boss`.
	---@param id JournalEncounterID Encounter/Boss ID used to look up `crs[id]`.
	---@param t? ATTObject Additional object data passed directly to `e` or `n`.
	---@return JournalEncounterObject|NPCObject encounter Base boss object.
	local function BossOnly(id, t)
		if not t and type(id) ~= "number" then
			error("Missing id for boss. Got instead: ",id)
		end
		local encounter = (helper.TreatBossesAsNpcOnly and n or e)(id, t)
		encounter.crs = crs[id]
		return encounter
	end

	--- Creates a complete boss object using all applicable helper configuration.
	---
	--- Processing order is significant:
	--- 1. Build the base boss with `BossOnly`.
	--- 2. Run each `ExtraLoots[].Add` callback with the current difficulty context.
	--- 3. Apply a fallback coordinate from `Coords` when the object has none.
	--- 4. Convert configured `BossObjects` into `{ "o", objectID }` providers.
	--- 5. Clone and append the normal loot stored in `loots[id]`.
	---
	--- Loot is cloned before insertion so per-difficulty mutation (for example,
	--- upgrade application) does not mutate the shared source tables.
	---@param id JournalEncounterID Encounter/Boss ID.
	---@param t? ATTObject Additional boss data.
	---@return JournalEncounterObject|NPCObject encounter Fully configured boss object.
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

	--- Creates a World Quest tied to a configured boss/encounter.
	---
	--- The quest receives `crs[id]`, is forced to `isWorldQuest = true`, and gets
	--- a fallback coordinate from `Coords[id]` when needed. If the caller did not
	--- provide `sym`, a default symbolic selector is generated which selects the
	--- original encounter by `encounterID` and then pops the symbolic context.
	---@param id JournalEncounterID Encounter/Boss ID supplying creatures and optional coordinate.
	---@param questID QuestID World Quest ID passed to `q`.
	---@param t? ATTObject Additional quest data.
	---@return QuestObject quest Configured World Quest.
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

	--- Applies the active difficulty's encoded upgrade value recursively.
	---
	--- Requires `UpgradeMapping` and uses the exact ID last passed to `Difficulty`.
	--- A mapping value of `0` is an intentional no-op. Existing `up` values are
	--- preserved. Recursion enters nested groups only through recognized ATT
	--- container/object types (`npcID`, `headerID`, `itemID`, or `encounterID`).
	---
	--- This function mutates the supplied objects in place and has no meaningful
	--- return value.
	---@param groups? ATTObjectArray Groups/items to mutate.
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

	--- Creates a boss whose normal configured loot is wrapped in one custom header/group.
	---
	--- Unlike `Boss`, this intentionally starts from `BossOnly`; therefore it does
	--- not automatically run `ExtraLoots`, apply `Coords`, or add `BossObjects`.
	--- The cloned `loots[id]` array is passed to `headerFunc`, and that single
	--- returned wrapper object is appended to the boss.
	---@param id JournalEncounterID Encounter/Boss ID.
	---@param headerFunc fun(groups: ATTObjectArray): ATTObject Receives cloned normal loot and returns its wrapper/header.
	---@param t? ATTObject Additional boss data.
	---@return JournalEncounterObject|NPCObject encounter Boss with wrapped loot.
	local function BossWithHeader(id, headerFunc, t)
		if not t and (type(headerFunc) ~= "function" or type(id) ~= "number") then
			error("Missing valid id/headerFunc for BossWithHeader",id,headerFunc)
		end
		local encounter = BossOnly(id, t)
		encounter.groups = appendAllGroups(encounter.groups, {headerFunc(clone(loots[id]))})
		return encounter
	end

	--- Creates the `COMMON_BOSS_DROPS` header for all creature IDs configured in `crs`.
	---
	--- `ALL_BOSSES` is the flattened internal creature list built when the helper
	--- is created. The supplied child groups are not cloned by this function.
	---@param t? ATTObjectArray Groups placed under the Common Boss Drops header.
	---@return HeaderObject commonBossDrops Common Boss Drops header.
	local function CommonBossDrops(t)
		return n(COMMON_BOSS_DROPS, {
					["crs"] = ALL_BOSSES,
					["groups"] = t,
				})
	end

	--- Assigns the flattened `ALL_BOSSES` creature list to every direct group.
	---
	--- This is deliberately "raw": it mutates only the supplied array's direct
	--- entries and does not recurse. Invalid/non-array input is returned unchanged
	--- after emitting a parser warning.
	---@param groups? ATTObjectArray Array of objects to mutate.
	---@return ATTObjectArray|nil groups The same array after mutation, or the original invalid value.
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

	--- Creates the `ZONE_DROPS` header from the helper's configured zone-drop data.
	---
	--- The configured zone-drop data is cloned before use. When `groups` is
	--- supplied, the clone and the additional groups are combined with
	--- `appendGroups`; otherwise the cloned data is passed directly to `n`.
	---@param groups? ATTObjectArray Additional groups to combine with configured zone drops.
	---@return HeaderObject zoneDrops Zone Drops header.
	local function ZoneDrops(groups)
		if groups then
			return n(ZONE_DROPS, { groups = appendGroups(clone(zonedrops), groups)})
		end
		return n(ZONE_DROPS, clone(zonedrops))
	end

	--- Metatable used only by objects returned from `Difficulty`.
	--- Methods are synthesized through `__index` instead of stored on each group.
	---@type InstanceHelperDifficultyMeta
	local helperMeta = {
		--- Resolves fluent difficulty-group helper methods.
		---@param t InstanceHelperDifficultyGroup Difficulty group receiving the synthetic method.
		---@param key string Requested method name.
		---@return function|nil method Bound method closure, or nil for unknown keys.
		__index = function(t, key)
			if key == "AddGroups" then
				---@param groups ATTObjectArray Groups to append.
				---@return InstanceHelperDifficultyGroup self Same difficulty group for fluent chaining.
				return function(groups)
					if not groups or not isarray(groups) or groups.g then
						print("Expecting array type for AddGroups for InstanceHelper")
						return t
					end
					t.groups = appendAllGroups(t.groups, groups)
					return t
				end
			elseif key == "AddGroupsWithUpgrades" then
				---@param groups ATTObjectArray Groups to append before upgrade processing.
				---@return InstanceHelperDifficultyGroup self Same difficulty group for fluent chaining.
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
				---@return InstanceHelperDifficultyGroup self Same difficulty group for fluent chaining.
				return function()
					WithUpgrades(t.groups)
					return t
				end
			end
		end
	}

	--- Creates a fluent difficulty group and sets the helper's active difficulty context.
	---
	--- `d()` can normalize/change the difficulty stored on the returned object, so
	--- the helper separately retains the exact `difficultyID` argument in
	--- `CurrentDifficultyID`. Extra-loot callbacks and upgrade mapping use that
	--- exact requested ID.
	---
	--- For LFR and the two multi-LFR aggregate difficulties, `LFRQueueNPC` metadata
	--- (`cr`, `crs`, `coord`, `coords`) is cloned onto the returned difficulty group.
	--- The result receives `helperMeta`, enabling fluent calls such as
	--- `Difficulty(...):AddGroups(...):WithUpgrades()`.
	---@param difficultyID DifficultyID Exact difficulty ID requested by the caller.
	---@param t? ATTObject Additional difficulty data passed to `d`.
	---@return InstanceHelperDifficultyGroup diff Fluent difficulty group.
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

	-- Export the closures on the configuration object. They intentionally share
	-- the same captured `CurrentDifficultyID`, `ALL_BOSSES`, and source maps.
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

--- Builds symbolic-processing instructions for Dragonflight Season 4 tier tokens.
---
--- Command order:
--- 1. Use the explicit `modID`, or inherit the current item's ModID.
--- 2. Select all known Season 4 token `modItemID` values.
--- 3. `groupfill` the selected token groups.
--- 4. `pop` the symbolic context.
---
--- The returned table is declarative parser data; this function does not resolve
--- or mutate item groups itself.
---@param modID? integer Optional item ModID. When nil, emits `usemyModID` instead.
---@return Sym sym Ordered symbolic-processing instruction array.
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
