import 'package:flutter/material.dart';

class New_Post extends StatefulWidget {
  const New_Post({super.key});

  @override
  State<New_Post> createState() => _New_PostState();
}

class _New_PostState extends State<New_Post> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("New_Post"),),
      ],
    );
  }
}
