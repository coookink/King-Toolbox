# 📖 Framelink Figma Context MCP 使用指南

## 1. 这是什么？(What is this?)
Framelink Figma Context MCP 是一个**社区开发的 MCP 服务器**，专为 AI 编码代理（如 Cursor）提供简化的 Figma 设计信息。
*   **核心能力**: 获取 Figma 文件/画板/组的布局和样式信息，简化后提供给 AI。
*   **智能过滤**: 自动过滤不相关信息，只保留最相关的布局数据。
*   **无限制**: 不受官方 MCP 的 6次/月限制。
*   **本地运行**: 通过 NPM 安装，本地运行。

## 2. 与官方 Figma MCP 的区别

| 特性 | 官方 Figma MCP | Framelink Context MCP |
|------|---------------|----------------------|
| 安装方式 | HTTP 远程服务 | 本地 NPM 包 (`npx`) |
| 认证方式 | Figma OAuth | Figma API Key |
| 数据量 | 完整设计数据 | 简化/过滤后的布局信息 |
| 使用限制 | 6次/月（免费用户） | 无限制 |
| 目标 IDE | 通用（Claude/Cursor/VS Code） | 专门为 Cursor 优化 |

> **核心优势**: 通过简化数据量，提高 AI 准确性和响应相关性，更擅长一次性准确实现设计。

## 3. 为什么需要它？
如果你经常需要：
*   在 **Cursor** 中根据 Figma 设计生成代码。
*   避免官方 MCP 的**月度调用限制**。
*   获取**更精简、更相关**的设计信息（而非完整复杂数据）。
*   希望**更快响应**（本地处理，无网络延迟）。

Framelink Context MCP 是专门为 Cursor 用户优化的选择。

## 4. 小白配置教程

### 步骤 1：获取 Figma API Key
1. 登录 Figma → Settings → Personal Access Tokens
2. 点击 "Create new" 生成 API Key
3. 复制保存该密钥

### 步骤 2：配置 Cursor MCP

**macOS / Linux:**
打开 Cursor Settings → MCP → Add Server，添加配置：

```json
{
  "mcpServers": {
    "Framelink Figma Context": {
      "command": "npx",
      "args": [
        "-y",
        "figma-developer-mcp",
        "--figma-api-key=YOUR_FIGMA_API_KEY",
        "--stdio"
      ]
    }
  }
}
```

**Windows:**
Windows 需要使用 `cmd` 包装：

```json
{
  "mcpServers": {
    "Framelink Figma Context": {
      "command": "cmd",
      "args": [
        "/c",
        "npx",
        "-y",
        "figma-developer-mcp",
        "--figma-api-key=YOUR_FIGMA_API_KEY",
        "--stdio"
      ]
    }
  }
}
```

> ⚠️ **重要**: 将 `YOUR_FIGMA_API_KEY` 替换为你的实际 Figma API Key。

## 5. 核心使用方式

### 在 Cursor 中使用
1. 在 Figma 中选中设计，右键复制链接
2. 在 Cursor 聊天中粘贴链接：
```
请根据这个 Figma 设计实现页面：https://figma.com/file/xxxxx
```
3. Cursor 会自动调用 MCP 获取设计信息并生成代码

### 支持的请求
- **文件级别**: 获取整个文件的页面结构
- **画板级别**: 获取特定画板的布局和样式
- **组件级别**: 获取特定组件的详细信息

## 6. 核心特性
*   🎯 **数据精简** — 自动过滤不相关信息，只保留布局关键数据。
*   🚀 **无限制调用** — 无官方 MCP 的月度限制。
*   ⚡️ **快速响应** — 本地运行，无网络延迟。
*   🎨 **布局智能** — 提取间距、尺寸、颜色等关键样式。
*   🔧 **Cursor 优化** — 专门为 Cursor AI 设计的数据格式。
*   💻 **本地运行** — 数据不经过第三方服务器。

## 7. 输出格式示例

获取的设计数据会被转换为简化格式：

```json
{
  "name": "Login Button",
  "type": "BUTTON",
  "width": 200,
  "height": 48,
  "backgroundColor": "#007AFF",
  "borderRadius": 8,
  "text": {
    "content": "Sign In",
    "fontSize": 16,
    "color": "#FFFFFF"
  }
}
```

## 8. 常见问题

*   **Q: 与官方 MCP 选哪个？**
    *   A: Cursor 用户优先选 Framelink；需要完整设计数据或团队协作选官方。
*   **Q: 支持哪些框架代码生成？**
    *   A: 支持任意框架，由 Cursor AI 决定如何转换设计数据。
*   **Q: API Key 泄露风险？**
    *   A: 建议只给 Cursor 本地使用，不要提交到代码仓库。
*   **Q: 安装失败？**
    *   A: 确保已安装 Node.js，尝试 `npm install -g figma-developer-mcp`。
*   **Q: Windows 配置不生效？**
    *   A: 确保使用 `cmd /c` 包装命令，参考上面的 Windows 配置。

## 9. 资源地址
*   **GitHub**: [GLips/Figma-Context-MCP](https://github.com/GLips/Figma-Context-MCP)
*   **NPM 包**: [figma-developer-mcp](https://www.npmjs.com/package/figma-developer-mcp)
*   **Figma API 文档**: [Figma Developers](https://www.figma.com/developers)
