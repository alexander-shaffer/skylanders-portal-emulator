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

:: Manually update the PATH environment variable to avoid starting a new terminal window.
for /f "delims=" %%a in ('powershell -NoProfile -Command ^
  "[System.Environment]::GetEnvironmentVariable('Path', 'Machine') + ';' + [System.Environment]::GetEnvironmentVariable('Path', 'User')"') ^
do (
  set PATH=%%a
)

:: Execute build.sh using bash.exe to avoid opening a Git Bash terminal window.
for /f "delims=" %%a in ('where git') do (
  "%%~dpa..\bin\bash.exe" "%~dp0build.sh" %*
)
