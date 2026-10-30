-- =====================================================
-- MODUL 5: DDL KLIKKITA STORE
-- Nama  : Abima Saputra
-- NPM   : 25430068
-- Kelas : C
-- DB    : db_klikkita_store
-- =====================================================

CREATE DATABASE IF NOT EXISTS db_klikkita_store;
USE db_klikkita_store;

-- 1. TABEL PELANGGAN
CREATE TABLE pelanggan (
    id_pelanggan INT NOT NULL AUTO_INCREMENT,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email_pelanggan VARCHAR(100) NOT NULL,
    no_hp_pelanggan VARCHAR(20) NOT NULL,
    tgl_daftar_pelanggan DATE NOT NULL,
    status_pelanggan ENUM('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
    PRIMARY KEY (id_pelanggan),
    UNIQUE KEY uq_pelanggan_email (email_pelanggan)
) ENGINE=InnoDB;

-- 2. TABEL ALAMAT PELANGGAN
CREATE TABLE alamat_pelanggan (
    id_alamat INT NOT NULL AUTO_INCREMENT,
    id_pelanggan INT NOT NULL,
    label_alamat VARCHAR(30) NOT NULL,
    penerima_alamat VARCHAR(100) NOT NULL,
    alamat_lengkap TEXT NOT NULL,
    kota_alamat VARCHAR(80) NOT NULL,
    kode_pos CHAR(5) NOT NULL,
    PRIMARY KEY (id_alamat),
    CONSTRAINT fk_alamat_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan (id_pelanggan)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- 3. TABEL BARANG
CREATE TABLE barang (
    id_barang INT NOT NULL AUTO_INCREMENT,
    sku_barang VARCHAR(20) NOT NULL,
    nama_barang VARCHAR(120) NOT NULL,
    kategori_barang VARCHAR(60) NOT NULL,
    harga_barang DECIMAL(12,2) NOT NULL,
    stok_barang INT NOT NULL DEFAULT 0,
    status_barang ENUM('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
    PRIMARY KEY (id_barang),
    UNIQUE KEY uq_barang_sku (sku_barang),
    CONSTRAINT ck_barang_harga CHECK (harga_barang >= 0),
    CONSTRAINT ck_barang_stok CHECK (stok_barang >= 0)
) ENGINE=InnoDB;

-- 4. TABEL KERANJANG
CREATE TABLE keranjang (
    id_keranjang INT NOT NULL AUTO_INCREMENT,
    id_pelanggan INT NOT NULL,
    tgl_dibuat_keranjang DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_keranjang ENUM('aktif','checkout','dibatalkan') NOT NULL DEFAULT 'aktif',
    PRIMARY KEY (id_keranjang),
    CONSTRAINT fk_keranjang_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan (id_pelanggan)
) ENGINE=InnoDB;

-- 5. TABEL DETAIL KERANJANG
CREATE TABLE detail_keranjang (
    id_keranjang INT NOT NULL,
    id_barang INT NOT NULL,
    qty_detail_keranjang SMALLINT NOT NULL,
    PRIMARY KEY (id_keranjang, id_barang),
    CONSTRAINT fk_detail_keranjang
        FOREIGN KEY (id_keranjang)
        REFERENCES keranjang (id_keranjang)
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_keranjang_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_qty_keranjang
        CHECK (qty_detail_keranjang > 0)
) ENGINE=InnoDB;

-- 6. TABEL PESANAN
CREATE TABLE pesanan (
    no_pesanan VARCHAR(25) NOT NULL,
    id_pelanggan INT NOT NULL,
    tgl_pesanan DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status_pesanan ENUM(
        'menunggu_pembayaran',
        'diproses',
        'dikirim',
        'selesai',
        'dibatalkan'
    ) NOT NULL DEFAULT 'menunggu_pembayaran',
    nama_penerima_pesanan VARCHAR(100) NOT NULL,
    alamat_pengiriman_pesanan TEXT NOT NULL,
    ongkir_pesanan DECIMAL(12,2) NOT NULL DEFAULT 0,
    persen_diskon_pesanan DECIMAL(5,2) NOT NULL DEFAULT 0,
    PRIMARY KEY (no_pesanan),
    CONSTRAINT fk_pesanan_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan (id_pelanggan),
    CONSTRAINT ck_ongkir_pesanan CHECK (ongkir_pesanan >= 0),
    CONSTRAINT ck_diskon_pesanan
        CHECK (persen_diskon_pesanan BETWEEN 0 AND 100)
) ENGINE=InnoDB;

-- 7. TABEL DETAIL PESANAN
CREATE TABLE detail_pesanan (
    no_pesanan VARCHAR(25) NOT NULL,
    id_barang INT NOT NULL,
    nama_barang_snapshot VARCHAR(120) NOT NULL,
    qty_detail_pesanan SMALLINT NOT NULL,
    harga_satuan_pesanan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (no_pesanan, id_barang),
    CONSTRAINT fk_detail_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan (no_pesanan)
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_pesanan_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_qty_pesanan CHECK (qty_detail_pesanan > 0),
    CONSTRAINT ck_harga_pesanan CHECK (harga_satuan_pesanan >= 0)
) ENGINE=InnoDB;

-- 8. TABEL PEMBAYARAN
CREATE TABLE pembayaran (
    id_pembayaran INT NOT NULL AUTO_INCREMENT,
    no_pesanan VARCHAR(25) NOT NULL,
    waktu_bayar DATETIME NULL,
    metode_pembayaran VARCHAR(40) NOT NULL,
    nominal_pembayaran DECIMAL(12,2) NOT NULL,
    status_pembayaran ENUM(
        'menunggu',
        'berhasil',
        'gagal',
        'dikembalikan'
    ) NOT NULL DEFAULT 'menunggu',
    referensi_pembayaran VARCHAR(100) NULL,
    PRIMARY KEY (id_pembayaran),
    CONSTRAINT fk_pembayaran_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan (no_pesanan),
    CONSTRAINT ck_nominal_pembayaran
        CHECK (nominal_pembayaran >= 0)
) ENGINE=InnoDB;

-- 9. TABEL PENGIRIMAN
CREATE TABLE pengiriman (
    id_pengiriman INT NOT NULL AUTO_INCREMENT,
    no_pesanan VARCHAR(25) NOT NULL,
    kurir_pengiriman VARCHAR(50) NOT NULL,
    ongkir_pengiriman DECIMAL(12,2) NOT NULL,
    no_resi VARCHAR(60) NULL,
    tgl_kirim DATETIME NULL,
    status_pengiriman ENUM(
        'menunggu',
        'dikemas',
        'dikirim',
        'diterima',
        'gagal'
    ) NOT NULL DEFAULT 'menunggu',
    PRIMARY KEY (id_pengiriman),
    CONSTRAINT fk_pengiriman_pesanan
        FOREIGN KEY (no_pesanan)
        REFERENCES pesanan (no_pesanan),
    CONSTRAINT uq_pengiriman_resi UNIQUE (no_resi),
    CONSTRAINT ck_ongkir_pengiriman CHECK (ongkir_pengiriman >= 0)
) ENGINE=InnoDB;

-- PEMERIKSAAN STRUKTUR
SHOW TABLES;
SHOW CREATE TABLE pelanggan;
SHOW CREATE TABLE pesanan;
SHOW CREATE TABLE detail_pesanan;

-- CATATAN:
-- Subtotal = qty_detail_pesanan * harga_satuan_pesanan.
-- Total tagihan dihitung dari subtotal, ongkir, dan diskon.
-- Nilai turunan tidak disimpan sebagai kolom biasa.