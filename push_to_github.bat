@echo off
title TWRP Build & Flash - Symphony Z60+
setlocal enabledelayedexpansion

echo =============================================
echo  TWRP Builder for Symphony Z60+
echo  Unisoc T616 / UMS9230 - Virtual A/B
echo =============================================
echo.

:: Check GitHub token
if "%GH_TOKEN%"=="" (
    if "%GITHUB_TOKEN%"=="" (
        echo [!] GitHub token not found!
        echo     Set environment variable:
        echo     set GH_TOKEN=your_github_token
        echo.
        set /p GH_TOKEN="Enter GitHub token: "
    ) else (
        set "GH_TOKEN=%GITHUB_TOKEN%"
    )
)

:: GitHub username
set /p GH_USER="GitHub username: "

:: Repo name
set "REPO_NAME=twrp_Z60_plus"

echo.
echo [1/5] Initializing git repo...
cd /d "F:\Z60_plus_HW2_V15_extracted\twrp-Z60_plus"
if exist ".git" rmdir /s /q ".git"
git init
git checkout -b main

echo.
echo [2/5] Adding files...
git add -A
git commit -m "Initial TWRP device tree for Symphony Z60+"

echo.
echo [3/5] Creating GitHub repo via API...
curl -s -H "Authorization: token %GH_TOKEN%" -H "Accept: application/vnd.github.v3+json" ^
  -d "{\"name\":\"%REPO_NAME%\",\"description\":\"TWRP for Symphony Z60+ (Unisoc T616)\",\"private\":false}" ^
  https://api.github.com/user/repos

echo.
echo [4/5] Pushing to GitHub...
git remote add origin https://%GH_USER%:%GH_TOKEN%@github.com/%GH_USER%/%REPO_NAME%.git
git push -u origin main --force

echo.
echo [5/5] Triggering build...
echo.
echo Build started! Monitor at:
echo https://github.com/%GH_USER%/%REPO_NAME%/actions
echo.
echo Build finishes -> download boot.img from Actions tab
echo.
echo ============ FLASH INSTRUCTIONS ============
echo 1. Download boot.img from GitHub Actions
echo 2. fastboot flash boot_a boot.img
echo 3. fastboot flash vbmeta --disable-verity --disable-verification vbmeta-sign.img
echo 4. fastboot reboot recovery
echo ============================================
pause
