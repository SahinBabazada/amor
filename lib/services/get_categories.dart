import 'package:amor/models/categories.dart';
import 'package:dio/dio.dart';

Future<List<Category>?> getCategories() async {
  try {
    var url = 'https://dummyjson.com/products/categories';
    var res = await Dio().get(url);
    if (res.statusCode == 200) {
      var body = res.data as List;
      body.insert(0, 'all');
      return body.map((e) => Category.fromJson(e)).toList();
    }
    // ignore: avoid_print
    print(res.statusCode);
  } catch (e) {
    // ignore: avoid_print
    print('Sehv var: $e');
  }
  return [];
}
