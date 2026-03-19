# Obsidian + OSS Skill for OpenClaw

💎 **Obsidian 笔记库管理 + Alibaba Cloud OSS 同步**

此 Skill 用于 OpenClaw，支持与 Obsidian 笔记库交互并通过 Alibaba Cloud OSS 进行远程同步，与 Remotely Save 插件兼容。

## 目录结构

```
obsidian-oss/
├── SKILL.md              # OpenClaw Skill 主文件
├── skill.json            # Skill 元数据配置
├── MCP_CONFIG.md         # MCP 工具配置参考
├── obsidian-oss-sync.sh  # 同步脚本
└── README.md             # 本文件
```

## 配置信息

| 配置项 | 值 |
|--------|-----|
| **Bucket** | `obsidian-cooolink-sync` |
| **Region** | `cn-heyuan` (华南2-河源) |
| **Endpoint** | `https://oss-cn-heyuan.aliyuncs.com` |
| **Vault 路径** | `~/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink` |

## 安装到 OpenClaw

### 方法 1: 直接复制 (已完成)

```bash
# 已自动完成
# cp -r skills/obsidian-oss modules/openclaw/skills/
```

### 方法 2: 使用 OpenClaw CLI

```bash
# 安装 skill
openclaw skills install obsidian-oss

# 或从本地路径
openclaw skills install --local ./skills/obsidian-oss
```

## 使用方法

### 1. 本地 Vault 操作

```bash
# 搜索笔记
obsidian-cli search "关键词"

# 创建笔记
obsidian-cli create "Folder/New Note" --content "# 标题" --open

# 移动/重命名
obsidian-cli move "old/path" "new/path"
```

### 2. OSS 同步操作

```bash
# 使用同步脚本
./obsidian-oss-sync.sh backup      # 备份 Vault
./obsidian-oss-sync.sh sync-up     # 上传到 OSS
./obsidian-oss-sync.sh sync-down   # 从 OSS 下载
./obsidian-oss-sync.sh stats       # 显示统计信息
```

### 3. MCP 工具集成

```typescript
// 列出 OSS 文件
{
  tool: "mcp__alibaba-cloud-ops__OSS_ListObjects",
  params: {
    BucketName: "obsidian-cooolink-sync",
    RegionId: "cn-heyuan"
  }
}

// 远程执行同步
{
  tool: "mcp__alibaba-cloud-ops__OOS_RunCommand",
  params: {
    InstanceIds: ["i-f8zfel20zluhs73q1s15"],
    RegionId: "cn-heyuan",
    Command: "ossutil cp -r oss://obsidian-cooolink-sync/ /root/obsidian-backup/"
  }
}
```

## Remotely Save 配置

此 Skill 与 Remotely Save 插件使用相同的 OSS 配置：

| 参数 | 值 |
|------|-----|
| 服务提供商 | S3 (兼容) |
| Endpoint | `https://oss-cn-heyuan.aliyuncs.com` |
| Region | `cn-heyuan` |
| Bucket | `obsidian-cooolink-sync` |

## 依赖安装

```bash
# obsidian-cli (必需)
brew install yakitrak/yakitrak/obsidian-cli

# ossutil (推荐)
curl -o /usr/local/bin/ossutil https://gosspublic.alicdn.com/ossutil/1.7.19/ossutilmac64
chmod +x /usr/local/bin/ossutil

# AWS CLI (可选)
brew install awscli
```

## 故障排除

### 证书错误 (ERR_CERT_COMMON_NAME_INVALID)

- ❌ 错误: `https://bucket.oss-cn-heyuan.aliyuncs.com`
- ✅ 正确: `https://oss-cn-heyuan.aliyuncs.com`

### 权限错误

确保 RAM 用户有 OSS 操作权限：
- `oss:GetObject`
- `oss:PutObject`
- `oss:DeleteObject`
- `oss:ListObjects`

## 参考

- [Remotely Save](https://github.com/remotely-save/remotely-save)
- [Alibaba Cloud OSS](https://www.alibabacloud.com/help/en/oss/)
- [obsidian-cli](https://github.com/Yakitrak/obsidian-cli)
