1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

    a. Navigator.push():
    -> Digunakan untuk menambahkan rute baru ke dalam tumpukan rute.
    -> Membuat tumpukan rute baru, dan pengguna dapat kembali ke rute sebelumnya menggunakan tombol "back".
    contoh penggunaan:
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NewScreen()),
        );

    b. Navigator.pushReplacement()
    -> Digunakan untuk menambahkan rute baru dan menggantikan rute saat ini dengan rute yang baru.
    -> Berguna ketika Anda ingin menggantikan halaman saat ini, misalnya setelah pengguna berhasil login dan Anda ingin menghindari pengguna kembali ke halaman login.

    contoh penggunaan: 
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        );

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Container:
    Widget dasar untuk mengatur layout dan styling.
    Konteks penggunaan: Menyimpan widget lain dengan memberikan properti seperti padding, margin, dan warna latar belakang.
Column:
    Menganur widget-an secara vertikal.
    Konteks penggunaan: Cocok untuk tata letak berbasis kolom, seperti formulir.
Row:
    Menganur widget-an secara horizontal.
    Konteks penggunaan: Berguna untuk tata letak berbasis baris, misalnya dalam daftar horizontal.
Stack:
    Menggabungkan widget-an di atas satu sama lain.
    Konteks penggunaan: Berguna untuk situasi di mana Anda ingin menumpuk beberapa widget.
ListView:
    Untuk membuat daftar scrollable dari widget-an.
    Konteks penggunaan: Cocok untuk menampilkan daftar item yang panjang.


3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
- TextFormField untuk Nama Produk
child: TextFormField(
  decoration: InputDecoration(
    hintText: "Nama Produk",
    labelText: "Nama Produk",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _name = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Nama tidak boleh kosong!";
    }
    return null;
  },
),

serta validator untuk memastikan bahwa bidang ini tidak kosong, yang penting untuk memastikan bahwa setiap produk memiliki nama untuk identifikasi.

Harga

child: TextFormField(
  decoration: InputDecoration(
    hintText: "Harga",
    labelText: "Harga",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      _price = int.parse(value!);
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Harga tidak boleh kosong!";
    }
    if (int.tryParse(value) == null) {
      return "Harga harus berupa angka!";
    }
    return null;
  },
),
beserta validator yang memeriksa tidak hanya kekosongan tetapi juga validitas angka, yang penting untuk data harga karena harus berupa angka.

Deskripsi

child: TextFormField(
  decoration: InputDecoration(
    hintText: "Deskripsi",
    labelText: "Deskripsi",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  onChanged: (String? value) {
    setState(() {
      // TODO: Tambahkan variabel yang sesuai
      _description = value!;
    });
  },
  validator: (String? value) {
    if (value == null || value.isEmpty) {
      return "Deskripsi tidak boleh kosong!";
    }
    return null;
  },
),
serta validator untuk memastikan bahwa deskripsi tidak dibiarkan kosong.

Alasan menggunakan TextFormField:
- Sesuai dengan Jenis Data: Setiap TextFormField disesuaikan dengan tipe data yang diantisipasi, seperti teks singkat untuk nama, angka untuk harga, dan teks panjang untuk deskripsi.
- Validasi yang Tepat: Penerapan validator menjadi krusial untuk menjamin integritas data, misalnya, mencegah produk tanpa nama atau dengan harga yang bukan merupakan angka.
- Pengalaman Pengguna yang Optimal: Menggunakan elemen input ini memberikan pengalaman pengguna yang lebih intuitif dan mudah, karena pengguna telah terbiasa dengan cara kerja input teks.


4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture pada aplikasi Flutter melibatkan pemisahan kode menjadi beberapa lapisan:
Presentation Layer: Berisi widget Flutter dan logika tampilan.
Domain Layer: Berisi logika bisnis dan aturan.
Data Layer: Menangani akses ke data, baik dari sumber lokal atau eksternal.
-> Tujuan Clean Architecture adalah memisahkan ketiga lapisan ini agar kode menjadi lebih bersih, terpisah, dan mudah diuji dan penerapan ini juga dapat membantu membuat aplikasi lebih modular, mudah diuji, dan memungkinkan perubahan pada satu lapisan tanpa memengaruhi lapisan lainnya.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial
- membuat direktori baru di dalam direktori lib seperti widgets, screens, dan models agar menerapkan clean architecture
- membuat file shoplist_form.dart di screens sebagai halaman form untuk menerima input dan menggunakan TextFormField untuk nama, harga dan deskripsi
- membuat file left_drawer di widgets untuk tampilan drawer kiri untuk navigasi
- menghubungkan opsi di left_drawer dan halaman utama ke shoplist_form.dart
- membuat model item di item.dart di direktori models
- membuat lihat_produk.dart sebagai halaman untuk melihat produk
- membuat tomboh lihat produk di left_drawer.dart
- menghubungkan opsi lihat produk di halaman utama dan left_drawer dengan lihat_produk.dart