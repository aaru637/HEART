import 'package:flutter/material.dart';
import 'package:heart/home/widgets/recent/comments/detailed_comments.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class Comments extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const Comments({super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      scrollDirection: Axis.vertical,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index >= 2) {
          return Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "View All Comments",
                style: TextStyle(
                  fontFamily: "TiltWarp",
                  fontSize: styles.contentFontSize,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        } else {
          return DetailedComments(
            dimension: dimension,
            styles: styles,
          );
        }
      },
    );
  }
}
