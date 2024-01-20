import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/controller/agree_controller.dart';
import 'package:heart/sign_up/screens/email_verification.dart';
import 'package:heart/sign_up/utils/text.dart';

class SignUpButton extends StatelessWidget {
  final DimensionProvider dimension;
  final SignUpTextStyleProvider styles;
  final GlobalKey<FormState> formKey;
  const SignUpButton(
      {super.key,
      required this.formKey,
      required this.dimension,
      required this.styles});

  @override
  Widget build(BuildContext context) {
    final controller = AgreeController.instance;
    return SizedBox(
      width: dimension.width * 0.5,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate() && controller.checkStatus()) {
            Get.off(
              () => const SignUpEmailVerification(),
              transition: Transition.native,
              duration: const Duration(seconds: 1),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.loginButtonColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          Sign_Up_Text.signup,
          style: TextStyle(
            fontFamily: "TiltWarp",
            letterSpacing: 1,
            fontSize: styles.signUpFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
