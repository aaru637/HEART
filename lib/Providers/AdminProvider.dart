import 'package:flutter/material.dart';
import 'package:heart/Screens/Home/API/AdminAPI.dart';
import 'package:heart/SharedPreferences/AdminSharedPreferences.dart';

class AdminProvider extends ChangeNotifier {
  String id_ = "";
  Map<String, dynamic> admin_ = {};

  String getId() {
    return id_;
  }

  Map<String, dynamic> getAdmin() {
    return admin_;
  }

  void setId() async {
    id_ = await AdminSharedPreferences.getAdminId();
    notifyListeners();
  }

  void setAdmin() async {
    admin_ = await AdminAPI.getAdminDetails(id_);
    notifyListeners();
  }
}
