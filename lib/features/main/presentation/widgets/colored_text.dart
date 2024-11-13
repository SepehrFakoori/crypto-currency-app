import 'package:flutter/material.dart';
import 'package:test_flutter_application/core/theme/app_colors.dart';

class ColoredText extends StatelessWidget {
  final double value;

  const ColoredText({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    String formattedValue = value.toStringAsFixed(2);
    bool isPositive = value >= 0;

    return Text(
      isPositive ? "+$formattedValue%" : "$formattedValue%",
      style: TextStyle(
        color: isPositive
            ? AppColors.greenExchangePercentColor
            : AppColors.redExchangePercentColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
