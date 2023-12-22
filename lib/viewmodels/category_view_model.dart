import 'package:flutter/material.dart';
import 'package:food_order/models/category.dart';
import 'package:food_order/repositories/category_repository.dart';
import 'package:provider/provider.dart';

class CategoryViewModel with ChangeNotifier {
  final CategoryRepository _categoryRepository = CategoryRepository();
  List<Category>? _categories;
  bool _isLoading = false;

  List<Category>? get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> fetchCategories() async {
    try {
      _isLoading = true;
      notifyListeners();

      _categories = await _categoryRepository.getCategories();

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      // NOTE: handle error in a bigger scale app should be handled elseway
      _isLoading = false;
      notifyListeners();
      throw Exception('Failed to fetch categories: $error');
    }
  }
}

// Provider setup
ChangeNotifierProvider<CategoryViewModel> categoryViewModelProvider =
ChangeNotifierProvider<CategoryViewModel>(
  create: (context) => CategoryViewModel(),
);
