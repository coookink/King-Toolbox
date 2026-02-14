# 🕵️‍♂️ AI 系统提示词合集指南

## 1. 这是什么？
这是一个**AI 界的“解剖实验室”**。
这里收集了 Cursor, Devin, v0 等顶级 AI 工具的**灵魂** —— 也就是它们的 **System Prompt (系统提示词)**。
知道了这些，你就知道了它们为什么比你的 ChatGPT 聪明。

## 2. 为什么你要看这个？
*   **偷师学艺**: 看看世界顶级的 Prompt 工程师是如何写指令的。
*   **复制能力**: 把 Cursor 的提示词复制给 ChatGPT，瞬间让你的 ChatGPT 拥有类似 Cursor 的编程思维。
*   **理解原理**: 明白 AI 工具不是魔法，而是精密的指令工程。

## 3. 怎么用？(小白教程)

### 场景：我想让 ChatGPT 像 Cursor 一样懂代码

1.  **找文件**:
    *   进入本项目的 `modules/system-prompts`。
    *   找到 `cursor` 文件夹。
    *   打开 `rules_for_ai.md` (或者类似名字)。

2.  **阅读理解**:
    *   不用全看懂，重点看它怎么定义 **Rules**。
    *   *例如*: "Always write modular code", "Prioritize readability".

3.  **抄作业**:
    *   复制其中你觉得好的几段。
    *   打开 ChatGPT -> 设置 -> **Custom Instructions (自定义指令)**。
    *   粘贴到 "High-level instructions" 框里。

### 场景：我想看 Devin (AI 程序员) 是怎么思考的

1.  找到 `devin` 文件夹。
2.  你会发现它用了很多 `Step-by-Step` 的思维链 (Chain of Thought)。
3.  模仿它的写法，去写你自己的 Prompt。

## 4. 常见误区
*   **误区**: "我把这文件运行起来就能得到一个免费 Cursor？"
*   **真相**: 并没有。这些只是**提示词** (灵魂)，你还需要壳子 (软件) 和大脑 (API)。但拥有灵魂已经能解决 80% 的问题了。

## 5. 资源链接
*   **GitHub 原址**: [x1xhlol/system-prompts-and-models-of-ai-tools](https://github.com/x1xhlol/system-prompts-and-models-of-ai-tools)
*   **本地查看**: [点击这里](../modules/system-prompts)