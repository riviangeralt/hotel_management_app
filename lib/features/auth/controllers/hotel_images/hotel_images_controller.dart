import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/screens/login/login.dart';
import 'package:image_picker/image_picker.dart';

class HotelImagesController extends GetxController {
  static HotelImagesController get instance => Get.find();

  RxList<XFile?> imagesList = <XFile?>[].obs;
  RxBool isButtonDisabled = true.obs;

  void onImagePick({XFile? image, required int index}) {
    if (index < imagesList.length) {
      imagesList[index] = image;
    } else {
      imagesList.add(image);
    }
    isButtonDisabled.value = false;
  }

  void onSubmit() {
    if (isButtonDisabled.value == false) {
      Get.snackbar(
        "Registration Completed Successfully",
        "Please Follow the steps in email.",
        colorText: Colors.white,
        backgroundColor: Colors.green,
        icon: const Icon(Icons.add_alert),
      );
      Get.offAll(() => const LoginScreen());
    }
  }
}
