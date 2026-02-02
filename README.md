# 🛠 King's Digital Arsenal (数字军火库)
> 个人开发资源、提示词与代码片段的快速调用索引。

## 📂 1. AI Prompts (提示词)
| 文件名 | 核心功能 | 来源/备注 | 快速调用 |
| :--- | :--- | :--- | :--- |
| **[提示词提升法](./prompts/prompt_training_method.md)** | 麦克斯坦的核心训练逻辑 | [小红书](https://www.xiaohongshu.com/discovery/item/695d24f0000000001a030b3f) | 阅读并执行 |
| **[Claude 技能积木库](./prompts/claude_skills_guide.md)** | 含150+ Agent工作流(SKILL.md) | [modules/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) | 复制Prompt或挂载 |
| **[Vercel 官方技能库](./prompts/agent_skills_guide.md)** | React/Next.js 最佳实践与规范 | [modules/agent-skills](https://github.com/vercel-labs/agent-skills) | 复制规范喂给 AI |

## 🧩 2. Code Snippets (代码片段)
| **[SwiftUI Hex Color](./snippets/ios/ColorExtension.swift)** | 让App支持 #RRGGBB 颜色代码 | 复制到项目 `Extensions` 文件夹 |

## 📦 3. Modules (第三方库)
| 库名称 | 核心功能 | 来源 | 快速调用 |
| :--- | :--- | :--- | :--- |
| **[Kingfisher](./prompts/kingfisher_guide.md)** | iOS网络图片加载与缓存 | [modules/Kingfisher](https://github.com/onevcat/Kingfisher) | 将 `Sources` 文件夹拖入 Xcode 项目 |
| **[Astro Web Framework](./prompts/astro_guide.md)** | 极致速度的内容网站框架 | [modules/astro](https://github.com/withastro/astro) | `npm create astro@latest` |
| **[Strapi Headless CMS](./prompts/strapi_guide.md)** | 开源无头CMS，一键生成API | [modules/strapi](https://github.com/strapi/strapi) | `npx create-strapi@latest` |
| **[AI系统提示词合集](./prompts/system_prompts_guide.md)** | Cursor/Devin/v0 等顶级工具的源 Prompt | [modules/system-prompts](https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools) | 查阅学习 |
| **[UI/UX设计智能库](./prompts/ui_ux_skill_guide.md)** | AI的设计大脑(含SwiftUI支持) | [modules/ui-ux-pro-max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | `npm i -g uipro-cli` |
| **[New API 网关](./prompts/new_api_guide.md)** | 统一AI模型接口/计费管理 | [modules/new-api](https://github.com/QuantumNous/new-api) | Docker部署 |
| **[Superpowers 脚本集](./prompts/superpowers_guide.md)** | 黑客的命令行生产力工具箱 | modules/superpowers | 需配置 PATH |
| **[OpenCode 编程特工](./prompts/opencode_guide.md)** | TUI优先的开源Devin替代品 | [modules/opencode](https://github.com/anomalyco/opencode) | 命令行/GitHub App |
| **[CC Switch 助手](./prompts/cc_switch_guide.md)** | Claude/Gemini CLI配置切换与管理 | [modules/cc-switch](https://github.com/farion1231/cc-switch) | 安装 App 使用 |
---
## ⚡️ 维护指南
1. **获取资源**: `git pull`
2. **添加资源**: 放入文件 -> `git add .` -> `git commit` -> `git push`