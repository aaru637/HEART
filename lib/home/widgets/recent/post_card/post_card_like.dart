import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class PostCardLike extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const PostCardLike(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Like Count Clicked");
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: dimension.width * 0.02,
          bottom: dimension.width * 0.01,
        ),
        child: Text(
          "No Likes",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: styles.contentFontSize,
              ),
        ),
      ),
    );
  }
}
