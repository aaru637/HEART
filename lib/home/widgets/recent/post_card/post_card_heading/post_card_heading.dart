import 'package:flutter/material.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_heading/profile_location.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_heading/profile_logo.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_heading/profile_three_dot_icon.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_heading/profile_username.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class PostCardHeading extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const PostCardHeading(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(
            dimension.width * 0.02,
          ),
          child: Row(
            children: [
              const ProfileLogo(),
              // Name and the Location.
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: dimension.height * 0.01,
                  ),
                  const ProfileUsername(),
                  SizedBox(
                    height: dimension.height * 0.01,
                  ),

                  // Location
                  const ProfileLocation(),
                ],
              ),
            ],
          ),
        ),
        // Three Dot Icon
        ProfileThreeDotIcon(
          dimension: dimension,
          styles: styles,
        ),
      ],
    );
  }
}
