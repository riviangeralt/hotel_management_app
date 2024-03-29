import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final pageController = PageController(viewportFraction: 0.8);
  RxInt currentSlide = 0.obs;

  void onUpdateSlide(int value) {
    currentSlide.value = value;
    pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }
}
