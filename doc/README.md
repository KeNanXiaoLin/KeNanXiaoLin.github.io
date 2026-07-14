# XiaoLin 的博客 — 文档目录

这里收录了本博客项目的所有说明文档。**新手建议按顺序阅读**。

## 目录

| 文档 | 内容 | 何时阅读 |
| --- | --- | --- |
| [QUICKSTART.md](./QUICKSTART.md) | 快速开始：本地预览、修改、发布 | 👈 **先看这个** |
| [DEPLOYMENT.md](./DEPLOYMENT.md) | 部署到 GitHub Pages，让别人能访问 | 想上线时看 |
| [WRITING-POSTS.md](./WRITING-POSTS.md) | 如何写一篇新文章 | 想写文章时看 |
| [CONFIGURATION.md](./CONFIGURATION.md) | 如何修改配置（标题、头像、菜单等） | 想自定义博客时看 |
| [GISCUS.md](./GISCUS.md) | 如何开启评论系统 | 想让别人留言时看 |

## 项目概览

- **技术栈**：Hugo + LoveIt 主题 + GitHub Pages
- **内容格式**：Markdown
- **版本管理**：Git
- **工作流**：本地写文章 → `git push` → 自动部署

## 目录结构

```
WebBlog/
├── archetypes/      # 文章模板（用于 hugo new 命令）
├── content/         # 所有内容
│   ├── about.md     # 关于页
│   └── posts/       # 博客文章
├── doc/             # 📂 你正在看的文档
├── hugo.toml        # 博客配置文件（最重要的文件）
├── static/          # 静态资源（图片、favicon 等）
├── themes/LoveIt/   # 主题文件（一般不用改）
├── tools/           # Hugo 可执行文件
├── public/          # 生成的静态网站（自动生成，不要手动改）
└── .gitignore       # Git 忽略文件
```

## 快速链接

- 🌐 博客地址：https://KeNanXiaoLin.github.io/
- 📦 仓库地址：https://github.com/KeNanXiaoLin/KeNanXiaoLin.github.io
- 💬 评论系统：[Giscus](https://giscus.app/zh-CN)
- 🎨 使用主题：[LoveIt](https://github.com/dillonzq/LoveIt)
- 🛠 静态生成器：[Hugo](https://gohugo.io/)
