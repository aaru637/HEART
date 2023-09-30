import 'package:flutter/material.dart';
import '../Widgets/LoginLottieWidget.dart';
import '../Widgets/LoginContent.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(12, 0, 49, 1),
              Color.fromRGBO(87, 159, 222, 1)
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginLottieWidget(),
              Container(
                margin: EdgeInsets.only(bottom: width * 0.08),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.06,
                      fontFamily: 'Mooli',
                      fontWeight: FontWeight.bold),
                ),
              ),
              const LoginContent(),
            ],
          ),
        ),
      ),
    );
  }
}
