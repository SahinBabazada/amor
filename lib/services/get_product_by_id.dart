import 'package:amor/models/product.dart';
import 'package:dio/dio.dart';

Future<Product?> getProductById(int id) async {
  try {
    var url = 'https://dummyjson.com/products/$id';

    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      return Product.fromJson(res.data);
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return null;
}
