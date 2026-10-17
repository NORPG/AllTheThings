@echo off

@REM Download Midnight Classic database
SET BUILD=%~1
set "FORCE_OVERWRITE="
if /i "%~2"=="force_overwrite" set "FORCE_OVERWRITE=1"
call :downloadlocalized HolidayNames
exit /b

:downloadlocalized
call :downloadbaselocale %1
call :downloadlocale %1 deDE
call :downloadlocale %1 esES
call :downloadlocale %1 esMX
call :downloadlocale %1 frFR
call :downloadlocale %1 itIT
call :downloadlocale %1 koKR
call :downloadlocale %1 ptBR
call :downloadlocale %1 ruRU
call :downloadlocale %1 zhCN
call :downloadlocale %1 zhTW
exit /b

:downloadbaselocale
echo Downloading %1...
if exist "%1.%BUILD%.csv" (
	if not defined FORCE_OVERWRITE exit /b
) else (
	if exist "%1*.csv" (
		del /Q "%1*.csv"
	)
)
if "%1" == "AchievementCategory" (
	curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/Achievement_Category/csv?build=%BUILD%&useHotfixes"
) else (
	curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/%1/csv?build=%BUILD%&useHotfixes"
)
exit /b

:downloadlocale
echo Downloading %1 for locale %2...
if exist "%1.%2.%BUILD%.csv" (
	if not defined FORCE_OVERWRITE exit /b
) else (
	if exist "%1.%2*.csv" (
		del /Q "%1.%2*.csv"
	)
)
if "%1" == "AchievementCategory" (
	curl -o "%1.%2.%BUILD%.csv" "https://wago.tools/db2/Achievement_Category/csv?build=%BUILD%&locale=%2&useHotfixes"
) else (
	curl -o "%1.%2.%BUILD%.csv" "https://wago.tools/db2/%1/csv?build=%BUILD%&locale=%2&useHotfixes"
)
exit /b

:downloadrenamed
echo Downloading %2 as %1...
if exist "%1.%BUILD%.csv" (
	if not defined FORCE_OVERWRITE exit /b
) else (
	if exist "%1*.csv" (
		del /Q "%1*.csv"
	)
)
curl -o "%1.%BUILD%.csv" "https://wago.tools/db2/%2/csv?build=%BUILD%&useHotfixes"
exit /b
