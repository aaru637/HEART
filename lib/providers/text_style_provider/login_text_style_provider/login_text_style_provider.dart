import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart/providers/dimension_provider/dimension_provider.dart';
import 'package:provider/provider.dart';

class LoginTextStyleProvider extends ChangeNotifier {
  // Welcome Back Font Size
  double get welcomeBackFontSize {
    final dimension =
        Provider.of<DimensionProvider>(Get.context!, listen: true);
    if (dimension.scale <= 1) {
      return dimension.scale * 21.0;
    } else if (dimension.scale <= 1.5) {
      return dimension.scale * 15.0;
    } else {
      return dimension.scale * 8.0;
    }
  }

  // Content Font Size
  double get contentFontSize {
    final dimension =
        Provider.of<DimensionProvider>(Get.context!, listen: true);
    if (dimension.scale <= 1) {
      return dimension.scale * 13.0;
    } else if (dimension.scale <= 1.5) {
      return dimension.scale * 9.0;
    } else {
      return dimension.scale * 4.0;
    }
  }

  // Login Font Size
  double get loginFontSize {
    final dimension =
        Provider.of<DimensionProvider>(Get.context!, listen: true);
    if (dimension.scale <= 1) {
      return dimension.scale * 15.0;
    } else if (dimension.scale <= 1.5) {
      return dimension.scale * 11.0;
    } else {
      return dimension.scale * 5.0;
    }
  }
}
