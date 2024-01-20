import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/login/widgets/forgot_password/done_button.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPassworResetEmail extends StatelessWidget {
  const LoginPassworResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension =
        Provider.of<DimensionProvider>(Get.context!, listen: true);
    final styles = Provider.of<LoginTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          left: dimension.width * 0.05,
          right: dimension.width * 0.05,
          top: dimension.height * 0.06,
          bottom: dimension.height * 0.06,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: dimension.height * 0.04,
              ),
              LottieBuilder.asset(
                "assets/animations/signup/email_verified.json",
                width: dimension.width * 0.8,
                height: dimension.height * 0.26,
              ),
              SizedBox(
                height: dimension.height * 0.02,
              ),
              Text(
                Login_Text.passwordReset,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: styles.welcomeBackFontSize,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: dimension.height * 0.02,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: dimension.width * 0.04,
                  right: dimension.width * 0.04,
                ),
                child: Text(
                  Login_Text.resetInfo,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: styles.contentFontSize,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: dimension.height * 0.03,
              ),
              LoginPasswordResetSuccess(
                dimension: dimension,
                styles: styles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
