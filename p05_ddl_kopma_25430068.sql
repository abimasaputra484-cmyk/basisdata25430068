-- =====================================================
-- MODUL 5: DDL KOPMA
-- Nama  : Abima Saputra
-- NPM   : 25430068
-- Kelas : C
-- =====================================================

USE kopma_068;

-- 1. TABEL PETUGAS
CREATE TABLE petugas (
    id_petugas SMALLINT NOT NULL AUTO_INCREMENT,
    kode_petugas CHAR(3) NOT NULL,
    nama_petugas VARCHAR(100) NOT NULL,
    peran_petugas ENUM('kasir','gudang','ketua') NOT NULL,
    PRIMARY KEY (id_petugas),
    UNIQUE KEY uq_petugas_kode (kode_petugas)
) ENGINE=InnoDB;

-- 2. TABEL ANGGOTA
CREATE TABLE anggota (
    id_anggota INT NOT NULL AUTO_INCREMENT,
    no_anggota CHAR(6) NOT NULL,
    nim_anggota CHAR(10) NOT NULL,
    nama_anggota VARCHAR(100) NOT NULL,
    prodi_anggota VARCHAR(80) NOT NULL,
    no_hp_anggota VARCHAR(20) NOT NULL,
    status_anggota ENUM('aktif','nonaktif') NOT NULL DEFAULT 'aktif',
    PRIMARY KEY (id_anggota),
    UNIQUE KEY uq_anggota_nomor (no_anggota),
    UNIQUE KEY uq_anggota_nim (nim_anggota)
) ENGINE=InnoDB;

-- 3. TABEL BARANG
CREATE TABLE barang (
    id_barang INT NOT NULL AUTO_INCREMENT,
    kode_barang VARCHAR(10) NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    kategori_barang ENUM('ATK','makanan','minuman') NOT NULL,
    harga_jual_barang DECIMAL(12,2) NOT NULL,
    stok_barang INT NOT NULL DEFAULT 0,
    stok_min_barang INT NOT NULL DEFAULT 5,
    PRIMARY KEY (id_barang),
    UNIQUE KEY uq_barang_kode (kode_barang),
    CONSTRAINT ck_barang_stok CHECK (stok_barang >= 0),
    CONSTRAINT ck_barang_stok_min CHECK (stok_min_barang >= 0),
    CONSTRAINT ck_barang_harga CHECK (harga_jual_barang >= 0)
) ENGINE=InnoDB;

-- 4. TABEL PEMASOK
CREATE TABLE pemasok (
    id_pemasok INT NOT NULL AUTO_INCREMENT,
    kode_pemasok VARCHAR(10) NOT NULL,
    nama_pemasok VARCHAR(100) NOT NULL,
    telepon_pemasok VARCHAR(20) NOT NULL,
    alamat_pemasok TEXT NOT NULL,
    PRIMARY KEY (id_pemasok),
    UNIQUE KEY uq_pemasok_kode (kode_pemasok)
) ENGINE=InnoDB;

-- 5. TABEL PENJUALAN
CREATE TABLE penjualan (
    id_penjualan INT NOT NULL AUTO_INCREMENT,
    no_nota_penjualan CHAR(12) NOT NULL,
    tgl_penjualan DATETIME NOT NULL,
    id_petugas SMALLINT NOT NULL,
    id_anggota INT NULL,
    bayar_penjualan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_penjualan),
    UNIQUE KEY uq_penjualan_nota (no_nota_penjualan),
    CONSTRAINT fk_penjualan_petugas
        FOREIGN KEY (id_petugas)
        REFERENCES petugas (id_petugas),
    CONSTRAINT fk_penjualan_anggota
        FOREIGN KEY (id_anggota)
        REFERENCES anggota (id_anggota),
    CONSTRAINT ck_bayar_penjualan CHECK (bayar_penjualan >= 0)
) ENGINE=InnoDB;

-- 6. TABEL DETAIL PENJUALAN
CREATE TABLE detail_penjualan (
    id_penjualan INT NOT NULL,
    id_barang INT NOT NULL,
    qty_detail_penjualan SMALLINT NOT NULL,
    harga_satuan_detail_penjualan DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_penjualan, id_barang),
    CONSTRAINT fk_detail_penjualan
        FOREIGN KEY (id_penjualan)
        REFERENCES penjualan (id_penjualan)
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_detail_qty CHECK (qty_detail_penjualan > 0),
    CONSTRAINT ck_detail_harga
        CHECK (harga_satuan_detail_penjualan >= 0)
) ENGINE=InnoDB;

-- 7. TABEL PEMBELIAN
CREATE TABLE pembelian (
    id_pembelian INT NOT NULL AUTO_INCREMENT,
    no_faktur_pembelian VARCHAR(30) NOT NULL,
    tgl_pembelian DATE NOT NULL,
    id_pemasok INT NOT NULL,
    status_pembelian ENUM('dipesan','diterima','dibatalkan')
        NOT NULL DEFAULT 'dipesan',
    PRIMARY KEY (id_pembelian),
    CONSTRAINT fk_pembelian_pemasok
        FOREIGN KEY (id_pemasok)
        REFERENCES pemasok (id_pemasok)
) ENGINE=InnoDB;

-- 8. TABEL DETAIL PEMBELIAN
CREATE TABLE detail_pembelian (
    id_pembelian INT NOT NULL,
    id_barang INT NOT NULL,
    qty_detail_pembelian SMALLINT NOT NULL,
    harga_beli_detail_pembelian DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_pembelian, id_barang),
    CONSTRAINT fk_detail_pembelian
        FOREIGN KEY (id_pembelian)
        REFERENCES pembelian (id_pembelian)
        ON DELETE CASCADE,
    CONSTRAINT fk_detail_pembelian_barang
        FOREIGN KEY (id_barang)
        REFERENCES barang (id_barang),
    CONSTRAINT ck_qty_pembelian CHECK (qty_detail_pembelian > 0),
    CONSTRAINT ck_harga_beli
        CHECK (harga_beli_detail_pembelian >= 0)
) ENGINE=InnoDB;

-- PEMERIKSAAN STRUKTUR
SHOW TABLES;
SHOW CREATE TABLE penjualan;
SHOW CREATE TABLE detail_penjualan;