# Laporan Praktikum Modul 2 — Analisis Kebutuhan Data

> Kerangka laporan. Isi berdasarkan kegiatan yang benar-benar kamu lakukan. Jangan mengaku memiliki screenshot, commit, atau hasil uji yang belum dibuat.

## 1. Tujuan

Praktikum Modul 2 bertujuan menganalisis kebutuhan pengelolaan data pada sistem yang dipilih. Analisis dilakukan dengan mengidentifikasi proses bisnis, entitas, aturan bisnis, kebutuhan informasi, operasi CRUD, kamus data, serta kebutuhan nonfungsional sebagai dasar perancangan basis data.

## 2. Dasar teori

**Proses bisnis** adalah rangkaian aktivitas yang dilakukan untuk mencapai tujuan tertentu dalam suatu sistem.

**Entitas** adalah objek atau hal yang datanya perlu disimpan dan dikelola dalam basis data.

**Aturan bisnis** adalah ketentuan yang membatasi atau mengatur aktivitas dan pengelolaan data dalam sistem.

**Kebutuhan informasi** menjelaskan informasi yang dibutuhkan pengguna untuk menjalankan aktivitas atau mengambil keputusan.

**CRUD** merupakan singkatan dari Create, Read, Update, dan Delete, yaitu operasi untuk menambah, membaca, memperbarui, dan menghapus data.

**Kamus data** mendokumentasikan elemen data, termasuk nama, tipe atau format, aturan validasi, dan penanggung jawab data.

**Kebutuhan nonfungsional** menjelaskan persyaratan kualitas dan batasan sistem, misalnya keamanan, pembatasan hak akses, privasi, serta kinerja yang dapat diukur.

## 3. Hasil praktikum
- Tabel proses bisnis: [lampirkan screenshot]
- Tabel aturan bisnis: [lampirkan screenshot]
- Tabel kebutuhan informasi: [lampirkan screenshot]
- Matriks CRUD: [lampirkan screenshot]
- Kamus data: [lampirkan screenshot]
- Dokumen sumber fiktif buatan sendiri: [lampirkan screenshot]

## 4. Analisis poin praktikum

Analisis kebutuhan data dilakukan dengan mengidentifikasi proses utama toko daring, yaitu pengelolaan katalog, pengelolaan pelanggan, pembuatan pesanan, verifikasi pembayaran, dan pemrosesan pengiriman. Setiap proses menggunakan data tertentu yang kemudian dipetakan ke entitas dan operasi CRUD.

Harga produk perlu disimpan pada detail pesanan sebagai harga saat transaksi. Dengan demikian, perubahan harga katalog tidak mengubah nilai transaksi yang telah dibuat. Alamat tujuan dan ongkos kirim juga perlu disimpan pada pesanan agar informasi pengiriman dan perhitungan transaksi lama tetap konsisten.

## 5. Latihan/modifikasi

Modifikasi rancangan dilakukan dengan menambahkan aturan mengenai batas maksimum item per transaksi, perhitungan total pesanan, pembatasan akses data pelanggan, dan perlindungan riwayat transaksi. Kebutuhan informasi diperjelas melalui laporan nilai pesanan, produk terlaris, stok rendah, pesanan belum dibayar, dan pesanan belum dikirim.

Matriks CRUD ditinjau agar setiap entitas memiliki proses yang membuat dan mengelola datanya. Penghapusan data produk atau kategori perlu dibatasi apabila data tersebut sudah digunakan dalam transaksi. Perubahan ini bertujuan menjaga konsistensi data dan riwayat transaksi.

## 6. Milestone proyek individu

Proyek individu menggunakan tema toko daring. Berdasarkan parameter NIM yang digunakan, diperoleh P = 6, maksimum 8 item per transaksi, nilai parameter Rp6.000, dan estimasi 70 transaksi per hari.

Rancangan awal mencakup lima proses bisnis dan tujuh entitas utama, yaitu Pelanggan, Produk, Kategori, Pesanan, Detail_Pesanan, Pembayaran, dan Pengiriman. Analisis juga mencakup aturan bisnis, kebutuhan informasi, matriks CRUD, kamus data, kebutuhan nonfungsional, dan risiko kualitas data.

Harga produk, alamat tujuan, dan ongkos kirim pada saat transaksi perlu dipertahankan agar riwayat pesanan tetap konsisten. Rancangan akhir harus diperiksa kembali terhadap instruksi praktikum sebelum dinyatakan selesai.

## 7. Diskusi dan kendala

Kendala dalam penyusunan analisis adalah memastikan hubungan antara proses bisnis, entitas, dan operasi CRUD tetap konsisten. Kendala lainnya adalah menentukan atribut yang perlu disimpan sebagai riwayat transaksi serta menetapkan hak akses berdasarkan peran pengguna.

Perbaikan dilakukan dengan meninjau kembali matriks CRUD, melengkapi kamus data, dan memperjelas kebutuhan informasi serta kebutuhan nonfungsional. Hasil pemeriksaan akhir perlu disesuaikan dengan pekerjaan yang benar-benar telah dilakukan.

## 8. Kesimpulan

Analisis kebutuhan data membantu mengidentifikasi data yang diperlukan oleh sistem toko daring dan bagaimana data tersebut digunakan dalam proses bisnis. Proses bisnis, aturan bisnis, kebutuhan informasi, matriks CRUD, kamus data, dan kebutuhan nonfungsional menjadi dasar untuk merancang basis data yang konsisten.

Penyimpanan harga, alamat, dan ongkos kirim saat transaksi membantu mempertahankan riwayat pesanan. Sebelum tugas dikumpulkan, seluruh tabel, dokumen sumber, kebutuhan nonfungsional, dan bukti pelaksanaan perlu diperiksa kembali.

## 9. Deklarasi penggunaan AI

Saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi praktikum, mempelajari konsep analisis kebutuhan data, dan memperoleh masukan mengenai struktur dokumen serta konsistensi rancangan. Saya bertanggung jawab untuk memeriksa kesesuaian hasil dengan buku praktikum, memahami keputusan desain yang digunakan, melakukan revisi, dan memastikan bahwa laporan mencerminkan pekerjaan yang benar-benar saya lakukan. Bagian yang dibantu AI akan saya verifikasi dan sesuaikan dengan aturan penggunaan AI pada praktikum.
## 10. Bukti Git
- URL repository: [ISI SETELAH PUSH]
- Commit hash: [ISI SETELAH COMMIT]
- Screenshot GitHub: [LAMPIRKAN SETELAH ADA]

## Checklist akhir
- [ ] Nama file memakai NIM lengkap sesuai format dosen.
- [ ] Proses bisnis, aturan bisnis, dan kebutuhan informasi sudah diperiksa.
- [ ] Matriks CRUD tidak memiliki entitas yatim atau sudah dijelaskan.
- [ ] Kamus data minimal 20 elemen lengkap dengan tipe/format, validasi, dan penanggung jawab.
- [ ] Dokumen sumber fiktif dibuat sendiri dan dianalisis.
- [ ] Kebutuhan nonfungsional dirumuskan secara terukur.
- [ ] Screenshot dan bukti Git benar-benar tersedia.
- [ ] Deklarasi penggunaan AI jujur.
