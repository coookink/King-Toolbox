# 🎛️ CC Switch 使用指南 (Claude/Gemini CLI Assistant)

## 1. 项目介绍
**CC Switch** 是一个全方位的辅助工具，专为 **Claude Code**, **Codex**, 和 **Gemini CLI** 用户设计。
它基于 **Tauri 2 + React** 构建，轻量且高性能。

*   **物理位置**: `modules/cc-switch`
*   **核心痛点**: 解决在使用 CLI 工具时频繁切换 API Key、Endpoint、MCP Server 和 System Prompts 的麻烦。

## 2. 核心功能
1.  **供应商管理 (Provider Switching)**:
    *   一键切换 Claude/Codex/Gemini 的 API 配置 (如切换官方与中转 Key)。
    *   内置连接速度测试。
2.  **MCP 统一管理**:
    *   可视化管理所有 CLI 的 MCP 服务器配置。
    *   支持从配置文件导入/导出。
3.  **Skills 积木商店**:
    *   一键扫描并安装 GitHub 上的 Claude Skills (如 awesome-claude-skills)。
4.  **Prompts 管理**:
    *   管理系统提示词预设，支持 Markdown 实时预览。

## 3. 如何使用 (Usage)

### 方式 A：安装应用程序 (推荐)
这是一个桌面端 App，建议直接安装 Release 版本使用。

*   **macOS (Homebrew)**:
    ```bash
    brew tap farion1231/ccswitch
    brew install --cask cc-switch
    ```
*   **其他平台**:
    前往 [Releases 页面](https://github.com/farion1231/cc-switch/releases) 下载对应安装包。

### 方式 B：本地开发/构建
如果你需要魔改或自行编译：

```bash
cd modules/cc-switch
pnpm install
pnpm tauri build
```

## 4. 资源地址
*   **GitHub 原址**: [farion1231/cc-switch](https://github.com/farion1231/cc-switch)
