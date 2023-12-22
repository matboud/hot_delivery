

import 'package:flutter/material.dart';
import 'package:food_order/utils/string/app_stings.dart';
import 'package:food_order/utils/typography/app_typography.dart';

class DeliveryFee extends StatelessWidget {
  final double deliveryFee;

  const DeliveryFee({super.key, this.deliveryFee = 0.0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xffFFCA51).withOpacity(0.2),
            ),
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'assets/icons/delivery_man_icon.png',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            AppString.deliveryFee,
            maxLines: 2,
            style: AppTypography.bodyText2,
          ),
          const Spacer(),
          Text(
            "€${deliveryFee.toStringAsFixed(2)}",
            style: AppTypography.bodyText2,
          ),
        ],
      ),
    );
  }
}