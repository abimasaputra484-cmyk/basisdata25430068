# Analisis Kebutuhan Data — Toko Daring

> Draf kerja. Lengkapi dan validasi bagian `[ISI SENDIRI]` sebelum dikumpulkan.

## 1. Latar belakang dan ruang lingkup
Sistem toko daring membantu pengelolaan katalog produk, pelanggan, pesanan, pembayaran, dan pengiriman. Analisis ini mengidentifikasi proses bisnis, data yang dibutuhkan, aturan bisnis, serta informasi yang perlu dihasilkan.

**Batasan sistem:** [ISI SENDIRI: apa yang termasuk dan tidak termasuk dalam sistem]

## 2. Proses bisnis

| ID | Proses | Aktor utama | Data yang digunakan/dihasilkan |
|---|---|---|---|
| PB-01 | Mengelola katalog produk | Admin | Produk, kategori, harga, stok |
| PB-02 | Mengelola data pelanggan | Pelanggan/Admin | Identitas dan kontak pelanggan |
| PB-03 | Membuat pesanan | Pelanggan | Pesanan, detail pesanan, alamat, ongkir |
| PB-04 | Memverifikasi pembayaran | Petugas pembayaran | Pembayaran, status pembayaran |
| PB-05 | Memproses pengiriman | Petugas gudang | Alamat, kurir, nomor resi, status pengiriman |

**Validasi pribadi:** [ISI SENDIRI: apakah aktor dan proses ini cocok dengan skenario toko daring yang kamu pilih? Tambahkan atau ubah proses jika perlu.]

## 3. Dokumen sumber fiktif
Buat satu contoh dokumen sumber fiktif, misalnya nota pesanan daring. Isinya dapat mencakup:
- Nomor dan tanggal pesanan
- Identitas pelanggan
- Daftar produk, jumlah, dan harga per item pada saat pemesanan
- Alamat tujuan dan biaya pengiriman
- Total pesanan
- Status pembayaran dan pengiriman

**Dokumen buatan sendiri / screenshot:** [ISI SENDIRI]

## 4. Kandidat entitas

| Entitas | Tujuan | Contoh atribut |
|---|---|---|
| Pelanggan | Menyimpan data pemesan | id_pelanggan, nama, email, telepon |
| Produk | Menyimpan katalog dan stok | id_produk, nama, harga_aktif, stok |
| Kategori | Mengelompokkan produk | id_kategori, nama_kategori |
| Pesanan | Mewakili transaksi pemesanan | id_pesanan, tanggal, id_pelanggan, status |
| Detail_Pesanan | Menyimpan item per pesanan | id_pesanan, id_produk, jumlah, harga_saat_pesan |
| Pembayaran | Mencatat pembayaran | id_pembayaran, id_pesanan, jumlah_bayar, status |
| Pengiriman | Melacak pengiriman | id_pengiriman, id_pesanan, alamat_saat_pesan, kurir, resi |

**Alasan dan entitas final:** [ISI SENDIRI: jelaskan mengapa entitas dipilih dan apakah perlu entitas tambahan.]

## 5. Aturan bisnis
Berikut contoh awal untuk ditinjau dan disesuaikan. Tambahkan aturan sampai memenuhi minimal 8.

| ID | Aturan bisnis |
|---|---|
| AB-01 | Setiap pesanan memiliki nomor pesanan unik. |
| AB-02 | Satu pesanan memiliki minimal satu detail produk. |
| AB-03 | Jumlah produk yang dipesan harus bilangan positif. |
| AB-04 | Stok tidak boleh menjadi negatif; pesanan ditolak atau disesuaikan jika stok tidak cukup. |
| AB-05 | Harga pada detail pesanan menyimpan harga saat transaksi, bukan hanya harga katalog terbaru. |
| AB-06 | Pesanan hanya dianggap lunas setelah pembayaran terverifikasi. |
| AB-07 | Pesanan yang siap dikirim harus memiliki alamat pengiriman yang lengkap. |
| AB-08 | Nomor resi dicatat jika pengiriman sudah diserahkan kepada kurir. |

