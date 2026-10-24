REM This batch file is expected to be called from each version/flavor-based .update.bat of the respective .wago directories
REM e.g
REM cd /d "%~dp0"
REM set "SHARED=%~dp0..\..\..\..\..\.tools\.wago.update.bat"
REM call "%SHARED%" download GlyphProperties
REM call "%SHARED%" downloadrenamed Holiday Holidays

@echo off
call :%*
exit /b

:download
echo Downloading %1...
call :fetch %1 %1
exit /b

:downloadrenamed
echo Downloading %2 as %1...
call :fetch %1 %2
exit /b

:fetch
if exist "%1.%BUILD%.csv" (
	if not defined FORCE_OVERWRITE exit /b
) else (
	if exist "%1*.csv" del /Q "%1*.csv"
)
curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/%2/csv?build=%BUILD%&useHotfixes"
set "CSVDIR=%CD%"
pushd "%~dp0"
call "CSVCleaner.exe" "%CSVDIR%\%1.%BUILD%.csv" "%1.regex"
popd
exit /b
