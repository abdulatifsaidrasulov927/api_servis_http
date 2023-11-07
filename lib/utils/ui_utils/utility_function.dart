import 'package:api_servis_http/cubits/user/user_cubit.dart';
import 'package:api_servis_http/data/models/icon/icon_type.dart';
import 'package:api_servis_http/data/models/user/user_field_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../colors/app_colors.dart';
import '../size/screen_size.dart';
import '../theme/get_theme.dart';

void showBottomSheetDialog(
  BuildContext context,
  ImagePicker picker,
) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(24),
        height: 250 * height / figmaHeight,
        decoration: BoxDecoration(
          color: getTheme(context) ? AppColors.c_900 : AppColors.c_700,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  onTap: () {
                    _getFromCamera(context, picker);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                  ),
                  title: const Text(
                    "Select from Camera",
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white, width: 2)),
                child: ListTile(
                  onTap: () {
                    _getFromGallery(context, picker);
                    Navigator.pop(context);
                  },
                  leading: const Icon(
                    Icons.photo,
                    color: AppColors.white,
                  ),
                  title: const Text(
                    "Select from Gallery",
                    style: TextStyle(color: AppColors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );
}

Future<void> _getFromCamera(
  BuildContext context,
  ImagePicker picker,
) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.camera,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );

  if (xFile != null && context.mounted) {
    context.read<UserCubit>().updateCurrentUserField(
          fieldKey: UserFieldKeys.image,
          value: xFile.path,
        );
  }
}

Future<void> _getFromGallery(
  BuildContext context,
  ImagePicker picker,
) async {
  XFile? xFile = await picker.pickImage(
    source: ImageSource.gallery,
    maxHeight: 512 * height / figmaHeight,
    maxWidth: 512 * width / figmaWidth,
  );
  if (xFile != null && context.mounted) {
    context.read<UserCubit>().updateCurrentUserField(
          fieldKey: UserFieldKeys.image,
          value: xFile.path,
        );
  }
}

ElevatedButton getIcon(
  String iconName, {
  required BuildContext context,
  required VoidCallback? onTap,
  Color? color,
  IconType? iconType,
}) =>
    ElevatedButton(onPressed: onTap, child: Text('iconName'));

void addAddressDialog(
    BuildContext context,
    TextEditingController apartmentController,
    TextEditingController orientationController,
    VoidCallback onTap) {
  showModalBottomSheet(
    backgroundColor: getTheme(context) ? AppColors.dark1 : AppColors.c_100,
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(40), right: Radius.circular(40))),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Text(
                  'Address Details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                )),
                SizedBox(
                  height: 24,
                ),
                const Divider(
                  color: AppColors.c_200,
                ),
                SizedBox(
                  height: 24,
                ),
                // BlocBuilder<AddressCubit, AddressState>(
                //     builder: (context, state) {
                //   if (state is AddressSuccessState) {
                //     return Text(
                //       state.address,
                //       style: Theme.of(context)
                //           .textTheme
                //           .labelLarge!
                //           .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                //     );
                //   }
                //   return Text(
                //     'Name Address',
                //     style: Theme.of(context)
                //         .textTheme
                //         .labelLarge!
                //         .copyWith(fontSize: 18),
                //   );
                // }),
                SizedBox(
                  height: 24,
                ),
                TextField(
                  controller: apartmentController,
                  decoration: InputDecoration(
                    hintText: 'Apartment',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Address Details',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: orientationController,
                  decoration: InputDecoration(
                    hintText: '931 Indian Summer Drive Taylor, MI 48180kg',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                ElevatedButton(onPressed: onTap, child: Text('Add Address')),
                SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
