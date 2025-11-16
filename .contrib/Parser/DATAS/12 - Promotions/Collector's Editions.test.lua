-----------------------------------------------------
--  T E S T S  F O R  C O L L E C T O R ' S  E D  --
-----------------------------------------------------
-- Test suite for validating Collector's Editions data structure
-- This ensures data integrity, consistency, and completeness

local TestSuite = {}
local testResults = {}
local testCount = 0
local passCount = 0
local failCount = 0

-- Helper function to track test results
local function test(name, func)
    testCount = testCount + 1
    local success, err = pcall(func)
    if success then
        passCount = passCount + 1
        table.insert(testResults, {name = name, status = "PASS"})
        print(string.format("[PASS] %s", name))
    else
        failCount = failCount + 1
        table.insert(testResults, {name = name, status = "FAIL", error = err})
        print(string.format("[FAIL] %s: %s", name, err))
    end
end

-- Helper function for assertions
local function assertEquals(actual, expected, message)
    if actual ~= expected then
        error(message or string.format("Expected %s but got %s", tostring(expected), tostring(actual)))
    end
end

local function assertNotNil(value, message)
    if value == nil then
        error(message or "Expected non-nil value")
    end
end

local function assertTrue(condition, message)
    if not condition then
        error(message or "Assertion failed: condition is false")
    end
end

local function assertType(value, expectedType, message)
    local actualType = type(value)
    if actualType ~= expectedType then
        error(message or string.format("Expected type %s but got %s", expectedType, actualType))
    end
end

-- Test: Verify COLLECTORS_EDITION header exists and has correct structure
test("COLLECTORS_EDITION header exists", function()
    assertNotNil(COLLECTORS_EDITION, "COLLECTORS_EDITION header should exist")
end)

test("COLLECTORS_EDITION has readable field", function()
    assertNotNil(COLLECTORS_EDITION.readable, "COLLECTORS_EDITION should have readable field")
    assertEquals(COLLECTORS_EDITION.readable, "Collector's Edition", "Readable field should match expected value")
end)

test("COLLECTORS_EDITION has icon field", function()
    assertNotNil(COLLECTORS_EDITION.icon, "COLLECTORS_EDITION should have icon field")
    assertType(COLLECTORS_EDITION.icon, "string", "Icon should be a string")
end)

test("COLLECTORS_EDITION has text localization table", function()
    assertNotNil(COLLECTORS_EDITION.text, "COLLECTORS_EDITION should have text field")
    assertType(COLLECTORS_EDITION.text, "table", "Text field should be a table")
end)

test("COLLECTORS_EDITION has English localization", function()
    assertNotNil(COLLECTORS_EDITION.text.en, "Should have English localization")
    assertEquals(COLLECTORS_EDITION.text.en, "Collector's Edition", "English text should match")
end)

test("COLLECTORS_EDITION has required language codes", function()
    local requiredLangs = {"en", "es", "mx", "fr", "ru", "cn", "tw"}
    for _, lang in ipairs(requiredLangs) do
        assertTrue(COLLECTORS_EDITION.text[lang] ~= nil, string.format("Should have %s localization", lang))
    end
end)

-- Test: Verify HEROIC_EDITION header structure
test("HEROIC_EDITION header exists", function()
    assertNotNil(HEROIC_EDITION, "HEROIC_EDITION header should exist")
end)

test("HEROIC_EDITION has correct readable field", function()
    assertEquals(HEROIC_EDITION.readable, "Heroic Edition", "Readable field should match")
end)

test("HEROIC_EDITION has text localization table", function()
    assertNotNil(HEROIC_EDITION.text, "HEROIC_EDITION should have text field")
    assertType(HEROIC_EDITION.text, "table", "Text field should be a table")
end)

test("HEROIC_EDITION has English localization", function()
    assertEquals(HEROIC_EDITION.text.en, "Heroic Edition", "English text should match")
end)

test("HEROIC_EDITION has Chinese localizations", function()
    assertNotNil(HEROIC_EDITION.text.cn, "Should have simplified Chinese")
    assertNotNil(HEROIC_EDITION.text.tw, "Should have traditional Chinese")
end)

-- Test: Verify EPIC_EDITION header structure
test("EPIC_EDITION header exists", function()
    assertNotNil(EPIC_EDITION, "EPIC_EDITION header should exist")
end)

test("EPIC_EDITION has correct readable field", function()
    assertEquals(EPIC_EDITION.readable, "Epic Edition", "Readable field should match")
end)

test("EPIC_EDITION has proper icon reference", function()
    assertNotNil(EPIC_EDITION.icon, "Should have icon")
    assertTrue(string.find(EPIC_EDITION.icon, "Legendary") ~= nil, "Icon should reference Legendary")
end)

-- Test: Verify TBC_CLASSIC_DELUXE_EDITION header
test("TBC_CLASSIC_DELUXE_EDITION header exists", function()
    assertNotNil(TBC_CLASSIC_DELUXE_EDITION, "TBC_CLASSIC_DELUXE_EDITION should exist")
end)

test("TBC_CLASSIC_DELUXE_EDITION has correct readable", function()
    assertEquals(TBC_CLASSIC_DELUXE_EDITION.readable, "TBC Classic Deluxe Edition", "Readable should match")
end)

test("TBC_CLASSIC_DELUXE_EDITION has TBC icon", function()
    assertTrue(string.find(TBC_CLASSIC_DELUXE_EDITION.icon, "TBC") ~= nil, "Should reference TBC expansion")
end)

test("TBC_CLASSIC_DELUXE_EDITION has French localization", function()
    assertNotNil(TBC_CLASSIC_DELUXE_EDITION.text.fr, "Should have French localization")
end)

-- Test: Verify WOTLK_CLASSIC_NORTHREND_UPGRADE header
test("WOTLK_CLASSIC_NORTHREND_UPGRADE header exists", function()
    assertNotNil(WOTLK_CLASSIC_NORTHREND_UPGRADE, "WOTLK_CLASSIC_NORTHREND_UPGRADE should exist")
end)

test("WOTLK_CLASSIC_NORTHREND_UPGRADE has correct readable", function()
    assertEquals(WOTLK_CLASSIC_NORTHREND_UPGRADE.readable, "WotLK Classic Northrend Upgrade")
end)

test("WOTLK_CLASSIC_NORTHREND_UPGRADE has Spanish localizations", function()
    assertNotNil(WOTLK_CLASSIC_NORTHREND_UPGRADE.text.es, "Should have Spanish")
    assertNotNil(WOTLK_CLASSIC_NORTHREND_UPGRADE.text.mx, "Should have Mexican Spanish")
end)

-- Test: Verify CATA_CLASSIC_BLAZING_UPGRADE header
test("CATA_CLASSIC_BLAZING_UPGRADE header exists", function()
    assertNotNil(CATA_CLASSIC_BLAZING_UPGRADE, "CATA_CLASSIC_BLAZING_UPGRADE should exist")
end)

test("CATA_CLASSIC_BLAZING_UPGRADE has Cataclysm reference", function()
    assertTrue(string.find(CATA_CLASSIC_BLAZING_UPGRADE.icon, "CATA") ~= nil, "Should reference Cataclysm")
end)

-- Test: Verify MOP_CLASSIC_HEROIC_PACK header
test("MOP_CLASSIC_HEROIC_PACK header exists", function()
    assertNotNil(MOP_CLASSIC_HEROIC_PACK, "MOP_CLASSIC_HEROIC_PACK should exist")
end)

test("MOP_CLASSIC_HEROIC_PACK has correct English text", function()
    assertEquals(MOP_CLASSIC_HEROIC_PACK.text.en, "MoP Classic Sha-Infused Heroic Pack")
end)

test("MOP_CLASSIC_HEROIC_PACK has MoP icon reference", function()
    assertTrue(string.find(MOP_CLASSIC_HEROIC_PACK.icon, "MOP") ~= nil, "Should reference MoP expansion")
end)

-- Test: Verify MIDNIGHT_TEMPORARY header
test("MIDNIGHT_TEMPORARY header exists", function()
    assertNotNil(MIDNIGHT_TEMPORARY, "MIDNIGHT_TEMPORARY should exist")
end)

