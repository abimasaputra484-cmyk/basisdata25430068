# DOKUMEN KEBUTUHAN DATA KLIKKITA STORE

**Nama Organisasi:** KlikKita Store  
**Jenis Organisasi:** Toko Daring (Online Shop)  
**Nama Mahasiswa:** Abima Saputra  
**NIM:** 25430068  
**Mata Kuliah:** Basis Data  
**Modul:** Modul 2 – Analisis Kebutuhan Pengelolaan Data

## 1. Latar Belakang dan Aktivitas Organisasi

KlikKita Store merupakan sebuah usaha toko daring yang menjual berbagai jenis produk secara online. Kegiatan utama toko ini meliputi pengelolaan data pelanggan, pengelolaan produk, pencatatan pesanan, pembayaran, dan pengiriman barang kepada pelanggan.

Dalam menjalankan kegiatan operasionalnya, KlikKita Store membutuhkan pengelolaan data yang terstruktur agar setiap transaksi dapat dicatat dengan baik. Oleh karena itu, diperlukan analisis kebutuhan data untuk mengetahui data apa saja yang dibutuhkan dalam kegiatan operasional toko.

## 2. Aktor dan Proses Bisnis

Dalam kegiatan operasional KlikKita Store terdapat beberapa aktor yang memiliki tugas dan tanggung jawab masing-masing.

### 2.1 Aktor

1. **Admin:** Mengelola data produk, kategori, dan informasi toko.
2. **Pelanggan:** Melihat produk, memasukkan produk ke keranjang, dan melakukan pemesanan.
3. **Petugas Keuangan:** Memeriksa dan memverifikasi pembayaran pelanggan.
4. **Petugas Pengiriman:** Mengelola proses pengiriman pesanan kepada pelanggan.

### 2.2 Proses Bisnis

| Kode | Proses Bisnis | Aktor | Pemicu |
|---|---|---|---|
| PB-01 | Mengelola data produk | Admin | Ada produk baru atau perubahan informasi produk |
| PB-02 | Mengelola keranjang belanja | Pelanggan | Pelanggan memilih produk |
| PB-03 | Membuat pesanan | Pelanggan | Pelanggan menyelesaikan belanja |
| PB-04 | Memverifikasi pembayaran | Petugas Keuangan | Pelanggan melakukan pembayaran |
| PB-05 | Memproses pengiriman | Petugas Pengiriman | Pembayaran telah diverifikasi |

## 3. Dokumen Sumber yang Dianalisis

Dalam kegiatan operasional KlikKita Store terdapat beberapa dokumen sumber yang digunakan sebagai dasar pencatatan dan pengelolaan data.

### 3.1 Halaman Produk

Halaman produk berisi informasi mengenai produk yang dijual, seperti kode produk, nama produk, kategori, harga, deskripsi, dan jumlah stok.

### 3.2 Bukti Pembayaran

Bukti pembayaran digunakan untuk memastikan bahwa pelanggan telah melakukan pembayaran. Informasi yang dicatat meliputi nomor pesanan, tanggal pembayaran, jumlah pembayaran, dan metode pembayaran.

### 3.3 Bukti Pengiriman

Bukti pengiriman digunakan untuk mencatat proses pengiriman barang kepada pelanggan. Informasi yang terdapat di dalamnya meliputi nomor pesanan, alamat tujuan, jasa pengiriman, nomor resi, dan tanggal pengiriman.

### 3.4 Analisis Dokumen

Ketiga dokumen tersebut memiliki fungsi yang berbeda, tetapi saling berhubungan. Halaman produk menjadi sumber informasi barang, bukti pembayaran menjadi dasar verifikasi transaksi, sedangkan bukti pengiriman menjadi dasar pemantauan pengiriman pesanan.

Harga produk, biaya pengiriman, dan alamat pelanggan perlu disimpan pada data pesanan agar informasi transaksi lama tidak berubah ketika terdapat perubahan harga atau alamat.

## 4. Entitas Kandidat dan Elemen Data

Berdasarkan proses bisnis KlikKita Store, terdapat beberapa entitas yang dibutuhkan untuk menyimpan dan mengelola data.

