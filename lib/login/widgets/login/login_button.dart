import 'package:flutter/material.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginButton(
      {super.key,
      required this.formKey,
      required this.dimension,
      required this.styles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension.width * 0.5,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {}
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.loginButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          Login_Text.login,
          style: TextStyle(
            fontFamily: "TiltWarp",
            letterSpacing: 1,
            fontSize: styles.loginFontSize,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
