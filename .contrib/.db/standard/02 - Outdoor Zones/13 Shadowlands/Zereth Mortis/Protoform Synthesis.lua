---------------------------------------------------
--          Z O N E S        M O D U L E         --
---------------------------------------------------

local GENESIS = 188957;
local AMBYSTAN_LATTICE = 187634;
local AURELID_LATTICE = 187636;
local BUFONID_LATTICE = 187633;
local CREVID_LATTICE = 187635;
local GEOMENTAL_LATTICE = 189146;
local HELICID_LATTICE = 189145;
local LEPROID_LATTICE = 189147;
local LUPINE_LATTICE = 190388;
local POULTRID_LATTICE = 189148;
local PROTO_AVIAN_LATTICE = 189149;
local RAPTORA_LATTICE = 189150;
local SCARABID_LATTICE = 189151;
local TARRACHNID_LATTICE = 189152;
local UNFORMED_LATTICE = 189153;
local VESPOID_LATTICE = 189154;
local VIPERID_LATTICE = 189155;
local VOMBATA_LATTICE = 189156;

root(ROOTS.Zones, m(SHADOWLANDS, bubbleDown({ ["timeline"] = { ADDED_9_2_0 } }, {
	m(ZERETH_MORTIS, {
		prof(PROTOFORM_SYNTHESIS, {
			n(ACHIEVEMENTS, {
				achpart(15406, 15411),	-- Synthesized!
				achpart(15407, 15411),	-- Synthe-fived!
				achpart(15410, 15411),	-- Synthe-superfived!
				ach(15411),	-- Synthe-supersized!
			}),
			n(QUESTS, {
				-- Unlock Pet Forge Available with Dealic Understanding
				q(65419, {	-- Protoform Synthesis
					["description"] = createLocalizationString({
						readable = "Require Dealic Understanding.",
						constant = "REQUIRE_DEALIC_UNDERSTANDING",
						export = true,
						text = {
							en = "Require Dealic Understanding.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要迪力之悟。",
							-- TODO: tw = "",
						},
					}),
					["provider"] = { "n", 181059 },	-- Pocopoc
					["groups"] = {
						recipe(364571),	-- Archetype of Animation
						recipe(364580),	-- Archetype of Cunning
						recipe(363894),	-- Archetype of Discovery
						recipe(364572),	-- Archetype of Focus
						recipe(364585),	-- Archetype of Malice
						recipe(364549),	-- Archetype of Metamorphosis
						recipe(364568),	-- Archetype of Motion
						recipe(364576),	-- Archetype of Multiplicity
						recipe(364581),	-- Archetype of Predation
						recipe(364573),	-- Archetype of Renewal
						recipe(364570),	-- Archetype of Satisfaction
						recipe(364584),	-- Archetype of Serenity
						recipe(364551),	-- Archetype of Survival
						recipe(364578),	-- Archetype of Vigilance
					},
				}),
				-- Unlock Mount Forge Available with Sopranian Understanding
				q(64829, {	-- Finding Tahli
					["description"] = "~L.REQUIRES_SORPRANIAN_UNDERSTANDING",
					["provider"] = { "n", 180630 },	-- Elder Amir
					["coord"] = { 61.4, 51.5, ZERETH_MORTIS },
				}),
				q(64745, {	-- Selfless Preservation
					["sourceQuests"] = { 64829 },	-- Finding Tahli
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 63.9, 40.8, ZERETH_MORTIS },
					["groups"] = {
						i(188798),	-- Stolen Artifact (QI!)
					},
				}),
				q(64761, {	-- Core Competency
					["sourceQuests"] = { 64745 },	-- Selfless Preservation
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 61.2, 37.6, ZERETH_MORTIS },
					["groups"] = {
						i(187941),	-- Depleted Automa Core (QI!)
					},
				}),
				q(64759, {	-- Junk's Not Dead
					["sourceQuests"] = { 64745 },	-- Selfless Preservation
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 61.2, 37.6, ZERETH_MORTIS },
				}),
				q(64762, {	-- Revival of the Fittest
					["sourceQuests"] = {
						64761,	-- Core Competency
						64759,	-- Junk's Not Dead
					},
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 61.2, 37.6, ZERETH_MORTIS },
				}),
				q(64763, {	-- Maintenance Mode
					["sourceQuests"] = { 64762 },	-- Revival of the Fittest
					["provider"] = { "n", 180610 },	-- Kodah
					["coord"] = { 61.2, 37.6, ZERETH_MORTIS },
					["groups"] = {
						i(189492),	-- Attunement Codex (QI!)
					},
				}),
				q(64766, {	-- Access Request
					["sourceQuests"] = { 64762 },	-- Revival of the Fittest
					["provider"] = { "n", 180610 },	-- Kodah
					["coord"] = { 61.2, 37.6, ZERETH_MORTIS },
					["groups"] = {
						i(187628),	-- Restoration Matrix (QI!)
					},
				}),
				q(64767, {	-- The Final Song
					["sourceQuests"] = {
						64763,	-- Maintenance Mode
						64766,	-- Access Request
					},
					["provider"] = { "n", 180610 },	-- Kodah
					["coord"] = { 68.8, 29.7, ZERETH_MORTIS },
				}),
				q(65420, {	-- Judgment Call
					["sourceQuests"] = { 64767 },	-- The Final Song
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 70.1, 28.4, ZERETH_MORTIS },
				}),
				q(65426, {	-- The Lost Component
					["sourceQuests"] = { 65420 },	-- Judgment Call
					["provider"] = { "n", 181273 },	-- Tahli
					["coord"] = { 61.5, 51.6, ZERETH_MORTIS },
					["groups"] = {
						i(189499),	-- Protoform Catalyst (QI!)
					},
				}),
				q(65427, {	-- A New Architect
					["sourceQuests"] = { 65426 },	-- The Lost Component
					["provider"] = { "n", 181135 },	-- Servitor Interface
					["coord"] = { 70.2, 28.6, ZERETH_MORTIS },
					["groups"] = {
						i(189501),	-- Protoform Tool (QI!)
						i(189500),	-- Cervid Lattice
						i(189457),	-- Schematic: Deathrunner (RECIPE!)
					},
				}),
				-- Schematics
				-- Pets
				-- TODO: make waypoint plotting automatically check coords on provider objects / Parser report superfluous coords in Debug?
				q(65327, {	-- Schematic Reassimilation: Ambystan Darter
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189418 },	-- Schematic: Ambystan Darter
					["coord"] = { 78.1, 53.1, ZERETH_MORTIS },
					["groups"] = {
						recipe(364527),	-- Ambystan Darter
					},
				}),
				q(65332, {	-- Schematic Reassimilation: Fierce Scarabid
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189434 },	-- Schematic: Fierce Scarabid
					["coord"] = { 61.2, 42.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(364665),	-- Fierce Scarabid
					},
				}),
				q(65357, {	-- Schematic Reassimilation: Leaping Leporid
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189444 },	-- Schematic: Leaping Leporid
					["coord"] = { 58.3, 74.3, ZERETH_MORTIS },
					["groups"] = {
						recipe(364703),	-- Leaping Leporid
					},
				}),
				q(65358, {	-- Schematic Reassimilation: Microlicid
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189445 },	-- Schematic: Microlicid
					["coord"] = { 28.1, 50.0, ZERETH_MORTIS },
					["groups"] = {
						recipe(364697),	-- Microlicid
					},
				}),
				q(65333, {	-- Schematic Reassimilation: Multichicken
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189435 },	-- Schematic: Multichicken
					["coord"] = { 53.8, 72.5, ZERETH_MORTIS },
					["groups"] = {
						recipe(364679),	-- Multichicken
					},
				}),
				q(65348, {	-- Schematic Reassimilation: Omnipotential Core
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189440 },	-- Schematic: Omnipotential Core
					["coord"] = { 42.8, 40.6, 2029 },
					["groups"] = {
						recipe(364689),	-- Omnipotential Core
					},
				}),
				q(65354, {	-- Schematic Reassimilation: Prototickles
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189442 },	-- Schematic: Prototickles
					["coord"] = { 52.3, 75.4, ZERETH_MORTIS },
					["groups"] = {
						recipe(364691),	-- Prototickles
					},
				}),
				q(65351, {	-- Schematic Reassimilation: Resonant Echo
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189441 },	-- Schematic: Resonant Echo
					["groups"] = {
						recipe(364690),	-- Resonant Echo
					},
				}),
				q(65359, {	-- Schematic Reassimilation: Shelly
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189446 },	-- Schematic: Shelly
					["coord"] = { 57.9, 78.0, ZERETH_MORTIS },
					["groups"] = {
						recipe(364698),	-- Shelly
					},
				}),
				q(65336, {	-- Schematic Reassimilation: Stabilized Geomental
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189437 },	-- Schematic: Stabilized Geomental
					["groups"] = {
						recipe(364688),	-- Stabilized Geomental
					},
				}),
				q(65355, {	-- Schematic Reassimilation: Terror Jelly
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189443 },	-- Schematic: Terror Jelly
					["coord"] = { 67.2, 32.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(364695),	-- Terror Jelly
					},
				}),
				q(65361, {	-- Schematic Reassimilation: Tunneling Vombata
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189448 },	-- Schematic: Tunneling Vombata
					["coord"] = { 74.7, 50.5, 2028 },
					["groups"] = {
						recipe(364700),	-- Tunneling Vombata
					},
				}),
				q(65334, {	-- Schematic Reassimilation: Violent Poultrid
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189436 },	-- Schematic: Violent Poultrid
					["groups"] = {
						recipe(364687),	-- Violent Poultrid
					},
				}),
				q(65360, {	-- Schematic Reassimilation: Viperid Menace
					["sourceQuests"] = { 65419 },	-- Protoform Synthesis
					["provider"] = { "i", 189447 },	-- Schematic: Viperid Menace
					["coord"] = { 58.9, 77.0, ZERETH_MORTIS },
					["groups"] = {
						recipe(364699),	-- Viperid Menace
					},
				}),
				-- Mounts
				q(65401, {	-- Schematic Reassimilation: Adorned Vombata
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189478 },	-- Schematic: Adorned Vombata
					["coord"] = { 37.2, 78.2, ZERETH_MORTIS },
					["groups"] = {
						recipe(365068),	-- Adorned Vombata
					},
				}),
				q(65385, {	-- Schematic Reassimilation: Bronze Helicid
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189462 },	-- Schematic: Bronze Helicid
					["groups"] = {
						recipe(365073),	-- Bronze Helicid
					},
				}),
				q(65396, {	-- Schematic Reassimilation: Bronzewing Vespoid
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189473 },	-- Schematic: Bronzewing Vespoid
					["coord"] = { 48.8, 40.3, ZERETH_MORTIS },
					["groups"] = {
						recipe(365047),	-- Bronzewing Vespoid
					},
				}),
				q(65397, {	-- Schematic Reassimilation: Buzz
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189474 },	-- Schematic: Buzz
					["groups"] = {
						recipe(365048),	-- Buzz
					},
				}),
				q(65399, {	-- Schematic Reassimilation: Curious Crystalsniffer
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189476 },	-- Schematic: Curious Crystalsniffer
					["groups"] = {
						recipe(365064),	-- Curious Crystalsniffer
					},
				}),
				q(65400, {	-- Schematic Reassimilation: Darkened Vombata
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189477 },	-- Schematic: Darkened Vombata
					["coord"] = { 64.2, 35.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(365065),	-- Darkened Vombata
					},
				}),
				q(65380, {	-- Schematic Reassimilation: Deathrunner
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189457 },	-- Schematic: Deathrunner
					["coord"] = { 70.2, 28.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(365045),	-- Deathrunner
					},
				}),
				q(65381, {	-- Schematic Reassimilation: Desertwing Hunter
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189458 },	-- Schematic: Desertwing Hunter
					["coord"] = { 62.0, 43.5, ZERETH_MORTIS },
					["groups"] = {
						recipe(365050),	-- Desertwing Hunter
					},
				}),
				q(65398, {	-- Schematic Reassimilation: Forged Spiteflyer
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189475 },	-- Schematic: Forged Spiteflyer
					["coord"] = { 53.3, 25.7, ZERETH_MORTIS },
					["groups"] = {
						recipe(365049),	-- Forged Spiteflyer
					},
				}),
				q(65388, {	-- Schematic Reassimilation: Genesis Crawler
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189465 },	-- Schematic: Genesis Crawler
					["coord"] = { 31.5, 50.3, ZERETH_MORTIS },
					["groups"] = {
						recipe(365055),	-- Genesis Crawler
					},
				}),
				q(65391, {	-- Schematic Reassimilation: Goldplate Bufonid
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189468 },	-- Schematic: Goldplate Bufonid
					["groups"] = {
						recipe(365058),	-- Goldplate Bufonid
					},
				}),
				q(65680, {	-- Schematic Reassimilation: Heartbond Lupine
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 190585 },	-- Schematic: Heartbond Lupine
					["coord"] = { 52.8, 63.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(367704),	-- Heartbond Lupine
					},
				}),
				q(65390, {	-- Schematic Reassimilation: Ineffable Skitterer
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189467 },	-- Schematic: Ineffable Skitterer
					["groups"] = {
						recipe(365057),	-- Ineffable Skitterer
					},
				}),
				q(65382, {	-- Schematic Reassimilation: Mawdapted Raptora
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189459 },	-- Schematic: Mawdapted Raptora
					["groups"] = {
						recipe(365051),	-- Mawdapted Raptora
					},
				}),
				q(65375, {	-- Schematic Reassimilation: Pale Regal Cervid
					["provider"] = { "i", 189455 },	-- Schematic: Pale Regal Cervid
					["timeline"] = { ADDED_11_0_2 },	-- Added few years later as a fix for not auto-receiving the recipe
					-- #if BEFORE 11.0.7
					-- Quest item is now buyable from the vendor after 11.0.7
					["lockCriteria"] = { 1,
						"spellID", 365040,	-- Pale Regal Cervid (RECIPE!)
						"achID", 15402,	-- Cyphers of the First Ones
					},
					-- #endif
					["groups"] = {
						recipe(365040),	-- Pale Regal Cervid
					},
				}),
				q(65393, {	-- Schematic Reassimilation: Prototype Leaper
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189469 },	-- Schematic: Prototype Leaper
					["coord"] = { 67.0, 69.4, ZERETH_MORTIS },
					["groups"] = {
						recipe(365062),	-- Prototype Leaper
					},
				}),
				q(65383, {	-- Schematic Reassimilation: Raptora Swooper
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189460 },	-- Schematic: Raptora Swooper
					["coord"] = { 67.4, 40.2, ZERETH_MORTIS },
					["groups"] = {
						recipe(365052),	-- Raptora Swooper
					},
				}),
				q(65394, {	-- Schematic Reassimilation: Russet Bufonid
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189471 },	-- Schematic: Russet Bufonid
					["groups"] = {
						recipe(365063),	-- Russet Bufonid
					},
				}),
				q(65387, {	-- Schematic Reassimilation: Scarlet Helicid
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189464 },	-- Schematic: Scarlet Helicid
					["coord"] = { 47.7, 9.6, ZERETH_MORTIS },
					["groups"] = {
						recipe(365076),	-- Scarlet Helicid
					},
				}),
				q(65384	, {	-- Schematic Reassimilation: Serenade
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189461 },	-- Schematic: Serenade
					["groups"] = {
						recipe(365072),	-- Serenade
					},
				}),
				q(65379, {	-- Schematic Reassimilation: Sundered Zerethsteed
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189456 },	-- Schematic: Sundered Zerethsteed
					["coord"] = { 60.6, 30.5, ZERETH_MORTIS },
					["groups"] = {
						recipe(365042),	-- Sundered Zerethsteed
					},
				}),
				q(65389, {	-- Schematic Reassimilation: Tarachnid Creeper
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189466 },	-- Schematic: Tarachnid Creeper
					["coord"] = { 62.9, 22.0, ZERETH_MORTIS },
					["groups"] = {
						recipe(365056),	-- Tarachnid Creeper
					},
				}),
				q(65386	, {	-- Schematic Reassimilation: Unsuccessful Prototype Fleetpod
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189463 },	-- Schematic: Unsuccessful Prototype Fleetpod
					-- ["coord"] = { , , ZERETH_MORTIS },
					["groups"] = {
						recipe(365074),	-- Unsuccessful Prototype Fleetpod
					},
				}),
				q(65395, {	-- Schematic Reassimilation: Vespoid Flutterer
					["sourceQuests"] = { 65427 },	-- A New Architect
					["provider"] = { "i", 189472 },	-- Schematic: Vespoid Flutterer
					["coord"] = { 50.3, 27.1, ZERETH_MORTIS },
					["groups"] = {
						recipe(365046),	-- Vespoid Flutterer
					},
				}),
			}),
			n(TREASURES, {
				o(375391, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Hidden atop the ramp.",
						constant = "HIDDEN_ATOP_THE_RAMP",
						export = true,
						text = {
							en = "Hidden atop the ramp.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "隐藏在坡道顶部。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 48.93, 40.47, 2029 },
					["groups"] = {
						i(189473),	-- Schematic: Bronzewing Vespoid
					},
				}),
				o(375388, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Inside the top cage.",
						constant = "INSIDE_THE_TOP_CAGE",
						export = true,
						text = {
							en = "Inside the top cage.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在最上面的笼子里。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 64.2, 35.6, ZERETH_MORTIS },
					["groups"] = {
						i(189477),	-- Schematic: Darkened Vombata
					},
				}),
				o(375393, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "On top a pillar. Need door of shadows/flying.",
						constant = "ON_TOP_A_PILLAR_NEED_DOOR_OF_SHADOWS_FLYING",
						export = true,
						text = {
							en = "On top a pillar. Need door of shadows/flying.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在一根柱子顶部。需要暗影之门/飞行。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 62.0, 43.5, ZERETH_MORTIS },
					["groups"] = {
						i(189458),	-- Schematic: Desertwing Hunter
					},
				}),
				o(375748, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Under the platform.",
						constant = "UNDER_THE_PLATFORM",
						export = true,
						text = {
							en = "Under the platform.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在平台下方。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 61.2, 42.6, ZERETH_MORTIS },
					["groups"] = {
						i(189434),	-- Schematic: Fierce Scarabid
					},
				}),
				o(375389, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Inside the vespoid nest.",
						constant = "INSIDE_THE_VESPOID_NEST",
						export = true,
						text = {
							en = "Inside the vespoid nest.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在异种蜂巢穴内。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 62.0, 43.5, ZERETH_MORTIS },
					["groups"] = {
						i(189475),	-- Schematic: Forged Spiteflyer
					},
				}),
				o(375694, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "On top of the build and behind a pillar.",
						constant = "ON_TOP_OF_THE_BUILD_AND_BEHIND_A_PILLAR",
						export = true,
						text = {
							en = "On top of the build and behind a pillar.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在建筑顶部、一根柱子后面。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 31.5, 50.3, ZERETH_MORTIS },
					["groups"] = {
						i(189465),	-- Schematic: Genesis Crawler
					},
				}),
				o(375900, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Inside a Cave.",
						constant = "INSIDE_A_CAVE",
						export = true,
						text = {
							en = "Inside a Cave.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在一个洞穴内。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 53.8, 72.5, ZERETH_MORTIS },
					["groups"] = {
						i(189435),	-- Schematic: Multichicken
					},
				}),
				o(375383, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "On top of the tree circle.",
						constant = "ON_TOP_OF_THE_TREE_CIRCLE",
						export = true,
						text = {
							en = "On top of the tree circle.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在环形树顶上。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 58.3, 74.3, ZERETH_MORTIS },
					["groups"] = {
						i(189444),	-- Schematic: Leaping Leporid
					},
				}),
				o(375498, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Mount or stand at precisely 52.3, 75.3. Behind the chain. Hard to spot.",
						constant = "MOUNT_OR_STAND_AT_PRECISELY_52_3_75_3_BEHIND",
						export = true,
						text = {
							en = "Mount or stand at precisely 52.3, 75.3. Behind the chain. Hard to spot.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "骑乘坐骑或精确站在 52.3, 75.3 处。在锁链后面。很难发现。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 52.3, 75.4, ZERETH_MORTIS },
					["groups"] = {
						i(189442),	-- Schematic: Prototickles
					},
				}),
				o(375903, {	-- Protoform Schematic
					["coord"] = { 67.0, 69.4, ZERETH_MORTIS },
					["groups"] = {
						i(189469),	-- Schematic: Prototype Leaper
					},
				}),
				o(375371, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Inside the building.",
						constant = "INSIDE_THE_BUILDING",
						export = true,
						text = {
							en = "Inside the building.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在建筑内部。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 67.4, 40.2, ZERETH_MORTIS },
					["groups"] = {
						i(189460),	-- Schematic: Raptora Swooper
					},
				}),
				o(375486, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "This can only be reached with help of Warlock/Door of Shadows/Dimensional Translators/Firey Brimstone (Toy).",
						constant = "THIS_CAN_ONLY_BE_REACHED_WITH_HELP_OF_WARLOCK",
						export = true,
						text = {
							en = "This can only be reached with help of Warlock/Door of Shadows/Dimensional Translators/Firey Brimstone (Toy).",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "只有在术士/暗影之门/空间传送器/炽热硫磺（玩具）的帮助下才能到达这里。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 57.9, 78.0, ZERETH_MORTIS },
					["groups"] = {
						i(189446),	-- Schematic: Shelly
					},
				}),
				o(375889, {	-- Protoform Schematic
					["coord"] = { 60.6, 30.5, ZERETH_MORTIS },
					["groups"] = {
						i(189456),	-- Schematic: Sundered Zerethsteed
					},
				}),
				o(375370, {	-- Protoform Schematic
					["description"] = "~L.INSIDE_THE_BUILDING",
					["coord"] = { 62.9, 22.0, ZERETH_MORTIS },
					["groups"] = {
						i(189466),	-- Schematic: Tarachnid Creeper
					},
				}),
				o(375387, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "On top of the pillar.",
						constant = "ON_TOP_OF_THE_PILLAR",
						export = true,
						text = {
							en = "On top of the pillar.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在柱子顶部。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 67.2, 32.6, ZERETH_MORTIS },
					["groups"] = {
						i(189443),	-- Schematic: Terror Jelly
					},
				}),
				o(375693, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Inside Locarian Esper, next to the rumble.",
						constant = "INSIDE_LOCARIAN_ESPER_NEXT_TO_THE_RUMBLE",
						export = true,
						text = {
							en = "Inside Locarian Esper, next to the rumble.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在洛卡里安·埃斯珀内，轰鸣声旁边。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 74.7, 50.5, 2028 },
					["groups"] = {
						i(189448),	-- Schematic: Tunneling Vombata
					},
				}),
				o(375390, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "On one of the first locus platforms in the sand.",
						constant = "ON_ONE_OF_THE_FIRST_LOCUS_PLATFORMS_IN_THE_SAND",
						export = true,
						text = {
							en = "On one of the first locus platforms in the sand.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在沙地中最初的几个节点平台之一上。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 50.3, 27.1, ZERETH_MORTIS },
					["groups"] = {
						i(189472),	-- Schematic: Vespoid Flutterer
					},
				}),
				o(375479, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Underwater left to Ancient Bufonid",
						constant = "UNDERWATER_LEFT_TO_ANCIENT_BUFONID",
						export = true,
						text = {
							en = "Underwater left to Ancient Bufonid",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在水下，上古蟾蜍人的左侧。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 78.1, 53.1, ZERETH_MORTIS },
					["groups"] = {
						i(189418),	-- Schematic: Ambystan Darter
					},
				}),
				o(375981, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Atop the arch.",
						constant = "ATOP_THE_ARCH",
						export = true,
						text = {
							en = "Atop the arch.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "在拱门顶部。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 47.7, 9.6, ZERETH_MORTIS },
					["groups"] = {
						i(189464),	-- Schematic: Scarlet Helicid
					},
				}),
				o(375502, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Hidden in tree leaves, on branch with small orb above water.",
						constant = "HIDDEN_IN_TREE_LEAVES_ON_BRANCH_WITH_SMALL_ORB",
						export = true,
						text = {
							en = "Hidden in tree leaves, on branch with small orb above water.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "隐藏在树叶中，位于水面上方带有小球的树枝上。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 28.1, 50.0, ZERETH_MORTIS },
					["groups"] = {
						i(189445),	-- Schematic: Microlicid
					},
				}),
				o(375270, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Requires Aealic Understanding and Chapter 6.\nUnlock Rondure Locus Arrangement at 50.5, 27.6 (close to Tertius Locus).\nGather 60 Cosmic energy and go to Interior Locus then use Arcae Locus to Rondure Alcove.\n\nHidden behind the top of the door frame near a large orb.\nDisappears when looted by another player recently.",
						constant = "REQUIRES_AEALIC_UNDERSTANDING_AND_CHAPTER_6",
						export = true,
						text = {
							en = "Requires Aealic Understanding and Chapter 6.\nUnlock Rondure Locus Arrangement at 50.5, 27.6 (close to Tertius Locus).\nGather 60 Cosmic energy and go to Interior Locus then use Arcae Locus to Rondure Alcove.\n\nHidden behind the top of the door frame near a large orb.\nDisappears when looted by another player recently.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要埃阿利克理解和第 6 章。\n在 50.5, 27.6 处（靠近特提乌斯节点）解锁圆弧节点布局。\n收集 60 点宇宙能量，前往内部节点，然后使用奥秘节点前往圆弧壁龛。\n\n隐藏在一道门框顶部附近、一个大球体旁。\n最近被其他玩家拾取后会消失。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 42.8, 40.6, 2029 },
					["groups"] = {
						i(189440),	-- Schematic: Omnipotential Core
					},
				}),
				o(375746, {	-- Protoform Schematic
					["description"] = createLocalizationString({
						readable = "Requires Sopranian Understanding and Chapter 6.\nUnlock Camber Locus Arrangement at 47.7 34.5, on the back side of the Vessel's room (accessible from flying or via the Ultimus Locus).\nGather 60 Cosmic energy and go to Interior Locus then use Arcae Locus to Camber Alcove.\n\nSuccefully completing this minigame will reward a schematic.",
						constant = "REQUIRES_SOPRANIAN_UNDERSTANDING_AND_CHAPTER_6",
						export = true,
						text = {
							en = "Requires Sopranian Understanding and Chapter 6.\nUnlock Camber Locus Arrangement at 47.7 34.5, on the back side of the Vessel's room (accessible from flying or via the Ultimus Locus).\nGather 60 Cosmic energy and go to Interior Locus then use Arcae Locus to Camber Alcove.\n\nSuccefully completing this minigame will reward a schematic.",
							-- TODO: de = "",
							-- TODO: es = "",
							-- TODO: mx = "",
							-- TODO: fr = "",
							-- TODO: it = "",
							-- TODO: ko = "",
							-- TODO: pt = "",
							-- TODO: ru = "",
							cn = "需要索普拉尼之悟和第六章。\n在 47.7 34.5 处解锁拱弧节点布局，位于容器房间的背面（可通过飞行或经由终末节点抵达）。\n收集 60 点宇宙能量并前往内部节点，然后使用秘匣节点前往拱弧壁龛。\n\n成功完成这个小游戏会奖励一张图纸。",
							-- TODO: tw = "",
						},
					}),
					["coord"] = { 49.0, 73.1, 2029 },
					["questID"] = 65651,
					["groups"] = {
						i(189463),	-- Schematic: Unsuccessful Prototype Fleetpod
					},
				}),
			}),
			n(VENDORS, {
				n(181135, {	-- Servitor Interface
					["coord"] = { 70.2, 28.6, ZERETH_MORTIS },
					["groups"] = {
						i(189455, {	-- Schematic: Pale Regal Cervid
							["sourceAchievement"] = 15402,	-- Cyphers of the First Ones
							["timeline"] = { ADDED_11_0_7 },
						}),
					},
				}),
			}),
			n(CRAFTABLES, {
				filter(BATTLE_PETS, {
					i(189363, {	-- Ambystan Darter (PET!)
						["_cost"] = {
							{ "i", GENESIS, 250 },
							{ "i", AMBYSTAN_LATTICE, 1 },
							{ "i", 189160, 1 },	-- 1x Glimmer of Focus
						},
					}),
					i(189369, {	-- Archetype of Animation (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", GEOMENTAL_LATTICE, 1 },
							{ "i", 189157, 1 },	-- 1x Glimmer of Animation
						},
					}),
					i(189380, {	-- Archetype of Cunning (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", VIPERID_LATTICE, 1 },
							{ "i", 189158, 1 },	-- 1x Glimmer of Cunning
						},
					}),
					i(187795, {	-- Archetype of Discovery (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", VOMBATA_LATTICE, 1 },
							{ "i", 189159, 1 },	-- 1x Glimmer of Discovery
						},
					}),
					i(187713, {	-- Archetype of Focus (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", UNFORMED_LATTICE, 1 },
							{ "i", 189160, 1 },	-- 1x Glimmer of Focus
						},
					}),
					i(189383, {	-- Archetype of Malice (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", VESPOID_LATTICE, 1 },
							{ "i", 189161, 1 },	-- 1x Glimmer of Malice
						},
					}),
					i(187928, {	-- Archetype of Metamorphosis (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", AMBYSTAN_LATTICE, 1 },
							{ "i", 189162, 1 },	-- 1x Glimmer of Metamorphosis
						},
					}),
					i(187803, {	-- Archetype of Motion (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", PROTO_AVIAN_LATTICE, 1 },
							{ "i", 189163, 1 },	-- 1x Glimmer of Motion
						},
					}),
					i(189375, {	-- Archetype of Multiplicity (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", LEPROID_LATTICE, 1 },
							{ "i", 189164, 1 },	-- 1x Glimmer of Multiplicity
						},
					}),
					i(189381, {	-- Archetype of Predation (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", TARRACHNID_LATTICE, 1 },
							{ "i", 189165, 1 },	-- 1x Glimmer of Predation
						},
					}),
					i(189371, {	-- Archetype of Renewal (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", AURELID_LATTICE, 1 },
							{ "i", 189166, 1 },	-- 1x Glimmer of Renewal
						},
					}),
					i(189367, {	-- Archetype of Satisfaction (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", POULTRID_LATTICE, 1 },
							{ "i", 189167, 1 },	-- 1x Glimmer of Satisfaction
						},
					}),
					i(189382, {	-- Archetype of Serenity (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", BUFONID_LATTICE, 1 },
							{ "i", 189168, 1 },	-- 1x Glimmer of Serenity
						},
					}),
					i(189364, {	-- Archetype of Survival (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", SCARABID_LATTICE, 1 },
							{ "i", 189169, 1 },	-- 1x Glimmer of Survival
						},
					}),
					i(189377, {	-- Archetype of Vigilance (PET!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189170, 1 },	-- 1x Glimmer of Vigilance
						},
					}),
					i(189365, {	-- Fierce Scarabid (PET!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", SCARABID_LATTICE, 1 },
							{ "i", 189163, 1 },	-- 1x Glimmer of Motion
						},
					}),
					i(189374, {	-- Leaping Leporid (PET!)
						["_cost"] = {
							{ "i", GENESIS, 250 },
							{ "i", LEPROID_LATTICE, 1 },
							{ "i", 189166, 1 },	-- 1x Glimmer of Renewal
						},
					}),
					i(189376, {	-- Microlicid (PET!)
						["_cost"] = {
							{ "i", GENESIS, 150 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189167, 1 },	-- 1x Glimmer of Satisfaction
						},
					}),
					i(189368, {	-- Multichicken (PET!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", POULTRID_LATTICE, 1 },
							{ "i", 189164, 1 },	-- 1x Glimmer of Multiplicity
						},
					}),
					i(187734, {	-- Omnipotential Core (PET!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", UNFORMED_LATTICE, 1 },
							{ "i", 189157, 1 },	-- 1x Glimmer of Animation
						},
					}),
					i(189373, {	-- Prototickles (PET!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", AURELID_LATTICE, 1 },
							{ "i", 189159, 1 },	-- 1x Glimmer of Discovery
						},
					}),
					i(187733, {	-- Resonant Echo (PET!)
						["_cost"] = {
							{ "i", GENESIS, 250 },
							{ "i", UNFORMED_LATTICE, 1 },
							{ "i", 189169, 1 },	-- 1x Glimmer of Survival
						},
					}),
					i(189378, {	-- Shelly (PET!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189168, 1 },	-- 1x Glimmer of Serenity
						},
					}),
					i(189370, {	-- Stabilized Geomental (PET!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", GEOMENTAL_LATTICE, 1 },
							{ "i", 189162, 1 },	-- 1x Glimmer of Metamorphosis
						},
					}),
					i(189372, {	-- Terror Jelly (PET!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", AURELID_LATTICE, 1 },
							{ "i", 189165, 1 },	-- 1x Glimmer of Predation
						},
					}),
					i(187798, {	-- Tunneling Vombata (PET!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", VOMBATA_LATTICE, 1 },
							{ "i", 189158, 1 },	-- 1x Glimmer of Cunning
						},
					}),
					i(189366, {	-- Violent Poultrid (PET!)
						["_cost"] = {
							{ "i", GENESIS, 200 },
							{ "i", POULTRID_LATTICE, 1 },
							{ "i", 189161, 1 },	-- 1x Glimmer of Malice
						},
					}),
					i(189379, {	-- Viperid Menace (PET!)
						["_cost"] = {
							{ "i", GENESIS, 150 },
							{ "i", VIPERID_LATTICE, 1 },
							{ "i", 189170, 1 },	-- 1x Glimmer of Vigilance
						},
					}),
				}),
				filter(MOUNTS, {
					i(187632, {	-- Adorned Vombata (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", VOMBATA_LATTICE, 1 },
							{ "i", 189174, 1 },	-- 1x Lens of Focused Intention
						},
					}),
					i(187670, {	-- Bronze Helicid (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189179, 1 },	-- 1x Unalloyed Bronze Ingot
						},
					}),
					i(187663, {	-- Bronzewing Vespoid (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", VESPOID_LATTICE, 1 },
							{ "i", 189179, 1 },	-- 1x Unalloyed Bronze Ingot
						},
					}),
					i(187665, {	-- Buzz (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 500 },
							{ "i", VESPOID_LATTICE, 1 },
							{ "i", 189176, 1 },	-- 1x Protoform Sentience Crown
						},
					}),
					i(187630, {	-- Curious Crystalsniffer (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", VOMBATA_LATTICE, 1 },
							{ "i", 189172, 1 },	-- 1x Crystallized Echo of the First Song
						},
					}),
					i(187631, {	-- Darkened Vombata (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", VOMBATA_LATTICE, 1 },
							{ "i", 189175, 1 },	-- 1x Mawforged Bridle
						},
					}),
					i(187638, {	-- Deathrunner (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", CREVID_LATTICE, 1 },
							{ "i", 189178, 1 },	-- 1x Tools of Incomprehensible Experimentation
						},
					}),
					i(187666, {	-- Desertwing Hunter (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", RAPTORA_LATTICE, 1 },
							{ "i", 189180, 1 },	-- 1x Wind's Infinite Call
						},
					}),
					i(187664, {	-- Forged Spiteflyer (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", VESPOID_LATTICE, 1 },
							{ "i", 189173, 1 },	-- 1x Eternal Ragepearl
						},
					}),
					i(187677, {	-- Genesis Crawler (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", TARRACHNID_LATTICE, 1 },
							{ "i", 189171, 1 },	-- 1x Bauble of Pure Innovation
						},
					}),
					i(187683, {	-- Goldplate Bufonid (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", BUFONID_LATTICE, 1 },
							{ "i", 189171, 1 },	-- 1x Bauble of Pure Innovation
						},
					}),
					i(190580, {	-- Heartbond Lupine (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 500 },
							{ "i", LUPINE_LATTICE, 1 },
							{ "i", 189172, 1 },	-- 1x Crystallized Echo of the First Song
						},
					}),
					i(187679, {	-- Ineffable Skitterer (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 500 },
							{ "i", TARRACHNID_LATTICE, 1 },
							{ "i", 189176, 1 },	-- 1x Protoform Sentience Crown
						},
					}),
					i(187667, {	-- Mawdapted Raptora (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", RAPTORA_LATTICE, 1 },
							{ "i", 189175, 1 },	-- 1x Mawforged Bridle
						},
					}),
					i(187639, {	-- Pale Regal Cervid (MOUNT!)
						["_cost"] = {
								{ "i", GENESIS, 400 },
								{ "i", CREVID_LATTICE, 1 },
								{ "i", 189176, 1 },	-- 1x Protoform Sentience Crown
							},
					}),
					i(188809, {	-- Prototype Leaper (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", BUFONID_LATTICE, 1 },
							{ "i", 189178, 1 },	-- 1x Tools of Incomprehensible Experimentation
						},
					}),
					i(187668, {	-- Raptora Swooper (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", RAPTORA_LATTICE, 1 },
							{ "i", 189173, 1 },	-- 1x Eternal Ragepearl
						},
					}),
					i(188810, {	-- Russet Bufonid (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", BUFONID_LATTICE, 1 },
							{ "i", 189174, 1 },	-- 1x Lens of Focused Intention
						},
					}),
					i(187641, {	-- Sundered Zerethsteed (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", CREVID_LATTICE, 1 },
							{ "i", 189175, 1 },	-- 1x Mawforged Bridle
						},
					}),
					i(187669, {	-- Serenade (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 500 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189172, 1 },	-- 1x Crystallized Echo of the First Song
						},
					}),
					i(187672, {	-- Scarlet Helicid (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 350 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189177, 1 },	-- 1x Revelation Key
						},
					}),
					i(187678, {	-- Tarachnid Creeper (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 450 },
							{ "i", TARRACHNID_LATTICE, 1 },
							{ "i", 189177, 1 },	-- 1x Revelation Key
						},
					}),
					i(187671, {	-- Unsuccessful Prototype Fleetpod (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 300 },
							{ "i", HELICID_LATTICE, 1 },
							{ "i", 189178, 1 },	-- 1x Tools of Incomprehensible Experimentation
						},
					}),
					i(187660, {	-- Vespoid Flutterer (MOUNT!)
						["_cost"] = {
							{ "i", GENESIS, 400 },
							{ "i", VESPOID_LATTICE, 1 },
							{ "i", 189180, 1 },	-- 1x Wind's Infinite Call
						},
					}),
				}),
			}),
		}),
	}),
})));
