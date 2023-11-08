# toko_nazkya

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

TUGAS 7
1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
a. Stateless Widget:
- Stateless widget adalah widget yang tidak memiliki keadaan internal (state). Ini berarti widget ini bersifat statis dan tidak dapat berubah setelah dibuat.
- Stateless widget digunakan ketika Anda memiliki elemen dalam aplikasi Anda yang tidak perlu mengubah dirinya sendiri berdasarkan input atau keadaan yang berubah. Contoh: teks statis, ikon, tombol tanpa interaksi, dll.
- Stateless widget lebih efisien daripada stateful widget karena mereka tidak perlu memperbarui diri mereka sendiri saat ada perubahan dalam data.

b. Stateful Widget:
- Stateful widget adalah widget yang memiliki keadaan internal (state) yang dapat berubah selama masa hidupnya. Ini memungkinkan widget merespons perubahan dalam data atau interaksi pengguna.
- Stateful widget digunakan ketika Anda memiliki elemen dalam aplikasi Anda yang perlu merespons perubahan data atau interaksi pengguna. Contoh: daftar item yang dapat dihapus, input pengguna, komponen yang perlu diubah berdasarkan keadaan aplikasi, dll.
- Stateful widget memiliki metode setState yang memungkinkan Anda memperbarui tampilan widget ketika ada perubahan dalam data atau keadaan internal.

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- MaterialApp: widget yang digunakan untuk mengkonfigurasi dan mengatur tema dasar aplikasi Flutter serta menentukan halaman utama aplikasi.
- Scaffold: widget ini digunakan untuk membuat tata letak dasar aplikasi yang mencakup AppBar, body, dan banyak komponen antarmuka pengguna lainnya.
- SingleChildScrollView: digunakan untuk membungkus elemen-elemen tampilan yang memungkinkan pengguliran konten saat konten tersebut melebihi batas tampilan.
- Text: digunakan untuk menampilkan teks dalam antarmuka pengguna. Biasanya digunakan untuk menampilkan judul atau teks statis.
- GridView.count: digunakan untuk membuat tampilan daftar elemen dalam bentuk grid dengan jumlah kolom tertentu.
- ShopCard: ini adalah custom widget yang mewakili kartu dengan ikon dan teks untuk setiap item toko.
- Material: digunakan untuk membuat tampilan berbentuk kartu dengan latar belakang warna tertentu.
- InkWell: widget ini digunakan untuk mengatur area yang responsif terhadap sentuhan pengguna. Dalam kasus ini, digunakan untuk menampilkan Snackbar saat kartu diklik.
- Container: Digunakan untuk mengatur layout dan tampilan elemen-elemen dalam bentuk kotak, seperti mengatur padding dan menggabungkan elemen-elemen lain di dalamnya.
- Icon: Widget ini digunakan untuk menampilkan ikon dalam antarmuka pengguna, seperti ikon untuk setiap item toko.
- SnackBar: widget notifikasi singkat yang muncul sebagai respons terhadap tindakan pengguna dan biasanya menghilang setelah beberapa detik.
- Column: widget yang digunakan untuk mengatur elemen-elemen anak secara vertikal, menjadikannya tampil dari atas ke bawah dalam antarmuka pengguna.
- Padding: widget yang digunakan untuk menambahkan jarak (padding) di sekitar elemen-elemen anaknya, mengatur ruang di sekitar elemen dalam tata letak.

3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- membuat app flutter untuk tugas 7 dengan flutter create toko_nazkya
- membuat file menu.dart di toko_nazkya/lib dan mengimpor material.dart
- membuat class ShopItem, ShopCard, dan MyHomePage. ShopItem  untuk merepresentasikan informasi item toko, ShopCard  untuk membuat kartu dengan ikon dan teks untuk setiap item toko, dan MyHomePage adalah widget utama yang akan menampilkan interface pengguna aplikasi.
- menggunakan widget InkWell di ShopCard untuk membuat area responsif terhadap sentuhan pengguna. Saat kartu diklik, kode di dalam onTap akan menampilkan SnackBar yang berisi pesan yang mencakup nama item yang diklik.
- menggunakan widget Scaffold di MyHomePage dengan AppBar di bagian atas dan tampilan konten dalam body. Dalam body, saya mengelompokkan elemen-elemen yang terdiri dari judul, dan GridView.count yang berisi ShopCard.
- menggunakan Column untuk mengelompokkan elemen-elemen secara vertikal di dalam tata letak. saya juga menggunakan Padding untuk menambahkan jarak di sekitar elemen-elemen.
- saya membuat tiga ShopCard yang mewakili item toko yang berbeda dengan latar belakang warna yang berbeda di GridView.count
- menjalankan aplikasi dengan menjalankan fungsi main yang memanggil MyApp
