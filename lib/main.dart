import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_application/fetch_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.to(const FetchProducts());
            },
            child: const Text(
              'HIT THE API',
            ),
          ),
        ),
      ),
    );
  }
}
