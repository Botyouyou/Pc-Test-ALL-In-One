@echo off
color f1
cls

:MainMenu
echo ************************************************************
echo *                  PC Testing ToolKit ;)                   *
echo ************************************************************
echo.
echo 1. Check Battery Report
echo 2. Keyboard TEST
echo 3. Check Windows Activation
echo 4. Activate Windows/Office...._HWID_
echo 5. PowerMax Installation Cpu/Gpu Test
echo 6. HwMonitor Installation Temp Monitor
echo 7. System/Drivers Updates
echo 8. Create Desktop shortcut
echo 9. Check Power Settings
echo.
set /p choice=Enter the number of the option (1-9): 

if "%choice%"=="1" call :Window1
if "%choice%"=="9" call :Window2
if "%choice%"=="3" call :Window3
if "%choice%"=="4" call :Window4
if "%choice%"=="5" call :Window5
if "%choice%"=="6" call :Window6
if "%choice%"=="7" call :Window7
if "%choice%"=="8" call :Window8
if "%choice%"=="2" call :Window9

echo Invalid choice. Please enter a number between 1 and 9.
timeout /nobreak /t 2 >nul
goto MainMenu

:Window1
cls
echo -------------------------
echo Option 1 - Check Battery Report
echo Generating battery report...
powercfg /batteryreport
echo Battery report generated. Opening...
start battery-report.html
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window2
cls
echo -------------------------
echo Option 2 - Check Power Settings
echo Checking power settings...
powercfg /query
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window3
cls
echo -------------------------
echo Option 3 - Check Windows Activation
echo Checking Windows activation...
slmgr /xpr
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window4
cls
echo -------------------------
echo Option 4 - Activate Windows/Office
echo Running PowerShell script...
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://massgrave.dev/get | iex"
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window5
cls
echo -------------------------
echo Option 5 - CPU/GPU TEST
echo Downloading and installing CPU/GPU testing software...

:: Creating a temporary directory for the installer
set "tempDir=%TEMP%\CPU_GPU_TEST"
mkdir "%tempDir%"

:: Downloading the installer
powershell -Command "& {Invoke-WebRequest -Uri 'https://download.cpuid.com/powermax/powermax_1.00_setup.exe' -OutFile '%tempDir%\powermax_setup.exe'}"

:: Installing the software silently (hypothetical /S parameter for silent install)
"%tempDir%\powermax_setup.exe" /S

:: Cleaning up temporary files
rmdir /s /q "%tempDir%"

echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window6
cls
echo ************************************************************
echo *                HWMonitor Installation                    *
echo ************************************************************
echo.
echo 1. Install HWMonitor
echo 2. Back to main menu
echo.
set /p choice=Enter the number of the option (1-2): 

if "%choice%"=="1" call :InstallHWMonitor
if "%choice%"=="2" goto MainMenu

echo Invalid choice. Please enter a number between 1 and 2.
timeout /nobreak /t 2 >nul
goto MainMenu

:InstallHWMonitor
echo Downloading HWMonitor installer...
powershell -Command "& {Invoke-WebRequest -Uri 'https://download.cpuid.com/hwmonitor/hwmonitor_1.52.exe' -OutFile 'hwmonitor_1.52.exe'}"

echo Installing HWMonitor...
powershell -Command "& {Start-Process -FilePath 'hwmonitor_1.52.exe' -ArgumentList '/S' -Wait}"

echo Installation complete.

echo Press any key to go back to the MainMenu menu.
pause >nul
goto MainMenu


:Window7
cls
echo -------------------------
echo Option 7 - Initiate Windows Update and Update Drivers
echo Performing updates...

:: Initiate Windows Update
powershell -Command "& { Start-Process 'ms-settings:windowsupdate-action' }"

:: Update drivers using PowerShell (requires administrator privileges)
powershell -Command "& { Start-Process 'powershell.exe' -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command ""& { Get-WindowsDriver -Online | Update-WindowsDriver -Verbose }""' -Verb RunAs }"

echo Updates initiated.
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu


:Window8
cls
echo -------------------------
echo Option 8 - Create Desktop Icons (This PC, Control Panel, User Files, Windows Update)
echo Creating desktop icons...

:: Creating shortcut for This PC
cscript //NoLogo ThisPC.vbs

:: Creating shortcut for Control Panel
cscript //NoLogo ControlPanel.vbs

:: Creating shortcut for User Files
cscript //NoLogo UserFiles.vbs


echo Desktop icons created.
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu

:Window9
cls
echo -------------------------
echo Option 9 - Download and Launch Keyboard Test Utility
echo Downloading and launching Keyboard Test Utility...

:: Creating a temporary directory for the installer
set "tempDir=%TEMP%\KeyboardTestUtility"
mkdir "%tempDir%"

:: Downloading the installer
powershell -Command "& {Invoke-WebRequest -Uri 'https://www.lo4d.com/get-file/keyboard-test-utility/c72f00e5405136df7e7f7cffe87b253f/' -OutFile '%tempDir%\KeyboardTestUtility.exe'}"

:: Launching the downloaded installer
"%tempDir%\KeyboardTestUtility.exe"

:: Cleaning up temporary files
rmdir /s /q "%tempDir%"

echo Keyboard Test Utility downloaded and launched.
echo.
echo Press any key to go back to the main menu.
pause >nul
goto MainMenu
