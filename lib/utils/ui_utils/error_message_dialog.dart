import 'package:api_servis_http/utils/icons/app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../theme/get_theme.dart';

void showErrorMessage({
  required String message,
  required BuildContext context,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor:
              getTheme(context) ? AppColors.dark2 : AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('ERROR!',
                  style: Theme.of(context).dialogTheme.titleTextStyle),
              Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium!,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'))
              // SizedBox(
              //   height: 78 * height / figmaHeight,
              //   child: GlobalButton(
              //     title: 'OK',
              //     onTap: () {

              //     },
              //   ),
              // ),
            ],
          ),
        );
      },
    ),
  );
}

Future<void> showConfirmMessage({
  required String message,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          backgroundColor:
              getTheme(context) ? AppColors.dark2 : AppColors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppIcons.createNewPasswordDialog,
                width: 180,
              ),
              Text('Congratulations!',
                  style: Theme.of(context).dialogTheme.titleTextStyle),
              Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium!,
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'))
            ],
          ),
        );
      },
    ),
  );
}
