import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../SharedPreferences/AdminSharedPreferences.dart';
import '../../../Static/StaticVariables.dart';

class LoginAdmin {
  static Future<bool> loginAdmin(String username, String password) async {
    try {
      var response = await http.get(Uri.parse(
          "${StaticVariables.BASE_URI}admin-check/$username,$password"));
      print(response.body);
      if (response.body != "null") {
        await AdminSharedPreferences.setAdminId(response.body);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
