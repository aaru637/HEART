import 'package:get/get.dart';

class AgreeController extends GetxController {
  static AgreeController get instance => Get.find();

  static bool agreed = false;

  void updateStatus(bool value) => agreed = value;

  bool checkStatus() => agreed;
}
