import 'package:demo/ReUsableWidgets/PasswordFieldWidget.dart';
import 'package:demo/ReUsableWidgets/NameFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../../../ReUsableWidgets/EmailFieldWidget.dart';
import '../../../Login/Screen/Login.dart';
import '../../../Main/MainScreen.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  final key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  IconData usernameIcon = Feather.thumbs_down;

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    username.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            NameFieldWidget(
                controller: name,
                inputType: TextInputType.name,
                labelText: "Full Name",
                icon: Elusive.person),
            EmailFieldWidget(
              controller: email,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.03, width * 0.01, width * 0.03, width * 0.03),
              child: TextFormField(
                style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
                controller: username,
                onChanged: (value) {
                  if (value.startsWith(RegExp(r'[0-9]+'))) {
                    setState(() {
                      usernameIcon = Feather.thumbs_down;
                    });
                    const SnackBar(
                        content: Text("Username doesn't start with a Number."));
                  } else if (value.length <= 8) {
                    setState(() {
                      usernameIcon = Feather.thumbs_down;
                    });
                    const SnackBar(
                        content: Text(
                            "Username Must be greater than the 8 Characters."));
                  } else if (value.length >= 16) {
                    setState(() {
                      usernameIcon = Feather.thumbs_down;
                    });
                    const SnackBar(
                        content: Text(
                            "Username Must be less than the 16 Characters."));
                  } else {
                    setState(() {
                      usernameIcon = Feather.thumbs_up;
                    });
                  }
                },
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text("Username"),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.04),
                  suffixIcon: Icon(
                    usernameIcon,
                    color: Colors.green,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Enter Your Username";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            PasswordFieldWidget(
              controller: password,
              type: "Register",
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  Get.off(() => const MainScreen(),
                      transition: Transition.fadeIn,
                      duration: const Duration(seconds: 1));
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Register ",
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
                  "Already have an Account ",
                  style: TextStyle(
                      fontFamily: "Mooli",
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Get.off(() => const Login(),
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
