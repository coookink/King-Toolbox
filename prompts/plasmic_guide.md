# 📖 Plasmic 可视化页面构建器指南

## 1. 这是什么？(What is this?)
Plasmic 是一个**开源可视化页面构建工具**，让开发者和设计师协作快速构建 React 应用和网站。
*   **核心理念**: "The open-source visual builder for your codebase" — 代码可选的可视化构建。
*   **核心能力**: 拖拽现有 React 组件，可视化编辑，生成干净代码。
*   **独特优势**: 突破传统低代码工具的限制，与真实代码库无缝集成。
*   **技术栈**: React, Next.js, TypeScript (84.8%)

## 2. 为什么需要它？
如果你经常需要：
*   **快速构建营销页面**，但不想牺牲代码质量。
*   **让设计师直接编辑页面**，而不依赖开发者。
*   **拖拽现有 React 组件**进行页面搭建。
*   **从 Figma 导入设计**并转换为可运行的 React 代码。
*   **不绑定特定平台**，保持代码完全可控。

Plasmic 是 Webflow + Retool + Contentful 的组合替代品。

## 3. 与类似工具的对比

| Plasmic 组合 | 对应工具 | Plasmic 优势 |
|-------------|---------|-------------|
| 网站构建 | Webflow, WordPress | 代码可控，不绑定平台 |
| 内部工具 | Retool | 更灵活的设计能力 |
| 应用构建 | Glide | 真实代码库集成 |
| 内容管理 | Contentful | 可视化编辑 + Headless API |

**关键差异**: "Plasmic integrates with codebases" — 突破低代码复杂度天花板。

## 4. 核心特性
*   🎨 **完整设计能力** — 现代设计工具 UX，自由布局。
*   🔌 **代码库集成** — 拖拽现有 React 组件，无缝融合。
*   📝 **代码生成** — 生成干净的 React 代码，可导出。
*   🔗 **Headless API** — 通过 API 获取页面内容。
*   👥 **协作者模式** — 为营销/内容团队简化编辑体验。
*   🎭 **Figma 导入** — 将 Figma 设计转换为 DOM/CSS。
*   🚀 **任意部署** — Vercel, Netlify 或任意托管平台。

## 5. 快速开始

### 安装依赖

**Next.js:**
```bash
npm install @plasmicapp/loader-nextjs
```

**React:**
```bash
npm install @plasmicapp/loader-react
```

### 基础集成

**Next.js 页面:**
```tsx
import { PlasmicRootProvider, PlasmicComponent } from '@plasmicapp/loader-nextjs';
import { PLASMIC } from '../plasmic-init';

export default function PlasmicPage({ plasmicData }) {
  return (
    <PlasmicRootProvider loader={PLASMIC} prefetchedData={plasmicData}>
      <PlasmicComponent component="Homepage" />
    </PlasmicRootProvider>
  );
}
```

**plasmic-init.ts:**
```ts
import { initPlasmicLoader } from '@plasmicapp/loader-nextjs';

export const PLASMIC = initPlasmicLoader({
  projects: [
    {
      id: 'YOUR_PROJECT_ID',
      token: 'YOUR_PROJECT_TOKEN',
    },
  ],
});
```

## 6. 使用场景

### 场景 A：营销页面 CMS
营销人员通过 Plasmic Studio 拖拽 React 组件构建落地页，开发者专注于组件开发。

### 场景 B：内部工具
快速构建管理后台、数据面板，拖拽表格、表单组件。

### 场景 C：客户端门户
为客户定制门户界面，设计团队可直接修改内容。

### 场景 D：网站构建
不绑定特定电商/CMS/托管平台，保持代码灵活性。

## 7. 工作流程

```
1. 开发者注册 React 组件到 Plasmic
        ↓
2. 在代码中添加 Plasmic 渲染占位符
        ↓
3. 设计师/营销人员在 Plasmic Studio 可视化编辑
        ↓
4. 发布触发网站重新构建
        ↓
5. 页面渲染时通过 Loader 获取最新内容
```

## 8. 主要概念

### Plasmic Studio
可视化编辑器，设计和构建页面。

### Loader
运行时库，在应用中渲染 Plasmic 内容。

### Registered Components
注册到 Plasmic 的 React 组件，可在 Studio 中拖拽使用。

### Headless Mode
仅使用 Plasmic 作为 CMS，通过 API 获取内容。

## 9. 代码生成

Plasmic 可以生成干净的 React 代码：
*   无锁定，完全拥有代码
*   可导出到任意项目
*   支持 TypeScript

## 10. Figma 导入

将 Figma 设计直接导入 Plasmic：
*   保持设计 fidelity
*   转换为可编辑的 React 组件
*   支持响应式布局

## 11. 许可证

*   **平台外代码**: MIT License（完全开源）
*   **platform/ 目录**: AGPL License（平台核心）

## 12. 资源地址
*   **官网**: [plasmic.app](https://www.plasmic.app/)
*   **GitHub**: [plasmicapp/plasmic](https://github.com/plasmicapp/plasmic)
*   **文档**: [docs.plasmic.app](https://docs.plasmic.app/)
*   **示例**: 仓库内含多个框架示例
