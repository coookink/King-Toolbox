# 🦞 OpenClaw 个人 AI 助理指南

## 1. 这是什么？(What is this?)
OpenClaw 是一个**运行在自己设备上的个人 AI 助理**。
*   **核心特点**: 支持 WhatsApp、Telegram、Slack、Discord、Google Chat、Signal、iMessage 等多个消息平台。
*   **语音能力**: 支持 macOS/iOS/Android 的语音唤醒和对话模式。
*   **实时画布**: 提供可视化的Agent控制工作空间。
*   **物理位置**: `modules/openclaw`

## 2. 为什么需要它？
*   **私有化部署**: AI助理完全运行在你自己的服务器/电脑上，数据不经过第三方。
*   **多平台统一**: 一个助理连接所有你常用的消息应用。
*   **本地优先**: 响应速度快，始终在线。

## 3. 小白安装教程

### 前置要求
*   **Node.js ≥ 22**
*   支持 macOS、Linux、Windows (WSL2)

### 一键安装（推荐）
```bash
# 全局安装 OpenClaw
npm install -g openclaw@latest

# 运行向导式安装（自动配置 Gateway 守护进程）
openclaw onboard --install-daemon
```

向导会引导你完成：
1.  Gateway（控制平面）配置
2.  工作区设置
3.  消息渠道连接
4.  技能安装

### 快速启动
```bash
# 启动 Gateway
openclaw gateway --port 18789 --verbose

# 发送测试消息
openclaw message send --to +1234567890 --message "Hello from OpenClaw"

# 与助理对话
openclaw agent --message "给我列个今天的任务清单" --thinking high
```

## 4. 核心功能

### 多渠道接入
*   **消息平台**: WhatsApp (Baileys), Telegram, Slack, Discord, Google Chat, Signal, iMessage (BlueBubbles), Microsoft Teams, Matrix, Zalo
*   **语音节点**: macOS app (菜单栏), iOS node, Android node

### 工具能力
*   **浏览器控制**: Chrome/Chromium 自动化
*   **Canvas画布**: Agent驱动的可视化工作空间
*   **节点操作**: 摄像头快照、屏幕录制、位置获取、通知推送

### 安全特性
*   **DM配对策略**: 默认要求未知用户配对才能使用
*   **沙箱模式**: 可为群组/频道会话配置Docker沙箱
*   **工具权限**: 精细控制bash、浏览器、节点等工具访问

## 5. 常见问题
*   **Q: 需要API密钥吗？**
    *   A: 需要。推荐 Anthropic Pro/Max (Claude Opus 4.5) 获得最佳效果。
*   **Q: 可以远程部署吗？**
    *   A: 可以。Gateway可运行在Linux服务器，通过Tailscale或SSH连接。
*   **Q: 如何连接WhatsApp？**
    *   A: 运行 `openclaw channels login` 扫码配对。

## 6. 资源地址
*   **GitHub**: [openclaw/openclaw](https://github.com/openclaw/openclaw)
*   **官方文档**: [docs.openclaw.ai](https://docs.openclaw.ai)
*   **Discord社区**: [discord.gg/clawd](https://discord.gg/clawd)
