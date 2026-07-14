---
title: "《代码整洁之道》读书笔记"
subtitle: "Clean Code 重点摘录"
date: 2026-07-14T08:00:00+08:00
lastmod: 2026-07-14T08:00:00+08:00
draft: false
author: "XiaoLin"
description: "重读《代码整洁之道》时的一些笔记。"
tags: ["读书笔记", "编程"]
categories: ["读书"]
toc:
  enable: true
  auto: true
code:
  copy: true
---

最近重读了 Robert C. Martin 的《Clean Code》，把一些对我有启发的段落和我的思考整理下来。

<!--more-->

## 什么是有意义的命名

> 使用能够表达意图的命名。
> —— Robert C. Martin

变量、函数、类的命名要回答三个问题：**为什么存在、做什么、怎么用**。

差的命名：

```python
def get_data(d):
    pass
```

好的命名：

```python
def fetch_user_profile(user_id: int) -> UserProfile:
    pass
```

## 函数应该短小

> 函数的第一规则是短小，第二规则是更短小。

一个函数做一件事。判断标准：**如果还能再拆出一个函数，那就拆**。

## 注释是不得已而为之

> 好的代码本身就是最好的文档。

能用代码说清楚的就别写注释。注释存在的唯一理由是：**代码说不清楚的**。

## 一些具体的小习惯

- 布尔变量用 `is_xxx`、`has_xxx` 开头
- 函数动词开头： `get_xxx`、`create_xxx`、`delete_xxx`
- 常量大写加下划线
- 避免魔法数字，用常量
- 错误处理优于返回错误码

## 写代码是一次与人协作的过程

> 代码是写给人看的，恰好机器能执行。

三个月后看自己写的代码会感谢当时写得清晰的自己。也会骂当时偷懒的自己。

## 还在读

书还没读完，先记到这里。下次再补充章节。
