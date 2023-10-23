import 'dart:convert';
import 'dart:math';

import 'package:heart/ConcreteClass/Admin.dart';
import 'package:heart/Screens/Register/API/AdminCodeCheck.dart';
import 'package:heart/SharedPreferences/AdminSharedPreferences.dart';
import 'package:heart/Static/StaticVariables.dart';
import 'package:http/http.dart' as http;

class RegisterAdmin {
  static Future<bool> registerAdmin(Admin admin) async {
    try {
      var response = await http.post(
        Uri.parse("${StaticVariables.ADMIN_BASE_URI}admin"),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(admin),
      );
      if (response.body == "Email Sent") {
        await AdminSharedPreferences.setAdminId(admin.id);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  static Future<String> getAdminCode() async {
    try {
      while (true) {
        String adminCode = "";
        for (int i = 0; i < 10; i++) {
          adminCode += StaticVariables.ALPHABETS[Random.secure().nextInt(25)];
        }
        if (!(await AdminCodeCheck.adminCodeCheck(adminCode))) {
          return adminCode;
        }
      }
    } catch (e) {
      return "Error";
    }
  }
}
