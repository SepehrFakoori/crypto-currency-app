import 'package:flutter/material.dart';
import 'package:test_flutter_application/core/theme/app_colors.dart';

class FilledButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonTab;

  const FilledButtonWidget({
    super.key,
    required this.buttonText,
    required this.onButtonTab,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onButtonTab,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.secondaryColor,
        ),
        child: Column(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.buttonColor,
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              buttonText,
              textAlign: TextAlign.center,
              softWrap: true,
              style: const TextStyle(
                color: AppColors.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
