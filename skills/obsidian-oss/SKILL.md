---
name: obsidian-oss
description: |
  Work with Obsidian vaults and sync with Alibaba Cloud OSS.
  Supports S3-compatible storage integration for cross-device synchronization
  using the Remotely Save plugin.
homepage: https://help.obsidian.md
metadata:
  {
    "openclaw":
      {
        "emoji": "💎",
        "requires": { "bins": ["obsidian-cli"] },
        "optional": { "bins": ["ossutil", "aws"] },
        "install":
          [
            {
              "id": "brew-obsidian-cli",
              "kind": "brew",
              "formula": "yakitrak/yakitrak/obsidian-cli",
              "bins": ["obsidian-cli"],
              "label": "Install obsidian-cli",
            },
          ],
      },
  }
---

# Obsidian + OSS 同步 Skill

本 Skill 用于管理 Obsidian 笔记库，并集成 Alibaba Cloud OSS 进行远程同步，与 Remotely Save 插件兼容。

## 配置概览

| 配置项 | 值 |
|--------|-----|
| **Bucket 名称** | `obsidian-cooolink-sync` |
| **Region** | `cn-heyuan` (华南2-河源) |
| **Endpoint** | `https://oss-cn-heyuan.aliyuncs.com` |
| **Vault 路径** | `/Users/a/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink` |

## 本地 Vault 操作

### 获取当前 Vault 路径

```bash
# 查看默认 vault
obsidian-cli print-default --path-only

# 或读取 Obsidian 配置
jq -r '.vaults[] | select(.open == true) | .path' ~/Library/Application\ Support/obsidian/obsidian.json
```

### 搜索笔记

```bash
# 按文件名搜索
obsidian-cli search "关键词"

# 按内容搜索
obsidian-cli search-content "关键词"
```

### 创建笔记

```bash
# 创建新笔记
obsidian-cli create "Folder/New Note" --content "# 标题\n\n内容" --open

# 直接写入文件（推荐，更快）
echo "# 标题\n\n内容" > "${VAULT_PATH}/Folder/New Note.md"
```

## OSS 同步操作

### 使用 ossutil 同步

```bash
# 安装 ossutil (如果未安装)
wget https://gosspublic.alicdn.com/ossutil/1.7.19/ossutilmac64 -O /usr/local/bin/ossutil
chmod +x /usr/local/bin/ossutil

# 配置认证
export OSS_ACCESS_KEY_ID="your-access-key-id"
export OSS_ACCESS_KEY_SECRET="your-access-key-secret"
export OSS_ENDPOINT="oss-cn-heyuan.aliyuncs.com"
export OSS_BUCKET="obsidian-cooolink-sync"

# 上传 vault 到 OSS
ossutil cp -r -u "${VAULT_PATH}/" "oss://${OSS_BUCKET}/"

# 从 OSS 下载到本地
ossutil cp -r -u "oss://${OSS_BUCKET}/" "${VAULT_PATH}/"

# 同步特定文件夹
ossutil cp -r -u "${VAULT_PATH}/Notes/" "oss://${OSS_BUCKET}/Notes/"
```

### 使用 AWS CLI (S3 兼容模式)

```bash
# 配置 AWS CLI for Alibaba Cloud OSS
aws configure set aws_access_key_id "your-access-key-id"
aws configure set aws_secret_access_key "your-access-key-secret"
aws configure set default.region "cn-heyuan"

# 同步到 OSS
aws s3 sync "${VAULT_PATH}/" "s3://obsidian-cooolink-sync/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com"

# 从 OSS 同步到本地
aws s3 sync "s3://obsidian-cooolink-sync/" "${VAULT_PATH}/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com"
```

## 与 Remotely Save 兼容的配置

Remotely Save 使用以下 S3 参数：

| 参数 | 值 |
|------|-----|
| **服务提供商** | S3 (兼容) |
| **Endpoint** | `https://oss-cn-heyuan.aliyuncs.com` |
| **Region** | `cn-heyuan` |
| **Bucket** | `obsidian-cooolink-sync` |
| **Access Key ID** | (从环境变量或阿里云控制台获取) |
| **Secret Access Key** | (从环境变量或阿里云控制台获取) |

