import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class CommentsBottomSheetHeading extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const CommentsBottomSheetHeading(
      {super.key, required this.dimension, required this.styles});

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
          height: dimension.height * 0.022,
        ),
        Text(
          "Comments",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                fontSize: styles.titleFontSize,
              ),
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
