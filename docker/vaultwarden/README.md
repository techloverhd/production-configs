# Self-Hosted Vaultwarden with Cloudflare R2 Restic Backups

Lightweight, fully compatible Bitwarden password vault written in Rust, paired with automated encrypted incremental backups to Cloudflare R2 using Restic.

Full step-by-step walkthrough: [Vaultwarden in Docker with Automated Restic Backups (TechLoverHD)](https://techloverhd.com/2026/10/vaultwarden-docker-restic-cloudflare-r2-backup/)

## Quick Start

1. Start Vaultwarden:
   ```bash
   docker compose up -d
   ```
2. Configure your reverse proxy (e.g. Nginx Proxy Manager) to provide HTTPS.
3. Configure `backup-restic.sh.example` with your Cloudflare R2 credentials and schedule via cron:
   ```bash
   0 3 * * * /home/user/vaultwarden/backup-restic.sh >> /var/log/vw-backup.log 2>&1
   ```