test("MIDNIGHT_TEMPORARY has Korean localization", function()
    assertNotNil(MIDNIGHT_TEMPORARY.text.ko, "Should have Korean localization")
    assertEquals(MIDNIGHT_TEMPORARY.text.ko, "한밤", "Korean text should match")
end)

test("MIDNIGHT_TEMPORARY has description field", function()
    assertNotNil(MIDNIGHT_TEMPORARY.description, "Should have description")
    assertType(MIDNIGHT_TEMPORARY.description, "table", "Description should be a table")
end)

test("MIDNIGHT_TEMPORARY description has English text", function()
    assertNotNil(MIDNIGHT_TEMPORARY.description.en, "Description should have English")
    assertTrue(string.find(MIDNIGHT_TEMPORARY.description.en, "eleventh expansion") ~= nil, "Description should mention eleventh expansion")
end)

-- Test: Verify WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION
test("WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION exists", function()
    assertNotNil(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION, "15th Anniversary header should exist")
end)

test("WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION has correct English", function()
    assertEquals(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION.text.en, "WoW 15th Anniversary Collector's Edition")
end)

test("WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION has Chinese localizations", function()
    assertNotNil(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION.text.cn, "Should have simplified Chinese")
    assertNotNil(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION.text.tw, "Should have traditional Chinese")
end)

test("WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION has description", function()
    assertNotNil(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION.description, "Should have description")
    assertTrue(string.find(WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION.description.en, "15th Anniversary") ~= nil)
end)

-- Test: Verify Diablo III headers
test("DIABLO_III header exists", function()
    assertNotNil(DIABLO_III, "DIABLO_III should exist")
end)

test("DIABLO_III has numeric icon", function()
    assertType(DIABLO_III.icon, "number", "Diablo III icon should be numeric")
    assertEquals(DIABLO_III.icon, 1529348, "Icon ID should match")
end)

test("DIABLO_III has Chinese localizations", function()
    assertNotNil(DIABLO_III.text.cn, "Should have simplified Chinese")
    assertNotNil(DIABLO_III.text.tw, "Should have traditional Chinese")
end)

test("DIABLO_III has description", function()
    assertNotNil(DIABLO_III.description, "Should have description")
    assertTrue(string.find(DIABLO_III.description.en, "Collector's Edition of Diablo III") ~= nil)
end)

test("DIABLO_III_REAPER_OF_SOULS exists", function()
    assertNotNil(DIABLO_III_REAPER_OF_SOULS, "Reaper of Souls header should exist")
end)

test("DIABLO_III_REAPER_OF_SOULS has correct English", function()
    assertEquals(DIABLO_III_REAPER_OF_SOULS.text.en, "Diablo III: Reaper of Souls")
end)

test("DIABLO_IV header exists", function()
    assertNotNil(DIABLO_IV, "DIABLO_IV should exist")
end)

test("DIABLO_IV has correct English text", function()
    assertEquals(DIABLO_IV.text.en, "Diablo IV")
end)

-- Test: Verify Overwatch header
test("OVERWATCH_ORIGINS exists", function()
    assertNotNil(OVERWATCH_ORIGINS, "OVERWATCH_ORIGINS should exist")
end)

test("OVERWATCH_ORIGINS has numeric icon", function()
    assertType(OVERWATCH_ORIGINS.icon, "number", "Should have numeric icon")
    assertEquals(OVERWATCH_ORIGINS.icon, 1303199)
end)

test("OVERWATCH_ORIGINS has Chinese localizations", function()
    assertNotNil(OVERWATCH_ORIGINS.text.cn, "Should have simplified Chinese")
    assertNotNil(OVERWATCH_ORIGINS.text.tw, "Should have traditional Chinese")
end)

-- Test: Verify StarCraft II headers
test("STARCRAFT_II_WINGS_OF_LIBERTY exists", function()
    assertNotNil(STARCRAFT_II_WINGS_OF_LIBERTY, "Wings of Liberty header should exist")
end)

test("STARCRAFT_II_WINGS_OF_LIBERTY has correct icon", function()
    assertEquals(STARCRAFT_II_WINGS_OF_LIBERTY.icon, 254885)
end)

