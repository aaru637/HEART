import 'package:flutter/material.dart';
import 'package:heart/on_boarding/controller/on_boarding_controller.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNavigation extends StatelessWidget {
  final DimensionProvider dimension;
  const OnBoardingNavigation({
    super.key,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
      bottom: dimension.height * 0.20,
      left: dimension.width * 0.1,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: Theme.of(context).cardColor,
          dotHeight: 6,
        ),
      ),
    );
  }
}
