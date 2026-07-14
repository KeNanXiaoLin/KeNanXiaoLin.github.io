# 快速开始

本文档教你如何在本地预览博客、写新文章、发布到 GitHub。

## 0. 前置条件

确保你已经安装：

- ✅ **Hugo（extended 版）** — 在 `tools/hugo.exe`
- ✅ **Git** — 用于版本管理
- ✅ **一个文本编辑器** — 推荐 [VS Code](https://code.visualstudio.com/)

## 1. 启动本地预览服务器

打开终端，进入博客目录：

```bash
cd E:\Code\WebBlog
```

启动 Hugo 开发服务器（带热重载，修改文件后浏览器自动刷新）：

```bash
./tools/hugo.exe server
```

打开浏览器访问 [http://localhost:1313/](http://localhost:1313/)。

> 💡 **看到博客首页 = 一切正常。**
> 按 `Ctrl+C` 停止服务器。

## 2. 写你的第一篇文章

### 方法 A：用命令行创建（推荐）

```bash
./tools/hugo.exe new content/posts/my-first-post.md
```

这会在 `content/posts/` 下创建一个新文件，已经填好了 front matter（标题、日期等）。你只需要修改标题和写正文。

### 方法 B：手动复制现有文章

复制 `content/posts/welcome.md`，重命名后修改。

### 文章结构

每篇文章的开头需要这段 YAML 格式的配置（front matter）：

```yaml
---
title: "我的第一篇文章"          # 必填：标题
date: 2026-07-14T10:00:00+08:00  # 必填：发布时间
lastmod: 2026-07-14T10:00:00+08:00  # 可选：最后修改时间
draft: false                     # 发布前保持 false
author: "XiaoLin"                # 作者名
description: "这是描述"           # 摘要（用于 SEO）
tags: ["标签1", "标签2"]           # 标签
categories: ["分类"]               # 分类
---
```

`---` 下面写正文，使用 [Markdown 语法](https://markdown.com.cn/)。完整的 Markdown 速查表见 `WRITING-POSTS.md`。

## 3. 修改后查看效果

保存文件后，浏览器会自动刷新（如果你启动了 `hugo server`）。

如果改了 `hugo.toml` 配置文件，Hugo 也会自动重新加载。

## 4. 修改个人信息

打开 `hugo.toml`，找到 `[params]` 段：

```toml
[params.author]
  name = "XiaoLin"            # ← 改成你的名字
  email = "2496463252@qq.com"  # ← 改成你的邮箱
  link = "https://github.com/KeNanXiaoLin"  # ← 改成你的主页

[params.home.profile]
  gravatarEmail = "2496463252@qq.com"  # Gravatar 邮箱
  avatarURL = "/images/avatar.png"      # 头像图片路径
  subtitle = "以为热爱技术的菜鸟"        # 博客副标题
```

更多自定义选项见 `CONFIGURATION.md`。

## 5. 部署到 GitHub Pages

完整流程见 [DEPLOYMENT.md](./DEPLOYMENT.md)。简要版：

```bash
# 第一次部署需要先创建 GitHub 仓库
# 仓库名必须是 <你的用户名>.github.io

# 配置远程仓库
git remote add origin https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io.git

# 构建并推送到 gh-pages 分支
./tools/hugo.exe
cd public
git init -b gh-pages
git add .
git commit -m "first deploy"
git push -f origin gh-pages

# 回到上级目录
cd ..
```

## 常用命令速查

| 命令 | 作用 |
| --- | --- |
| `./tools/hugo.exe server` | 启动本地预览（带热重载） |
| `./tools/hugo.exe` | 构建静态文件到 `public/` |
| `./tools/hugo.exe new content/posts/xxx.md` | 创建新文章 |
| `git add .` | 暂存所有修改 |
| `git commit -m "msg"` | 提交修改 |
| `git push` | 推送到 GitHub |

## 遇到问题？

- Hugo 报错 → 看错误信息，通常是 front matter 格式问题
- 文章没显示 → 检查 `draft: false` 和日期不是未来时间
- 主题报错 → 确认用的是 **extended** 版 Hugo
- 其他问题 → 查看 Hugo 官方文档：https://gohugo.io/documentation/
