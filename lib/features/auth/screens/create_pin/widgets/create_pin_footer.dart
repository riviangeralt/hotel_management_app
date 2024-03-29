import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app/features/auth/controllers/create_pin/create_pin_controller.dart';
import 'package:hotel_booking_app/utils/device/device_utility.dart';
import 'package:hotel_booking_app/utils/text_styles/text_styles.dart';

class CreatePinFooter extends StatelessWidget {
  const CreatePinFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePinController());

    return Container(
      height: 150,
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: AppDeviceUtils.getScreenWidth(context),
            height: 45,
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.isButtonDisabled.isTrue
                    ? null
                    : controller.onSubmit,
                child: Text(
                  'Proceed',
                  style: AppTextStyles.applyTextStyles(
                    styles: const TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
