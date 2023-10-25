import 'dart:convert';

import 'package:heart/Static/StaticVariables.dart';
import 'package:http/http.dart' as http;

class AdminUsernameCheck {
  static Future<String> adminUsernameCheck(String id) async {
    try {
      var response = await http.get(Uri.parse(
          "${StaticVariables.ADMIN_BASE_URI}/admin-username-check/$id"));
      var result = jsonDecode(response.body);
      if (result['code'] == "success") {
        if (result['data'] == "true") {
          return "true";
        }
        return "false";
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }
}
