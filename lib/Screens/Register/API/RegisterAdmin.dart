import 'dart:convert';
import 'dart:math';

import 'package:heart/ConcreteClass/Admin.dart';
import 'package:heart/Screens/Register/API/AdminCodeCheck.dart';
import 'package:heart/SharedPreferences/UserSharedPreferences.dart';
import 'package:heart/Static/StaticVariables.dart';
import 'package:http/http.dart' as http;

class RegisterAdmin {
  static Future<String> registerAdmin(Admin admin) async {
    try {
      var response = await http.post(
        Uri.parse(StaticVariables.ADMIN_BASE_URI),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(admin),
      );
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["message"] == "email-sent") {
          await UserSharedPreferences.setId(admin.id!, "admin");
          return result["message"];
        } else {
          return result["message"];
        }
      }
      return "inerror";
    } catch (e) {
      return "error";
    }
  }

  static Future<String> getAdminCode() async {
    try {
      while (true) {
        String adminCode = "";
        for (int i = 0; i < 10; i++) {
          adminCode += StaticVariables.ALPHABETS[Random.secure().nextInt(25)];
        }
        if (!(await AdminCodeCheck.adminCodeCheck(adminCode) == "true")) {
          return adminCode;
        }
      }
    } catch (e) {
      return "error";
    }
  }
}
