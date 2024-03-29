import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';

class CreatePinController extends GetxController {
  static CreatePinController get instance => Get.find();
  final stepperController = Get.put(RegistrationNavigationController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();

  RxBool isButtonDisabled = true.obs;
  RxBool showPin = false.obs;
  RxBool showConfirmPin = false.obs;

  @override
  void onInit() {
    super.onInit();
    pinController.addListener(updateButtonState);
    confirmPinController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    Get.delete<CreatePinController>();
    super.dispose();
  }

  void updateButtonState() {
    isButtonDisabled.value = pinController.text.isEmpty ||
        pinController.text.trim().isEmpty &&
            confirmPinController.text.isEmpty ||
        confirmPinController.text.trim().isEmpty;
  }

  void togglePin() {
    showPin.value = !showPin.value;
  }

  void toggleConfirmPin() {
    showConfirmPin.value = !showConfirmPin.value;
  }

  String? checkPinEqual(String? pin) {
    if (pin == null || pin.isEmpty) {
      return "Pin is required";
    }

    if (pin.length < 4 || pin.length > 4) {
      return 'Pin must of 4 character';
    }

    if (pinController.text != pin) {
      return 'Confirm pin should be same as the pin';
    }

    return null;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        stepperController.updateSteps(3);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
