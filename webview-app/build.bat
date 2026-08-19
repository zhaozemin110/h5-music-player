@echo off
setlocal enabledelayedexpansion
set "JAVA_HOME=%~dp0..\apkworkspace\jdk17\zulu17.68.17-ca-jdk17.0.20-win_x64"
set "ANDROID_HOME=%~dp0..\apkworkspace\android-sdk"
set "PATH=%JAVA_HOME%\bin;%~dp0..\apkworkspace\gradle-8.9\bin;%PATH%"

echo ===== H5 音乐播放器 · 一键打包 =====
echo JAVA_HOME   = %JAVA_HOME%
echo ANDROID_HOME = %ANDROID_HOME%
echo gradle     =
gradle --version 2>nul | findstr "Gradle"

cd /d "%~dp0"
echo.
echo [1/2] clean
gradle clean --no-daemon --quiet
echo [2/2] assembleRelease
gradle assembleRelease --no-daemon

set "OUT=%~dp0app\build\outputs\apk\release\app-release.apk"
if exist "%OUT%" (
    echo.
    echo ===== 打包成功 =====
    echo APK: %OUT%
) else (
    echo.
    echo ===== 打包失败：未找到 APK =====
    exit /b 1
)
endlocal