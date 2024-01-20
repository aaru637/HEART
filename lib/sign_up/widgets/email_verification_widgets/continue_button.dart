import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/screens/account_creation.dart';
import 'package:heart/sign_up/utils/text.dart';

class VerificationMailContinueButton extends StatelessWidget {
  final DimensionProvider dimension;
  final SignUpTextStyleProvider styles;
  const VerificationMailContinueButton(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dimension.width * 0.5,
      child: ElevatedButton(
        onPressed: () => Get.off(
          () => const SignUpAccountCreated(),
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
          Sign_Up_Text.cotinue,
          style: TextStyle(
            fontFamily: "TiltWarp",
            letterSpacing: 1,
            fontSize: styles.signUpFontSize,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
