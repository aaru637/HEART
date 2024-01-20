import 'package:flutter/material.dart';

class FollowingPosts extends StatefulWidget {
  const FollowingPosts({super.key});

  @override
  State<FollowingPosts> createState() => _FollowingPostsState();
}

class _FollowingPostsState extends State<FollowingPosts> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Center(
          child: Text("Following Posts"),
        ),
      ),
    );
  }
}
