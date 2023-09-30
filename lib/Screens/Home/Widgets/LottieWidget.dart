import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  const LottieWidget({super.key});

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(bottom: height * 0.06, right: width * 0.1),
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Lottie.asset("assets/animations/SchoolAnimation.json")),
    );
  }
}