### 4.1 Daftar Entitas

| No. | Entitas | Fungsi |
|---|---|---|
| 1 | Pelanggan | Menyimpan informasi pelanggan yang melakukan pembelian |
| 2 | Admin | Menyimpan informasi petugas yang mengelola toko |
| 3 | Kategori | Menyimpan kelompok atau jenis produk |
| 4 | Produk | Menyimpan informasi produk yang dijual |
| 5 | Keranjang | Menyimpan keranjang belanja pelanggan |
| 6 | Detail Keranjang | Menyimpan daftar produk dalam keranjang |
| 7 | Pesanan | Menyimpan informasi transaksi pemesanan |
| 8 | Detail Pesanan | Menyimpan rincian produk dalam pesanan |
| 9 | Pembayaran | Menyimpan informasi pembayaran pesanan |
| 10 | Pengiriman | Menyimpan informasi pengiriman pesanan |

### 4.2 Elemen Data Setiap Entitas

1. **Pelanggan:** id_pelanggan, nama_pelanggan, email, no_hp, alamat.
2. **Admin:** id_admin, nama_admin, username, password.
3. **Kategori:** id_kategori, nama_kategori, deskripsi.
4. **Produk:** id_produk, id_kategori, nama_produk, harga, stok, deskripsi.
5. **Keranjang:** id_keranjang, id_pelanggan, tanggal_dibuat.
6. **Detail Keranjang:** id_detail_keranjang, id_keranjang, id_produk, jumlah.
7. **Pesanan:** id_pesanan, id_pelanggan, tanggal_pesanan, alamat_pengiriman, biaya_pengiriman, total_pesanan, status_pesanan.
8. **Detail Pesanan:** id_detail_pesanan, id_pesanan, id_produk, jumlah, harga_satuan.
9. **Pembayaran:** id_pembayaran, id_pesanan, tanggal_pembayaran, metode_pembayaran, jumlah_pembayaran, status_pembayaran.
10. **Pengiriman:** id_pengiriman, id_pesanan, jasa_pengiriman, nomor_resi, tanggal_pengiriman, status_pengiriman.

## 5. Aturan Bisnis

Aturan bisnis dibuat untuk memastikan seluruh kegiatan operasional KlikKita Store berjalan secara teratur dan menghindari kesalahan dalam pengelolaan data.

| Kode | Aturan Bisnis |
|---|---|
| AB-01 | Setiap pelanggan memiliki satu ID pelanggan yang bersifat unik. |
| AB-02 | Setiap produk memiliki kode produk yang berbeda. |
| AB-03 | Harga produk harus lebih besar dari nol. |
| AB-04 | Stok produk tidak boleh bernilai negatif. |
| AB-05 | Pelanggan dapat memasukkan beberapa produk ke dalam keranjang belanja. |
| AB-06 | Jumlah produk yang dipesan tidak boleh melebihi stok yang tersedia. |
| AB-07 | Setiap pesanan memiliki nomor pesanan yang unik. |
| AB-08 | Pesanan hanya dapat diproses untuk pengiriman setelah pembayaran diverifikasi. |
| AB-09 | Harga produk dan biaya pengiriman harus disimpan sesuai kondisi saat transaksi dilakukan. |

## 6. Kebutuhan Informasi

KlikKita Store membutuhkan beberapa informasi untuk membantu pemilik dan petugas dalam menjalankan serta mengevaluasi kegiatan operasional toko.

| Kode | Kebutuhan Informasi | Keterangan |
|---|---|---|
| KI-01 | Daftar produk | Menampilkan seluruh produk beserta nama, kategori, harga, dan stok. |
| KI-02 | Informasi stok produk | Menampilkan jumlah stok produk yang tersedia. |
| KI-03 | Riwayat pesanan | Menampilkan daftar pesanan pelanggan berdasarkan tanggal. |
| KI-04 | Laporan penjualan bulanan | Menampilkan jumlah transaksi dan total penjualan setiap bulan. |
| KI-05 | Laporan pembayaran | Menampilkan status pembayaran setiap pesanan. |
| KI-06 | Laporan pengiriman | Menampilkan status pengiriman dan nomor resi pesanan. |

