# MCP 工具配置 - Obsidian OSS Sync
#
# 此文件展示如何在 OpenClaw 中使用 Alibaba Cloud MCP 工具
# 与 OSS Bucket 交互来管理 Obsidian Vault 同步

## 配置参数

```json
{
  "vault": {
    "name": "cooolink",
    "path": "/Users/a/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink"
  },
  "oss": {
    "bucket": "obsidian-cooolink-sync",
    "region": "cn-heyuan",
    "endpoint": "https://oss-cn-heyuan.aliyuncs.com"
  }
}
```

## MCP 工具使用示例

### 1. 列出 OSS Bucket 中的文件

```json
{
  "tool": "mcp__alibaba-cloud-ops__OSS_ListObjects",
  "params": {
    "BucketName": "obsidian-cooolink-sync",
    "RegionId": "cn-heyuan",
    "Prefix": ""
  }
}
```

### 2. 在服务器上执行 OSS 同步命令

```json
{
  "tool": "mcp__alibaba-cloud-ops__OOS_RunCommand",
  "params": {
    "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
    "RegionId": "cn-heyuan",
    "Command": "#!/bin/bash\n# 安装 ossutil\nif [ ! -f /usr/local/bin/ossutil ]; then\n  curl -o /usr/local/bin/ossutil https://gosspublic.alicdn.com/ossutil/1.7.19/ossutil64\n  chmod +x /usr/local/bin/ossutil\nfi\n\n# 配置并同步\nexport OSS_ENDPOINT=oss-cn-heyuan.aliyuncs.com\nossutil cp -r oss://obsidian-cooolink-sync/ /root/obsidian-backup/",
    "CommandType": "RunShellScript"
  }
}
```

### 3. 查询 ECS 实例状态

```json
{
  "tool": "mcp__alibaba-cloud-ops__ECS_DescribeInstances",
  "params": {
    "RegionId": "cn-heyuan",
    "InstanceIds": ["i-f8zfel20zluhs73q1s15"]
  }
}
```

### 4. 监控服务器资源（用于同步时检查）

```json
{
  "tool": "mcp__alibaba-cloud-ops__CMS_GetDiskUsageData",
  "params": {
    "InstanceIds": ["i-f8zfel20zluhs73q1s15"],
    "RegionId": "cn-heyuan"
  }
}
```

## Remotely Save 配置参考

Remotely Save 插件配置（data.json）包含以下 S3 参数：

| 参数 | 值 | 说明 |
|------|-----|------|
| endpoint | `https://oss-cn-heyuan.aliyuncs.com` | OSS Endpoint |
| region | `cn-heyuan` | 地域 |
| bucket | `obsidian-cooolink-sync` | Bucket 名称 |
| accessKeyID | (加密) | Access Key ID |
| secretAccessKey | (加密) | Secret Access Key |
| serviceProvider | `s3` | 使用 S3 兼容模式 |

**注意**: 实际配置文件中这些值是加密的，存储在 `data.json` 的 `d` 字段中。

## 本地同步脚本

### 使用 ossutil 手动同步

```bash
#!/bin/bash

# 配置
VAULT_PATH="/Users/a/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink"
OSS_BUCKET="obsidian-cooolink-sync"

# 上传到 OSS (增量同步)
ossutil cp -r -u "$VAULT_PATH/" "oss://${OSS_BUCKET}/"

# 从 OSS 下载 (增量同步)
ossutil cp -r -u "oss://${OSS_BUCKET}/" "$VAULT_PATH/"
```

### 使用 AWS CLI 同步

```bash
#!/bin/bash

VAULT_PATH="/Users/a/Library/Mobile Documents/iCloud~md~obsidian/Documents/cooolink/cooolink"

# 双向同步 (先下载后上传)
aws s3 sync "s3://obsidian-cooolink-sync/" "$VAULT_PATH/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com" \
  --delete

aws s3 sync "$VAULT_PATH/" "s3://obsidian-cooolink-sync/" \
  --endpoint-url "https://oss-cn-heyuan.aliyuncs.com" \
  --delete
```

## 安全最佳实践

1. **Access Key 管理**:
   - 使用 RAM 子账号，仅授予 OSS 最小权限
   - 定期轮换 Access Key
   - 不要将 Key 硬编码在脚本中

2. **数据加密**:
   - OSS Bucket 启用服务端加密
   - 敏感笔记使用 Obsidian 加密插件

3. **备份策略**:
   - 定期创建版本快照
   - 保留多个历史版本
   - 测试恢复流程

## 故障排除

### 证书错误 (ERR_CERT_COMMON_NAME_INVALID)

**原因**: Endpoint 包含 bucket 名称

**解决**:
- ❌ 错误: `https://obsidian-cooolink-sync.oss-cn-heyuan.aliyuncs.com`
- ✅ 正确: `https://oss-cn-heyuan.aliyuncs.com`

### 同步冲突

当多设备同时修改时：
1. Remotely Save 会标记冲突文件
2. 手动检查并合并更改
3. 重新触发同步

### 权限被拒绝

检查 RAM 用户权限策略：
```json
{
  "Version": "1",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "oss:GetObject",
        "oss:PutObject",
        "oss:DeleteObject",
        "oss:ListObjects",
        "oss:GetBucketInfo"
      ],
      "Resource": [
        "acs:oss:*:*:obsidian-cooolink-sync",
        "acs:oss:*:*:obsidian-cooolink-sync/*"
      ]
    }
  ]
}
```

## 参考

- [Alibaba Cloud OSS 文档](https://www.alibabacloud.com/help/en/oss/)
- [Remotely Save GitHub](https://github.com/remotely-save/remotely-save)
- [ossutil 文档](https://www.alibabacloud.com/help/en/oss/developer-reference/install-ossutil)
- [OpenClaw Skills 文档](https://docs.openclaw.ai)
