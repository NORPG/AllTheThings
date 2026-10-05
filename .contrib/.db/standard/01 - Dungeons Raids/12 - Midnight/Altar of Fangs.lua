-----------------------------------------------------
--   D U N G E O N S  &  R A I D S  M O D U L E    --
-----------------------------------------------------

------ Encounter Constants ------
local RAVI = 2878;
local WRITHING = 2879;
local ZULJAN = 2880;

------ EncounterToCRS ------
local EncounterToCRS = {
	[RAVI] = { 259445 },	-- Rav'i
	[WRITHING] = { 259446 },	-- The Writhing Coil
	[ZULJAN] = { 259447 },	-- Zul'jan
};

------ Boss Functions ------
local InstanceHelper = CreateInstanceHelper(EncounterToCRS)
local BossOnly, Difficulty =
InstanceHelper.BossOnly, InstanceHelper.Difficulty

-- TODO: M+ container: 642076

local InRetailSeason
-- #IF AFTER 12.1
InRetailSeason = {	-- MID S2
	DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS,
	DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS,
	DIFFICULTY.DUNGEON.MYTHIC,
}
-- #ENDIF

root(ROOTS.Instances, expansion(EXPANSION.MID, bubbleDownSelf({ ["timeline"] = { ADDED_12_1_0 } }, {
	inst(1322, {	-- Altar of Fangs
		InRetailSeason=InRetailSeason,
		["coord"] = { 47.2, 68.5, MAP.MIDNIGHT.VAULTS_OF_ATALUTEK },
		["maps"] = {
			2588,	-- Sacrificial Approach / The Carnage Pit
			2589,	-- Ancient Burrow
			2590,	-- Mutation Chambers / Altar of Fangs
		},
		["groups"] = {
			Difficulty(DIFFICULTY.DUNGEON.MULTI.NORMAL_PLUS).AddGroups({
				BossOnly(RAVI, {
					i(273795),	-- Coiled Fangstone
					i(273775),	-- Hydra Scale Wristguards
					i(273793),	-- Hydraspine Twinblade
					i(273777),	-- Poison-Proof Stompers
					i(273785),	-- Primordial Robe of Rites
					i(273780),	-- Venom-Etched Crescent
					i(273796),	-- Vile Vial of Volatile Venom
				}),
				BossOnly(WRITHING, {
					i(273787),	-- Aged Interwoven Scaleplate
					i(273794),	-- Knot of Writhing Serpents
					i(273786),	-- Leggings of Entwined Serpents
					i(273779),	-- Nocuous Focal Fang
					i(273774),	-- Snakeskin Spaulders
					i(273781),	-- Strand of Warding Fangs
					i(273783),	-- Toxin-Coated Warstaff
					i(273782),	-- Vile Writhefang Glaive
				}),
				BossOnly(ZULJAN, {
					ach(62282),	-- Altar of Fangs
					i(270900),	-- Pattern: Snakeskin Lining (RECIPE!)
					i(279211),	-- Pillar of the Fanged Altar (DECOR!)
					i(273784),	-- Ancestral Amani Recurve
					i(273776),	-- Ancient General's Obsidian Pillars
					i(273792),	-- Band of the Amani Warlord
					i(273789),	-- Chestguard of Corroded Scales
					i(273773),	-- Handwraps of Blasphemous Rites
					i(273778),	-- Polished Lightwood Channeler
					i(275070),	-- Sharpened Lightwood Slasher
					i(273791),	-- Spare Speaker's Hood
					i(273797),	-- Tattered Amani War Banner
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.MULTI.HEROIC_PLUS).AddGroups({
				BossOnly(ZULJAN, {
					ach(62283),	-- Heroic: Altar of Fangs
				}),
			}),
			Difficulty(DIFFICULTY.DUNGEON.MYTHIC).AddGroups({
				n(ACHIEVEMENTS, {
					ach(63679, {	-- In Case Of Emergency
						["description"] = createLocalizationString({
							readable = "Requires 5 Players.\n\nThe Reversal Charms and Ritual Reagent spawn in the 4 poison waterfalls in the 1st boss arena.\nThey are very hard to see, and a Reversal Charm can stack right next to the Ritual Reagent.\nIf you grab the wrong item, click off your buff and pick up the correct one.\nYou need 4 players with Reversal Charms and 1 player with the Ritual Reagent.\n\nClear the room with the Ascendant Serpent mob after the 2nd boss, but do not touch the totems.\nThe 4 Charm holders stand at the totems, and the Reagent holder stands on the mob.\nEveryone targets the serpent and waits for their Extra Action Button.\nThe Reagent holder casts first.\nAfter the Reagent cast completes, all 4 Charm holders cast theirs to finish the transformation.\nThere is no timer after the Reagent finishes, but once the first Charm holder starts their 13-second cast, the other 3 must start before it finishes.\n\nInteract with the new NPC to get your pet and Feat of Strength.",
							constant = "REQUIRES_5_PLAYERS_THE_REVERSAL_CHARMS_AND",
							export = true,
							text = {
								en = "Requires 5 Players.\n\nThe Reversal Charms and Ritual Reagent spawn in the 4 poison waterfalls in the 1st boss arena.\nThey are very hard to see, and a Reversal Charm can stack right next to the Ritual Reagent.\nIf you grab the wrong item, click off your buff and pick up the correct one.\nYou need 4 players with Reversal Charms and 1 player with the Ritual Reagent.\n\nClear the room with the Ascendant Serpent mob after the 2nd boss, but do not touch the totems.\nThe 4 Charm holders stand at the totems, and the Reagent holder stands on the mob.\nEveryone targets the serpent and waits for their Extra Action Button.\nThe Reagent holder casts first.\nAfter the Reagent cast completes, all 4 Charm holders cast theirs to finish the transformation.\nThere is no timer after the Reagent finishes, but once the first Charm holder starts their 13-second cast, the other 3 must start before it finishes.\n\nInteract with the new NPC to get your pet and Feat of Strength.",
								-- TODO: de = "",
								-- TODO: es = "",
								-- TODO: mx = "",
								-- TODO: fr = "",
								-- TODO: it = "",
								-- TODO: ko = "",
								-- TODO: pt = "",
								-- TODO: ru = "",
								cn = "需要 5 名玩家。\n\n逆转符咒和仪式试剂会在第一个首领竞技场的 4 条毒液瀑布中刷新。\n它们非常难以看清，而且逆转符咒可能就叠在仪式试剂旁边。\n如果你拿错了物品，点掉你的增益并拾取正确的那个。\n你需要 4 名持有逆转符咒的玩家和 1 名持有仪式试剂的玩家。\n\n在第二个首领之后清理有升腾巨蛇怪物的房间，但不要碰图腾。\n4 名符咒持有者站在图腾处，试剂持有者站在怪物身上。\n所有人选中巨蛇并等待自己的额外动作按钮。\n试剂持有者先施放。\n试剂施放完成后，所有 4 名符咒持有者施放自己的符咒以完成变形。\n试剂完成后没有计时，但一旦第一个符咒持有者开始其 13 秒的施放，其他 3 人必须在它完成前开始。\n\n与新 NPC 互动即可获得你的宠物和伟业。",
								-- TODO: tw = "",
							},
						}),
						["groups"] = { i(279197) },	-- Slitherfang (PET!)
					}),
				}),
				BossOnly(ZULJAN, {
					ach(62284),	-- Mythic: Altar of Fangs
					i(276804),	-- The Writhing Brood (MOUNT!)
				}),
			}),
		},
	}),
})));
