ExportDB.OnUpdateDB.ForLockpicking = [[~function(t)
	if _.Settings.Collectibles.Recipes then
		t.collectible = true;
		local id = t.spellID;
		local skills = _.CurrentCharacter.ActiveSkills[id];
		if skills and skills[1] >= 300 then
			t.collected = 1;
			return;
		end
		if _.Settings.AccountWide.Recipes then
			for guid,ch in pairs(ATTCharacterData) do
				skills = ch.ActiveSkills and ch.ActiveSkills[id];
				if skills and skills[1] >= 300 then
					t.collected = 2;
					return;
				end
			end
		end
		t.collected = false;
	else
		t.collectible = false;
	end
end]];
ExportDB.OnTooltipDB.ForLockpicking = [[~function(t, tooltipInfo)
	local skills = _.CurrentCharacter.ActiveSkills[t.spellID];
	if skills and skills[1] < 300 then
		local data = t.lpdata;
		if not data then
			data = {};
			local requireSkill = t.requireSkill;
			_:BuildFlatSearchFilteredResponse(_:GetDatabaseRoot().g, function(group)
				return group.requireSkill == requireSkill and group.learnedAt and not group.nmr;
			end, data);
			table.sort(data, function(a, b)
				return a.learnedAt > b.learnedAt;
			end);
			t.lpdata = data;
		end
		tinsert(tooltipInfo, { left = "Recommended Locations:", right = "Minimum" });
		local lastLearnedAt;
		for i,o in ipairs(data) do
			if o.learnedAt <= skills[2] then
				if o.learnedAt < skills[1] then
					if lastLearnedAt and o.learnedAt < lastLearnedAt then
						break;
					end
					lastLearnedAt = o.learnedAt;
				end
				local text = "  " .. o.text;
				mapID = _.GetBestMapForGroup(o, _.CurrentMapID);
				if mapID then text = text .. " (" .. _.GetMapName(mapID) .. ")"; end
				tinsert(tooltipInfo, { left = text, right = tostring(o.learnedAt), r = 1, g = 1, b = 1 });
			end
		end
	end
end]];
root(ROOTS.Professions, lockpicking({
	-- #if AFTER CATA
	["description"] = createLocalizationString({
		readable = "Lockpicking now skills up as you level, you no longer need to practice. Hovering over your Pick Lock ability will show the current level of box you can open.",
		constant = "LOCKPICKING_NOW_SKILLS_UP_AS_YOU_LEVEL_YOU_NO",
		export = true,
		text = {
			en = "Lockpicking now skills up as you level, you no longer need to practice. Hovering over your Pick Lock ability will show the current level of box you can open.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "现在开锁技能会随着你升级而提升，不再需要练习。将鼠标悬停在解锁技能上会显示你当前能打开的箱子等级。",
			-- TODO: tw = "",
		},
	}),
	-- #else
	["description"] = createLocalizationString({
		readable = "Lockpicking needs to be leveled up by practicing on lockboxes found in the world and junkboxes looted by using your pickpocket ability on appropriately leveled mobs.",
		constant = "LOCKPICKING_NEEDS_TO_BE_LEVELED_UP_BY",
		export = true,
		text = {
			en = "Lockpicking needs to be leveled up by practicing on lockboxes found in the world and junkboxes looted by using your pickpocket ability on appropriately leveled mobs.",
			-- TODO: de = "",
			-- TODO: es = "",
			-- TODO: mx = "",
			-- TODO: fr = "",
			-- TODO: it = "",
			-- TODO: ko = "",
			-- TODO: pt = "",
			-- TODO: ru = "",
			cn = "开锁技能需要通过练习来提升：可以开世界上找到的锁箱，以及用搜索技能从等级合适的怪物身上偷来的垃圾箱。",
			-- TODO: tw = "",
		},
	}),
	-- TODO: Maybe add a thing in the tooltip for suggestions on where to level next?
	-- #endif
	-- This makes it ignore the profession requirement.
	["DontEnforceSkillRequirements"] = true,
	-- #if BEFORE CATA
	["OnUpdate"] = [[_.OnUpdateDB.ForLockpicking]],
	["OnTooltip"] = [[_.OnTooltipDB.ForLockpicking]],
	-- #endif
	["groups"] = {
		recipe(1804, {	-- Pick Lock
			-- #if BEFORE WRATH
			["provider"] = { "i", 5060 },	-- Thieves' Tools
			-- #endif
			["classes"] = { ROGUE },
		}),
		recipe(921, {	-- Pick Pocket
			["classes"] = { ROGUE },
		}),
	}
}));
