import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/screens/password_reset_email.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';

import '../../../providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginForgotPasswordSendMail extends StatelessWidget {
  final TextEditingController email;
  final GlobalKey<FormState> formKey;
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginForgotPasswordSendMail(
      {super.key,
      required this.email,
      required this.formKey,
      required this.dimension,
      required this.styles});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: dimension.width * 0.5,
        child: ElevatedButton(
          onPressed: () {
            formKey.currentState!.validate();
            if (email.text != "") {
              print("Entered");
              Get.off(
                () => const LoginPassworResetEmail(),
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
            Login_Text.sendMail,
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
