import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../ConcreteClass/Admin.dart';
import '../../../Static/StaticVariables.dart';

class AdminAPI {
  static Future<Admin?> getAdminDetails(String id) async {
    Admin? admin;
    try {
      var response =
          await http.get(Uri.parse("${StaticVariables.ADMIN_BASE_URI}/$id"));
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["message"] == "admin-found") {
          admin = Admin.fromJson(result["data"]);
          return admin;
        }
        return admin;
      }
      return admin;
    } catch (e) {
      e.printError();
      return admin;
    }
  }

  static Future<String> emailResent(String id) async {
    try {
      var response = await http
          .get(Uri.parse("${StaticVariables.ADMIN_BASE_URI}/resent-email/$id"));
      var result = jsonDecode(response.body);
      if (result["code"] == "success") {
        if (result["message"] == "email-sent") {
          return "email-sent";
        }
        return "error";
      } else {
        return "error";
      }
    } catch (e) {
      e.printError();
      return "error";
    }
  }
}
