# SimpleX Chat Self-Hosted Relay Stack (SMP, XFTP & ntfy UnifiedPush)

[![SimpleX Chat](https://img.shields.io/badge/SimpleX_Chat-v7.1.4-emerald.svg)](https://github.com/simplex-chat/simplex-chat)
[![Docker Compose](https://img.shields.io/badge/Docker_Compose-Hardened-blue.svg)](docker-compose.yml)
[![Canonical Guide](https://img.shields.io/badge/Guide-TechLoverHD.com-orange.svg)](https://techloverhd.com/2026/11/simplex-chat-setup-without-user-ids/)

Production-hardened, zero-trust Docker Compose configuration for hosting your own private **SimpleX Messaging Protocol (SMP)** relay, **XFTP chunked file transfer server**, and companion **ntfy UnifiedPush distributor** on Ubuntu 24.04 LTS / Debian 12.

For full architectural deep dive, binary verification, Tor SOCKS5 routing, and Android Doze battery benchmarks, read the canonical guide:
👉 **[SimpleX Chat Setup: Private Messaging Without User IDs & SMP Guide](https://techloverhd.com/2026/11/simplex-chat-setup-without-user-ids/)**

---

## Architecture Overview

```text
[Client Device] --- TLS 1.3 (Port 5223) ---> [simplexchat/smp-server]  --> Unidirectional SMP Queues
[Client Device] --- TLS 1.3 (Port 443)  ---> [simplexchat/xftp-server] --> Encrypted 16KB-4MB Chunks
[Android Phone] <--- WebSockets (Port 80) -- [binwiederhier/ntfy]      <-- UnifiedPush Notifications
```

- **SMP Server (`simplexchat/smp-server:v7.1.4`):** Manages unidirectional, isolated message queues. Ciphertext is deleted immediately upon client delivery.
- **XFTP Server (`simplexchat/xftp-server:v7.1.4`):** Stores chunked end-to-end encrypted attachments up to 1GB with automatic 48-hour expiration.
- **ntfy (`binwiederhier/ntfy:v2.11.0`):** Self-hosted UnifiedPush distributor bound to loopback behind a TLS reverse proxy.

---

## 1. Prerequisites & DNS Configuration

Configure DNS `A` and `AAAA` records pointing to your server's public IP:
- `smp.example.com`
- `xftp.example.com`
- `ntfy.example.com` (if running companion UnifiedPush)

Open firewall ports:
```bash
sudo ufw allow 5223/tcp comment "SimpleX SMP Relay"
sudo ufw allow 443/tcp comment "SimpleX XFTP File Relay"
sudo ufw reload
```

---

## 2. Directory Structure & Environment Setup

```bash
mkdir -p ~/simplex-relay/{smp/{config,logs},xftp/{config,logs,files},ntfy/{cache,lib}}
cd ~/simplex-relay

# Copy template and create production .env
cp .env.example .env
chmod 600 .env
```

Edit `.env` and set high-entropy alphanumeric passwords (minimum 24 characters without `@`, `:`, `/`, or `?`).

---

## 3. Deploy Stack

```bash
docker compose up -d
docker compose ps
```

---

## 4. Extract Server Addresses

SimpleX embeds server TLS certificate fingerprints directly into the connection URIs. Extract your addresses from startup logs:

```bash
# Extract SMP address
docker compose logs smp-server | grep -E "Server address:|smp://"

# Extract XFTP address
docker compose logs xftp-server | grep -E "Server address:|xftp://"
```

Copy the outputs:
- `smp://<fingerprint>:<password>@smp.example.com`
- `xftp://<fingerprint>:<password>@xftp.example.com`

---

## 5. Client Configuration (Android / Linux)

1. In SimpleX Chat, open **Settings > Network & servers > Your servers > Add your own server**.
2. Paste both your `smp://` and `xftp://` addresses.
3. Tap **Test servers** to confirm TLS handshake and fingerprint verification succeed.
4. Optionally disable preset public community relays for new contacts.

---

## 6. Operational Security: Offline CA Key Hardening

After the containers initialize and create their self-signed TLS certificates:
```bash
# Backup CA private keys offline
cp ./smp/config/ca.key /path/to/encrypted/offline/backup/
cp ./xftp/config/ca.key /path/to/encrypted/offline/backup/

# Remove CA keys from the live host so VPS compromise cannot forge certificates
rm -f ./smp/config/ca.key ./xftp/config/ca.key
```

---

## License

MIT License. Maintained by [TechLoverHD](https://techloverhd.com).
