import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ProfilePostTime extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ProfilePostTime(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: dimension.width * 0.02,
          height: dimension.width * 0.02,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(50),
          ),
        ),

        SizedBox(
          width: dimension.width * 0.015,
        ),

        // Time
        Text(
          "22 December 2023",
          style: TextStyle(
            fontFamily: "TiltWarp",
            fontSize: styles.contentFontSize,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
