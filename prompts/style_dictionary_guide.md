# Style Dictionary 使用指南

> 跨平台样式构建系统 - 用设计令牌（Design Tokens）统一管理多平台样式

[官方仓库](https://github.com/style-dictionary/style-dictionary) | [官方文档](https://amzn.github.io/style-dictionary/)

---

## 核心功能

Style Dictionary 是一个**跨平台样式构建系统**，通过设计令牌（Design Tokens）定义样式，然后自动导出到多种平台：

- **Web**: CSS、SCSS、Less、Tailwind
- **iOS**: Swift、Objective-C
- **Android**: XML、Compose
- **JavaScript**: JS、JSON、ES6 Modules
- **其他**: React Native、Flutter、Sketch、Figma

### 解决问题

> "当管理用户体验时，在多个开发平台和设备间保持样式一致和同步可能相当具有挑战性...Style Dictionary 通过从单一来源自动生成跨所有平台的样式定义来解决这个问题。"

- 设计系统在多平台保持一致
- 设计变更自动同步到所有端
- 消除设计与开发之间的手动转换

---

## 快速开始

### 安装

```bash
# 全局安装
npm i -g style-dictionary

# 或在项目中安装
npm install --save-dev style-dictionary
```

### 初始化项目

```bash
mkdir MyStyleDictionary && cd MyStyleDictionary
style-dictionary init basic
```

这会生成：
- `tokens/` - 令牌定义文件
- `config.json` - 构建配置
- `build/` - 输出目录

### 构建样式

```bash
style-dictionary build
```

---

## 令牌定义示例

### 基础结构

创建 `tokens/color/base.json`:

```json
{
  "color": {
    "base": {
      "gray": {
        "light": { "value": "#CCCCCC" },
        "medium": { "value": "#999999" },
        "dark": { "value": "#333333" }
      },
      "red": {
        "primary": { "value": "#FF0000" },
        "secondary": { "value": "{color.base.gray.light}" }
      }
    }
  }
}
```

### 支持令牌别名

```json
{
  "size": {
    "font": {
      "small": { "value": "12px" },
      "medium": { "value": "16px" },
      "large": { "value": "24px" },
      "base": { "value": "{size.font.medium}" }
    }
  }
}
```

### 复杂结构

```json
{
  "button": {
    "primary": {
      "background": { "value": "{color.base.red.primary}" },
      "color": { "value": "#FFFFFF" },
      "border": {
        "width": { "value": "1px" },
        "color": { "value": "{color.base.red.primary}" }
      },
      "padding": {
        "horizontal": { "value": "16px" },
        "vertical": { "value": "8px" }
      }
    }
  }
}
```

---

## 配置文件

### 基础配置

```json
{
  "source": ["tokens/**/*.json"],
  "platforms": {
    "scss": {
      "transformGroup": "scss",
      "buildPath": "build/scss/",
      "files": [{
        "destination": "_variables.scss",
        "format": "scss/variables"
      }]
    },
    "css": {
      "transformGroup": "css",
      "buildPath": "build/css/",
      "files": [{
        "destination": "variables.css",
        "format": "css/variables"
      }]
    },
    "ios": {
      "transformGroup": "ios",
      "buildPath": "build/ios/",
      "files": [{
        "destination": "StyleDictionary.swift",
        "format": "ios-swift/class.swift"
      }]
    },
    "android": {
      "transformGroup": "android",
      "buildPath": "build/android/",
      "files": [{
        "destination": "colors.xml",
        "format": "android/colors"
      }]
    }
  }
}
```

### 自定义转换

```javascript
const StyleDictionary = require('style-dictionary');

StyleDictionary.registerTransform({
  name: 'size/px-to-rem',
  type: 'value',
  matcher: function(prop) {
    return prop.attributes.category === 'size';
  },
  transformer: function(prop) {
    return parseInt(prop.original.value) / 16 + 'rem';
  }
});
```

### 自定义格式

```javascript
StyleDictionary.registerFormat({
  name: 'custom/json',
  formatter: function({dictionary, file, options}) {
    return JSON.stringify(dictionary.tokens, null, 2);
  }
});
```

---

## 输出示例

### SCSS

```scss
// _variables.scss
$color-base-gray-light: #CCCCCC;
$color-base-gray-medium: #999999;
$color-base-red-primary: #FF0000;
$size-font-small: 12px;
$size-font-medium: 16px;
```

### CSS

```css
:root {
  --color-base-gray-light: #CCCCCC;
  --color-base-gray-medium: #999999;
  --color-base-red-primary: #FF0000;
  --size-font-small: 12px;
  --size-font-medium: 16px;
}
```

### iOS Swift

```swift
// StyleDictionary.swift
public class StyleDictionary {
    public static let colorBaseGrayLight = UIColor(red: 0.80, green: 0.80, blue: 0.80, alpha: 1.0)
    public static let colorBaseGrayMedium = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
    public static let sizeFontSmall = CGFloat(12.0)
    public static let sizeFontMedium = CGFloat(16.0)
}
```

### Android XML

```xml
<!-- colors.xml -->
<resources>
    <color name="color_base_gray_light">#ffcccccc</color>
    <color name="color_base_gray_medium">#ff999999</color>
    <color name="color_base_red_primary">#ffff0000</color>
</resources>
```

---

## 进阶用法

### 多主题支持

```json
{
  "source": ["tokens/base/*.json"],
  "include": ["tokens/themes/light.json"],
  "platforms": {
    "scss": {
      "transformGroup": "scss",
      "buildPath": "build/scss/",
      "files": [{
        "destination": "_variables-light.scss",
        "format": "scss/variables"
      }]
    }
  }
}
```

### 条件构建

```javascript
// style-dictionary.config.js
module.exports = {
  source: ['tokens/**/*.json'],
  platforms: {
    web: {
      transformGroup: 'web',
      buildPath: 'build/web/',
      files: [{
        destination: 'variables.css',
        format: 'css/variables'
      }]
    }
  }
};
```

### 使用 JavaScript API

```javascript
const StyleDictionary = require('style-dictionary');

const sd = StyleDictionary.extend('./config.json');
sd.buildAllPlatforms();

// 或单个平台
sd.buildPlatform('web');
```

---

## 最佳实践

### 1. 令牌命名规范

```
category/type/item/variant

# 示例
color/background/primary
size/font/body/line-height
spacing/padding/button/horizontal
```

### 2. 目录结构

```
tokens/
├── color/
│   ├── base.json       # 基础色
│   ├── semantic.json   # 语义色（品牌、功能）
│   └── component.json  # 组件专用色
├── size/
│   ├── font.json       # 字体大小
│   ├── spacing.json    # 间距
│   └── border.json     # 边框
├── shadow/
│   └── box-shadow.json
└── breakpoint/
    └── responsive.json
```

### 3. 版本控制

- 令牌文件纳入版本控制
- 生成的构建文件不纳入（`.gitignore`）
- 在 CI/CD 中自动构建

### 4. 与 Figma 集成

使用 [Tokens Studio for Figma](https://tokens.studio/) 插件：
- 在 Figma 中管理令牌
- 同步到 GitHub
- Style Dictionary 读取并构建

---

## CI/CD 集成

### GitHub Actions

```yaml
name: Build Tokens

on:
  push:
    paths:
      - 'tokens/**'

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run build:tokens
      - run: git add build/ && git commit -m "Update tokens" && git push
```

---

## 常用命令速查

```bash
# 初始化基础模板
style-dictionary init basic

# 初始化完整模板
style-dictionary init complete

# 构建所有平台
style-dictionary build

# 构建指定平台
style-dictionary build --platform web

# 使用自定义配置
style-dictionary build --config ./my-config.js

# 清理构建目录
style-dictionary clean

# 清理并构建
style-dictionary clean-build
```

---

## 相关工具

- **[Tokens Studio](https://tokens.studio/)** - Figma 令牌管理插件
- **[Style Dictionary CLI](https://github.com/amzn/style-dictionary/tree/main/packages/cli)** - 官方 CLI
- **[Figma Tokens](https://github.com/six7/figma-tokens)** - Figma 令牌同步

---

## 总结

Style Dictionary 是构建设计系统的核心工具，实现「一处定义，多处使用」：

1. **设计侧** - Figma Tokens Studio 管理
2. **代码侧** - Style Dictionary 构建导出
3. **平台侧** - iOS/Android/Web 自动同步

**适用于**: 多平台产品、需要严格设计一致性的项目、大型设计系统
