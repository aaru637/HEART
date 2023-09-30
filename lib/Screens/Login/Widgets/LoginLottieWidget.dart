import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginLottieWidget extends StatelessWidget {
  const LoginLottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.03,
          bottom: MediaQuery.of(context).size.height * 0.03),
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: LottieBuilder.asset("assets/animations/Login_Page.json"),
      ),
    );
  }
}
