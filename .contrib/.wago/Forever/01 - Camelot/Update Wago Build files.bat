@echo off
SET BUILD=1.60.1.69893

@REM Download new file versions
call :download Achievement
call :download AreaTable
@REM call :download ArtifactAppearance
call :download BattlePetSpecies
call :download ContentTuning
call :download Criteria
call :download CriteriaTree
@REM call :download GlyphProperties
call :downloadrenamed Holiday Holidays
@REM call :download HouseDecor
call :download Item
call :downloadcleaned ItemBonus
call :download ItemEffect
call :download ItemModifiedAppearance
call :download ItemXItemEffect
call :download ItemSearchName
call :download ModifierTree
call :download SkillLineAbility
call :downloadcleaned SpellEffect
call :download TaxiNodes
call :download TransmogSet
call :download TransmogSetItem
call :download UiMap
call :download UiMapAssignment
call :download WorldMapOverlay

@REM Run the locale update script from its own folder
pushd "%~dp0localized"
call "Update Wago Build Files.bat" %BUILD%
popd

exit /b

:download
echo Downloading %1...
if not exist "%1.%BUILD%.csv" (
	if exist "%1*.csv" (
		del /Q "%1*.csv"
	)
	curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/%1/csv?build=%BUILD%"
)
exit /b

:downloadrenamed
echo Downloading %2 as %1...
if not exist "%1.%BUILD%.csv" (
	if exist "%1*.csv" (
		del /Q "%1*.csv"
	)
	curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/%2/csv?build=%BUILD%"
)
exit /b

:downloadcleaned
call :download %1
echo Cleaning %1...
call "..\..\Release\net8.0\CSVCleaner.exe" "%~dp0\%1.%BUILD%.csv" "..\..\%1.regex"
exit /b
