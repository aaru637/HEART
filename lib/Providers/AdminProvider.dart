import 'package:flutter/material.dart';
import 'package:heart/ConcreteClass/Admin.dart';
import 'package:heart/Screens/Home/API/AdminAPI.dart';
import 'package:heart/SharedPreferences/AdminSharedPreferences.dart';

class AdminProvider extends ChangeNotifier {
  String id_ = "";
  Admin admin_ = Admin.fromJson(<String, dynamic>{});
  bool isLoading = false;

  bool getIsLoading() {
    return isLoading;
  }

  String getId() {
    return id_;
  }

  Admin getAdmin() {
    return admin_;
  }

  void setIsLoading() {
    isLoading = true;
    notifyListeners();
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
