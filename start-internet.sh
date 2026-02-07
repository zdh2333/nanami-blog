#!/bin/bash

echo "=========================================="
echo "  🌍 Nanami Blog 公网访问配置"
echo "=========================================="
echo ""

# 检查 cloudflared
if ! command -v cloudflared &> /dev/null; then
    echo "📦 安装 cloudflared..."
    brew install cloudflare/tap/cloudflared
fi

echo ""
echo "🚀 启动公网隧道..."
echo ""

# 启动 cloudflared tunnel
# 注意: 需要先登录 cloudflared
# 运行: cloudflared tunnel login

echo "=========================================="
echo ""
echo "⚠️  首次使用需要登录:"
echo ""
echo "   1. 运行: cloudflared tunnel login"
echo "      (会打开浏览器，请登录 Cloudflare)"
echo ""
echo "   2. 创建隧道:"
echo "      cloudflared tunnel create nanami-blog"
echo ""
echo "   3. 配置域名 (在 Cloudflare Dashboard):"
echo "      - 添加 CNAME 记录"
echo "      - 指向你的 tunnel ID"
echo ""
echo "=========================================="
echo ""
echo "🔧 快速启动 (无需登录):"
echo ""
echo "   使用 Cloudflare Quick Tunnel (临时):"
echo "   cloudflared tunnel --url http://localhost:8080"
echo ""
echo "   这会生成一个临时 URL，如:"
echo "   https://random-name.trycloudflare.com"
echo ""
echo "=========================================="
echo ""

# 检查是否有 tunnel 配置
if [ -f ~/.cloudflared/config.yml ]; then
    echo "✅ 检测到现有隧道配置"
    echo "   启动隧道..."
    cloudflared tunnel run nanami-blog
else
    echo "📝 启动临时隧道..."
    cloudflared tunnel --url http://localhost:8080
fi
