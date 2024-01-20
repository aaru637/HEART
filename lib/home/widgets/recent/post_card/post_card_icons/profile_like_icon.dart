import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/image_post_card_provider/image_post_card_icon_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../common_utils/icons.dart';

class ProfileLikeIcon extends StatelessWidget {
  final DimensionProvider dimension;
  const ProfileLikeIcon({super.key, required this.dimension});

  @override
  Widget build(BuildContext context) {
    final like = Provider.of<ImagePostCardIconProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        like.updateLike();
      },
      child: Padding(
        padding: EdgeInsets.all(
          dimension.width * 0.02,
        ),
        child: like.isLikeEnabled
            ? Iconify(
                AppIcons.like,
              )
            : Iconify(
                AppIcons.like_border,
                color: Theme.of(context).iconTheme.color,
              ),
      ),
    );
  }
}