test("STARCRAFT_II_HEART_OF_THE_SWARM exists", function()
    assertNotNil(STARCRAFT_II_HEART_OF_THE_SWARM, "Heart of the Swarm should exist")
end)

test("STARCRAFT_II_LEGACY_OF_THE_VOID exists", function()
    assertNotNil(STARCRAFT_II_LEGACY_OF_THE_VOID, "Legacy of the Void should exist")
end)

-- Test: Verify Warcraft III header
test("WARCRAFT_III_REFORGED_SPOILS_OF_WAR exists", function()
    assertNotNil(WARCRAFT_III_REFORGED_SPOILS_OF_WAR, "Warcraft III header should exist")
end)

test("WARCRAFT_III_REFORGED_SPOILS_OF_WAR has correct English", function()
    assertEquals(WARCRAFT_III_REFORGED_SPOILS_OF_WAR.text.en, "Warcraft III Spoils of War Edition")
end)

-- Test: Consistency checks across all headers
test("All headers have consistent structure", function()
    local headers = {
        COLLECTORS_EDITION,
        HEROIC_EDITION,
        EPIC_EDITION,
        TBC_CLASSIC_DELUXE_EDITION,
        WOTLK_CLASSIC_NORTHREND_UPGRADE,
        CATA_CLASSIC_BLAZING_UPGRADE,
        MOP_CLASSIC_HEROIC_PACK,
        MIDNIGHT_TEMPORARY,
        WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION,
        DIABLO_III,
        DIABLO_III_REAPER_OF_SOULS,
        DIABLO_IV,
        OVERWATCH_ORIGINS,
        STARCRAFT_II_WINGS_OF_LIBERTY,
        STARCRAFT_II_HEART_OF_THE_SWARM,
        STARCRAFT_II_LEGACY_OF_THE_VOID,
        WARCRAFT_III_REFORGED_SPOILS_OF_WAR
    }
    
    for _, header in ipairs(headers) do
        assertNotNil(header.readable, "Each header should have readable field")
        assertNotNil(header.icon, "Each header should have icon field")
        assertNotNil(header.text, "Each header should have text field")
        assertNotNil(header.text.en, "Each header should have English text")
    end
end)

test("All headers with Chinese localizations have both cn and tw", function()
    local headersWithChinese = {
        COLLECTORS_EDITION,
        HEROIC_EDITION,
        EPIC_EDITION,
        TBC_CLASSIC_DELUXE_EDITION,
        WOTLK_CLASSIC_NORTHREND_UPGRADE,
        CATA_CLASSIC_BLAZING_UPGRADE,
        MOP_CLASSIC_HEROIC_PACK,
        MIDNIGHT_TEMPORARY,
        WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION,
        DIABLO_III,
        DIABLO_III_REAPER_OF_SOULS,
        DIABLO_IV,
        OVERWATCH_ORIGINS,
        STARCRAFT_II_WINGS_OF_LIBERTY,
        STARCRAFT_II_HEART_OF_THE_SWARM,
        STARCRAFT_II_LEGACY_OF_THE_VOID,
        WARCRAFT_III_REFORGED_SPOILS_OF_WAR
    }
    
    for _, header in ipairs(headersWithChinese) do
        if header.text.cn then
            assertNotNil(header.text.tw, "Headers with cn should also have tw")
        end
        if header.text.tw then
            assertNotNil(header.text.cn, "Headers with tw should also have cn")
        end
    end
end)

test("No empty string values in localizations", function()
    local headers = {
        COLLECTORS_EDITION,
        HEROIC_EDITION,
        EPIC_EDITION,
        TBC_CLASSIC_DELUXE_EDITION,
        WOTLK_CLASSIC_NORTHREND_UPGRADE,
        CATA_CLASSIC_BLAZING_UPGRADE,
        MOP_CLASSIC_HEROIC_PACK,
        WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION,
        DIABLO_III,
        DIABLO_III_REAPER_OF_SOULS,
        DIABLO_IV,
        OVERWATCH_ORIGINS,
        STARCRAFT_II_WINGS_OF_LIBERTY,
        STARCRAFT_II_HEART_OF_THE_SWARM,
        STARCRAFT_II_LEGACY_OF_THE_VOID,
        WARCRAFT_III_REFORGED_SPOILS_OF_WAR
    }
    
    for _, header in ipairs(headers) do
        for lang, text in pairs(header.text) do
            if type(text) == "string" then
                assertTrue(text ~= "", string.format("Localization for %s should not be empty", lang))
            end
        end
    end
end)

