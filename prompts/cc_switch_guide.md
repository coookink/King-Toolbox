# 🎛️ CC Switch 助手使用指南

## 1. 这是什么？
CC Switch 是一个**桌面小工具** (App)。
它是专门为了解决 "配置太麻烦" 而生的。
如果你在用 Claude Code (命令行版) 或者 Codex，经常需要：
*   换 API Key (比如从官方换到中转)。
*   换代理地址。
*   测试哪个线路快。
用这个 App，点一下鼠标就全搞定。

## 2. 为什么小白需要它？
如果你不懂怎么用 vim 修改 `~/.claude/config.json` 这种复杂文件，千万别自己乱改，容易把环境搞坏。
用 CC Switch，全是图形界面，像设置微信一样简单。

## 3. 小白安装教程

### 方式 A：Mac 用户 (Homebrew)
如果你装过 brew (没装过看方式 B)：
打开终端，复制粘贴：
```bash
brew tap farion1231/ccswitch
brew install --cask cc-switch
```
安装完后，在“应用程序”里就能找到 CC Switch。

### 方式 B：下载安装包 (通用)
1.  点击访问 [GitHub Release 页面](https://github.com/farion1231/cc-switch/releases)。
2.  找最新的版本 (比如 v3.10.x)。
    *   **Mac**: 下载 `.dmg` 文件。
    *   **Windows**: 下载 `.exe` 或 `.msi` 文件。
3.  下载后双击安装，一路“下一步”。

## 4. 快速上手：切换第一个 Key
1.  打开 CC Switch App。
2.  点击界面上的 **"添加供应商" (Add Provider)**。
3.  **Name**: 随便起个名，比如 "我的中转key"。
4.  **Type**: 选 Claude Code。
5.  **API Key**: 粘贴你买到的 `sk-...` 密钥。
6.  **Base URL**: 如果是中转商，填他们的地址 (如 `https://api.oneapi.pro/v1`)。
7.  点击保存，然后点击 **"Activate" (激活)**。
8.  搞定！现在去终端用 `claude` 命令，它就会自动用你刚设置的这个 Key 了。

## 5. 常见问题
*   **Q: 为什么我改了 Key，终端里没生效？**
    *   A: 尝试**重启一下终端窗口**。有些配置需要重新加载。
*   **Q: Mac 上打不开，提示“未知开发者”？**
    *   A: 这是 Mac 的安全机制。去 **系统设置 -> 隐私与安全性**，往下翻，找到 CC Switch，点 **"仍要打开"**。
