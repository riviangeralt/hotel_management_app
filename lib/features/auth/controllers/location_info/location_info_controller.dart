import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/navigation/registration_navigation.dart';
import 'package:hotel_booking_app/utils/static/cities_list.dart';

class LocationInfoController extends GetxController {
  static LocationInfoController get instance => Get.find();
  final stepperController = Get.put(RegistrationNavigationController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  RxBool isButtonDisabled = true.obs;
  RxBool isCityFieldDisabled = true.obs;
  RxList<Map<String, dynamic>> stateWiseCities = citiesList.obs;

  void updateButtonState() {
    isButtonDisabled.value = addressController.text.isEmpty ||
        addressController.text.trim().isEmpty && stateController.text.isEmpty ||
        stateController.text.trim().isEmpty && cityController.text.isEmpty ||
        cityController.text.trim().isEmpty;
  }

  @override
  void onInit() {
    super.onInit();
    stateController.addListener(updateButtonState);
    addressController.addListener(updateButtonState);
    cityController.addListener(updateButtonState);
  }

  @override
  void dispose() {
    Get.delete<LocationInfoController>();
    super.dispose();
  }

  void onSelectState(String selectedState) {
    stateController.text = selectedState;
    updateButtonState();
    isCityFieldDisabled.value = false;
    citiesList.sort(
      (a, b) => a['name'].toLowerCase().compareTo(
            b['name'].toLowerCase(),
          ),
    );
    stateWiseCities.value = citiesList
        .where(
          (city) => city['state'] == selectedState,
        )
        .toList();
    if (cityController.text.isNotEmpty) {
      cityController.text = '';
    }
  }

  void onSelectCity(String selectedState) {
    cityController.text = selectedState;
    updateButtonState();
  }

  String? validateState(String? state) {
    if (state == null || state.isEmpty) {
      return "State is required";
    }

    return null;
  }

  void onSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        stepperController.updateSteps(4);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
