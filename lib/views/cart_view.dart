import 'package:flutter/material.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/utils/typography/app_typography.dart';
import 'package:food_order/viewmodels/cart_view_model.dart';
import 'package:food_order/widget/cart_product_tile.dart';
import 'package:food_order/widget/checkout_button.dart';
import 'package:food_order/widget/delivery_fee_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartView extends StatefulWidget {
  static const routeName = '/cart';

  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // navigate back, by Popping the current route.
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),
        ),
        title: Text(
          AppString.order,
          style: AppTypography.headline3,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<CartViewModel>(
          builder: (context, cartViewModel, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                if (cartViewModel.cartItems.isEmpty)
                  Center(
                    child: Column(
                      children: [
                        Lottie.asset('assets/lottie/empty_cart.json',
                            height: 200, width: 200),
                        Text(
                          AppString.yourCartIsEmpty,
                          style: AppTypography.bodyText1,
                        ),
                      ],
                    ),
                  )
                else
                  Column(
                    children: [
                      ...cartViewModel.cartItems.entries.map((entry) {
                        final productId = entry.key;
                        final quantity = entry.value;
                        final product = cartViewModel.getProductById(productId);
                        return Column(
                          children: [
                            CartProductTile(
                                product: product!,
                                quantity: quantity,
                                onRemove: () {
                                  cartViewModel.removeFromCart(productId);
                                }),
                            const Divider(
                              height: 1,
                            )
                          ],
                        );
                      }).toList(),
                      DeliveryFee(
                        deliveryFee: cartViewModel.deliveryFee(),
                      ),
                      const Divider(
                        height: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              '${AppString.total}:',
                              style: AppTypography.headline4,
                            ),
                            const Spacer(),
                            Text(
                              "€${cartViewModel.calculateTotalPrice() + cartViewModel.deliveryFee()}",
                              style: AppTypography.bodyText2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                const Spacer(),
                if (cartViewModel.cartItems.isNotEmpty)
                  CheckoutButton(
                    totalPrice: cartViewModel.calculateTotalPrice() +
                        cartViewModel.deliveryFee(),
                  ),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
