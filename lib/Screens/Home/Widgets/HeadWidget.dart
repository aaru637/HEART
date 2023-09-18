import 'package:flutter/material.dart';

class HeadWidget extends StatefulWidget {
  const HeadWidget({super.key});

  @override
  State<HeadWidget> createState() => _HeadWidgetState();
}

class _HeadWidgetState extends State<HeadWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Dgon",
          style: TextStyle(
              fontSize: width * 0.1,
              fontFamily: "Lemon",
              fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.only(right: width * 0.08),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/DK.jpg"),
            minRadius: 10,
            maxRadius: 25,
          ),
        ),
      ],
    );
  }
}
