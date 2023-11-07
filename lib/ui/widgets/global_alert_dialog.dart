import 'package:flutter/material.dart';
import 'package:api_servis_http/ui/widgets/global_button.dart';
import 'package:api_servis_http/utils/colors/app_colors.dart';
import 'package:api_servis_http/utils/fonts/text_styles.dart';
import 'package:api_servis_http/utils/size/size_extension.dart';
import 'package:api_servis_http/utils/theme/get_theme.dart';

void showGlobalAlertDialog(
    {required BuildContext context,
    required String title,
    String text = "",
    required String image,
    required VoidCallback onTap}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Container(
          padding: EdgeInsets.only(top: 40, left: 32, right: 32, bottom: 32),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image,
                width: 160,
                height: 160,
              ),
              32.ph,
              Text(
                title,
                style: AppTextStyle.h4Bold.copyWith(
                    color: getTheme(context)
                        ? AppColors.primary
                        : AppColors.c_900),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              16.ph,
              Text(
                text,
                style: AppTextStyle.bodyLargeRegular.copyWith(
                    color:
                        getTheme(context) ? AppColors.white : AppColors.c_900),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
              32.ph,
              GlobalButton(
                title: "OK",
                textColor: AppColors.c_900,
                onTap: onTap,
                radius: 100,
                color: AppColors.primary,
              )
            ],
          ),
        ),
        contentPadding: EdgeInsets.zero,
      );
    },
  );
}
