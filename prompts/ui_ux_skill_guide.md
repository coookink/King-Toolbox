# 🎨 UI/UX Pro Max Skill 完整作战手册

## 1. 项目全貌 (Overview)
这是一个 AI 原生的设计智能基础设施，而非简单的素材库。它相当于给你的 Trae/Cursor 外挂了一个“资深设计师大脑”。
* **核心定义**: 包含 100+ 行业推理规则的设计系统生成器。
* **资产规模**: 内置 67+ 种 UI 风格、97+ 种行业配色方案、56+ 种字体搭配。
* **技术栈支持**: 完美覆盖 **SwiftUI (iOS)**、React、Next.js、Tailwind CSS 等。

## 2. 核心能力 (Key Features)
该项目目前处于 V2.0 版本，具备以下关键能力：
1.  **推理引擎 (Reasoning Engine)**: 不死记硬背，而是通过 `ui-reasoning.csv` 里的规则，根据产品类型（如金融 vs 游戏）推导设计规范。
2.  **反模式拦截 (Anti-Patterns)**: 自动拦截不专业的设计决策（例如：禁止在严肃的金融 App 中使用“可爱的圆角”）。
3.  **CLI 注入**: 通过命令行工具直接将设计记忆注入到你的当前项目中。

## 3. 安装与初始化 (Installation)
在使用前，必须通过 CLI 建立连接（需要 Node.js 环境）：

```bash
# 1. 全局安装工具
npm install -g uipro-cli

# 2. 在项目根目录初始化 (激活 Trae 支持)
uipro init --ai trae