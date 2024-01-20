import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/three_dot_options/three_dot_options_bottom_sheet_qrcode.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/three_dot_options/three_dot_options_bottom_sheet_repost.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/three_dot_options/three_dot_options_bottom_sheet_save.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ThreeDotOptionsBottomSheetHeading extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheetHeading({
    super.key,
    required this.dimension,
    required this.styles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: dimension.height * 0.025,
          ),
          width: 50,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: dimension.height * 0.032,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ThreeDotOptionsBottomSheetSave(
              dimension: dimension,
              styles: styles,
            ),
            ThreeDotOptionsBottomSheetRepost(
              dimension: dimension,
              styles: styles,
            ),
            ThreeDotOptionsBottomSheetQRCode(
              dimension: dimension,
              styles: styles,
            ),
          ],
        ),
        SizedBox(
          height: dimension.height * 0.012,
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
