import 'package:flutter/material.dart';
import 'package:food_order/utils/typography/app_typography.dart';

class NutritionInfo extends StatelessWidget {
  final String tile;
  final String value;

  const NutritionInfo({super.key, required this.tile, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tile,
          style: AppTypography.captionBold,
        ),
        Text(
          value != "-" ? "${value}g" : value,
          style: AppTypography.caption,
        ),
      ],
    );
  }
}
