# 🧩 Awesome Claude Skills 使用指南

## 1. 项目介绍
这是一个 AI Agent 的技能积木库 (by Composio)。
它将复杂的任务封装成了标准化的 **Skill 包**。
* **物理位置**: `modules/awesome-claude-skills`
* **核心文件**: 每个技能文件夹下的 `SKILL.md` (包含 Role, Goals, Workflow)。

## 2. 如何使用 (Usage)

### 方式 A：作为提示词 (Trae/ChatGPT)
直接复制 `SKILL.md` 的内容，粘贴给 Trae。
* **场景**: 比如你想写长文，找到 `content-research-writer/SKILL.md`，复制给 Trae，它就会变成顶级编辑。

### 方式 B：作为 Claude Code 插件 (Terminal)
如果你使用 Anthropic 官方的命令行工具 `claude`，可以将技能挂载进去：
```bash
# 建立软链接，将技能映射到 Claude 配置目录
ln -s $(pwd)/modules/awesome-claude-skills/content-research-writer ~/.claude/skills/content-research-writer
```
挂载后，在 claude 命令行里可以直接呼叫该技能。

## 3. 资源地址
* **GitHub 原址**: [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills)
