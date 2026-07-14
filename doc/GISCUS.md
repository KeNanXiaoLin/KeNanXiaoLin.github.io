# 配置 Giscus 评论系统

[Giscus](https://giscus.app/zh-CN) 是一个基于 GitHub Discussions 的开源评论系统。优点：

- ✅ 完全免费
- ✅ 无广告、无追踪
- ✅ 数据存储在你的 GitHub 仓库
- ✅ 支持 Markdown
- ✅ 支持多语言
- ✅ 自动适配深色/浅色主题

## 配置步骤

### 1. 启用 GitHub Discussions

1. 打开你的 GitHub 仓库：https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io
2. 点击 **Settings**（设置）
3. 滚动到 **Features** 部分
4. 勾选 ✅ **Discussions**
5. 点击 **Set up discussions** 按钮
6. 按提示创建一个 Category（建议保留默认的 **Announcements** 和 **General**）

> ⚠️ Giscus 推荐使用一个**专用的**讨论分类（如 `Comments`）来存放评论，避免和正常的 Discussions 混在一起。但用默认的 `Announcements` 也可以。

### 2. 安装 Giscus App

1. 打开 https://github.com/apps/giscus
2. 点击 **Install**
3. 选择 **Only select repositories**
4. 选择你的 `KeNanXiaoLin.github.io` 仓库
5. 点击 **Install**

### 3. 获取配置参数

1. 打开 https://giscus.app/zh-CN
2. 在表单里填写：
   - **语言**：选择 `简体中文`
   - **仓库**：填 `KeNanXiaoLin/KeNanXiaoLin.github.io`
   - **页面 ↔ discussion 映射关系**：推荐 `pathname`
   - **Discussion 分类**：选择 `Announcements`（或你刚创建的分类）
   - **功能**：按需勾选（建议全开）
3. 页面会显示一段配置参数：

```js
<script src="https://giscus.app/client.js"
        data-repo="KeNanXiaoLin/KeNanXiaoLin.github.io"
        data-repo-id="R_kgDON_xxxxxx"          ← 复制这个
        data-category="Announcements"
        data-category-id="DIC_kwDON_xxxxxx"    ← 复制这个
        ...
></script>
```

4. 复制 **`data-repo-id`** 和 **`data-category-id`** 这两个值

### 4. 填入 hugo.toml

打开 `hugo.toml`，找到 `[params.page.comment.giscus]` 段：

```toml
[params.page.comment.giscus]
  enable = true
  repo = "KeNanXiaoLin/KeNanXiaoLin.github.io"
  repoId = "R_kgDON_xxxxxx"          # ← 粘贴你的 repoId
  category = "Announcements"
  categoryId = "DIC_kwDON_xxxxxx"    # ← 粘贴你的 categoryId
  lang = "zh-CN"                      # ← 改成 "zh-CN"
  mapping = "pathname"
  reactionsEnabled = "1"
  emitMetadata = "0"
  inputPosition = "bottom"
  lazyLoading = false
  lightTheme = "light"
  darkTheme = "dark"
```

把 `R_kgDON_xxxxxx` 和 `DIC_kwDON_xxxxxx` 替换成你刚才复制的值。

### 5. 部署并验证

```bash
git add .
git commit -m "配置 Giscus 评论"
git push
```

等待博客部署完成（1-2 分钟），打开任意一篇文章，滚动到底部，应该能看到评论框。

> 💡 第一次需要登录 GitHub 账号才能评论。

## 评论的工作原理

```
读者在博客留言
  ↓
Giscus 把留言作为一条 Discussion 存到你的 GitHub 仓库
  ↓
读者看到其他人的评论（实时）
  ↓
你（博主）可以在 GitHub 后台管理评论（删除、标记、回复等）
```

所有评论数据都在你的 GitHub 仓库里，**完全属于你**。

## 常见问题

### Q1: 文章底部没显示评论框

**A**: 检查：
- Giscus App 是否安装并授权了你的仓库
- 仓库是否启用了 Discussions 功能
- `repoId` 和 `categoryId` 是否正确
- 浏览器控制台是否有错误（按 F12 查看）

### Q2: 评论不显示我之前的评论

**A**: Giscus 评论是**按页面**的（基于 URL pathname）。不同文章有不同的讨论串。
你可以在 Giscus 后台管理所有评论：https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io/discussions

### Q3: 想换其他评论系统？

**A**: LoveIt 主题还支持 Disqus、Gitalk、Valine、Utterances 等。在 `hugo.toml` 的 `[params.page.comment]` 下配置即可。

### Q4: 评论不想要了

**A**: 在 `hugo.toml` 设置：
```toml
[params.page.comment]
  enable = false
```

### Q5: 评论框样式想改

**A**: Giscus 的样式由它的 iframe 决定。可以通过 `lightTheme` 和 `darkTheme` 切换主题。可选值：
- `light`, `dark`, `dark_dimmed`, `dark_high_contrast`
- `light_high_contrast`, `light_protanopia`, `light_tritanopia`
- `dark_protanopia`, `dark_tritanopia`, `dark_achromatopsia`, `light_achromatopsia`
- `preferred_color_scheme`, `noborder_light`, `noborder_dark`
- `transparent_dark`, `noborder_Transparent_dark`

## 进阶：评论数据迁移

如果你以后想换评论系统，Giscus 的数据是 GitHub Discussions，可以用工具迁移：

- 导出 Discussions 为 JSON：https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io/discussions
- 使用 `giscus-to-disqus`、`disqus-to-giscus` 等工具转换格式

但大多数情况下，**Giscus 用着没问题就别折腾了**。
