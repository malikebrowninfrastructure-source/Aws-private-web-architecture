#!/usr/bin/env bash
set -euo pipefail

# nginx-install.sh
# Goal: Install + start nginx safely on Amazon Linux / RHEL-like systems.

if [[ $EUID -ne 0 ]]; then
echo "Run as root (sudo)."
exit 1
fi

echo "[*] Checking OS..."
if ! command -v yum >/dev/null 2>&1; then
echo "This script expects yum (Amazon Linux / RHEL family). Exiting."
exit 2
fi

echo "[*] Installing nginx (if missing)..."
if ! rpm -q nginx >/dev/null 2>&1; then
yum install -y nginx
else
echo "nginx already installed."
fi

echo "[*] Enabling + starting nginx..."
systemctl enable nginx
systemctl restart nginx

echo "[*] Validating nginx service..."
systemctl --no-pager --full status nginx | head -n 20

echo "[*] Validating port 80 is listening..."
ss -tulpn | grep -E ':80\b' || {
echo "ERROR: Port 80 not listening."
exit 3
}

echo "[*] Validating HTTP response..."
curl -fsS http://127.0.0.1/ >/dev/null && echo "OK: NGINX responding on localhost"

