import 'package:flutter/material.dart';
import 'package:food_order/viewmodels/cart_view_model.dart';
import 'package:provider/provider.dart';


class AddToCartWidget extends StatefulWidget {
  final String productId;

  const AddToCartWidget({Key? key, required this.productId}) : super(key: key);

  @override
  AddToCartWidgetState createState() => AddToCartWidgetState();
}

class AddToCartWidgetState extends State<AddToCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(
        builder: (context, CartViewModel cartViewModel, child) {
          int itemCount = cartViewModel.getItemCount(widget.productId);
          return Container(
            padding: EdgeInsets.zero,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    if (itemCount > 0) {
                      cartViewModel.removeFromCart(widget.productId);
                    }
                  },
                ),
                SizedBox(
                  width: 20,
                  child: Center(
                    child: Text(
                      '$itemCount',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    cartViewModel.addToCart(widget.productId);
                  },
                ),
              ],
            ),
          );
        });
  }
}