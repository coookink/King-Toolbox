# Anthropics Skills Guide

## 1. 介绍 (Introduction)
这是 Anthropic 官方提供的 Claude Skills 实现仓库。
Skills 是包含指令、脚本和资源的文件夹，Claude 动态加载它们以提高特定任务的性能。它们教导 Claude 如何以可重复的方式完成特定任务，如生成符合品牌准则的文档、分析数据或自动化个人任务。

## 2. 用法 (Usage)

### Claude Code
将仓库注册为 Claude Code Plugin marketplace：
```bash
/plugin marketplace add anthropics/skills
```

安装特定 Skill set：
```bash
/plugin install document-skills@anthropic-agent-skills
/plugin install example-skills@anthropic-agent-skills
```
安装后直接提及 Skill 即可使用。

### 创建 Skill
参照仓库中的 `template` 目录。
核心是一个包含 YAML frontmatter 的 `SKILL.md` 文件：
```markdown
---
name: my-skill-name
description: A clear description of what this skill does and when to use it
---
# Instructions...
```

## 3. 地址 (Address)
- **GitHub**: https://github.com/anthropics/skills
- **Local Module**: `modules/anthropics_skills`
