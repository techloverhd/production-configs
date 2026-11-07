# Zero-Downtime Docker Nginx Deployments (Eliminate 502 Gateway Errors)

Production zero-downtime deployment pipeline for Dockerized Next.js, Astro, and static web applications behind Nginx and Cloudflare. 

Replaces disruptive `docker restart` cold-boots with isolated staging builds (`out/`), atomic POSIX directory swaps via `rsync --delay-updates`, and sub-5ms graceful in-place Nginx worker reloads.

Full step-by-step walkthrough: [Zero-Downtime Docker Nginx Deployments (TechLoverHD)](https://techloverhd.com/2026/11/zero-downtime-docker-nginx-deployment-guide/)

## Why Traditional Deployments Fail
1. **Wiped Web Roots:** Static generators delete `out/` when `npm run build` begins, causing 404s for 15 to 45 seconds.
2. **Dropped TCP Sockets:** Running `docker restart` sends `SIGTERM` to PID 1, breaking reverse proxy connections (Traefik, NPM, EasyEngine) and taking 30 to 90 seconds for health checks to recover.
3. **Cloudflare Cache Purge Collisions:** Running `purge_everything: true` while origin restarts forces 100% of visitor traffic to an offline origin, returning Cloudflare 502 screens.

## Directory Structure
```text
.
├── docker-compose.yml
├── live_out/              # Production web root mounted read-only into container
├── out/                   # Staging build folder where framework compiles
├── nginx/
│   └── conf.d/
│       └── default.conf   # Production Nginx caching & security headers
└── scripts/
    ├── deploy.py          # Atomic zero-downtime deployment orchestrator
    └── benchmark.py       # Continuous 10 req/sec traffic hammer test
```

## Quick Start

1. Seed the production export directory and launch the container:
   ```bash
   mkdir -p live_out nginx/conf.d
   rsync -a out/ live_out/
   docker compose up -d
   ```

2. Run automated deployments via Python:
   ```bash
   python3 scripts/deploy.py
   ```
