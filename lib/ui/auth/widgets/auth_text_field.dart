import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:api_servis_http/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    required this.onChanged,
    required this.focusNode,
    this.parolkoz,
  });

  final String hintText;
  final String? parolkoz;
  final String prefixIcon;
  final FocusNode focusNode;
  final bool isPassword;
  final ValueChanged<String> onChanged;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  final TextEditingController _controller = TextEditingController();
  bool _isObscured = false;
  bool isFocused = false;
  Color _iconColor = AppColors.c_500;
  var maskFormatter = MaskTextInputFormatter(
      mask: '## ### ## ##', filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        if (widget.focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.primary;
          });
        } else {
          if (AdaptiveTheme.of(context).theme ==
              AdaptiveTheme.of(context).darkTheme) {
            setState(() {
              _iconColor = AppColors.white;
            });
          } else {
            setState(() {
              _iconColor = AppColors.c_900;
            });
          }
        }
      } else {
        if (widget.focusNode.hasFocus) {
          setState(() {
            _iconColor = AppColors.primary;
          });
        } else {
          setState(() {
            _iconColor = AppColors.c_500;
          });
        }
      }
    });
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          _iconColor = AppColors.primary;
        });
      } else {
        if (_controller.text.isNotEmpty) {
          setState(() {
            _iconColor = AppColors.c_500;
          });
        } else {
          setState(() {
            _iconColor = AppColors.c_500;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          widget.isPassword ? TextInputType.text : TextInputType.phone,
      textInputAction:
          widget.isPassword ? TextInputAction.done : TextInputAction.go,
      focusNode: widget.focusNode,
      controller: _controller,
      obscureText: widget.parolkoz == null ? _isObscured : !_isObscured,
      onChanged: widget.onChanged,
      maxLength: widget.isPassword ? 20 : 12,
      inputFormatters: [if (!widget.isPassword) maskFormatter],
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
          fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.2),
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontWeight: FontWeight.w400, color: AppColors.c_500),
          prefixIcon: !widget.isPassword
              ? SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: null, child: Text('A grey color mode')),
                      Text(
                        "+998",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.2),
                      )
                    ],
                  ),
                )
              : ElevatedButton(
                  onPressed: () {}, child: Text('A grey color mode')),
          suffixIcon: widget.isPassword
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                  child: Text('show'))
              : const SizedBox(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.c_50)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.c_50)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(width: 1, color: AppColors.primary)),
          fillColor:
              widget.focusNode.hasFocus ? AppColors.orangeTransparent : null,
          filled: true),
    );
  }
}
