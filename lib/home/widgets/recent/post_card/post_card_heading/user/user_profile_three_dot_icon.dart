import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/entypo.dart';
import 'package:provider/provider.dart';

class UserProfileThreeDotIcon extends StatelessWidget {
  const UserProfileThreeDotIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    return // 3 Dot icon
        Padding(
      padding: EdgeInsets.only(
        right: dimension.width * 0.032,
      ),
      child: Iconify(
        Entypo.dots_three_horizontal,
        color: Theme.of(context).iconTheme.color!,
      ),
    );
  }
}
