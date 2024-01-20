import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/common_utils/colors.dart';
import 'package:heart/login/screens/login.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';

import '../../providers/text_style_provider/on_boarding_text_style_provider/on_boarding_text_style_provider.dart';

class OnBoardingGetStartedButton extends StatelessWidget {
  final DimensionProvider dimension;
  final OnBoardingTextStyleProvider styles;
  const OnBoardingGetStartedButton(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(
        bottom: dimension.height * 0.08,
      ),
      child: SizedBox(
        width: dimension.width * 0.5,
        child: ElevatedButton(
          onPressed: () => Get.off(
            () => const Login(),
            transition: Transition.native,
            duration: const Duration(
              seconds: 1,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.loginButtonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            "Get Started",
            style: TextStyle(
              fontFamily: "TiltWarp",
              letterSpacing: 1,
              fontSize: styles.getStartedFontSize,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
