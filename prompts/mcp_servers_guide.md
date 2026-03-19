# MCP 官方服务器生态指南

> Model Context Protocol 官方服务器集合 - 连接 LLM 与外部世界的桥梁

[GitHub](https://github.com/modelcontextprotocol/servers) | [官方文档](https://modelcontextprotocol.io/) | [服务器注册表](https://registry.modelcontextprotocol.io/)

---

## 简介

MCP (Model Context Protocol) 是由 Anthropic 推出的开放协议，用于标准化 LLM 与外部数据源、工具的连接方式。

**核心特点**:
- 安全的双向数据通道
- 标准化工具调用接口
- 支持多种编程语言 SDK
- 丰富的官方和社区服务器生态

---

## 官方参考服务器（7个）

这些服务器作为参考实现，演示 MCP 特性和 SDK 使用：

| 服务器 | 功能 | 用途 |
|--------|------|------|
| **everything** | 综合测试服务器 | 包含 prompts、resources、tools 的完整示例 |
| **fetch** | 网页内容抓取 | 获取并转换网页内容供 LLM 使用 |
| **filesystem** | 文件系统操作 | 带访问控制的本地文件操作 |
| **git** | Git 仓库操作 | 读取、搜索、操作 Git 仓库 |
| **memory** | 持久化记忆 | 基于知识图谱的长期记忆系统 |
| **sequentialthinking** | 序列化思考 | 动态反思式问题解决工具 |
| **time** | 时间工具 | 时区转换和时间查询 |

### 安装官方服务器

```bash
# 克隆仓库
git clone https://github.com/modelcontextprotocol/servers.git
cd servers

# 安装依赖
npm install

# 运行特定服务器
cd src/filesystem
npm run build
```

### Filesystem 配置示例

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/home/user/workspace"
      ]
    }
  }
}
```

---

## 金融投资类服务器

### 股票交易分析

| 服务器 | 提供商 | 功能 | 安装命令 |
|--------|--------|------|----------|
| **Alpaca** | Alpaca Markets | 股票/期权交易、市场数据分析、策略构建 | `npm install @alpacahq/alpaca-mcp` |
| **AlphaVantage** | AlphaVantage | 100+ 金融数据 API、股价、基本面数据 | `npm install @alphavantage/alpha-vantage-mcp` |

**Alpaca 功能**:
- 实时和历史市场数据查询
- 股票和期权交易执行
- 账户管理和持仓查询
- 策略回测工具

**AlphaVantage 功能**:
- 实时股价查询
- 技术指标计算 (RSI, MACD, Bollinger Bands)
- 基本面数据 (财务报表、公司信息)
- 外汇和加密货币数据

### 加密货币/区块链

| 服务器 | 功能 | 适用场景 |
|--------|------|---------|
| **Armor Crypto** | 多链交互、质押、DeFi、钱包管理、DCA、限价单、资产追踪 | 综合性加密资产管理 |
| **Bankless Onchain** | ERC20 代币查询、交易历史、智能合约状态 | 以太坊链上数据分析 |
| **BICScan** | EVM 地址风险评分、资产持仓分析 | 钱包安全审计 |
| **Bitnovo Pay** | 加密货币支付、QR 码管理、交易处理 | 商户加密支付接入 |

### 配置示例

```json
{
  "mcpServers": {
    "alphavantage": {
      "command": "npx",
      "args": ["-y", "@alphavantage/alpha-vantage-mcp"],
      "env": {
        "ALPHAVANTAGE_API_KEY": "your_api_key_here"
      }
    },
    "alpaca": {
      "command": "npx",
      "args": ["-y", "@alpacahq/alpaca-mcp"],
      "env": {
        "APCA_API_KEY_ID": "your_key_id",
        "APCA_API_SECRET_KEY": "your_secret_key"
      }
    }
  }
}
```

### 使用示例

**查询股票价格**:
```
使用 AlphaVantage 获取 AAPL 的当前股价和最新财报
```

**分析技术指标**:
```
计算 TSLA 过去30天的 RSI 和 MACD 指标
```

**获取投资组合概览**:
```
通过 Alpaca API 查看我的持仓和今日盈亏
```

**加密资产追踪**:
```
分析这个以太坊地址的资产持仓和风险评分
地址: 0x...
```

---

## 企业数据类服务器

| 服务器 | 功能 | 适用场景 |
|--------|------|---------|
| **Alkemi** | 查询 Snowflake、BigQuery、DataBricks 数据产品 | 企业数据仓库查询 |
| **Atla** | LLM 评估和模型性能测试 | AI 模型质量评估 |

---

## 开发工具类服务器

### 数据库

| 服务器 | 数据库 | 功能 |
|--------|--------|------|
| **PostgreSQL** | PostgreSQL | SQL 查询、表结构分析 |
| **SQLite** | SQLite | 本地数据库操作 |
| **Redis** | Redis | 键值存储操作 |

### 代码托管

| 服务器 | 平台 | 功能 |
|--------|------|------|
| **GitHub** | GitHub | Issue 管理、PR 审查、代码搜索 |
| **GitLab** | GitLab | 仓库管理、CI/CD 操作 |

### 云服务

| 服务器 | 平台 | 功能 |
|--------|------|------|
| **AWS KB Retrieval** | AWS | 知识库检索 |
| **Sentry** | Sentry | 错误追踪和分析 |

### 通信协作

| 服务器 | 平台 | 功能 |
|--------|------|------|
| **Slack** | Slack | 消息发送、频道管理 |
| **Google Drive** | Google Drive | 文件读写、搜索 |

---

## Web 搜索类服务器

| 服务器 | 搜索引擎 | 功能 |
|--------|---------|------|
| **Brave Search** | Brave | 隐私保护搜索 |
| **Fetch** | 通用 | 网页内容抓取和转换 |

---

## 其他实用服务器

| 服务器 | 功能 |
|--------|------|
| **EverArt** | AI 图像生成 |
| **Puppeteer** | 浏览器自动化 |
| **Google Maps** | 地图和地理编码 |

---

## 完整服务器列表

### 已归档服务器（移至 servers-archived）

以下服务器因维护状态已移至归档仓库：

| 服务器 | 原始功能 |
|--------|---------|
| AWS KB Retrieval | AWS 知识库检索 |
| Brave Search | Brave 搜索 API |
| EverArt | AI 图像生成 |
| GitHub | GitHub API 集成 |
| GitLab | GitLab API 集成 |
| Google Drive | Google Drive 文件操作 |
| Google Maps | 地图服务 |
| PostgreSQL | PostgreSQL 数据库 |
| Puppeteer | 浏览器自动化 |
| Redis | Redis 缓存 |
| Sentry | 错误监控 |
| Slack | Slack 消息 |
| SQLite | SQLite 数据库 |

---

## SDK 支持

MCP 官方提供多语言 SDK：

| 语言 | SDK 仓库 |
|------|---------|
| **TypeScript** | [github.com/modelcontextprotocol/typescript-sdk](https://github.com/modelcontextprotocol/typescript-sdk) |
| **Python** | [github.com/modelcontextprotocol/python-sdk](https://github.com/modelcontextprotocol/python-sdk) |
| **Go** | [github.com/modelcontextprotocol/go-sdk](https://github.com/modelcontextprotocol/go-sdk) |
| **Java** | [github.com/modelcontextprotocol/java-sdk](https://github.com/modelcontextprotocol/java-sdk) |
| **Kotlin** | [github.com/modelcontextprotocol/kotlin-sdk](https://github.com/modelcontextprotocol/kotlin-sdk) |
| **Rust** | [github.com/modelcontextprotocol/rust-sdk](https://github.com/modelcontextprotocol/rust-sdk) |
| **C#** | [github.com/modelcontextprotocol/csharp-sdk](https://github.com/modelcontextprotocol/csharp-sdk) |
| **Swift** | [github.com/modelcontextprotocol/swift-sdk](https://github.com/modelcontextprotocol/swift-sdk) |
| **PHP** | [github.com/modelcontextprotocol/php-sdk](https://github.com/modelcontextprotocol/php-sdk) |
| **Ruby** | [github.com/modelcontextprotocol/ruby-sdk](https://github.com/modelcontextprotocol/ruby-sdk) |

---

## 配置方法

### Claude Desktop 配置

编辑 `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS):

