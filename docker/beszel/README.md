# Self-Hosted Beszel Server & Hardware Monitoring Stack

Production-hardened Beszel v0.21.2 Hub and Agent deployment for lightweight Linux server metrics, per-container Docker telemetry, NVIDIA NVML RTD3 power tracking, Intel Arc/Xe QuickSync video engines, S.M.A.R.T. disk diagnostics, and Shoutrrr webhook alerting.

Full step-by-step walkthrough: [Self-Host Beszel in Docker: Server, GPU & S.M.A.R.T. Monitoring (TechLoverHD)](https://techloverhd.com/2026/11/self-host-beszel-docker-server-monitoring/)

## Features
- **Minimal Resource Footprint:** Hub runs on PocketBase SQLite in 22 to 32 MB of RAM; agent consumes 10 to 15 MB.
- **Hardened Socket Transport:** Local hub-to-agent polling uses a shared Unix domain socket (`/beszel_socket/beszel.sock`) with zero exposed TCP ports on the host.
- **Zero-Penalty GPU Polling:** `GPU_COLLECTOR=nvml` queries NVIDIA Management Library directly, preserving low-wattage PCIe RTD3 P8 sleep states.
- **Hardware S.M.A.R.T. & ZFS:** Bundles `smartctl` and OpenZFS utilities in `:alpine` and GPU tags for automated wear and degraded pool alerts.

## Quick Start

1. Create persistent storage directory:
   ```bash
   sudo mkdir -p /opt/beszel/beszel_data /opt/beszel/beszel_socket
   sudo chown -R "$USER":"$USER" /opt/beszel
   ```

2. Start the Hub:
   ```bash
   docker compose up -d beszel
   ```

3. Open `http://127.0.0.1:8090` (or via reverse proxy with WebSockets enabled), create your admin account, copy the Ed25519 Public Key and Token into `.env`, and start the local agent:
   ```bash
   docker compose up -d beszel-agent
   ```
