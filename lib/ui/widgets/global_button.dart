import 'package:flutter/material.dart';
import 'package:api_servis_http/utils/colors/app_colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    this.color = AppColors.primary,
    required this.title,
    this.radius = 16,
    this.textColor = AppColors.dark3,
    this.leftIcon = "",
    this.rightIcon = "",
    this.borderColor = Colors.transparent,
    required this.onTap,
    this.padding,
  });

  final Color color;

  final Color textColor;
  final String title;
  final double radius;
  final String rightIcon;
  final String leftIcon;
  final Color borderColor;
  final VoidCallback onTap;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding == null ? EdgeInsets.zero : padding!,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            boxShadow: [
              BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 17,
                  spreadRadius: -7,
                  offset: const Offset(0, 6))
            ],
            border: Border.all(width: 1, color: borderColor)),
        child: Material(
          borderRadius: BorderRadius.circular(radius),
          color: color,
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            onTap: onTap,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  leftIcon.isEmpty ? const Text("") : Text("leftIcon"),
                  SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: TextStyle(
                        fontFamily: "Urbanist",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 16),
                  rightIcon.isEmpty ? const Text("") : Text("rightIcon"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