```json
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "/path/to/allowed/files"]
    },
    "git": {
      "command": "uvx",
      "args": ["mcp-server-git", "--repository", "/path/to/repo"]
    },
    "fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    }
  }
}
```

### VS Code 配置

在 Cursor 或 VS Code 的 MCP 配置中添加：

```json
{
  "mcpServers": {
    "alphavantage": {
      "command": "npx",
      "args": ["-y", "@alphavantage/alpha-vantage-mcp"],
      "env": {
        "ALPHAVANTAGE_API_KEY": "your_api_key"
      }
    }
  }
}
```

---

## 获取 API 密钥

### AlphaVantage

1. 访问 [alphavantage.co/support/#api-key](https://www.alphavantage.co/support/#api-key)
2. 免费注册获取 API Key
3. 免费版：5 次/分钟，500 次/天

### Alpaca

1. 访问 [alpaca.markets](https://alpaca.markets/)
2. 注册账户
3. 在 Dashboard → Paper Trading 获取 API Key
4. 支持模拟交易和真实交易

---

## 故障排除

### 服务器无法启动

```bash
# 检查 Node.js 版本
node --version  # 需要 v18+

# 清除 npm 缓存
npm cache clean --force

# 使用 npx 直接运行
npx -y @modelcontextprotocol/server-filesystem /path
```

### API 限制

| 服务 | 免费限额 | 付费方案 |
|------|---------|---------|
| AlphaVantage | 5次/分钟 | $50/月起 |
| Alpaca | 无限制(模拟) | 真实交易 |

### 权限问题

确保 MCP 服务器有足够的文件系统权限：

```bash
# 检查路径权限
ls -la /path/to/directory

# 设置适当的权限
chmod 755 /path/to/directory
```

---

## 相关资源

| 资源 | 链接 |
|------|------|
| **官方文档** | [modelcontextprotocol.io](https://modelcontextprotocol.io/) |
| **服务器注册表** | [registry.modelcontextprotocol.io](https://registry.modelcontextprotocol.io/) |
| **GitHub 仓库** | [github.com/modelcontextprotocol/servers](https://github.com/modelcontextprotocol/servers) |
| **Python SDK** | [github.com/modelcontextprotocol/python-sdk](https://github.com/modelcontextprotocol/python-sdk) |
| **TypeScript SDK** | [github.com/modelcontextprotocol/typescript-sdk](https://github.com/modelcontextprotocol/typescript-sdk) |

---

## 总结

**针对基金股票分析的推荐配置**:

1. **AlphaVantage** - 获取股票基本面数据和技术指标
2. **Alpaca** - 执行交易和获取实时行情
3. **Fetch** - 抓取财经新闻和研报
4. **Filesystem** - 读取本地投资分析报告

**使用场景**:
- 📈 个股技术分析 (RSI, MACD, 布林带)
- 📊 财务报表数据查询
- 💼 投资组合追踪
- 📰 结合新闻的 sentiment 分析
- 🔄 自动化交易策略

---

*注：金融市场数据仅供参考，不构成投资建议。投资有风险，入市需谨慎。*
