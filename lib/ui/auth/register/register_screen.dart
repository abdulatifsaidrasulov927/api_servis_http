import 'package:api_servis_http/auth/widgets/auth_text_field.dart';
import 'package:api_servis_http/data/models/status/form_status.dart';
import 'package:api_servis_http/ui/auth/widgets/auth_navigator_button.dart';
import 'package:api_servis_http/ui/widgets/global_appbar.dart';
import 'package:api_servis_http/ui/widgets/global_button.dart';
import 'package:api_servis_http/utils/ui_utils/error_message_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_servis_http/cubits/auth_cubit/auth_cubit.dart';
import 'package:api_servis_http/data/local/storage_repository/storage_repository.dart';
import 'package:api_servis_http/utils/colors/app_colors.dart';
import 'package:api_servis_http/utils/constants/storage_keys.dart';
import 'package:api_servis_http/utils/icons/app_icons.dart';
import 'package:api_servis_http/utils/size/size_extension.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isChecked = false;

  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        onTap: () {
          Navigator.pop(context);
        },
        title: ("sign_up"),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              padding:
                  EdgeInsets.only(bottom: 48, left: 24, right: 24, top: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    ("create_your_account"),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  60.ph,
                  Column(
                    children: [
                      AuthTextField(
                        focusNode: phoneFocus,
                        hintText: ('phone_number'),
                        prefixIcon: AppIcons.call,
                        onChanged: (v) {
                          if (v.length == 12) {
                            phoneFocus.unfocus();
                            context
                                .read<AuthCubit>()
                                .updatePhone(v.replaceAll(" ", ""));
                            FocusScope.of(context).requestFocus(passwordFocus);
                          }
                        },
                      ),
                      20.ph,
                      AuthTextField(
                        focusNode: passwordFocus,
                        hintText: ('password'),
                        parolkoz: ' ',
                        prefixIcon: AppIcons.lock,
                        isPassword: true,
                        onChanged: (v) {
                          context
                              .read<AuthCubit>()
                              .updatePassword(v.replaceAll(" ", ""));
                        },
                      ),
                      // 20.ph,
                      // RememberCheckBox(
                      //   label: tr('remember_me'),
                      //   value: isChecked,
                      //   onChanged: (value) {
                      //     isChecked = value;
                      //     setState(() {});
                      //   },
                      //   // label: 'Remember me',
                      // ),
                      20.ph,
                      GlobalButton(
                        color: AppColors.primary,
                        title: ('sign_up'),
                        radius: 100,
                        textColor: AppColors.dark3,
                        onTap: () {
                          String canAuthText =
                              context.read<AuthCubit>().canAuthenticate();
                          if (canAuthText.isEmpty) {
                            context.read<AuthCubit>().signUp(context);
                          } else {
                            showErrorMessage(
                              message: canAuthText,
                              context: context,
                            );
                          }
                        },
                      )
                    ],
                  ),
                  // 60.ph,
                  // Column(
                  //   children: [
                  //     const CustomAuthDividerWidget(label: tr('or_continue_with')),
                  //     20.ph,
                  //     const SocialAuthButtons(),
                  //   ],
                  // ),
                  60.ph,
                  AuthNavigatorButton(
                    title: "${("already_have_an_account")}?",
                    onTapTitle: ('sign_in'),
                    onTap: () {},
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) async {
          if (state.status == FormStatus.authenticated) {
            await StorageRepository.putString(
              StorageKeys.userId,
              FirebaseAuth.instance.currentUser?.uid ?? "",
            );
            if (context.mounted) {
              // showRoleDialog(context);
            }
          } else if (state.status == FormStatus.failure) {
            showErrorMessage(message: state.statusMessage, context: context);
          }
        },
      ),
    );
  }
}
