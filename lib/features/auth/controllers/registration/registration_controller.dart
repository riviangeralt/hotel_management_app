import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';

class RegistrationController extends GetxController {
  static RegistrationController get instance => Get.find();
  final stepperController = Get.put(RegistrationNavigationController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final hotelNameController = TextEditingController();
  final emailController = TextEditingController();

  RxBool isButtonDisabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(updateButtonState);
    hotelNameController.addListener(updateButtonState);
    emailController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    Get.delete<RegistrationController>();
    super.dispose();
  }

  void updateButtonState() {
    isButtonDisabled.value = phoneController.text.isEmpty ||
        phoneController.text.trim().isEmpty &&
            hotelNameController.text.isEmpty ||
        hotelNameController.text.trim().isEmpty &&
            emailController.text.isEmpty ||
        emailController.text.trim().isEmpty;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        log(formKey.currentState!.validate().toString());
        stepperController.updateSteps(1);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
