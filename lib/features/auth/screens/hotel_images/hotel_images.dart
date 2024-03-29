import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/common/widgets/grid_layout.dart';
import 'package:hotel_booking_app/common/widgets/image_picker.dart';
import 'package:hotel_booking_app/features/auth/controllers/hotel_images/hotel_images_controller.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class HotelImagesScreen extends StatelessWidget {
  const HotelImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HotelImagesController());
    return Column(
      children: [
        Text(
          'Please upload your hotel profile pictures, so that customers can see you better!',
          style: AppTextStyles.applyTextStyles(
            styles: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        GridLayout(
          itemCount: 4,
          xAxisCount: 2,
          itemBuilder: (context, index) => Obx(
            () => CustomImagePicker(
              onImagePick: (image) => controller.onImagePick(
                index: index,
                image: image,
              ),
              image: controller.imagesList.length > index &&
                      controller.imagesList[index] != null
                  ? controller.imagesList[index]
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
