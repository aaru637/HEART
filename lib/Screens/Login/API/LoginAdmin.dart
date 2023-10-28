import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../SharedPreferences/UserSharedPreferences.dart';
import '../../../Static/StaticVariables.dart';

class LoginAdmin {
  static Future<String> loginAdmin(String username, String password) async {
    try {
      var response = await http.get(Uri.parse(
          "${StaticVariables.ADMIN_BASE_URI}/admin-check/$username,$password"));
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["message"] == "admin-found") {
          await UserSharedPreferences.setId(result["data"], "admin");
          return result["data"];
        } else {
          return "false";
        }
      }
      return "error";
    } catch (e) {
      return "error";
    }
  }
}
