King，这是合并后的完整 Markdown 内容，直接点击右上角复制即可。

```markdown
# 🎨 UI/UX Pro Max Skill 终极作战手册 (v3.0)

## 1. 核心价值 (Core Value)
这是 King-Toolbox 中的**首席设计顾问**。它不是静态的文档，而是一套**设计逻辑引擎**。
* **功能**: 为 AI (Trae) 植入资深设计师的决策模型。
* **覆盖**: iOS (SwiftUI), Web (Next.js/React), CSS (Tailwind).
* **数据**: 100+ 推理规则, 97+ 配色方案, 67+ UI 风格。

## 2. 环境部署 (Setup)
在使用前，必须确保本地环境已配置。

### 2.1 安装 CLI
需要 Node.js 环境。在终端执行：
```bash
npm install -g uipro-cli

```

### 2.2 项目初始化 (注入 Trae)

在你的 App 项目根目录下执行：

```bash
uipro init --ai trae

```

*作用：这会将核心规则文件 (`.cursorrules` 或 System Prompts) 注入项目，使 AI 自动读取设计规范。*

## 3. 提示词实战模板 (Prompt Templates)

**复制以下模板，根据需求修改 `[ ]` 内的内容，发送给 Trae。**

### 模板 A：从零设计系统 (Global System)

> **Role**: 你是 Apple Human Interface Guidelines 专家。
> **Task**: 为我的 `[金融/医疗/社交]` App 创建一套基于 `[SwiftUI/Next.js]` 的设计系统。
> **Requirements**:
> 1. **风格**: 调用库中的 `[Glassmorphism/Minimalism]` 风格。
> 2. **配色**: 根据行业属性推理，生成 Hex 色值变量。
> 3. **排版**: 定义 H1-H3 及 Body 的字体层级。
> 4. **输出**: 直接生成 `DesignSystem.swift` 代码文件。
> 
> 

### 模板 B：单组件开发 (Component Build)

> **Context**: 基于当前的设计系统。
> **Task**: 开发一个 `[用户资料卡片]` 组件。
> **Specs**:
> 1. 符合 'Hero-Centric' 布局模式。
> 2. 包含头像、昵称、状态标签。
> 3. 使用 `[深色模式]` 适配。
> 4. **反模式检查**: 确保不要出现 `[极细字体/低对比度]` 等错误。
> 
> 

### 模板 C：风格迁移 (Reskin)

> **Task**: 重构当前页面的 UI 代码。
> **Target**: 将风格从 'Flat' 切换为 'Neumorphism' (新拟态)。
> **Details**: 调整阴影 (Shadows) 和高光 (Highlights) 参数，确保符合库中定义的物理光照逻辑。

## 4. 武器库地图 (Internal Map)

了解模块内部结构，有助于你手动查阅资源。
路径：`modules/ui-ux-pro-max/`

| 目录/文件 | 用途 | 核心价值 |
| --- | --- | --- |
| **`/styles`** | UI 风格定义 | 包含 67 种风格的 CSS/SwiftUI 参数 |
| **`/palettes`** | 配色方案 | 97 种行业特定的配色 JSON |
| **`/reasoning`** | 推理规则 | `ui-reasoning.csv` (AI 的决策大脑) |
| **`/scripts`** | 工具脚本 | Python 搜索工具 |
| **`knowledge.md`** | 知识库 | 核心设计原则文档 |

## 5. 高级工具 (Power Tools)

### 5.1 Python 智能搜索

当你不确定用什么颜色时，让脚本跑数据：

```bash
# 进入模块目录
cd modules/ui-ux-pro-max

# 搜索关键词 (如: 赛博朋克风格)
python3 scripts/search.py "cyberpunk gaming" --design-system

```

*输出：JSON 格式的推荐色值（Neon Green/Purple）和字体建议。*

### 5.2 维护与更新

开源项目会持续进化，定期执行以下命令获取最新设计规则：

```bash
# 在 King-Toolbox 根目录
git submodule update --remote modules/ui-ux-pro-max

```

## 6. 常见问题 (FAQ)

* **Q: 初始化报错 `command not found`?**
* A: 检查 Node.js 是否安装 (`node -v`)。


* **Q: Trae 不理会设计规范?**
* A: 确认是否在项目根目录执行了 `uipro init`，并重启 Trae。



```

```