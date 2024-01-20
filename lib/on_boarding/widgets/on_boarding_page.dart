import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../providers/text_style_provider/on_boarding_text_style_provider/on_boarding_text_style_provider.dart';

class On_Boarding_Page extends StatelessWidget {
  final String animationString;
  final String title;
  final String content;
  final DimensionProvider dimension;
  const On_Boarding_Page(
      {super.key,
      required this.animationString,
      required this.title,
      required this.content,
      required this.dimension});

  @override
  Widget build(BuildContext context) {
    final styles =
        Provider.of<OnBoardingTextStyleProvider>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: dimension.height * 0.3,
        ),
        LottieBuilder.asset(
          animationString,
          width: dimension.width * 0.8,
          height: dimension.width * 0.4,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: styles.titleFontSize),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: dimension.height * 0.03,
        ),
        Text(
          content,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontSize: styles.contentFontSize),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
