import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';

class UserStory extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const UserStory({super.key, required this.dimension, required this.styles});

  @override
  State<UserStory> createState() => _UserStoryState();
}

class _UserStoryState extends State<UserStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: widget.dimension.width * 0.02,
      ),
      child: SizedBox(
        height: widget.dimension.height * 0.15,
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(
                      widget.dimension.width * 0.01,
                    ),
                    width: widget.dimension.width * 0.4,
                    height: widget.dimension.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey),
                    child: const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                  ),
                  Container(
                    width: widget.dimension.width * 0.6,
                    height: widget.dimension.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.greenAccent,
                        width: 2,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2,
                    bottom: 1,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: widget.dimension.width * 0.06,
                        height: widget.dimension.width * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Theme.of(context).iconTheme.color! ==
                                    Colors.white
                                ? Colors.black
                                : Colors.white,
                            width: 3,
                          ),
                        ),
                        child: const Iconify(
                          Carbon.add,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: widget.dimension.height * 0.02,
            ),
            Text(
              "Add Story",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: widget.styles.contentFontSize,
                    color: Theme.of(context).cardColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
