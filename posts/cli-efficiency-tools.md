---
title: "⚡ 程序员必备的 CLI 效率工具"
date: "2024-02-07"
excerpt: "提升开发效率的必备命令行工具"
tags: ["CLI", "效率", "工具"]
---

# ⚡ 程序员必备的 CLI 效率工具

熟练使用命令行工具是程序员的基本功。以下工具能大幅提升你的工作效率！

## 🏃 快速跳转

### z - 智能跳转
```bash
# 安装
brew install z

# 使用 - 记住常用路径
z pro  # 跳转到 ~/work/src/projects
```

**原理**: 基于访问频率和时间的智能跳转算法

### fzf - 模糊搜索
```bash
# 安装
brew install fzf

# 搜索文件
fzf

# 搜索历史命令
Ctrl + R
```

## 📁 文件管理

### fd - 快速查找
```bash
# 安装
brew install fd

# 查找文件
fd "*.py"

# 忽略特定目录
fd --ignore-case "config" --no-ignore
```

### bat - 替代 cat
```bash
# 安装
brew install bat

# 显示文件（带语法高亮）
bat README.md
```

## 🔧 开发工具

### tldr - 简化 man 页面
```bash
# 安装
npm install -g tldr

# 查看命令示例
tldr cp
tldr git
```

### exa - 增强 ls
```bash
# 安装
cargo install exa

# 使用
exa -la --icons
```

## 🌐 网络工具

### httpie - 优雅的 HTTP 请求
```bash
# 安装
brew install httpie

# 发送请求
http GET https://api.github.com/users/octocat
```

### curlie - HTTP 客户端
```bash
# 安装
brew install curlie

# 组合 curl + httpie 优点
curlie GET https://httpbin.org/ip
```

## 📊 系统监控

### htop - 进程监控
```bash
# 安装
brew install htop

# 使用
htop
```

### glances - 全方位监控
```bash
# 安装
brew install glances

# 使用
glances
```

## 🎯 推荐配置

将这些加入你的 `.zshrc`:
```bash
# 效率工具
alias ls='exa -la --icons'
alias cat='bat --style=grid'
alias ff='fzf --preview "bat --style=numbers --color=always {}"'

# 快速跳转
eval "$(zoxide init zsh)"
```

## 💡 使用建议

1. **循序渐进** - 先学 2-3 个常用工具
2. **融入工作流** - 在实际项目中使用
3. **创建快捷键** - 减少重复操作

## 🔗 安装集合

```bash
# 一次性安装常用工具
brew install fzf fd bat zoxide httpie
```

---

*善用工具，事半功倍！*
