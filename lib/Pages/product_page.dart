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
      body: ListView(
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: RichText(
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
    );
  }
}
