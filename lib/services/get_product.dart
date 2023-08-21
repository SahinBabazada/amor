import 'package:dio/dio.dart';
import '../models/search_product.dart';

Future<List<SearchProduct>?> getProduct(bool isLimited, {int limit = 10, int skip = 10}) async {
  try {
    var url = (isLimited)?'https://dummyjson.com/products?limit=$limit&skip=$skip':'https://dummyjson.com/products';

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
