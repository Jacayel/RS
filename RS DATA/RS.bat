@echo off
call colormem.bat
echo %date% %time% > logtime.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:menustart
mode con COLS=82 LINES=29
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:main
mode con COLS=82 LINES=29
title %date% - MENU
cls
echo.
call wall.bat
type mainmenu.txt
choice /c 1234567iw /n
if errorlevel 9 goto exit
if errorlevel 8 goto info
if errorlevel 7 goto guessgame
if errorlevel 6 goto timerapp
if errorlevel 5 goto apps
if errorlevel 4 goto settings
if errorlevel 3 goto files
if errorlevel 2 goto cal
if errorlevel 1 goto note
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:apps
title %date% - MENU
cls
echo.
call wall.bat
type apps.txt
choice /c 1234567iw /n
if errorlevel 9 goto main
if errorlevel 8 goto info
if errorlevel 7 goto guessgame
if errorlevel 6 goto timerapp
if errorlevel 5 goto apps
if errorlevel 4 goto settings
if errorlevel 3 goto files
if errorlevel 2 goto cal
if errorlevel 1 goto note
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:guessgame
title %date% - Guessing game
cls


echo Welcome to the number guessing game!
echo.
set /a answer=%RANDOM% %% 100 + 1
set /a guess=0
set /a tries=0

:game_loop
set /p guess=Guess a number between 1 and 100:
set /a tries+=1

if %guess%==%answer% (
    echo Congratulations, you guessed the number in %tries% tries!
    goto end_game
) else if %guess% LSS %answer% (
    echo Too low. Guess again.
) else (
    echo Too high. Guess again.
)

goto game_loop

:end_game
pause
goto apps
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:info
cls
type sysinfo.txt
echo ______________________________________________________________
type verstat.txt
type build.txt
echo Time of logon:
type logtime.txt
pause
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:settings
mode con COLS=82 LINES=29
title %date% - Settings
cls
echo.
type settings.txt
choice /c 123w /n
if errorlevel 4 goto main
if errorlevel 3 goto acc
if errorlevel 2 goto graphic
if errorlevel 1 goto personal
goto main
::::::::::::::::::::::::
:graphic
mode con COLS=82 LINES=29
title %date% - Settings
cls
echo.
echo.
echo =====================
echo 1. Enable fullscreen
echo 2. Disable fullscreen
echo =====================
echo.
echo -------
echo W. Back
echo -------
choice /c 12w /n
if errorlevel 3 goto settings
if errorlevel 2 goto disloch 
if errorlevel 1 goto enloch
goto settings
:enloch
cls
echo call loadformat.bat > loch.bat
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"
goto settings
:disloch
echo call load.bat > loch.bat
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"
goto settings
::::::::::::::::::::::::
:PERSONAL
mode con COLS=82 LINES=29
title %date% - Settings
cls
type permen.txt
echo.
choice /c 12w /n
if errorlevel 3 goto settings
if errorlevel 2 goto wall
if errorlevel 1 goto pickcol
goto menustart
:::::::::::::::::::::::::
:acc
mode con COLS=82 LINES=29
title %date% - Settings
cls
echo.
echo.
echo ===================
echo 1. Change password
echo 2. Change username
echo ===================
echo.
echo ---------
echo  W. Back
echo ---------
echo.
choice /c 12w /n
if errorlevel 3 goto settings
if errorlevel 2 goto namchange
if errorlevel 1 goto paschange
goto settings
:namchange
title %date% - Settings
cls
echo.

