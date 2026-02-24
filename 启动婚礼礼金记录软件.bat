@echo off
setlocal

set "HTML="

for %%F in ("%~dp0*.html") do (
  echo %%~nF | findstr /C:"_v" >nul
  if errorlevel 1 (
    set "HTML=%%~fF"
    goto :found
  )
)

:found

if not defined HTML (
  echo Main HTML file not found.
  pause
  exit /b 1
)

if not exist "%HTML%" (
  echo HTML file not found:
  echo %HTML%
  pause
  exit /b 1
)

start "" "%HTML%"
exit /b 0
