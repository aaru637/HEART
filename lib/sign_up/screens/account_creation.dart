import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/utils/text.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/account_created_continue_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpAccountCreated extends StatelessWidget {
  const SignUpAccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<SignUpTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: dimension.width * 0.06,
          right: dimension.width * 0.06,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: dimension.height * 0.06,
            ),
            LottieBuilder.asset(
              "assets/animations/signup/email_verified.json",
              width: dimension.width * 0.8,
              height: dimension.height * 0.2,
            ),
            SizedBox(
              height: dimension.height * 0.02,
            ),
            Text(
              Sign_Up_Text.success,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: styles.titleFontSize,
                  ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: dimension.width * 0.02,
            ),
            Container(
              margin: EdgeInsets.only(
                left: dimension.width * 0.04,
                right: dimension.width * 0.04,
              ),
              child: Text(
                Sign_Up_Text.verifedInfo,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: dimension.width * 0.05,
            ),
            AccountCreatedContinueButton(
              dimension: dimension,
              styles: styles,
            ),
            SizedBox(
              height: dimension.height * 0.07,
            ),
          ],
        ),
      ),
    );
  }
}
