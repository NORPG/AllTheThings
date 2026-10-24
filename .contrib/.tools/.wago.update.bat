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

:downloadlocale
echo Downloading %1 for locale %2...
call :fetch %1 %1 %2
exit /b

:fetch
set "REMOTE=%~2"
if "%~1"=="AchievementCategory" set "REMOTE=Achievement_Category"
set "STEM=%~1"
set "LOCALEARG="
if not "%~3"=="" (
	set "STEM=%~1.%~3"
	set "LOCALEARG=&locale=%~3"
)
if exist "%STEM%.%BUILD%.csv" (
	if not defined FORCE_OVERWRITE exit /b
) else (
	if exist "%STEM%*.csv" del /Q "%STEM%*.csv"
)
curl -o "%STEM%.%BUILD%.csv" "https://wago.tools/db2/%REMOTE%/csv?build=%BUILD%%LOCALEARG%&useHotfixes"
set "CSVDIR=%CD%"
pushd "%~dp0"
call "CSVCleaner.exe" "%CSVDIR%\%STEM%.%BUILD%.csv" "%~1.regex"
popd
exit /b
