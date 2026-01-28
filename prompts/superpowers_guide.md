# ⚡️ Superpowers 生产力脚本集指南

## 1. 项目介绍
这是一个由黑客 obra 维护的**个人生产力脚本仓库**。
它里面没有庞大的架构，只有几十个短小精悍的 Shell、Perl、Python 脚本，旨在通过命令行自动化解决日常琐事。

* **核心理念**: "If I do it twice, script it." (如果一件事通过要做两次，就把它写成脚本。)
* **主要内容**: Git 增强工具、邮件处理、时间追踪辅助等。

## 2. 如何安装 (关键)
要让这些脚本像系统命令一样随时可用，你需要把它的 `bin` 目录加入到你的环境变量中。

**在 Mac/Linux (zsh) 中配置：**
1.  打开你的配置文件：`vim ~/.zshrc`
2.  添加下面这一行（假设你的 King-Toolbox 在 `~/Projects` 目录下，请根据实际位置修改）：
    ```bash
    export PATH="$HOME/Projects/King-Toolbox/modules/superpowers/bin:$PATH"
    ```
3.  生效配置：`source ~/.zshrc`

**验证：**
在终端输入 `git-` 然后按 Tab 键，如果看到一堆你没见过的 git 命令，说明加载成功。

## 3. 值得关注的脚本
进入 `modules/superpowers/bin` 目录，你会发现很多宝藏：

* **`git-delete-merged`**: 一键删除所有已经合并到主分支的本地分支（清理强迫症必备）。
* **`git-wtf`**: 显示 Git 分支的详细状态（比 `git status` 更人话）。
* **`timetracker` 相关**: 一些简单的时间记录工具。

## 4. 资源地址
* **本地源码**: [../modules/superpowers/bin](../modules/superpowers/bin)
* **GitHub 原址**: [obra/superpowers](https://github.com/obra/superpowers)