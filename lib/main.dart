import 'package:flutter/material.dart';
import 'package:list/app.dart';
import 'package:get/get.dart';
import 'package:list/pages/product_page.dart';

appRoutes() => [
      GetPage(
        name: '/productpage',
        page: () => const ProductPage(),
      ),
    ];

void main() {
// initilize widget bingings here
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const App(),
      // routes: appRoutes(),
    );
  }
}
