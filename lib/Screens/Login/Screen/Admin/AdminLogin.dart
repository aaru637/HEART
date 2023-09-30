import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

import '../../../../ReUsableWidgets/PasswordField.dart';
import '../../../../ReUsableWidgets/TextFormFieldWidget.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.03, width * 0.01, width * 0.03, width * 0.03),
              child: TextFormField(
                style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
                controller: username,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  label: const Text("Username"),
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: width * 0.04),
                  suffixIcon: const Icon(
                    Feather.anchor,
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
            PasswordField(
              controller: password,
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {}
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
                  onPressed: () {},
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
