import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({
    super.key,
    required this.controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
            return null;
          }
        },
      ),
    );
  }
}
