import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:provider/provider.dart';

class ProfileLogo extends StatelessWidget {
  const ProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    return // Profile Image
        InkWell(
      onTap: () {
        print("Profile Logo Clicked");
      },
      child: Container(
        padding: EdgeInsets.only(
          top: dimension.width * 0.02,
          right: dimension.width * 0.04,
          left: dimension.width * 0.015,
        ),
        child: const CircleAvatar(
          radius: 22,
          backgroundImage: AssetImage(
            "assets/images/BEN.jpg",
          ),
        ),
      ),
    );
  }
}
