import 'package:flutter/material.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';

class LoginConnectOthers extends StatelessWidget {
  final LoginTextStyleProvider styles;
  const LoginConnectOthers({super.key, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Text(
      Login_Text.otherConnectionInfo,
      style: TextStyle(
        fontFamily: "RobotoSlab_Regular",
        fontSize: styles.contentFontSize,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
