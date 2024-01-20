import 'package:flutter/material.dart';

class TrendingPosts extends StatefulWidget {
  const TrendingPosts({super.key});

  @override
  State<TrendingPosts> createState() => _TrendingPostsState();
}

class _TrendingPostsState extends State<TrendingPosts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Text("Trending Posts"),
        ),
      ),
    );
  }
}
