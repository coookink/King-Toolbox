# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is the **Aliyun Cloud Server Management** project for managing Alibaba Cloud resources, specifically the **cooolink** server (i-f8zfel20zluhs73q1s15), using Claude Code with MCP (Model Context Protocol) integration.

---

## Server Information (cooolink)

| Property | Value |
|----------|-------|
| **Instance Name** | cooolink |
| **Instance ID** | `i-f8zfel20zluhs73q1s15` |
| **Region** | cn-heyuan (华南2-河源) |
| **Public IP** | 8.155.2.124 |
| **Private IP** | 172.23.216.206 |
| **Instance Type** | ecs.e-c1m2.xlarge (4核8G) |
| **OS** | Ubuntu 24.04 LTS |
| **SSH Port** | 22 |
| **OpenClaw Port** | 18789 |
| **Resource Group** | rg-acfm2a74wewsaby |

---

## Access URLs

| Service | URL |
|---------|-----|
| **1Panel 管理** | http://8.155.2.124:2026 |
| **OpenClaw Gateway** | http://8.155.2.124:18789 |

---

## Deployed Services

### OpenClaw Gateway
- **Version**: 2026.3.8
- **Port**: 18789
- **Memory Limit**: 768MB (systemd)
- **Config**: `/root/.openclaw/openclaw.json`
- **Service**: `systemctl status openclaw`
- **Agents**: openclaw (default), home-agent, finance-agent
- **Documentation**: See [openclaw-config.md](./openclaw-config.md)

### Docker Services

| 服务 | 类型 | 内存限制 | 说明 |
|------|------|---------|------|
| 1Panel-mysql | MySQL | 512MB | 主数据库 |
| cooolink-mysql | MySQL | 384MB | 业务数据库 |
| cooolink-backend | Node.js | 256MB | 后端服务 |
| docker-weaviate | Vector DB | 128MB | 向量数据库 |
| Dify | AI Platform | - | 工作流平台 |

---

## MCP Tools Available

### ECS Instance Management
- `ECS_DescribeInstances` - Query instance status
- `ECS_DescribeRegions` - Query available regions
- `ECS_DescribeZones` - Query available zones
- `OOS_StartInstances` - Start instances
- `OOS_StopInstances` - Stop instances
- `OOS_RebootInstances` - Reboot instances
- `OOS_RunCommand` - Execute shell commands on ECS

### Monitoring
- `CMS_GetCpuUsageData` - CPU usage metrics
- `CMS_GetMemUsageData` - Memory usage metrics
- `CMS_GetDiskUsageData` - Disk usage metrics

### OSS Storage
- `OSS_ListBuckets` - List storage buckets
- `OSS_ListObjects` - List objects in bucket

### Application Deployment
- `OOS_CodeDeploy` - Automated application deployment
- `LOCAL_AnalyzeDeployStack` - Analyze project tech stack

---

## Common Operations

### Restart OpenClaw
```bash
systemctl restart openclaw
```

### Check Server Resources
```bash
# Check memory usage
free -h

# Check disk usage
df -h

# Check OpenClaw memory
systemctl show openclaw --property=MemoryCurrent,MemoryMax

# View all running containers
docker ps
```

### Check OpenClaw Sessions
```bash
# List agent sessions
ls ~/.openclaw/agents/*/sessions/

# View OpenClaw logs
journalctl -u openclaw -f
```

---

## Related Files

| File | Description |
|------|-------------|
| [README.md](./README.md) | 项目概述和工具列表 |
| [openclaw-config.md](./openclaw-config.md) | OpenClaw 详细配置 |
| [mcp-alibaba-cloud-setup.md](./mcp-alibaba-cloud-setup.md) | MCP 配置指南 |

---

## Notes

- This project is specifically for managing the cooolink server via Alibaba Cloud MCP
- All operations are performed through MCP tools without direct SSH
- Server memory has been optimized to stay within 4GB usage
