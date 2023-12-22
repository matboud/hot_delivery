import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/models/category.dart';

class CategoryRepository {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.get('BASE_URL');

  Future<List<Category>> getCategories() async {
    try {
      final response = await _dio.get('${_baseUrl}taxonomies/product-categories');
      final List<dynamic> data = response.data;

      List<Category> categories = data.map((categoryData) {
        return Category.fromJson(categoryData);
      }).toList();

      return categories;
    } catch (error) {
      // NOTE: error message in a bigger scale app, should be handled elseway.
      throw Exception('Failed to load categories: $error');
    }
  }
}
