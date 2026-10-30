# Dokumen Normalisasi & Skema Relasional - KlikKita Store

**Nama Pengembang:** Abima Saputra  
**NIM:** 25430068  
**Kode Tema:** toko_daring  
**Nama Basis Data:** db_klik kita_store

---

## 1. Dokumen Sumber & Unnormalized Form (UNF)

Titik awal normalisasi diambil dari dokumen **Ringkasan Checkout dan Invoice Pesanan Daring** pada Modul 2. Dokumen tersebut memuat informasi pelanggan, alamat pengiriman, barang yang dibeli, pembayaran, dan pengiriman.

`INVOICE_UNF (no_pesanan, tgl_pesanan, id_pelanggan, nama_pelanggan, email_pelanggan, no_hp_pelanggan, nama_penerima_pesanan, alamat_pengiriman_pesanan, {id_barang, sku_barang, nama_barang, kategori_barang, qty_detail_pesanan, harga_satuan_pesanan, subtotal_detail}, ongkir_pesanan, persen_diskon_pesanan, total_tagihan_pesanan, status_pesanan, {id_pembayaran, waktu_bayar, metode_pembayaran, nominal_pembayaran, status_pembayaran}, id_pengiriman, kurir_pengiriman, no_resi, tgl_kirim, status_pengiriman)`

---

## 2. First Normal Form (1NF)

Menghilangkan grup berulang pada daftar barang dan pembayaran. Setiap baris hanya memuat satu barang dalam satu pesanan. Kunci komposit yang digunakan adalah (`no_pesanan`, `id_barang`).

`INVOICE_1NF (no_pesanan, id_barang, tgl_pesanan, id_pelanggan, nama_pelanggan, email_pelanggan, no_hp_pelanggan, nama_penerima_pesanan, alamat_pengiriman_pesanan, sku_barang, nama_barang, kategori_barang, qty_detail_pesanan, harga_satuan_pesanan, subtotal_detail, ongkir_pesanan, persen_diskon_pesanan, total_tagihan_pesanan, status_pesanan, id_pembayaran, waktu_bayar, metode_pembayaran, nominal_pembayaran, status_pembayaran, id_pengiriman, kurir_pengiriman, no_resi, tgl_kirim, status_pengiriman)`

---

## 3. Dependensi Fungsional (FD) Berbasis Aturan Bisnis

- **FD1:** `no_pesanan` → `tgl_pesanan`, `id_pelanggan`, `nama_penerima_pesanan`, `alamat_pengiriman_pesanan`, `ongkir_pesanan`, `persen_diskon_pesanan`, `status_pesanan` (AB-03, AB-06, AB-07, AB-08).
- **FD2:** `id_pelanggan` → `nama_pelanggan`, `email_pelanggan`, `no_hp_pelanggan`.
- **FD3:** `id_barang` → `sku_barang`, `nama_barang`, `kategori_barang`, `harga_barang`, `stok_barang` (AB-01, AB-04).
- **FD4:** (`no_pesanan`, `id_barang`) → `qty_detail_pesanan`, `harga_satuan_pesanan` (AB-02, AB-05).
- **FD5:** `id_keranjang` → `id_pelanggan`, `tgl_dibuat_keranjang`, `status_keranjang`.
- **FD6:** (`id_keranjang`, `id_barang`) → `qty_detail_keranjang`.
- **FD7:** `id_pembayaran` → `no_pesanan`, `waktu_bayar`, `metode_pembayaran`, `nominal_pembayaran`, `status_pembayaran` (AB-09).
- **FD8:** `id_pengiriman` → `no_pesanan`, `kurir_pengiriman`, `no_resi`, `tgl_kirim`, `status_pengiriman` (AB-10).
- **FD9 (Turunan):** (`qty_detail_pesanan`, `harga_satuan_pesanan`) → `subtotal_detail`.

---

## 4. Second Normal Form (2NF)

Menghilangkan ketergantungan parsial pada kunci komposit (`no_pesanan`, `id_barang`):

- `PESANAN` (**no_pesanan**, `tgl_pesanan`, `id_pelanggan`, `nama_pelanggan`, `email_pelanggan`, `no_hp_pelanggan`, `nama_penerima_pesanan`, `alamat_pengiriman_pesanan`, `ongkir_pesanan`, `persen_diskon_pesanan`, `status_pesanan`)
- `DETAIL_PESANAN` (**no_pesanan***, **id_barang***, `qty_detail_pesanan`, `harga_satuan_pesanan`)
- `BARANG` (**id_barang**, `sku_barang`, `nama_barang`, `kategori_barang`, `harga_barang`, `stok_barang`)
- `KERANJANG` (**id_keranjang**, `id_pelanggan`, `tgl_dibuat_keranjang`, `status_keranjang`)
- `DETAIL_KERANJANG` (**id_keranjang***, **id_barang***, `qty_detail_keranjang`)
- `PEMBAYARAN` (**id_pembayaran**, `no_pesanan`, `waktu_bayar`, `metode_pembayaran`, `nominal_pembayaran`, `status_pembayaran`)
- `PENGIRIMAN` (**id_pengiriman**, `no_pesanan`, `kurir_pengiriman`, `no_resi`, `tgl_kirim`, `status_pengiriman`)

