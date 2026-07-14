# XiaoLin 的博客

> 以为热爱技术的菜鸟的个人博客

🌐 **在线访问**：https://KeNanXiaoLin.github.io/

## 技术栈

- **静态生成器**：[Hugo](https://gohugo.io/) v0.164.0 (extended)
- **主题**：[LoveIt](https://github.com/dillonzq/LoveIt)
- **部署**：[GitHub Pages](https://pages.github.com/)
- **评论**：[Giscus](https://giscus.app/zh-CN)（基于 GitHub Discussions）
- **搜索**：[Fuse.js](https://fusejs.io/)（本地搜索）
- **版本管理**：Git

## 项目结构

```
WebBlog/
├── archetypes/      # 文章模板
├── content/         # 博客内容
│   ├── about.md
│   └── posts/       # 所有文章
├── doc/             # 📚 项目文档（[从这里开始](doc/README.md)）
├── hugo.toml        # 博客配置
├── static/          # 静态资源（图片等）
├── themes/          # 主题（LoveIt）
├── tools/           # Hugo 可执行文件
└── public/          # 构建输出（自动生成，git 忽略）
```

## 快速开始

```bash
# 1. 启动本地预览
./tools/hugo.exe server

# 2. 打开浏览器
# http://localhost:1313/
```

详细说明见 [doc/QUICKSTART.md](./doc/QUICKSTART.md)

## 文档

- 📖 [doc/README.md](./doc/README.md) — 文档索引
- 🚀 [doc/QUICKSTART.md](./doc/QUICKSTART.md) — 快速开始
- 🌐 [doc/DEPLOYMENT.md](./doc/DEPLOYMENT.md) — 部署到 GitHub Pages
- ✍️ [doc/WRITING-POSTS.md](./doc/WRITING-POSTS.md) — 写文章
- ⚙️ [doc/CONFIGURATION.md](./doc/CONFIGURATION.md) — 修改配置
- 💬 [doc/GISCUS.md](./doc/GISCUS.md) — 开启评论

## 许可协议

本站文章采用 [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) 协议，转载请注明出处。
