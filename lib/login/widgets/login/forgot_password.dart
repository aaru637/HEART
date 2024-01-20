import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/screens/forgot_password.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/login/widgets/login/remember_me.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginForgotPassword extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginForgotPassword(
      {super.key,
      required this.formKey,
      required this.dimension,
      required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: dimension.width * 0.015,
        right: dimension.width * 0.015,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RememberMe(),
          TextButton(
            onPressed: () => Get.off(
              () => const LoginForgotPasswordScreen(),
              transition: Transition.native,
              duration: const Duration(seconds: 1),
            ),
            child: Text(
              Login_Text.forgotPassword,
              style: TextStyle(
                fontFamily: "RobotoSlab_Regular",
                fontSize: styles.contentFontSize,
                fontWeight: FontWeight.normal,
                letterSpacing: 1,
                color: AppColors.loginpageInputField,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
