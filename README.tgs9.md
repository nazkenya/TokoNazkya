1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya, kita dapat melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Proses ini melibatkan penggunaan permintaan HTTP untuk mengakses sumber data yang menyediakan informasi dalam format JSON. Dalam flutter, data JSON dapat diambil dan dikelola langsung sebagai Map<String, dynamic> atau List<Map<String, dynamic>> tergantung struktur JSON yang diterima. 

Ada beberapa kasus di mana membuat model dapat memberikan keuntungan, terutama jika data JSON yang kita tangani lebih kompleks atau jika kita perlu melakukan operasi yang lebih canggih, seperti prediksi atau klasifikasi berbasis pada data JSON. Membuat model dapat membantu kita dalam mengorganisasi dan memahami struktur data dengan lebih baik, serta dapat memberikan keunggulan dalam hal analisis dan prediksi.

Keputusan antara mengambil data langsung atau membuat model tergantung pada kompleksitas tugas yang akan kita lakukan dan kebutuhan spesifik kita. Jika tugas kita sederhana dan hanya memerlukan ekstraksi nilai sederhana, pengambilan data langsung mungkin cukup. Namun, jika kita perlu melakukan analisis lebih lanjut atau tugas yang lebih kompleks, membuat model dapat memberikan fleksibilitas dan kinerja yang lebih baik.


2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest merupakan sebuah kelas yang bertanggung jawab dalam mengatur HTTP requests dengan mempertahankan informasi cookies, yang memiliki peranan krusial dalam menjaga autentikasi dan sesi yang konsisten di dalam suatu aplikasi. Fungsionalitas utama dari CookieRequest mencakup:

Manajemen Cookies: Bertugas mengatur cookies untuk setiap permintaan (request) dan tanggapan (response) HTTP.
Persistensi Sesi: Memungkinkan kelangsungan sesi pengguna sehingga tetap aktif selama aplikasi masih terbuka.
Konsistensi Sesi: Menjamin bahwa semua permintaan (request) yang dilakukan mempertahankan sesi yang sama, menghindari kebingungan dan inkonsistensi.
Optimisasi Kinerja: Menghindari pembuatan instance CookieRequest yang berlebihan untuk memastikan efisiensi dalam pengelolaan sumber daya.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
- fetch Data dengan melibatkan penggunaan permintaan HTTP, umumnya berupa GET, untuk mengambil data JSON dari layanan web.
- mengkonversi data JSON yang diterima menjadi objek Dart. Proses ini dapat dilakukan melalui penerapan model yang telah dibuat sebelumnya atau secara langsung menjadi Map atau List, tergantung pada struktur JSON yang ada.
- data yang telah berhasil dikonversi digunakan untuk mengisi state atau variabel di dalam aplikasi Flutter. Penggunaan data ini dapat bervariasi, mulai dari penampilan langsung di antarmuka pengguna hingga digunakan untuk logika lebih lanjut dalam aplikasi.
- langkah terakhir melibatkan penampilan data yang telah dikonversi ke dalam aplikasi menggunakan berbagai widget Flutter. Sebagai contoh, untuk menampilkan daftar data, Anda dapat menggunakan ListView.builder, sementara untuk menampilkan detail data, Text atau widget Card dapat digunakan. Dengan pendekatan ini, proses pengambilan dan integrasi data JSON dapat diimplementasikan secara efektif dalam pengembangan aplikasi Flutter.

4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
- Pengguna memasukkan data akun, seperti nama pengguna dan kata sandi, di dalam aplikasi Flutter.
- Aplikasi Flutter mengirimkan informasi akun tersebut ke backend Django melalui permintaan HTTP, biasanya menggunakan metode POST.
- Backend Django menerima data tersebut dan menjalankan proses autentikasi. Ini melibatkan verifikasi di dalam database untuk mencocokkan data pengguna.
- Setelah proses autentikasi, Django memberikan respons kepada aplikasi Flutter. Respons ini dapat berupa konfirmasi sukses atau kegagalan dari proses autentikasi.
- Berdasarkan respons yang diterima dari Django, aplikasi Flutter selanjutnya menampilkan hasil autentikasi kepada pengguna. Jika autentikasi berhasil, aplikasi mungkin membuka halaman menu utama atau dashboard. Sebaliknya, jika terjadi kegagalan, aplikasi dapat menampilkan pesan kesalahan atau meminta pengguna untuk mencoba lagi. Dengan langkah-langkah ini, proses autentikasi antara aplikasi Flutter dan backend Django dijalankan dengan aman dan efisien.

5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
- Scaffold digunakan untuk membentuk kerangka dasar tampilan aplikasi
- ListView.builder digunakan untuk menghasilkan daftar yang dinamis sesuai dengan data yang ada
- TextFormField digunakan untuk mengumpulkan input teks dari pengguna
- ElevatedButton berfungsi sebagai tombol untuk melaksanakan aksi tertentu, seperti mengirim formulir
- FutureBuilder digunakan untuk membuat antarmuka pengguna yang merespons hasil dari interaksi dengan Future.

6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- menginstall seluruh library yang diperlukan di django + flutter
- membuat authentication app di django dan setup integrasi sistem autentikasi
- membuat halaman login di lib/screens/login.dart
- membuat model Product di lib/models/product.dari
- melakukan fetch data dr django ke flutter untuk menampilkan data
- mengintegrasikan data dr flutter ke django
- membuat fitur logout