:: Run this batch script to link the AllTheThings addon with all non-PTR versions of the game.
:: If it does NOT report "Linking using root WoW folder: ..." in the command output, then make sure to add your personal WoW install directory
:: into the :do_links label of the script similar to existing examples
@echo off
SETLOCAL
pushd %~dp0

:: Set the addon folder name
set "AddonName=AllTheThings"

:: Prompt the user for input and store it in the variable "accountName"
set /p "accountName=Please enter your account name as it appears in SavedVariables: "
call :link_wowfolder "C:\Program Files\World of Warcraft"
call :link_wowfolder "C:\Program Files (x86)\World of Warcraft"
call :link_wowfolder "..\World of Warcraft"
call :link_wowfolder "..\Blizzard\World of Warcraft"
call :link_wowfolder "D:\World of Warcraft"
call :link_wowfolder "F:\World of Warcraft"
call :report_taskcomplete
EXIT /B 0

:link_wowfolder
if exist "%~1\" (
    call :link_expansion "%~1\_classic_beta_"
)
EXIT /B 0

:link_expansion
if exist "%~1\" (
	if exist "%~1\WTF\Account\%accountName%\SavedVariables\%AddonName%.lua" (
		echo "%~1\WTF\Account\%accountName%\SavedVariables\%AddonName%.lua"
		if NOT exist "%cd%\SavedVariables.lua" (
			mklink "%cd%\SavedVariables.lua" "%~1\WTF\Account\%accountName%\SavedVariables\%AddonName%.lua"
		)
		
		:: Define your file names
		set "InputFile=%cd%\%AddonName%.toc"
		set "TempFile=%cd%\%AddonName%.tmp"

		:: Define the target line you want to uncomment
		set "TargetLine=# SavedVariables.lua"
		set "NewLine=SavedVariables.lua"
		setlocal enabledelayedexpansion

		:: Clear any existing temp file
		if exist "!TempFile!" del "!TempFile!"

		:: Read line by line and replace the specific text
		for /F "tokens=*" %%A in (!InputFile!) do (
			set "line=%%A"
			if "!line!"=="!TargetLine!" (
				echo !NewLine!>>"!TempFile!"
			) else (
				echo !line!>>"!TempFile!"
			)
		)

		:: Replace the old TOC file with the updated one
		move /y "!TempFile!" "!InputFile!" >nul

		echo TOC file updated successfully.
	)
)
EXIT /B 0

:report_taskcomplete
echo Task Complete!
set /p DUMMY=Hit ENTER to close...
EXIT /B 0