## 7. Matriks CRUD

Matriks CRUD digunakan untuk mengetahui aktivitas pengelolaan data pada setiap proses bisnis KlikKita Store.

| Proses Bisnis | Pelanggan | Admin | Kategori | Produk | Keranjang | Detail Keranjang | Pesanan | Detail Pesanan | Pembayaran | Pengiriman |
|---|---|---|---|---|---|---|---|---|---|---|
| PB-01 Mengelola Produk | - | R | C,R,U,D | C,R,U,D | - | - | - | - | - | - |
| PB-02 Mengelola Keranjang | R | - | - | R | C,R | C,R,U,D | - | - | - | - |
| PB-03 Membuat Pesanan | R | - | - | R,U | R | R | C | C | - | - |
| PB-04 Memverifikasi Pembayaran | R | R | - | - | - | - | R,U | - | C,R,U | - |
| PB-05 Memproses Pengiriman | R | R | - | - | - | - | R,U | - | R | C,R,U |

Keterangan: C = Create, R = Read, U = Update, D = Delete, dan tanda (-) berarti tidak terlibat.

## 8. Kamus Data Awal

Kamus data digunakan untuk menjelaskan elemen data yang terdapat dalam setiap entitas KlikKita Store beserta fungsi dan penanggung jawabnya.

| No. | Nama Elemen Data | Entitas | Fungsi | Penanggung Jawab |
|---|---|---|---|---|
| 1 | id_pelanggan | Pelanggan | Identitas unik pelanggan | Admin |
| 2 | nama_pelanggan | Pelanggan | Nama lengkap pelanggan | Pelanggan |
| 3 | email | Pelanggan | Alamat email pelanggan | Pelanggan |
| 4 | no_hp | Pelanggan | Nomor telepon pelanggan | Pelanggan |
| 5 | alamat | Pelanggan | Alamat pelanggan | Pelanggan |
| 6 | id_admin | Admin | Identitas admin | Pemilik Toko |
| 7 | nama_admin | Admin | Nama admin | Pemilik Toko |
| 8 | username | Admin | Nama pengguna untuk login | Admin |
| 9 | password | Admin | Kata sandi akun admin | Admin |
| 10 | id_kategori | Kategori | Identitas kategori produk | Admin |
| 11 | nama_kategori | Kategori | Nama kategori produk | Admin |
| 12 | id_produk | Produk | Identitas produk | Admin |
| 13 | nama_produk | Produk | Nama barang yang dijual | Admin |
| 14 | harga | Produk | Harga produk saat ini | Admin |
| 15 | stok | Produk | Jumlah persediaan produk | Admin |
| 16 | id_keranjang | Keranjang | Identitas keranjang pelanggan | Sistem |
| 17 | id_detail_keranjang | Detail Keranjang | Identitas rincian keranjang | Sistem |
| 18 | jumlah | Detail Keranjang | Jumlah produk dalam keranjang | Pelanggan |
| 19 | id_pesanan | Pesanan | Identitas unik pesanan | Sistem |
| 20 | tanggal_pesanan | Pesanan | Tanggal transaksi pesanan | Sistem |
| 21 | alamat_pengiriman | Pesanan | Alamat tujuan pengiriman saat transaksi | Pelanggan |
| 22 | biaya_pengiriman | Pesanan | Biaya pengiriman saat transaksi | Petugas Pengiriman |
| 23 | total_pesanan | Pesanan | Total pembayaran pesanan | Sistem |
| 24 | harga_satuan | Detail Pesanan | Harga produk saat dipesan | Sistem |
| 25 | id_pembayaran | Pembayaran | Identitas pembayaran | Sistem |
| 26 | metode_pembayaran | Pembayaran | Metode pembayaran pelanggan | Pelanggan |
| 27 | status_pembayaran | Pembayaran | Status pembayaran pesanan | Petugas Keuangan |
| 28 | nomor_resi | Pengiriman | Nomor pelacakan pengiriman | Petugas Pengiriman |
| 29 | status_pengiriman | Pengiriman | Status proses pengiriman | Petugas Pengiriman |

