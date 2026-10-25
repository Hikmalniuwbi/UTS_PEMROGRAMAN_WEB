# Rekap Nilai Data Mahasiswa - Template AdminLTE 4
> **Tugas / Ujian Tengah Semester (UTS) - Pemrograman Web**  
> Implementasi Sistem Pengelolaan dan Rekapitulasi Nilai Mahasiswa Berbasis Web dengan Kustomisasi Template **AdminLTE 4**, PHP Native, dan Database MySQL.

---

## 📌 Deskripsi Proyek
Proyek ini merupakan aplikasi web rekapitulasi nilai mahasiswa yang dikembangkan menggunakan framework antarmuka **AdminLTE 4** berbasis **Bootstrap 5**. Aplikasi ini dilengkapi dengan fitur pengelolaan data nilai akademik mahasiswa secara dinamis, mulai dari perhitungan nilai otomatis (konversi nilai angka ke huruf dan predikat), pembacaan foto mahasiswa, pencarian instan (nama dan predikat), pengurutan nilai akhir, hingga sistem pagination yang fleksibel.

---

## ✨ Fitur-Fitur Utama

### 1. Pembacaan Data Foto Mahasiswa
- **Penyimpanan Path Foto:** Menambahkan kolom `file_path VARCHAR(255)` pada tabel `nilaimhsw` untuk mencatat lokasi penyimpanan file foto profil mahasiswa.
- **Tampilan Foto di Kolom Nama:** Foto mahasiswa berukuran thumbnail/avatar bulat (36x36 px) ditampilkan berdampingan dengan Nama Mahasiswa pada kolom yang sama (**Nama Mahasiswa**).
- **Fallback Image:** Dilengkapi sistem *graceful fallback* menggunakan atribut `onerror`, sehingga jika foto kosong atau file tidak ditemukan, antarmuka otomatis menampilkan avatar default (`./assets/img/avatar.png`).
- **Unggah & Perbarui Foto:** Form Tambah Data (`insertnilai.php`) dan Edit Data (`updatenilai.php`) mendukung pengunggahan foto mahasiswa ke folder `uploads/` dengan validasi tipe file gambar (`jpg`, `jpeg`, `png`, `gif`, `webp`).

### 2. Pencarian Data (Searching)
- **Pencarian Berdasarkan Nama (*Search by Name*):** Disediakan kolom teks pencarian (`id="user-search"`) yang menyaring data nama mahasiswa secara *live real-time* saat pengguna mengetik, serta mendukung query parameter GET `?search=...`.
- **Pencarian Berdasarkan Predikat (*Search by Predicate*):** Disediakan drop-down option filter (`id="user-role-filter"`) untuk menyaring data berdasarkan predikat akademik:
  - *Semua Predikat*
  - *Sangat Memuaskan (A)*
  - *Memuaskan (B)*
  - *Cukup (C)*
  - *Kurang (D)*
  - *Tidak Lulus (E)*
- **Kombinasi Filter:** Filter nama dan filter predikat dapat dijalankan bersamaan.
- **Tombol Reset Filter:** Tersedia tombol reset untuk mengembalikan tampilan ke seluruh data secara instan dalam satu klik.
- **Notifikasi Data Kosong:** Menampilkan pesan informatif ketika tidak ada data yang cocok dengan kriteria pencarian.

### 3. Pengurutan Data (Sorting) Berdasarkan Nilai Akhir
- **Ikon Panah AdminLTE:** Menggunakan ikon panah kecil Bootstrap Icons (`bi bi-arrow-down-up`, `bi bi-arrow-down`, `bi bi-arrow-up`) pada judul kolom **Nilai Akhir**.
- **Mode Toggle Interaktif:**
  - **Klik Pertama:** Mengurutkan dari nilai **terbesar ke terkecil (Descending)**, ikon panah berubah menjadi panah bawah berwarna biru aktif.
  - **Klik Kedua:** Mengurutkan dari nilai **terkecil ke terbesar (Ascending)**, ikon panah berubah menjadi panah atas berwarna biru aktif.
