import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/image_post_card_provider/image_post_card_icon_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../common_utils/icons.dart';
import '../animation/like_animation.dart';

class PostCardImageBody extends StatefulWidget {
  final DimensionProvider dimension;
  const PostCardImageBody({super.key, required this.dimension});

  @override
  State<PostCardImageBody> createState() => _PostCardImageBodyState();
}

class _PostCardImageBodyState extends State<PostCardImageBody> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    final like = Provider.of<ImagePostCardIconProvider>(context, listen: true);
    return InkWell(
      onDoubleTap: () {
        like.updateLike();
        setState(() {
          tapped = !tapped;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/BEN.jpg",
            width: widget.dimension.width,
          ),
          like.isLikeEnabled
              ? AnimatedOpacity(
                  opacity: tapped ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: LikeAnimation(
                    isAnimating: tapped,
                    child: Iconify(
                      AppIcons.like,
                      color: Colors.red,
                      size: widget.dimension.width * 0.25,
                    ),
                    onEnd: () {
                      setState(
                        () {
                          tapped = false;
                        },
                      );
                    },
                  ),
                )
              : AnimatedOpacity(
                  opacity: tapped ? 1 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: LikeAnimation(
                    isAnimating: tapped,
                    child: Iconify(
                      AppIcons.like_break,
                      color: Colors.red,
                      size: widget.dimension.width * 0.25,
                    ),
                    onEnd: () {
                      setState(
                        () {
                          tapped = false;
                        },
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
