import 'package:heart/ConcreteClass/Admin.dart';
import 'package:heart/ReUsableWidgets/PasswordFieldWidget.dart';
import 'package:heart/ReUsableWidgets/NameFieldWidget.dart';
import 'package:heart/Screens/Register/API/RegisterAdmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../ReUsableWidgets/EmailFieldWidget.dart';
import '../../../Login/Screen/Login.dart';
import '../../../Main/MainScreen.dart';
import '../../API/AdminUsernameCheck.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({super.key});

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  final key = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController nickName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isLoading = false;
  IconData usernameIcon = Feather.thumbs_down;

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    nickName.dispose();
    email.dispose();
    username.dispose();
    password.dispose();
  }

  void thumbsUp() {
    setState(() {
      usernameIcon = Feather.thumbs_up;
    });
  }

  void thumbsDown() {
    setState(() {
      usernameIcon = Feather.thumbs_down;
    });
  }

  Future<Admin> adminData() async {
    String id = const Uuid().v4();
    return Admin(
        id: id,
        name: name.text.trim(),
        nickName: nickName.text.trim(),
        email: email.text.trim(),
        username: username.text.trim(),
        password: password.text.trim(),
        adminCode: await RegisterAdmin.getAdminCode(),
        group: <String>[],
        type: "ADMIN",
        isEmailVerified: false);
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
                      controller: name,
                      inputType: TextInputType.name,
                      labelText: "Full Name",
                      icon: Elusive.person),
                  NameFieldWidget(
                      controller: nickName,
                      inputType: TextInputType.name,
                      labelText: "Nickname",
                      icon: Icons.person),
                  EmailFieldWidget(
                    controller: email,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        width * 0.03, width * 0.01, width * 0.03, width * 0.03),
                    child: TextFormField(
                      style: TextStyle(
                          fontFamily: "Mooli", fontSize: width * 0.04),
                      controller: username,
                      onChanged: (value) async {
                        if (value.isEmpty) {
                          thumbsDown();
                          print("empty");
                        }
                        if (value.startsWith(RegExp(r'[0-9]+'))) {
                          thumbsDown();
                          print("Username doesn't start with a Number.");
                        } else if (value.length <= 8) {
                          thumbsDown();
                          print(
                              "Username Must be greater than the 8 Characters.");
                        } else if (value.length >= 16) {
                          thumbsDown();
                          print(
                              "Username Must be less than the 16 Characters.");
                        } else if (!(await AdminUsernameCheck
                            .adminUsernameCheck(value))) {
                          thumbsUp();
                          print("ok");
                        } else {
                          thumbsDown();
                          print("Username already Exists");
                        }
                      },
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: const Text("Username"),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.04),
                        suffixIcon: usernameIcon == Feather.thumbs_up
                            ? Icon(
                                usernameIcon,
                                color: Colors.green,
                              )
                            : Icon(
                                usernameIcon,
                                color: Colors.red,
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
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        if (!mounted) return;
                        if (usernameIcon == Feather.thumbs_up) {
                          Admin getValues = await adminData();
                          bool result =
                              await RegisterAdmin.registerAdmin(getValues);
                          if (result) {
                            Get.off(() => const MainScreen(),
                                transition: Transition.fadeIn,
                                duration: const Duration(seconds: 1));
                          } else {
                            print("error");
                          }
                        } else {
                          print("username already exists");
                        }
                        setState(() {
                          isLoading = false;
                        });
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
