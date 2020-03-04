cd /d %~dp0
vagrant up

@echo off
:loop
  curl http://localhost:20772  > nul
  if not %ERRORLEVEL%==0 goto :eof
  powershell sleep 10
goto :loop
