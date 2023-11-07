import 'package:api_servis_http/utils/theme/get_theme.dart';
import 'package:flutter/material.dart';
import 'package:api_servis_http/utils/colors/app_colors.dart';

void showSnackBar({required BuildContext context, required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: getTheme(context) ? AppColors.black : AppColors.white,
      content: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
}
