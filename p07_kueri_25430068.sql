-- =====================================================
-- MODUL 7: KUERI KLIKKITA STORE
-- Nama  : Abima Saputra
-- NPM   : 25430068
-- Kelas : C
-- Database: db_klikkita_store
-- Materi: SELECT dan Fungsi Skalar
-- =====================================================

USE db_klikkita_store;

-- 1. Menampilkan seluruh produk
SELECT sku_barang, nama_barang, kategori_barang, harga_barang, stok_barang, status_barang
FROM barang
ORDER BY nama_barang ASC;

-- 2. Menampilkan kategori produk
SELECT DISTINCT kategori_barang
FROM barang
ORDER BY kategori_barang ASC;

-- 3. Menampilkan produk kategori Alat Tulis dan Elektronik
SELECT sku_barang, nama_barang, kategori_barang, harga_barang
FROM barang
WHERE kategori_barang IN ('Alat Tulis', 'Elektronik')
ORDER BY kategori_barang, nama_barang;

-- 4. Menampilkan produk dengan harga Rp10.000 sampai Rp50.000
SELECT nama_barang, harga_barang
FROM barang
WHERE harga_barang BETWEEN 10000 AND 50000
ORDER BY harga_barang ASC;

-- 5. Mencari produk dengan SKU yang diawali ATK
SELECT sku_barang, nama_barang, harga_barang
FROM barang
WHERE sku_barang LIKE 'ATK%'
ORDER BY sku_barang;

-- 6. Menampilkan nama produk dalam huruf kapital
SELECT UPPER(nama_barang) AS nama_produk,
       FORMAT(harga_barang, 0, 'id_ID') AS harga_rupiah
FROM barang
ORDER BY nama_barang;

-- 7. Menampilkan produk dengan stok kurang dari 50
SELECT sku_barang, nama_barang, stok_barang,
       CASE
           WHEN stok_barang < 20 THEN 'Stok sangat sedikit'
           ELSE 'Stok perlu diperhatikan'
       END AS keterangan_stok
FROM barang
WHERE stok_barang < 50
ORDER BY stok_barang ASC;

-- 8. Menampilkan pelanggan berdasarkan tanggal pendaftaran
SELECT nama_pelanggan, email_pelanggan,
       DATE_FORMAT(tgl_daftar_pelanggan, '%d-%m-%Y') AS tanggal_daftar
FROM pelanggan
WHERE tgl_daftar_pelanggan BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY tgl_daftar_pelanggan ASC;

-- 9. Menampilkan pelanggan aktif
SELECT CONCAT(UPPER(nama_pelanggan), ' - ', email_pelanggan) AS identitas_pelanggan,
       IFNULL(no_hp_pelanggan, '-') AS nomor_hp,
       status_pelanggan
FROM pelanggan
WHERE status_pelanggan = 'aktif'
ORDER BY nama_pelanggan ASC;

-- 10. Menampilkan pesanan berdasarkan tanggal
SELECT no_pesanan, tgl_pesanan, status_pesanan, nama_penerima_pesanan
FROM pesanan
WHERE tgl_pesanan >= '2026-10-01'
  AND tgl_pesanan < '2026-10-03'
ORDER BY tgl_pesanan ASC;

-- 11. Menampilkan pesanan berdasarkan status
SELECT no_pesanan, status_pesanan,
       CASE
           WHEN status_pesanan = 'menunggu_pembayaran' THEN 'Belum dibayar'
           WHEN status_pesanan = 'dibatalkan' THEN 'Transaksi dibatalkan'
           ELSE 'Status lainnya'
       END AS keterangan
FROM pesanan
WHERE status_pesanan IN ('menunggu_pembayaran', 'dibatalkan')
ORDER BY no_pesanan ASC;

-- 12. Menampilkan pembayaran tanpa waktu pembayaran
SELECT id_pembayaran, no_pesanan, metode_pembayaran,
       status_pembayaran, waktu_bayar
FROM pembayaran
WHERE waktu_bayar IS NULL
ORDER BY id_pembayaran ASC;

-- 13. Menampilkan pembayaran QRIS atau E-Wallet yang berhasil
SELECT id_pembayaran, no_pesanan, metode_pembayaran,
       nominal_pembayaran, status_pembayaran
FROM pembayaran
WHERE metode_pembayaran IN ('QRIS', 'E-Wallet')
  AND status_pembayaran = 'berhasil'
ORDER BY nominal_pembayaran DESC
LIMIT 10;

-- 14. Menampilkan pengiriman yang memiliki nomor resi
SELECT no_pesanan, kurir_pengiriman, no_resi, tgl_kirim, status_pengiriman
FROM pengiriman
WHERE no_resi IS NOT NULL
ORDER BY tgl_kirim DESC;

-- 15. Menampilkan status pengiriman
SELECT no_pesanan, kurir_pengiriman, no_resi,
       CASE
           WHEN status_pengiriman = 'diterima' THEN 'Pesanan telah diterima'
           WHEN status_pengiriman = 'dikirim' THEN 'Pesanan dalam perjalanan'
           ELSE 'Menunggu proses pengiriman'
       END AS keterangan_pengiriman
FROM pengiriman
ORDER BY no_pesanan ASC;
