import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class ShareBottomSheetBodyProfile extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const ShareBottomSheetBodyProfile(
      {super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        dimension.width * 0.012,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/BEN.jpg"),
            radius: 30,
          ),
          SizedBox(
            height: dimension.height * 0.012,
          ),
          Text(
            "dhineshkumar_d_2002",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: styles.bottomSheetFooterFontSize,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
