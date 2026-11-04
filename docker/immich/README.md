# Self-Hosted Immich (Google Photos Alternative)

High-performance, self-hosted photo and video backup solution with hardware-accelerated GPU transcoding, facial recognition, and machine learning search.

Full step-by-step walkthrough: [Self-Host Immich in Docker with GPU Transcoding (TechLoverHD)](https://techloverhd.com/2026/10/self-host-immich-docker-gpu-transcoding-guide/)

## Quick Start

1. Copy the environment template:
   ```bash
   cp .env.example .env
   ```
2. Set secure database passwords and verify your upload directory paths in `.env`.
3. Launch the complete stack:
   ```bash
   docker compose up -d
   ```
4. Access the web interface at `http://<your-server-ip>:2283` to create the initial admin user.
