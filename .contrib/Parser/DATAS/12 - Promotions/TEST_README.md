# Collector's Editions Data Test Suite

## Overview

This test suite validates the data structure and integrity of the `Collector's Editions.lua` file. It ensures that all promotional edition headers maintain consistency, completeness, and proper localization.

## Test File

- **Location**: `.contrib/Parser/DATAS/12 - Promotions/Collector's Editions.test.lua`
- **Language**: Lua
- **Test Count**: 50+ individual test cases

## What Is Tested

### 1. Structure Validation
- All headers exist and are properly defined
- Each header has required fields: `readable`, `icon`, and `text`
- Field types are correct (strings, numbers, tables)

### 2. Localization Coverage
- English (`en`) localization is present for all headers (required)
- Chinese localizations come in pairs (`cn` and `tw`)
- No empty string values in localizations
- TODO comments indicate intentional missing translations

### 3. Icon References
- Icons are either asset strings or numeric IDs
- Asset strings reference appropriate expansions/games
- Numeric icon IDs are valid

### 4. Description Fields
- Headers with descriptions have English text
- Descriptions are non-empty and meaningful

### 5. Data Consistency
- All headers follow the same structural pattern
- Language codes are used consistently
- Related headers maintain similar patterns

## Running the Tests

### Using Lua Interpreter

If you have Lua installed, you can run the tests directly by loading the data file first, then the test file.

### Integration with Parser

Since this project uses NLua for parsing, integrate the test file with the parser workflow.

## Expected Output

When tests run successfully, you will see PASS messages for each test and a summary showing 100% success rate.

If tests fail, you will see FAIL messages with specific error descriptions.

## Maintenance

### Adding New Headers

When adding new collector's edition headers, follow the existing pattern and add corresponding test cases.

### Updating Tests

If new language codes are added project-wide, update the test assertions accordingly.

## Benefits

1. **Data Integrity**: Catches structural errors before they reach production
2. **Localization Quality**: Ensures all required translations are present
3. **Consistency**: Maintains uniform structure across all headers
4. **Regression Prevention**: Prevents accidental data corruption during edits
5. **Documentation**: Tests serve as examples of correct data structure
