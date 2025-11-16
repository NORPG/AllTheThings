#!/usr/bin/env lua
-----------------------------------------------------
--     T E S T   R U N N E R   S C R I P T        --
-----------------------------------------------------
-- Standalone test runner for Collector's Editions data
-- Usage: lua run_tests.lua

-- Mock the createHeader function if it doesn't exist
if not createHeader then
    function createHeader(data)
        return data
    end
end

-- Mock asset function if it doesn't exist
if not _ then
    _ = {}
    _.asset = function(name)
        return "~_.asset(\"" .. name .. "\")"
    end
end

print("=" .. string.rep("=", 59))
print("Collector's Editions Data Validation Test Suite")
print("=" .. string.rep("=", 59))
print()

-- Load the data file
print("Loading Collector's Editions.lua...")
local dataFile = "Collector's Editions.lua"
local success, err = pcall(function()
    dofile(dataFile)
end)

if not success then
    print("ERROR: Failed to load data file: " .. tostring(err))
    print("\nMake sure you run this script from the same directory as the data file.")
    os.exit(1)
end

print("Data file loaded successfully.")
print()

-- Load and run the test file
print("Running tests...")
print()

local testFile = "Collector's Editions.test.lua"
success, err = pcall(function()
    dofile(testFile)
end)

if not success then
    print("\nERROR: Test execution failed: " .. tostring(err))
    os.exit(1)
end

print()
print("Test execution completed.")
print()

-- Exit with appropriate code
-- Note: The test file itself tracks pass/fail, but we can add additional exit logic if needed