@echo off
powershell.exe -NoLogo -NoProfile -File "%~dp0att-deploy.ps1" %*
exit /b %errorlevel%
