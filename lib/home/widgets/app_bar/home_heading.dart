import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

class HomeHeading extends StatelessWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const HomeHeading({super.key, required this.dimension, required this.styles});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: dimension.width * 0.02,
        right: dimension.width * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/logo/HEART_LOGO.png",
                width: styles.titleFontSize * 2,
                height: styles.titleFontSize * 2,
              ),
              Container(
                margin: EdgeInsets.only(
                  top: dimension.height * 0.02,
                ),
                child: Text(
                  "EART",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontSize: styles.titleFontSize,
                      ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Iconify(
              Carbon.notification_new,
              size: 30,
              color: Theme.of(context).iconTheme.color!,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
