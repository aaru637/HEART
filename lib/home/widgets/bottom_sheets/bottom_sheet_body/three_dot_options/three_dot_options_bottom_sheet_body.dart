import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/three_dot_options/three_dot_options_bottom_sheet_about_account.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/three_dot_options/three_dot_options_bottom_sheet_reason.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/three_dot_options/three_dot_options_bottom_sheet_report.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ThreeDotOptionsBottomSheetBody extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheetBody(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ThreeDotOptionsBottomSheetReason(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          height: dimension.height * 0.02,
        ),
        ThreeDotOptionsBottomSheetAboutAccount(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          height: dimension.height * 0.02,
        ),
        ThreeDotOptionsBottomSheetReport(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          height: dimension.height * 0.02,
        ),
      ],
    );
  }
}
