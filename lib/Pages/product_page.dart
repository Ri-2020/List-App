import 'package:flutter/material.dart';
// import 'package:list/constants/data.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Get.arguments['productData']; // someInfo
    final size = Get.arguments["size"];
    return Scaffold(
      appBar: AppBar(
        title: Text("${productData["title"]}"),
      ),
      body: Stack(children: [
        ListView(
          children: [
            ClipRRect(
              child: Image.network(
                "${productData["imageUrl"]}",
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "${productData["title"]}",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: size.width * 0.20,
              ),
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: "${productData["description"]}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.5,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.5,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                  ),
                  child: const Center(
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
