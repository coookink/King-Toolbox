# OpenClaw 理财管理 Agent 完整配置指南

> 飞书机器人 + 全方位金融工具 + 自动化监控

---

## 核心 MCP 服务器配置

### 1. 金融数据类

| MCP 服务器 | 功能 | 适用场景 | 配置 |
|-----------|------|---------|------|
| **AKShare 基金** | 中国基金净值、估值、持仓 | 国内基金跟踪 | Python 脚本方式 |
| **AlphaVantage** | 全球股票、外汇、加密货币 | 中概股、美股、港股 | 官方 MCP |
| **Fetch** | 网页抓取、财经新闻 | 研报、公告获取 | 官方 MCP |
| **Sequential Thinking** | 复杂财务分析推理 | 投资组合分析、风险评估 | 官方 MCP |
| **Time** | 时区转换、交易日计算 | 全球市场交易时间 | 官方 MCP |

### Sequential Thinking 详细配置

**功能说明**：Sequential Thinking 是一个用于动态和反思性问题解决的 MCP 服务器。它提供一个结构化的思考过程工具，特别适合复杂的财务分析和投资决策。

**安装**：
```bash
# 通过 npm 安装
npm install -g @modelcontextprotocol/server-sequential-thinking

# 或使用 npx
npx -y @modelcontextprotocol/server-sequential-thinking
```

**OpenClaw 配置**（添加到 `~/.openclaw/openclaw.json`）：
```json5
{
  mcpServers: {
    "sequential-thinking": {
      command: "npx",
      args: ["-y", "@modelcontextprotocol/server-sequential-thinking"]
    }
  }
}
```

**在 TOOLS.md 中使用**：
```markdown
### sequential_thinking
进行结构化思考分析
```bash
# 此工具由 MCP 服务器提供，无需手动命令
# 在 AGENTS.md 中通过自然语言调用
```
```

**使用场景示例**：

在 AGENTS.md 中这样配置：
```markdown
### 复杂分析时使用 Sequential Thinking

当用户需要进行以下分析时，使用 sequential_thinking 工具：

1. **投资组合风险评估**
   - 分析各类资产相关性
   - 评估组合波动性和最大回撤
   - 考虑不同市场情景的影响

2. **投资决策分析**
   - 买入/卖出决策的利弊权衡
   - 多个投资标的的对比选择
   - 市场时机判断

3. **资产配置优化**
   - 当前配置与目标配置的差距分析
   - 再平衡策略制定
   - 税务和费用影响评估

4. **异常情况诊断**
   - 基金异常波动的深层原因
   - 连续亏损的原因分析
   - 市场环境变化的影响
```

**实际对话示例**：

用户问："我应该在现在卖出白酒基金吗？"

Agent 会调用 sequential_thinking 进行：
1. **思考步骤 1**：分析白酒基金近期表现和历史数据
2. **思考步骤 2**：考虑宏观经济因素（消费复苏、政策影响）
3. **思考步骤 3**：评估技术面指标（支撑位、阻力位）
4. **思考步骤 4**：对比个人持仓成本与当前净值
5. **思考步骤 5**：权衡卖出 vs 持有的利弊
6. **思考步骤 6**：给出具体建议和风险提示

**与其他工具的配合**：
```markdown
分析流程：
1. 使用 fund_info 获取基金数据
2. 使用 fund_history 获取历史走势
3. 使用 sequential_thinking 进行深度分析
4. 使用 save_report 保存分析结论
```

### 2. 数据存储类

| MCP 服务器 | 功能 | 理财场景 |
|-----------|------|---------|
| **SQLite** | 本地数据库 | 交易记录、资产历史 |
| **PostgreSQL** | 关系型数据库 | 多用户资产管理 |
| **Memory** | 知识图谱记忆 | 投资偏好、风险承受能力 |

### 3. 通知/自动化类

