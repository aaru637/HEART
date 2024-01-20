import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helper {
  static double height = MediaQuery.of(Get.context!).size.height;
  static double width = MediaQuery.of(Get.context!).size.width;

  static bool isDark() => Brightness.dark == Theme.of(Get.context!).brightness;
}
