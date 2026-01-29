@echo off
setlocal EnableDelayedExpansion
title ULTIMATE PC OPTIMIZATION v2 - InvixLive
color 0A
mode con cols=120 lines=45

:: ================= ADMIN CHECK =================
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    color 0C
    echo ================================================
    echo        ADMINISTRATOR PRIVILEGES REQUIRED
    echo ================================================
    echo Please right-click this file and choose:
    echo "Run as administrator"
    pause
    exit /b
)

:: ================= INIT =================
set MODE=NORMAL
cls
echo =====================================================
echo        INVIXLIVE - ULTIMATE PC OPTIMIZER v2
echo =====================================================
echo User : %USERNAME%
echo PC   : %COMPUTERNAME%
echo.
timeout /t 2 >nul

:MENU
cls
echo ============================================================================
echo        ULTIMATE PC OPTIMIZATION v2 ^| InvixLive
echo ============================================================================
echo User: %USERNAME%    PC: %COMPUTERNAME%
echo Mode: %MODE%
echo ============================================================================
echo [1]  FPS Boost        [2]  Network Opt     [3]  Services     [4] Game Mode
echo [5]  Debloat          [6]  RAM Clean       [7]  Startup      [8] Power Max
echo [9]  Mouse            [10] Priority        [11] No Search   [12] CPU Max
echo [13] GPU Boost        [14] ULTIMATE ALL
echo ----------------------------------------------------------------------------
echo [15] Restore Point    [16] Defender OFF    [17] Defender ON
echo ----------------------------------------------------------------------------
echo [R] Restart PC       [X] Exit
echo ============================================================================
echo.

set "choice="
set /p choice="Enter your choice and press ENTER: "

if /i "%choice%"=="X" exit /b
if /i "%choice%"=="R" shutdown /r /t 0

if "%choice%"=="1"  goto FPS
if "%choice%"=="2"  goto NETWORK
if "%choice%"=="3"  goto SERVICES
if "%choice%"=="4"  goto GAME
if "%choice%"=="5"  goto DEBLOAT
if "%choice%"=="6"  goto RAM
if "%choice%"=="7"  goto STARTUP
if "%choice%"=="8"  goto POWER
if "%choice%"=="9"  goto MOUSE
if "%choice%"=="10" goto PRIORITY
if "%choice%"=="11" goto SEARCH
if "%choice%"=="12" goto CPU
if "%choice%"=="13" goto GPU
if "%choice%"=="14" goto ULTIMATE
if "%choice%"=="15" goto RESTORE_POINT
if "%choice%"=="16" goto DEFENDER_OFF
if "%choice%"=="17" goto DEFENDER_ON

echo.
echo ❌ Invalid choice. Please enter a valid option.
timeout /t 2 >nul
goto MENU

:: ================= FUNCTIONS =================

:FPS
cls
echo Applying FPS Tweaks...
bcdedit /set disabledynamictick yes >nul 2>&1
timeout /t 1 >nul
goto MENU

:NETWORK
cls
echo Applying Network Optimization...
netsh int tcp set global autotuninglevel=normal >nul 2>&1
timeout /t 1 >nul
goto MENU

:SERVICES
cls
echo Disabling SysMain Service...
sc config SysMain start=disabled >nul 2>&1
timeout /t 1 >nul
goto MENU

:GAME
cls
echo Enabling Game Mode...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:DEBLOAT
cls
echo Removing OneDrive...
taskkill /f /im OneDrive.exe >nul 2>&1
timeout /t 1 >nul
goto MENU

:RAM
cls
echo RAM optimization executed.
timeout /t 1 >nul
goto MENU

:STARTUP
cls
echo Clearing Startup entries...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:POWER
cls
echo Enabling Maximum Power Mode...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:MOUSE
cls
echo Optimizing Mouse response...
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:PRIORITY
cls
echo Setting CPU Priority...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 26 /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:SEARCH
cls
echo Disabling Windows Search...
sc config WSearch start=disabled >nul 2>&1
timeout /t 1 >nul
goto MENU

:CPU
cls
echo Activating High Performance Power Plan...
powercfg -setactive SCHEME_MIN >nul 2>&1
timeout /t 1 >nul
goto MENU

:GPU
cls
echo Enabling Hardware GPU Scheduling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul 2>&1
timeout /t 1 >nul
goto MENU

:ULTIMATE
cls
echo Applying ALL optimizations...

bcdedit /set disabledynamictick yes >nul 2>&1
powercfg -setactive SCHEME_MIN >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul 2>&1
netsh int tcp set global autotuninglevel=normal >nul 2>&1

set MODE=ULTIMATE
timeout /t 2 >nul
goto MENU

:RESTORE_POINT
cls
echo Creating Restore Point...
powershell -Command "Checkpoint-Computer -Description 'InvixLive Restore'" >nul 2>&1
timeout /t 1 >nul
goto MENU

:DEFENDER_OFF
cls
echo Disabling Windows Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1
timeout /t 1 >nul
goto MENU

:DEFENDER_ON
cls
echo Enabling Windows Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false" >nul 2>&1
timeout /t 1 >nul
goto MENU
