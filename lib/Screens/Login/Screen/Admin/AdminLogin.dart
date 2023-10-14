import 'package:heart/ReUsableWidgets/NameFieldWidget.dart';
import 'package:heart/Screens/Login/API/LoginAdmin.dart';
import 'package:heart/Screens/Register/Screen/Register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../ReUsableWidgets/PasswordFieldWidget.dart';
import '../../../Main/MainScreen.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final key = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;
  IconData passwordIcon = Feather.eye_off;

  @override
  void dispose() {
    super.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return isLoading
        ? SizedBox(
            width: width,
            height: MediaQuery.of(context).size.height,
            child:
                LottieBuilder.asset("assets/animations/Register_Loading.json"),
          )
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: [
                  NameFieldWidget(
                      controller: username,
                      inputType: TextInputType.name,
                      labelText: "Username",
                      icon: Feather.anchor),
                  PasswordFieldWidget(
                    controller: password,
                    type: "Login",
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        if (await LoginAdmin.loginAdmin(
                            username.text.trim(), password.text.trim())) {
                          setState(() {
                            isLoading = false;
                          });
                          Get.off(() => const MainScreen(),
                              transition: Transition.fadeIn,
                              duration: const Duration(seconds: 1));
                        } else {
                          setState(() {
                            isLoading = false;
                            print("error");
                          });
                        }
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Login ",
                          style: TextStyle(
                              fontFamily: "Mooli",
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.04),
                        ),
                        Icon(
                          Feather.arrow_right,
                          size: width * 0.05,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "New User ",
                        style: TextStyle(
                            fontFamily: "Mooli",
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.off(() => const Register(),
                              transition: Transition.fadeIn,
                              duration: const Duration(seconds: 1));
                        },
                        child: Text(
                          "Click Here",
                          style: TextStyle(
                              fontFamily: "Mooli",
                              color: Colors.blueAccent,
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
