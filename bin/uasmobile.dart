import 'dart:io';
import 'dart:math';

class Produk {
  int id;
  String nama;
  double harga;
  int stok;
  String? nomorResi;

  Produk({
    required this.id,
    required this.nama,
    required this.harga,
    required this.stok,
  });
}

String generateNomorResi() {
  // Fungsi untuk menghasilkan nomor resi
  Random random = Random();
  return 'RESI-${random.nextInt(10000)}';
}

void tambah_data(List<Produk> produkList){
// Tambah Data
        int tambahid = 1;

        if (produkList.isNotEmpty) {
        tambahid = produkList.map((produk) => produk.id).reduce((curr, next) => curr > next ? curr : next) + 1;
        }

        print('Masukkan Nama Produk:');
        String nama = stdin.readLineSync()!;

        print('Masukkan Harga Produk:');
        double harga = double.parse(stdin.readLineSync()!);

        print('Masukkan Stok Produk:');
        int stok = int.parse(stdin.readLineSync()!);


        produkList.add(Produk(id: tambahid, nama: nama, harga: harga, stok: stok));
        print('''

=========================
Produk telah ditambahkan!
=========================
        ''');
}

void ubah_data(List<Produk> produkList){
  // Ubah Data
      if (produkList.isEmpty) {
        print('Daftar produk kosong.');
      } else {
        print('Masukkan ID Produk yang Akan Diubah:');
        int ubahID = int.parse(stdin.readLineSync()!);

        // Mencari indeks produk berdasarkan ID
        int indexToUpdate = produkList.indexWhere((produk) => produk.id == ubahID);

        if (indexToUpdate != -1) {
          print('''
Data Produk yang akan diubah:
=========================================
ID : ${produkList[indexToUpdate].id},
Nama : ${produkList[indexToUpdate].nama},
Harga : ${produkList[indexToUpdate].harga},
Stok : ${produkList[indexToUpdate].stok}
=========================================
''');

          print('Masukkan Nama Baru:');
          String namaBaru = stdin.readLineSync()!;
          
          print('Masukkan Harga Baru:');
          double hargaBaru = double.parse(stdin.readLineSync()!);
          
          print('Masukkan Stok Baru:');
          int stokBaru = int.parse(stdin.readLineSync()!);

          // Mengubah data produk
          produkList[indexToUpdate] = Produk(
            id: produkList[indexToUpdate].id,
            nama: namaBaru,
            harga: hargaBaru,
            stok: stokBaru,
          );
          
          print('''
=========================
Data produk telah diubah!
=========================
          ''');
        } else {
          print('Produk tidak ditemukan.');
        }
      }
}

void cari_data(List<Produk> produkList){
  // Cari Data
  if (produkList.isEmpty) {
    print('Daftar produk kosong.');
  } else {
    print('Pilih Kriteria Pencarian:');
    print('1. Berdasarkan ID');
    print('2. Berdasarkan Nama');
    print('3. Berdasarkan Range Harga');
    print('4. Berdasarkan Stok');
    stdout.write('Masukkan Pilihan = ');
    String kriteria = stdin.readLineSync()!;

    switch (kriteria) {
      case '1':
        // Cari berdasarkan ID
        print('Masukkan ID Produk yang Dicari:');
        int cariID = int.parse(stdin.readLineSync()!);
        Produk? cariProduk;
        for (var produk in produkList) {
          if (produk.id == cariID) {
            cariProduk = produk;
            break;
          }
        }
        if (cariProduk != null) {
          print('''
=====================================
Produk ditemukan: ID ${cariProduk.id},
Nama : ${cariProduk.nama},
Harga : ${cariProduk.harga},
Stok : ${cariProduk.stok},
Nomor Resi: ${cariProduk.nomorResi}
=====================================
          ''');
        } else {
          print('''
=====================================
Produk tidak ditemukan.
=====================================
          ''');
        }
        break;

      case '2':
        // Cari berdasarkan Nama
        print('Masukkan Nama Produk yang Dicari:');
        String cariNama = stdin.readLineSync()!;
        List<Produk> produkByName = [];
        for (var produk in produkList) {
          if (produk.nama.toLowerCase().contains(cariNama.toLowerCase())) {
            produkByName.add(produk);
          }
        }
        if (produkByName.isNotEmpty) {
          print('Produk ditemukan berdasarkan nama:');
          for (var produk in produkByName) {
            print('''
=======================================
ID: ${produk.id},
Nama: ${produk.nama},
Harga: ${produk.harga},
Stok: ${produk.stok},
Nomor Resi: ${produk.nomorResi}
=======================================
            ''');
          }
        } else {
          print('Produk tidak ditemukan.');
        }
        break;

      case '3':
        // Cari berdasarkan Range Harga
        print('Masukkan Rentang Harga Awal:');
        double hargaAwal = double.parse(stdin.readLineSync()!);
        
        print('Masukkan Rentang Harga Akhir:');
        double hargaAkhir = double.parse(stdin.readLineSync()!);

        List<Produk> produkByPriceRange = [];
        for (var produk in produkList) {
          if (produk.harga >= hargaAwal && produk.harga <= hargaAkhir) {
            produkByPriceRange.add(produk);
          }
        }
        if (produkByPriceRange.isNotEmpty) {
          print('Produk ditemukan berdasarkan range harga:');
          for (var produk in produkByPriceRange) {
            print('''
========================
ID: ${produk.id},
Nama: ${produk.nama},
Harga: ${produk.harga},
Stok: ${produk.stok},
Nomor Resi: ${produk.nomorResi}
========================
            ''');
          }
        } else {
          print('Produk tidak ditemukan.');
        }
        break;

      case '4':
        // Cari berdasarkan Stok
        print('Masukkan Stok yang Dicari:');
        int cariStok = int.parse(stdin.readLineSync()!);
        List<Produk> produkByStok = [];
        for (var produk in produkList) {
          if (produk.stok == cariStok) {
            produkByStok.add(produk);
          }
        }
        if (produkByStok.isNotEmpty) {
          print('Produk ditemukan berdasarkan stok:');
          for (var produk in produkByStok) {
            print('''
========================
ID: ${produk.id},
Nama: ${produk.nama},
Harga: ${produk.harga},
Stok: ${produk.stok},
Nomor Resi: ${produk.nomorResi}
========================
            ''');
          }
        } else {
          print('Produk tidak ditemukan.');
        }
        break;

      default:
        print('Pilihan tidak valid.');
        break;
        }
          }
}

