import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/login/screens/login.dart';

class SignUpBackButton extends StatelessWidget {
  const SignUpBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      icon: const Icon(
        EvaIcons.arrowBack,
      ),
      onPressed: () {
        Get.off(
          () => const Login(),
          transition: Transition.native,
          duration: const Duration(
            seconds: 1,
          ),
        );
      },
    );
  }
}
