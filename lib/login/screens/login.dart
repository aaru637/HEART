import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/login/controller/remember_me_controller.dart';
import 'package:heart/login/utils/animation_string.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/login/widgets/login/connect_others.dart';
import 'package:heart/login/widgets/login/forgot_password.dart';
import 'package:heart/login/widgets/login/login_button.dart';
import 'package:heart/login/widgets/login/password_field.dart';
import 'package:heart/login/widgets/login/sign_up_button.dart';
import 'package:heart/login/widgets/login/social_media_buttons.dart';
import 'package:heart/login/widgets/login/username_field.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final key = GlobalKey<FormState>();
  final controller = Get.put(RememberMeController());

  @override
  void dispose() {
    super.dispose();
    if (!mounted) return;
    username.dispose();
    password.dispose();
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
            child: Container(
              margin: EdgeInsets.only(
                left: dimension.width * 0.03,
                right: dimension.width * 0.03,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: dimension.height * 0.1,
                  ),
                  // Animation
                  LottieBuilder.asset(
                    Login_Animation_Strings.login_animation,
                    width: dimension.width * 0.8,
                    height: dimension.height * 0.2,
                  ),

                  // Welcome
                  Text(
                    Login_Text.welcome,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: styles.welcomeBackFontSize,
                        ),
                  ),
                  SizedBox(
                    height: dimension.height * 0.01,
                  ),

                  // Information
                  Text(
                    Login_Text.info,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: styles.contentFontSize,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: dimension.height * 0.02,
                  ),

                  // Username Field
                  LoginUsernameField(
                    username: username,
                    dimension: dimension,
                    styles: styles,
                  ),
                  SizedBox(
                    height: dimension.height * 0.02,
                  ),

                  // Password Field
                  LoginPasswordField(
                    password: password,
                    dimension: dimension,
                    styles: styles,
                  ),

                  // Forgot Password Button
                  LoginForgotPassword(
                    formKey: key,
                    dimension: dimension,
                    styles: styles,
                  ),
                  SizedBox(
                    height: dimension.height * 0.02,
                  ),

                  // Login Button
                  LoginButton(
                    formKey: key,
                    dimension: dimension,
                    styles: styles,
                  ),
                  SizedBox(
                    height: dimension.height * 0.02,
                  ),

                  // Login Other Connections Information
                  LoginConnectOthers(
                    styles: styles,
                  ),
                  SizedBox(
                    height: dimension.height * 0.04,
                  ),

                  // Social Media Buttons
                  LoginSocailMediaButtons(
                    dimension: dimension,
                    styles: styles,
                  ),
                  SizedBox(
                    height: dimension.height * 0.04,
                  ),

                  // Sign Up Button
                  LoginSignUpButton(
                    styles: styles,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
