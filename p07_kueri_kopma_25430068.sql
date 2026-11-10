-- =====================================================
-- MODUL 7: KUERI KOPMA
-- Nama  : Abima Saputra
-- NPM   : 25430068
-- Kelas : C
-- Database: kopma_068
-- Materi: SELECT dan Fungsi Skalar
-- =====================================================

USE kopma_068;

-- 1. Menampilkan barang yang stoknya di bawah stok minimum
SELECT
    kode_barang,
    nama_barang,
    stok_barang,
    stok_min_barang,
    stok_min_barang - stok_barang AS kurang
FROM barang
WHERE stok_barang < stok_min_barang
ORDER BY kurang DESC;

-- 2. Menampilkan barang kategori ATK atau minuman
SELECT
    kode_barang,
    nama_barang,
    kategori_barang,
    harga_jual_barang
FROM barang
WHERE kategori_barang IN ('ATK', 'minuman')
ORDER BY kategori_barang, nama_barang;

-- 3. Menampilkan penjualan selama September 2026
SELECT
    no_nota_penjualan,
    tgl_penjualan,
    bayar_penjualan
FROM penjualan
WHERE tgl_penjualan >= '2026-09-01'
  AND tgl_penjualan < '2026-10-01'
ORDER BY tgl_penjualan ASC;

-- 4. Menampilkan anggota yang belum memiliki nomor HP
SELECT
    no_anggota,
    nama_anggota,
    prodi_anggota
FROM anggota
WHERE no_hp_anggota IS NULL
ORDER BY nama_anggota;

-- 5. Mencari anggota yang namanya mengandung huruf a
-- Disesuaikan dengan struktur tabel anggota yang tidak memiliki kolom tanggal daftar.
SELECT
    CONCAT(nama_anggota, ' (', no_anggota, ')') AS anggota,
    UPPER(prodi_anggota) AS program_studi,
    IFNULL(no_hp_anggota, '-') AS hp,
    CASE
        WHEN status_anggota = 'aktif' THEN 'Anggota Aktif'
        ELSE 'Anggota Nonaktif'
    END AS keterangan
FROM anggota
WHERE nama_anggota LIKE '%a%'
ORDER BY nama_anggota ASC
LIMIT 5;

-- 6. Menampilkan detail penjualan dan subtotal setiap barang
SELECT
    id_penjualan,
    id_barang,
    qty_detail_penjualan,
    harga_satuan_detail_penjualan,
    qty_detail_penjualan * harga_satuan_detail_penjualan AS subtotal
FROM detail_penjualan
WHERE id_penjualan = 1
ORDER BY id_barang;

-- 7. Menampilkan nama barang dalam huruf kapital dan harga Rupiah
SELECT
    kode_barang,
    UPPER(nama_barang) AS nama_barang,
    CONCAT('Rp', FORMAT(harga_jual_barang, 0, 'id_ID')) AS harga
FROM barang
ORDER BY nama_barang ASC;

-- 8. Menampilkan barang dengan harga Rp4.000 sampai Rp7.000
SELECT
    kode_barang,
    nama_barang,
    harga_jual_barang
FROM barang
WHERE harga_jual_barang BETWEEN 4000 AND 7000
ORDER BY harga_jual_barang ASC;

-- 9. Menampilkan anggota dan keterangan status
SELECT
    no_anggota,
    nama_anggota,
    UPPER(prodi_anggota) AS program_studi,
    CASE
        WHEN status_anggota = 'aktif' THEN 'ANGGOTA AKTIF'
        ELSE 'ANGGOTA NONAKTIF'
    END AS keterangan_status
FROM anggota
ORDER BY nama_anggota ASC;
