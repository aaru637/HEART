import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/three_dot_options/three_dot_options_bottom_sheet_body.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/three_dot_options/three_dot_options_bottom_sheet_heading.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ThreeDotOptionsBottomSheet extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ThreeDotOptionsBottomSheet(
      {super.key, required this.dimension, required this.styles});

  @override
  State<ThreeDotOptionsBottomSheet> createState() =>
      _ThreeDotOptionsBottomSheetState();
}

class _ThreeDotOptionsBottomSheetState
    extends State<ThreeDotOptionsBottomSheet> {
  TextEditingController search = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    search.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ThreeDotOptionsBottomSheetHeading(
          dimension: widget.dimension,
          styles: widget.styles,
        ),
        SizedBox(
          height: widget.dimension.height * 0.012,
        ),
        Expanded(
          child: ThreeDotOptionsBottomSheetBody(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
        ),
        SizedBox(
          height: widget.dimension.height * 0.012,
        ),
      ],
    );
  }
}
