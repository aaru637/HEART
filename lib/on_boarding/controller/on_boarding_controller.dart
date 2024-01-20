import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  int currentIndex = 0;

  bool updatePageIndicator(index) {
    currentIndex = index;
    if (currentIndex == 2) {
      return true;
    } else {
      return false;
    }
  }

  void dotNavigationClick(index) {
    currentIndex = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentIndex == 2) {
    } else {
      int page = currentIndex + 1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage() {
    currentIndex = 2;
    pageController.jumpToPage(2);
  }
}
