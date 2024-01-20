import 'package:flutter/material.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';

class SignUpUsernameField extends StatefulWidget {
  final DimensionProvider dimension;
  final SignUpTextStyleProvider styles;
  final TextEditingController username;
  const SignUpUsernameField(
      {super.key,
      required this.username,
      required this.dimension,
      required this.styles});

  @override
  State<SignUpUsernameField> createState() => _SignUpUsernameFieldState();
}

class _SignUpUsernameFieldState extends State<SignUpUsernameField> {
  Color color = AppColors.loginpageInputField;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        widget.dimension.width * 0.01,
      ),
      margin: EdgeInsets.symmetric(
        vertical: widget.dimension.width * 0.01,
        horizontal: widget.dimension.width * 0.01,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 2.0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: widget.styles.signUpFontSize,
            ),
        controller: widget.username,
        keyboardType: TextInputType.name,
        clipBehavior: Clip.none,
        expands: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: widget.dimension.width * 0.05,
            right: widget.dimension.width * 0.05,
            top: widget.dimension.width * 0.002,
            bottom: widget.dimension.width * 0.002,
          ),
          border: InputBorder.none,
          hintText: "Username",
          enabledBorder: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: widget.styles.signUpFontSize,
              ),
        ),
        validator: (value) {
          if (value == "") {
            setState(() {
              color = AppColors.loginErrorColor;
            });
          } else {
            setState(() {
              color = AppColors.loginpageInputField;
            });
          }
          return null;
        },
      ),
    );
  }
}
