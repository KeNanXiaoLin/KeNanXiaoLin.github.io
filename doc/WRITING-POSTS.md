# 写文章

本文档介绍如何写一篇博客文章，包括 front matter 字段、Markdown 语法、LoveIt 主题的扩展功能。

## 创建新文章

### 命令行方式（推荐）

```bash
./tools/hugo.exe new content/posts/my-article.md
```

这会使用 `archetypes/default.md` 作为模板，生成一个文件，已经填好基础 front matter。

### 手动创建

在 `content/posts/` 下新建 `.md` 文件。文件名建议：

- ✅ 全英文、单词之间用 `-` 分隔，例如 `how-to-use-hugo.md`
- ❌ 避免中文文件名（部分系统会有兼容问题）
- ❌ 避免空格、特殊字符

## 文章模板

```markdown
---
title: "文章标题"
subtitle: "副标题（可选）"
date: 2026-07-14T10:00:00+08:00
lastmod: 2026-07-14T10:00:00+08:00
draft: false                       # ⚠️ 发布前改成 false
author: "XiaoLin"
description: "文章描述，会用于 SEO 和 RSS"
license: ""
images: []                         # OG 图片

tags: ["标签1", "标签2"]            # 多个标签
categories: ["分类"]                # 一个分类

# 以下一般不用改
toc:
  enable: true
  auto: true
code:
  copy: true
math:
  enable: false
comment:
  enable: true
---

<!--more-->

# 正文从这里开始
```

> ⚠️ `<!--more-->` 是分隔符。**它之前的内容**会作为摘要显示在首页列表里，**它之后的内容**才是正文。

## Front Matter 字段说明

### 必填字段

| 字段 | 说明 | 示例 |
| --- | --- | --- |
| `title` | 文章标题 | `"Markdown 语法速查"` |
| `date` | 发布时间 | `2026-07-14T10:00:00+08:00` |
| `draft` | 是否为草稿 | `false`（发布）/`true`（草稿） |

### 常用字段

| 字段 | 说明 | 示例 |
| --- | --- | --- |
| `lastmod` | 最后修改时间 | `2026-07-14T10:00:00+08:00` |
| `author` | 作者名 | `"XiaoLin"` |
| `description` | 描述（用于 SEO） | `"这是一篇..."` |
| `tags` | 标签数组 | `["技术", "Hugo"]` |
| `categories` | 分类数组 | `["技术"]` |
| `subtitle` | 副标题 | `"子标题"` |
| `images` | 封面图 | `["/images/cover.png"]` |
| `license` | 许可协议 | `"CC BY-NC 4.0"` |

### 高级字段

| 字段 | 说明 |
| --- | --- |
| `hiddenFromHomePage` | 是否从首页隐藏：`true`/`false` |
| `hiddenFromSearch` | 是否从搜索结果隐藏 |
| `featuredImage` | 文章特色图（顶部大图） |
| `weight` | 排序权重（数字越小越靠前） |

## 日期格式

Hugo 使用 Go 的时间格式，常见写法：

```yaml
date: 2026-07-14T10:00:00+08:00   # 带时区（推荐）
date: 2026-07-14                  # 仅日期
```

> ⚠️ Hugo **默认不发布未来日期的文章**。如果你写一篇文章时设的日期是"明天"，本地预览会看不到。需要发布时用 `./tools/hugo.exe --buildFuture`。

## Markdown 语法速查

### 基础

```markdown
# H1 标题
## H2 标题
### H3 标题
**粗体**  *斜体*  ~~删除线~~
`行内代码`
```

### 链接和图片

```markdown
[链接文字](https://example.com)

![图片描述](/images/photo.png)
```

> 💡 图片放在 `static/images/` 目录下，然后用 `/images/xxx.png` 引用。

### 列表

```markdown
- 无序项
- 无序项
  - 嵌套项
  - 嵌套项

1. 有序项
2. 有序项

- [x] 已完成任务
- [ ] 未完成任务
```

### 引用

```markdown
> 这是一段引用
> 可以跨多行
```

