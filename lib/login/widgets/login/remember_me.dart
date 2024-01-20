import 'package:flutter/material.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/controller/remember_me_controller.dart';
import 'package:heart/login/utils/text.dart';
import 'package:heart/providers/text_style_provider/login_text_style_provider/login_text_style_provider.dart';
import 'package:provider/provider.dart';

class RememberMe extends StatefulWidget {
  const RememberMe({
    super.key,
  });

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool selected = false;
  final controller = RememberMeController.instance;
  @override
  Widget build(BuildContext context) {
    final styles = Provider.of<LoginTextStyleProvider>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: AppColors.loginButtonColor,
          checkColor: Colors.white,
          value: selected,
          onChanged: (value) {
            setState(
              () {
                selected = value!;
              },
            );
            controller.updateStatus(value!);
          },
          side: const BorderSide(
            color: AppColors.loginButtonColor,
            width: 2.0,
          ),
        ),
        Text(
          Login_Text.rememberMe,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: styles.contentFontSize,
              ),
        ),
      ],
    );
  }
}
