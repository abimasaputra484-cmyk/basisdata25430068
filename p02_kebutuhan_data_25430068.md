# Dokumen Kebutuhan Data - KlikKita Store

> Draf milestone proyek Modul 2. Organisasi dan contoh dokumen di bawah
> adalah rancangan fiktif untuk proyek Toko Daring. Tinjau dan sesuaikan
> dengan keputusan desain yang benar-benar kamu pahami sebelum
> dikumpulkan.

## 1. Latar belakang dan aktivitas organisasi

KlikKita Store adalah toko daring fiktif yang menjual perlengkapan
belajar dan aksesori meja kerja. Pelanggan melihat katalog, memasukkan
barang ke keranjang, membuat pesanan, memilih alamat pengiriman,
membayar, lalu menerima nomor resi. Admin katalog memelihara informasi
barang dan harga. Petugas pesanan memverifikasi pembayaran dan
menyiapkan pengiriman. Pengelola memantau penjualan, pembayaran, stok,
dan status pengiriman.

Tema Toko Daring dipilih karena dua digit terakhir NIM adalah 68
(rentang 50--74). Parameter personal: - (P = (68 \\bmod 9) + 1 = 6) -
Batas maksimal item per transaksi = (P+2=8) item. - Persentase diskon =
(P%=6\\%). - Perkiraan volume transaksi harian = (40+5P=70)
transaksi/hari.

Untuk menjaga catatan historis, harga barang, ongkos kirim, dan alamat
yang dipakai harus disimpan pada pesanan atau detail pesanan, bukan
hanya mengacu pada nilai terbaru di data induk.

## 2. Aktor dan proses bisnis

  -----------------------------------------------------------------------
  Kode              Proses bisnis     Aktor             Pemicu
  ----------------- ----------------- ----------------- -----------------
  PB-01             Mengelola katalog Admin katalog     Barang baru
                    barang                              ditambahkan atau
                                                        informasi barang
                                                        berubah

  PB-02             Mengelola         Pelanggan         Pelanggan memilih
                    keranjang                           barang yang akan
                                                        dibeli

  PB-03             Membuat pesanan   Pelanggan         Pelanggan
                                                        menyelesaikan
                                                        checkout

  PB-04             Mencatat dan      Petugas pesanan   Pelanggan
                    memverifikasi                       mengirim
                    pembayaran                          pembayaran

  PB-05             Menyiapkan dan    Petugas           Pembayaran
                    mengirim pesanan  pengiriman        terverifikasi

  PB-06             Memantau          Pengelola         Permintaan
                    penjualan dan                       laporan atau
                    pesanan                             pemeriksaan
                                                        operasional
  -----------------------------------------------------------------------

## 3. Dokumen sumber yang dianalisis

  -----------------------------------------------------------------------
  Dokumen sumber          Elemen yang diambil     Analisis
  ----------------------- ----------------------- -----------------------
  Halaman checkout        ID pelanggan, barang,   Menentukan data
  (rancangan fiktif)      kuantitas, alamat       pelanggan, detail
                          tujuan, metode          pesanan, alamat
                          pengiriman              snapshot, dan ongkos
                                                  kirim

  Bukti pembayaran        ID pembayaran, nomor    Menjadi dasar
  (rancangan fiktif)      pesanan, tanggal,       verifikasi pembayaran;
                          nominal, metode, status nominal harus
                                                  dibandingkan dengan
                                                  jumlah tagihan

  Resi pengiriman         Nomor resi, nomor       Menghubungkan
  (rancangan fiktif)      pesanan, kurir, tanggal pengiriman dengan
                          kirim, status           pesanan dan mendukung
                                                  pelacakan
  -----------------------------------------------------------------------

