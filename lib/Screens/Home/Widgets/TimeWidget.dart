import 'dart:async';

import 'package:flutter/material.dart';

class TimeWidget extends StatefulWidget {
  const TimeWidget({super.key});

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  String hour = "", minute = "", second = "";

  setTime() async {
    DateTime dateTime = DateTime.now();
    if (!mounted) return;
    setState(() {
      hour = convert(dateTime.hour);
      minute = convert(dateTime.minute);
      second = convert(dateTime.second);
    });
  }

  convert(int data) {
    if (data.toString().length == 1) {
      return "0$data";
    }
    return data.toString();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setTime();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        "$hour - $minute - $second",
        style: TextStyle(
            fontFamily: "Mooli",
            letterSpacing: 1.05,
            wordSpacing: 1.05,
            fontWeight: FontWeight.bold,
            fontSize: width * 0.09),
      ),
    );
  }
}
