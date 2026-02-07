#!/bin/bash

echo "=========================================="
echo "  🐱‍💻 Nanami Blog 快速启动"
echo "=========================================="
echo ""

# 方案1: 静态 HTML (最快)
echo "🚀 启动静态 HTML 版本..."
nohup python3 -m http.server 8080 > /dev/null 2>&1 &
echo "✅ 静态版已启动!"
echo "   📍 http://localhost:8080"
echo ""

# 方案2: PM2 启动 (生产模式)
echo "▶️ 或者使用 PM2 启动生产版本..."
echo "   pm2 start ecosystem.config.js"
echo ""

echo "=========================================="
echo ""
echo "🎯 下一步配置:"
echo "   1. 配置域名和 HTTPS"
echo "   2. 使用 PM2 部署"
echo "   3. 配置 Nginx 反向代理"
echo ""
echo "📄 相关文件:"
echo "   - deploy-https.sh (HTTPS 配置)"
echo "   - quick-start.sh (快速启动)"
echo "   - REFERENCES.md (参考项目)"
echo ""
echo "🎉 博客已上线！"
