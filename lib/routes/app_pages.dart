import 'package:get/get.dart';
import 'package:list/app.dart';
import 'package:list/pages/product_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const App(),
    ),
    GetPage(
      name: Routes.PRODUCTPAGE,
      page: () => const ProductPage(),
    ),
  ];
}