### Contoh dokumen sumber fiktif: ringkasan checkout

  ----------------------------------------------------------------------------------
  Kolom pada        Contoh nilai       Elemen data tujuan          Catatan
  halaman checkout  fiktif                                         
  ----------------- ------------------ --------------------------- -----------------
  Nomor pesanan     KK-20261013-0001   no_pesanan                  Harus unik

  Nama penerima     Rani Putri         nama_penerima_pesanan       Snapshot untuk
                                                                   pesanan ini

  Alamat pengiriman Jl. Melati No. 10, alamat_pengiriman_pesanan   Snapshot;
                    Kota Contoh                                    perubahan alamat
                                                                   pelanggan tidak
                                                                   mengubah pesanan
                                                                   lama

  Barang            Lampu meja mini    nama_barang pada detail     Mengacu pada
                                       pesanan                     barang katalog

  Kuantitas         2                  qty_detail_pesanan          Bilangan bulat
                                                                   positif

  Harga satuan saat Rp50.000           harga_satuan_pesanan        Disimpan untuk
  checkout                                                         menjaga nilai
                                                                   historis

  Ongkos kirim      Rp12.000           ongkir_pesanan              Disimpan per
                                                                   pesanan

  Diskon            6% jika memenuhi   persen_diskon_pesanan       Mengikuti
                    ketentuan promo                                parameter P;
                                                                   aturan penerapan
                                                                   perlu dipastikan

  Total tagihan     Rp106.000 sebelum  total_tagihan_pesanan       Contoh: 2 ×
                    diskon                                         Rp50.000 +
                                                                   Rp12.000; rumus
                                                                   akhir perlu
                                                                   konsisten dengan
                                                                   kebijakan diskon
  ----------------------------------------------------------------------------------

## 4. Entitas kandidat dan elemen data

  -----------------------------------------------------------------------
  Entitas kandidat        Elemen data utama       Sumber
  ----------------------- ----------------------- -----------------------
  Pelanggan               id_pelanggan, nama,     Halaman akun
                          email, nomor HP,        
                          tanggal daftar, status  

  Alamat pelanggan        id_alamat,              Buku alamat/checkout
                          id_pelanggan, label     
                          alamat, penerima,       
                          alamat, kota, kode pos  

  Barang                  id_barang, SKU, nama,   Katalog
                          kategori, harga saat    
                          ini, stok, status       

  Keranjang               id_keranjang,           Keranjang
                          id_pelanggan, tanggal   
                          dibuat, status          

  Detail keranjang        id_keranjang,           Keranjang
                          id_barang, kuantitas    

  Pesanan                 no_pesanan,             Checkout
                          id_pelanggan, tanggal,  
                          status, alamat          
                          snapshot, ongkir,       
                          diskon, total           

  Detail pesanan          no_pesanan, id_barang,  Ringkasan pesanan
                          nama barang snapshot,   
                          qty, harga satuan       
                          snapshot                

  Pembayaran              id_pembayaran,          Bukti pembayaran
                          no_pesanan, waktu       
                          bayar, metode, nominal, 
                          status, referensi       

  Pengiriman              id_pengiriman,          Resi pengiriman
                          no_pesanan, kurir,      
                          ongkir, nomor resi,     
                          tanggal kirim, status   
  -----------------------------------------------------------------------

