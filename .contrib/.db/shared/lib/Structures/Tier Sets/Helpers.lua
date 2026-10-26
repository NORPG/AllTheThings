-- Assigns the TierStructures by ClassID which are listed by constant key
TIER_STRUCTURE_ASSIGN_CLASSIDS = function(tierStructure)
	tierStructure[DEATHKNIGHT] = tierStructure.DEATHKNIGHT
	tierStructure[DEMONHUNTER] = tierStructure.DEMONHUNTER
	tierStructure[DRUID] = tierStructure.DRUID
	tierStructure[EVOKER] = tierStructure.EVOKER
	tierStructure[HUNTER] = tierStructure.HUNTER
	tierStructure[MAGE] = tierStructure.MAGE
	tierStructure[MONK] = tierStructure.MONK
	tierStructure[PALADIN] = tierStructure.PALADIN
	tierStructure[PRIEST] = tierStructure.PRIEST
	tierStructure[ROGUE] = tierStructure.ROGUE
	tierStructure[SHAMAN] = tierStructure.SHAMAN
	tierStructure[WARLOCK] = tierStructure.WARLOCK
	tierStructure[WARRIOR] = tierStructure.WARRIOR
end

-- Can be used when a common Tier structure exists. Builds the typical Class header for use within a Difficulty/Catalyst/Vendor
local CLASS_TIER_HELPER = function(classID, tierStructure, difficultyID)
	if not tierStructure[classID] then return end
	local class = cl(classID, { groups = clone(tierStructure[classID]) })
	local tierSym = tierStructure.SYM_TIER
	if tierSym then
		class.sym = tierSym(classID, difficultyID)
	end
	return class
end

-- Can be used when a common Tier structure exists. Builds the typical array of Class headers within a Difficulty/Catalyst/Vendor
ALL_CLASS_TIERS_HELPER = function(tierStructure, difficultyID)
	local classes = {}
	for i=1,#ALL_CLASSES do
		local classTier = CLASS_TIER_HELPER(ALL_CLASSES[i], tierStructure, difficultyID)
		if classTier then
			classes[#classes+1] = classTier
		end
	end
	return classes
end
