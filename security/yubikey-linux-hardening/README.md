# YubiKey & FIDO2 Linux Hardening (Ubuntu 24.04 LTS Baseline)

Tested on Ubuntu 24.04 LTS (Kernel 6.8+), YubiKey 5 Series (Firmware 5.8), and Security Key Series (Firmware 5.8).

Complete engineering walkthrough: [Best YubiKey for Android and Linux (2026 Homelab Guide)](https://techloverhd.com/2026/11/best-yubikey-for-android-and-linux/)

---

## Overview

This directory provides verified production scripts and configuration templates to secure an Ubuntu workstation or server with physical YubiKey authentication:

1. **`setup-yubikey-linux.sh`**: Installs native `.deb` packages for YubiKey Manager (`ykman`), PAM U2F modules (`libpam-u2f`, `pamu2fcfg`), smart card daemons (`pcscd`), and KeePassXC.
2. **`sudo_pam.conf`**: Configures hardware 2FA enforcement for root/sudo elevation via `pam_u2f.so` with visual touch cue prompts (`cue`) and origin binding (`pam://yubi-sudo`).
3. **`sshd_fido_config`**: Production drop-in configuration for OpenSSH to mandate FIDO2 hardware resident keys (`ssh-keygen -t ed25519-sk`).

---

## 1. Fast Setup

Make the setup script executable and run:

```bash
chmod +x setup-yubikey-linux.sh
./setup-yubikey-linux.sh
```

---

## 2. PAM Sudo Hardware 2FA

Generate the primary key enrollment mapping:

```bash
mkdir -p ~/.config/Yubico
pamu2fcfg -N -o pam://yubi-sudo > ~/.config/Yubico/u2f_keys
```

Enroll your backup key:

```bash
pamu2fcfg -N -o pam://yubi-sudo -n >> ~/.config/Yubico/u2f_keys
```

Edit `/etc/pam.d/sudo` and place this line directly above `@include common-auth`:

```pam
auth       required   pam_u2f.so origin=pam://yubi-sudo cue
```

Test in a separate terminal:

```bash
sudo -k && sudo echo "YubiKey PAM auth succeeded"
```

---

## 3. OpenSSH FIDO2 Hardware Resident Key

Generate a non-resident or resident hardware key on your client machine:

```bash
ssh-keygen -t ed25519-sk -C "workstation-yk-primary" -f ~/.ssh/id_ed25519_sk_primary
```

Copy the public key to the remote server:

```bash
ssh-copy-id -i ~/.ssh/id_ed25519_sk_primary.pub sysadmin@YOUR_SERVER_IP
```

Install `sshd_fido_config` into `/etc/ssh/sshd_config.d/50-fido-hardening.conf` and reload sshd:

```bash
sudo systemctl reload ssh
```
