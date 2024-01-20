import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/share/share_bottom_sheet_body_profile.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ShareBottomSheetBody extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ShareBottomSheetBody(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: dimension.width * 0.02,
        right: dimension.width * 0.02,
        bottom: dimension.width * 0.02,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return ShareBottomSheetBodyProfile(
            dimension: dimension,
            styles: styles,
          );
        },
        itemCount: 20,
        shrinkWrap: true,
        dragStartBehavior: DragStartBehavior.start,
      ),
    );
  }
}
