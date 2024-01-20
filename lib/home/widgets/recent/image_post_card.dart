import 'package:flutter/material.dart';
import 'package:heart/home/widgets/recent/comments.dart';
import 'package:heart/home/widgets/recent/content.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_body/post_card_image_body.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_heading/post_card_heading.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_icons/post_card_icons.dart';
import 'package:heart/home/widgets/recent/post_card/post_card_like.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ImagePostCard extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ImagePostCard(
      {super.key, required this.dimension, required this.styles});

  @override
  State<ImagePostCard> createState() => _ImagePostCardState();
}

class _ImagePostCardState extends State<ImagePostCard> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: widget.dimension.width * 0.02,
        right: widget.dimension.width * 0.02,
        bottom: widget.dimension.width * 0.08,
        top: widget.dimension.width * 0.01,
      ),
      padding: EdgeInsets.only(
        bottom: widget.dimension.width * 0.04,
        right: widget.dimension.width * 0.015,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).cardColor,
            offset: Offset.zero,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          ),
          BoxShadow(
            color: Theme.of(context).canvasColor,
            offset: Offset.zero,
            blurRadius: 10,
            blurStyle: BlurStyle.inner,
          )
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostCardHeading(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
          SizedBox(
            height: widget.dimension.height * 0.015,
          ),
          PostCardImageBody(
            dimension: widget.dimension,
          ),
          SizedBox(
            height: widget.dimension.height * 0.01,
          ),
          PostCardIcons(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
          SizedBox(
            height: widget.dimension.height * 0.01,
          ),
          PostCardLike(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
          SizedBox(
            height: widget.dimension.height * 0.007,
          ),
          Content(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
          SizedBox(
            height: widget.dimension.height * 0.003,
          ),
          Comments(
            dimension: widget.dimension,
            styles: widget.styles,
          ),
          SizedBox(
            height: widget.dimension.height * 0.015,
          ),
        ],
      ),
    );
  }
}