## 5. Aturan bisnis

  -----------------------------------------------------------------------
  Kode                                Aturan bisnis
  ----------------------------------- -----------------------------------
  AB-01                               Setiap barang memiliki SKU yang
                                      unik.

  AB-02                               Kuantitas pada detail keranjang dan
                                      detail pesanan harus berupa
                                      bilangan bulat positif.

  AB-03                               Satu pesanan hanya boleh memuat
                                      paling banyak 8 item detail barang
                                      sesuai (P+2); jumlah kuantitas
                                      total harus didefinisikan secara
                                      konsisten sebagai jumlah item.

  AB-04                               Stok barang tidak boleh negatif;
                                      pesanan tidak boleh dikonfirmasi
                                      jika stok yang tersedia tidak
                                      mencukupi.

  AB-05                               Harga satuan yang digunakan pada
                                      detail pesanan disimpan saat
                                      checkout dan tidak berubah jika
                                      harga katalog berubah.

  AB-06                               Alamat penerima dan alamat
                                      pengiriman disalin sebagai snapshot
                                      pada pesanan sehingga perubahan
                                      buku alamat tidak mengubah pesanan
                                      lama.

  AB-07                               Ongkos kirim yang berlaku disimpan
                                      pada pesanan saat checkout dan
                                      tidak berubah ketika tarif
                                      pengiriman berikutnya berubah.

  AB-08                               Persentase diskon proyek adalah 6%
                                      (P); diskon hanya diterapkan jika
                                      pesanan memenuhi kebijakan promosi
                                      yang disetujui.

  AB-09                               Pembayaran dinyatakan terverifikasi
                                      hanya setelah petugas atau
                                      mekanisme pembayaran mengonfirmasi
                                      status dan nominalnya sesuai
                                      tagihan.

  AB-10                               Satu nomor resi harus terkait
                                      dengan pengiriman yang tercatat;
                                      nomor resi tidak boleh kosong
                                      setelah status dikirim.

  AB-11                               Perkiraan volume operasional untuk
                                      perencanaan adalah 70 transaksi per
                                      hari berdasarkan (40+5P).

  AB-12                               Data pribadi pelanggan hanya dapat
                                      diakses oleh peran yang
                                      memerlukannya untuk pelayanan
                                      pesanan; akses harus dibatasi
                                      sesuai tugas.
  -----------------------------------------------------------------------

## 6. Kebutuhan informasi

  -----------------------------------------------------------------------
  Kode                    Kebutuhan informasi     Data yang diperlukan
  ----------------------- ----------------------- -----------------------
  KI-01                   Menampilkan jumlah      Pesanan, detail pesanan
                          pesanan dan nilai       
                          penjualan per hari dan  
                          per bulan               

  KI-02                   Menampilkan 5 barang    Detail pesanan, barang,
                          dengan kuantitas        pesanan
                          terjual terbanyak dalam 
                          periode tertentu        

  KI-03                   Menampilkan barang      Barang
                          dengan stok di bawah    
                          batas minimum           

  KI-04                   Menampilkan daftar      Pesanan, pembayaran,
                          pesanan berdasarkan     pengiriman
                          status pembayaran dan   
                          status pemenuhan        

  KI-05                   Menampilkan riwayat     Pelanggan, pesanan,
                          pesanan seorang         detail pesanan
                          pelanggan               

  KI-06                   Menampilkan pengiriman  Pesanan, pengiriman
                          yang belum memiliki     
                          resi atau belum selesai 
  -----------------------------------------------------------------------

## 7. Matriks CRUD

Keterangan: C = Create, R = Read, U = Update, D = Delete. Penghapusan
transaksi yang sudah dibayar/dikirim sebaiknya dibatasi; perubahan
status lebih aman daripada menghapus riwayat.

  ----------------------------------------------------------------------------------------------------------------------------
  Proses bisnis         Pelanggan   Alamat      Barang   Keranjang   Detail      Pesanan   Detail    Pembayaran   Pengiriman
                                    pelanggan                        keranjang             pesanan                
  --------------------- ----------- ----------- -------- ----------- ----------- --------- --------- ------------ ------------
  PB-01 Mengelola                               C, R, U                                                           
  katalog barang                                                                                                  

  PB-02 Mengelola       R           R           R        C, R, U     C, R, U, D                                   
  keranjang                                                                                                       

  PB-03 Membuat pesanan R           R           R        R, U        R, D        C         C                      

  PB-04                 R                                                        R, U      R         C, R, U      
  Mencatat/verifikasi                                                                                             
  pembayaran                                                                                                      

  PB-05                 R                       R, U                             R, U      R         R            C, R, U
  Menyiapkan/mengirim                                                                                             
  pesanan                                                                                                         

  PB-06 Memantau        R                       R        R           R           R         R         R            R
  penjualan/pesanan                                                                                               
  ----------------------------------------------------------------------------------------------------------------------------

Pemeriksaan CRUD: - Setiap entitas memiliki setidaknya satu operasi C
pada proses yang sesuai. - Baris proses yang seluruhnya kosong tidak
ada. - Operasi D hanya dipakai pada detail keranjang yang belum menjadi
transaksi; riwayat pesanan dan pembayaran tidak dihapus dalam operasi
normal.

