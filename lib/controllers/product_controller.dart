import 'package:get/get.dart';
import 'package:list/models/product_model.dart';

class ProductController extends GetxController {
  var products = <ProductModel>[].obs;

  addProducts(ProductModel product) async {
    products.add(product);
    update();
  }
}
