import 'dart:async';
import 'package:flutter/material.dart';

class DayWidget extends StatefulWidget {
  final String nickName;
  const DayWidget({super.key, required this.nickName});

  @override
  State<DayWidget> createState() => _DayWidgetState();
}

class _DayWidgetState extends State<DayWidget> {
  DateTime dateTime = DateTime.now();
  Future<String> getPeriod() async {
    int date = dateTime.hour;
    if (date >= 4 && date <= 11) {
      return "Morning";
    } else if (date >= 12 && date <= 16) {
      return "Afternoon";
    } else if (date >= 17 && date <= 19) {
      return "Evening";
    } else {
      return "Night";
    }
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      getPeriod();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: getPeriod(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        return Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Good ${snapshot.data!} ${widget.nickName} 🙏,",
            style: TextStyle(
                fontSize: width * 0.05,
                fontFamily: "Mooli",
                fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}
