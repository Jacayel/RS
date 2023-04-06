@echo off
call colormem.bat
echo %date% > logtime.txt
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:menustart
cls
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{0}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{ENTER}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"

set /p number=
if %number% == 0 goto main
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:main
cls
echo ==============================================================================
echo %date%   MENU
echo ==============================================================================
echo.
call wall.bat
type mainmenu.txt
set /p number=
if %number% == 1 goto note
if %number% == 3 goto files
if %number% == 2 goto cal
if %number% == 4 goto settings
if %number% == 5 goto apps
if %number% == 6 goto timerapp
if %number% == 7 goto guessgame
if %number% == i goto info
if %number% == w goto exit
if %number% == W goto exit
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:apps
cls
echo ==============================================================================
echo %date%   MENU
echo ==============================================================================
echo.
call wall.bat
type apps.txt
set /p number=
if %number% == 1 goto note
if %number% == 3 goto files
if %number% == 2 goto cal
if %number% == 4 goto settings
if %number% == 5 goto apps
if %number% == 6 goto timerapp
if %number% == 7 goto guessgame
if %number% == i goto info
if %number% == w goto main
if %number% == W goto main
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:guessgame
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
type rel.txt
echo.
echo Time of logon:
type logtime.txt
pause
goto main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:settings
cls
echo ==============================================================================
echo %date%   SETTINGS
echo ==============================================================================
echo.
type settings.txt
set /p number=
if %number% == 1 goto personal
if %number% == 2 goto graphic
if %number% == 3 goto acc
if %number% == w goto menustart
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
goto menustart
::::::::::::::::::::::::
:graphic
cls
echo ==============================================================================
echo %date%   SETTINGS - GRAPHICS
echo ==============================================================================
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
set /p number=
if %number% == 1 goto enloch echo call loadformat.bat > loch.bat 
if %number% == 2 goto disloch echo call load.bat > loch.bat
if %number% == w goto settings
goto settings
:enloch
cls
echo call loadformat.bat > loch.bat
call loadformat.bat
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
call load.bat
goto settings
::::::::::::::::::::::::
:PERSONAL
cls
echo ==============================================================================
echo %date%   SETTINGS - PERSONALIZATION
echo ==============================================================================
type permen.txt
echo.
set /p number=
if %number% == 1 goto pickcol
if %number% == 2 goto wall
if %number% == w goto settings
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
goto menustart
:::::::::::::::::::::::::
:acc
cls
echo ==============================================================================
echo %date%   SETTINGS - USER PROFILE
echo ==============================================================================
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
set /p uset=
if %uset% == 1 goto paschange
if %uset% == 2 goto namchange
if %uset% == w goto main
goto settings
:namchange
cls
echo ==============================================================================
echo %date%   SETTINGS - USER PROFILE - CHANGE USERNAME
echo ==============================================================================
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
cls
echo ==============================================================================
echo %date%   SETTINGS - USER PROFILE - CHANGE PASSWORD
echo ==============================================================================
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
cls
echo ==============================================================================
echo %date%   SETTINGS - COLOR
echo ==============================================================================
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
set /p color=
if %color% == 1 goto cucol
if %color% == 2 goto colors
if %color% == w goto personal
if %color% == W goto personal
goto settings
:colors
cls
echo ==============================================================================
echo %date%   SETTINGS - PERSONALIZATION - COLOR
echo ==============================================================================
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
set /p color=
if %color% == 1 color 0f
if %color% == 1 echo color 0f > COLORMEM.bat
if %color% == 2 color 8f
if %color% == 2 echo color 8f > COLORMEM.bat
if %color% == 3 color 0b
if %color% == 3 echo color 0b > COLORMEM.bat
if %color% == 4 color 3f
if %color% == 4 echo color 3f > COLORMEM.bat
if %color% == w goto settings
call colormem.bat
cls
goto settings
type line1.txt
echo.
cls
:cucol
cls
echo ==============================================================================
echo %date%   SETTINGS - PERSONALIZATION - COLOR
echo ==============================================================================
type COLKEY.txt
set /p color=
if %color% == w goto settings
echo color %color% > COLORMEM.bat
call colormem.bat
goto settings
:::::::::::::::::::::::::
:loadset
cls
type line2.txt
echo %date%   SETTINGS - STARTUP
type line2.txt
echo.
echo _______
echo Startup
echo _______
echo.
echo =============================
echo 1. Turn on Startup animation
echo 2. Turn off Startup animation
echo =============================
echo.
echo -------
echo W. Back
echo -------
set /p startup=
if %startup% == 1 goto tonsa-startup
if %startup% == 2 goto toffsa-startup
if %startup% == w goto settings
goto loadset
:tonsa-startup
echo call animsequence.bat > animstartchoice.bat
goto loadset
:toffsa-startup
echo. > animstartchoice.bat
goto loadset
:::::::::::::::::::::::::
:wall
cls
echo ==============================================================================
echo %date%   SETTINGS - PERSONALIZATION - WALLPAPER
echo ==============================================================================
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
set /p wall=
if %wall% == 1 goto deswal
if %wall% == 2 goto roawal
if %wall% == 3 goto ligwal
if %wall% == 4 goto lapwal
if %wall% == 5 goto satwal
if %wall% == 6 goto rswall
if %wall% == w goto settings
goto settings
:deswal
echo type Desert-Snake.txt > Wall.bat
goto wall
:repwal
echo type Diamond-Repeater.txt > Wall.bat
goto wall
:roawal
echo type Mountain-Road.txt > Wall.bat
goto wall
:ligwal
echo type Northern-lights.txt > Wall.bat
goto wall
:lapwal
echo type lptp.txt > Wall.bat
goto wall
:satwal
echo type saturn.txt > Wall.bat
goto wall
:rswall
echo type rswall.txt > Wall.bat
goto wall
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:timerapp
cls
echo ==============================================================================
echo %date%   COUNTDOWN
echo ============================================================================== 
echo.
echo Type the amount of seconds to countdown from...
echo Type "W" to exit
set /p t=
timeout %t%
if %t% == w goto main
goto timerapp
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:note
cls
echo ==============================================================================
echo %date%   NOTES
echo ==============================================================================
echo.
echo.
type notesmenu.txt
set /p number=
if %number% == 1 goto add
if %number% == 2 goto crbat
if %number% == 1o goto addov
if %number% == 2o goto addovbat
if %number% == w goto menustart
if %number% == W goto menustart
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
goto note
:appsfix
goto apps
:addovbat
cls
echo ============================================================================== 
echo %date%   NOTES - Create a bat file - Overwrite mode
echo ==============================================================================
echo.
cd Files
echo DO NOT USE SPECIAL CHARACTERS (INCLUDING SPACE KEY) OR THE FILE WILL NOT SAVE
echo.
set /p n=Name of file:
cls
echo Loading...
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo. > "%n%.bat"
echo Done!
cls
echo __________________________________________
echo You can write up to 10 lines of text
echo Press enter to go to the next line of text
echo __________________________________________
set /p ne1ob=1:
echo. %ne1ob% >"%n%.bat"
set /p ne2ob=2:
echo. %ne2ob% >>"%n%.bat"
set /p ne3ob=3:
echo. %ne3ob% >>"%n%.bat"
set /p ne4ob=4:
echo. %ne4ob% >>"%n%.bat"
set /p ne5ob=5:
echo. %ne5ob% >>"%n%.bat"
set /p ne6ob=6:
echo. %ne6ob% >>"%n%.bat"
set /p ne7ob=7:
echo. %ne7ob% >>"%n%.bat"
set /p ne8ob=8:
echo. %ne8ob% >>"%n%.bat"
set /p ne9ob=9:
echo. %ne9ob% >>"%n%.bat"
set /p ne10ob=10:
echo. %ne10ob% >>"%n%.bat"
echo.
echo.
cd..
cls
goto note
:addov
cls
echo ============================================================================== 
echo %date%   NOTES - Create a txt file - Overwrite mode
echo ==============================================================================
echo.
cd Files
echo DO NOT USE SPECIAL CHARACTERS (INCLUDING SPACE KEY) OR THE FILE WILL NOT SAVE
echo.
set /p n=Name of file:
cls
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
echo. > "%n%.txt"
cls
echo __________________________________________
echo You can write up to 10 lines of text
echo Press enter to go to the next line of text
echo __________________________________________
set /p ne1o=1:
echo. %ne1o% >"%n%.txt"
set /p ne2o=2:
echo. %ne2o% >>"%n%.txt"
set /p ne3o=3:
echo. %ne3o% >>"%n%.txt"
set /p ne4o=4:
echo. %ne4o% >>"%n%.txt"
set /p ne5o=5:
echo. %ne5o% >>"%n%.txt"
set /p ne6o=6:
echo. %ne6o% >>"%n%.txt"
set /p ne7o=7:
echo. %ne7o% >>"%n%.txt"
set /p ne8o=8:
echo. %ne8o% >>"%n%.txt"
set /p ne9o=9:
echo. %ne9o% >>"%n%.txt"
set /p ne10o=10:
echo. %ne10o% >>"%n%.txt"
echo.
echo.
cd..
cls
goto note
:add
cls
echo ============================================================================== 
echo %date%   NOTES - Create a txt file
echo ==============================================================================
echo.
cd Files
echo DO NOT USE SPECIAL CHARACTERS (INCLUDING SPACE KEY) OR THE FILE WILL NOT SAVE
echo.
set /p n=Name of file:
cls
echo __________________________________________
echo You can write up to 10 lines of text
echo Press enter to go to the next line of text
echo __________________________________________
echo.
set /p ne1t=1:
echo. %ne1t% >>"%n%.txt"
set /p ne2t=2:
echo. %ne2t% >>"%n%.txt"
set /p ne3t=3:
echo. %ne3t% >>"%n%.txt"
set /p ne4t=4:
echo. %ne4t% >>"%n%.txt"
set /p ne5t=5:
echo. %ne5t% >>"%n%.txt"
set /p ne6t=6:
echo. %ne6t% >>"%n%.txt"
set /p ne7t=7:
echo. %ne7t% >>"%n%.txt"
set /p ne8t=8:
echo. %ne8t% >>"%n%.txt"
set /p ne9t=9:
echo. %ne9t% >>"%n%.txt"
set /p ne10t=10:
echo. %ne10t% >>"%n%.txt"
echo.
echo.
cd..
cls
goto note
:crbat
cls
echo ============================================================================== 
echo %date%   NOTES - Create a bat file
echo ==============================================================================
echo.
cd Files
echo DO NOT USE SPECIAL CHARACTERS (INCLUDING SPACE KEY) OR THE FILE WILL NOT SAVE
echo.
set /p n=Name of file:
cls
echo __________________________________________
echo You can write up to 10 lines of text
echo Press enter to go to the next line of text
echo __________________________________________
set /p ne1=1:
echo. %ne1% >>"%n%.bat"
set /p ne2=2:
echo. %ne2% >>"%n%.bat"
set /p ne3=3:
echo. %ne3% >>"%n%.bat"
set /p ne4=4:
echo. %ne4% >>"%n%.bat"
set /p ne5=5:
echo. %ne5% >>"%n%.bat"
set /p ne6=6:
echo. %ne6% >>"%n%.bat"
set /p ne7=7:
echo. %ne7% >>"%n%.bat"
set /p ne8=8:
echo. %ne8% >>"%n%.bat"
set /p ne9=9:
echo. %ne9% >>"%n%.bat"
set /p ne10=10:
echo. %ne10% >>"%n%.bat"
echo.
echo.
cd..
cls
goto note
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:files

