import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DimensionProvider extends ChangeNotifier {
  double _scale = 0.0;
  double _width = 0.0;
  double _height = 0.0;

  double get scale => _scale;
  double get width => _width;
  double get height => _height;

  DimensionProvider() {
    _scale = MediaQuery.of(Get.context!).textScaler.scale(1.0);
    _width = MediaQuery.of(Get.context!).size.width;
    _height = MediaQuery.of(Get.context!).size.height;
    notifyListeners();
  }
}