- **Live Re-sorting & Reset Page:** Pengurutan langsung memanipulasi baris DOM tanpa reload halaman dan otomatis membawa pengguna kembali ke halaman 1.

### 4. Pagination Dinamis
- **Drop-down Batas Record:** Disediakan drop-down limit dengan pilihan nilai:
  - `5` record per page (default)
  - `10` record per page
  - `15` record per page
- **Tombol Navigasi Lengkap:**
  - **First Page:** Melompat langsung ke halaman pertama (otomatis disabled jika berada di halaman 1).
  - **Previous:** Mundur satu halaman (otomatis disabled jika berada di halaman 1).
  - **Nomor Halaman (1, 2, 3, ...):** Menampilkan tombol nomor halaman aktif dengan penanda status `.active`.
  - **Next:** Maju satu halaman (otomatis disabled jika berada di halaman terakhir).
  - **Last Page:** Melompat langsung ke halaman terakhir (otomatis disabled jika berada di halaman terakhir).
- **Indikator Jumlah Entri:** Menampilkan counter real-time seperti: `Menampilkan 1 - 5 dari 13 data`.

### 5. Aturan Konversi Nilai Otomatis (`latihan.php`)
Konversi nilai akhir mahasiswa dihitung otomatis berdasarkan rentang berikut:
| Rentang Nilai Akhir | Nilai Huruf | Predikat | Badge Warna |
|:---:|:---:|:---:|:---:|
| `80.51 - 100.00` | **A** | Sangat Memuaskan | Hijau (`success`) |
| `60.51 - 80.50` | **B** | Memuaskan | Biru (`primary`) |
| `50.51 - 60.50` | **C** | Cukup | Cyan (`info`) |
| `34.51 - 50.50` | **D** | Kurang | Kuning (`warning`) |
| `00.00 - 34.50` | **E** | Tidak Lulus | Merah (`danger`) |

---

## 🗄️ Struktur Database

Database: `db_nilai5a`  
Tabel: `nilaimhsw`

### Skema Tabel
```sql
CREATE TABLE `nilaimhsw` (
  `nim` varchar(10) NOT NULL,
  `namamhsw` varchar(100) NOT NULL,
  `nilaiakhir` float NOT NULL,
  `nilaihuruf` varchar(10) DEFAULT NULL,
  `predikat` varchar(50) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
```

### Data Mahasiswa (13 Record Kelas 5A)
Data mahasiswa yang tercatat dalam file export SQL (`nilaimhsw.sql` / `db_nilai5a.sql`):
| No | NIM | Nama Mahasiswa | Nilai Akhir | Nilai Huruf | Predikat |
|:--:|:---:|:---|:---:|:---:|:---|
| 1 | `3202316131` | Patrizio Marcedes Diuva Amore | 86.70 | A | Sangat Memuaskan |
| 2 | `3202416002` | Aril Apriyandi Wibowo | 31.50 | E | Tidak Lulus |
| 3 | `3202416005` | Inka Audya Miranti | 82.75 | A | Sangat Memuaskan |
| 4 | `3202416020` | Aditya Ramadani | 48.30 | D | Kurang |
| 5 | `3202416025` | Achmad Ardian Mulyadi | 53.25 | C | Cukup |
| 6 | `3202416044` | Hikmal Rizqi Rahman Fauzi | 76.40 | B | Memuaskan |
| 7 | `3202416068` | Sabrina Utami | 92.00 | A | Sangat Memuaskan |
| 8 | `3202416083` | Freky Ardiansyah | 58.50 | C | Cukup |
| 9 | `3202416084` | Ilham Saputra | 88.50 | A | Sangat Memuaskan |
| 10 | `3202416091` | Rizq Ariiq Pratama | 64.80 | B | Memuaskan |
| 11 | `3202416133` | Gabriel Diestra Kireizuka | 71.20 | B | Memuaskan |
| 12 | `3202416134` | Gusty Faqikh | 44.60 | D | Kurang |
| 13 | `3202416149` | Laili Surya Raja Murti | 78.90 | B | Memuaskan |

