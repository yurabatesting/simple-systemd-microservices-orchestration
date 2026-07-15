#!/bin/bash
echo "Menjalankan Web API Service..."

# Simulasi upaya pelanggaran keamanan (akan digagalkan oleh systemd)
touch /etc/hacked.txt 2>/dev/null || echo "Akses ke /etc ditolak (ProtectSystem bekerja!)"

# Simulasi penulisan ke /tmp yang terisolasi
touch /tmp/web-session.log
echo "Menulis ke /tmp lokal berhasil (PrivateTmp bekerja!)"

while true; do sleep 5; done
