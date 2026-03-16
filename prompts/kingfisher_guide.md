# 📖 Kingfisher iOS 图片加载库指南

## 1. 这是什么？(What is this?)
Kingfisher 是一个**纯 Swift 图片下载与缓存库**，专为 iOS/macOS/watchOS/tvOS 开发设计。
*   **核心能力**: 异步图片下载 + 内存/磁盘双层缓存 + 图片处理。
*   **开箱即用**: 一行代码加载网络图片，自动处理缓存。
*   **现代 Swift**: 支持 Swift 6、Swift Concurrency、SwiftUI。
*   **物理位置**: `modules/Kingfisher`

## 2. 为什么需要它？
如果你经常需要：
*   在列表/网格中**高效加载网络图片**（自动复用、取消下载）。
*   **缓存图片**避免重复下载，节省流量。
*   **处理图片**（圆角、裁剪、滤镜、降采样）。
*   **预加载图片**提升用户体验。
*   支持 **SwiftUI** 原生方式加载图片。

Kingfisher 就是你的最佳选择。

## 3. 小白安装教程

### 方式 A：Swift Package Manager（推荐）
在 Xcode 中选择：`File` → `Add Package Dependencies...`
输入 URL：`https://github.com/onevcat/Kingfisher.git`

或直接在 Package.swift 中添加：
```swift
dependencies: [
    .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0")
]
```

### 方式 B：CocoaPods
```ruby
pod 'Kingfisher', '~> 8.0'
```

### 方式 C：手动集成
将 `modules/Kingfisher/Sources` 文件夹拖入 Xcode 项目。

> **系统要求**: iOS 13.0+ / macOS 10.15+ / Swift 5.9+

## 4. 核心使用方式

### UIKit - UIImageView
```swift
import Kingfisher

let url = URL(string: "https://example.com/image.png")
imageView.kf.setImage(with: url)
```

### SwiftUI - KFImage
```swift
import KingfisherSwiftUI

KFImage(URL(string: "https://example.com/image.png")!)
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 200, height: 200)
```

## 5. 高级功能

### 占位符与加载指示器
```swift
imageView.kf.setImage(
    with: url,
    placeholder: UIImage(named: "placeholder"),
    options: [.indicator(.activity)]
)
```

### 图片处理（圆角 + 裁剪）
```swift
let processor = ResizingImageProcessor(referenceSize: CGSize(width: 100, height: 100))
    |> RoundCornerImageProcessor(cornerRadius: 20)

imageView.kf.setImage(
    with: url,
    options: [.processor(processor)]
)
```

### 过渡动画
```swift
imageView.kf.setImage(
    with: url,
    options: [.transition(.fade(0.3))]
)
```

### 图片预取
```swift
let urls = ["url1", "url2", "url3"].compactMap { URL(string: $0) }
ImagePrefetcher(urls: urls).start()
```

## 6. 核心特性
*   🚀 **异步下载** — 基于 URLSession，支持并发下载。
*   💾 **双层缓存** — 内存缓存（快速）+ 磁盘缓存（持久）。
*   🔄 **自动复用** — 复用已下载内容，避免重复请求。
*   ✂️ **图片处理** — 内置多种处理器（裁剪、圆角、滤镜）。
*   📱 **全平台支持** — iOS、macOS、watchOS、tvOS、visionOS。
*   🎨 **SwiftUI 原生** — KFImage 与 SwiftUI 无缝集成。
*   🔋 **低数据模式** — 支持 iOS 低数据模式优化。
*   🎬 **Live Photo** — 支持 Live Photo 缓存与加载。

## 7. 常用配置选项

| 选项 | 说明 |
| :--- | :--- |
| `.processor()` | 图片处理器（裁剪、圆角等） |
| `.placeholder()` | 加载占位图 |
| `.transition()` | 加载完成过渡动画 |
| `.cacheMemoryOnly()` | 仅内存缓存 |
| `.forceRefresh()` | 强制刷新，忽略缓存 |
| `.downloadTimeout()` | 下载超时时间 |
| `.retry()` | 下载失败重试策略 |

## 8. 资源地址
*   **GitHub**: [onevcat/Kingfisher](https://github.com/onevcat/Kingfisher)
*   **官方文档**: [Kingfisher Documentation](https://swiftpackageindex.com/onevcat/kingfisher/master/documentation/kingfisher)
*   **中文介绍**: [README 中文](https://github.com/onevcat/Kingfisher/blob/master/README_CN.md)
