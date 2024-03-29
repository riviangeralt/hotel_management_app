import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  final stepperController = Get.put(RegistrationNavigationController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final otpCodeController = TextEditingController();

  RxBool isButtonDisabled = true.obs;

  @override
  void onInit() {
    super.onInit();
    otpCodeController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    Get.delete<OtpController>();
    super.dispose();
  }

  void updateButtonState() {
    isButtonDisabled.value =
        otpCodeController.text.isEmpty || otpCodeController.text.trim().isEmpty;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        log(formKey.currentState!.validate().toString());
        stepperController.updateSteps(2);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
