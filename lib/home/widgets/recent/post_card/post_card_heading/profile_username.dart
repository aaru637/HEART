import 'package:flutter/material.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:provider/provider.dart';

class ProfileUsername extends StatelessWidget {
  const ProfileUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final styles = Provider.of<HomeTextStyleProvider>(context, listen: true);
    return InkWell(
      onTap: () {
        print("Username Clicked");
      },
      child: Text(
        "Dhineshkumar Dhandapani",
        style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: styles.contentFontSize,
            ),
      ),
    );
  }
}
