# Systemd Microservices Orchestration

Proyek ini adalah *Proof of Concept* (PoC) untuk mendemonstrasikan bagaimana mengorkestrasi, membatasi, dan mengamankan *microservices* secara *native* di Linux menggunakan fitur-fitur lanjutan dari **systemd**, tanpa menggunakan container (seperti Docker).

## 🚀 Fitur Utama

1. **Dependency & Ordering:** Memastikan layanan berjalan dengan urutan yang benar (`After=`) dan memiliki ketergantungan yang ketat (`BindsTo=`). Jika DB mati, Web otomatis mati.
2. **Resource Management (cgroups v2):** Pembatasan RAM absolut (`MemoryMax`) dan kuota CPU (`CPUQuota`) per layanan untuk mencegah *resource exhaustion* / OOM.
3. **Auto-Healing:** Mekanisme *restart* otomatis dengan *Exponential Backoff* untuk mencegah lonjakan CPU saat terjadi *crash loop*.
4. **Security Hardening (Sandboxing):** 
   - `ProtectSystem=strict`: Membuat file sistem utama OS menjadi *read-only*.
   - `PrivateTmp=yes`: Menyediakan direktori `/tmp` tersendiri yang terisolasi.
   - `NoNewPrivileges=yes`: Mencegah eskalasi hak akses (mencegah akses *root*).

## 📂 Struktur Direktori

```text
systemd-microservices/
├── scripts/
│   ├── cache-start.sh    # Mock script untuk Cache (Redis)
│   ├── db-start.sh       # Mock script untuk Database (PostgreSQL)
│   └── web-start.sh      # Mock script untuk Web API (Node.js/Go)
└── systemd-units/
    ├── my-cache.service  # Systemd unit untuk Cache
    ├── my-db.service     # Systemd unit untuk Database
    └── my-web.service    # Systemd unit untuk Web API (terikat ke Cache & DB)
