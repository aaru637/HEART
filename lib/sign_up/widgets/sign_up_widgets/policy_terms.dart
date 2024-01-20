import 'package:flutter/material.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/controller/agree_controller.dart';
import 'package:heart/sign_up/utils/text.dart';

class SignUpPolicyTerms extends StatefulWidget {
  final SignUpTextStyleProvider styles;
  const SignUpPolicyTerms({super.key, required this.styles});

  @override
  State<SignUpPolicyTerms> createState() => _SignUpPolicyTermsState();
}

class _SignUpPolicyTermsState extends State<SignUpPolicyTerms> {
  static AgreeController controller = AgreeController.instance;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.loginButtonColor,
          checkColor: Colors.white,
          value: selected,
          onChanged: (value) {
            setState(
              () {
                selected = value!;
              },
            );
            controller.updateStatus(value!);
          },
          side: BorderSide(
            color: !controller.checkStatus()
                ? AppColors.loginErrorColor
                : AppColors.loginButtonColor,
            width: 2.0,
          ),
        ),
        Row(
          children: [
            Text(
              Sign_Up_Text.agree,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: widget.styles.contentFontSize,
                  ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                Sign_Up_Text.terms,
                style: TextStyle(
                  fontFamily: "RobotoSlab_Medium",
                  fontSize: widget.styles.contentFontSize,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1,
                  color: AppColors.loginpageInputField,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.loginpageInputField,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.0,
                ),
              ),
            ),
            Text(
              Sign_Up_Text.and,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: widget.styles.contentFontSize,
                  ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                Sign_Up_Text.conditions,
                style: TextStyle(
                  fontFamily: "RobotoSlab_Medium",
                  fontSize: widget.styles.contentFontSize,
                  fontWeight: FontWeight.normal,
                  letterSpacing: 1,
                  color: AppColors.loginpageInputField,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.loginpageInputField,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 2.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
