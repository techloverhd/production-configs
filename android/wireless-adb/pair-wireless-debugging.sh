#!/usr/bin/env bash
# Wireless ADB Pairing Helper
# Usage: ./pair-wireless-debugging.sh <PHONE_IP> <PAIRING_PORT> <PAIRING_CODE> <CONNECT_PORT>

set -eo pipefail

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <PHONE_IP> <PAIRING_PORT> <PAIRING_CODE> [CONNECT_PORT]"
    echo "Example: $0 192.168.1.50 37123 123456 41235"
    exit 1
fi

PHONE_IP="$1"
PAIRING_PORT="$2"
PAIRING_CODE="$3"
CONNECT_PORT="${4:-$PAIRING_PORT}"

echo "[+] Initiating wireless pairing with ${PHONE_IP}:${PAIRING_PORT}..."
echo "${PAIRING_CODE}" | adb pair "${PHONE_IP}:${PAIRING_PORT}"

echo "[+] Connecting to ADB session on ${PHONE_IP}:${CONNECT_PORT}..."
adb connect "${PHONE_IP}:${CONNECT_PORT}"

echo "[+] Connected devices:"
adb devices
