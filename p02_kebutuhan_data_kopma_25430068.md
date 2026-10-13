# Dokumen Kebutuhan Data - Koperasi Mahasiswa Sejahtera

## 1. Latar belakang dan aktivitas organisasi

Koperasi Mahasiswa Sejahtera (Kopma) fiktif menjual alat tulis, makanan
ringan, dan minuman di lingkungan kampus. Pembeli dapat berupa anggota
atau pembeli umum. Mahasiswa dapat mendaftar sebagai anggota menggunakan
NIM, nama, program studi, dan nomor HP, kemudian memperoleh nomor
anggota berformat `A-xxxx`. Anggota aktif memperoleh diskon 5% untuk
setiap nota.

Kasir mencatat penjualan dan mencetak nota. Petugas gudang memeriksa
stok setiap sore. Jika stok barang berada di bawah batas minimum,
petugas membuat pesanan pembelian kepada pemasok. Saat barang datang,
stok bertambah berdasarkan faktur pemasok. Setiap awal bulan, ketua
koperasi menerima laporan omzet, barang terlaris, barang dengan stok
menipis, dan anggota paling aktif.

Masalah yang perlu ditangani: - Harga barang dapat berubah, tetapi harga
yang tercatat pada nota lama harus tetap dapat diperiksa. - Stok tidak
boleh menjadi negatif. - Anggota dapat dicari menggunakan nomor anggota
atau NIM jika tidak membawa kartu.

## 2. Aktor dan proses bisnis

  -----------------------------------------------------------------------
  Kode              Proses bisnis     Aktor             Pemicu
  ----------------- ----------------- ----------------- -----------------
  PB-01             Mendaftarkan      Kasir atas        Mahasiswa ingin
                    anggota           permintaan        menjadi anggota
                                      mahasiswa         

  PB-02             Mencatat          Kasir             Pembeli melakukan
                    penjualan                           pembayaran di
                                                        kasir

  PB-03             Memesan barang ke Petugas gudang    Stok berada di
                    pemasok                             bawah batas
                                                        minimum

  PB-04             Menerima barang   Petugas gudang    Barang datang
                    dari pemasok                        bersama faktur

  PB-05             Menyusun laporan  Ketua koperasi    Awal bulan
                    bulanan                             
  -----------------------------------------------------------------------

## 3. Dokumen sumber yang dianalisis

  -----------------------------------------------------------------------
  Dokumen sumber          Elemen yang dapat       Kegunaan dan catatan
                          diambil                 
  ----------------------- ----------------------- -----------------------
  Formulir pendaftaran    NIM, nama, program      Sumber data anggota;
  anggota                 studi, nomor HP         NIM harus unik dan
                                                  nomor HP dibatasi
                                                  aksesnya

  Nota penjualan          Nomor nota,             Menjadi bukti
                          tanggal-jam, kasir,     transaksi; harga harus
                          anggota opsional,       disimpan per detail
                          barang, kuantitas,      penjualan
                          harga saat transaksi    

  Faktur pemasok          Nomor faktur, tanggal,  Dasar pencatatan
                          pemasok, barang,        pembelian dan
                          kuantitas, harga beli   penerimaan barang

  Laporan stok dan        Stok barang, batas      Dipakai untuk
  laporan bulanan         minimum, omzet, barang  pemantauan stok dan
                          terlaris, anggota       keputusan ketua
                          paling aktif            
  -----------------------------------------------------------------------

## 4. Entitas kandidat dan elemen data

  -----------------------------------------------------------------------
  Entitas kandidat        Elemen data utama       Sumber
  ----------------------- ----------------------- -----------------------
  Anggota                 Nomor anggota, NIM,     Formulir pendaftaran
                          nama, program studi,    
                          nomor HP, status        
                          anggota                 

  Barang                  Kode, nama, kategori,   Daftar barang dan
                          harga jual, stok, batas faktur
                          minimum stok            

  Penjualan               Nomor nota,             Nota penjualan
                          tanggal-jam, kasir,     
                          anggota (opsional),     
                          pembayaran              

  Detail penjualan        Nomor nota, barang,     Nota penjualan
                          kuantitas, harga saat   
                          transaksi               

  Petugas                 Kode petugas, nama,     Wawancara
                          peran                   
                          (kasir/gudang/ketua)    

  Pemasok                 Kode, nama, telepon,    Faktur pemasok
                          alamat                  

  Pembelian dan detailnya Nomor faktur, tanggal,  Faktur pemasok
                          pemasok, barang,        
                          kuantitas, harga beli   
  -----------------------------------------------------------------------

