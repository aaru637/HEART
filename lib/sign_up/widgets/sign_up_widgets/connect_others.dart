import 'package:flutter/material.dart';
import 'package:heart/providers/text_style_provider/sign_up_text_style_provider/sign_up_text_style_provider.dart';
import 'package:heart/sign_up/utils/text.dart';

class SignUpConnectOthers extends StatelessWidget {
  final SignUpTextStyleProvider styles;
  const SignUpConnectOthers({super.key, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Text(
      Sign_Up_Text.otherConnectionInfo,
      style: TextStyle(
        fontFamily: "RobotoSlab_Regular",
        fontSize: styles.contentFontSize,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
      ),
    );
  }
}
