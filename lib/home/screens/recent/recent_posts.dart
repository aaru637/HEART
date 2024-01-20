import 'package:flutter/material.dart';
import 'package:heart/home/widgets/recent/image_post_card.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:heart/providers/text_style_provider/home_text_style_provider/home_text_style_provider.dart';
import 'package:provider/provider.dart';

class RecentPosts extends StatefulWidget {
  const RecentPosts({super.key});

  @override
  State<RecentPosts> createState() => _RecentPostsState();
}

class _RecentPostsState extends State<RecentPosts> {
  @override
  Widget build(BuildContext context) {
    final dimension = Provider.of<DimensionProvider>(context, listen: true);
    final styles = Provider.of<HomeTextStyleProvider>(context, listen: true);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return ImagePostCard(
          dimension: dimension,
          styles: styles,
        );
      },
    );
  }
}
