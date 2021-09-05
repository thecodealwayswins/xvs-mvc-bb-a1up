@echo off

(adb devices | findstr "0123456789") >nul 2>&1

if %errorlevel% neq 0 (
	exit
)

CALL adb-wifi.bat