import 'package:api_servis_http/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double? strokeWidth;

  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (strokeWidth == 4.0 || strokeWidth == null) {
      return const CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
      );
    } else {
      return CircularProgressIndicator(
        strokeWidth: strokeWidth!,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.white),
      );
    }
  }
}