## 9. Kebutuhan Non-Fungsional Data

Kebutuhan non-fungsional merupakan ketentuan yang berkaitan dengan keamanan, kapasitas, penyimpanan, dan kualitas data dalam sistem KlikKita Store.

### 9.1 Kapasitas Data

KlikKita Store diperkirakan menangani sekitar 70 transaksi per hari. Jumlah tersebut digunakan sebagai perkiraan kebutuhan kapasitas penyimpanan dan pengelolaan transaksi.

### 9.2 Keamanan Data

Data pelanggan seperti nama, nomor telepon, email, dan alamat harus dilindungi. Data tersebut hanya boleh diakses oleh petugas yang memiliki hak akses sesuai tugasnya.

### 9.3 Penyimpanan Data

Data transaksi harus disimpan sekurang-kurangnya selama 5 tahun agar dapat digunakan kembali untuk pemeriksaan dan pembuatan laporan.

### 9.4 Keakuratan Data

Sistem harus memastikan jumlah stok sesuai dengan transaksi yang terjadi. Setiap pembayaran dan pengiriman juga harus memiliki status yang jelas.

### 9.5 Kecepatan Akses

Sistem diharapkan dapat menampilkan informasi produk, stok, dan riwayat pesanan dengan cepat sehingga memudahkan kegiatan operasional toko.

## 10. Isu Kualitas Data yang Diantisipasi

Dalam pengelolaan data KlikKita Store terdapat beberapa kemungkinan masalah yang perlu diperhatikan.

| No. | Isu Kualitas Data | Dampak | Cara Mengatasi |
|---|---|---|---|
| 1 | Data pelanggan ganda | Menyebabkan kesulitan dalam mengelola pelanggan | Menggunakan ID pelanggan dan email yang unik |
| 2 | Kesalahan penulisan alamat | Barang dapat dikirim ke alamat yang salah | Memeriksa kembali alamat sebelum pesanan diproses |
| 3 | Stok tidak sesuai | Menyebabkan kesalahan dalam menerima pesanan | Memperbarui stok setiap terjadi transaksi |
| 4 | Harga produk tidak sesuai | Menyebabkan kesalahan perhitungan pembayaran | Menyimpan harga produk saat transaksi dilakukan |
| 5 | Status pembayaran tidak diperbarui | Pesanan dapat diproses tanpa pembayaran terverifikasi | Melakukan verifikasi pembayaran sebelum pesanan dikirim |
| 6 | Nomor resi tidak sesuai | Pelanggan kesulitan melacak pesanan | Memeriksa nomor resi sebelum disimpan |

## 11. Contoh Dokumen Sumber dan Analisisnya

### 11.1 Contoh Nota Pesanan KlikKita Store

**KLIKKITA STORE**  
**NOTA PEMESANAN ONLINE**

| Keterangan | Informasi |
|---|---|
| Nomor Pesanan | PS001 |
| Nama Pelanggan | Andi Saputra |
| Tanggal Pesanan | 30 Oktober 2026 |
| Status Pesanan | Menunggu Pembayaran |

**Rincian Produk**

| No. | Nama Produk | Jumlah | Harga Satuan | Subtotal |
|---|---|---|---|---|
| 1 | Sepatu | 1 | Rp150.000 | Rp150.000 |
| 2 | Tas | 1 | Rp100.000 | Rp100.000 |

| Keterangan | Jumlah |
|---|---:|
| Total Produk | Rp250.000 |
| Biaya Pengiriman | Rp15.000 |
| Total Pembayaran | Rp265.000 |

### 11.2 Analisis Nota Pesanan

Nota pesanan digunakan sebagai dokumen sumber untuk mencatat transaksi antara pelanggan dan KlikKita Store. Informasi yang terdapat pada nota meliputi identitas pesanan, identitas pelanggan, rincian produk, harga satuan, jumlah barang, biaya pengiriman, dan total pembayaran.

Harga satuan produk harus disimpan berdasarkan harga ketika transaksi dilakukan. Hal ini bertujuan agar riwayat transaksi tetap akurat meskipun harga produk berubah di kemudian hari.

