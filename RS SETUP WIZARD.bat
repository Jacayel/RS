@echo off
echo.>login.bat:Zone.Identifier
echo.>"Rs setup wizard.bat":Zone.Identifier
title RS SETUP WIZARD V1.0
mode con COLS=27 LINES=15
cls
echo RS SETUP WIZARD
echo.
echo Type a username
echo.
set /p u=
mkdir "%u%"
copy "rs data" "%u%"
cd "%u%"
mkdir Files
cls
echo RS SETUP WIZARD
echo.
echo Type a password
echo.
set /p p=
echo :password >> password.bat
echo echo Password >> password.bat
echo set /p e= >> password.bat
echo if "%%e%%" == "%p%" goto pass >> password.bat
echo goto password >> password.bat
echo :pass >> password.bat
echo echo Loading... >> password.bat
echo call loch.bat >> password.bat
cls
systeminfo | findstr /C:"OS Name" /C:"System Type" /C:"Total Physical Memory" /C:"System Manufacturer" /C:"System Model" > sysinfo.txt
cls
title RS 1.0
echo Setup has completed, would you like to start RS?
echo (Y = Yes)
echo (N = No)
choice /c yn /n
if errorlevel 2 exit
if errorlevel 1 call loch.bat
cls
