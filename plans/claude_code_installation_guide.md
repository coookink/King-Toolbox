# Claude Code 安装配置指南

## 📋 概述

Claude Code 是 Anthropic 官方推出的交互式 CLI 工具，用于辅助软件工程任务。它基于 Claude Agent SDK 构建，提供强大的代码编辑、文件操作和任务管理能力。

## 🔗 官方资源

- **GitHub 仓库**: https://github.com/anthropics/claude-code
- **问题反馈**: https://github.com/anthropics/claude-code/issues
- **文档地图**: https://docs.claude.com/en/docs/claude-code/claude_code_docs_map.md

## 📦 安装方式

### 方法一：从 GitHub 下载（推荐）

```bash
# 1. 克隆官方仓库
git clone https://github.com/anthropics/claude-code.git

# 2. 进入项目目录
cd claude-code

# 3. 查看安装说明
cat README.md
```

### 方法二：等待官方发布

目前 Claude Code 可能处于早期访问阶段，请关注官方 GitHub 仓库获取最新安装方式。

## ⚙️ 环境要求

根据系统提示词分析，Claude Code 需要：

- **Node.js 环境**（用于运行 CLI 工具）
- **Anthropic API Key**（用于调用 Claude 模型）
- **操作系统支持**: Linux, macOS, Windows

## 🔑 配置步骤

### 1. 获取 API Key

访问 [Anthropic Console](https://console.anthropic.com/) 获取您的 API Key。

### 2. 设置环境变量

```bash
# Linux/macOS
export ANTHROPIC_API_KEY="your-api-key-here"

# Windows (PowerShell)
$env:ANTHROPIC_API_KEY="your-api-key-here"

# 永久配置（添加到 ~/.bashrc 或 ~/.zshrc）
echo 'export ANTHROPIC_API_KEY="your-api-key-here"' >> ~/.bashrc
source ~/.bashrc
```

### 3. 验证安装

```bash
# 运行 Claude Code
claude-code --help

# 或根据实际安装方式运行
npm start
```

## 🎯 核心功能

### 文件操作
- **Read**: 读取文件内容（支持图片、PDF、Jupyter Notebook）
- **Edit**: 精确字符串替换编辑
- **Write**: 创建新文件
- **Glob**: 文件模式匹配搜索
- **Grep**: 正则表达式内容搜索

### 代码执行
- **Bash**: 执行终端命令（支持后台运行）
- **Git 集成**: 自动提交、创建 PR
- **包管理**: npm/pip/cargo 等包管理器支持

### 任务管理
- **TodoWrite**: 创建和管理任务列表
- **Task**: 启动专用子代理处理复杂任务

### Web 功能
- **WebFetch**: 获取并分析网页内容
- **WebSearch**: 搜索最新信息

## 💡 使用技巧

### 1. 任务规划
Claude Code 会自动使用 TodoWrite 工具规划多步骤任务：
```
- 运行构建
- 修复类型错误
- 运行测试
```

### 2. Git 提交
自动生成规范的提交信息：
```bash
# Claude Code 会自动添加
🤖 Generated with [Claude Code](https://claude.com/claude-code)
Co-Authored-By: Claude <noreply@anthropic.com>
```

### 3. 代码引用
使用 `file_path:line_number` 格式引用代码位置：
```
错误处理在 src/services/process.ts:712
```

## 🚨 常见问题

### Q1: 提示 "npm install -g @anthropic-ai/claude-code" 无效？
**A**: Claude Code 不是通过 npm 全局安装的包，需要从 GitHub 克隆仓库或等待官方发布安装包。

### Q2: 如何获取 API Key？
**A**: 访问 https://console.anthropic.com/ 注册账号并创建 API Key。

### Q3: 支持哪些模型？
**A**: 默认使用 `claude-sonnet-4-5-20250929`，知识截止日期为 2025年1月。

### Q4: 如何反馈问题？
**A**: 在 GitHub Issues 提交：https://github.com/anthropics/claude-code/issues

### Q5: 与其他 AI 编程工具的区别？
**A**: 
- **Claude Code**: Anthropic 官方 CLI 工具，命令行交互
- **Cursor**: 独立 IDE，基于 VSCode
- **GitHub Copilot**: VSCode 插件，代码补全
- **Windsurf**: Codeium 的 AI IDE

## 📚 相关资源

### Anthropic SDK（用于开发）
如果您想在项目中集成 Claude API：
```bash
npm install @anthropic-ai/sdk
```

### 其他 Anthropic 工具
- **Claude for Chrome**: 浏览器扩展
- **Claude API**: RESTful API 接口
- **Claude.ai**: Web 界面

## 🔄 更新日志

- **Version 2.0.0** (2025-09-29): 最新版本，增强任务管理和代理功能

## 📞 获取帮助

在 Claude Code 中输入：
```bash
/help
```

---

**注意**: 本指南基于 Claude Code 2.0 系统提示词分析编写，实际安装步骤请以官方 GitHub 仓库为准。
