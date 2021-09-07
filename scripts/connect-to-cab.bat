@echo off

(adb devices | findstr "0123456789") >nul 2>&1

if %errorlevel% == 0 (
	CALL adb-wifi.bat
) else (
	echo No cab connection found. 
	echo Try unplugging/replugging in cab and waiting 4-5 seconds,
	echo and be sure that you have installed the necessary drivers
)