# 🌐 New API 部署与作战指南

## 1. 这是什么？(What is this?)
New API 是一个 **AI 接口中转站**。
*   **以前**: 你需要在代码里分别为 OpenAI、Claude、DeepSeek 写三套不同的对接代码。
*   **现在**: 你只需要部署这个 New API，它会把所有大模型（如 Claude, Gemini, 通义千问等）都伪装成 **OpenAI 格式**。
*   **结果**: 你的代码只需要支持 OpenAI，就能调用全世界的模型！

## 2. 为什么需要它？
1.  **统一管理**: 一个后台管理所有 Key (Key池)。
2.  **省钱**: 支持多渠道轮询，哪个便宜用哪个。
3.  **分发**: 你可以创建子 Key 分给团队成员或朋友使用，还能限制额度。

## 3. 小白部署教程 (Docker篇)
只要你电脑/服务器上有 Docker，三行代码就能跑起来。

### 第一步：准备 Docker
如果你还没安装，先去下载桌面版：
*   **Mac/Win**: 下载 [Docker Desktop](https://www.docker.com/products/docker-desktop/) 并安装打开。
*   **验证**: 终端输入 `docker -v`，显示版本号即成功。

### 第二步：一键启动
复制下面这段代码到终端执行（注意：密码在下面）：

```bash
docker run --name new-api -d --restart always \
-p 3000:3000 \
-e TZ=Asia/Shanghai \
-v $HOME/new-api-data:/data \
quantumnous/new-api:latest
```

### 第三步：登录后台
1.  打开浏览器访问：`http://localhost:3000`
2.  默认账号：`root`
3.  默认密码：`123456`
4.  **重要**: 登录后第一时间去“个人设置”修改密码！

### 第四步：配置第一个渠道
1.  点击左侧栏 **“渠道”** -> **“添加新的渠道”**。
2.  **类型**: 选择你有的 Key 类型（比如 Anthropic Claude）。
3.  **密钥**: 填入你的 `sk-ant-xxx...`。
4.  **代理**: 如果在国内服务器，可能需要填反代地址。
5.  提交后，点击 **“测试”**，显示绿色时间（如 300ms）即成功。

## 4. 如何在 Trae/Cursor 中使用？
一旦部署好，你在 Trae 或 Cursor 里就不需要填官方 Key 了：
1.  **API Base URL**: 填 `http://localhost:3000/v1` (如果是远程服务器填 IP)。
2.  **API Key**: 在 New API 后台 **“令牌”** 页面创建一个新令牌 (`sk-newapi-xxx`) 填进去。
3.  **Model**: 填 `claude-3-5-sonnet-20240620` (取决于你添加了什么渠道)。

## 5. 常见问题
*   **Q: 启动失败，提示端口占用？**
    *   A: 修改命令里的 `-p 3000:3000`，比如改成 `-p 3001:3000`，然后访问 localhost:3001。