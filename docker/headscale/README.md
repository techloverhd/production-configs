# Self-Hosted Headscale (Tailscale Mesh VPN)

Production Headscale mesh coordination server deployment with SQLite/PostgreSQL storage, custom DERP relays, and zero-trust ACL policies.

Full step-by-step walkthrough: [Self-Hosting Headscale in Docker Guide (TechLoverHD)](https://techloverhd.com/2026/10/self-host-headscale-docker-tailscale-vpn-guide/)

## Quick Start

1. Create directories and grab the configuration template:
   ```bash
   mkdir -p config data
   cp config.yaml.example config/config.yaml
   ```
2. Edit `config/config.yaml` to set your public domain name (`server_url`).
3. Launch the container:
   ```bash
   docker compose up -d
   ```
4. Create your first namespace and user:
   ```bash
   docker exec -it headscale headscale users create admin
   ```