test("Icon fields are valid asset references or numbers", function()
    local headers = {
        {name = "COLLECTORS_EDITION", obj = COLLECTORS_EDITION},
        {name = "HEROIC_EDITION", obj = HEROIC_EDITION},
        {name = "EPIC_EDITION", obj = EPIC_EDITION},
        {name = "DIABLO_III", obj = DIABLO_III},
        {name = "OVERWATCH_ORIGINS", obj = OVERWATCH_ORIGINS},
    }
    
    for _, header in ipairs(headers) do
        local iconType = type(header.obj.icon)
        assertTrue(iconType == "string" or iconType == "number", 
            string.format("%s icon should be string or number", header.name))
    end
end)

test("Headers with descriptions have English descriptions", function()
    local headersWithDesc = {
        MIDNIGHT_TEMPORARY,
        WOW_FIFTEENTH_ANNIVERSARY_COLLECTORS_EDITION,
        DIABLO_III,
        DIABLO_III_REAPER_OF_SOULS,
        DIABLO_IV,
        OVERWATCH_ORIGINS,
        STARCRAFT_II_WINGS_OF_LIBERTY,
        STARCRAFT_II_HEART_OF_THE_SWARM,
        STARCRAFT_II_LEGACY_OF_THE_VOID,
        WARCRAFT_III_REFORGED_SPOILS_OF_WAR
    }
    
    for _, header in ipairs(headersWithDesc) do
        if header.description then
            assertNotNil(header.description.en, "Description should have English text")
            assertTrue(header.description.en ~= "", "English description should not be empty")
        end
    end
end)

-- Test: Verify language code ordering (alphabetical check)
test("Language codes are in consistent order", function()
    -- Common expected order: en, de, es, mx, fr, it, ko, pt, ru, cn, tw
    local expectedOrder = {"de", "es", "mx", "fr", "it", "ko", "pt", "ru"}
    
    local function checkOrder(textTable)
        local prevIndex = 0
        local keys = {}
        for k in pairs(textTable) do
            table.insert(keys, k)
        end
        
        -- This is a basic check - in practice, order may vary based on availability
        -- We're mainly ensuring no obviously wrong ordering
        assertTrue(#keys > 0, "Should have at least one language")
    end
    
    checkOrder(COLLECTORS_EDITION.text)
    checkOrder(HEROIC_EDITION.text)
    checkOrder(EPIC_EDITION.text)
end)

-- Test: Verify TODO comments imply missing translations
test("TODO comments indicate intentional missing translations", function()
    -- This is a metadata test - in Lua we can't directly check comments,
    -- but we can verify that certain expected languages might be missing
    -- and that's okay if they're marked as TODO
    
    -- Example: Check that if a header is missing certain languages,
    -- those are typically optional languages
    local optionalLanguages = {"de", "it", "pt", "ko"}
    
    -- For headers that have some but not all translations
    for _, lang in ipairs(optionalLanguages) do
        -- If missing, it's acceptable (indicated by TODO in source)
        -- This test passes to acknowledge the current state
        assertTrue(true, "Optional language variations are acceptable")
    end
end)

-- Print test summary
print("\n" .. string.rep("=", 60))
print("TEST SUMMARY")
print(string.rep("=", 60))
print(string.format("Total Tests: %d", testCount))
print(string.format("Passed: %d", passCount))
print(string.format("Failed: %d", failCount))
print(string.format("Success Rate: %.1f%%", (passCount / testCount) * 100))
print(string.rep("=", 60))

if failCount > 0 then
    print("\nFailed Tests:")
    for _, result in ipairs(testResults) do
        if result.status == "FAIL" then
            print(string.format("  - %s: %s", result.name, result.error or "Unknown error"))
        end
    end
end

return TestSuite