void tampil_data(List<Produk> produkList){
  // Tampilkan Data
        if (produkList.isEmpty) {
          print('Daftar produk kosong.');
        } else {
          print("");
          print('Daftar Produk:');
          for (var produk in produkList) {
            print('''
==========================
|| ID: ${produk.id},
|| Nama: ${produk.nama},
|| Harga: ${produk.harga},
|| Stok: ${produk.stok},
|| Nomor Resi: ${produk.nomorResi}
==========================
            ''');
          }
        }
}
void hapus_data(List<Produk> produkList){
  // Hapus Data
      if (produkList.isEmpty) {
        print('Daftar produk kosong.');
      } else {
        print('Masukkan ID Produk yang Akan Dihapus:');
        int hapusID = int.parse(stdin.readLineSync()!);

        int initialLength = produkList.length;
        produkList.removeWhere((produk) => produk.id == hapusID);

        if (produkList.length < initialLength) {
          print('Produk dengan ID $hapusID telah dihapus.');
        } else {
          print('Produk dengan ID $hapusID tidak ditemukan.');
        }
      }
}
void generateNoResi_data(List<Produk> produkList){
   // Generate Nomor Resi
  if (produkList.isEmpty) {
    print('Daftar produk kosong.');
  } else {
    print('Masukkan ID Produk untuk Generate Nomor Resi:');
    int idProduk = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    Produk? produk;
    try {
      produk = produkList.firstWhere((item) => item.id == idProduk);
    } catch (e) {
      print('Produk dengan ID $idProduk tidak ditemukan.');
    }

    if (produk != null) {
      String nomorResi = generateNomorResi();
      produk.nomorResi = nomorResi; // Menambahkan nomor resi ke objek Produk yang ditemukan
      print('''
======================================
Nomor Resi untuk produk ${produk.nama}
(ID ${produk.id}): $nomorResi
======================================
''');
    } else {
      if (idProduk == 0) {
        print('ID produk tidak valid.');
      } else {
        print('Produk dengan ID $idProduk tidak ditemukan.');
      }
    }
  }
}

Future<void> kirimProduk(List<Produk> produkList, int hapusID) async {
  int initialLength = produkList.length;
  produkList.removeWhere((produk) => produk.id == hapusID);

  if (produkList.length < initialLength) {
    print('Produk dengan ID $hapusID telah dikirim.');

    await Future.delayed(Duration(seconds: 3));
    print('Pesanan produk sedang dalam proses pembungkusan.');
    await Future.delayed(Duration(seconds: 3));
    print('Pesanan produk sedang dalam proses pengantaran.');
    await Future.delayed(Duration(seconds: 3));
    print('Pesanan produk Sampai dan diterima Oleh User.');
  } else {
    print('Produk dengan ID $hapusID tidak ditemukan.');
  }
}

Future<void> kurir(List<Produk> produkList) async {
  if (produkList.isEmpty) {
    print('Daftar produk kosong.');
  } else {
    print('Masukkan ID Produk yang Akan Dikirim:');
    int hapusID = int.parse(stdin.readLineSync()!);

    await kirimProduk(produkList, hapusID);
  }
}


void main() async {
  List<Produk> produkList = [];

  while (true) {
    print('============================ ');
    print('||       --Menu--         ||');
    print('||   1. Tambah Data       ||');
    print('||   2. Ubah Data         ||');
    print('||   3. Cari Data         ||');
    print('||   4. Tampilkan Data    ||');
    print('||   5. Hapus Data        ||');
    print('||   6. Generate No Resi  ||');
    print('||   7. Antar Produk      ||');
    print('||   0. Exit              ||');
    print('============================');

    stdout.write('Pilih Menu = ');
    String menu = stdin.readLineSync()!;

    switch (menu) {
      case '1':
        tambah_data(produkList);
        break;

      case '2':
        ubah_data(produkList);
        break;

      case '3':
        cari_data(produkList);
        break;

      case '4':
        tampil_data(produkList);
        break;

      case '5':
        hapus_data(produkList);
        break;

      case '6':
        generateNoResi_data(produkList);
        break;

      case '7':
       await kurir(produkList);
        break;

      case '0':
        // Berhenti
        print('Exit.');
        exit(0);

      default:
        print('Menu tidak valid.');
        break;
    }
  }
}
