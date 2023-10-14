import 'package:shared_preferences/shared_preferences.dart';

class AdminSharedPreferences {
  static late SharedPreferences sharedPreferences;
  static Future<void> setAdminId(String id) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("id", id);
    print("Id Stored");
  }

  static Future<String> getAdminId() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("id")) {
      return sharedPreferences.getString("id").toString();
    }
    return "null";
  }
}
