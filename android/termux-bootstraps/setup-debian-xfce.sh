#!/data/data/com.termux/files/usr/bin/bash
# Bootstrap Debian XFCE4 desktop inside Termux
set -eo pipefail

echo "[+] Updating Termux package repositories..."
pkg update -y && pkg upgrade -y

echo "[+] Installing proot-distro, x11-repo, and pulseaudio..."
pkg install -y proot-distro x11-repo pulseaudio tigervnc

echo "[+] Installing Debian rootfs via proot-distro..."
proot-distro install debian

echo "[+] Configuring desktop environment inside Debian..."
proot-distro login debian -- bash -c "
apt update -y && apt upgrade -y
apt install -y xfce4 xfce4-terminal dbus-x11 sudo nano
useradd -m -s /bin/bash user || true
echo 'user:termux' | chpasswd
usermod -aG sudo user
"

echo "[+] Desktop installation complete. Start VNC with: vncserver :1"
