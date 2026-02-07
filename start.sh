#!/bin/bash

echo "🚀 启动 Nanami Blog..."

# 安装依赖
echo "📦 安装依赖..."
npm install

# 构建
echo "🔨 构建项目..."
npm run build

# 启动
echo "▶️ 启动服务..."
pm2 restart nanami-blog || pm2 start ecosystem.config.js

echo ""
echo "✅ 博客已启动!"
echo "   本地: http://localhost:3000"
echo ""
echo "📊 PM2 状态:"
pm2 monit
