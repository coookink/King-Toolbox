# Claude MCP 阿里云服务器连接配置指南

## 配置概览

通过 `mcp__alibaba-cloud-ops` MCP 服务器，Claude 可以直接管理你的阿里云 ECS 实例，无需 SSH。

---

## 第一步：配置 Claude 设置文件

编辑 `~/.claude/settings.json` 添加 MCP 权限：

```json
{
  "permissions": {
    "allow": [
      "mcp__pencil",
      "mcp__alibaba-cloud-ops"
    ]
  }
}
```

---

## 第二步：服务器信息

| 配置项 | 值 |
|--------|-----|
| **实例 ID** | `i-f8zfel20zluhs73q1s15` |
| **地域** | `cn-heyuan` |
| **公网 IP** | `8.155.2.124` |
| **OpenClaw 端口** | `18789` |
| **资源组 ID** | `rg-acfm2a74wewsaby` |

---

## 第三步：验证连接

配置完成后，让 Claude 执行以下命令测试连接：

```
请检查我的服务器状态，实例 ID: i-f8zfel20zluhs73q1s15，地域: cn-heyuan
```

Claude 会执行：
```javascript
mcp__alibaba-cloud-ops__OOS_RunCommand({
  "Command": "systemctl status openclaw",
  "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
  "RegionId": "cn-heyuan"
})
```

---

## 第四步：常用操作命令

### 查看 OpenClaw 状态
```javascript
mcp__alibaba-cloud-ops__OOS_RunCommand({
  "Command": "systemctl status openclaw",
  "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
  "RegionId": "cn-heyuan"
})
```

### 重启 OpenClaw 服务
```javascript
mcp__alibaba-cloud-ops__OOS_RunCommand({
  "Command": "systemctl restart openclaw",
  "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
  "RegionId": "cn-heyuan"
})
```

### 查看端口监听
```javascript
mcp__alibaba-cloud-ops__OOS_RunCommand({
  "Command": "ss -tlnp | grep 18789",
  "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
  "RegionId": "cn-heyuan"
})
```

### 查看实时日志
```javascript
mcp__alibaba-cloud-ops__OOS_RunCommand({
  "Command": "journalctl -u openclaw -n 50",
  "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
  "RegionId": "cn-heyuan"
})
```

---

## 工作原理

```
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│   Claude Code   │────▶│ 阿里云 MCP 服务  │────▶│  云助手 (OOS)   │
│   (本地运行)    │     │ (已内置在 Claude) │     │                 │
└─────────────────┘     └──────────────────┘     └────────┬────────┘
                                                          │
                                                          ▼
                                               ┌─────────────────┐
                                               │   ECS 实例      │
                                               │ 8.155.2.124     │
                                               │ (运行命令)      │
                                               └─────────────────┘
```

---

## 注意事项

1. **权限要求**：阿里云账号需要有 ECS 和 OOS 的操作权限
2. **实例状态**：ECS 实例必须处于 **Running** 状态
3. **云助手**：实例需要已安装阿里云云助手 Agent（默认已安装）
4. **网络**：无需开放 SSH 端口，通过阿里云内部通道通信

---

## 故障排查

| 问题 | 解决方法 |
|------|---------|
| MCP 工具未找到 | 检查 `settings.json` 权限配置是否正确 |
| 命令执行超时 | 检查实例是否 Running，云助手是否正常 |
| 权限拒绝 | 确认阿里云账号有 OOS 和 ECS 权限 |
| 命令无输出 | 检查命令语法，建议先测试简单命令如 `echo test` |
