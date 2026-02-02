# 🚀 Astro 现代网页框架指南

## 1. 这是什么？(What is this?)
Astro 是目前**最适合做内容类网站**（博客、文档、作品集、营销页）的 Web 框架。
*   **黑科技**: 它发明了 "Island Architecture" (孤岛架构)。
*   **核心优势**: 极致的速度。哪怕你用 React 写页面，Astro 默认**不发任何 JavaScript 给浏览器**，除非你特别指定。
*   **物理位置**: `modules/astro`

## 2. 为什么你需要它？
如果你想做一个**个人博客**或者**公司官网**。
*   **用 Next.js**: 会带一堆很重的 JS 包，加载慢。
*   **用 HTML/CSS**: 写起来太累，没法复用组件。
*   **用 Astro**: 既能像 React/Vue 一样写组件（甚至混用它们），又能像 HTML 一样飞快加载。

## 3. 小白安装教程 (2分钟)

### 第一步：一键创建
打开终端，进入你的工作目录：
```bash
# 召唤 Astro 官方安装精灵
npm create astro@latest
```
*   它会问你项目名叫什么？（随便填，如 `my-space`）
*   要把模板设为 Blog 吗？（选 Yes 就可以直接得到一个漂亮博客）
*   要安装依赖吗？（选 Yes）

### 第二步：启动飞船
```bash
cd my-space
npm run dev
```
浏览器打开 `http://localhost:4321`，你的网站已经在火星运行了。

## 4. 核心概念 (写给小白)
*   **`.astro` 文件**: 类似于 HTML，但上面可以用 `---` 分隔符写 JavaScript 逻辑。
*   **组件大乱炖**: 你可以在 Astro 项目里同时装 React, Vue, Svelte。
    *   *例子*: 头部导航用 React 写，侧边栏用 Vue 写，它们能和谐共存。
*   **按需加载**:
    *   `<Header />` -> 默认是静态 HTML (死代码，加载极快)。
    *   `<Header client:load />` -> 加上这个指令，它才变成活的（有交互）。

## 5. 常见问题
*   **Q: 它和 Next.js 怎么选？**
    *   A: **内容为主**选 Astro (博客、官网、文档)。**交互极重**选 Next.js (像淘宝、飞书这种复杂的后台/App)。
*   **Q: 怎么部署？**
    *   A: 最推荐 **Vercel** 或 **Netlify**。连接你的 GitHub，一键自动部署。

## 6. 资源地址
*   **GitHub**: [withastro/astro](https://github.com/withastro/astro)
*   **官方中文文档**: [docs.astro.build/zh-cn/](https://docs.astro.build/zh-cn/)
