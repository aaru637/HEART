import 'package:flutter/material.dart';
import 'package:heart/login/widgets/login/facebook_button.dart';
import 'package:heart/login/widgets/login/google_button.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginSocailMediaButtons extends StatelessWidget {
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginSocailMediaButtons(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        LoginFacebookButton(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          width: dimension.width * 0.02,
        ),
        LoginGoogleButton(
          dimension: dimension,
          styles: styles,
        ),
      ],
    );
  }
}
