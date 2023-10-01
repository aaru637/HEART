import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';

class EmailFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmailFieldWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          width * 0.03, width * 0.01, width * 0.03, width * 0.03),
      child: TextFormField(
        style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          label: const Text("Email"),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
          suffixIcon: const Icon(
            Elusive.mail,
            color: Colors.green,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Your Email";
          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
            return "Enter a Valid Email";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
