# 📖 Easydict 词典翻译 macOS App 指南

## 1. 这是什么？(What is this?)
Easydict 是一个**简洁优雅的 macOS 词典翻译应用**。
*   **核心能力**: 查词 + 翻译 + OCR 截图翻译，三合一。
*   **开箱即用**: 安装即可使用苹果系统词典和系统翻译，无需配置。
*   **AI 加持**: 支持 OpenAI、Gemini、DeepSeek、Ollama 等 20+ 翻译服务。
*   **物理位置**: `modules/Easydict`

## 2. 为什么需要它？
如果你经常需要：
*   阅读英文文档时**划词翻译**（鼠标选中自动弹出）。
*   截图识别外语文字（**OCR 翻译**）。
*   同时对比多个翻译服务的结果（Google vs DeepL vs GPT）。
*   一个**原生 macOS App**，而不是浏览器插件或网页版。

Easydict 就是你的最佳选择。

## 3. 小白安装教程

### 方式 A：Homebrew 一键安装（推荐）
```bash
brew install --cask easydict
```

### 方式 B：手动下载
前往 [GitHub Releases](https://github.com/tisfeng/Easydict/releases) 下载最新 `.dmg` 文件，拖入"应用程序"文件夹。

> **系统要求**: macOS 13.0+。旧系统请使用 [v2.7.2](https://github.com/tisfeng/Easydict/releases/tag/2.7.2)。

## 4. 核心快捷键
| 快捷键 | 功能 |
| :--- | :--- |
| `⌥ + A` | 划词翻译（选中文字后触发） |
| `⌥ + D` | 截图 OCR 翻译 |
| `⌥ + S` | 静默截图 OCR（不弹窗） |
| `⌥ + ⇧ + S` | 显示/隐藏主窗口 |
| `Enter` | 输入翻译（在输入框里回车） |

## 5. 支持的翻译服务
| 类别 | 服务 |
| :--- | :--- |
| **系统原生** | 🍎 Apple 系统词典、🍎 Apple 系统翻译 |
| **AI 模型** | OpenAI、Gemini、DeepSeek、Ollama、Groq、智谱 AI、GitHub Models、豆包 |
| **专业翻译** | DeepL、Google、Bing、有道、腾讯、百度、阿里、小牛、彩云、火山 |

## 6. 核心特性
*   🚀 **开箱即用** — 自动识别输入语言。
*   🖱️ **鼠标划词** — 选中文字自动翻译。
*   📸 **OCR 截图翻译** — 识别图片中的文字并翻译。
*   🔊 **多种 TTS 语音** — 支持多种发音引擎。
*   🗣️ **48 种语言** — 覆盖全球主流语言。

## 7. 开发者信息
*   **技术栈**: Objective-C → **正在迁移至 Swift + SwiftUI**。
*   **许可证**: GPL-3.0 开源。
*   **贡献**: 提交 PR 到 `dev` 分支；重大功能请先开 Issue 讨论。

## 8. 常见问题
*   **Q: Mac 打不开，提示"未知开发者"？**
    *   A: 去 **系统设置 → 隐私与安全性**，找到 Easydict，点 **"仍要打开"**。
*   **Q: 如何配置 OpenAI/DeepL 等 API？**
    *   A: 打开 Easydict 设置 → 翻译服务，填入对应的 API Key 即可。
*   **Q: 从源码构建？**
    *   A: 打开 `Easydict.xcworkspace`（不是 `.xcodeproj`），选择 Easydict scheme 构建。

## 9. 资源地址
*   **GitHub**: [tisfeng/Easydict](https://github.com/tisfeng/Easydict)
*   **完整使用指南**: [GUIDE.md](https://github.com/tisfeng/Easydict/blob/dev/docs/en/GUIDE.md)
