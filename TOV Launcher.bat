@echo off
title The Oldest View
color a
goto updatelinks


:updatelinks
powershell -Command Invoke-WebRequest https://github.com/LuGB18/TOV-Launcher/blob/main/update.tovf -Outfile update.tovfs
if exist update.tovf goto loadlinks
if exist tov.ini goto loadtovini
goto error1

:error1
title TOV - File not found Error (1)
echo ---------Error(1)-------------------------------
echo -   File (update.tovf) or (tov.ini) not Found! -
echo ------------------------------------------------
echo.
echo.
echo.
echo.
pause
exit


:loadtovini
< tov.ini (
set /p version=
set /p channel=
set /p video1=
set /p video2=
set /p video3=
set /p video4=
)
cls
goto welcome


:loadlinks
echo Updating Links...
echo ------------------------------
echo -           Update           -
echo -      The Oldest View       -
echo ------------------------------
echo.
echo.
echo.
< update.tovf (
set /p version=
set /p channel=
set /p video1=
set /p video2=
set /p video3=
set /p video4=
)
echo New Channel Link: %channel%
echo New TOV - Renewal Link: %video1%
echo New TOV - BTE Link: %video2%
echo New TOV - Rolling Giant Link: %video3%
echo New TOV - Life of a Giant Link: %video4%
echo ---------Erasing Update File.-----------
ERASE /f /q update.tovf
echo -------------Creating...----------------
(
echo %version%
echo %channel%
echo %video1%
echo %video2%
echo %video3%
echo %video4%
) > tov.ini
echo --------tov.ini File Updated!-------
echo      DONT ERASE THE TOV.INI FILE!
echo.
echo.
pause>null
erase /f /q null
goto welcome 


:welcome
cls 
echo Made By Luan
echo Version: %version%
echo ------------------------------
echo -  The Oldest View Launcher  -
echo ------------------------------
echo.
echo (1) The Oldest View - Renewal
echo (2) The Oldest View - Beneath the Earth
echo (3) The Oldest View - Rolling Giant
echo (4) The Oldest View - Life of a Giant
echo (5) Visit Channel (Kane Pixels)
echo.
choice /c 12345
cls
if %errorlevel% equ 1 start %video1%
if %errorlevel% equ 2 start %video2%
if %errorlevel% equ 3 start %video3%
if %errorlevel% equ 4 start %video4%
if %errorlevel% equ 5 start %channel%
cls
goto welcome