Catatan desain: untuk model relasional selanjutnya, "Pembelian dan
detailnya" perlu dipisah menjadi entitas `Pembelian` dan
`Detail pembelian`, karena satu faktur dapat memuat beberapa barang.

## 5. Aturan bisnis

  -----------------------------------------------------------------------
  Kode                                Aturan bisnis
  ----------------------------------- -----------------------------------
  AB-01                               Setiap nota memiliki nomor unik dan
                                      minimal satu baris barang.

  AB-02                               Penjualan boleh tanpa anggota
                                      (pembeli umum); jika ada anggota,
                                      anggota harus berstatus aktif untuk
                                      memperoleh diskon 5%.

  AB-03                               Stok barang tidak boleh negatif;
                                      penjualan ditolak bila kuantitas
                                      melebihi stok tersedia.

  AB-04                               Harga jual yang dipakai pada nota
                                      disimpan per baris dan tidak
                                      berubah meskipun harga barang
                                      kemudian naik.

  AB-05                               NIM anggota unik; pencarian anggota
                                      dapat dilakukan melalui nomor
                                      anggota atau NIM.

  AB-06                               Pesanan pembelian dibuat bila stok
                                      barang kurang dari batas minimum
                                      barang tersebut.

  AB-07                               Satu anggota memperoleh 1 poin
                                      untuk setiap Rp10.000 belanja yang
                                      memenuhi ketentuan program
                                      loyalitas.

  AB-08                               Penukaran 50 poin memberikan
                                      potongan harga Rp5.000 pada
                                      transaksi yang memenuhi ketentuan
                                      penukaran.
  -----------------------------------------------------------------------

## 6. Kebutuhan informasi

  -----------------------------------------------------------------------
  Kode                    Kebutuhan informasi     Data yang diperlukan
  ----------------------- ----------------------- -----------------------
  KI-01                   Omzet dan jumlah nota   Penjualan, detail
                          per hari dan per bulan  penjualan

  KI-02                   Lima barang terlaris    Detail penjualan,
                          per bulan berdasarkan   barang
                          kuantitas               

  KI-03                   Barang dengan stok di   Barang
                          bawah batas minimum     

  KI-04                   Sepuluh anggota dengan  Penjualan, detail
                          belanja terbesar per    penjualan, anggota
                          bulan                   

  KI-05                   Saldo poin dan riwayat  Anggota, penjualan,
                          perolehan/penukaran     detail penjualan,
                          poin anggota            catatan poin
  -----------------------------------------------------------------------

## 7. Matriks CRUD

Keterangan: C = Create, R = Read, U = Update, D = Delete. Sel kosong
berarti proses tidak melakukan operasi tersebut.

  ---------------------------------------------------------------------------------------------------------------
  Proses bisnis  Anggota   Barang   Penjualan   Detail      Petugas   Pemasok   Pembelian   Detail      Catatan
                                                penjualan                                   pembelian   poin
  -------------- --------- -------- ----------- ----------- --------- --------- ----------- ----------- ---------
  PB-01          C                                          R                                           
  Mendaftarkan                                                                                          
  anggota                                                                                               

  PB-02 Mencatat R         R, U     C           C           R                                           C, R
  penjualan                                                                                             

  PB-03 Memesan            R                                R         R         C           C           
  barang ke                                                                                             
  pemasok                                                                                               

  PB-04 Menerima           R, U                             R         R         R, U        R, U        
  barang dari                                                                                           
  pemasok                                                                                               

  PB-05 Menyusun R         R        R           R           R         R         R           R           R
  laporan                                                                                               
  bulanan                                                                                               
  ---------------------------------------------------------------------------------------------------------------

