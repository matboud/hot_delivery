import 'package:flutter/material.dart';

extension IntColorExtension on int {
  Color toColor() {
    if (this <= 500) {
      // Return green for values less than or equal to 500
      return Colors.green;
    } else if (this <= 800) {
      // Return orange for values less than or equal to 800
      return Colors.orange;
    } else {
      // Return red for values greater than 800
      return Colors.red;
    }
  }
}