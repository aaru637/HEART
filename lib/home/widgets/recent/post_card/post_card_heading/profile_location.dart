import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:provider/provider.dart';

class ProfileLocation extends StatelessWidget {
  const ProfileLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<HomeTextStyleProvider>(context, listen: true);
    return Row(
      children: [
        InkWell(
          onTap: () {
            print("Location Icon Clicked");
          },
          child: const Iconify(
            Carbon.location,
            size: 14,
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: dimension.width * 0.012,
        ),
        // Place
        InkWell(
          onTap: () {
            print("Location Text Clicked");
          },
          child: SizedBox(
            width: dimension.width * 0.55,
            child: Text(
              "Government College of Engineering Dharmapuri",
              style: TextStyle(
                fontFamily: "TiltWarp",
                fontSize: styles.subContentFontSize,
                fontWeight: FontWeight.normal,
                color: Colors.blue,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),

        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
