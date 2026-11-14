# TechLoverHD Production Configs & Homelab Stacks

[![License: MIT](https://img.shields.io/badge/License-MIT-emerald.svg)](LICENSE)
[![Tested On](https://img.shields.io/badge/Hardware-Late%202026%20Baseline-blue.svg)](https://techloverhd.com)
[![Canonical Docs](https://img.shields.io/badge/Guides-TechLoverHD.com-orange.svg)](https://techloverhd.com)

Production-hardened, real-hardware-verified configurations, Docker Compose templates, Android power-user scripts, and local AI benchmarks published by [TechLoverHD](https://techloverhd.com).

Every configuration in this repository is actively tested on physical hardware:
- **Server:** Ubuntu 24.04 LTS (Kernel 6.8+), Docker Engine 27+, OpenResty / Nginx.
- **Mobile Hardware:** Samsung Galaxy S25 Ultra (Snapdragon 8 Elite, 12GB RAM, 1TB Storage, One UI 9 / Android 16-17) and Google Pixel (GrapheneOS).

---

## Repository Index

### 1. Docker Homelab Stacks (`/docker`)
| Stack | Primary Components | Canonical Step-by-Step Guide |
| :--- | :--- | :--- |
| [`headscale`](docker/headscale) | Headscale v0.23+ mesh VPN server, DERP routing | [Headscale Docker Setup Guide](https://techloverhd.com/2026/10/self-host-headscale-docker-tailscale-vpn-guide/) |
| [`immich`](docker/immich) | Immich, PostgreSQL + pgvector, Redis, Machine Learning | [Immich GPU Transcoding Guide](https://techloverhd.com/2026/10/self-host-immich-docker-gpu-transcoding-guide/) |
| [`open-webui-ollama`](docker/open-webui-ollama) | Open WebUI, Ollama daemon, SearXNG privacy search | [Private ChatGPT Docker Guide](https://techloverhd.com/2026/10/self-host-open-webui-ollama-searxng-docker-guide/) |
| [`vaultwarden`](docker/vaultwarden) | Vaultwarden, Cloudflare R2 automated Restic backups | [Vaultwarden Restic Backup Guide](https://techloverhd.com/2026/10/vaultwarden-docker-restic-cloudflare-r2-backup/) |
| [`nginx-proxy-manager`](docker/nginx-proxy-manager) | NPM, SQLite / MariaDB, automated Let's Encrypt SSL | [Nginx Proxy Manager Guide](https://techloverhd.com/2026/11/self-host-nginx-proxy-manager-docker-guide/) |
| [`nextcloud-aio`](docker/nextcloud-aio) | Nextcloud All-in-One mastercontainer, Redis, Postgres | [Nextcloud AIO Docker Guide](https://techloverhd.com/2026/10/self-host-nextcloud-aio-docker-guide/) |
| [`uptime-kuma`](docker/uptime-kuma) | Uptime Kuma v2.5+, non-root Docker socket proxy | [Uptime Kuma Docker Setup Guide](https://techloverhd.com/2026/11/self-host-uptime-kuma-docker-guide/) |
| [`zero-downtime-nginx`](docker/zero-downtime-nginx) | Nginx 1.27 Alpine, atomic rsync directory swaps, graceful reloads | [Zero-Downtime Docker Nginx Guide](https://techloverhd.com/2026/11/zero-downtime-docker-nginx-deployment-guide/) |

---

### 2. Android Power-User Utilities (`/android`)
| Tool / Utility | Scope & Features | Canonical Step-by-Step Guide |
| :--- | :--- | :--- |
| [`debloat-lists`](android/debloat-lists) | Safe Canta / Shizuku debloat lists for Samsung & Pixel | [Rootless Android Debloat Guide](https://techloverhd.com/2026/10/debloat-android-phone-without-root-pc/) |
| [`wireless-adb`](android/wireless-adb) | Non-root Wi-Fi ADB pairing script for Shizuku & term | [Shizuku Wireless Debugging Guide](https://techloverhd.com/2026/10/shizuku-apk-download-wireless-debugging-setup-guide/) |
| [`termux-bootstraps`](android/termux-bootstraps) | Proot-distro Debian + XFCE desktop environment via VNC | [Termux Linux Desktop Guide](https://techloverhd.com/2026/10/termux-apk-download-install-linux-desktop-android-guide/) |

---

### 3. Local AI & VRAM Benchmarks (`/ai-benchmarks` & `/ai`)
| Benchmark Sheet / Stack | Coverage | Canonical Step-by-Step Guide |
| :--- | :--- | :--- |
| [`cline-ollama`](ai/cline-ollama) | Custom 32K context Modelfile, systemd Flash Attention overrides & .clinerules | [Cline + Ollama Local AI Coding Agent Guide](https://techloverhd.com/2026/11/cline-ollama-local-ai-agent-guide/) |
| [`vram-math-quantization-matrix.md`](ai-benchmarks/vram-math-quantization-matrix.md) | DeepSeek-R1 & Llama 3 VRAM formulas (Q4_K_M vs Q8 vs FP16) | [Local LLM VRAM Math Guide](https://techloverhd.com/2026/10/run-deepseek-r1-llama-3-locally-vram-ollama-guide/) |
| [`snapdragon-npu-benchmarks.md`](ai-benchmarks/snapdragon-npu-benchmarks.md) | Snapdragon 8 Elite tokens/sec via PocketPal AI (GGUF) | [Run Local AI on Android Guide](https://techloverhd.com/2026/10/run-local-ai-android-apk-pocketpal-offline-guide/) |

---

## Contributing & Issues

Feel free to open an issue or submit a pull request if you encounter version bumps or upstream configuration schema changes. 

All documentation is maintained according to the [TechLoverHD Editorial Protocol](https://techloverhd.com).
