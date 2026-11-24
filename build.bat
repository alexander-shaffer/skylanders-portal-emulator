@echo off
where winget > nul 2>&1

if %ERRORLEVEL% neq 0 (
  echo Failed to find winget.
  exit 1
)

winget list --accept-source-agreements --disable-interactivity --id Git.Git > nul 2>&1

if %ERRORLEVEL% neq 0 (
  echo Installing Git...
  winget install --silent --accept-source-agreements --accept-package-agreements --disable-interactivity --id Git.Git
)

start "" /wait "%~dp0build.sh" %*