**Aturan tambahan/perubahan dan alasannya:** [ISI SENDIRI]

## 6. Kebutuhan informasi
Contoh awal; tentukan rincian periode, filter, dan pengguna yang membutuhkan.

| ID | Kebutuhan informasi | Pengguna | Periode/filter |
|---|---|---|---|
| KI-01 | Total nilai pesanan per hari dan per bulan | Pemilik/Admin | Harian dan bulanan |
| KI-02 | Produk terlaris berdasarkan jumlah terjual | Admin | Bulanan |
| KI-03 | Daftar produk dengan stok rendah | Admin/Gudang | Saat laporan dibuat |
| KI-04 | Daftar pesanan yang belum dibayar | Petugas pembayaran | Status belum lunas |
| KI-05 | Daftar pesanan yang belum dikirim dan statusnya | Petugas gudang | Status pemrosesan |

**Definisi perhitungan dan kriteria tiap laporan:** [ISI SENDIRI]

## 7. Matriks CRUD
C = Create, R = Read, U = Update, D = Delete. Periksa bahwa setiap entitas memiliki proses yang membuat atau memasukkan data; jika tidak, jelaskan atau tambahkan proses yang sesuai.

| Proses | Pelanggan | Produk | Kategori | Pesanan | Detail_Pesanan | Pembayaran | Pengiriman |
|---|---|---|---|---|---|---|---|
| PB-01 Kelola katalog | — | C/R/U/D | C/R/U/D | — | — | — | — |
| PB-02 Kelola pelanggan | C/R/U | — | — | — | — | — | — |
| PB-03 Buat pesanan | R | R/U stok | — | C/R | C/R | — | — |
| PB-04 Verifikasi pembayaran | — | — | — | R/U status | — | C/R/U | — |
| PB-05 Proses pengiriman | R | — | — | R/U status | R | — | C/R/U |

**Pemeriksaan:** [ISI SENDIRI: jelaskan kolom tanpa C, penghapusan yang dibatasi, dan apakah hak akses mengubah CRUD.]

## 8. Kamus data (minimal 20 elemen)
Isi tipe data, format, wajib/tidak, aturan validasi, dan penanggung jawab data untuk setiap elemen. Tabel di bawah hanya kerangka awal.

