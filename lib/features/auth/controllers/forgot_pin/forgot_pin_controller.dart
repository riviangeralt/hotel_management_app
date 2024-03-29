import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';

class ForgotPinController extends GetxController {
  static ForgotPinController get instance => Get.find();
  final stepperController = Get.put(RegistrationNavigationController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  RxBool isButtonDisabled = true.obs;

  @override
  void onInit() {
    super.onInit();

    emailController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    Get.delete<ForgotPinController>();
    super.dispose();
  }

  void updateButtonState() {
    isButtonDisabled.value =
        emailController.text.isEmpty || emailController.text.trim().isEmpty;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        Get.snackbar(
          "Email Sent Successfully",
          "Please Follow the steps in email.",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          icon: const Icon(Icons.add_alert),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
