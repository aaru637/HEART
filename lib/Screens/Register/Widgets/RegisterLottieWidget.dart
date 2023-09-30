import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterLottieWidget extends StatelessWidget {
  const RegisterLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.40,
      child: ClipRRect(
        child: LottieBuilder.asset("assets/animations/Register_Page.json"),
      ),
    );
  }
}
