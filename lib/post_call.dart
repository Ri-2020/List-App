import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'package:list/models/product_model.dart';

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
        productModel.add(ProductModel.fromJson(
          i,
        ));
        for (var j = 0; j < i['rate'].length; j++) {
          print("vujhbiknklnknkl");
          print(i['rate'][j]['id']);
          print(i['rate'][j]['productNo']);
          print(i['rate'][j]['rateType']);
          print(i['rate'][j]['rate']);
          print(i['rate'][j]['discountPercent'].toString());
          print(i['rate'][j]['addBy']);
          print(i['rate'][j]['companyNum']);
          print(i['rate'][j]['isRent']);
        }
      }
      print(productModel);
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
