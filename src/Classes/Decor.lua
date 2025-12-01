
-- App locals
local _, app = ...

local CACHE = "Decor"
local CLASSNAME = "Decor"
local KEY = "decorID"
if not C_HousingCatalog then
	-- If Decor isn't distinguishable yet, simply create an extended Item
	app.CreateDecor = app.ExtendClass("Item", CLASSNAME, KEY, {});

	return
end

local C_HousingCatalog_GetCatalogEntryInfoByItem
	= C_HousingCatalog.GetCatalogEntryInfoByItem

-- TODO: test other APIs
-- /dump C_HousingCatalog.GetDecorMaxOwnedCount(2112) -> 0
-- /dump C_HousingCatalog.GetDecorTotalOwnedCount(2112) -> 0,0
-- /dump C_HousingCatalog.GetDecorTotalOwnedCount() -> 0,0

local pairs
 	= pairs

-- Decor Lib [STUB -- WIP]
do
	app.CreateDecor = app.ExtendClass("Item", CLASSNAME, KEY, {
		CACHE = function() return CACHE end,
		collectible = function(t) return app.Settings.Collectibles[CACHE]; end,
		collected = function(t) return app.IsAccountCached(CACHE, t.decorID) and 1 end,
	});
	app.AddSimpleCollectibleSwap(CLASSNAME, CACHE)
	app.AddEventHandler("OnSavedVariablesAvailable", function(currentCharacter, accountWideData)
		if not accountWideData[CACHE] then accountWideData[CACHE] = {} end
	end)
	app.AddEventHandler("OnRefreshCollections", function()
		local state, source
		local saved, none = {}, {}
		for id,sources in pairs(app.GetRawFieldContainer(KEY)) do
			source = sources[1]
			state = C_HousingCatalog_GetCatalogEntryInfoByItem(source.itemID, true)
			-- quantity is how many owned
			-- hasPlaced is used when the item is owned, but placed in the house (or outside)
			if state then
				local sum = state.quantity + state.numPlaced
				if sum > 0 and sum < 1000 then	-- Sometimes API returns 4294967295
					-- state is valid, keep it
				else
					state = nil
				end
			end
			if state ~= nil then
				saved[id] = true
			else
				none[id] = true
			end
		end

		-- Account Cache
		app.SetBatchAccountCached(CACHE, saved, 1)
		app.SetBatchAccountCached(CACHE, none)
	end)
end
