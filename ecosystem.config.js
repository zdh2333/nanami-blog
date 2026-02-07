module.exports = {
  apps: [{
    name: 'nanami-blog',
    script: 'node_modules/next/dist/bin/next',
    args: 'start',
    cwd: '/Users/macmima1234/.openclaw/workspace/nanami-blog',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '500M',
    env: {
      NODE_ENV: 'production',
      PORT: 3000,
      HOST: '0.0.0.0'
    }
  }]
}
