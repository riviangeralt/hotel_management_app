import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/dashboard/screens/view/dashboard.dart';
import 'package:hotel_booking_app/navigation/features_navigation.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final pinController = TextEditingController();

  RxBool isButtonDisabled = true.obs;
  RxBool showPin = false.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(_updateButtonState);
    pinController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    isButtonDisabled.value = phoneController.text.isEmpty ||
        phoneController.text.trim().isEmpty && pinController.text.isEmpty ||
        pinController.text.trim().isEmpty;
  }

  void togglePin() {
    showPin.value = !showPin.value;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        Get.offAll(() => const FeaturesNavigation());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
