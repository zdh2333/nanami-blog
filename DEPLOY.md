# 🌐 域名配置指南

## 问题说明

### ⚠️ 危险警告
免费隧道 (serveo.net) 的 SSL 证书不受浏览器信任，所以会显示警告。

### 🔧 解决方案

#### 方案一：使用 Cloudflare Tunnel (推荐)

1. **购买域名** (如 nanami.site)
   - 在阿里云/腾讯云/Namecheap 购买

2. **配置 Cloudflare**
   - 将域名的 DNS 指向 Cloudflare
   - 开启 "Proxy" 状态

3. **安装 Cloudflare Tunnel**
   ```bash
   brew install cloudflare/tap/cloudflared
   cloudflared tunnel login
   cloudflared tunnel create nanami-blog
   ```

4. **创建配置文件**
   ```bash
   mkdir ~/.cloudflared
   cat > ~/.cloudflared/config.yml << 'YML'
   tunnel: nanami-blog
   credentials-file: /Users/macmima1234/.cloudflared/XXXX-uuid.json
   
   ingress:
     - hostname: nanami.site
       service: http://localhost:8080
     - service: http_status:404
   YML
   ```

5. **添加 DNS 记录**
   ```bash
   cloudflared tunnel route dns nanami-blog nanami.site
   ```

6. **启动**
   ```bash
   cloudflared tunnel run nanami-blog
   ```

#### 方案二：购买 VPS + Nginx (专业方案)

1. 购买 VPS (如 DigitalOcean, Vultr)
2. 安装 Nginx + Let's Encrypt
3. 配置域名指向 VPS IP
4. 使用 certbot 获取 SSL 证书

### 📋 当前状态

- ✅ 本地访问: http://localhost:8080
- ⚠️ 公网: https://951f9ca4eeac9d6b-219-104-165-168.serveousercontent.com (有警告)
- ⏳ 自定义域名: 待配置

### 💰 费用

- 域名: $5-15/年
- VPS: $5/月起
- SSL: 免费 (Let's Encrypt)

