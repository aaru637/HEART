import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Static/StaticVariables.dart';

class AdminCodeCheck {
  static Future<String> adminCodeCheck(String adminCode) async {
    try {
      var response = await http.get(Uri.parse(
          "${StaticVariables.ADMIN_BASE_URI}admin-code-check/$adminCode"));
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["data"] == "true") {
          return "true";
        }
        return "false";
      }
      return "error";
    } catch (e) {
      return "error";
    }
  }
}
