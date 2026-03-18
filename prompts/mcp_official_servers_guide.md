# MCP 官方服务器合集

> Model Context Protocol 官方参考服务器实现与社区资源汇总

[GitHub 仓库](https://github.com/modelcontextprotocol/servers) | [官方文档](https://modelcontextprotocol.io/) | [服务器注册表](https://registry.modelcontextprotocol.io/)

---

## 核心功能

这是 **MCP (Model Context Protocol)** 的官方服务器集合，提供参考实现展示 MCP 的多样性和可扩展性，让 LLM 能够安全、可控地访问工具和数据源。

> ⚠️ **重要提示**：这些服务器主要作为**参考实现**用于演示 MCP 特性和 SDK 使用方法，是教育示例而非生产就绪解决方案。

---

## 官方服务器（7个活跃）

| 服务器 | 分类 | 核心功能 | 安装命令 |
|--------|------|---------|---------|
| **Everything** | 测试/参考 | 完整的 MCP 功能演示服务器（Prompts、Resources、Tools） | `npx @modelcontextprotocol/server-everything` |
| **Fetch** | 网络/Web | 获取网页内容并转换为 LLM 友好的格式 | `npx @modelcontextprotocol/server-fetch` |
| **Filesystem** | 文件系统 | 安全的文件操作，支持可配置的访问控制 | `npx @modelcontextprotocol/server-filesystem` |
| **Git** | 开发工具 | 读取、搜索和操作 Git 仓库的工具 | `npx @modelcontextprotocol/server-git` |
| **Memory** | 记忆/AI | 基于知识图谱的持久化记忆系统 | `npx @modelcontextprotocol/server-memory` |
| **Sequential Thinking** | AI 推理 | 通过思维序列进行动态和反思性问题解决 | `npx @modelcontextprotocol/server-sequential-thinking` |
| **Time** | 工具/时间 | 时间和时区转换功能 | `npx @modelcontextprotocol/server-time` |

---

## 已归档服务器

以下 13 个服务器已移至 [servers-archived](https://github.com/modelcontextprotocol/servers-archived) 仓库：

| 服务器 | 功能 | 备注 |
|--------|------|------|
| AWS KB Retrieval | AWS 知识库检索 | 可获取社区替代方案 |
| Brave Search | Brave 搜索引擎集成 | 可获取社区替代方案 |
| EverArt | AI 图像生成 | 可获取社区替代方案 |
| GitHub | GitHub API 集成 | 可获取社区替代方案 |
| GitLab | GitLab API 集成 | 可获取社区替代方案 |
| Google Drive | Google Drive 文件访问 | 可获取社区替代方案 |
| Google Maps | 地图和位置服务 | 可获取社区替代方案 |
| PostgreSQL | 数据库查询和操作 | 可获取社区替代方案 |
| Puppeteer | 浏览器自动化 | 可获取社区替代方案 |
| Redis | Redis 数据库操作 | 可获取社区替代方案 |
| Sentry | 错误监控集成 | 可获取社区替代方案 |
| Slack | Slack 消息发送 | 可获取社区替代方案 |
| SQLite | SQLite 数据库操作 | 可获取社区替代方案 |

---

## 快速开始

### 安装官方服务器

#### 文件系统服务器

```bash
# 安装
npm install -g @modelcontextprotocol/server-filesystem

# 配置示例（~/.claude/mcp_config.json）
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/dir"]
    }
  }
}
```

#### Git 服务器

```bash
# 配置示例
{
  "mcpServers": {
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"]
    }
  }
}
```

#### Fetch 服务器

```bash
# 配置示例
{
  "mcpServers": {
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    }
  }
}
```

#### Memory 服务器

```bash
# 配置示例
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

#### Sequential Thinking 服务器

```bash
# 配置示例
{
  "mcpServers": {
    "sequential-thinking": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

### 多服务器配置示例

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/home/user/projects"]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git"]
    },
    "fetch": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-fetch"]
    },
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    }
  }
}
```

---

## 各服务器详细说明

### Filesystem 服务器

**功能**：安全的文件系统操作

**可用工具**：
- `read_file` - 读取文件内容
- `write_file` - 写入文件
- `list_directory` - 列出目录内容
- `search_files` - 搜索文件
- `get_file_info` - 获取文件信息

**安全特性**：
- 可配置允许的目录列表
- 路径验证防止目录遍历
- 操作权限控制

---

### Git 服务器

**功能**：Git 仓库操作

**可用工具**：
- `git_status` - 查看仓库状态
- `git_log` - 查看提交历史
- `git_diff` - 查看代码差异
- `git_search` - 搜索代码
- `git_read_file` - 读取指定版本的文件

---

### Fetch 服务器

**功能**：网页内容获取

**可用工具**：
- `fetch_url` - 获取 URL 内容
- `fetch_search` - 搜索并获取结果

**特点**：
- 自动转换为 LLM 友好的 Markdown 格式
- 支持 HTML 到文本的转换
- 可处理 JavaScript 渲染的页面

---

### Memory 服务器

**功能**：持久化知识图谱记忆

**可用工具**：
- `create_entities` - 创建实体
- `create_relations` - 创建关系
- `add_observations` - 添加观察
- `delete_entities` - 删除实体
- `read_graph` - 读取知识图谱
- `search_nodes` - 搜索节点

**应用场景**：
- 跨会话记忆保持
- 实体关系管理
- 复杂信息关联

---

### Sequential Thinking 服务器

**功能**：动态反思性问题解决

**可用工具**：
- `sequentialthinking` - 执行思维序列

**特点**：
- 逐步推理过程
- 支持思路回溯
- 适合复杂问题分析

---

### Time 服务器

**功能**：时间和时区处理

**可用工具**：
- `get_current_time` - 获取当前时间
- `convert_time` - 时区转换

---

## MCP SDK 支持

官方提供多语言 SDK：

| 语言 | SDK 仓库 | 适用场景 |
|------|---------|---------|
| **TypeScript** | [typescript-sdk](https://github.com/modelcontextprotocol/typescript-sdk) | Node.js 服务器开发 |
| **Python** | [python-sdk](https://github.com/modelcontextprotocol/python-sdk) | Python 服务器开发 |
| **C#** | [csharp-sdk](https://github.com/modelcontextprotocol/csharp-sdk) | .NET 服务器开发 |
| **Go** | [go-sdk](https://github.com/modelcontextprotocol/go-sdk) | Go 服务器开发 |
| **Java** | [java-sdk](https://github.com/modelcontextprotocol/java-sdk) | Java 服务器开发 |
| **Kotlin** | [kotlin-sdk](https://github.com/modelcontextprotocol/kotlin-sdk) | Kotlin 服务器开发 |
| **PHP** | [php-sdk](https://github.com/modelcontextprotocol/php-sdk) | PHP 服务器开发 |
| **Ruby** | [ruby-sdk](https://github.com/modelcontextprotocol/ruby-sdk) | Ruby 服务器开发 |
| **Rust** | [rust-sdk](https://github.com/modelcontextprotocol/rust-sdk) | Rust 服务器开发 |
| **Swift** | [swift-sdk](https://github.com/modelcontextprotocol/swift-sdk) | Swift 服务器开发 |

---

## 社区服务器

官方维护了一个精选的第三方服务器列表，包括：

### 官方集成
- **AWS** - 亚马逊云服务集成
- **Azure** - 微软云服务集成
- **GitHub** - GitHub 高级集成
- **Slack** - Slack 工作区管理
- **PostgreSQL** - 生产级数据库支持
- **Redis** - 缓存和消息队列
- **Sentry** - 错误监控和分析

### 其他类别
- **金融** - 股票、加密货币数据
- **数据分析** - BI 工具、数据可视化
- **开发工具** - CI/CD、代码质量、文档
- **生产力** - 日历、邮件、任务管理

完整列表访问：[MCP 服务器注册表](https://registry.modelcontextprotocol.io/)

---

## 开发自己的服务器

### 基础结构（TypeScript 示例）

```typescript
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";

