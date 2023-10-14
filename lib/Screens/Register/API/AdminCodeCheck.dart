import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../Static/StaticVariables.dart';

class AdminCodeCheck {
  static Future<bool> adminCodeCheck(String adminCode) async {
    try {
      var response = await http.get(
          Uri.parse("${StaticVariables.BASE_URI}/admin-code-check/$adminCode"));
      return jsonDecode(response.body);
    } catch (e) {
      return false;
    }
  }
}
