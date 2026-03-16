# 📖 Figma MCP Server 使用指南

## 1. 这是什么？(What is this?)
Figma MCP Server 是 **Figma 官方提供的 MCP（Model Context Protocol）服务**，让 AI 助手直接在 IDE 中获取 Figma 设计信息。
*   **核心能力**: 在 IDE 中直接获取 Figma 设计上下文并生成代码。
*   **设计转代码**: 选中 Figma 画框，直接生成 React + Tailwind 代码。
*   **设计令牌提取**: 获取颜色、间距、字体等设计变量。
*   **组件映射**: 通过 Code Connect 将 Figma 组件映射到代码组件。
*   **远程服务**: 无需本地安装，通过 MCP 协议直接连接。

## 2. 为什么需要它？
如果你经常需要：
*   根据 Figma 设计稿**手写代码还原 UI**。
*   在 IDE 中**查看设计细节**（颜色值、间距、字体大小）。
*   让 AI 根据设计稿**自动生成组件代码**。
*   保持设计稿与代码的**一致性**。

Figma MCP Server 可以直接在 Claude/Cursor/VS Code 中访问 Figma 数据。

## 3. 小白配置教程

### Claude Code / Claude Desktop
```bash
claude mcp add --transport http figma https://mcp.figma.com/mcp
```

或使用插件安装：
```bash
claude plugin install figma@claude-plugins-official
```

### VS Code (with Claude Extension)
1. 按 `⌘ Shift P` → 输入 "MCP: Add Server"
2. 选择 **HTTP Server**
3. 输入 URL: `https://mcp.figma.com/mcp`
4. Server ID 设置为: `figma`
5. 切换到 Agent 模式 (`⌥⌘B` 或 `⌃⌘I`)
6. 输入 `#get_design_context` 验证工具是否可用

### Cursor
安装命令：
```
/add-plugin figma
```

或手动配置：
1. 打开 Settings → MCP tab
2. 添加 HTTP Server
3. URL: `https://mcp.figma.com/mcp`
4. Server ID: `figma`

## 4. 核心使用方式

### 步骤 1：在 Figma 中复制链接
1. 在 Figma 中选中任意画框/组件
2. 右键 → "Copy link" 复制链接
3. 或直接复制文件 URL

### 步骤 2：在 IDE 中调用工具
在 Claude/Cursor 中直接描述需求：
```
请根据这个 Figma 设计生成 React 组件：https://figma.com/file/xxxxx
```

AI 会自动调用 `get_design_context` 工具获取设计信息。

## 5. 可用工具列表

| 工具名 | 功能说明 |
| :--- | :--- |
| `get_design_context` | 获取 Figma 选中内容的结构化数据（React+Tailwind） |
| `get_variable_defs` | 提取设计变量（颜色、间距、字体令牌） |
| `get_code_connect_map` | 获取 Figma 组件与代码组件的映射关系 |
| `get_screenshot` | 获取选中内容的截图（视觉参考） |
| `generate_diagram` | 用 Mermaid 语法生成 FigJam 图表 |
| `whoami` | 验证当前登录的 Figma 用户 |

## 6. 核心特性
*   🎨 **设计转代码** — 自动生成 React + Tailwind 代码。
*   📐 **设计令牌** — 提取颜色、字体、间距等设计系统变量。
*   🔗 **Code Connect** — 连接 Figma 组件与实际代码组件。
*   📸 **截图获取** — 获取设计稿截图作为视觉参考。
*   📝 **FigJam 支持** — 生成图表、提取白板内容。
*   🔐 **安全认证** — 使用 Figma 账号授权访问。

## 7. 使用限制

| 用户类型 | 月度调用限制 |
| :--- | :--- |
| Starter 免费用户 | 6 次/月 |
| View/Collab 席位（付费） | 6 次/月 |
| Dev/Full 席位（Professional+） | Tier 1 REST API 限制 |

> **注意**: 免费用户每月仅 6 次工具调用，建议合理使用。

## 8. 使用技巧

### 获取设计上下文
```
请分析这个 Figma 文件的设计结构：https://figma.com/file/xxxxx
```

### 生成组件代码
```
请根据 Figma 设计生成一个响应式导航栏组件：https://figma.com/file/xxxxx?node-id=xx
```

### 提取设计系统令牌
```
请提取这个设计文件中的颜色、字体和间距变量：https://figma.com/file/xxxxx
```

### 获取截图参考
```
请截图这个设计稿并生成对应的 HTML/CSS：https://figma.com/file/xxxxx
```

## 9. 常见问题

*   **Q: 提示 "Rate limit exceeded"？**
    *   A: 免费用户每月限制 6 次调用，升级到 Dev/Full 席位可解除限制。
*   **Q: 需要 Figma 账号吗？**
    *   A: 需要，首次使用会跳转到 Figma 授权页面。
*   **Q: 支持哪些代码框架？**
    *   A: 默认生成 React + Tailwind CSS，也支持其他框架。
*   **Q: 生成的代码可以直接使用吗？**
    *   A: 需要根据实际情况调整，建议作为参考起点。

## 10. 资源地址
*   **官方指南**: [figma/mcp-server-guide](https://github.com/figma/mcp-server-guide)
*   **Figma 官网**: [figma.com](https://figma.com)
*   **MCP 协议**: [modelcontextprotocol.io](https://modelcontextprotocol.io)
*   **Code Connect**: [Figma Code Connect](https://help.figma.com/hc/en-us/articles/23920389749655-Code-Connect)