const server = new Server({
  name: "my-server",
  version: "1.0.0"
}, {
  capabilities: {
    tools: {}
  }
});

// 定义工具
server.setRequestHandler("tools/list", async () => {
  return {
    tools: [{
      name: "my_tool",
      description: "My tool description",
      inputSchema: {
        type: "object",
        properties: {
          param: { type: "string" }
        }
      }
    }]
  };
});

// 处理工具调用
server.setRequestHandler("tools/call", async (request) => {
  if (request.params.name === "my_tool") {
    // 实现工具逻辑
    return { content: [{ type: "text", text: "Result" }] };
  }
});

const transport = new StdioServerTransport();
await server.connect(transport);
```

### 开发流程

1. **选择 SDK** - 根据语言选择合适的官方 SDK
2. **定义能力** - 确定服务器提供的 Resources/Tools/Prompts
3. **实现处理程序** - 编写请求处理逻辑
4. **测试验证** - 使用 MCP Inspector 工具测试
5. **发布分享** - 提交到社区服务器注册表

---

## 故障排除

### 服务器无法启动

```bash
# 检查 Node.js 版本（需要 18+）
node -v

# 清理缓存重新安装
npm cache clean --force
npx @modelcontextprotocol/server-<name>
```

### 连接问题

1. 检查 MCP 配置文件语法
2. 确认服务器包名正确
3. 查看服务器日志输出

### 权限问题

- **Filesystem**: 确认允许访问的目录路径正确
- **Git**: 确认有仓库读取权限
- **Fetch**: 确认网络连接正常

---

## 相关资源

| 资源 | 链接 | 说明 |
|------|------|------|
| **官方文档** | [modelcontextprotocol.io](https://modelcontextprotocol.io/) | MCP 完整文档 |
| **协议规范** | [spec.modelcontextprotocol.io](https://spec.modelcontextprotocol.io/) | 协议详细规范 |
| **服务器注册表** | [registry.modelcontextprotocol.io](https://registry.modelcontextprotocol.io/) | 社区服务器列表 |
| **TypeScript SDK** | [npm](https://www.npmjs.com/package/@modelcontextprotocol/sdk) | TypeScript SDK 包 |
| **Python SDK** | [PyPI](https://pypi.org/project/mcp/) | Python SDK 包 |
| **Archived 服务器** | [GitHub](https://github.com/modelcontextprotocol/servers-archived) | 已归档服务器 |

---

## 总结

MCP 官方服务器集合是 **学习 MCP 开发的最佳起点**：

1. **参考实现** - 7 个活跃服务器展示最佳实践
2. **多语言支持** - 10 种语言的官方 SDK
3. **丰富生态** - 大量社区服务器可用
4. **标准协议** - 统一的 AI 工具集成方式

**适用于**: 希望集成 MCP 的开发者、学习 MCP 协议实现、寻找 AI 工具扩展方案