## 8. Kamus data awal

  --------------------------------------------------------------------------------------------
  Elemen                      Arti           Contoh              Aturan         Penanggung
                                                                                jawab
  --------------------------- -------------- ------------------- -------------- --------------
  id_pelanggan                Identitas      PLG-0001            Unik, wajib    Admin
                              internal                                          pelanggan
                              pelanggan                                         

  nama_pelanggan              Nama pelanggan Rani Putri          Tidak boleh    Admin
                                                                 kosong         pelanggan

  email_pelanggan             Email          rani@example.test   Format email;  Admin
                              pelanggan                          unik bila      pelanggan
                                                                 digunakan      
                                                                 untuk login    

  no_hp_pelanggan             Nomor HP       08xxxxxxxxxx        Data pribadi;  Admin
                              pelanggan                          akses terbatas pelanggan

  id_alamat                   Identitas      ALM-0001            Unik           Pelanggan
                              alamat                                            

  penerima_alamat             Nama penerima  Rani Putri          Tidak boleh    Pelanggan
                                                                 kosong         

  alamat_lengkap              Alamat tujuan  Jl. Melati No. 10   Data pribadi;  Pelanggan
                                                                 akses sesuai   
                                                                 kebutuhan      
                                                                 pengiriman     

  kota_alamat                 Kota tujuan    Kota Contoh         Tidak boleh    Pelanggan
                                                                 kosong untuk   
                                                                 pengiriman     

  kode_pos                    Kode pos       12345               Validasi       Pelanggan
                              tujuan                             format sesuai  
                                                                 wilayah        

  id_barang                   Identitas      BRG-0001            Unik           Admin katalog
                              barang                                            

  sku_barang                  Kode stok      KK-LMP-001          Unik           Admin katalog
                              barang                                            

  nama_barang                 Nama barang    Lampu meja mini     Tidak boleh    Admin katalog
                                                                 kosong         

  harga_barang                Harga katalog  50000               Nilai rupiah   Admin katalog
                              saat ini                           nonnegatif     

  stok_barang                 Stok tersedia  25                  Bilangan bulat Petugas gudang
                                                                 nonnegatif     

  id_keranjang                Identitas      KRG-0001            Unik           Sistem
                              keranjang                                         

  qty_detail_keranjang        Kuantitas      2                   Bilangan bulat Pelanggan
                              barang di                          positif        
                              keranjang                                         

  no_pesanan                  Nomor pesanan  KK-20261013-0001    Unik           Sistem

  tgl_pesanan                 Waktu checkout 2026-10-13 10:15    Wajib diisi    Sistem

  status_pesanan              Status pesanan menunggu_bayar      Nilai status   Petugas
                                                                 terdefinisi    pesanan

  nama_penerima_pesanan       Snapshot nama  Rani Putri          Disimpan pada  Petugas
                              penerima                           pesanan        pesanan

  alamat_pengiriman_pesanan   Snapshot       Jl. Melati No. 10   Disimpan pada  Petugas
                              alamat                             pesanan; data  pesanan
                              pengiriman                         pribadi        

  ongkir_pesanan              Ongkos kirim   12000               Rupiah         Petugas
                              saat checkout                      nonnegatif;    pesanan
                                                                 nilai historis 

  persen_diskon_pesanan       Persentase     6                   Mengacu        Petugas
                              diskon                             parameter P;   pesanan
                                                                 rentang 0--100 

  qty_detail_pesanan          Jumlah barang  2                   Bilangan bulat Petugas
                              dalam pesanan                      positif        pesanan

  harga_satuan_pesanan        Harga satuan   50000               Snapshot       Petugas
                              saat checkout                      harga, rupiah  pesanan
                                                                 nonnegatif     

  id_pembayaran               Identitas      BYR-0001            Unik           Petugas
                              pembayaran                                        pembayaran

  nominal_pembayaran          Nominal yang   106000              Harus cocok    Petugas
                              dibayar                            dengan tagihan pembayaran

  status_pembayaran           Status         terverifikasi       Nilai status   Petugas
                              pembayaran                         terdefinisi    pembayaran

  id_pengiriman               Identitas      KRM-0001            Unik           Petugas
                              pengiriman                                        pengiriman

  kurir_pengiriman            Nama kurir     Kurir Contoh        Tidak boleh    Petugas
                                                                 kosong saat    pengiriman
                                                                 dikirim        

  no_resi                     Nomor          RESI-0001           Unik jika      Petugas
                              pelacakan                          disediakan;    pengiriman
                                                                 wajib saat     
                                                                 dikirim        

  status_pengiriman           Status         dikirim             Nilai status   Petugas
                              pengiriman                         terdefinisi    pengiriman
  --------------------------------------------------------------------------------------------

