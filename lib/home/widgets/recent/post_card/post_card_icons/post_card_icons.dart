import 'package:flutter/material.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/profile_bookmark_icon.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/profile_comment_icon.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/profile_like_icon.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/profile_post_time.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/profile_share_icon.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class PostCardIcons extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const PostCardIcons(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfileLikeIcon(
              dimension: dimension,
            ),
            ProfileCommentIcon(
              dimension: dimension,
              styles: styles,
            ),
            ProfileShareIcon(
              dimension: dimension,
              styles: styles,
            ),
          ],
        ),
        Row(
          children: [
            ProfilePostTime(
              dimension: dimension,
              styles: styles,
            ),
            SizedBox(
              width: dimension.width * 0.015,
            ),
            ProfileBookmarkIcon(
              dimension: dimension,
            ),
          ],
        ),
      ],
    );
  }
}
