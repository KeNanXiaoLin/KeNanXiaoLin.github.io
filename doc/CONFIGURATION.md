# 配置说明

本文档介绍如何修改博客的 `hugo.toml` 配置文件。

> ⚠️ 修改 `hugo.toml` 后，Hugo 会自动重新加载。如果 `hugo server` 正在运行，浏览器会自动刷新。

## 配置文件位置

`hugo.toml` 在博客根目录。

## 常用配置

### 站点基本信息

```toml
baseURL = "https://KeNanXiaoLin.github.io/"   # 你的博客地址
title = "XiaoLin 的博客"                         # 博客标题
```

### 作者信息

```toml
[params.author]
  name = "XiaoLin"                                # 作者名
  email = "2496463252@qq.com"                     # 联系邮箱
  link = "https://github.com/KeNanXiaoLin"        # 个人主页
```

### 主页个人介绍

```toml
[params.home.profile]
  enable = true
  gravatarEmail = "2496463252@qq.com"             # Gravatar 邮箱（头像）
  avatarURL = "/images/avatar.png"                # 头像图片
  subtitle = "以为热爱技术的菜鸟"                    # 副标题
  typeit = true                                   # 打字机动画
  social = true                                   # 显示社交链接
```

### 头像设置

有两种方式：

#### 方式 A：用 Gravatar（推荐）

1. 去 https://cn.gravatar.com/ 用你的邮箱注册并上传头像
2. 在 `hugo.toml` 设置 `gravatarEmail`
3. 把 `avatarURL = ""` 留空，主题会自动用 Gravatar

#### 方式 B：用本地图片

1. 准备一张图片（建议 200x200 像素左右）
2. 放到 `static/images/avatar.png`
3. `avatarURL = "/images/avatar.png"`（已经设置好了）

### 主题（颜色）

```toml
[params]
  defaultTheme = "auto"  # 可选: "auto"（跟随系统）, "light"（浅色）, "dark"（深色）
```

### 导航菜单

```toml
[[menu.main]]
  weight = 1                # 排序权重（数字小=靠前）
  identifier = "posts"
  name = "所有文章"          # 显示的文字
  url = "/posts/"           # 链接
  title = ""                # 鼠标悬停的提示
```

要添加/删除菜单项，**增删对应的 `[[menu.main]]` 段**。

### 社交链接

```toml
[params.social]
  GitHub = "KeNanXiaoLin"
  Email = "2496463252@qq.com"
  RSS = true
```

支持的社交平台（只填你有账号的）：

- `GitHub`, `Gitlab`, `Gitea`, `Codeberg`
- `Bilibili`, `Zhihu`, `Weibo`, `Douban`
- `X`（推特）, `Threads`, `Facebook`, `Linkedin`
- `Email`, `RSS`
- `Telegram`, `Discord`, `Mastodon`
- `LeetCode`, `LeetCodeCN`
- ... 共 80+ 种

### 评论系统

默认启用 **Giscus**。配置见 [GISCUS.md](./GISCUS.md)。

```toml
[params.page.comment]
  enable = true
  [params.page.comment.giscus]
    enable = true
    repo = "KeNanXiaoLin/KeNanXiaoLin.github.io"
    repoId = "R_xxx"           # ← 改成你的 repoId
    category = "Announcements"
    categoryId = "DIC_xxx"     # ← 改成你的 categoryId
```

### 搜索

```toml
[params.search]
  enable = true
  type = "fuse"                # 推荐 fuse（本地搜索，零成本）
  # type = "pagefind"          # pagefind（更快但需要 Node.js）
  placeholder = ""             # 搜索框占位文字
  maxResultLength = 10
  snippetLength = 30
```

### 深色模式

默认开启 `auto`（跟随系统）。在网页右上角可手动切换。

### 文章版权

```toml
copyright = "本站文章采用 CC BY-NC 4.0 协议，转载请注明出处。"

[params.footer]
  license = '<a rel="license external nofollow noopener noreffer" href="https://creativecommons.org/licenses/by-nc/4.0/" target="_blank">CC BY-NC 4.0</a>'
```

### 文章字数、阅读时长

LoveIt 主题**自动**显示文章字数和阅读时长，无需配置。

### 关闭某些功能

```toml
# 关闭评论
[params.page.comment]
  enable = false

# 关闭搜索
[params.search]
  enable = false

# 关闭分享按钮
[params.page.share]
  enable = false
```

## 进阶配置

### 添加 favicon（浏览器标签页图标）

1. 准备一张 512x512 的图片，转成 `.ico` 格式
   - 在线工具：https://realfavicongenerator.net/
2. 下载生成的 `favicon.ico` 和 `apple-touch-icon.png` 等文件
3. 放到 `static/` 目录
4. 在 `hugo.toml` 启用：

```toml
[params.app]
  noFavicon = false
  svgFavicon = "/favicon.svg"  # 可选
```

### 添加自定义 CSS

在 `assets/css/extended/custom.css` 创建文件（目录不存在则手动创建）：

```css
/* 自定义样式 */
.post-content {
  font-size: 16px;
  line-height: 1.8;
}

.first-entry {
  /* 首页文章卡片的样式 */
}
```

### 添加 Google Analytics

```toml
[params.analytics.google]
  id = "G-XXXXXXXXXX"          # 你的 GA ID
  respectDoNotTrack = false
```

### 修改文章 URL 格式

```toml
[permalinks]
  posts = ":contentbasename"           # /hello-world/
  # posts = ":year/:month/:contentbasename"  # /2026/07/hello-world/
```

## 完整配置结构

`hugo.toml` 主要分段：

| 段 | 作用 |
| --- | --- |
| `[params]` | 站点全局配置 |
| `[params.author]` | 作者信息 |
| `[params.home]` | 主页配置 |
| `[params.home.profile]` | 主页个人介绍 |
| `[params.social]` | 社交链接 |
| `[params.header]` | 顶部导航 |
| `[params.footer]` | 页脚 |
| `[params.section]` | "所有文章"页配置 |
| `[params.list]` | 标签/分类页配置 |
| `[params.search]` | 搜索 |
| `[params.page]` | 文章页全局配置 |
| `[params.page.toc]` | 文章目录 |
| `[params.page.code]` | 代码块 |
| `[params.page.share]` | 文章分享按钮 |
| `[params.page.comment]` | 评论 |
| `[menu]` | 导航菜单 |
| `[pagination]` | 分页 |
| `[markup]` | Markdown 解析 |
| `[sitemap]` | 站点地图 |
| `[permalinks]` | URL 格式 |
| `[outputs]` | 输出格式 |
| `[privacy]` | 隐私设置 |

完整配置参考 [LoveIt 主题文档](https://hugoloveit.com/zh-cn/)。

## 验证配置

修改配置后：

```bash
./tools/hugo.exe server
```

如果配置有错误，Hugo 会在终端打印错误信息。修正后再次启动。
