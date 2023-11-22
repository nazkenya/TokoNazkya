import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// TODO: Impor drawer yang sudah dibuat sebelumnya
import 'package:toko_nazkya/widgets/left_drawer.dart';
import 'package:toko_nazkya/screens/menu.dart';
import 'dart:convert'; // Import for jsonEncode
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _jumlah = 0;
    int _price = 0;
    String _description = "";
    String _category = "";
    final String _date = DateFormat('yyyy-MM-dd').format(DateTime.now());


    @override
    Widget build(BuildContext context) {
      final request = context.watch<CookieRequest>();

        return Scaffold(
            appBar: AppBar(
                title: const Center(
                child: Text(
                    'Form Tambah Produk',
                ),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            // TODO: Tambahkan drawer yang sudah dibuat di sini
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                            padding: const EdgeInsets.all(8.0),
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
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Jumlah",
                                labelText: "Jumlah",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _jumlah = int.parse(value!);
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Jumlah tidak boleh kosong!";
                                }
                                if (int.tryParse(value) == null) {
                                    return "Jumlah harus berupa angka!";
                                }
                                return null;
                                },
                            ),
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Harga",
                                labelText: "Harga",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
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
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
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
                            ),
                            Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                hintText: "Kategori",
                                labelText: "Kategori",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                ),
                                ),
                                // TODO: Tambahkan variabel yang sesuai
                                onChanged: (String? value) {
                                setState(() {
                                    _category = value!;
                                });
                                },
                                validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                    return "Kategori tidak boleh kosong!";
                                }
                                return null;
                                },
                            ),
                            ),
                            // Padding(
                            // padding: const EdgeInsets.all(8.0),
                            // child: TextFormField(
                            //     decoration: InputDecoration(
                            //     hintText: "Date Added",
                            //     labelText: "Date Added",
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(5.0),
                            //     ),
                            //     ),
                            //     // TODO: Tambahkan variabel yang sesuai
                            //     onChanged: (String? value) {
                            //     setState(() {
                            //         _price = int.parse(value!);
                            //     });
                            //     },
                            //     validator: (String? value) {
                            //     if (value == null || value.isEmpty) {
                            //         return "Harga tidak boleh kosong!";
                            //     }
                            //     if (int.tryParse(value) == null) {
                            //         return "Harga harus berupa angka!";
                            //     }
                            //     return null;
                            //     },
                            // ),
                            // ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors.indigo),
                                        ),
                                        onPressed: () async {
                                          if (_formKey.currentState!.validate()) {
                                              // Kirim ke Django dan tunggu respons
                                              // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                              final response = await request.postJson(
                                              "http://127.0.0.1:8000/create-flutter/",
                                              jsonEncode(<String, String>{
                                                  'name': _name,
                                                  'amount': _jumlah.toString(),
                                                  'price': _price.toString(),
                                                  'description': _description,
                                                  'category': _category,
                                                  'date_added': _date
                                              }));
                                              if (response['status'] == 'success') {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                  content: Text("Produk baru berhasil disimpan!"),
                                                  ));
                                                  // ignore: use_build_context_synchronously
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        title: const Text('Produk berhasil tersimpan'),
                                                        content: SingleChildScrollView(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text('Nama: $_name'),
                                                              Text('Jumlah: $_jumlah'),
                                                              Text('Harga: $_price'),
                                                              Text('Deskripsi: $_description'),
                                                              Text('Kategori: $_category'),
                                                              Text('Date Added: $_date'),
                                                            ],
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => MyHomePage()),
                                                  );
                                              } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                      content:
                                                          Text("Terdapat kesalahan, silakan coba lagi."),
                                                  ));
                                              }
                                          }
                                      },
                                        child: const Text(
                                            "Save",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ),
                        ]
                    )
                ),
            ),
        );
    }
}