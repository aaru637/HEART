import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

class ThreeDotOptionsBottomSheetSave extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheetSave(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: dimension.width * 0.04,
        right: dimension.width * 0.04,
        bottom: dimension.width * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(
              dimension.width * 0.04,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                30,
              ),
              color: Theme.of(context).cardColor.withOpacity(0.1),
            ),
            child: Iconify(
              Carbon.bookmark,
              color: Theme.of(context).iconTheme.color,
              size: 30,
            ),
          ),
          SizedBox(
            height: dimension.height * 0.012,
          ),
          Text(
            "Save",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: styles.bottomSheetFooterFontSize,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