---

## 5. Third Normal Form (3NF)

Menghilangkan ketergantungan transitif, yaitu data pelanggan yang bergantung pada `id_pelanggan`, bukan langsung pada `no_pesanan`. Data barang juga dipisahkan dari detail transaksi. Harga satuan dan nama barang pada detail pesanan tetap disimpan sebagai snapshot untuk menjaga riwayat transaksi.

Hasil akhir skema relasional:

1. **`PELANGGAN`** (**id_pelanggan**, `nama_pelanggan`, `email_pelanggan`, `no_hp_pelanggan`, `tgl_daftar_pelanggan`, `status_pelanggan`)
2. **`ALAMAT_PELANGGAN`** (**id_alamat**, `id_pelanggan*`, `label_alamat`, `penerima_alamat`, `alamat_lengkap`, `kota_alamat`, `kode_pos`)
3. **`BARANG`** (**id_barang**, `sku_barang`, `nama_barang`, `kategori_barang`, `harga_barang`, `stok_barang`, `status_barang`)
4. **`KERANJANG`** (**id_keranjang**, `id_pelanggan*`, `tgl_dibuat_keranjang`, `status_keranjang`)
5. **`DETAIL_KERANJANG`** (**id_keranjang***, **id_barang***, `qty_detail_keranjang`)
6. **`PESANAN`** (**no_pesanan**, `id_pelanggan*`, `tgl_pesanan`, `status_pesanan`, `nama_penerima_pesanan`, `alamat_pengiriman_pesanan`, `ongkir_pesanan`, `persen_diskon_pesanan`)
7. **`DETAIL_PESANAN`** (**no_pesanan***, **id_barang***, `nama_barang_snapshot`, `qty_detail_pesanan`, `harga_satuan_pesanan`)
8. **`PEMBAYARAN`** (**id_pembayaran**, `no_pesanan*`, `waktu_bayar`, `metode_pembayaran`, `nominal_pembayaran`, `status_pembayaran`, `referensi_pembayaran`)
9. **`PENGIRIMAN`** (**id_pengiriman**, `no_pesanan*`, `kurir_pengiriman`, `ongkir_pengiriman`, `no_resi`, `tgl_kirim`, `status_pengiriman`)

---

## 6. Pemeriksaan Boyce-Codd Normal Form (BCNF)

Evaluasi dependensi fungsional pada seluruh tabel hasil 3NF:

- Pada tabel `PELANGGAN`, penentu `id_pelanggan` merupakan kunci utama. Jika email diwajibkan unik, `email_pelanggan` juga dapat menjadi kunci kandidat.
- Pada tabel `ALAMAT_PELANGGAN`, penentu `id_alamat` merupakan kunci utama.
- Pada tabel `BARANG`, penentu `id_barang` dan `sku_barang` merupakan kunci kandidat karena keduanya bersifat unik.
- Pada tabel `KERANJANG`, penentu `id_keranjang` merupakan kunci utama.
- Pada tabel `DETAIL_KERANJANG`, gabungan `id_keranjang` dan `id_barang` merupakan kunci kandidat.
- Pada tabel `PESANAN`, penentu `no_pesanan` merupakan kunci utama.
- Pada tabel `DETAIL_PESANAN`, gabungan `no_pesanan` dan `id_barang` merupakan kunci kandidat.
- Pada tabel `PEMBAYARAN`, penentu `id_pembayaran` merupakan kunci utama.
- Pada tabel `PENGIRIMAN`, penentu `id_pengiriman` merupakan kunci utama.

**Kesimpulan:** Dengan asumsi setiap penentu pada relasi akhir merupakan kunci kandidat dan tidak terdapat dependensi fungsional lain yang melanggar, seluruh relasi memenuhi BCNF.

---

## 7. Keputusan Penyimpanan Nilai Turunan

- Atribut `subtotal_detail` (`qty_detail_pesanan × harga_satuan_pesanan`), `total_harga_item`, dan `total_tagihan_pesanan` tidak disimpan sebagai nilai turunan yang dihitung ulang pada basis data operasional OLTP.
- **Alasan:** Nilai tersebut dapat dihitung menggunakan kueri dinamis. Subtotal dihitung dari kuantitas dikalikan harga satuan, sedangkan total tagihan dihitung dari jumlah seluruh subtotal, ditambah ongkos kirim, kemudian dikurangi diskon sesuai kebijakan promosi.
- **Atribut historis tetap disimpan:** `harga_satuan_pesanan`, `nama_barang_snapshot`, `alamat_pengiriman_pesanan`, dan `ongkir_pesanan` tetap disimpan karena nilainya harus menggambarkan kondisi ketika transaksi dilakukan.
- **Tujuan:** Mengurangi redundansi data, mencegah anomali pembaruan, dan menjaga konsistensi informasi transaksi KlikKita Store.