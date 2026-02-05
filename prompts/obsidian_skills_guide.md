# 📝 Obsidian Skills 指南

## 1. 这是什么？(What is this?)
这是专门为 **Obsidian** 用户设计的 Agent 技能包。
*   **核心功能**: 让 AI (Claude Code/Codex) 能够读写 Obsidian 的特殊格式文件。
*   **支持格式**:
    *   Obsidian Flavored Markdown (`.md`)
    *   Obsidian Bases (`.base`)
    *   JSON Canvas (`.canvas`) - 无限画布文件
*   **物理位置**: `modules/obsidian-skills`

## 2. 为什么需要它？
如果你用 Obsidian 做笔记/知识管理，并希望 AI 能够：
*   自动生成符合 Obsidian 双链语法的笔记（`[[链接]]`）。
*   编辑你的 Canvas 文件（思维导图/白板）。
*   理解 Obsidian 的特殊 Markdown 扩展（如 Callout、Dataview 等）。

这个技能包就是让 AI "懂" Obsidian 的关键。

## 3. 小白使用教程

### 方式 A：手动安装到 Claude Code
1.  找到你的 Obsidian 库根目录（有 `.obsidian` 文件夹的那个）。
2.  在根目录创建 `/.claude` 文件夹。
3.  将本项目 `modules/obsidian-skills` 里的内容复制到 `/.claude` 文件夹。
4.  重启 Claude Code。

### 方式 B：安装到 Codex CLI
```bash
# 复制技能到 Codex 配置目录
cp -r modules/obsidian-skills/skills ~/.codex/skills/obsidian
```

### 方式 C：直接复制给 AI (最简单)
1.  打开 `modules/obsidian-skills/skills/` 目录下的 `SKILL.md` 文件。
2.  复制内容。
3.  告诉 Trae/Claude：
    > "这是 Obsidian 的语法规范。接下来帮我生成的笔记要遵循这些格式。"

## 4. 应用场景
*   **自动笔记生成**: "帮我把这篇文章总结成 Obsidian 笔记，标题用 H1，核心概念用双链。"
*   **Canvas 编辑**: "在我的 Canvas 里添加一个新的思维导图节点。"
*   **文献管理**: "把这些文献信息生成标准的 Obsidian 文献笔记。"

## 5. 资源地址
*   **GitHub**: [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills)
*   **Obsidian 官方文档**: [help.obsidian.md](https://help.obsidian.md)
