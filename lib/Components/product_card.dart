import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list/constants/data.dart';
import 'package:list/Pages/product_page.dart';
// import 'dart:developer' as developer;

import 'package:list/constants/utils.dart';
import 'package:list/post_call.dart';

class ProductCard extends StatelessWidget {
  final Size size;
  final int index;
  ProductCard({
    Key? key,
    required this.index,
    required this.size,
  }) : super(key: key);

  AllProductController allProductController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          const ProductPage(),
          arguments: {
            "productData": productData[index],
            "size": size,
          },
          transition: Transition.cupertino,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5,
        ),
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 6,
                spreadRadius: 0.1,
              )
            ]),
        child: GetX<AllProductController>(builder: (allProductController) {
          final product = allProductController.allProducts[index];

          return Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: size.width * 0.25,
                  height: size.width * 0.25,
                  child: ClipRRect(
                    child: Image.network(
                        product.gallery?.mediumThumbnailLink ?? noImageUrl,
                        fit: BoxFit.cover),
                  )),
              SizedBox(
                width: size.width * 0.55,
                // height: size.width * 0.125,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      width: size.width * 0.55,
                      height: size.width * 0.10,
                      //title
                      child: Text(
                        "${product.name}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      width: size.width * 0.55,
                      height: size.width * 0.150,
                      child: RichText(
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          text: "${product.mrp}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
