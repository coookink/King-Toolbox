# 🤖 OpenCode (The Open Source Coding Agent) 指南

## 1. 项目介绍
OpenCode 是目前最硬核的开源编程 Agent 之一。
* **核心定位**: 100% 开源、不绑定特定模型供应商（支持 OpenAI, Claude, Google, 本地模型）。
* **独特架构**: 采用 **Client/Server** 分离设计。你可以将服务端部署在高性能服务器上，然后通过本地终端 (TUI) 甚至移动端进行控制。
* **交互方式**: 专注于 **TUI (终端用户界面)**，是 Vim/Neovim 用户和命令行极客的终极武器。

## 2. 安装与部署 (Installation)

### 2.1 快速安装 (Linux/macOS)
官方提供了一键安装脚本，将其安装到系统路径：
```bash
OPENCODE_INSTALL_DIR=/usr/local/bin curl -fsSL [https://opencode.ai/install](https://opencode.ai/install) | bash