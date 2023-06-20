@echo off
:startup
Title RS VERSION 1.0
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
mode con COLS=27 LINES=15
cls
if exist renuser.bat (
del renuser.bat
) Else (
goto :u
)
cls
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:u
echo LOGIN
echo.
echo USERNAME
set /p u=
cd %u%
cls
:p
call password.bat
cls
