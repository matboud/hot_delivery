
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_order/utils/extensions/int_extension.dart';
import 'package:food_order/utils/typography/app_typography.dart';


class CaloriesProgressBar extends StatelessWidget {
  final int consumedCalories;

  const CaloriesProgressBar({super.key, required this.consumedCalories});

  @override
  Widget build(BuildContext context) {
    double progress = consumedCalories / 1000;

    if (consumedCalories == 0) {
      return const SizedBox(
        width: 30,
      );
    }

    return SizedBox(
      width: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleProgressBar(
            foregroundColor: consumedCalories.toColor(),
            backgroundColor: Colors.black12,
            strokeWidth: 3,
            value: progress,
          ),
          Center(
            child: Text(
              '$consumedCalories\nkcal',
              style: AppTypography.bodyText2.copyWith(fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }
}