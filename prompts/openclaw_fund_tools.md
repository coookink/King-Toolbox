# OpenClaw 中国基金 MCP 工具

> 在 OpenClaw 中添加中国基金查询功能

---

## 方案：使用 Python 脚本 + AKShare

### 1. 安装依赖

```bash
# 在 OpenClaw 运行的机器上安装
pip install akshare
```

### 2. 创建基金查询脚本

创建文件 `~/.openclaw/tools/fund_query.py`:

```python
#!/usr/bin/env python3
"""
中国基金查询工具 for OpenClaw
使用 AKShare 获取基金数据
"""

import sys
import json
import akshare as ak

def get_fund_info(fund_code: str):
    """获取基金基本信息"""
    try:
        # 基金列表
        fund_list = ak.fund_open_fund_daily_em()
        fund = fund_list[fund_list["基金代码"] == fund_code]

        if fund.empty:
            return {"error": f"基金 {fund_code} 未找到"}

        return {
            "基金代码": fund_code,
            "基金名称": fund["基金简称"].values[0],
            "单位净值": fund["单位净值"].values[0],
            "日增长率": fund["日增长率"].values[0],
            "近1周": fund["近1周"].values[0] if "近1周" in fund.columns else "N/A",
            "近1月": fund["近1月"].values[0] if "近1月" in fund.columns else "N/A",
            "近3月": fund["近3月"].values[0] if "近3月" in fund.columns else "N/A",
            "近6月": fund["近6月"].values[0] if "近6月" in fund.columns else "N/A",
            "近1年": fund["近1年"].values[0] if "近1年" in fund.columns else "N/A",
        }
    except Exception as e:
        return {"error": str(e)}

def get_fund_nav_history(fund_code: str, days: int = 30):
    """获取基金净值历史"""
    try:
        df = ak.fund_open_fund_info_em(fund=fund_code, indicator="单位净值走势")
        df = df.tail(days)

        history = []
        for _, row in df.iterrows():
            history.append({
                "日期": row["净值日期"],
                "单位净值": row["单位净值"],
                "日增长率": row["日增长率"]
            })

        return {
            "基金代码": fund_code,
            "历史数据": history
        }
    except Exception as e:
        return {"error": str(e)}

def get_fund_estimate(fund_code: str = None):
    """获取基金实时估值"""
    try:
        df = ak.fund_value_estimate_em()

        if fund_code:
            fund = df[df["基金代码"] == fund_code]
            if fund.empty:
                return {"error": f"基金 {fund_code} 未找到估值"}

            return {
                "基金代码": fund_code,
                "基金名称": fund["基金名称"].values[0],
                "估算值": fund["估算值"].values[0],
                "估算增长率": fund["估算增长率"].values[0],
            }
        else:
            # 返回热门基金估值
            return df.head(20).to_dict(orient='records')
    except Exception as e:
        return {"error": str(e)}

def search_fund(keyword: str):
    """搜索基金"""
    try:
        fund_list = ak.fund_open_fund_daily_em()
        results = fund_list[fund_list["基金简称"].str.contains(keyword, na=False)]

        if results.empty:
            return {"message": f"未找到包含 '{keyword}' 的基金"}

        return results.head(10).to_dict(orient='records')
    except Exception as e:
        return {"error": str(e)}

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(json.dumps({"error": "请提供操作类型"}))
        sys.exit(1)

    action = sys.argv[1]

    if action == "info" and len(sys.argv) >= 3:
        result = get_fund_info(sys.argv[2])
    elif action == "history" and len(sys.argv) >= 3:
        days = int(sys.argv[3]) if len(sys.argv) >= 4 else 30
        result = get_fund_nav_history(sys.argv[2], days)
    elif action == "estimate" and len(sys.argv) >= 2:
        code = sys.argv[2] if len(sys.argv) >= 3 else None
        result = get_fund_estimate(code)
    elif action == "search" and len(sys.argv) >= 3:
        result = search_fund(sys.argv[2])
    else:
        result = {"error": "无效的参数"}

    print(json.dumps(result, ensure_ascii=False, indent=2))
```

### 3. 添加到 TOOLS.md

编辑 `~/.openclaw/workspace/TOOLS.md`，添加：

```markdown
## 中国基金查询工具

### fund_info

获取基金基本信息和净值

**Schema:**
```json
{
  "fund_code": "基金代码，如 110022"
}
```

**用法:**
```bash
python3 ~/.openclaw/tools/fund_query.py info "{{fund_code}}"
```

### fund_history

获取基金净值历史走势

**Schema:**
```json
{
  "fund_code": "基金代码",
  "days": "历史天数，默认30"
}
```

**用法:**
```bash
python3 ~/.openclaw/tools/fund_query.py history "{{fund_code}}" "{{days}}"
```

### fund_estimate

获取基金实时估值

**Schema:**
```json
{
  "fund_code": "基金代码（可选，不传返回热门基金）"
}
```

**用法:**
```bash
python3 ~/.openclaw/tools/fund_query.py estimate "{{fund_code}}"
```

### fund_search

搜索基金

**Schema:**
```json
{
  "keyword": "基金名称关键词"
}
```

**用法:**
```bash
python3 ~/.openclaw/tools/fund_query.py search "{{keyword}}"
```
```

### 4. 添加到 AGENTS.md

在 `~/.openclaw/workspace/AGENTS.md` 中添加：

```markdown
## 基金查询能力

你可以帮助用户查询中国基金信息：

1. **查询基金净值**: 使用 fund_info 工具获取最新净值和涨跌幅
2. **查看历史走势**: 使用 fund_history 工具分析近期表现
3. **实时估值**: 使用 fund_estimate 工具获取当日估算净值
4. **搜索基金**: 使用 fund_search 工具查找基金代码

支持的基金类型：开放式基金、货币基金、ETF等

数据来源：东方财富/天天基金网
```

### 5. 测试脚本

```bash
# 测试查询基金信息
python3 ~/.openclaw/tools/fund_query.py info 110022

# 测试查询历史净值
python3 ~/.openclaw/tools/fund_query.py history 110022 10

# 测试实时估值
python3 ~/.openclaw/tools/fund_query.py estimate 110022

# 测试搜索
python3 ~/.openclaw/tools/fund_query.py search 易方达
```

---

## 使用示例

配置完成后，你可以在 WhatsApp/Telegram 中向 OpenClaw 发送：

```
查一下我的基金 110022
```

OpenClaw 会返回：
```
基金代码: 110022
基金名称: 易方达消费行业股票
单位净值: 3.4567
日增长率: -1.23%
近1周: 2.34%
近1月: 5.67%
...
```

---

## 注意事项

1. **数据延迟**：基金净值数据通常 T+1 更新，交易日 20:00 后查看最新数据
2. **估值差异**：实时估值仅供参考，实际净值以基金公司公布为准
3. **网络要求**：需要能访问东方财富网站
4. **依赖更新**：定期运行 `pip install -U akshare` 保持数据接口最新

---

## 进阶：配置定时任务

在 `HEARTBEAT.md` 中添加基金监控：

```markdown
## 基金监控

检查我的基金持仓（110022, 005827, 000001）：

1. 查询这三只基金的最新净值和涨跌幅
2. 如果某只基金日跌幅超过 3%，提醒我
3. 记录到 `~/fund_tracking.md`
```

设置心跳频率：

```json
{
  "agent": {
    "heartbeat": { "every": "60m" }
  }
}
```

这样 OpenClaw 会每小时检查一次基金情况。
