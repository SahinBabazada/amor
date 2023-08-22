import 'package:amor/models/shopping_product.dart';
import 'package:dio/dio.dart';

import '../models/search_product.dart';

Future<List<SearchProduct>?> searchProducts(String text) async {
  try {
    var url = 'https://dummyjson.com/products/search?q=$text';
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      var body = res.data["products"] as List;
      return body.map((e) => SearchProduct.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}

Future<List<ShoppingProduct>?> searchProducts2() async {
  try {
    var url = 'https://dummyjson.com/products';
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      var body = res.data["products"] as List;
      return body.map((e) => ShoppingProduct.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
