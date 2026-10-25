-- Refresh Lib
local _, app = ...;

local OneTimeFixFunctions = {}
if app.IsRetail and app.GameBuildVersion > 70000 then

--- @type function,function,function
local select, ipairs, pairs
	= select, ipairs, pairs;
local ATTAccountWideData

local function CacheAccountWideMiscQuests()
	local oneTimeQuests = ATTAccountWideData.OneTimeQuests
	local IsQuestFlaggedCompleted = app.IsQuestFlaggedCompleted

	-- Cache some collection states for misc. once-per-account quests
	for _,questID in ipairs(app.OPAQDB or app.EmptyTable) do
		-- If this Character has the Quest completed and it is not marked as completed for Account or not for specific Character
		if not oneTimeQuests[questID] and IsQuestFlaggedCompleted(questID) then
			-- Mark the character which completed the Quest
			oneTimeQuests[questID] = app.GUID
		end
		-- otherwise indicate the one-time-nature of the quest
		if oneTimeQuests[questID] == nil then
			oneTimeQuests[questID] = false
		end
	end
end
local function FixNonOneTimeQuests(currentCharacter, accountWideData, characterData)
	local oneTimeQuests = accountWideData.OneTimeQuests;

	-- if we ever erroneously add an account-wide quest and find out it isn't put it here so it reverts back to being handled as a normal quest
	for _,questID in ipairs(app.NonOPAQDB or app.EmptyTable) do
		oneTimeQuests[questID] = nil;
	end
	-- quests in AccountWideQuestsDB will automatically be removed from OneTimeQuests
	for questID,_ in pairs(app.AccountWideQuestsDB) do
		oneTimeQuests[questID] = nil;
	end
	-- if someone gets a one-time quest flagged as completed, then later removes that character, we need to make sure we don't continue tracking that quest as completed by the unknown character since the Quests logic expects this situation to remain as a 'collected' quest, but the lack of character cached data will turn it into a non-collected situation, lingering forever for that player
	for questID,charGuid in pairs(oneTimeQuests) do
		if charGuid and not characterData[charGuid] then
			app.print("Cleaned up One-Time Quest marked as completed by an Unknown character UID:",charGuid,app:RawSearchLink("questID",questID,"field"))
			oneTimeQuests[questID] = nil
		-- elseif characterData[charGuid] then
		-- 	app.PrintDebug("Character with completed One-Time Quest still valid",charGuid,app:RawSearchLink("questID",questID,"field"))
		end
	end
end
-- ref. https://github.com/ATTWoWAddon/AllTheThings/commit/d1b02b8021a7f2aa80c03d212a2ea54a443e9117
OneTimeFixFunctions.Spell148972 = function(currentCharacter, accountWideData, characterData)
	local found
	for charGuid,charData in pairs(characterData) do
		if charData.Spells and charData.Spells[148972] then
			charData.Spells[148972] = nil
			found = true
		end
	end
	if found then
		app.print(app.Modules.Color.Colorize("One-Time removal for inaccurate cached data performed!", app.Colors.Account),
					"If any character knows",
					app:Linkify("Spell 148972", app.Colors.ChatLink,"search:spellID:148972"),
					"they will need to log in to properly re-collect in ATT")
	end
end
-- ref. https://github.com/ATTWoWAddon/AllTheThings/commit/d1b02b8021a7f2aa80c03d212a2ea54a443e9117
OneTimeFixFunctions.Spell241857 = function(currentCharacter, accountWideData, characterData)
	local found
	for charGuid,charData in pairs(characterData) do
		if charData.Spells and charData.Spells[241857] then
			charData.Spells[241857] = nil
			found = true
		end
	end
	if found then
		app.print(app.Modules.Color.Colorize("One-Time removal for inaccurate cached data performed!", app.Colors.Account),
					"If any character knows",
					app:Linkify("Spell 241857", app.Colors.ChatLink,"search:spellID:241857"),
					"they will need to log in to properly re-collect in ATT")
	end
end
local function CheckOncePerAccountQuestsForCharacter()
	-- Double check if any once-per-account quests which haven't been detected as being completed are completed by this character
	local oneTimeQuests = ATTAccountWideData.OneTimeQuests
	local IsQuestFlaggedCompleted = app.IsQuestFlaggedCompleted;
	local charGuid = app.GUID;
	for questID,questGuid in pairs(oneTimeQuests) do
		-- If this Character has the Quest completed and it is not marked as completed for Account or not for specific Character
		if IsQuestFlaggedCompleted(questID) then
			-- Throw up a warning to report if this was already completed by another character
			if questGuid and questGuid ~= charGuid then
				app.PrintDebug("One-Time-Quest ID " .. app:Linkify(questID,app.Colors.ChatLink,"search:questID:"..questID) .. " was previously marked as completed, but is also completed on the current character!");
			end
			-- Mark the character which completed the Quest
			oneTimeQuests[questID] = charGuid;
		end
	end
