import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../dimension_provider/dimension_provider.dart';

class OnBoardingTextStyleProvider extends ChangeNotifier {
  // Title Font Size
  double get titleFontSize {
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
      return dimension.scale * 15.0;
    } else if (dimension.scale <= 1.5) {
      return dimension.scale * 11.0;
    } else {
      return dimension.scale * 5.0;
    }
  }

  // Get Started Font Size
  double get getStartedFontSize {
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
