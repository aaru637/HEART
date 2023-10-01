import 'package:flutter/material.dart';

class NameFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String labelText;
  final IconData icon;
  const NameFieldWidget(
      {super.key,
      required this.controller,
      required this.inputType,
      required this.labelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.fromLTRB(
          width * 0.03, width * 0.01, width * 0.03, width * 0.03),
      child: TextFormField(
        style: TextStyle(fontFamily: "Mooli", fontSize: width * 0.04),
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          label: Text(labelText),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.04),
          suffixIcon: Icon(
            icon,
            color: Colors.green,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter Your $labelText";
          } else {
            if (labelText == "Full Name") {
              if (RegExp(r'[^a-zA-Z ]+').hasMatch(value)) {
                return "Enter Valid Name";
              }
            }
            return null;
          }
        },
      ),
    );
  }
}
