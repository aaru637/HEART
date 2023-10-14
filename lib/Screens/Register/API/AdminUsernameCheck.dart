import 'dart:convert';

import 'package:heart/Static/StaticVariables.dart';
import 'package:http/http.dart' as http;

class AdminUsernameCheck {
  static Future<bool> adminUsernameCheck(String id) async {
    try {
      var response = await http.get(
          Uri.parse("${StaticVariables.BASE_URI}admin-username-check/$id"));
      return jsonDecode(response.body);
    } catch (e) {
      return false;
    }
  }
}
