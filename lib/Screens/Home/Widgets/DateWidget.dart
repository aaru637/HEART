import 'package:flutter/material.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  List months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  getDay() async {
    DateTime dateTime = DateTime.now();
    return "${dateTime.day}-${months[dateTime.month - 1]}-${dateTime.year}, ${days[dateTime.weekday - 1]}";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        alignment: Alignment.topLeft,
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            return Text(
              "${snapshot.data!}",
              style: TextStyle(
                  fontFamily: "Mooli",
                  letterSpacing: 1.05,
                  wordSpacing: 1.05,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.045),
            );
          },
          future: getDay(),
        ));
  }
}
