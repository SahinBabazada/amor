import 'package:dio/dio.dart';

import '../models/search_product.dart';

Future<List<SearchProduct>?> getProductByCategory(String category) async {
  try {
    var url = (category == "all")
        ? 'https://dummyjson.com/products'
        : 'https://dummyjson.com/products/category/$category';

    print('url: $url');
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
