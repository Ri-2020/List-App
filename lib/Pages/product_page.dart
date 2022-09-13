import 'package:flutter/material.dart';
import 'package:list/constants/data.dart';

class ProductPage extends StatelessWidget {
  final Size size;
  final int index;
  const ProductPage({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${productData[index]["title"]}"),
      ),
      body: Stack(children: [
        ListView(
          children: [
            ClipRRect(
              child: Image.network(
                "${productData[index]["imageUrl"]}",
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                "${productData[index]["title"]}",
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
                  text: "${productData[index]["description"]}",
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
          bottom: 20,
          right: size.width * 0.35,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Text(
              "Add to Cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
