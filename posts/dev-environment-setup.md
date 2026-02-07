---
title: "🛠️ 程序员开发环境配置指南"
date: "2024-02-07"
excerpt: "从零配置高效的程序员开发环境"
tags: ["开发", "环境", "配置"]
---

# 🛠️ 程序员开发环境配置指南

良好的开发环境是高效编程的基础。本文从零开始，帮你配置理想的开发环境！

## 🖥️ 系统配置

### 系统偏好设置
```bash
# 显示隐藏文件
defaults write com.apple.finder AppleShowAllFiles YES

# 快速显示桌面
defaults write com.apple.finder CreateDesktop false

# 增大 Dock 动画速度
defaults write com.apple.dock autohide-delay -float 0
```

### Homebrew - 包管理器
```bash
# 安装
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 使用
brew install node
brew install git
brew install --cask visual-studio-code
```

## 💻 终端配置

### Oh My Zsh
```bash
# 安装
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 主题推荐
ZSH_THEME="powerlevel10k/powerlevel10k"

# 插件推荐
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
```

### Starship - 跨平台提示符
```bash
# 安装
brew install starship

# 配置 ~/.config/starship.toml
[username]
show_always = true

[git_branch]
symbol = "🌿 "

[python]
symbol = "🐍 "
```

## 🛣️ 路径管理

### zoxide - 智能跳转
```bash
# 安装
brew install zoxide

# 初始化 (添加到 ~/.zshrc)
eval "$(zoxide init zsh)"
```

## 📝 代码编辑器

### VS Code 配置
```json
{
  "editor.fontSize": 14,
  "editor.fontFamily": "'JetBrains Mono', monospace",
  "editor.tabSize": 2,
  "editor.wordWrap": "on",
  
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  
  "workbench.colorTheme": "One Dark Pro",
  
  "terminal.integrated.shellIntegration.enabled": true
}
```

### 必备扩展
- ESLint - 代码检查
- Prettier - 代码格式化
- GitLens - Git 可视化
- Docker - 容器支持
- Remote SSH - 远程开发

## 🐳 容器环境

### Docker Desktop
```bash
# 安装
brew install --cask docker

# 配置镜像加速
# Docker Desktop -> Preferences -> Docker Engine
{
  "registry-mirrors": [
    "https://docker.mirrors.ustc.edu.cn"
  ]
}
```

## 🔧 Git 配置

```bash
# 基本配置
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# 常用别名
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.st status
git config --global alias.last 'log -1 HEAD'

# 智能合并
git config --global pull.rebase false
```

## 📦 语言环境

### Python (pyenv)
```bash
# 安装
brew install pyenv

# 配置
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# 使用
pyenv install 3.11.0
pyenv global 3.11.0
```

### Node.js (nvm)
```bash
# 安装
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# 使用
nvm install --lts
nvm use --lts
```

## 🔐 SSH 配置

```bash
# 生成 SSH 密钥
ssh-keygen -t ed25519 -C "your@email.com"

# 添加到 SSH Agent
ssh-add ~/.ssh/id_ed25519

# 配置 ~/.ssh/config
Host github
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519
```

## 💡 配置备份建议

使用 dotfiles 管理配置：
```bash
# 常用工具
chezmoi - 配置管理
yadm - 另一个配置管理工具
GNU Stash - 简单备份
```

## 🔗 资源链接

- [Homebrew](https://brew.sh)
- [Oh My Zsh](https://ohmyz.sh)
- [VS Code](https://code.visualstudio.com)
- [Docker](https://www.docker.com)

---

*好的环境配置一次，效率提升每一天！*
