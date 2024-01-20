import 'package:flutter/material.dart';
import 'package:heart/home/widgets/story/others_story.dart';
import 'package:heart/home/widgets/story/user_story.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';

class Story extends StatefulWidget {
  final DimensionProvider dimension;
  final HomeTextStyleProvider styles;
  final int index;
  const Story(
      {super.key,
      required this.index,
      required this.dimension,
      required this.styles});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return widget.index == 0
        ? UserStory(
            dimension: widget.dimension,
            styles: widget.styles,
          )
        : OthersStory(
            dimension: widget.dimension,
            styles: widget.styles,
          );
  }
}
