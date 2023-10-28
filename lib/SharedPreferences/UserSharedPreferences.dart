import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences sharedPreferences;
  static Future<void> setId(String id, String type) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("id", [id, type]);
  }

  static Future<List<String>> getId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("id")) {
      return sharedPreferences.getStringList("id")!.toList();
    }
    return ["null", "null"];
  }
}