## 9. Kebutuhan non-fungsional data

-   **Volume:** parameter personal (P=(68 \\bmod 9)+1=6). Estimasi
    transaksi adalah (40+5P=70) transaksi per hari. Batas item per
    transaksi adalah (P+2=8). Persentase diskon parameter adalah
    (P%=6%).
-   **Retensi:** simpan riwayat pesanan, detail pesanan, pembayaran, dan
    pengiriman sesuai kebijakan retensi organisasi; durasi final harus
    ditetapkan bersama pemilik proses dan ketentuan yang berlaku.
-   **Privasi:** nama, email, nomor HP, dan alamat merupakan data
    pribadi. Pelanggan hanya melihat data akunnya sendiri; petugas
    pesanan melihat data yang diperlukan untuk memproses pesanan;
    petugas pengiriman melihat nama penerima, alamat, nomor kontak
    seperlunya, dan data paket; admin katalog tidak memerlukan akses ke
    alamat atau pembayaran; pengelola mendapat akses laporan sesuai
    tugas.
-   **Integritas dan historis:** harga satuan, ongkos kirim, alamat
    pengiriman, dan nama penerima disimpan sebagai snapshot pada
    pesanan. Nomor pesanan, SKU, dan nomor resi harus unik sesuai
    cakupan aturannya.
-   **Keamanan:** batasi hak akses per peran, catat perubahan status
    penting, dan jangan menyimpan informasi autentikasi rahasia sebagai
    teks biasa.

## 10. Isu kualitas data yang diantisipasi

  ------------------------------------------------------------------------
  Isu                     Dampak                  Pemeriksaan/pencegahan
  ----------------------- ----------------------- ------------------------
  SKU duplikat            Barang salah dikenali   Constraint unik dan
                                                  pemeriksaan saat input

  Stok berbeda dari stok  Checkout gagal atau     Rekonsiliasi stok dan
  fisik                   stok minus              validasi saat konfirmasi

  Harga lama berubah      Nilai transaksi         Snapshot harga pada
  mengikuti katalog       historis salah          detail pesanan

  Alamat pelanggan        Paket lama kehilangan   Snapshot alamat pada
  berubah dan pesanan     tujuan yang benar       pesanan
  lama ikut berubah                               

  Pembayaran tercatat dua Nilai pembayaran        Referensi pembayaran
  kali                    berlebih                unik dan rekonsiliasi
                                                  nominal

  Pesanan berstatus       Pelanggan tidak dapat   Validasi status dan
  dikirim tanpa resi      melacak                 nomor resi

  Email/nomor HP salah    Notifikasi gagal        Validasi format dan
                                                  konfirmasi kontak

  Status transaksi tidak  Laporan operasional     Daftar status
  konsisten               keliru                  terdefinisi dan alur
                                                  perubahan status
  ------------------------------------------------------------------------

## Catatan keputusan yang perlu dikonfirmasi

1.  Apakah diskon 6% berlaku untuk semua pesanan atau hanya
    barang/pelanggan tertentu.
2.  Apakah "maksimal 8 item" dihitung dari total unit barang atau jumlah
    baris detail pesanan.
3.  Kebijakan retensi final dan jangka waktu penghapusan/anonimisasi
    data.
4.  Apakah satu pesanan dapat memiliki lebih dari satu pembayaran atau
    pengiriman.
