import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/controller/agree_controller.dart';
import 'package:heart/sign_up/utils/text.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/back_button.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/connect_others.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/email_field.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/login_button.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/name_field.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/password_field.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/policy_terms.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/sign_up_button.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/social_media_buttons.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/username_field.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final controller = Get.put(AgreeController());

  @override
  void dispose() {
    super.dispose();
    if (!mounted) return;
    name.dispose();
    email.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<SignUpTextStyleProvider>(context, listen: true);
    return Scaffold(
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Container(
                margin: EdgeInsets.only(
                  left: dimension.width * 0.03,
                  right: dimension.width * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: dimension.height * 0.08,
                    ),
                    const SignUpBackButton(),
                    Column(
                      children: [
                        SizedBox(
                          height: dimension.height * 0.02,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            Sign_Up_Text.letsGetStarted,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: styles.titleFontSize,
                                ),
                          ),
                        ),
                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        // Information
                        Text(
                          Sign_Up_Text.info,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontSize: styles.contentFontSize,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        // Name Field
                        SignUpName(
                          name: name,
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpEmail(
                          email: email,
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpUsernameField(
                          username: username,
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpPasswordField(
                          password: password,
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.01,
                        ),

                        SignUpPolicyTerms(
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.01,
                        ),

                        SignUpButton(
                          formKey: key,
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpConnectOthers(
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpSocailMediaButtons(
                          dimension: dimension,
                          styles: styles,
                        ),

                        SizedBox(
                          height: dimension.height * 0.02,
                        ),

                        SignUpLoginButton(
                          styles: styles,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
