import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/screens/login.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginPasswordResetSuccess extends StatelessWidget {
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginPasswordResetSuccess(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: dimension.width * 0.5,
        child: ElevatedButton(
          onPressed: () => Get.off(
            () => const Login(),
            transition: Transition.native,
            duration: const Duration(seconds: 1),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.loginButtonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            Login_Text.done,
            style: TextStyle(
              fontFamily: "TiltWarp",
              letterSpacing: 1,
              fontSize: styles.loginFontSize,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
