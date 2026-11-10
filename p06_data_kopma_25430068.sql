-- =====================================================
-- MODUL 6: DATA KOPMA
-- Nama: Abima Saputra | NPM: 25430068 | Kelas: C
-- Database: kopma_068
-- Jalankan setelah p05_ddl_kopma_25430068.sql pada database kosong.
-- =====================================================
USE kopma_068;

INSERT INTO petugas (id_petugas,kode_petugas,nama_petugas,peran_petugas) VALUES
(1,'PT1','Ari Wibowo','kasir'),
(2,'PT2','Maya Sari','gudang'),
(3,'PT3','Dian Pratama','ketua');

INSERT INTO anggota (id_anggota,no_anggota,nim_anggota,nama_anggota,prodi_anggota,no_hp_anggota,status_anggota) VALUES
(1,'AG0001','2543006801','Rani Putri','Sosiologi','081234560101','aktif'),
(2,'AG0002','2543006802','Fajar Nugraha','Manajemen','081234560102','aktif'),
(3,'AG0003','2543006803','Intan Permata','Akuntansi','081234560103','nonaktif');

INSERT INTO barang (id_barang,kode_barang,nama_barang,kategori_barang,harga_jual_barang,stok_barang,stok_min_barang) VALUES
(1,'ATK001','Buku Tulis','ATK',5000,100,10),
(2,'ATK002','Pulpen','ATK',3000,120,10),
(3,'MKN001','Roti Cokelat','makanan',7000,50,5),
(4,'MKN002','Biskuit','makanan',8000,60,5),
(5,'MNM001','Air Mineral','minuman',4000,80,10),
(6,'MNM002','Teh Kotak','minuman',6000,70,10);

INSERT INTO pemasok (id_pemasok,kode_pemasok,nama_pemasok,telepon_pemasok,alamat_pemasok) VALUES
(1,'PS001','CV Sumber ATK','0721123001','Jl. Pendidikan No. 10, Bandar Lampung'),
(2,'PS002','PT Pangan Sejahtera','0721123002','Jl. Pasar No. 5, Bandar Lampung');

-- Data pembelian dan detail pembelian
INSERT INTO pembelian (id_pembelian,no_faktur_pembelian,tgl_pembelian,id_pemasok,status_pembelian) VALUES
(1,'PB-2609-001','2026-09-01',1,'diterima'),
(2,'PB-2609-002','2026-09-03',2,'diterima');

INSERT INTO detail_pembelian (id_pembelian,id_barang,qty_detail_pembelian,harga_beli_detail_pembelian) VALUES
(1,1,50,3500),(1,2,60,1800),(2,3,30,5000),(2,4,40,6000),(2,5,50,2500);

-- Nota contoh mengikuti pola nomor nota pada modul.
INSERT INTO penjualan (id_penjualan,no_nota_penjualan,tgl_penjualan,id_petugas,id_anggota,bayar_penjualan) VALUES
(1,'PJ-2609-0142','2026-09-10 09:15:00',1,1,8000),
(2,'PJ-2609-0143','2026-09-10 10:20:00',1,NULL,11000),
(3,'PJ-2609-0144','2026-09-11 13:05:00',2,2,9000);

-- INSERT ... SELECT digunakan untuk mengambil harga jual barang sebagai snapshot.
INSERT INTO detail_penjualan (id_penjualan,id_barang,qty_detail_penjualan,harga_satuan_detail_penjualan)
SELECT 1,id_barang,1,harga_jual_barang
FROM barang WHERE id_barang IN (1,2);

INSERT INTO detail_penjualan (id_penjualan,id_barang,qty_detail_penjualan,harga_satuan_detail_penjualan)
SELECT 2,id_barang,1,harga_jual_barang
FROM barang WHERE id_barang IN (3,5);

INSERT INTO detail_penjualan (id_penjualan,id_barang,qty_detail_penjualan,harga_satuan_detail_penjualan)
SELECT 3,id_barang,1,harga_jual_barang
FROM barang WHERE id_barang IN (2,6);

-- Penyesuaian stok setelah transaksi contoh.
UPDATE barang SET stok_barang = stok_barang - 1 WHERE id_barang IN (1,3,5,6);
UPDATE barang SET stok_barang = stok_barang - 2 WHERE id_barang = 2;

-- Pemeriksaan jumlah data
SELECT 'petugas' AS tabel,COUNT(*) AS jumlah FROM petugas
UNION ALL SELECT 'anggota',COUNT(*) FROM anggota
UNION ALL SELECT 'barang',COUNT(*) FROM barang
UNION ALL SELECT 'pemasok',COUNT(*) FROM pemasok
UNION ALL SELECT 'penjualan',COUNT(*) FROM penjualan
UNION ALL SELECT 'detail_penjualan',COUNT(*) FROM detail_penjualan
UNION ALL SELECT 'pembelian',COUNT(*) FROM pembelian
UNION ALL SELECT 'detail_pembelian',COUNT(*) FROM detail_pembelian;