---

## 📁 Struktur Direktori Proyek

```text
UTS/
├── assets/                  # Aset gambar, logo AdminLTE, dan default avatar
│   └── img/
├── css/                     # Stylesheet AdminLTE 4 dan komponen pendukung
│   └── adminlte.css
├── js/                      # Script JS AdminLTE 4
│   └── adminlte.js
├── uploads/                 # Direktori penyimpanan file foto mahasiswa
├── connect.php              # Konfigurasi koneksi MySQL
├── datatable.php            # File tampilan tabel alternatif AdminLTE
├── deletenilai.php          # Skrip backend hapus data
├── index.php                # Entry point utama (redirect ke viewdata.php)
├── insertnilai.php          # Skrip backend tambah data & upload foto
├── latihan.php              # Fungsi hitungNilai() konversi nilai huruf & predikat
├── nilaimhsw.sql            # File export database MySQL (lengkap dengan data)
├── db_nilai5a.sql           # File export database MySQL alternatif
├── updatenilai.php          # Skrip backend edit data & upload foto
├── viewdata.php             # Halaman utama antarmuka sistem AdminLTE
└── README.md                # Dokumentasi lengkap proyek
```

---

## 🚀 Panduan Instalasi & Cara Menjalankan

### 1. Prasyarat Sistem
- Web Server: **Apache** (tersedia di Laragon / XAMPP)
- Database Server: **MySQL 5.7+ / 8.0+** atau MariaDB
- PHP: **PHP 8.0 ke atas** (mendukung ekstensi `mysqli`)
- Web Browser modern (Chrome, Edge, Firefox)

### 2. Langkah-Langkah Menjalankan
1. **Clone atau Letakkan File Proyek:**  
   Simpan folder proyek di direktori web server Anda:
   - Jika menggunakan **Laragon**: `C:\laragon\www\UTS`
   - Jika menggunakan **XAMPP**: `C:\xampp\htdocs\UTS`

2. **Import Database:**
   - Buka **phpMyAdmin** (`http://localhost/phpmyadmin`) atau antarmuka database MySQL pilihan Anda.
   - Buat database bernama `db_nilai5a` (opsional karena di dalam SQL sudah ada `CREATE DATABASE IF NOT EXISTS`).
   - Pilih menu **Import** dan unggah file `nilaimhsw.sql` atau `db_nilai5a.sql`.
   - Pastikan tabel `nilaimhsw` beserta ke-13 record mahasiswa berhasil masuk.

3. **Konfigurasi Koneksi (`connect.php`):**  
   Sesuaikan kredensial database jika menggunakan password khusus:
   ```php
   $servername = "localhost";
   $username   = "root";
   $password   = "";
   $dbname     = "db_nilai5a";
   ```

4. **Akses Aplikasi:**  
   Buka web browser dan akses URL:
   ```text
   http://localhost/UTS/
   ```
   atau
   ```text
   http://localhost/UTS/viewdata.php
   ```

---

## 🛠️ Teknologi yang Digunakan
- **Bahasa Pemrograman:** PHP Native (Prosedural & Prepared Statement)
- **Database:** MySQL
- **Template Admin:** AdminLTE v4.0.0
- **Framework CSS & Komponen:** Bootstrap v5.3.8 & Bootstrap Icons v1.13.1
- **Scrollbar Library:** OverlayScrollbars v2.11.0

---

## 🔗 Tautan Repositori GitHub
- **Repository URL:** [https://github.com/Hikmalniuwbi/UTS_PEMROGRAMAN_WEB](https://github.com/Hikmalniuwbi/UTS_PEMROGRAMAN_WEB) (Set to Public)
