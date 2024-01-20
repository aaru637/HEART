import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/utils/text.dart';
import 'package:heart/sign_up/widgets/email_verification_widgets/cancel_button.dart';
import 'package:heart/sign_up/widgets/email_verification_widgets/continue_button.dart';
import 'package:heart/sign_up/widgets/email_verification_widgets/resend_email_button.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUpEmailVerification extends StatelessWidget {
  const SignUpEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<SignUpTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: dimension.height * 0.06,
            ),
            VerificationMailCancelButton(
              dimension: dimension,
            ),
            SizedBox(
              height: dimension.height * 0.08,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "assets/animations/signup/email_verification.json",
                  width: dimension.width * 0.8,
                  height: dimension.height * 0.2,
                ),
                SizedBox(
                  height: dimension.height * 0.02,
                ),
                Text(
                  Sign_Up_Text.verify,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: styles.titleFontSize,
                      ),
                ),
                SizedBox(
                  height: dimension.height * 0.02,
                ),
                Text(
                  "dhandapansiakthi123@gmail.com",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: styles.contentFontSize,
                      ),
                ),
                SizedBox(
                  height: dimension.height * 0.02,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: dimension.width * 0.04,
                      right: dimension.width * 0.04),
                  child: Text(
                    Sign_Up_Text.verifyInfo,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: styles.contentFontSize,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: dimension.height * 0.03,
                ),
                VerificationMailContinueButton(
                  dimension: dimension,
                  styles: styles,
                ),
                SizedBox(
                  height: dimension.height * 0.03,
                ),
                VerificationMailResendMailButton(
                  dimension: dimension,
                  styles: styles,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