| MCP 服务器 | 功能 | 配置 |
|-----------|------|------|
| **飞书** (OpenClaw 插件) | 消息推送、群通知 | 已内置 |
| **Slack** | 备用通知渠道 | 可选 |

---

## 推荐 Skill 配置

### 核心 Skills

```markdown
# ~/.openclaw/workspace/SKILL.md

## 理财管理专家

你是一个专业的理财管理助手，帮助用户：

### 资产配置监控
- 跟踪股票、基金、债券、现金等资产
- 计算资产配置比例
- 提醒再平衡时机

### 投资分析
- 分析基金业绩和排名
- 计算收益率、夏普比率、最大回撤
- 对比同类基金表现

### 风险管理
- 监控单日涨跌幅度
- 提醒止损止盈点
- 评估组合风险敞口

### 市场情报
- 抓取财经新闻和研报
- 监控持仓相关公告
- 跟踪宏观数据

### 定期报告
- 每周资产总结
- 月度收益分析
- 年度投资回顾
```

---

## 完整 TOOLS.md 配置

```markdown
# ~/.openclaw/workspace/TOOLS.md

## 中国基金查询 (AKShare)

### fund_info
获取基金基本信息
```bash
python3 ~/.openclaw/tools/fund_query.py info "{{fund_code}}"
```

### fund_estimate
获取基金实时估值
```bash
python3 ~/.openclaw/tools/fund_query.py estimate "{{fund_code}}"
```

### fund_history
获取历史净值
```bash
python3 ~/.openclaw/tools/fund_query.py history "{{fund_code}}" "{{days}}"
```

## 全球股票查询 (AlphaVantage)

### stock_price
获取股票价格
```bash
curl -s "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol={{symbol}}&apikey={{AV_API_KEY}}" | jq '.["Global Quote"]'
```

### stock_daily
获取日K线数据
```bash
curl -s "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={{symbol}}&apikey={{AV_API_KEY}}" | jq '.["Time Series (Daily)"] | to_entries[0:5]'
```

### stock_indicator
获取技术指标 (RSI, MACD)
```bash
curl -s "https://www.alphavantage.co/query?function=RSI&symbol={{symbol}}&interval=daily&time_period=14&series_type=close&apikey={{AV_API_KEY}}"
```

## 外汇/加密货币

### fx_rate
获取汇率
```bash
curl -s "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency={{from}}&to_currency={{to}}&apikey={{AV_API_KEY}}"
```

### crypto_price
获取加密货币价格
```bash
curl -s "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey={{AV_API_KEY}}"
```

## 数据存储

### save_transaction
保存交易记录到 SQLite
```bash
sqlite3 ~/.openclaw/data/portfolio.db "INSERT INTO transactions (date, code, name, type, amount, price, fee) VALUES ('{{date}}', '{{code}}', '{{name}}', '{{type}}', {{amount}}, {{price}}, {{fee}});"
```

### query_portfolio
查询持仓
```bash
sqlite3 ~/.openclaw/data/portfolio.db "SELECT code, name, SUM(CASE WHEN type='buy' THEN amount ELSE -amount END) as holding, AVG(price) as avg_price FROM transactions GROUP BY code;"
```

### save_daily_nav
保存每日净值
```bash
sqlite3 ~/.openclaw/data/portfolio.db "INSERT OR REPLACE INTO nav_history (date, code, nav, estimate) VALUES (date('now'), '{{code}}', {{nav}}, {{estimate}});"
```

## 财经新闻

### fetch_news
抓取财经新闻
```bash
curl -s "https://finance.sina.com.cn/stock/" | grep -oP '(?<=title\>).+?(?=</title>)' | head -5
```

### fund_announcement
获取基金公告
```bash
python3 ~/.openclaw/tools/fund_announcement.py "{{fund_code}}"
```

## 文件操作

### save_report
保存分析报告
```bash
echo "{{content}}" >> ~/.openclaw/reports/investment_report_$(date +%Y%m%d).md
```

### read_portfolio_config
读取资产配置
```bash
cat ~/.openclaw/config/portfolio.json
```
```

