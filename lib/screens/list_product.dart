import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:toko_nazkya/models/product.dart';
import 'package:toko_nazkya/widgets/left_drawer.dart';


class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                    "${snapshot.data![index].fields.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                    ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text("${snapshot.data![index].fields.price}"),
                                    const SizedBox(height: 10),
                                    Text(
                                        "${snapshot.data![index].fields.description}")
                                ],
                                ),
                            ));
                    }
                }
            }));
    }
}

// class ProductPage extends StatefulWidget {
//   const ProductPage({Key? key}) : super(key: key);

//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   TextEditingController _searchController = TextEditingController();
//   List<Product> _allProducts = [];
//   List<Product> _filteredProducts = [];

//   Future<List<Product>> fetchProduct() async {
//     var url = Uri.parse('http://127.0.0.1:8000/json/');
//     var response = await http.get(
//       url,
//       headers: {"Content-Type": "application/json"},
//     );

//     var data = jsonDecode(utf8.decode(response.bodyBytes));

//     List<Product> listProduct = [];
//     for (var d in data) {
//       if (d != null) {
//         listProduct.add(Product.fromJson(d));
//       }
//     }
//     return listProduct;
//   }

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_filterProducts);
//   }

//   void _filterProducts() {
//     String searchTerm = _searchController.text.toLowerCase();
//     setState(() {
//       _filteredProducts = _allProducts
//           .where((product) =>
//               product.fields.name.toLowerCase().contains(searchTerm) ||
//               product.fields.description.toLowerCase().contains(searchTerm))
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Product'),
//       ),
//       drawer: const LeftDrawer(),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 onChanged: (value) {
//                   _filterProducts();
//                 },
//                 decoration: InputDecoration(
//                   hintText: "Search",
//                   prefixIcon: Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: FutureBuilder(
//               future: fetchProduct(),
//               builder: (context, AsyncSnapshot snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (!snapshot.hasData || snapshot.data.isEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Data doesn't exist.",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                         SizedBox(height: 8),
//                       ],
//                     ),
//                   );
//                 } else {
//                   _allProducts = snapshot.data;
//                   _filteredProducts = _allProducts;
//                   return ListView.builder(
//                     itemCount: _filteredProducts.length,
//                     itemBuilder: (_, index) => Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 12),
//                       padding: const EdgeInsets.all(20.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "${_filteredProducts[index].fields.name}",
//                             style: const TextStyle(
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Text("${_filteredProducts[index].fields.price}"),
//                           const SizedBox(height: 10),
//                           Text("${_filteredProducts[index].fields.description}")
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }