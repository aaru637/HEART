import 'package:flutter/material.dart';
import 'package:heart/home/widgets/bottom_sheets/three_dot_options_bottom_sheet.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/entypo.dart';

class ProfileThreeDotIcon extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ProfileThreeDotIcon(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          useSafeArea: true,
          context: context,
          builder: (BuildContext context) {
            return ThreeDotOptionsBottomSheet(
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
        padding: EdgeInsets.only(
          right: dimension.width * 0.02,
        ),
        child: Iconify(
          Entypo.dots_three_horizontal,
          color: Theme.of(context).iconTheme.color!,
        ),
      ),
    );
  }
}