---

## AGENTS.md 配置

```markdown
# ~/.openclaw/workspace/AGENTS.md

## 角色
你是用户的私人理财顾问，专注于资产管理、投资分析和风险控制。

## 能力

### 1. 资产监控
- 实时查询基金净值和估值
- 跟踪股票价格变动
- 监控汇率和加密货币

### 2. 投资分析
- 计算收益率和排名
- 技术分析 (RSI, MACD, 均线)
- 基本面数据查询

### 3. 数据管理
- 记录每笔交易到数据库
- 保存历史净值数据
- 生成定期报告

### 4. 情报收集
- 抓取财经新闻
- 监控持仓公告
- 跟踪市场动态

### 5. 风险管理
- 监控涨跌幅预警
- 提醒再平衡
- 评估组合风险

## 工作流程

### 每日收盘后
1. 查询所有持仓基金净值
2. 保存到数据库
3. 计算当日收益
4. 检查是否触发预警
5. 发送飞书通知

### 每周总结
1. 生成本周收益报告
2. 分析涨跌幅排名
3. 对比同类基金表现
4. 提出调仓建议

### 每月回顾
1. 计算月度收益率
2. 分析资产配置比例
3. 检查是否需要再平衡
4. 生成投资月报

## 交互规则

1. **主动汇报**: 发现异常波动时主动通知
2. **数据可视化**: 用表格展示对比数据
3. **建议明确**: 给出具体的操作建议
4. **风险提示**: 重要决策前提示风险

## 飞书通知格式

```
📊 理财日报 - 2024-01-15

💰 今日收益: +1,234.56 (+0.85%)

📈 涨幅前三:
1. 易方达消费 110022: +2.34%
2. 招商白酒 012414: +1.87%
3. 华夏上证 510050: +1.23%

📉 跌幅前三:
1. 纳斯达克 040046: -1.56%
2. 中概互联 006327: -0.98%

⚠️ 预警:
- 白酒基金连续3日上涨，注意回调风险

💡 建议:
- 债券基金占比低于目标，可考虑加仓
```

## 初始化检查清单

首次启动时检查:
- [ ] SQLite 数据库和表已创建
- [ ] 配置文件 portfolio.json 存在
- [ ] API 密钥配置正确
- [ ] 飞书机器人连接正常
- [ ] 持仓数据已导入
```

---

## 数据库初始化脚本

创建文件 `~/.openclaw/tools/init_db.py`:

```python
#!/usr/bin/env python3
import sqlite3
import os

# 确保目录存在
os.makedirs(os.path.expanduser('~/.openclaw/data'), exist_ok=True)

conn = sqlite3.connect(os.path.expanduser('~/.openclaw/data/portfolio.db'))
cursor = conn.cursor()

# 交易记录表
cursor.execute('''
CREATE TABLE IF NOT EXISTS transactions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    code TEXT NOT NULL,
    name TEXT,
    type TEXT CHECK(type IN ('buy', 'sell')),
    amount REAL,
    price REAL,
    fee REAL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
''')

# 净值历史表
cursor.execute('''
CREATE TABLE IF NOT EXISTS nav_history (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    code TEXT NOT NULL,
    nav REAL,
    estimate REAL,
    UNIQUE(date, code)
)
''')

# 资产配置表
cursor.execute('''
CREATE TABLE IF NOT EXISTS asset_allocation (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    category TEXT NOT NULL,
    target_ratio REAL,
    actual_ratio REAL,
    amount REAL
)
''')

# 预警记录表
cursor.execute('''
CREATE TABLE IF NOT EXISTS alerts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    code TEXT,
    alert_type TEXT,
    message TEXT,
    is_read BOOLEAN DEFAULT 0
)
''')

conn.commit()
conn.close()
print("数据库初始化完成")
```

运行初始化:
```bash
python3 ~/.openclaw/tools/init_db.py
```

---

## 配置文件示例

