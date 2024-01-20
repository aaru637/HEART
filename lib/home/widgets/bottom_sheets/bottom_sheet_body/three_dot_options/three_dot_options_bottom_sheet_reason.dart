import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

class ThreeDotOptionsBottomSheetReason extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheetReason(
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
          const Iconify(Carbon.report),
          SizedBox(
            width: dimension.width * 0.032,
          ),
          Text(
            "Why you're seeing this post",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: styles.bottomSheetFooterFontSize,
                ),
          ),
        ],
      ),
    );
  }
}
