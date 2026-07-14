#!/bin/bash
# 一键部署脚本（Mac / Linux / Git Bash）
# 用法: ./deploy.sh

set -e

cd "$(dirname "$0")"

echo "========================================"
echo "  部署博客到 GitHub Pages"
echo "========================================"
echo

# 1. 提交源代码
echo "[1/3] 提交源代码..."
git add .
if git diff --cached --quiet; then
    echo "源代码无变化，跳过提交。"
else
    read -p "是否提交源代码并部署? (y/N) " confirm
    if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
        echo "已取消。"
        exit 0
    fi
    git commit -m "deploy: $(date '+%Y-%m-%d %H:%M:%S')"
    git push
fi
echo

# 2. 构建
echo "[2/3] 构建静态文件..."
./tools/hugo.exe
echo

# 3. 部署到 gh-pages
echo "[3/3] 部署到 gh-pages..."
cd public

if [ ! -d ".git" ]; then
    echo "初始化 gh-pages 分支..."
    git init -b gh-pages
    git remote add origin "https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io.git"
fi

git add .
if git diff --cached --quiet; then
    echo "站点无变化，跳过部署。"
else
    git commit -m "deploy: $(date '+%Y-%m-%d %H:%M:%S')"
    git push -f origin gh-pages
fi

cd ..

echo
echo "========================================"
echo "  ✅ 部署完成！"
echo
echo "  几分钟后访问: https://KeNanXiaoLin.github.io/"
echo "========================================"
