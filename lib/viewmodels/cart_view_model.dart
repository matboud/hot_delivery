import 'package:flutter/material.dart';
import 'package:food_order/models/data.dart';
import 'package:food_order/viewmodels/product_view_model.dart';

class CartViewModel with ChangeNotifier {
  final Map<String, int> _cartItems =
      {}; // Use a map to store product ID and quantity
  final ProductViewModel _productViewModel;

  CartViewModel(this._productViewModel);

  Map<String, int> get cartItems => _cartItems;

  int getItemCount(String productId) {
    return _cartItems.containsKey(productId) ? _cartItems[productId]! : 0;
  }

  void addToCart(String productId) {
    if (_cartItems.containsKey(productId)) {
      _cartItems[productId] = _cartItems[productId]! + 1;
    } else {
      _cartItems[productId] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    if (_cartItems.containsKey(productId) && _cartItems[productId]! > 0) {
      _cartItems[productId] = _cartItems[productId]! - 1;
      if (_cartItems[productId] == 0) {
        _cartItems.remove(productId);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  int calculateTotalItems() {
    int totalItems = 0;
    _cartItems.forEach((productId, quantity) {
      totalItems += quantity;
    });
    return totalItems;
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    _cartItems.forEach((productId, quantity) {
      final product = getProductById(productId);
      totalPrice += (product!.variants![0].price!.amount! / 100) * quantity;
    });
    return totalPrice;
  }

  double deliveryFee() {
    return calculateTotalPrice() * 0.05;
  }

  Data? getProductById(String productId) {
    return _productViewModel.getProductById(productId);
  }
}