## 8. Kamus data awal

  -------------------------------------------------------------------------------------------------
  Elemen                          Arti           Contoh         Aturan               Penanggung
                                                                                     jawab
  ------------------------------- -------------- -------------- -------------------- --------------
  no_anggota                      Nomor anggota  A-0457         Unik, format A-4     Ketua
                                  koperasi                      digit                

  nim_anggota                     NIM anggota    2301010123     Unik, 10 digit       Ketua
                                                                sesuai data contoh   
                                                                buku                 

  nama_anggota                    Nama anggota   Siti Rahma     Tidak boleh kosong   Ketua

  prodi_anggota                   Program studi  Informatika    Tidak boleh kosong   Ketua
                                  anggota                                            

  no_hp_anggota                   Nomor HP       0812xxxx       Data pribadi; akses  Ketua
                                  anggota                       terbatas             

  status_anggota                  Status         aktif          Nilai terbatas:      Ketua
                                  keanggotaan                   aktif/nonaktif       

  kode_barang                     Kode barang    ATK001         Unik                 Petugas gudang

  nama_barang                     Nama barang    Buku tulis     Tidak boleh kosong   Petugas gudang

  kategori_barang                 Kategori       ATK            Nilai sesuai         Petugas gudang
                                  barang                        kategori yang        
                                                                ditetapkan           

  harga_jual_barang               Harga jual     4000           Bilangan rupiah      Petugas gudang
                                  saat ini                      tidak negatif        

  stok_barang                     Jumlah barang  35             Bilangan bulat tidak Petugas gudang
                                  tersedia                      negatif (AB-03)      

  stok_min_barang                 Batas minimum  5              Bilangan bulat tidak Petugas gudang
                                  stok                          negatif              

  kode_petugas                    Kode petugas   KSR            Unik                 Ketua

  nama_petugas                    Nama petugas   Budi           Tidak boleh kosong   Ketua

  peran_petugas                   Peran petugas  kasir          kasir/gudang/ketua   Ketua

  no_nota_penjualan               Nomor nota     PJ-2609-0142   Unik per nota        Kasir
                                  penjualan                                          

  tgl_penjualan                   Tanggal dan    2026-10-13     Wajib diisi          Kasir
                                  waktu          10:15                               
                                  penjualan                                          

  harga_satuan_detail_penjualan   Harga jual per 4000           Bilangan rupiah      Kasir
                                  barang saat                   tidak negatif; nilai 
                                  transaksi                     historis (AB-04)     

  qty_detail_penjualan            Jumlah barang  2              Bilangan bulat       Kasir
                                  dalam detail                  positif              
                                  nota                                               

  kode_pemasok                    Kode pemasok   SUP001         Unik                 Petugas gudang

  nama_pemasok                    Nama pemasok   Sumber Makmur  Tidak boleh kosong   Petugas gudang

  no_faktur_pembelian             Nomor faktur   FB-2609-01     Unik                 Petugas gudang
                                  pembelian                                          

  harga_beli_detail               Harga beli per 3000           Bilangan rupiah      Petugas gudang
                                  barang pada                   tidak negatif        
                                  faktur                                             

  poin_diperoleh                  Poin dari      3              Bilangan bulat       Kasir
                                  belanja yang                  nonnegatif; aturan   
                                  memenuhi                      AB-07                
                                  syarat                                             

  poin_ditukar                    Poin yang      50             Tidak boleh melebihi Kasir
                                  dipakai untuk                 saldo tersedia       
                                  penukaran                                          
  -------------------------------------------------------------------------------------------------

## 9. Kebutuhan non-fungsional data

-   **Volume:** contoh acuan awal sekitar 150 nota per hari, sesuai
    contoh kebutuhan non-fungsional pada studi kasus Kopma di buku.
-   **Retensi:** data transaksi disimpan minimal lima tahun.
-   **Privasi dan akses:** nomor HP anggota adalah data pribadi dan
    hanya boleh dilihat ketua. Kasir melihat data anggota seperlunya
    untuk mencari anggota dan menerapkan diskon; petugas gudang
    mengakses data barang, pemasok, dan pembelian; ketua mengakses
    laporan.
-   **Integritas:** nomor nota, nomor anggota, NIM, dan kode barang
    harus unik sesuai aturan yang relevan. Stok tidak boleh negatif.
-   **Program loyalitas:** setiap Rp10.000 belanja yang memenuhi syarat
    menghasilkan 1 poin; 50 poin dapat ditukar menjadi diskon Rp5.000.
    Ketentuan pembulatan dan apakah transaksi diskon ikut dihitung
    sebagai belanja perlu dikonfirmasi kepada pemilik proses sebelum
    implementasi.

## 10. Isu kualitas data yang diantisipasi

  ------------------------------------------------------------------------
  Isu                     Dampak                  Pencegahan/pemeriksaan
  ----------------------- ----------------------- ------------------------
  NIM atau nomor anggota  Anggota salah dikenali  Validasi keunikan
  ganda                                           

  Stok tidak sesuai       Penjualan ditolak atau  Rekonsiliasi stok dan
  kondisi fisik           stok minus              aturan stok nonnegatif

  Harga historis          Nota lama tidak akurat  Simpan harga per detail
  mengikuti harga terbaru                         penjualan

  Nomor HP salah format   Anggota sulit dihubungi Validasi format dan
                                                  pemeriksaan saat
                                                  pendaftaran

  Poin tidak cocok dengan Keluhan saldo loyalitas Simpan catatan perolehan
  riwayat belanja                                 dan penukaran serta
                                                  lakukan rekonsiliasi
  ------------------------------------------------------------------------
