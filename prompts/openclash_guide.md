# OpenClash 使用指南

> OpenWrt 路由器的 Clash/Mihomo 代理客户端

[GitHub](https://github.com/vernesong/OpenClash) | [下载 Releases](https://github.com/vernesong/OpenClash/releases)

---

## 核心功能

OpenClash 是运行在 **OpenWrt 路由器**上的 Clash/Mihomo 代理客户端，为全屋设备提供透明代理服务。

### 主要特点

- **多协议支持**: Shadowsocks, ShadowsocksR, Vmess, Trojan, Snell
- **规则分流**: 基于域名、IP、GEOIP 的智能分流
- **透明代理**: 无需客户端配置，全屋设备自动代理
- **Web 管理**: 内置 yacd/zashboard 面板可视化操作
- **TUN 模式**: 支持 UDP、游戏加速
- **自动更新**: 规则、内核、GEOIP 自动更新

---

## 安装方法

### 前置要求

- OpenWrt 固件（官方或第三方如 ImmortalWrt、Lean 等）
- 足够的存储空间（建议 >50MB 剩余空间）
- 已配置网络连接

### 依赖包

```bash
# 安装必要依赖
opkg update
opkg install luci luci-base luci-compat dnsmasq-full bash curl ipset iptables iptables-mod-tproxy iptables-mod-extra ruby kmod-tun
```

### 方法一：IPK/APK 安装（推荐）

1. 访问 [Releases](https://github.com/vernesong/OpenClash/releases) 下载对应架构的 ipk/apk 包

2. 上传并安装：

```bash
# 上传到路由器 /tmp 目录
scp luci-app-openclash_*.ipk root@192.168.1.1:/tmp

# SSH 登录路由器安装
opkg install /tmp/luci-app-openclash_*.ipk
```

### 方法二：在线安装

部分 OpenWrt 软件源已集成：

```bash
opkg update
opkg install luci-app-openclash
```

### 方法三：自行编译

```bash
# 添加 feed
echo "src-git openclash https://github.com/vernesong/OpenClash.git" >> feeds.conf.default

# 更新并安装
./scripts/feeds update openclash
./scripts/feeds install -a -p openclash

# 编译
make menuconfig  # 选择 LuCI -> Applications -> luci-app-openclash
make package/luci-app-openclash/compile V=s
```

---

## 配置使用

### 1. 订阅配置

进入 OpenClash 插件页面：

```
服务 -> OpenClash -> 配置订阅
```

添加订阅 URL：

```yaml
# 常见订阅格式
- Clash 订阅: https://example.com/clash.yaml
- V2Ray 订阅: https://example.com/v2ray
- SSR 订阅: https://example.com/ssr
```

### 2. 启动 OpenClash

```
服务 -> OpenClash -> 运行状态
```

点击「启动 OpenClash」，等待初始化完成。

### 3. 配置代理模式

| 模式 | 说明 | 适用场景 |
|------|------|----------|
| **Rule** | 按规则分流 | 日常使用 |
| **Global** | 全局代理 | 全部走代理 |
| **Direct** | 全局直连 | 关闭代理 |
| **Script** | 脚本模式 | 高级用户 |

---

## 高级功能

### TUN 模式（支持 UDP/游戏）

```
服务 -> OpenClash -> 模式设置 -> 运行模式
```

选择 **TUN 模式**，支持：
- UDP 协议代理
- 游戏加速
- 视频通话优化

### 自定义规则

编辑配置文件添加自定义规则：

```yaml
rules:
  # 全球直连
  - DOMAIN-SUFFIX,baidu.com,DIRECT
  - DOMAIN-SUFFIX,taobao.com,DIRECT

  # 代理
  - DOMAIN-SUFFIX,google.com,Proxy
  - DOMAIN-SUFFIX,youtube.com,Proxy

  # 最终规则
  - GEOIP,CN,DIRECT
  - MATCH,Proxy
```

### 自动更新设置

```
服务 -> OpenClash -> 插件设置
```

- **自动更新订阅**: 每天定时更新节点
- **自动更新 GEOIP**: 保持 IP 库最新
- **自动更新内核**: Mihomo 内核自动升级

---

## 管理面板

### 内置面板

启动后访问路由器 IP + 端口：

```
http://192.168.1.1:9090/ui
```

或点击「Open Panel」按钮。

### 面板功能

- 实时流量监控
- 节点延迟测试
- 连接日志查看
- 规则命中分析
- 节点切换

---

## 故障排除

### 无法启动

```bash
# 检查日志
logread | grep openclash

# 检查内核
lsmod | grep tun

# 检查防火墙
iptables -t nat -L
```

### 无法访问外网

1. 确认订阅配置有效
2. 测试节点连通性（面板里测试延迟）
3. 检查 DNS 设置
4. 查看运行日志排查

### 存储空间不足

```bash
# 清理日志
rm -rf /etc/openclash/history/*
rm -rf /tmp/openclash_*.log

# 扩展 overlay
opkg install block-mount
# 配置 extroot
```

---

## 常用命令

```bash
# 查看运行状态
/etc/init.d/openclash status

# 重启服务
/etc/init.d/openclash restart

# 停止服务
/etc/init.d/openclash stop

# 更新订阅
/usr/share/openclash/openclash.sh

# 查看配置文件
cat /etc/openclash/config.yaml
```

---

## 性能优化

### 路由器推荐配置

| 项目 | 建议 |
|------|------|
| CPU | 双核 1GHz+ |
| 内存 | 512MB+ |
| 存储 | 128MB+ 可用 |
| 内核 | 支持 TUN |

### 优化建议

1. **使用 Meta 内核**: 功能更全、性能更好
2. **精简规则集**: 减少匹配时间
3. **定期清理日志**: 释放空间
4. **关闭 IPv6**: 如不需要

---

## 相关项目

- **[Mihomo](https://github.com/MetaCubeX/mihomo)** - OpenClash 使用的内核
- **[Clash](https://github.com/Dreamacro/clash)** - 原版 Clash
- **[zashboard](https://github.com/Zephyruso/zashboard)** - 现代 Web 面板
- **[yacd](https://github.com/haishanh/yacd)** - 经典 Web 面板

---

## 注意事项

1. 确保遵守当地法律法规
2. 部分国家/地区可能限制此类工具使用
3. 仅用于学习研究目的

---

## 总结

OpenClash 是 OpenWrt 路由器上功能最完善的代理客户端：

- **全屋代理**: 所有设备自动走代理
- **智能分流**: 国内外流量自动分流
- **可视化**: Web 面板方便管理
- **高性能**: 路由器级别代理，低延迟

**适用于**: OpenWrt 用户、需要全屋代理的场景、多设备统一管理
