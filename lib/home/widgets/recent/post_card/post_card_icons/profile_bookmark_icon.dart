import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/image_post_card_provider/image_post_card_icon_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../../common_utils/icons.dart';

class ProfileBookmarkIcon extends StatelessWidget {
  final DimensionProvider dimension;
  const ProfileBookmarkIcon({super.key, required this.dimension});

  @override
  Widget build(BuildContext context) {
    final bookmark =
        Provider.of<ImagePostCardIconProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        bookmark.updateBookMark();
      },
      child: Padding(
        padding: EdgeInsets.all(
          dimension.width * 0.02,
        ),
        child: bookmark.isBookMarked
            ? Theme.of(context).iconTheme.color == Colors.white
                ? Iconify(
                    AppIcons.bookmark_white,
                  )
                : Iconify(
                    AppIcons.bookmark_black,
                  )
            : Iconify(
                AppIcons.bookmark_outline,
                color: Theme.of(context).iconTheme.color,
              ),
      ),
    );
  }
}
