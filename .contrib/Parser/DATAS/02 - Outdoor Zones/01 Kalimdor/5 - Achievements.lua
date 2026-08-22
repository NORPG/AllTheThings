---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local ANALYNN = {
	["crs"] = { 66136 },
	["coord"] = { 20.2, 29.6, ASHENVALE },
};
local CASSANDRA_KABOOM = {
	["crs"] = { 66422 },
	["coord"] = { 39.6, 79.2, SOUTHERN_BARRENS },
};
local DAGRA_THE_FIERCE = {
	["crs"] = { 66135 },
	["coord"] = { 58.6, 53.0, NORTHERN_BARRENS },
};
local ELENA_FLUTTERFLY = {
	["crs"] = { 66412 },
	["coord"] = { 46.0, 60.6, MOONGLADE },
};
local GRAZZLE_THE_GREAT = {
	["crs"] = { 66436 },
	["coord"] = { 53.8, 74.8, DUSTWALLOW_MARSH },
};
local KELA_GRIMTOTEM = {
	["crs"] = { 66452 },
	["coord"] = { 31.8, 32.8, THOUSAND_NEEDLES },
};
local MERDE_STRONGHOOF = {
	["crs"] = { 66372 },
	["coord"] = { 57.2, 45.8, DESOLACE },
};
local STONE_COLD_TRIXXY = {
	["crs"] = { 66466 },
	["coord"] = { 65.6, 64.6, WINTERSPRING },
};
local TRAITOR_GLUK = {
	["crs"] = { 66352 },
	["coord"] = { 59.6, 49.6, FERALAS },
};
local ZUNTA = {
	["crs"] = { 66126 },
	["coord"] = { 43.9, 28.9, DUROTAR },
};
local ZOLTAN = {
	["crs"] = { 66442 },
	["coord"] = { 40.0, 56.6, FELWOOD },
};
local ZONYA_THE_SADIST = {
	["crs"] = { 66137 },
	["coord"] = { 20.2, 29.5, ASHENVALE },
};

root(ROOTS.Zones, m(KALIMDOR, {
	n(ACHIEVEMENTS, {
		header(HEADERS.Achievement, 61051, bubbleDownSelf({ ["timeline"] = { ADDED_12_0_0 } }, {	-- Family Battler of Kalimdor
			petbattle(ach(61051, {	-- Family Battler of Kalimdor (automated)
				-- Meta Achievement
				["sym"] = {{"meta_achievement",
					61041,	-- Aquatic Battler of Kalimdor
					61042,	-- Beast Battler of Kalimdor
					61043,	-- Critter Battler of Kalimdor
					61044,	-- Dragonkin Battler of Kalimdor
					61045,	-- Elemental Battler of Kalimdor
					61046,	-- Flying Battler of Kalimdor
					61047,	-- Humanoid Battler of Kalimdor
					61048,	-- Magic Battler of Kalimdor
					61049,	-- Mechanical Battler of Kalimdor
					61050,	-- Undead Battler of Kalimdor
				}},
				["timeline"] = { ADDED_12_0_0 },
				["groups"] = { i(258737) },	-- Moon Darter (PET!)
			})),
			petbattle(ach(61041)),	-- Aquatic Battler of Kalimdor
			petbattle(ach(61042)),	-- Beast Battler of Kalimdor
			petbattle(ach(61043)),	-- Critter Battler of Kalimdor
			petbattle(ach(61044)),	-- Dragonkin Battler of Kalimdor
			petbattle(ach(61045)),	-- Elemental Battler of Kalimdor
			petbattle(ach(61046)),	-- Flying Battler of Kalimdor
			petbattle(ach(61047)),	-- Humanoid Battler of Kalimdor
			petbattle(ach(61048)),	-- Magic Battler of Kalimdor
			petbattle(ach(61049)),	-- Mechanical Battler of Kalimdor
			petbattle(ach(61050)),	-- Undead Battler of Kalimdor
		})),
	}),
}));
