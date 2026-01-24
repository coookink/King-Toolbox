# 🕵️‍♂️ AI 系统提示词合集指南 (System Prompts Collection)

## 1. 项目介绍
这是一个由开源社区维护的“逆向工程”项目，收集了目前市面上顶级 AI 工具幕后的 **System Prompts (系统提示词)** 和 **Model Configurations (模型配置)**。

它揭示了像 Cursor、Devin、v0 这些强大的工具，是如何通过一段精心设计的“指令”，被编程成现在的样子的。

**包含的工具列表：**
- **代码编辑器类**: Cursor, VSCode Copilot, Windsurf, Trae
- **全自动特工**: Devin, Manus, Replit Agent
- **UI 生成**: v0, Lovable
- **其他**: Midjourney, Perplexity 等

## 2. 使用方法
这个项目不是用来“运行”的软件，而是一个**参考阅览室**。

### 场景 A：学习顶级 Prompt 写法
1.  进入 `modules/system-prompts` 文件夹。
2.  找到你感兴趣的工具（如 `Cursor` 文件夹）。
3.  打开其中的 `.md` 或 `.txt` 文件（通常带有 `system_prompt` 字样）。
4.  **学习重点**：
    - 它们如何定义 `Role`（角色）。
    - 它们如何设计 `Constraints`（边界约束）。
    - 它们如何描述 `Tools`（工具调用逻辑）。

### 场景 B：优化自己的 AI
如果你想让你自己的 GPT-4 或 Claude 表现得像 Cursor 一样专业，可以：
1.  复制 `Cursor` 的部分核心提示词。
2.  粘贴到你的 ChatGPT **"Custom Instructions" (自定义指令)** 或 API 的 System 字段中。

## 3. 资源地址
- **本地路径**: [点击跳转到 submodule 文件夹](../modules/system-prompts)
- **GitHub 原址**: [x1xhlol/system-prompts-and-models-of-ai-tools](https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools)