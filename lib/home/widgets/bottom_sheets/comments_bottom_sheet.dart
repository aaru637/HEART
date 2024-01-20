import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_body/comments/comments_bottom_sheet_body.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_footer/comments/comments_bottom_sheet_footer.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/comments/comments_bottom_sheet_heading.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class CommentsBottomSheet extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const CommentsBottomSheet(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommentsBottomSheetHeading(
          dimension: dimension,
          styles: styles,
        ),
        SizedBox(
          height: dimension.height * 0.012,
        ),
        Expanded(
          child: CommentsBottomSheetBody(
            dimension: dimension,
            styles: styles,
          ),
        ),
        CommentsBottomSheetFooter(
          dimension: dimension,
          styles: styles,
        ),
      ],
    );
  }
}
