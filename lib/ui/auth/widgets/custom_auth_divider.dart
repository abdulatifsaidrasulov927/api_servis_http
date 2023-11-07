import 'package:api_servis_http/utils/colors/app_colors.dart';
import 'package:api_servis_http/utils/size/screen_size.dart';
import 'package:flutter/material.dart';

class CustomAuthDividerWidget extends StatelessWidget {
  const CustomAuthDividerWidget({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(),
          ),
          SizedBox(
            width: 9,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.c_700, fontSize: width > 450 ? 18 : 14),
            ),
          ),
          SizedBox(
            width: 9,
          ),
          const Expanded(
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
