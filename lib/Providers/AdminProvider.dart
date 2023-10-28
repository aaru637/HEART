import 'dart:async';

import 'package:heart/ConcreteClass/Admin.dart';
import 'package:heart/Screens/Home/API/AdminAPI.dart';
import 'package:heart/SharedPreferences/UserSharedPreferences.dart';

class AdminProvider {
  String? id_;
  String? type_;
  Admin? admin_;

  Stream<Admin?> get getAdmin {
    return Stream.fromFuture(setAdmin());
  }

  String get id {
    return id_!;
  }

  String get type {
    return type_!;
  }

  Future<String?> setId() async {
    List<String> result = [];
    result = await UserSharedPreferences.getId();
    if (result[0] != "null") {
      id_ = result[0];
      type_ = result[1];
      return id_!;
    } else {
      return "null";
    }
  }

  Future<Admin?> setAdmin() async {
    admin_ = await AdminAPI.getAdminDetails(id_!);
    return admin_!;
  }
}
