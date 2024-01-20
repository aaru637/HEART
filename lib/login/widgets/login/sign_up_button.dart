import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:heart/sign_up/screens/sign_up.dart';

class LoginSignUpButton extends StatelessWidget {
  final LoginTextStyleProvider styles;
  const LoginSignUpButton({super.key, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Login_Text.newAccount,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: styles.loginFontSize,
              ),
        ),
        TextButton(
          onPressed: () {
            Get.off(
              () => const SignUp(),
              transition: Transition.native,
              duration: const Duration(
                seconds: 1,
              ),
            );
          },
          child: Text(
            Login_Text.signup,
            style: TextStyle(
              fontFamily: "RobotoSlab_Regular",
              fontSize: styles.loginFontSize,
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
