import 'dart:convert';
import 'dart:developer' as developer;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:list/controllers/product_controller.dart';
import 'package:list/models/product_model.dart';

List<ProductModel> productsList = [];
ProductModel productDetails = ProductModel();
List<Rate> rateModel = [];
Rate rateDetails = Rate();
List<Rate> notForSellModel = [];
Rate notForSellDetails = Rate();
Gallery galleryDetails = Gallery();

class AllProductController extends GetxController {
  var allProducts = <ProductModel>[].obs;
  Future getProductViaAPI() async {
    try {
      final http.Response response = await http.post(
        Uri.parse('https://api.ertrails.in/user/newProducts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, dynamic>{
            "offset": "1",
            "limit": 10,
            "comp_num": "56",
          },
        ),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<ProductModel> productModel = [];
        for (var i in data["result"]) {
          // ProductModel tempProductModel = ProductModel.fromJson(
          //   i,
          // );
          // productModel.add(ProductModel.fromJson(
          //   i,
          // ));
          if (i['rate'] != null) {
            for (var j = 0; j < i['rate'].length; j++) {
              rateDetails = Rate(
                id: i['rate'][j]['id'],
                productNo: i['rate'][j]['productNo'],
                rateType: i['rate'][j]['rateType'],
                rate: i['rate'][j]['rate'],
                discountPercent: i['rate'][j]['discountPercent'],
                addBy: i['rate'][j]['addBy'],
                addOn: i['rate'][j]['addOn'],
                isMember: i['rate'][j]['isMember'],
                isActive: i['rate'][j]['isActive'],
                companyNum: i['rate'][j]['companyNum'],
                name: i['rate'][j]['name'],
                isRent: i['rate'][j]['isRent'],
              );
              rateModel.add(rateDetails);
            }
          }
          if (i['notForSell'] != null) {
            for (var j = 0; j < i['notForSell'].length; j++) {
              notForSellDetails = Rate(
                id: i['notForSell'][j]['id'],
                productNo: i['notForSell'][j]['productNo'],
                rateType: i['notForSell'][j]['rateType'],
                rate: i['notForSell'][j]['rate'],
                discountPercent: i['notForSell'][j]['discountPercent'],
                addBy: i['notForSell'][j]['addBy'],
                addOn: i['notForSell'][j]['addOn'],
                isMember: i['notForSell'][j]['isMember'],
                isActive: i['notForSell'][j]['isActive'],
                companyNum: i['notForSell'][j]['companyNum'],
                name: i['notForSell'][j]['name'],
                isRent: i['notForSell'][j]['isRent'],
              );
              notForSellModel.add(notForSellDetails);
            }
          }
          // if (i['gallery'] != null) {
          galleryDetails = Gallery(
            smallThumbnailLink: i['gallery']['smallThumbnailLink'],
            mediumThumbnailLink: i['gallery']['mediumThumbnailLink'],
          );

          // }

          productDetails = ProductModel(
            addedOn: i['addedOn'],
            moq: i['moq'],
            type: i['type'],
            increaseQuantity: i['increaseQuantity'],
            name: i['name'],
            productNo: i['productNo'],
            prodGroupId: i['prodGroupId'],
            mrp: i['mrp'],
            quickProductCheck: i['quickProductCheck'],
            txnQuantity: i['txnQuantity'],
            txnQuantity2: i['txnQuantity2'],
            slug: i['slug'],
            slug2: i['slug2'],
            gallery: galleryDetails,
            ratings: i['ratings'],
            rate: rateModel,
            notForSell: notForSellModel,
          );

          productModel.add(productDetails);
        }
        print(productModel[0].gallery?.mediumThumbnailLink);
        allProducts.value = productModel;

        // developer.log(data["result"][0]["rate"][1]['discountPercent']
        //     .runtimeType
        //     .toString());
        // }
        // developer.log(productModel[0].toString());
      } else {
        developer.log(response.statusCode.toString());
      }
    } catch (e) {
      developer.log("$e");
      developer.log("error");
    }
  }
}
