import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchProducts extends StatefulWidget {
  const FetchProducts({super.key});

  @override
  State<FetchProducts> createState() => _FetchProductsState();
}

class _FetchProductsState extends State<FetchProducts> {
  List productList = [];
  bool isLoading = false;
  Future<dynamic> gettheProducts() async {
    try {
      setState(() {
        isLoading = true;
      });
      var response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        for (var element in jsonData) {
          productList.add(element);
        }

        setState(() {
          isLoading = false;
        });

        // print(productList);

        return productList;
      } else {}
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    gettheProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fetch Products',
        ),
        centerTitle: true,
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              child: ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  var title = productList[index]['title'];
                  var price = productList[index]['price'];
                  var images = productList[index]['images'];
                  var description = productList[index]['description'];

                  return Container(
                    // color: Colors.red,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          productList.length == 2
                              ? Image.network(
                                  images[index],
                                  width: 50,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.error);
                                  },
                                )
                              : SizedBox(),
                          Text(
                            title,
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            description,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('Rs ${price.toString()}')
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
