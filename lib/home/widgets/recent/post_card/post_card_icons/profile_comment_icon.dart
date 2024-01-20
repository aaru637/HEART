import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/comments_bottom_sheet.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

import '../../../../../common_utils/icons.dart';

class ProfileCommentIcon extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ProfileCommentIcon(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return CommentsBottomSheet(
              dimension: dimension,
              styles: styles,
            );
          },
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(
          dimension.width * 0.02,
        ),
        child: Iconify(
          AppIcons.comment,
          color: Theme.of(context).iconTheme.color,
        ),
      ),
    );
  }
}
