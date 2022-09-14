import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> getProduct(String title) {
  return http.post(
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
}
