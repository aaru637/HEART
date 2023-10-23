import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../Static/StaticVariables.dart';

class AdminAPI {
  static Future<Map<String, dynamic>> getAdminDetails(String id) async {
    try {
      var response =
          await http.get(Uri.parse("${StaticVariables.ADMIN_BASE_URI}$id"));
      return jsonDecode(response.body);
    } catch (e) {
      throw Error();
    }
  }
}
