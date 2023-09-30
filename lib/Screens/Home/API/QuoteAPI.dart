import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class QuoteAPI {
  static Future<bool> checkData(String date) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("date")) {
      if (sharedPreferences.getString("date") != date) {
        sharedPreferences.setString("date", date);
        return true;
      } else {
        return false;
      }
    } else {
      sharedPreferences.setString("date", date);
      return true;
    }
  }

  static Future<String> getQuote(DateTime date) async {
    String time = "${date.day}-${date.month}-${date.year}";
    bool status = await checkData(time);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!status) {
      if (sharedPreferences.getString("quote").toString() == "null") {
        sharedPreferences.remove("quote");
        return apiCall(sharedPreferences);
      }
      return sharedPreferences.getString("quote").toString();
    } else {
      return apiCall(sharedPreferences);
    }
  }

  static Future<String> apiCall(SharedPreferences sharedPreferences) async {
    const url = "https://api.api-ninjas.com/v1/quotes?category=friendship";
    var response = await http.get(Uri.parse(url),
        headers: {"X-Api-Key": "ddn9goC4NwhW/Vyfl+mPsg==VN2xjddQd4dDEFNa"});
    var result = jsonDecode(response.body);
    sharedPreferences.setString("quote", result[0]['quote'].toString());
    return result[0]['quote'].toString();
  }
}
