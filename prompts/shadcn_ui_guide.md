# Shadcn/ui 使用指南

> 美观、可访问的 React 组件库 - 可复制、可定制、可扩展

[官方文档](https://ui.shadcn.com/docs) | [GitHub](https://github.com/shadcn-ui/ui) | [组件库](https://ui.shadcn.com/docs/components) | [主题](https://ui.shadcn.com/themes)

---

## 核心功能

**Shadcn/ui** 不是一个传统的 npm 组件库，而是一个**代码分发平台**。它将组件代码直接复制到你的项目中，让你拥有完全的控制权和自定义能力。

### 核心理念

> "This is not a component library. It is how you build your component library."
> （这不是一个组件库，而是你构建组件库的方式）

### 主要特点

| 特点 | 说明 |
|------|------|
| **开放代码** | 组件顶层代码完全开放，可自由修改 |
| **可组合性** | 每个组件使用通用的可组合接口 |
| **代码分发** | 扁平文件架构和 CLI 工具简化组件分发 |
| **美观默认** | 精心设计的默认样式 |
| **AI 友好** | 开放代码便于 LLM 读取、理解和优化 |

---

## 支持的框架

| 框架 | 命令 | 说明 |
|------|------|------|
| **Next.js** | `npx shadcn@latest init` | 推荐，全功能支持 |
| **Vite + React** | `npx shadcn@latest init` | 通过 Vite 模板 |
| **Remix** | `npx shadcn@latest init` | 全栈 React 框架 |
| **Laravel** | `npx shadcn@latest init` | PHP + React 混合 |
| **TanStack** | `npx shadcn@latest init` | 轻量级路由方案 |

---

## 快速开始

### 1. 初始化项目

```bash
# 创建 Next.js 项目（推荐）
npx shadcn@latest init --yes --template next --base-color zinc

# 或在现有项目中初始化
npx shadcn@latest init
```

初始化配置选项：
- **Style**: Default (推荐) 或 New York
- **Base Color**: slate, gray, zinc, neutral, stone
- **CSS Variables**: Yes (推荐)

### 2. 添加组件

```bash
# 添加单个组件
npx shadcn@latest add button

# 添加多个组件
npx shadcn@latest add button card dialog

# 添加带依赖的组件
npx shadcn@latest add data-table
```

### 3. 使用组件

```tsx
import { Button } from "@/components/ui/button"

export default function Home() {
  return (
    <div>
      <Button>Click me</Button>
      <Button variant="secondary">Secondary</Button>
      <Button variant="outline">Outline</Button>
      <Button variant="ghost">Ghost</Button>
      <Button variant="destructive">Delete</Button>
    </div>
  )
}
```

---

## 组件列表（50+）

### 基础组件

| 组件 | 功能 | 安装命令 |
|------|------|---------|
| **Accordion** | 手风琴折叠面板 | `npx shadcn@latest add accordion` |
| **Alert** | 警告提示框 | `npx shadcn@latest add alert` |
| **Alert Dialog** | 确认对话框 | `npx shadcn@latest add alert-dialog` |
| **Aspect Ratio** | 宽高比容器 | `npx shadcn@latest add aspect-ratio` |
| **Avatar** | 用户头像 | `npx shadcn@latest add avatar` |
| **Badge** | 徽章标签 | `npx shadcn@latest add badge` |
| **Breadcrumb** | 面包屑导航 | `npx shadcn@latest add breadcrumb` |
| **Button** | 按钮 | `npx shadcn@latest add button` |
| **Calendar** | 日历组件 | `npx shadcn@latest add calendar` |
| **Card** | 卡片容器 | `npx shadcn@latest add card` |
| **Carousel** | 轮播图 | `npx shadcn@latest add carousel` |
| **Chart** | 图表组件 | `npx shadcn@latest add chart` |
| **Checkbox** | 复选框 | `npx shadcn@latest add checkbox` |
| **Collapsible** | 可折叠容器 | `npx shadcn@latest add collapsible` |
| **Combobox** | 组合选择框 | `npx shadcn@latest add combobox` |
| **Command** | 命令面板 | `npx shadcn@latest add command` |
| **Context Menu** | 右键菜单 | `npx shadcn@latest add context-menu` |
| **Data Table** | 数据表格 | `npx shadcn@latest add data-table` |
| **Date Picker** | 日期选择器 | `npx shadcn@latest add date-picker` |
| **Dialog** | 对话框 | `npx shadcn@latest add dialog` |
| **Drawer** | 抽屉组件 | `npx shadcn@latest add drawer` |
| **Dropdown Menu** | 下拉菜单 | `npx shadcn@latest add dropdown-menu` |
| **Form** | 表单组件 | `npx shadcn@latest add form` |
| **Hover Card** | 悬停卡片 | `npx shadcn@latest add hover-card` |
| **Input** | 输入框 | `npx shadcn@latest add input` |
| **Input OTP** | 验证码输入 | `npx shadcn@latest add input-otp` |
| **Label** | 标签 | `npx shadcn@latest add label` |
| **Menubar** | 菜单栏 | `npx shadcn@latest add menubar` |
| **Navigation Menu** | 导航菜单 | `npx shadcn@latest add navigation-menu` |
| **Pagination** | 分页 | `npx shadcn@latest add pagination` |
| **Popover** | 弹出层 | `npx shadcn@latest add popover` |
| **Progress** | 进度条 | `npx shadcn@latest add progress` |
| **Radio Group** | 单选组 | `npx shadcn@latest add radio-group` |
| **Resizable** | 可调整大小 | `npx shadcn@latest add resizable` |
| **Scroll Area** | 滚动区域 | `npx shadcn@latest add scroll-area` |
| **Select** | 选择器 | `npx shadcn@latest add select` |
| **Separator** | 分隔线 | `npx shadcn@latest add separator` |
| **Sheet** | 侧边面板 | `npx shadcn@latest add sheet` |
| **Skeleton** | 骨架屏 | `npx shadcn@latest add skeleton` |
| **Slider** | 滑块 | `npx shadcn@latest add slider` |
| **Sonner** | Toast 通知 | `npx shadcn@latest add sonner` |
| **Switch** | 开关 | `npx shadcn@latest add switch` |
| **Table** | 表格 | `npx shadcn@latest add table` |
| **Tabs** | 标签页 | `npx shadcn@latest add tabs` |
| **Textarea** | 文本域 | `npx shadcn@latest add textarea` |
| **Toast** | 轻提示 | `npx shadcn@latest add toast` |
| **Toggle** | 切换按钮 | `npx shadcn@latest add toggle` |
| **Toggle Group** | 切换按钮组 | `npx shadcn@latest add toggle-group` |
| **Tooltip** | 工具提示 | `npx shadcn@latest add tooltip` |

### 布局组件

| 组件 | 功能 | 安装命令 |
|------|------|---------|
| **Sidebar** | 侧边栏 | `npx shadcn@latest add sidebar` |
| **Container** | 容器 | 内置 |
| **Stack** | 堆叠布局 | 使用 Tailwind |

---

## CLI 命令详解

### 基础命令

```bash
# 初始化新项目或现有项目
npx shadcn@latest init

# 添加组件
npx shadcn@latest add <component>

# 添加多个组件
npx shadcn@latest add button card dialog

# 添加所有组件
npx shadcn@latest add --all

# 构建组件（用于分发）
npx shadcn@latest build

# 查看帮助
npx shadcn@latest --help
```

### 高级选项

```bash
# 使用特定基础色初始化
npx shadcn@latest init --base-color slate

# 跳过确认
npx shadcn@latest init --yes

# 使用特定模板
npx shadcn@latest init --template next

# 强制覆盖
npx shadcn@latest add button --overwrite
```

---

## 主题系统

### 颜色配置

`components.json` 配置：

```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "app/globals.css",
    "baseColor": "zinc",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  }
}
```

### 基础颜色选项

| 颜色 | 特点 | 适用场景 |
|------|------|---------|
| **slate** | 偏蓝灰色 | 现代科技感 |
| **gray** | 纯灰色 | 通用场景 |
| **zinc** | 偏冷灰色 | 简洁专业 |
| **neutral** | 中性灰 | 平衡色调 |
| **stone** | 偏暖灰色 | 自然温馨 |

### CSS Variables

`app/globals.css` 中的变量定义：

```css
@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 240 10% 3.9%;
    --card: 0 0% 100%;
    --card-foreground: 240 10% 3.9%;
    --popover: 0 0% 100%;
    --popover-foreground: 240 10% 3.9%;
    --primary: 240 5.9% 10%;
    --primary-foreground: 0 0% 98%;
    --secondary: 240 4.8% 95.9%;
    --secondary-foreground: 240 5.9% 10%;
    --muted: 240 4.8% 95.9%;
    --muted-foreground: 240 3.8% 46.1%;
    --accent: 240 4.8% 95.9%;
    --accent-foreground: 240 5.9% 10%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 0 0% 98%;
    --border: 240 5.9% 90%;
    --input: 240 5.9% 90%;
    --ring: 240 5.9% 10%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 240 10% 3.9%;
    --foreground: 0 0% 98%;
    /* ... 其他深色变量 */
  }
}
```

### 深色模式

```tsx
// 在 layout.tsx 中配置
import { ThemeProvider } from "@/components/theme-provider"

export default function RootLayout({ children }) {
  return (
    <ThemeProvider
      attribute="class"
      defaultTheme="system"
      enableSystem
      disableTransitionOnChange
    >
      {children}
    </ThemeProvider>
  )
}
```

使用主题切换：

```tsx
import { useTheme } from "next-themes"

export function ThemeToggle() {
  const { theme, setTheme } = useTheme()

  return (
    <Button onClick={() => setTheme(theme === "dark" ? "light" : "dark")}>
      Toggle Theme
    </Button>
  )
}
```

---

## 工具函数

### cn() 函数

`lib/utils.ts` 中的核心工具函数：

```typescript
import { clsx, type ClassValue } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
```

使用场景：

```tsx
// 合并 Tailwind 类名
<div className={cn("p-4", "m-2", condition && "bg-blue-500")}>

// 条件类名
<Button className={cn("base-class", isActive && "active-class")}>

// 覆盖默认样式
<Button className={cn("w-full", className)}>
```

---

## 自定义组件

### 修改默认样式

直接编辑 `components/ui/button.tsx`：

```tsx
// 修改默认变体
const buttonVariants = cva(
  "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium",
  {
    variants: {
      variant: {
        default: "bg-primary text-primary-foreground hover:bg-primary/90",
        // 添加自定义变体
        brand: "bg-brand text-white hover:bg-brand/90",
      },
      size: {
        default: "h-10 px-4 py-2",
        // 添加自定义尺寸
        xl: "h-14 px-8 text-lg",
      },
    },
  }
)
```

### 扩展现有组件

```tsx
// components/ui/my-button.tsx
import { Button } from "./button"

export function MyButton({ children, ...props }) {
  return (
    <Button {...props} className="my-custom-class">
      {children}
    </Button>
  )
}
```

---

## 表单集成

使用 `react-hook-form` + `zod`：

```tsx
import { zodResolver } from "@hookform/resolvers/zod"
import { useForm } from "react-hook-form"
import * as z from "zod"
import { Button } from "@/components/ui/button"
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form"
import { Input } from "@/components/ui/input"

const formSchema = z.object({
  username: z.string().min(2, "用户名至少2个字符"),
  email: z.string().email("请输入有效的邮箱"),
})

export function ProfileForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: {
      username: "",
      email: "",
    },
  })

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values)
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="username"
          render={({ field }) => (
            <FormItem>
              <FormLabel>用户名</FormLabel>
              <FormControl>
                <Input placeholder="请输入用户名" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">提交</Button>
      </form>
    </Form>
  )
}
```

---

## 数据表格

使用 `@tanstack/react-table`：

```bash
npx shadcn@latest add table
npx shadcn@latest add data-table
```

```tsx
import { DataTable } from "@/components/ui/data-table"
import { ColumnDef } from "@tanstack/react-table"

const columns: ColumnDef<Payment>[] = [
  {
    accessorKey: "status",
    header: "Status",
  },
  {
    accessorKey: "email",
    header: "Email",
  },
  {
    accessorKey: "amount",
    header: "Amount",
    cell: ({ row }) => {
      const amount = parseFloat(row.getValue("amount"))
      return <div className="text-right font-medium">${amount}</div>
    },
  },
]

export function PaymentTable({ data }) {
  return <DataTable columns={columns} data={data} />
}
```

---

## 常用模式

### 对话框 + 表单

```tsx
import { Dialog, DialogContent, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog"

<Dialog>
  <DialogTrigger asChild>
    <Button>打开对话框</Button>
  </DialogTrigger>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>编辑资料</DialogTitle>
    </DialogHeader>
    <ProfileForm />
  </DialogContent>
</Dialog>
```

### 下拉菜单

```tsx
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from "@/components/ui/dropdown-menu"

<DropdownMenu>
  <DropdownMenuTrigger asChild>
    <Button variant="outline">菜单</Button>
  </DropdownMenuTrigger>
  <DropdownMenuContent>
    <DropdownMenuItem>个人资料</DropdownMenuItem>
    <DropdownMenuItem>设置</DropdownMenuItem>
    <DropdownMenuItem>退出</DropdownMenuItem>
  </DropdownMenuContent>
</DropdownMenu>
```

### Toast 通知

```tsx
import { toast } from "sonner"
import { Toaster } from "@/components/ui/sonner"

// 在 layout 中添加
<Toaster />

// 使用
toast.success("操作成功")
toast.error("操作失败")
toast.info("提示信息")
toast.promise(promise, {
  loading: "加载中...",
  success: "完成",
  error: "失败",
})
```

---

## 故障排除

### 样式不生效

1. 确认 `globals.css` 已正确导入
2. 检查 `tailwind.config.ts` 包含正确的 content 路径
3. 确认 `cn()` 函数正确合并类名

### 组件路径错误

检查 `components.json` 中的 aliases 配置：

```json
{
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui"
  }
}
```

### 深色模式不工作

1. 确认 ThemeProvider 已正确包裹应用
2. 检查 CSS 变量是否正确定义
3. 确认 html 元素有正确的 class

### CLI 命令失败

```bash
# 清除缓存重试
rm -rf node_modules package-lock.json
npm install
npx shadcn@latest init

# 或使用最新版本
npx shadcn@latest add button
```

---

## 相关资源

| 资源 | 链接 | 说明 |
|------|------|------|
| **官方文档** | [ui.shadcn.com/docs](https://ui.shadcn.com/docs) | 完整组件文档 |
| **组件列表** | [ui.shadcn.com/docs/components](https://ui.shadcn.com/docs/components) | 所有组件预览 |
| **主题市场** | [ui.shadcn.com/themes](https://ui.shadcn.com/themes) | 预置主题 |
| **Blocks** | [ui.shadcn.com/blocks](https://ui.shadcn.com/blocks) | 页面模板块 |
| **GitHub** | [github.com/shadcn-ui/ui](https://github.com/shadcn-ui/ui) | 源码仓库 |
| **Tailwind** | [tailwindcss.com](https://tailwindcss.com) | 样式框架 |
| **Radix UI** | [radix-ui.com](https://radix-ui.com) | 底层组件库 |

### 社区资源

- **shadcn/ui themes** - 社区主题合集
- **shadcn-ui-blocks** - 社区页面模板
- **shadcn-registry** - 第三方组件注册表

---

## 总结

Shadcn/ui 是 **构建现代 React 应用的最佳组件方案**：

1. **完全可控** - 代码在项目中，自由修改
2. **设计精美** - 精心设计的默认样式
3. **可访问性** - 基于 Radix UI，无障碍支持
4. **TypeScript** - 完整的类型支持
5. **生态丰富** - 50+ 组件，持续更新

**适用于**: 需要高度定制化、关注代码所有权、追求现代 UI 设计的项目

