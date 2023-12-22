import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_order/models/data.dart';

class ProductRepository {
  final Dio _dio = Dio();
  final String _baseUrl = dotenv.get('BASE_URL');

  Future<List<Data>> getProductDetails() async {
    try {
      final response = await _dio.get('${_baseUrl}products?filter[class]=food');
      final List<dynamic> data = response.data['data'];
      List<Data> productDetails = data.map((detail) {
        return Data.fromJson(detail);
      }).toList();

      return productDetails;
    } catch (error) {
      // NOTE: error handling in a bigger scale app, should be handled elseway.
      throw Exception('Failed to load product details: $error');
    }
  }
}