for %%I in (.) do set olus=%%~nxI
cd..
echo Type a new username
set /p neus=
echo ren "%olus%" "%neus%" > renuser.bat
echo call login.bat >> renuser.bat
start renuser.bat
exit
:paschange
title %date% - Settings
cls
echo.
echo Type a new password
echo.
set /p p=
echo :password > password.bat
echo echo Password >> password.bat
echo set /p e= >> password.bat
echo if "%%e%%" == "%p%" goto pass >> password.bat
echo goto password >> password.bat
echo :pass >> password.bat
echo echo Loading... >> password.bat
echo call loch.bat >> password.bat
cls
goto acc
:::::::::::::::::::::::::
:pickcol
title %date% - Settings
cls
echo.
echo.
echo =================
echo 1. Custom colors
echo 2. Color presets
echo =================
echo.
echo ---------
echo  W. Back
echo ---------
echo.
choice /c 12w /n
if errorlevel 3 goto personal
if errorlevel 2 goto colorpre
if errorlevel 1 goto cucol
goto settings
:colorpre
title %date% - Settings
cls
echo.
echo.
echo ======================
echo 1. White on Black
echo 2. White on Grey
echo 3. Teal on Black
echo 4. White on Light Blue
echo ======================
echo.
echo ---------
echo  W. Back
echo ---------
echo.
choice /c 1234w /n
if errorlevel 1 echo color 0f > COLORMEM.bat
if errorlevel 2 echo color 8f > COLORMEM.bat
if errorlevel 3 echo color 0b > COLORMEM.bat
if errorlevel 4 echo color 3f > COLORMEM.bat
if errorlevel 5 goto settings
call colormem.bat
cls
goto settings
type line1.txt
echo.
cls
:cucol
title %date% - Settings
cls
type COLKEY.txt
set /p color=
echo color %color% > COLORMEM.bat
call colormem.bat
goto settings
:::::::::::::::::::::::::
:wall
title %date% - Settings
cls
echo.
echo ===================
echo 1. Desert Snake
echo 2. Mountain Road
echo 3. Northern Lights
echo 4. Laptop
echo 5. Saturn
echo 6. Reset Wallpaper
echo ===================
echo.
echo --------
echo W. Back
echo --------
echo.
choice /c 123456w /n
if errorlevel 7 goto settings
if errorlevel 6 goto rswall
if errorlevel 5 goto satwal
if errorlevel 4 goto lapwal
if errorlevel 3 goto ligwal
if errorlevel 2 goto roawal
if errorlevel 1 goto deswal
goto settings
:deswal
echo type Desert-Snake.txt > Wall.bat
goto personal
:repwal
echo type Diamond-Repeater.txt > Wall.bat
goto personal
:roawal
echo type Mountain-Road.txt > Wall.bat
goto personal
:ligwal
echo type Northern-lights.txt > Wall.bat
goto personal
:lapwal
echo type lptp.txt > Wall.bat
goto personal
:satwal
echo type saturn.txt > Wall.bat
goto personal
:rswall
echo type rswall.txt > Wall.bat
goto personal
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:timerapp
title %date% - Countdown
cls
echo.
echo Type the amount of seconds to countdown from...
echo Type "W" to exit
set /p t=
timeout %t%
if %t% == w goto apps
goto timerapp
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:note
title %date% - Notes
cls
echo.
cd Files
echo.
set /p n=Name of file:
if %n% == "^Z" goto main
cls
echo __________________________________________
echo Press Ctrl+Z, then enter to save the file
echo __________________________________________
echo.
copy con %n%
cd..
cls
goto main
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:filechose
:files
title %date% - Files
set /a sfle=0
cls
cd Files
echo.
echo ___________________________________________________________
echo Type in a file name
echo Make sure to include the file extension (example: file.txt)
echo ___________________________________________________________

dir /b
ECHO.
SET /p sfle=
if %sfle% == w goto fledirfx
IF EXIST %sfle% (
    goto action
) ELSE (
    goto fnf
)
:fnf
echo File not found.
ping localhost -n 2 >nul
cd..
goto files
:action
cls
title %date% - Files
cls
ECHO.
ECHO.
ECHO.
ECHO.
ECHo.
echo %sfle%
ECHO.
echo =========
echo 1. Open 
echo 2. Run
echo 3. Rename
echo 4. Delete
echo =========
echo.
echo -------
echo W. Back
echo -------
choice /c 1234w /n
if errorlevel 5 goto apfix
if errorlevel 4 goto delf
if errorlevel 3 goto renf
if errorlevel 2 goto runf
if errorlevel 1 goto openf
goto files
:apfix
cd..
goto filechose
cls
:delf
cls
del "%sfle%"
pause
cd..
goto filechose
cls
:runf
cls
cd Files
cls
call "%sfle%"
cd..
goto filechose
cls
:renf
cls
title %date% - Files
cls
echo.
echo ___________________________________________________________
echo Make sure to include the file extension (example: file.txt)
echo ___________________________________________________________
echo.
set /p renf=Rename %sfle% to:
ren "%sfle%" "%renf%"
cd..
cls
goto filechose
cls
:openf
cls
title %date% - Files
cls
echo.
echo.
type "%sfle%"
ECHO.
pause
cd..
cls
goto files
cls
:fledirfx
cls
cd..
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:cal
cls
title %date% - Calculator (no decimals)
cls

echo.
set /a num1=0
set /a num2=0
set /p num1=Enter the first number:
set /p num2=Enter the second number:
set /a sum=%num1%+%num2%
set /a diff=%num1%-%num2%
set /a prod=%num1%*%num2%
set /a quotient=%num1%/%num2%
echo Sum: %sum%
echo Difference: %diff%
echo Product: %prod%
echo Quotient: %quotient%
pause
goto main
pause
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
Title RS V1.0
:exit
cls
echo 1. Restart RS
echo 2. Close RS
echo 3. Restart
echo 4. Shutdown
echo W. Go back
choice /c 1234w /n
if errorlevel 5 goto main
if errorlevel 4 goto shutdown
if errorlevel 3 goto restartpc
if errorlevel 2 goto close
if errorlevel 1 goto restartrs
goto exit
:sleep
rundll32.exe powrprof.dll, SetSuspendState Sleep
goto close
:restartpc
shutdown /r /t 00
goto exit
:shutdown
shutdown /s /t 00
goto exit
:restartrs
cd..
call login.bat
:close
exit
