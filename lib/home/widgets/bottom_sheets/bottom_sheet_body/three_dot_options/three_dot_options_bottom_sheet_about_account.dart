import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ThreeDotOptionsBottomSheetAboutAccount extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheetAboutAccount(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        dimension.width * 0.022,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.person),
          SizedBox(
            width: dimension.width * 0.032,
          ),
          Text(
            "About this account",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: styles.bottomSheetFooterFontSize,
                ),
          ),
        ],
      ),
    );
  }
}
