import 'package:flutter/material.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class OthersStory extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  const OthersStory({super.key, required this.dimension, required this.styles});

  @override
  State<OthersStory> createState() => _OthersStoryState();
}

class _OthersStoryState extends State<OthersStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: widget.dimension.width * 0.01,
      ),
      child: SizedBox(
        height: widget.dimension.height * 0.15,
        width: widget.dimension.width * 0.2,
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
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
                        color: Colors.blueAccent,
                        width: 2,
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
              "Emma",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: widget.styles.contentFontSize,
                    color: Theme.of(context).cardColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