### 路径结构

```
obsidian-cooolink-sync/
├── .obsidian/
│   └── plugins/
│       └── remotely-save/
│           └── data.json          # Remotely Save 配置
├── Notes/                          # 笔记目录
├── Attachments/                    # 附件目录
└── ...
```

## MCP 工具集成

### 列出 OSS Bucket 内容

```typescript
// 使用 MCP Alibaba Cloud 工具
{
  "tool": "OSS_ListObjects",
  "params": {
    "BucketName": "obsidian-cooolink-sync",
    "RegionId": "cn-heyuan"
  }
}
```

### 执行远程命令

```typescript
// 在服务器上执行 OSS 同步
{
  "tool": "OOS_RunCommand",
  "params": {
    "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
    "RegionId": "cn-heyuan",
    "Command": "ossutil cp -r oss://obsidian-cooolink-sync/ /root/obsidian-backup/"
  }
}
```

## 常用工作流

### 1. 备份 Vault 到 OSS

```bash
#!/bin/bash
VAULT_PATH=$(obsidian-cli print-default --path-only)
BACKUP_NAME="obsidian-backup-$(date +%Y%m%d-%H%M%S)"

# 创建本地压缩备份
tar -czf "/tmp/${BACKUP_NAME}.tar.gz" -C "${VAULT_PATH}" .

# 上传到 OSS
ossutil cp "/tmp/${BACKUP_NAME}.tar.gz" "oss://obsidian-cooolink-sync/backups/"

# 清理临时文件
rm "/tmp/${BACKUP_NAME}.tar.gz"
```

### 2. 从 OSS 恢复 Vault

```bash
#!/bin/bash
VAULT_PATH=$(obsidian-cli print-default --path-only)
RESTORE_FILE="obsidian-backup-20240316-120000.tar.gz"

# 从 OSS 下载
ossutil cp "oss://obsidian-cooolink-sync/backups/${RESTORE_FILE}" /tmp/

# 解压到 vault
tar -xzf "/tmp/${RESTORE_FILE}" -C "${VAULT_PATH}"

# 清理
rm "/tmp/${RESTORE_FILE}"
```

### 3. 双向同步

```bash
#!/bin/bash
# 先下载远程更改
aws s3 sync "s3://obsidian-cooolink-sync/" "${VAULT_PATH}/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com" \
  --delete

# 再上传本地更改
aws s3 sync "${VAULT_PATH}/" "s3://obsidian-cooolink-sync/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com" \
  --delete
```

## 安全注意事项

1. **Access Key**: 不要将 Access Key 硬编码在脚本中，使用环境变量或 1Password 等密码管理器
2. **Token 保护**: Remotely Save 配置文件包含加密凭证，不要分享或截图
3. **HTTPS**: 始终使用 HTTPS 端点进行同步
4. **定期备份**: 建议定期创建 Vault 快照到 OSS 的 backups/ 目录

## 故障排除

### 同步冲突

如果 Remotely Save 报告冲突：

1. 检查 OSS 上的文件版本时间戳
2. 手动合并冲突文件
3. 重新触发同步

### 权限错误

```bash
# 验证 Access Key 权限
ossutil ls oss://obsidian-cooolink-sync/

# 检查 Bucket 策略
# 确保 Access Key 有 ListObjects, GetObject, PutObject 权限
```

### 网络问题

如果连接 OSS 失败：

1. 检查 Endpoint 是否正确: `oss-cn-heyuan.aliyuncs.com`
2. 确保没有代理/VPN 干扰
3. 测试连通性: `curl -I https://oss-cn-heyuan.aliyuncs.com`

## 参考链接

- [Remotely Save 文档](https://github.com/remotely-save/remotely-save)
- [Alibaba Cloud OSS 文档](https://www.alibabacloud.com/help/en/oss/)
- [Obsidian 官方文档](https://help.obsidian.md)
- [obsidian-cli GitHub](https://github.com/Yakitrak/obsidian-cli)