| Entitas | Elemen data | Makna | Tipe/format | Wajib? | Validasi | Penanggung jawab |
|---|---|---|---|---|---|---|
| Pelanggan | id_pelanggan | Identitas unik pelanggan | [ISI SENDIRI] | Ya | Unik, tidak kosong | Admin |
| Pelanggan | nama | Nama pelanggan | [ISI SENDIRI] | Ya | [ISI SENDIRI] | Admin |
| Pelanggan | email | Email akun/kontak | [ISI SENDIRI] | Ya | Format email; aturan keunikan ditentukan | Admin |
| Pelanggan | telepon | Nomor kontak | [ISI SENDIRI] | Tidak/Ya: tentukan | [ISI SENDIRI] | Admin |
| Produk | id_produk | Identitas produk | [ISI SENDIRI] | Ya | Unik | Admin |
| Produk | nama_produk | Nama produk | [ISI SENDIRI] | Ya | Tidak kosong | Admin |
| Produk | harga_aktif | Harga katalog saat ini | [ISI SENDIRI] | Ya | Tidak negatif | Admin |
| Produk | stok | Jumlah stok tersedia | [ISI SENDIRI] | Ya | Bilangan bulat, tidak negatif | Gudang |
| Kategori | id_kategori | Identitas kategori | [ISI SENDIRI] | Ya | Unik | Admin |
| Kategori | nama_kategori | Nama kategori | [ISI SENDIRI] | Ya | [ISI SENDIRI] | Admin |
| Pesanan | id_pesanan | Nomor pesanan | [ISI SENDIRI] | Ya | Unik | Admin |
| Pesanan | tanggal_pesanan | Waktu pesanan dibuat | [ISI SENDIRI] | Ya | Format tanggal/waktu valid | Sistem/Admin |
| Pesanan | status_pesanan | Tahap pemrosesan | [ISI SENDIRI] | Ya | Pilihan status terdefinisi | Admin |
| Pesanan | alamat_saat_pesan | Alamat tujuan pesanan | [ISI SENDIRI] | Ya jika dikirim | [ISI SENDIRI] | Pelanggan/Admin |
| Detail_Pesanan | jumlah | Kuantitas item | [ISI SENDIRI] | Ya | Bilangan bulat positif; batas transaksi 8 item sesuai parameter | Sistem |
| Detail_Pesanan | harga_saat_pesan | Harga per unit saat dipesan | [ISI SENDIRI] | Ya | Tidak negatif; tidak berubah saat katalog berubah | Sistem/Admin |
| Detail_Pesanan | subtotal | Jumlah × harga per unit | [ISI SENDIRI] | Ya/hasil hitung | Rumus konsisten | Sistem |
| Pembayaran | id_pembayaran | Identitas pembayaran | [ISI SENDIRI] | Ya | Unik | Petugas pembayaran |
| Pembayaran | jumlah_bayar | Nilai pembayaran | [ISI SENDIRI] | Ya | Tidak negatif | Petugas pembayaran |
| Pembayaran | status_pembayaran | Status verifikasi | [ISI SENDIRI] | Ya | Pilihan status terdefinisi | Petugas pembayaran |
| Pengiriman | kurir | Penyedia jasa pengiriman | [ISI SENDIRI] | Saat dikirim | [ISI SENDIRI] | Gudang |
| Pengiriman | nomor_resi | Nomor pelacakan | [ISI SENDIRI] | Setelah diserahkan ke kurir | [ISI SENDIRI] | Gudang |

Tambahkan atau perbaiki elemen agar mencapai minimal 20 dan pastikan definisi serta tipe datanya konsisten.

## 9. Parameter NIM
Tiga digit terakhir yang diberikan: `068`. Dua digit terakhir = 68.

P = (68 mod 9) + 1 = 6  
Maksimum item per transaksi = P + 2 = 8  
Nilai parameter diskon/denda harian = P × Rp1.000 = Rp6.000  
Estimasi transaksi per hari = 40 + 5P = 70

## 10. Kebutuhan nonfungsional, privasi, dan hak akses
Tuliskan kebutuhan yang bisa diuji, bukan hanya kata “aman”, “cepat”, atau “akurat”.

| Aspek | Contoh rumusan terukur (sesuaikan dengan kebutuhan nyata) |
|---|---|
| Kinerja | [ISI SENDIRI: tentukan operasi, kondisi uji, dan batas waktu respons] |
| Keakuratan | [ISI SENDIRI: tentukan rekonsiliasi stok/pembayaran dan hasil yang diharapkan] |
| Privasi | Data alamat dan kontak pelanggan hanya dapat diakses oleh peran yang membutuhkannya untuk pemrosesan pesanan. |
| Hak akses | [ISI SENDIRI: tentukan tindakan Admin, Pelanggan, Petugas Pembayaran, dan Gudang] |
| Audit | [ISI SENDIRI: tentukan perubahan apa yang dicatat dan siapa yang dapat melihat log] |

## 11. Risiko kualitas data
- Email pelanggan ganda atau tidak valid.
- Stok katalog tidak sesuai stok fisik.
- Jumlah pembayaran tidak cocok dengan total pesanan.
- Alamat pengiriman tidak lengkap.
- Harga katalog berubah sehingga bukti transaksi lama harus tetap memakai harga saat pemesanan.

**Prioritas risiko dan cara pencegahan:** [ISI SENDIRI]

## 12. Catatan validasi
[ISI SENDIRI: tuliskan hal yang masih belum pasti, keputusan yang kamu ambil, dan alasan keputusan.]
