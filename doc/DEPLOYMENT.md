# 部署到 GitHub Pages

本文档详细说明如何把博客部署到 GitHub Pages，让别人能通过 https://KeNanXiaoLin.github.io/ 访问。

## 部署架构

我们使用 **双分支** 模式：

- **`main` 分支**：存放源文件（Hugo 配置、Markdown 文章、主题等）
- **`gh-pages` 分支**：存放 Hugo 构建出来的静态网站（HTML、CSS、JS）

每次发布流程：

```
写文章 → 提交到 main → 构建 → 推送到 gh-pages → 自动部署
```

## 前置准备

### 1. 创建 GitHub 仓库

1. 登录 GitHub
2. 点击右上角 `+` → `New repository`
3. **Repository name** 填写：`KeNanXiaoLin.github.io`（**必须**是 `<你的用户名>.github.io` 格式）
4. 选择 **Public**（公开）
5. **不要**勾选 "Add a README file"（我们本地已经有了）
6. 点击 **Create repository**

### 2. 确认 Hugo 配置正确

打开 `hugo.toml`，确认 `baseURL` 与你的仓库地址一致：

```toml
baseURL = "https://KeNanXiaoLin.github.io/"
```

## 第一种部署方式：手动部署（最简单）

### 首次部署

```bash
# 在博客根目录
cd E:\Code\WebBlog

# 1. 把 main 分支推送到 GitHub（保存源文件）
git remote add origin https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io.git
git add .
git commit -m "initial commit"
git branch -M main
git push -u origin main

# 2. 构建静态文件
./tools/hugo.exe

# 3. 部署到 gh-pages 分支
cd public
git init -b gh-pages
git add .
git commit -m "first deploy"
git remote add origin https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io.git
git push -f origin gh-pages

# 4. 回到上级目录
cd ..
```

### 之后每次更新

```bash
# 1. 提交源文件到 main
git add .
git commit -m "写了一篇新文章"
git push

# 2. 重新构建并部署
./tools/hugo.exe
cd public
git add .
git commit -m "update"
git push -f origin gh-pages
cd ..
```

### 简化命令（可选）

在 `WebBlog` 根目录创建一个 `deploy.sh` 脚本（Windows 用 `deploy.bat`）：

**deploy.bat**（Windows）：

```bat
@echo off
echo Building site...
.\tools\hugo.exe
echo Deploying to gh-pages...
cd public
git add .
git commit -m "deploy %date% %time%"
git push -f origin gh-pages
cd ..
echo Done!
pause
```

**deploy.sh**（Mac/Linux）：

```bash
#!/bin/bash
set -e
echo "Building site..."
./tools/hugo.exe
echo "Deploying to gh-pages..."
cd public
git add .
git commit -m "deploy $(date '+%Y-%m-%d %H:%M:%S')"
git push -f origin gh-pages
cd ..
echo "Done!"
```

以后只需要：

```bash
./deploy.bat    # Windows
# 或
./deploy.sh     # Mac/Linux
```

## 第二种部署方式：GitHub Actions 自动部署（推荐）

> 💡 这个方式更优雅：每次 `git push` 到 main，GitHub 自动帮你构建并部署到 gh-pages。但配置稍复杂。

### 1. 在 GitHub 仓库设置 Pages

- 进入 GitHub 仓库页面
- **Settings** → **Pages**
- **Source** 选择 **Deploy from a branch**
- **Branch** 选择 **gh-pages** / **root**
- 点击 **Save**

### 2. 删除本地的 public/ 部署

不再需要手动管理 `public/`。改成让 GitHub Actions 帮你构建。

### 3. 创建 GitHub Actions 配置文件

在 `WebBlog/.github/workflows/hugo.yml` 创建文件：

```yaml
name: Deploy Hugo site to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: false

defaults:
  run:
    shell: bash

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        with:
          submodules: false

      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v3
        with:
          hugo-version: '0.164.0'
          extended: true

      - name: Build
        run: hugo --minify

      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

### 4. 把 public/ 加入 .gitignore

编辑项目根目录的 `.gitignore`：

```gitignore
# Hugo 输出
public/
resources/_gen/

# 工具
tools/hugo.exe
```

> ⚠️ 但保留 `tools/loveit.zip` 等本地资源，方便重新安装。

### 5. 推送

```bash
git add .github/workflows/hugo.yml .gitignore
git commit -m "添加 GitHub Actions 自动部署"
git push
```

之后每次更新博客，只需要：

```bash
git add .
git commit -m "新文章"
git push
```

GitHub 会自动构建并部署，1-2 分钟后博客就会更新。

## 验证部署成功

部署完成后：

1. 打开 https://KeNanXiaoLin.github.io/
2. 应该能看到你的博客
3. 进入 GitHub 仓库的 **Actions** 标签页，可以看到构建状态
4. 进入 **Settings** → **Pages** 可以看到部署 URL

## 常见问题

### Q1: 部署后访问 404

**A**: 检查：
- 仓库名是否严格匹配 `<用户名>.github.io`（区分大小写）
- GitHub Pages 设置中分支是否选择 `gh-pages`、目录是否选择 `/ (root)`
- 是否等待了 1-2 分钟（GitHub Pages 部署有延迟）

### Q2: CSS/JS 加载失败，页面是纯文本

**A**: `baseURL` 配置不对。Hugo 生成静态文件时使用 `baseURL` 作为资源前缀。
打开 `hugo.toml`，确保 `baseURL = "https://KeNanXiaoLin.github.io/"`（带末尾斜杠）。

### Q3: 评论无法加载

**A**: Giscus 需要先在 GitHub 仓库开启 Discussions 功能，并在 `hugo.toml` 配置正确的 `repoId` 和 `categoryId`。详见 [GISCUS.md](./GISCUS.md)。

### Q4: 怎么绑定自定义域名？

**A**:
1. 购买域名（阿里云、Cloudflare 等）
2. 在域名 DNS 添加 CNAME 记录指向 `KeNanXiaoLin.github.io`
3. 在 GitHub 仓库 **Settings** → **Pages** → **Custom domain** 填写你的域名
4. 在 `static/CNAME` 文件中写入你的域名（让 Hugo 部署时带上）
5. 等待 DNS 生效（最长 24 小时）

## 推荐工作流

| 步骤 | 命令 | 频率 |
| --- | --- | --- |
| 写新文章 | `hugo new content/posts/xxx.md` | 每次 |
| 本地预览 | `hugo server` | 写文章时 |
| 提交源文件 | `git add . && git commit -m "..."` | 每天/每篇文章 |
| 部署上线 | `git push` (用 Actions) 或 `./deploy.bat` (手动) | 写完想发布时 |
