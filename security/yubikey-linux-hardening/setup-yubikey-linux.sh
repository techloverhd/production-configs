#!/usr/bin/env bash
# ==============================================================================
# YubiKey 5 Series & Security Key Setup Script for Ubuntu 24.04+ LTS
# Tested Baseline: Ubuntu 24.04 (Kernel 6.8+), Firmware 5.8
# Canonical Guide: https://techloverhd.com/2026/11/best-yubikey-for-android-and-linux/
# ==============================================================================
set -euo pipefail

echo "[+] Updating package indices..."
sudo apt update

echo "[+] Installing core YubiKey, Smart Card, and PAM packages..."
sudo apt install -y \
  yubikey-manager \
  libpam-u2f \
  pamu2fcfg \
  pcscd \
  libyubikey-udev \
  libfido2-1 \
  fido2-tools \
  keepassxc

echo "[+] Starting and enabling PC/SC Smart Card daemon..."
sudo systemctl enable --now pcscd

echo "[+] Verifying connected YubiKey hardware and firmware..."
ykman info || echo "[!] No YubiKey detected in USB port. Insert key and re-run 'ykman info'."

echo "[+] YubiKey Linux toolchain setup complete."
