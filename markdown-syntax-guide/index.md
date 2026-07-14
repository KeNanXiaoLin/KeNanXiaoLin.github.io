# Markdown 语法速查


这是一篇速查表，覆盖了在 Hugo + LoveIt 主题下写文章时最常用的 Markdown 语法。收藏起来，写文章的时候随时翻一翻。

<!--more-->

## 标题

```markdown
## 二级标题
### 三级标题
#### 四级标题
```

效果：

## 二级标题
### 三级标题
#### 四级标题

## 文字样式

```markdown
**粗体** 和 *斜体* 和 ~~删除线~~

`行内代码`
```

效果：**粗体** 和 *斜体* 和 ~~删除线~~

`行内代码`

## 列表

无序列表：

- 苹果
- 香蕉
  - 子项
  - 另一个子项
- 樱桃

有序列表：

1. 第一步
2. 第二步
3. 第三步

任务列表（注意中括号里的空格和 x）：

- [x] 已完成
- [ ] 未完成
- [x] 再来一个已完成

## 链接和图片

```markdown
[GitHub](https://github.com)

![图片描述](/images/example.png)
```

## 引用

> 这是一段引用
> 
> —— 鲁迅（不是我编的）

## 表格

```markdown
| 列1 | 列2 | 列3 |
| --- | --- | --- |
| A | B | C |
| 1 | 2 | 3 |
```

| 列1 | 列2 | 列3 |
| --- | --- | --- |
| A | B | C |
| 1 | 2 | 3 |

## 代码块

```python
def hello(name: str) -> str:
    return f"Hello, {name}!"

print(hello("XiaoLin"))
```

```javascript
const greet = (name) => {
    console.log(`Hello, ${name}!`);
};
greet("XiaoLin");
```

```bash
# 常用命令
git add .
git commit -m "update"
git push
```

## 分割线

---

上面是一条分割线。

## Front Matter

每篇文章开头都需要以下 front matter（YAML）：

```yaml
---
title: "文章标题"
date: 2026-07-14T10:00:00+08:00
draft: false  # 改为 false 才会发布
tags: ["标签1", "标签2"]
categories: ["分类"]
---
```

字段说明：

- `title` — 文章标题（必填）
- `date` — 发布日期
- `draft` — 是否为草稿，发布前保持 `false`
- `tags` — 标签列表
- `categories` — 分类
- `description` — 描述，用于 SEO 和 RSS

## 提示框（LoveIt 扩展）

```markdown
{{< admonition tip >}}
这是一条提示
{{< /admonition >}}
```

{{< admonition tip >}}
这是一条提示 🎉
{{< /admonition >}}

{{< admonition warning >}}
这是一条警告 ⚠️
{{< /admonition >}}

## 链接到站内文章

```markdown
[欢迎来到我的博客](/posts/welcome/)
```

效果：[欢迎来到我的博客](/posts/welcome/)

---

写完文章记得 `git push` 哦。