Alamat pengiriman dan biaya pengiriman juga perlu disimpan pada data pesanan agar informasi transaksi sebelumnya tidak berubah apabila pelanggan mengganti alamat atau biaya pengiriman mengalami perubahan.

## 12. Latihan Modul 2

### 12.1 Program Loyalitas Pelanggan

KlikKita Store menerapkan program loyalitas untuk memberikan penghargaan kepada pelanggan yang sering melakukan pembelian.

Ketentuan program loyalitas adalah sebagai berikut:

1. Setiap pembelian sebesar Rp10.000 mendapatkan 1 poin.
2. Setiap pelanggan yang memiliki 50 poin dapat menukarkan poin tersebut dengan diskon sebesar Rp5.000.
3. Poin pelanggan dicatat dan disimpan agar jumlah poin dapat diketahui setiap saat.
4. Poin hanya diberikan berdasarkan transaksi yang telah selesai dan dibayar.

### Penambahan Elemen Data

| Nama Elemen Data | Entitas | Fungsi |
|---|---|---|
| poin_pelanggan | Pelanggan | Menyimpan jumlah poin yang dimiliki pelanggan |
| poin_diperoleh | Pesanan | Menyimpan jumlah poin dari transaksi |
| poin_digunakan | Pesanan | Menyimpan jumlah poin yang ditukarkan |

### Penambahan Aturan Bisnis

| Kode | Aturan Bisnis |
|---|---|
| AB-10 | Setiap pembelian Rp10.000 mendapatkan 1 poin. |
| AB-11 | Setiap 50 poin dapat ditukarkan dengan diskon Rp5.000. |
| AB-12 | Poin hanya diberikan setelah pembayaran berhasil diverifikasi. |
| AB-13 | Poin yang sudah ditukarkan tidak dapat digunakan kembali. |

### Penambahan Kebutuhan Informasi

| Kode | Kebutuhan Informasi |
|---|---|
| KI-07 | Menampilkan jumlah poin setiap pelanggan. |
| KI-08 | Menampilkan riwayat perolehan dan penukaran poin. |
| KI-09 | Menampilkan daftar pelanggan dengan poin terbanyak. |

### 12.2 Memperbaiki Kebutuhan Sistem

Berikut merupakan perbaikan dari kebutuhan sistem yang masih bersifat umum agar menjadi lebih jelas dan terukur.

| No. | Kebutuhan Awal | Perbaikan Kebutuhan |
|---|---|---|
| 1 | Data anggota harus aman. | Data pelanggan harus dilindungi menggunakan sistem login dan pembatasan hak akses. Hanya admin yang berwenang dapat melihat dan mengelola data pelanggan. |
| 2 | Sistem harus cepat mencari barang. | Sistem harus dapat menampilkan hasil pencarian produk berdasarkan nama atau kode produk dalam waktu maksimal 3 detik pada kondisi penggunaan normal. |
| 3 | Laporan stok harus akurat. | Laporan stok harus diperbarui setiap terjadi transaksi penjualan, pembatalan pesanan, atau penambahan stok sehingga jumlah stok sesuai dengan kondisi persediaan. |

Perbaikan tersebut dilakukan agar kebutuhan sistem dapat dipahami dengan jelas dan dijadikan pedoman dalam proses perancangan database.

### 12.3 Perhitungan Parameter Berdasarkan NIM

Perhitungan parameter dilakukan berdasarkan dua digit terakhir NIM mahasiswa, yaitu 68.

P = (68 mod 9) + 1
P = 5 + 1
P = 6

Berdasarkan hasil perhitungan tersebut, diperoleh ketentuan sebagai berikut:

1. Maksimal produk dalam satu transaksi adalah P + 2 = 8 produk.
2. Persentase diskon yang digunakan dalam rancangan proyek adalah 6%.
3. Perkiraan jumlah transaksi harian adalah 40 + (5 × 6) = 70 transaksi.

Parameter tersebut digunakan sebagai dasar dalam menentukan kebutuhan pengelolaan data KlikKita Store.