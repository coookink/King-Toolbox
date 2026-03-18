# Anthropic 官方 Skills 使用指南

> Claude 官方 Agent 技能库 - 可复用的 AI 工作流与最佳实践

[官方仓库](https://github.com/anthropics/skills) | [Claude Skills 文档](https://docs.anthropic.com/en/docs/skills)

---

## 核心功能

Anthropic Skills 是一组**可复用的 AI 工作流**，通过结构化指令教导 Claude 如何以可重复的方式完成特定任务。

### 主要特点

- **即插即用** - 安装后即可在对话中直接调用
- **多场景覆盖** - 文档处理、网页开发、数据分析、创意设计等
- **官方维护** - 由 Anthropic 团队持续更新优化
- **可自定义** - 支持创建和分享自己的 Skills

---

## 技能分类

### 1. 文档处理技能 (Document Skills)

| 技能名称 | 核心功能 | 可用性 |
|---------|---------|--------|
| **docx** | 创建、编辑 Word 文档，支持修订追踪、批注、格式化 | Source-available |
| **pdf** | 提取文本、表格、元数据，合并与批注 PDF | Source-available |
| **pptx** | 读取、生成、调整幻灯片、布局、模板 | Source-available |
| **xlsx** | 电子表格操作：公式、图表、数据转换 | Source-available |

### 2. 网页开发技能

| 技能名称 | 核心功能 |
|---------|---------|
| **artifacts-builder** | 使用 React、Tailwind CSS、shadcn/ui 创建精美的 Claude Artifacts |
| **web-app-tester** | 测试 Web 应用，执行自动化测试流程 |

### 3. 其他示例技能

| 类别 | 技能示例 |
|-----|---------|
| **创意与设计** | 艺术创作、音乐生成、设计系统构建 |
| **开发与技本** | MCP 服务器生成、代码审查、技术文档编写 |
| **企业沟通** | 品牌规范检查、邮件撰写、会议记录整理 |

---

## 快速开始

### 方式一：Claude Code（推荐）

#### 1. 添加插件市场

```bash
/plugin marketplace add anthropics/skills
```

#### 2. 安装技能集

```bash
# 安装文档处理技能
/plugin install document-skills@anthropic-agent-skills

# 安装示例技能
/plugin install example-skills@anthropic-agent-skills
```

#### 3. 使用技能

安装后直接提及 Skill 名称即可使用：

```
使用 PDF skill 提取 file.pdf 中的表格数据
用 docx skill 帮我生成一份项目报告
```

### 方式二：Claude.ai 网页版

- 示例技能已默认可用（付费用户）
- 自定义技能上传请参考[官方文档](https://support.anthropic.com/en/articles/12512180-using-skills-in-claude)

### 方式三：Claude API

参考 [Skills API Quickstart](https://docs.anthropic.com/en/api/skills-guide) 进行程序化调用。

---

## 创建自定义 Skill

### 基础结构

参照仓库中的 `template` 目录，创建一个包含 YAML frontmatter 的 `SKILL.md` 文件：

```markdown
---
name: my-skill-name
description: A clear description of what this skill does and when to use it
---

# My Skill Name

当用户请求与此技能相关的任务时，请遵循以下指南...

## 执行步骤
1. 步骤一
2. 步骤二
3. 步骤三

## 示例
- 示例用法 1
- 示例用法 2

## 注意事项
- 注意事项 1
- 注意事项 2
```

### 必需字段

| 字段 | 说明 | 示例 |
|-----|------|------|
| `name` | 唯一标识符（小写，空格用连字符） | `document-analyzer` |
| `description` | 完整的功能和使用场景描述 | `分析文档结构并提取关键信息` |

### 可选字段

```yaml
---
name: my-skill
description: My skill description
author: Your Name
version: 1.0.0
tags: [document, analysis, automation]
---
```

---

## 目录结构

```
skills/
├── .claude-plugin/          # Claude Code 插件配置
├── skills/                   # 技能示例
│   ├── docx/                # Word 文档处理
│   ├── pdf/                 # PDF 处理
│   ├── pptx/                # PPT 处理
│   ├── xlsx/                # Excel 处理
│   ├── web-artifacts-builder/   # 网页组件构建
│   └── ...                  # 其他示例技能
├── spec/                    # Agent Skills 规范定义
├── template/                # 技能创建模板
└── README.md
```

---

## 使用示例

### PDF 技能示例

```
用户：提取这个 PDF 中的表格数据
Claude：使用 PDF skill 提取 path/to/document.pdf 中的表格数据...

用户：合并这两个 PDF 文件
Claude：使用 PDF skill 合并 file1.pdf 和 file2.pdf...
```

### Docx 技能示例

```
用户：生成一份项目总结报告
Claude：使用 docx skill 创建项目报告，包含以下内容：
- 项目概述
- 完成情况
- 遇到的问题
- 下一步计划
```

### Artifacts Builder 示例

```
用户：创建一个响应式的导航栏组件
Claude：使用 artifacts-builder skill 创建一个包含 Logo、菜单项、用户头像的玻璃态导航栏...
```

---

## 故障排除

### 技能无法加载

```bash
# 检查插件市场是否添加成功
/plugin marketplace list

# 重新安装技能
/plugin uninstall <skill-name>
/plugin install <skill-name>@anthropic-agent-skills
```

### 技能不生效

1. 确认 Skill 已正确安装：`/plugin list`
2. 在提示中明确提及 Skill 名称
3. 检查 Skill 文件语法是否正确

### 自定义 Skill 问题

- 确保 YAML frontmatter 格式正确
- `name` 字段必须唯一且使用小写字母
- `description` 应该清晰描述 Skill 的功能和使用场景

---

## 最佳实践

1. **命名规范** - 使用描述性名称，如 `document-analyzer` 而非 `skill-1`
2. **描述清晰** - description 应该说明 Skill 的功能、使用场景和输入输出
3. **指令具体** - 提供清晰的步骤和示例
4. **测试迭代** - 先在小范围测试，再推广使用

---

## 相关资源

- [Anthropic Skills 仓库](https://github.com/anthropics/skills)
- [Skills 官方文档](https://docs.anthropic.com/en/docs/skills)
- [Skills API 指南](https://docs.anthropic.com/en/api/skills-guide)
- [Claude.ai Skills 支持](https://support.anthropic.com/en/articles/12512180-using-skills-in-claude)

---

## 总结

Anthropic Skills 是 **Claude 官方的能力扩展系统**：

1. **即装即用** - 通过插件系统快速安装
2. **专业文档** - 内置 docx/pdf/pptx/xlsx 处理能力
3. **可自定义** - 轻松创建符合自己需求的 Skills
4. **持续更新** - 官方维护，功能不断增强

**适用于**: 需要标准化 AI 工作流的团队、频繁处理文档的用户、希望扩展 Claude 能力的开发者

