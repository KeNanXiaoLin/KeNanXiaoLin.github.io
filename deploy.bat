@echo off
chcp 65001 >nul
setlocal

echo ========================================
echo   部署博客到 GitHub Pages
echo ========================================
echo.

cd /d "%~dp0"

REM ========== 1. 提交源代码到 main ==========
echo [1/3] 提交源代码...
git add .
git status --short
echo.

set /p CONFIRM="是否提交源代码并部署? (y/N): "
if /i not "%CONFIRM%"=="y" (
    echo 已取消。
    pause
    exit /b 0
)

git diff --cached --quiet
if %ERRORLEVEL% EQU 0 (
    echo 源代码无变化，跳过提交。
) else (
    git commit -m "deploy: %date% %time%"
    git push
    if %ERRORLEVEL% NEQ 0 (
        echo [错误] 推送到 main 失败！
        pause
        exit /b 1
    )
)
echo.

REM ========== 2. 构建静态文件 ==========
echo [2/3] 构建静态文件...
.\tools\hugo.exe
if %ERRORLEVEL% NEQ 0 (
    echo [错误] Hugo 构建失败！
    pause
    exit /b 1
)
echo.

REM ========== 3. 部署到 gh-pages ==========
echo [3/3] 部署到 gh-pages...
cd public

REM 首次部署需要初始化
if not exist ".git" (
    echo 初始化 gh-pages 分支...
    git init -b gh-pages
    git remote add origin ..\..\.git
    REM 修正 remote URL
    git remote remove origin
    git remote add origin https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io.git
)

git add .
git diff --cached --quiet
if %ERRORLEVEL% EQU 0 (
    echo 站点无变化，跳过部署。
) else (
    git commit -m "deploy: %date% %time%"
    git push -f origin gh-pages
    if %ERRORLEVEL% NEQ 0 (
        echo [错误] 推送到 gh-pages 失败！
        pause
        exit /b 1
    )
)

cd ..

echo.
echo ========================================
echo   ✅ 部署完成！
echo.
echo   几分钟后访问: https://KeNanXiaoLin.github.io/
echo ========================================
echo.
pause
