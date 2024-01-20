import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginGoogleButton extends StatelessWidget {
  final DimensionProvider dimension;
  final LoginTextStyleProvider styles;
  const LoginGoogleButton(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: dimension.width * 0.015, right: dimension.width * 0.015),
      width: dimension.width * 0.40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(dimension.width * 0.028),
          backgroundColor: Colors.red.shade700,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(EvaIcons.google),
            SizedBox(
              width: dimension.width * 0.03,
            ),
            Text(
              Login_Text.google,
              style: TextStyle(
                fontFamily: "TiltWarp",
                letterSpacing: 1,
                fontSize: styles.loginFontSize,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
