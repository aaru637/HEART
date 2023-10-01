import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class PasswordFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String type;
  const PasswordFieldWidget({
    super.key,
    required this.controller,
    required this.type,
  });

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isObscure = true;
  IconData passwordIcon = Feather.eye_off;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          width * 0.03, width * 0.01, width * 0.03, width * 0.03),
      child: TextFormField(
        style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObscure,
        maxLength: 16,
        decoration: InputDecoration(
          label: const Text("Password"),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
          suffixIcon: IconButton(
            icon: Icon(
              passwordIcon,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
                passwordIcon = (passwordIcon == Feather.eye_off)
                    ? Feather.eye
                    : Feather.eye_off;
              });
            },
            color: Colors.green,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Your Password";
          } else {
            if (widget.type == "Register") {
              if (value.length < 8) {
                return "Password Length must be greater than 8 Characters";
              } else if (!value.contains(RegExp("[A-Z]"))) {
                return "Password must contain atleast 1 Uppercase Character.";
              } else if (!value.contains(RegExp("[a-z]"))) {
                return "Password must contain atleast 1 Lowercase Character.";
              } else if (!value.contains(RegExp("[0-9]"))) {
                return "Password must contain atleast 1 Number.";
              } else if (!value.contains(RegExp("[\\W]"))) {
                return "Password must contain atleast 1 Special Character.";
              }
            }
            return null;
          }
        },
      ),
    );
  }
}
