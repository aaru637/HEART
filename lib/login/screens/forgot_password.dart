import 'package:flutter/material.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/login/widgets/forgot_password/forgot_email_field.dart';
import 'package:heart/login/widgets/forgot_password/send_email_button.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/back_button.dart';
import 'package:provider/provider.dart';

class LoginForgotPasswordScreen extends StatefulWidget {
  const LoginForgotPasswordScreen({super.key});

  @override
  State<LoginForgotPasswordScreen> createState() =>
      _LoginForgotPasswordScreenState();
}

class _LoginForgotPasswordScreenState extends State<LoginForgotPasswordScreen> {
  final TextEditingController email = TextEditingController();
  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<LoginTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: dimension.height * 0.1,
                ),
                const SignUpBackButton(),
                Container(
                  margin: EdgeInsets.only(
                    left: dimension.width * 0.04,
                    right: 16.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: dimension.height * 0.03,
                      ),
                      Text(
                        Login_Text.forgot,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: styles.welcomeBackFontSize,
                            ),
                      ),
                      SizedBox(
                        height: dimension.height * 0.02,
                      ),
                      Text(
                        Login_Text.forgotInfo,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: styles.contentFontSize,
                                ),
                      ),
                      SizedBox(
                        height: dimension.height * 0.04,
                      ),
                      ForgotEmailField(
                        email: email,
                        dimension: dimension,
                        styles: styles,
                      ),
                      SizedBox(
                        height: dimension.height * 0.04,
                      ),
                      LoginForgotPasswordSendMail(
                        email: email,
                        formKey: key,
                        dimension: dimension,
                        styles: styles,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
