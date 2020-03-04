@echo off
setlocal

set SERVICE_NAME=centos
set SCRIPT_DIRECTORY=C:\Users\kenimai\github\global\shibadog\vagrant-service
set START_SCRIPT=%SCRIPT_DIRECTORY%\start_and_check.bat
set STOP_SCRIPT=%SCRIPT_DIRECTORY%\halt.bat
set LOG_FILE=%SCRIPT_DIRECTORY%\service.log

REM Install
nssm install %SERVICE_NAME% %START_SCRIPT%

REM Application tab
nssm set %SERVICE_NAME% Application %START_SCRIPT%
nssm set %SERVICE_NAME% AppDirectory %SCRIPT_DIRECTORY%

REM Details tab
nssm set %SERVICE_NAME% DisplayName %SERVICE_NAME%
REM * SERVICE_AUTO_START: Automatic startup at boot.
REM * SERVICE_DELAYED_START: Delayed startup at boot.
REM * SERVICE_DEMAND_START: Manual startup.
REM * SERVICE_DISABLED: Service is disabled.
nssm set %SERVICE_NAME% Start SERVICE_DELAYED_START

REM Log on tab
nssm set %SERVICE_NAME% ObjectName xxxx yyyy

REM Process tab
nssm set %SERVICE_NAME% AppNoConsole 0

REM Shutdown tab
nssm set %SERVICE_NAME% AppStopMethodSkip 1

REM I/O tab
nssm set %SERVICE_NAME% AppStdout %LOG_FILE%
nssm set %SERVICE_NAME% AppStderr %LOG_FILE%

REM Hooks tab
nssm set centos AppEvents Stop/Pre %STOP_SCRIPT%
nssm set centos AppEvents Exit/Post %STOP_SCRIPT%

endlocal
