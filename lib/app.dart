import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/constants/data.dart';
import 'package:list/Components/product_card.dart';
import 'package:list/controllers/product_controller.dart';
import 'package:list/post_call.dart';
// import 'package:get/get.dart';
// import 'package:list/post_call.dart';

// getX
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  ProductController productcontroller = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cats Avialable"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:
                // GetX<ProductController>(builder: (productController) {
                //   return
                Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // await productcontroller.getProducts();
                await getProductViaAPI();
              },
              child: const Text("Get Product"),
            ),
            Container(
              height: height * 0.85,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: productData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(size: size, index: index);
                },
              ),
            ),
          ],
        )
            // }),
            ),
      ),
    );
  }
}
