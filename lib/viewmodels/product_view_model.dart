import 'package:flutter/material.dart';
import 'package:food_order/models/data.dart';
import 'package:food_order/repositories/product_repository.dart';

class ProductViewModel with ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();
  List<Data> _productDetails = [];
  bool _isLoading = false;
  String?   _selectedCategoryName;

  List<Data> get productDetails => _productDetails;
  bool get isLoading => _isLoading;
  String? get selectedCategoryName => _selectedCategoryName;


  set selectedCategoryName(String? selectedCategoryName) {
    _selectedCategoryName = selectedCategoryName;
    notifyListeners();
  }

  Future<void> fetchProductDetails() async {
    try {
      _isLoading = true;
      notifyListeners();

      _productDetails = await _productRepository.getProductDetails();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to fetch product details: $error');
    }
  }

  Data? getProductById(productId) {
    return _productDetails
        .firstWhere((product) => product.id.toString() == productId);
  }
}