CLS
:filechose
cls
echo ==============================================================================
echo %date%   FILES
echo ==============================================================================
echo.
echo.
type FILEMEN.txt
SET /p filechose=
if %filechose% == w goto menustart
if %filechose% == 1 goto fileser
if %filechose% == 2 goto filedel
if %filechose% == 3 goto filerun
if %number% == 1967 dir
if %number% == 1967 @echo on
if %number% == off @echo off
goto filechose
:filedel
cls
echo ==============================================================================
echo %date%   FILES - Delete a file
echo ==============================================================================
cd Files
echo.
echo.
echo Type in a file name
echo Make sure to include the full file name (example: file.txt)
echo.
dir /b
ECHO.
SET /p delf=
del "%delf%"
pause
:apfix
cd..
goto filechose
cls
:fileser
cls
echo ==============================================================================
echo %date%   FILES - Search for a file
echo ==============================================================================
cd Files
echo.
echo.
echo Type in a file name
echo Make sure to include the full file name (example: file.txt)
echo.
dir /b
ECHO.
SET /p webother=
cls
echo ==============================================================================
echo.
type "%webother%"
echo.
echo ==============================================================================
pause
:apfix
cd..
goto filechose
cls
:filerun
cls
echo ==============================================================================
echo %date%   FILES - Run a file
echo ==============================================================================
cd Files
echo.
echo.
echo Type in a file name
echo Make sure to include the full file name (example: file.bat)
echo.
dir /b
ECHO.
SET /p runf=
cls
call "%runf%"
:apfix
cd..
goto filechose
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:cal
cls
echo ==============================================================================
echo %date%   Calculator (No decimals)
echo ==============================================================================

set /p num1=Enter first number: 
set /p operator=Enter operator (+, -, *, /): 
set /p num2=Enter second number: 

:: Perform the calculation
if %operator%==+ set /a result=%num1%+%num2%
if %operator%==- set /a result=%num1%-%num2%
if %operator%==* set /a result=%num1%*%num2%
if %operator%==/ set /a result=%num1%/%num2%


echo Result: %result%
pause
GOTO menustart

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
pause
:exit
cls
echo 1. Restart RS
echo 2. Close RS
echo 3. Restart
echo 4. Shutdown
echo W. Go back
set /p number=
if %number% == 1 goto restartrs
if %number% == 2 goto close
if %number% == 3 goto restartpc
if %number% == 4 goto shutdown
if %number% == w goto menustart
if %number% == debdir dir
if %number% == debdir @echo on
if %number% == deboff @echo off
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
