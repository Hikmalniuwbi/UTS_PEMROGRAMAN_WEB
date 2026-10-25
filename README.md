# Proyek UTS Pemrograman Web - Rekap Nilai Mahasiswa (AdminLTE 4)

Repository ini dibuat untuk memenuhi tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Web. Proyek ini memodifikasi dan melengkapi template AdminLTE 4 dengan fitur pengelolaan dan rekapitulasi data nilai mahasiswa menggunakan PHP Native dan database MySQL.

## Identitas Mahasiswa
- **Nama:** Hikmal Rizqi Rahman Fauzi
- **NIM:** 3202416044
- **Kelas:** 5A
- **Mata Kuliah:** Pemrograman Web

---

## Fitur yang Diimplementasikan

Sesuai instruksi soal UTS, berikut adalah fitur-fitur yang telah diselesaikan:

1. **Pembacaan Data Foto Mahasiswa**
   - Menambahkan kolom `file_path` pada tabel `nilaimhsw` untuk menyimpan path file foto mahasiswa.
   - Foto mahasiswa ditampilkan berupa thumbnail kecil di sebelah nama mahasiswa dan tetap berada di dalam satu kolom yang sama (kolom **Nama Mahasiswa**).
   - Diberikan avatar default jika file foto kosong atau tidak ditemukan.
   - Form Tambah dan Edit data sudah mendukung upload file foto ke folder `uploads/`.

2. **Pencarian Data (Searching)**
   - **Pencarian berdasarkan Nama (Search by Name):** Menggunakan input pencarian teks bawaan template untuk memfilter data berdasarkan nama mahasiswa secara langsung saat diketik.
   - **Pencarian berdasarkan Predikat (Search by Predicate):** Menggunakan drop-down option bawaan template untuk memfilter data berdasarkan predikat nilai (*Sangat Memuaskan, Memuaskan, Cukup, Kurang, Tidak Lulus*).
   - Disediakan tombol reset untuk mengembalikan filter ke tampilan semua data.

3. **Pengurutan Data (Sorting berdasarkan Nilai Akhir)**
   - Menggunakan ikon panah kecil di judul kolom **Nilai Akhir** bawaan template.
   - Pengurutan bekerja secara bergantian (toggle) antara nilai terbesar ke terkecil (*descending*) dan nilai terkecil ke terbesar (*ascending*).

4. **Pagination Dinamis**
   - Batas data per halaman dapat dipilih melalui drop-down limit dengan pilihan **5, 10, dan 15 record per page**.
   - Navigasi halaman menggunakan tombol bawaan template: **First Page**, **Previous**, nomor halaman, **Next**, dan **Last Page**.
   - Tombol First/Prev otomatis nonaktif saat berada di halaman 1, dan tombol Next/Last otomatis nonaktif saat berada di halaman terakhir.

5. **Logika Perhitungan Nilai Otomatis (`latihan.php`)**
   Nilai huruf dan predikat dihitung otomatis menggunakan fungsi `hitungNilai()` dengan ketentuan:
   - 80.51 s/d 100.00 : Nilai A (Sangat Memuaskan)
   - 60.51 s/d 80.50 : Nilai B (Memuaskan)
   - 50.51 s/d 60.50 : Nilai C (Cukup)
   - 34.51 s/d 50.50 : Nilai D (Kurang)
   - 00.00 s/d 34.50 : Nilai E (Tidak Lulus)

---

## Database & Data Mahasiswa

Database yang digunakan bernama `db_nilai5a`. File database sudah diexport dan disertakan dalam repositori ini:
- **`nilaimhsw.sql`** (dan **`db_nilai5a.sql`**)

Tabel `nilaimhsw` telah diisi dengan 13 data mahasiswa kelas 5A dengan sebaran nilai yang mencakup seluruh predikat (A, B, C, D, dan E) sehingga semua skenario pengujian dapat didemonstrasikan:

1. Sabrina Utami (3202416068) - Nilai 92.00 (A - Sangat Memuaskan)
2. Ilham Saputra (3202416084) - Nilai 88.50 (A - Sangat Memuaskan)
3. Patrizio Marcedes Diuva Amore (3202316131) - Nilai 86.70 (A - Sangat Memuaskan)
4. Inka Audya Miranti (3202416005) - Nilai 82.75 (A - Sangat Memuaskan)
5. Laili Surya Raja Murti (3202416149) - Nilai 78.90 (B - Memuaskan)
6. Hikmal Rizqi Rahman Fauzi (3202416044) - Nilai 76.40 (B - Memuaskan)
7. Gabriel Diestra Kireizuka (3202416133) - Nilai 71.20 (B - Memuaskan)
8. Rizq Ariiq Pratama (3202416091) - Nilai 64.80 (B - Memuaskan)
9. Freky Ardiansyah (3202416083) - Nilai 58.50 (C - Cukup)
10. Achmad Ardian Mulyadi (3202416025) - Nilai 53.25 (C - Cukup)
11. Aditya Ramadani (3202416020) - Nilai 48.30 (D - Kurang)
12. Gusty Faqikh (3202416134) - Nilai 44.60 (D - Kurang)
13. Aril Apriyandi Wibowo (3202416002) - Nilai 31.50 (E - Tidak Lulus)

---

## Struktur File Proyek

```text
UTS/
├── assets/          # Aset logo AdminLTE dan gambar avatar
├── css/             # Stylesheet AdminLTE 4
├── js/              # File javascript AdminLTE 4
├── uploads/         # Direktori file upload foto mahasiswa
├── connect.php      # File koneksi database MySQL
├── datatable.php    # Halaman tabel nilai
├── deletenilai.php  # Script proses hapus data nilai
├── index.php        # Redirect otomatis ke viewdata.php
├── insertnilai.php  # Script proses tambah data & upload foto
├── latihan.php      # Fungsi logika konversi nilai dan predikat
├── nilaimhsw.sql    # File dump SQL database & data
├── db_nilai5a.sql   # File salinan SQL alternatif
├── updatenilai.php  # Script proses edit data & upload foto
├── viewdata.php     # Halaman utama aplikasi (rekap nilai)
└── README.md        # Dokumentasi proyek
```

---

## Petunjuk Menjalankan di Komputer Lokal

1. Pastikan Laragon atau XAMPP sudah terpasang dan service Apache serta MySQL sudah menyala.
2. Tempatkan folder proyek ini di dalam folder web server:
   - Laragon: `C:\laragon\www\UTS`
   - XAMPP: `C:\xampp\htdocs\UTS`
3. Buka **phpMyAdmin** (`http://localhost/phpmyadmin`).
4. Import file **`nilaimhsw.sql`** ke dalam phpMyAdmin.
5. Cek file `connect.php` dan pastikan konfigurasi sudah sesuai dengan server lokal Anda:
   ```php
   $servername = "localhost";
   $username   = "root";
   $password   = "";
   $dbname     = "db_nilai5a";
   ```
6. Buka browser dan jalankan URL berikut:
   ```text
   http://localhost/UTS/
   ```
   atau
   ```text
   http://localhost/UTS/viewdata.php
   ```

---

## Tautan Repositori GitHub
- **URL Repositori:** https://github.com/Hikmalniuwbi/UTS_PEMROGRAMAN_WEB
