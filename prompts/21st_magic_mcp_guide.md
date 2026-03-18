# 21st.dev Magic MCP 使用指南

> Vibe Design 神器 - 在 Cursor/Windsurf/Claude 中像 v0 一样生成 UI 组件

[官网](https://21st.dev/magic) | [GitHub](https://github.com/21st-dev/magic-mcp) | [Discord](https://discord.gg/Qx4rFunHfm)

---

## 核心功能

21st.dev Magic MCP 是一个 **AI 驱动的 UI 组件生成工具**，让你可以在 IDE 中通过自然语言描述即时创建现代化的 UI 组件。

### 特色

- **AI 生成组件** - 用自然语言描述，自动生成 React/Tailwind 代码
- **多 IDE 支持** - Cursor、Windsurf、VSCode + Cline、Claude
- **实时预览** - 即时查看组件效果
- **TypeScript 支持** - 完整的类型安全
- **SVGL 集成** - 访问专业品牌 Logo 和图标库
- **v0 替代** - "像 v0，但是在你的 IDE 里"

---

## 快速开始

### 获取 API 密钥

1. 访问 https://21st.dev/magic/console
2. 注册/登录账号
3. 生成 API 密钥

### 安装方法

#### 方法1：CLI 安装（推荐）

```bash
npx @21st-dev/cli@latest install <client> --api-key <your-api-key>
```

支持的客户端：
- `cursor` - Cursor IDE
- `windsurf` - Windsurf IDE
- `cline` - VSCode + Cline 扩展
- `claude` - Claude Desktop

#### 方法2：手动配置

添加到 MCP 配置文件：

```json
{
  "mcpServers": {
    "@21st-dev/magic": {
      "command": "npx",
      "args": ["-y", "@21st-dev/magic@latest", "API_KEY=\"your-api-key\""]
    }
  }
}
```

配置文件位置：

| IDE | 配置文件路径 |
|-----|-------------|
| Cursor | `~/.cursor/mcp.json` |
| Windsurf | `~/.codeium/windsurf/mcp_config.json` |
| Cline | `~/.cline/mcp_config.json` |
| Claude | `~/.claude/mcp_config.json` |

#### 方法3：VS Code 安装

1. 打开 VS Code 设置
2. 搜索 MCP 配置
3. 添加 21st.dev Magic MCP

---

## 使用方法

### 基础用法

在 AI Agent 聊天中输入 `/ui` 后跟组件描述：

```
/ui create a modern navigation bar with responsive design
```

### 示例场景

#### 导航栏
```
/ui create a glassmorphism navbar with logo, menu items, and user avatar
```

#### 卡片组件
```
/ui create a bento grid card with gradient background, icon, title and description
```

#### 表单元素
```
/ui create a modern input field with floating label and validation states
```

#### 数据展示
```
/ui create a dashboard stats card with large number, trend indicator, and sparkline chart
```

#### 按钮组
```
/ui create a primary CTA button with hover animation and loading state
```

---

## 组件特性

### 内置样式支持

- **Glassmorphism** - 毛玻璃效果
- **Bento Grid** - 便当盒网格布局
- **Neumorphism** - 新拟态设计
- **Gradient** - 渐变色彩
- **Dark Mode** - 深色模式适配
- **Animation** - 交互动画

### 技术栈

- React 18+
- TypeScript
- Tailwind CSS
- shadcn/ui 组件（可选）

---

## 高级用法

### 组件增强（即将推出）

```
/ui enhance my Button component with hover animation and loading state
```

### 品牌资源集成

自动生成包含品牌 Logo 的组件：

```
/ui create a login page with Google and GitHub OAuth buttons
```

---

## 定价

| 版本 | 价格 | 说明 |
|------|------|------|
| **Beta** | 免费 | 所有功能免费使用 |
| **Free** | $0 | 有限的月度生成额度 |
| **Pro** | 付费 | 无限生成，高级功能 |

> Beta 期间所有功能免费，之后超出免费额度需要升级。

---

## 故障排除

### 常见问题

**Q: MCP 服务器无法启动**
```bash
# 检查 Node.js 版本
node -v  # 需要 v18+

# 重新安装
npm uninstall -g @21st-dev/magic
npm install -g @21st-dev/magic
```

**Q: API 密钥无效**
- 确认密钥来自 https://21st.dev/magic/console
- 检查密钥是否正确复制（无空格）

**Q: 组件生成失败**
- 检查网络连接
- 确认 API 密钥额度充足
- 尝试简化描述

---

## 社区资源

- **官网**: https://21st.dev/magic
- **控制台**: https://21st.dev/magic/console
- **Discord**: https://discord.gg/Qx4rFunHfm
- **Twitter**: https://x.com/serafimcloud

---

## 相关工具

- **[shadcn/ui](https://ui.shadcn.com/)** - 底层组件库
- **[v0.dev](https://v0.dev/)** - Vercel 的类似工具
- **[Claude Artifacts](https://claude.ai)** - Claude 的组件预览功能

---

## 总结

21st.dev Magic MCP 是 **Vibe Design** 工作流的完美工具：

1. **快速原型** - 几分钟生成精美组件
2. **IDE 集成** - 无需切换工具
3. **生产就绪** - 生成的代码可直接使用
4. **AI 驱动** - 自然语言描述，智能生成

**适用于**: 快速原型设计、组件库构建、设计系统开发、Vibe Coding
