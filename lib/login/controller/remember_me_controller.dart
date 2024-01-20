import 'package:get/get.dart';

class RememberMeController extends GetxController {
  static RememberMeController get instance => Get.find();

  bool remembered = false;

  void updateStatus(bool value) => remembered = value;

  bool checkStatus() => remembered;
}