`~/.openclaw/config/portfolio.json`:

```json
{
  "profile": {
    "risk_level": "balanced",
    "investment_horizon": "long_term"
  },
  "allocation": {
    "stock_fund": 0.50,
    "bond_fund": 0.30,
    "money_fund": 0.15,
    "crypto": 0.05
  },
  "holdings": [
    {"code": "110022", "name": "易方达消费行业股票", "type": "stock_fund"},
    {"code": "005827", "name": "易方达蓝筹精选", "type": "stock_fund"},
    {"code": "000171", "name": "易方达裕丰回报", "type": "bond_fund"},
    {"code": "003474", "name": "南方天天利货币A", "type": "money_fund"}
  ],
  "alerts": {
    "daily_change_threshold": 0.03,
    "weekly_change_threshold": 0.05,
    "rebalance_threshold": 0.10
  },
  "apis": {
    "alphavantage": "YOUR_AV_API_KEY",
    "feishu_webhook": "YOUR_FEISHU_WEBHOOK_URL"
  }
}
```

---

## 心跳任务配置

`~/.openclaw/workspace/HEARTBEAT.md`:

```markdown
## 每日收盘检查 (交易日 15:00-16:00)

如果当前时间是交易日 15:00-16:00 之间:

1. 读取 portfolio.json 中的持仓列表
2. 对每个基金:
   - 使用 fund_info 查询最新净值
   - 保存到 nav_history 表
3. 计算今日总收益
4. 检查是否有基金涨跌超过阈值
5. 生成飞书通知消息
6. 如果有预警，发送特别提醒

## 每周五收盘后

1. 计算本周收益率
2. 对比同类基金排名
3. 检查资产配置是否需要再平衡
4. 生成周报发送到飞书

## 每月最后一个交易日

1. 生成本月投资报告
2. 计算各类资产占比
3. 分析收益归因
4. 发送月度总结
```

---

## OpenClaw 配置

`~/.openclaw/openclaw.json`:

```json5
{
  logging: { level: "info" },
  agent: {
    model: "anthropic/claude-opus-4-5",
    workspace: "~/.openclaw/workspace",
    thinkingDefault: "high",
    timeoutSeconds: 1800,
    heartbeat: { every: "30m" },  // 每30分钟检查一次
  },
  channels: {
    feishu: {
      // 飞书机器人配置
      appId: "cli_xxx",
      appSecret: "xxx",
      encryptKey: "xxx",
      verificationToken: "xxx",
      allowFrom: ["user_open_id_xxx"],  // 你的飞书用户ID
    }
  },
  session: {
    scope: "per-sender",
    resetTriggers: ["/new", "/reset"],
  }
}
```

---

## 使用示例

配置完成后，你可以在飞书中这样使用：

```
查一下我的基金收益
```
→ Agent 查询所有持仓，计算收益，发送飞书消息

```
今天有什么财经新闻？
```
→ Agent 抓取新闻摘要发送

```
分析一下 110022 这只基金
```
→ Agent 查询净值历史、技术指标，生成分析报告

```
记录一笔交易：买入 110022 1000元
```
→ Agent 保存到数据库，更新持仓

```
本周投资总结
```
→ Agent 生成周报发送到飞书

---

## 扩展建议

### 进阶 MCP 服务器

1. **GitHub MCP** - 备份投资数据到仓库
2. **Google Drive MCP** - 存储报告文件
3. **Slack MCP** - 备用通知渠道
4. **Telegram MCP** - 移动端接收通知

### AI 分析增强

1. **Claude Code Analysis** - 深度财报分析
2. **Sentiment Analysis** - 新闻情绪分析
3. **Pattern Recognition** - 价格模式识别

### 自动化集成

1. **定时任务** - 每日/周/月自动报告
2. **价格预警** - 触及目标价通知
3. **定投提醒** - 定期投资建议

---

*配置完成后，你的 OpenClaw 将成为 7×24 小时的理财管家！*
