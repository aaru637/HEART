import 'package:demo/ReUsableWidgets/PasswordField.dart';
import 'package:demo/ReUsableWidgets/TextFormFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({super.key});

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  final key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController adminCode = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;
  IconData passwordIcon = Feather.eye_off;
  IconData usernameIcon = Feather.thumbs_down;

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    username.dispose();
    password.dispose();
    adminCode.dispose();
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
            TextFormFieldWidget(
                controller: name,
                inputType: TextInputType.name,
                labelText: "Full Name",
                icon: Elusive.person),
            TextFormFieldWidget(
                controller: email,
                inputType: TextInputType.emailAddress,
                labelText: "Email",
                icon: Elusive.mail),
            TextFormFieldWidget(
                controller: adminCode,
                inputType: TextInputType.text,
                labelText: "Admin Code",
                icon: Elusive.clipboard),
            Container(
              margin: EdgeInsets.fromLTRB(
                  width * 0.03, width * 0.01, width * 0.03, width * 0.03),
              child: TextFormField(
                style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
                controller: username,
                onChanged: (value) {
                  if (value.length <= 8) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an Account ",
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
