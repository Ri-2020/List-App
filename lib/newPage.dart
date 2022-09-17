import 'package:flutter/material.dart';
import 'package:list/models/product_model.dart';

import 'Components/product_card.dart';

class ProductDataPage extends StatefulWidget {
  final List<ProductModel> productList;
  const ProductDataPage({Key? key, required this.productList})
      : super(key: key);

  @override
  State<ProductDataPage> createState() => _ProductDataPageState();
}

class _ProductDataPageState extends State<ProductDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height * 0.85,
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: widget.productList.length,
        itemBuilder: (BuildContext context, int i) {
          return ProductCard(size: MediaQuery.of(context).size, index: i);
        },
      ),
    ));
  }
}
