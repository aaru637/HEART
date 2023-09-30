import 'package:demo/Screens/Home/Widgets/DayWidget.dart';
import 'package:demo/Screens/Home/Widgets/HeadWidget.dart';
import 'package:demo/Screens/Home/Widgets/LottieWidget.dart';
import 'package:demo/Screens/Home/Widgets/QuoteWidget.dart';
import 'package:demo/Screens/Home/Widgets/TimeWidget.dart';
import 'package:flutter/material.dart';
import '../Widgets/DateWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(255, 251, 125, 100),
                  Color.fromRGBO(133, 255, 189, 100),
                  Color.fromRGBO(133, 255, 189, 100),
                  Color.fromRGBO(255, 251, 125, 100),
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: width * 0.08),
            child: Column(
              children: [
                const HeadWidget(),
                SizedBox(
                  height: height * 0.07,
                ),
                Column(
                  children: [
                    const DayWidget(),
                    SizedBox(
                      height: height * 0.07,
                    ),
                    const DateWidget(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const TimeWidget(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    const LottieWidget(),
                    const QuoteWidget(),
                    SizedBox(
                      height: height * 0.04,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
