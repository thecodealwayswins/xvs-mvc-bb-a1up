@echo off

setlocal

rem Change to suit your configuration.
set netmask=192.168

rem Find network ssid to get cached ip.
set tmp_file=%~dp0adb_wifi_tmp
netsh wlan show interface > %tmp_file%
for /F "tokens=2 delims=: " %%a in ('findstr /r "Profile" %tmp_file%') do (
  set ssid=%%a
)
del %tmp_file%

rem Find ip entry for current ssid in ips file.
set ips_file_name=adb_wifi_ips
set ips_file=%~dp0%ips_file_name%
for /F %%a in ('findstr /r %ssid% %ips_file%') do (
  set ip_entry=%%a
)
if [%ip_entry%] == [] goto connect

rem Get ip from ip entry.
for %%a in (%ip_entry::= %) do (
  set ip=%%a
)

rem Remove ip_entry from ips file.
findstr /v %ip_entry% %ips_file% > %tmp_file%
del %ips_file%
rename %tmp_file% %ips_file_name%

rem Try to connect and save ip_entry (ssid:ip) on success.
adb connect %ip%
adb devices | find "%netmask%"
if %errorlevel% EQU 0 goto save_ip_entry

:connect
rem Find the ip of the connected device (should be connected by USB).
adb -d shell ip -o a > %tmp_file%
for /F "tokens=4 delims=/ " %%a in ('findstr /r "%netmask%.[0-9][0-9]*\.[0-9][0-9]*/" %tmp_file%') do (
  set ip=%%a
)
del %tmp_file%

rem Try to connect to device using the ip found.
adb -s 0123456789ABCDEF tcpip 5555
adb connect %ip%