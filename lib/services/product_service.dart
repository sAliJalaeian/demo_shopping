import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constant/constant.dart';
import '../models/shop_model.dart';

class ProductService {
  Future<List<Product>> fetchPosts() async {
    final response = await http.get(Uri.parse(aPI));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load the data :)");
    }
  }
}
