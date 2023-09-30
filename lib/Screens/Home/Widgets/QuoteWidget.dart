import 'package:flutter/material.dart';

import '../API/QuoteAPI.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({super.key});

  @override
  State<QuoteWidget> createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  TextEditingController quote = TextEditingController();
  DateTime dateTime = DateTime.now();
  bool isLoading = false;

  Future<void> setQuote(DateTime dateTime) async {
    String result = await QuoteAPI.getQuote(dateTime);
    setState(() {
      quote.text = result;
    });
  }

  @override
  void dispose() {
    super.dispose();
    quote.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(right: width * 0.1),
      alignment: Alignment.topCenter,
      child: FutureBuilder(
        future: QuoteAPI.getQuote(dateTime),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          }
          return Text(
            "\"${snapshot.data!}\"",
            style: TextStyle(
                fontFamily: "Mooli",
                letterSpacing: 1.05,
                wordSpacing: 1.05,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.045),
          );
        },
      ),
    );
  }
}
