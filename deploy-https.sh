#!/bin/bash

# Nanami Blog HTTPS 配置脚本
# 使用 Let's Encrypt 免费证书

DOMAIN="${1:-blog.yourdomain.com}"
EMAIL="${2:-your@email.com}"

echo "🚀 配置 HTTPS for $DOMAIN"

# 检查是否安装了 certbot
if ! command -v certbot &> /dev/null; then
    echo "📦 安装 certbot..."
    brew install certbot
fi

# 停止当前服务
echo "⏹️ 停止服务..."
pm2 stop nanami-blog || true

# 获取证书
echo "🔒 获取 SSL 证书..."
certbot certonly --standalone \
    -d $DOMAIN \
    --email $EMAIL \
    --agree-tos \
    --non-interactive || {
    echo "❌ 证书获取失败，请检查域名解析"
    exit 1
}

# 配置 Nginx 反向代理
cat > /tmp/nanami-blog-nginx.conf << EOF
server {
    listen 80;
    server_name $DOMAIN;
    return 301 https://\$server_name\$request_uri;
}

server {
    listen 443 ssl http2;
    server_name $DOMAIN;
    
    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;
    
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256;
    ssl_prefer_server_ciphers off;
    
    add_header Strict-Transport-Security "max-age=63072000" always;
    
    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF

echo "📝 Nginx 配置已创建: /tmp/nanami-blog-nginx.conf"
echo ""
echo "✅ HTTPS 配置完成！"
echo ""
echo "📋 下一步:"
echo "   1. 将 Nginx 配置复制到 /usr/local/etc/nginx/servers/nanami-blog.conf"
echo "   2. 运行: sudo nginx -t && sudo nginx -s reload"
echo "   3. 启动服务: pm2 start nanami-blog"
echo ""
echo "🔄 证书续期:"
echo "   certbot renew --quiet"
echo "   添加到 crontab: 0 0 * * * certbot renew --quiet"