### 表格

```markdown
| 列1 | 列2 | 列3 |
| --- | --- | --- |
| A | B | C |
| 1 | 2 | 3 |
```

### 代码块

````markdown
```python
def hello():
    print("Hello, World!")
```

```javascript
console.log("Hello, World!");
```

```bash
echo "hello"
```
````

支持的语言高亮：python, javascript, typescript, bash, html, css, json, yaml, go, rust, java, c, cpp, sql, markdown... 几乎所有主流语言。

### 分割线

```markdown
---
```

## LoveIt 主题扩展功能

### 提示框（admonition）

```markdown
{{< admonition note >}}
这是一个普通提示
{{< /admonition >}}

{{< admonition tip >}}
这是一个小技巧
{{< /admonition >}}

{{< admonition warning >}}
这是一个警告
{{< /admonition >}}

{{< admonition danger >}}
这是一个危险警告
{{< /admonition >}}
```

可选类型：`note`, `tip`, `info`, `warning`, `danger`, `example`, `quote`, `success`, `question`, `failure`, `bug`, `abstract`

带标题：

```markdown
{{< admonition tip "标题" >}}
内容
{{< /admonition >}}
```

### 数学公式（需先开启）

在 front matter 中开启：

```yaml
math:
  enable: true
```

行内公式：`$E = mc^2$`

块级公式：

```markdown
$$
f(x) = \int_{-\infty}^{\infty} \hat{f}(\xi) e^{2\pi i \xi x} d\xi
$$
```

### Mermaid 图表

```markdown
{{< mermaid >}}
graph LR
  A[开始] --> B{判断}
  B -->|是| C[处理1]
  B -->|否| D[处理2]
{{< /mermaid >}}
```

### 链接到站内其他文章

```markdown
[欢迎来到我的博客](/posts/welcome/)

[Markdown 语法速查](/markdown-syntax-guide/)
```

### 引用人物卡片

```markdown
{{< person "https://github.com/dillonzq" "Dillon" "LoveIt 作者" >}}
```

### 链接到 GitHub 仓库

```markdown
{{< github "dillonzq/LoveIt" >}}
```

## 在文章里插入图片

### 步骤

1. 把图片放到 `static/images/` 目录
   ```
   static/
   └── images/
       └── my-photo.png
   ```
2. 在文章里引用：
   ```markdown
   ![描述](/images/my-photo.png)
   ```

### 推荐工具

- 截图：Windows 自带 `Win + Shift + S`
- 图片压缩：https://tinypng.com/
- 在线编辑：https://squoosh.app/

## 文章发布清单

发布一篇文章前，确认：

- [ ] 标题有意义（不只是"无标题"或"test"）
- [ ] 写好了 `description`（用于 SEO）
- [ ] 选择了合适的 `tags` 和 `categories`
- [ ] `draft: false`
- [ ] 日期不是未来时间
- [ ] 本地预览过 `http://localhost:1313/`
- [ ] 文字通顺、没有错别字
- [ ] 图片能正常显示

## 进阶：批量操作

### 删除一篇文章

```bash
rm content/posts/xxx.md
git add . && git commit -m "删除文章 xxx"
```

### 修改文章 URL

在 `hugo.toml` 中有：

```toml
[permalinks]
  posts = ":contentbasename"
```

这表示文章的 URL 是 `/<文件名>/`。修改文件名会改变 URL。

## 技巧

### 草稿

把 `draft: true` 即可变成草稿，**不会出现在公开网站**，但本地预览（`hugo server --buildDrafts`）可以看到。

### 定时发布

把 `date` 设为未来时间，使用 `hugo --buildFuture` 构建时才会包含。

### 加密 / 私密文章

LoveIt 主题**不**支持密码保护文章。如果需要私密内容，请勿发布到公开博客。

### 多语言

本项目目前**仅中文**。如果以后要加英文，参考 LoveIt 主题的多语言配置，把文章放在 `content/posts/` 下，前缀语言码（如 `welcome.en.md`）。
