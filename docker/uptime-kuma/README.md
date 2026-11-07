# Self-Hosted Uptime Kuma with Secure Docker Socket Proxy

Production-hardened Uptime Kuma deployment paired with a read-only Docker socket proxy for real-time homelab container monitoring, public status pages, and instant Telegram/Discord alerting without exposing the root Docker daemon socket.

Full step-by-step walkthrough: [Self-Host Uptime Kuma in Docker (TechLoverHD)](https://techloverhd.com/2026/11/self-host-uptime-kuma-docker-guide/)

## Features
- **Isolated Network Architecture:** Containers communicate over a dedicated bridge network (`monitoring-net`).
- **Restricted Socket Exposure:** `tecnativa/docker-socket-proxy` restricts Docker API access to container read-only calls (`CONTAINERS=1`, `POST=0`).
- **Security Hardening:** Enforces `no-new-privileges:true` and binds ports strictly to `127.0.0.1`.

## Quick Start

1. Create persistent storage directory:
   ```bash
   sudo mkdir -p /opt/uptime-kuma/data
   sudo chown -R 1000:1000 /opt/uptime-kuma/data
   ```

2. Start the stack:
   ```bash
   docker compose up -d
   ```

3. Route through your reverse proxy (such as Nginx Proxy Manager or Traefik) with WebSocket support enabled to access the web UI at `http://127.0.0.1:3001`.
