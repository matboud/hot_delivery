import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/utils/typography/app_typography.dart';
import 'package:food_order/viewmodels/cart_view_model.dart';
import 'package:food_order/views/home.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CheckoutButton extends StatefulWidget {
  final double totalPrice;
  final void Function()? onPressed;

  const CheckoutButton({super.key, this.totalPrice = 0.0, this.onPressed});

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _isProcessing ? Colors.black87 : const Color(0xffFFCA51),
      ),
      height: 48,
      child: InkWell(
        onTap: () async {
          setState(() {
            _isProcessing = true;
          });
          await Future.delayed(3.seconds);
          setState(() {
            _isProcessing = false;
          });
          if (!context.mounted) return;
          Provider.of<CartViewModel>(context, listen: false).clearCart();
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                AppString.orderPlacedSuccessfully,
                style: AppTypography.bodyText1,
              ),
              backgroundColor: Colors.green,
            ),
          );
        },
        child: _isProcessing
            ? SizedBox(
                height: 40,
                width: 24,
                child: Lottie.asset('assets/lottie/delivery.json',
                    height: 40, width: 24),
              )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .slide(
                    begin: const Offset(-0.5, 0),
                    end: const Offset(0.5, 0),
                    duration: const Duration(seconds: 2))
            : Row(
                children: [
                  Text(
                    AppString.checkout.toUpperCase(),
                    style: AppTypography.bodyText2,
                  ),
                  const Spacer(),
                  Text(
                    "€${widget.totalPrice.toStringAsFixed(2)}",
                    style: AppTypography.bodyText2,
                  ),
                ],
              ),
      ),
    );
  }
}
