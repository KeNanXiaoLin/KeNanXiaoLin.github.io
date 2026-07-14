---
title: "搭建这个博客踩过的坑"
subtitle: "记录一次静态博客的搭建过程"
date: 2026-07-12T14:00:00+08:00
lastmod: 2026-07-12T14:00:00+08:00
draft: false
author: "XiaoLin"
description: "记录搭建 Hugo 博客时遇到的一些问题和解决方法。"
tags: ["Hugo", "建站", "踩坑"]
categories: ["技术"]
toc:
  enable: true
  auto: true
code:
  copy: true
---

搭建个人博客听起来简单，但实际操作中还是会遇到一些坑。这篇文章记录我从零搭建这个博客时遇到的问题和解决方案。

<!--more-->

## 选型

最初面对的是技术选型。综合考虑后我选了 **Hugo + LoveIt 主题 + GitHub Pages**。

原因：

- Hugo 速度快、配置简单
- LoveIt 主题功能齐全、中文支持好
- GitHub Pages 免费、自动化部署

## 坑 1：下载 Hugo 二进制

Windows 下安装 Hugo 最简单的方式是从 GitHub Release 下载 `hugo_extended_*.zip`（extended 版本支持 SASS，LoveIt 主题需要）。

解压后建议把 `hugo.exe` 放到 PATH 包含的目录里，或者放在项目下用相对路径调用。

## 坑 2：Hugo extended 与 SASS

我一开始下载了普通版的 Hugo，结果发现 LoveIt 主题构建时疯狂报错。看了错误信息才发现 LoveIt 用了 SASS 来编译样式，必须用 **extended** 版。

## 坑 3：主题下载

直接 `git clone` 主题仓库到 `themes/` 目录是最简单的：

```bash
git clone https://github.com/dillonzq/LoveIt.git themes/LoveIt
```

但如果遇到网络问题，可以去 codeload.github.com 下载 zip 解压到 `themes/LoveIt`。

## 坑 4：GitHub Pages 部署

`hugo` 命令会在 `public/` 目录生成静态文件。GitHub Pages 的部署方式有两种：

1. **把 `public/` 推送到 `gh-pages` 分支**（最简单）
2. **用 GitHub Actions 自动构建**（更优雅）

我选了第一种，新建一个 `gh-pages` 分支只放构建产物。

```bash
# 第一次部署
hugo
cd public
git init
git checkout -b gh-pages
git add .
git commit -m "first deploy"
git push -f origin gh-pages
```

之后更新博客：

```bash
hugo
cd public
git add .
git commit -m "update"
git push -f origin gh-pages
```

## 坑 5：Giscus 评论

Giscus 是基于 GitHub Discussions 的评论系统，免费、无广告，配置简单：

1. 在你的 GitHub 仓库开启 Discussions 功能
2. 去 [giscus.app](https://giscus.app/zh-CN) 配置生成参数
3. 把生成的参数填到 `hugo.toml` 的 `[params.page.comment.giscus]` 段

## 写在最后

建站只是一个开始，坚持写才是更难的。

> 写下来，才是真正学会了。

下篇文章打算写点读书笔记。
