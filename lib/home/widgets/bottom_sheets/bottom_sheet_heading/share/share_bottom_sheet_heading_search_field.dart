import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ShareBottomSheetHeadingSearch extends StatelessWidget {
  final TextEditingController search;
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ShareBottomSheetHeadingSearch(
      {super.key,
      required this.search,
      required this.dimension,
      required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: dimension.width * 0.01,
        horizontal: dimension.width * 0.03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor.withOpacity(
              0.1,
            ),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: styles.contentFontSize,
            ),
        controller: search,
        keyboardType: TextInputType.name,
        clipBehavior: Clip.none,
        expands: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: dimension.width * 0.05,
            right: dimension.width * 0.05,
            top: dimension.width * 0.002,
            bottom: dimension.width * 0.002,
          ),
          border: InputBorder.none,
          hintText: "Search",
          enabledBorder: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: styles.contentFontSize,
              ),
        ),
      ),
    );
  }
}
