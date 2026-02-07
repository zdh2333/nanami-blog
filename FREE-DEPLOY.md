# 🆓 免费域名 + HTTPS 配置方案

## ❌ 当前问题
免费隧道 (serveo.net) SSL 不被信任，会显示警告。

## ✅ 免费解决方案

### 方案一：TryCloudflare (最推荐 - 免费临时)

```bash
# 安装
brew install cloudflare/tap/cloudflared

# 启动 (自动分配子域名)
cloudflared tunnel --url http://localhost:8080
```

**优点**: 免费、快速、无需登录
**缺点**: 子域名随机、会变

**示例**: `https://random-name.trycloudflare.com`

### 方案二：DuckDNS (免费子域名)

1. 访问 https://duckdns.org
2. 注册账号
3. 创建子域名 (如 `nanami.duckdns.org`)
4. 记下 Token

5. 配置:
```bash
brew install duckdns

# 创建配置文件
echo "TOKEN=你的token" > ~/.duckdns.conf
duckdns nanami
```

**优点**: 永久免费子域名
**缺点**: 仍需要配合 Cloudflare Tunnel 才能有 SSL

### 方案三：GitHub Pages (完全免费)

```bash
# 静态页面可以直接部署
cd ~/.openclaw/workspace/nanami-blog/public
# 推送到 GitHub 仓库
# 开启 GitHub Pages
```

**优点**: 免费 + HTTPS + 自定义域名支持
**缺点**: 每次更新需要重新部署

---

## 📋 推荐操作

### 立即可用 (当前)
- ❌ 有警告: https://951f9ca4eeac9d6b-219-104-165-168.serveousercontent.com

### 方案一: TryCloudflare (30秒配置)
```bash
cloudflared tunnel --url http://localhost:8080
```

### 方案三: GitHub Pages (推荐长期)
1. 创建 GitHub 仓库
2. 推送博客文件
3. 开启 Pages
4. 获得: https://你的用户名.github.io/nanami-blog

---

## 💡 建议

如果只是**测试**，当前方案够用。

如果想要**长期稳定**+**无警告**：
- 方案三: GitHub Pages (完全免费)
- 购买域名 ($5/年) + Cloudflare (免费)

