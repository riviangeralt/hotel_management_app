import 'package:get/get.dart';
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

  void onSubmit() {}
}