end

app.AddEventHandler("OnRefreshCollections", CacheAccountWideMiscQuests)
app.AddEventHandler("OnRefreshCollections", CheckOncePerAccountQuestsForCharacter)
app.AddEventHandler("OnSavedVariablesAvailable", function(currentCharacter, accountWideData)
	ATTAccountWideData = accountWideData
end)
app.AddEventHandler("OnAfterSavedVariablesAvailable", FixNonOneTimeQuests)
end

-- ref. 1 represents account-wide completion, so all old data needs to be wiped initially to allow proper re-caching
OneTimeFixFunctions.PreATT5_0_14AWQuests = function(currentCharacter, accountWideData, characterData)
	local quests = accountWideData.Quests
	if not quests then return end

	if not accountWideData.PriorQuests then accountWideData.PriorQuests = {} end
	local priorQuests = accountWideData.PriorQuests
	for questID,completion in pairs(quests) do
		if completion == 1 then
			quests[questID] = nil
			priorQuests[questID] = 1
		end
	end

	app.print("One-Time cleanup of old-format account-wide quest completion cache performed!")
end
-- ref. convert profile filter data to properly setup Default toggle
OneTimeFixFunctions.ConvertAccountModeFiltersForProfiles = function(currentCharacter, accountWideData)
	app.AddEventHandler("OnAfterSavedVariablesAvailable", function(currentCharacter, accountWideData)

		local profiles = AllTheThingsProfiles.Profiles
		if not profiles then return end

		local profileFilters, filters

		for key,profile in pairs(profiles) do
			filters = profile.Filters
			-- if there's no General section in the Profile then skip
			if profile.General then
				if profile.General.AccountMode then
					profileFilters = {}
					app.CloneDictionary(filters or app.EmptyTable, profileFilters)
					profile.General["Profile:Filters"] = profileFilters
					profile.General["Profile:DefaultFilters"] = true
					-- make sure all Equipment filters are assigned in the Account mode Default profile
					for k in pairs(app.EquipmentFilters) do
						filters[k] = true
					end
				else
					-- User has never assigned any Filter manually, they are in "Default" Filtering
					if not filters or not next(filters) then
						profile.General["Profile:DefaultFilters"] = true
					else
						profile.General["Profile:DefaultFilters"] = false
						profileFilters = {}
						app.CloneDictionary(filters, profileFilters)
						profile.General["Profile:Filters"] = profileFilters
					end
				end
			end
		end
		app.print("One-Time conversion of Profile Filter sets performed!")
	end)
end
local function OneTimeFixes(currentCharacter, accountWideData, characterData)
	if not accountWideData.OneTimeFixes then accountWideData.OneTimeFixes = {} end
	local appliedFixes = accountWideData.OneTimeFixes

	for fix,func in pairs(OneTimeFixFunctions) do
		if not appliedFixes[fix] then
			appliedFixes[fix] = 1
			func(currentCharacter, accountWideData, characterData)
		end
	end

	OneTimeFixFunctions = nil
end
app.AddEventHandler("OnSavedVariablesAvailable", OneTimeFixes)

-- for the first auto-refresh, don't actually print to chat since some users don't like that auto-chat on login
---@type function
local InCombatLockdown = InCombatLockdown;
---@type function
local print = app.EmptyFunction;
app.__FirstRefresh = true;
local IsRefreshing

-- [Event]Done is called automatically when processed by a Runner and it completes the set of functions
app.AddEventHandler("OnRefreshCollectionsDone", function()
	-- Report success once refresh is done
	print(app.L.DONE_REFRESHING);
	if app.__FirstRefresh then
		app.__FirstRefresh = nil;
		print = app.print;
	end
	IsRefreshing = nil
end)
local function RefreshCollections()
	-- Execute the OnRefreshCollections handlers.
	app.HandleEvent("OnRefreshCollections")
end
app.RefreshCollections = function()
	if IsRefreshing then return end
	IsRefreshing = true
	if InCombatLockdown() then
		print(app.L.REFRESHING_COLLECTION,"(",COMBAT,")");
	else
		print(app.L.REFRESHING_COLLECTION);
	end

	app.CallbackHandlers.AfterCombatCallback(RefreshCollections)
end

app.AddEventHandler("OnReady", app.RefreshCollections)
