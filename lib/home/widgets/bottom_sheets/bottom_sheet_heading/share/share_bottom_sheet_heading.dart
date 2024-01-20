import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/bottom_sheet_heading/share/share_bottom_sheet_heading_search_field.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ShareBottomSheetHeading extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  final TextEditingController search;
  const ShareBottomSheetHeading(
      {super.key,
      required this.dimension,
      required this.styles,
      required this.search});

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
          height: dimension.height * 0.012,
        ),
        ShareBottomSheetHeadingSearch(
          search: search,
          dimension: dimension,
          styles: styles,
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
