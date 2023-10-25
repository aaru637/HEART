import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../ConcreteClass/Admin.dart';
import '../../../Static/StaticVariables.dart';

class AdminAPI {
  static Future<Admin> getAdminDetails(String id) async {
    try {
      var response =
          await http.get(Uri.parse("${StaticVariables.ADMIN_BASE_URI}/$id"));
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["message"] == "admin-found") {
          print(Admin.fromJson(result["data"]));
          return Admin.fromJson(result["data"]);
        }
      }
      return Admin.fromJson(result["data"]);
    } catch (e) {
      return Admin.fromJson(<String, dynamic>{});
    }
  }
}
