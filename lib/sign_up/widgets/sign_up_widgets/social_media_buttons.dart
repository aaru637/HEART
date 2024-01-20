import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/facebook_button.dart';
import 'package:heart/sign_up/widgets/sign_up_widgets/google_button.dart';

class SignUpSocailMediaButtons extends StatelessWidget {
  final DimensionProvider dimension;
  final SignUpTextStyleProvider styles;
  const SignUpSocailMediaButtons(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SignUpFacebookButton(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          width: dimension.width * 0.02,
        ),
        SignUpGoogleButton(
          dimension: dimension,
          styles: styles,
        ),
      ],
    );
  }
}
