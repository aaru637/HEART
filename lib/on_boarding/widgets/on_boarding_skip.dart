import 'package:flutter/material.dart';
import 'package:heart/on_boarding/controller/on_boarding_controller.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/on_boarding_text_style_provider/on_boarding_text_style_provider.dart';

class OnBoardingSkip extends StatelessWidget {
  final DimensionProvider dimension;
  final OnBoardingTextStyleProvider styles;
  const OnBoardingSkip({
    super.key,
    required this.dimension,
    required this.styles,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: dimension.height * 0.10,
      right: dimension.width * 0.06,
      child: TextButton(
        child: Text(
          "Skip",
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: styles.contentFontSize),
        ),
        onPressed: () => OnBoardingController.instance.skipPage(),
      ),
    );
  }
}
