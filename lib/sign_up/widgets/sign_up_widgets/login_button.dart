import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/screens/login.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/utils/text.dart';

class SignUpLoginButton extends StatelessWidget {
  final SignUpTextStyleProvider styles;
  const SignUpLoginButton({super.key, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Sign_Up_Text.existingAccount,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: styles.signUpFontSize,
              ),
        ),
        TextButton(
          onPressed: () {
            Get.off(
              () => const Login(),
              transition: Transition.native,
              duration: const Duration(
                seconds: 1,
              ),
            );
          },
          child: Text(
            Sign_Up_Text.login,
            style: TextStyle(
              fontFamily: "RobotoSlab_Regular",
              fontSize: styles.signUpFontSize,
              fontWeight: FontWeight.normal,
              letterSpacing: 1,
              color: AppColors.loginpageInputField,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
